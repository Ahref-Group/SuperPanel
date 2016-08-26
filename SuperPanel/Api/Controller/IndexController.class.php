<?php
namespace Api\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function _initialize(){
        C(M('Config')->cache('config', 600)->getField('name,value'));
    }
    
    
    public function alipay(){
        if(spay_alipay_notify_verify(C('SPAY_CODE'))){
            $ts = $_POST['trade_status'];
            if ($ts == 'TRADE_FINISHED' || $ts == 'TRADE_SUCCESS'){
                $Alipay = M("alipay");
                //$this->ajaxReturn($_POST);
                $order = $Alipay->where(['out_trade_no' =>I('post.out_trade_no')])->find();
                
                if(empty($order['status'])){
                    M('User')->where(['uid'=>$order['uid']])->setInc('money',$order['money']);
                    $order['notify_id'] = I('post.notify_id');
                    $order['finish_time'] = I('post.notify_time');
                    $order['status'] = I('post.trade_status');
                    $Alipay->where(['out_trade_no' =>I('post.out_trade_no')])->save($order);
                }
                echo 'success';
                exit;
            }
        }else{
            echo 'fail';
        }
    }
}