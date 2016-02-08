<?php
class ControllerPaymentSpsdecidir extends Controller {
  protected function index() {
    $this->language->load('payment/spsdecidir');
    $this->data['button_confirm'] = $this->language->get('button_confirm');
    $this->data['action'] = 'https://yourpaymentgatewayurl';

    $this->load->model('checkout/order');
    $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

    if ($order_info) {
      $this->data['orderid'] = date('His') . $this->session->data['order_id'];
      $this->data['order_info'] = $order_info;
      $this->data['callbackurl'] = $this->url->link('payment/spsdecidir/callback');

      if ($order_info) {
           
            if (file_exists(DIR_TEMPLATE.$this->config->get('config_template').'/template/payment/spsdecidir.tpl')){
                $this->template = $this->config->get('config_template') . '/template/payment/spsdecidir.tpl';
            } else {
                $this->template = 'default/template/payment/spsdecidir.tpl';
            }
            $this->render();
        }
    }
  }
  
  public function callback() {
    if (isset($this->request->post['orderid'])) {
      $order_id = trim(substr(($this->request->post['orderid']), 6));
    } else {
      die('Illegal Access');
    }

    $this->load->model('checkout/order');
    $order_info = $this->model_checkout_order->getOrder($order_id);

    if ($order_info) {
      $data = array_merge($this->request->post,$this->request->get);

      //payment was made successfully
      if ($data['status'] == 'Y' || $data['status'] == 'y') {
        // update the order status accordingly
      }
    }
  }

  public function getEntidadFinanciera()
  {
    $mp_id = $_GET["mp_id"];
    $spsdecidir_model = $this->load->model("payment/spsdecidir");
    
    echo json_encode($this->model_payment_spsdecidir->getEntidadFinanciera($mp_id)->rows);
  }

  public function getMediosDePago(){
  
  $spsdecidir_model = $this->load->model("payment/spsdecidir");
  echo  json_encode($this->model_payment_spsdecidir->getMediosDePago()->rows);
  
  }


  public function getPlanes(){

  }

}