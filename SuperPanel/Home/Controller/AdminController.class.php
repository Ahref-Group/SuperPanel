<?php
namespace Home\Controller;
use Think\Controller;
class AdminController extends Controller {
    public function _initialize()
    {
        C(M('Config')->cache('config', 600)->getField('name,value'));
        
        $this->assign('site_name', C('SITE_NAME'));
        $this->userinfo = isAdmin();
        $this->assign('userinfo', $this->userinfo);
        $this->assign('ip', get_client_ip());
        $this->assign('disqus_shortname', C('DISQUS_SHORTNAME'));
        $this->assign('announcement_list', M('announcement')->field('item,introduction')->select());
    }
    
    
    public function index(){
        $User = D('User');
        $this->assign('user_amount', $User->getUserAmount());
        $this->assign('checked_user_amount', $User->getCheckedUserAmount());
        $this->assign('node_amount', M('node')->count());
        $this->assign('group_amount', M('group')->count());
        $this->display();
    }
    
    public function announcement(){
        $item=I('get.item');
        if(!empty($item))
            $single_announcement = M('announcement')->where(array('item'=>$item))->find();
        if(empty($single_announcement)){
            //结果为空
            $this->assign('is_edit', FALSE);
        }
        else
            $this->assign('is_edit', TRUE);
        //var_dump(M('announcement')->field('item,introduction,value')->select());
        //die();
        $this->assign('single_announcement', $single_announcement);
        $this->display();
    }
    
    
    public function invite(){
        //$invite_code = M('invite_code')->where(array('uid'=>$this->userinfo['uid']))->select();
        //$this->assign('invite_code__list', $invite_code);
        $public_invite_code_amount = M('invite_code')->where(['uid'=>'0'])->count();
        $this->assign('public_invite_code_amount', $public_invite_code_amount);
        $this->display();
    }
    
    public function exchangeCode(){
        $exchange_code_list = M('exchange_code')->where(['exchange_time'=>0])->select();
        // var_dump($exchange_code_list);
        // die();
        $this->assign('exchange_code_list', $exchange_code_list);
        $this->display();
    }
    
    
    public function editNode(){
        $nid = I('get.nid');
        
        $Node = M('node');
        $node_list = $Node->field('nid,node_name')->select();
        
        
        
        $this->assign('node_list', $node_list);
        if(empty($nid)){
            //没有参数就是添加节点
            $this->assign('edit', false);
            $this->display();
        }else{
            $node_info = $Node->where(['nid'=>$nid])->find();
            $this->assign('node_info', $node_info);
            $this->assign('edit', true);
            $this->display();
        }
    }
    
    public function group(){
        $group_list = M('group')->select();
        $this->assign('group_list', $group_list);
        $this->display();
    }
    
    public function groupList(){
        $node_list = M('node')->field('nid,node_name,address')->select();
        $group_list = M('group')->getField('gid,group_name,node');
        
        $gid = I('get.gid');
        if(empty($gid)){
            $gid = reset($group_list)['gid'];       //获取数组第一个元素的key
        }
        
        $contained_node = explode(',', $group_list[$gid]['node']);
        
        
        $i = 0;
        foreach($node_list as $node){
            $group_node[$i]['nid'] = $node['nid'];
            if(in_array($node['nid'], $contained_node)){
                $group_node[$i]['in'] = true;
            }else{
                $group_node[$i]['in'] = false;
            }
            $i++;
        }
        
        
        $this->assign('node_list', $node_list);
        $this->assign('group_list', $group_list);
        $this->assign('group_node', $group_node);
        $this->assign('gid', $gid);
        $this->display();
    }
    
    public function tickets(){
        //首先获取所有未关闭工单（status=0）
        $opened_tickets_list = M("ticket")->where(['status'=>['NEQ','closed']])->order('open_time desc')->select();
        //下面获取未关闭工单的回复
        
        
        //获取已关闭工单
        $closed_tickets_list = M('ticket')->where(['status'=>'closed'])->order('open_time desc')->select();
        
        $this->assign('opened_tickets_list', $opened_tickets_list);
        $this->assign('closed_tickets_list', $closed_tickets_list);
        
        $this->display();
    }
    
    public function nodeList(){
        $node_list = M('node')->select();
        
        $this->assign('node_list', $node_list);
        $this->display();
    }
    
    
    public function shopItem(){
        $iid = I('get.iid');
        if(empty($iid)){
            $edit = false;
            $iid = 0;
        }else{
            $edit = true;
            $item_info = M('shop_item')->where(['iid'=>$iid])->find();
            $this->assign('item_info', $item_info);
        }
        
        
        $items = M('shop_item')->select();
        
        $this->assign('iid', $iid);
        $this->assign('edit', $edit);
        $this->assign('items', $items);
        
        $this->display();
    }
}


