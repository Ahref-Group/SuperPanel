<?php

class CommandParser{
    
    function cleaner($commands){
        
        //对表达式进行处理
        $commands_cleaned = preg_replace('/[^a-zA-Z0-9+\-=|\n:\.]/', '', $commands);
        return $commands_cleaned;
    }
    
    function exec_command($commands, $userinfo){
        
        $User = M('user');
        
        $commands_formated = str_replace('\n', '', $commands);      //去除换行
        
        $command_list = explode('|', $commands_formated);
        
        foreach($command_list as $command){
            $operator_location = strcspn($command, '+-=');      //查找命令操作符的位置
            $operations = explode(':', substr($command, 0, $operator_location));    //取出操作对象
            $operator = substr($command, $operator_location, 1);                    //取出操作符
            $operand = substr($command, $operator_location+1);                      //操作数
            
            if(!empty($operations[0]) && !empty($operand)){
                switch($operations[0]){
                    case 'port':
                        if($User->where(['port'=>intval($operation)])->count()) //判断端口是否已被使用
                            return false;
                        $User->where(['uid'=>$userinfo['uid']])->setField('port', intval($operation));
                        break;
                        
                    case 'transfer':
                        if(empty($operations[1]))               //组为空
                            return false;
                        if(0 == M('group')->where(['gid'=>$operations[1]])->count())
                            //检查对应的组是否存在
                            return false;
                            
                        
                        if(0 == M('user_group')->where(['uid'=>$userinfo['uid'], 'group'=>$operations[1]])->count()){
                            //用户是第一次购买
                            
                            if($operator == '-')
                                return false;
                            
                            $groups = explode(',', $userinfo['plan']);
                            
                            //下面判断user表中的组信息，防止数据未同步
                            if(!in_array($operations[1], $groups)){
                                //如果用户在购买时不属于任何组，explode也会返回一个数组，其第一个元素为空字符串
                                //这种情况下，为了避免空字符串再次被打包，就需要判断一下是否为空
                                if(empty($groups[0]))
                                    $groups[0] = $operations[1];
                                else
                                    $groups[] = $operations[1];
                                $User->uid = $userinfo['uid'];
                                $User->plan = implode(',', $groups);
                                $User->save();          //更新user表中的group
                            }
                            $data['uid']=$userinfo['uid'];
                            $data['group'] = $operations[1];
                            $data['transfer_enable'] = intval($operand) * 1024 * 1024;
                            
                            M('user_group')->add($data);
                        }else{
                            $operand = intval($operand) * 1024 * 1024;      //转换单位为GB
                            if($operator == '+')
                                M('user_group')->where(['uid'=>$userinfo['uid'], 'group'=>$operations[1]])->setInc('transfer_enable',$operand);
                            elseif($operator == '-')
                                M('user_group')->where(['uid'=>$userinfo['uid'], 'group'=>$operations[1]])->setDec('transfer_enable',$operand);
                            else
                                M('user_group')->where(['uid'=>$userinfo['uid'], 'group'=>$operations[1]])->setField('transfer_enable',$operand);
                        }
                        
                        
                    case 'time':
                        if(empty($operations[1]))               //组为空
                            return false;
                        if(0 == M('group')->where(['gid'=>$operations[1]])->count())
                            //检查对应的组是否存在
                            return false;
                            
                        
                        if(0 == M('user_group')->where(['uid'=>$userinfo['uid'], 'group'=>$operations[1]])->count()){
                            //用户是第一次购买
                            
                            if($operator == '-')
                                return false;
                            
                            $groups = explode(',', $userinfo['plan']);
                            
                            //下面判断user表中的组信息，防止数据未同步
                            if(!in_array($operations[1], $groups)){
                                //如果用户在购买时不属于任何组，explode也会返回一个数组，其第一个元素为空字符串
                                //这种情况下，为了避免空字符串再次被打包，就需要判断一下是否为空
                                if(empty($groups[0]))
                                    $groups[0] = $operations[1];
                                else
                                    $groups[] = $operations[1];
                                $User->uid = $userinfo['uid'];
                                $User->plan = implode(',', $groups);
                                $User->save();          //更新user表中的group
                            }
                            $data['uid']=$userinfo['uid'];
                            $data['group'] = $operations[1];
                            $data['expiration'] = time() + intval($operand) * 86400;        //在当前的基础上增加
                            
                            M('user_group')->add($data);
                        }else{
                            $operand = intval($operand) * 86400;      //转换单位为GB
                            
                            $current_expiration = M('user_group')->where(['uid'=>$userinfo['uid'], 'group'=>$operations[1]])->getField('expiration');
                            
                            if($operator == '+'){
                                if(time()>$current_expiration){
                                    M('user_group')->where(['uid'=>$userinfo['uid'], 'group'=>$operations[1]])->setInc('transfer_enable',$operand);
                                }else{
                                    M('user_group')->where(['uid'=>$userinfo['uid'], 'group'=>$operations[1]])->setField('transfer_enable',time() + $operand);
                                }
                            }
                            elseif($operator == '-')
                                M('user_group')->where(['uid'=>$userinfo['uid'], 'group'=>$operations[1]])->setDec('transfer_enable',$operand);
                            else
                                M('user_group')->where(['uid'=>$userinfo['uid'], 'group'=>$operations[1]])->setField('transfer_enable',time() + $operand);
                        }
                    
                }
            }
        }
        return true;
    }
}



?>