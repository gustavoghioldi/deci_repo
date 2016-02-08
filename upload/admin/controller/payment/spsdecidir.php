<?php
class ControllerPaymentSpsdecidir extends Controller {
  private $error = array();

  public function index() {
    $this->language->load('payment/spsdecidir');
    $this->document->setTitle('Decidir');
    $this->load->model('setting/setting');

    if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
      $this->model_setting_setting->editSetting('spsdecidir', $this->request->post);
      $this->session->data['success'] = 'Saved.';
      $this->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
    }

    $this->data['heading_title'] = $this->language->get('heading_title');
    $this->data['entry_text_config_one'] = $this->language->get('text_config_one');
    $this->data['entry_text_config_two'] = $this->language->get('text_config_two');
    $this->data['button_save'] = $this->language->get('text_button_save');
    $this->data['button_cancel'] = $this->language->get('text_button_cancel');
    $this->data['entry_order_status'] = $this->language->get('entry_order_status');
    $this->data['text_enabled'] = $this->language->get('text_enabled');
    $this->data['text_disabled'] = $this->language->get('text_disabled');
    $this->data['entry_status'] = $this->language->get('entry_status');

    $this->data['action'] = $this->url->link('payment/spsdecidir', 'token=' . $this->session->data['token'], 'SSL');
    $this->data['action_save_entidadfinanciera'] = $this->url->link('payment/spsdecidir/saveEntidadfinanciera&token=' . $this->session->data['token'], 'SSL');
    $this->data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');

    //valores del tag_general
    //estado
    if (isset($this->request->post['spsdecidir_status'])) {
      $this->data['spsdecidir_status'] = $this->request->post['spsdecidir_status'];
    } else {
      $this->data['spsdecidir_status'] = $this->config->get('spsdecidir_status');
    }

    //Segmento del Comercio
    if (isset($this->request->post['spsdecidir_segmento'])) {
      $this->data['spsdecidir_segmento'] = $this->request->post['spsdecidir_segmento'];
    } else {
      $this->data['spsdecidir_segmento'] = $this->config->get('spsdecidir_segmento');
    }

    //modo test o produccion
    if (isset($this->request->post['spsdecidir_mode'])) {
      $this->data['spsdecidir_mode'] = $this->request->post['spsdecidir_mode'];
    } else {
      $this->data['spsdecidir_mode'] = $this->config->get('spsdecidir_mode');
    }

    //Cybersource (on - off)
    if (isset($this->request->post['spsdecidir_cs'])) {
      $this->data['spsdecidir_cs'] = $this->request->post['spsdecidir_cs'];
    } else {
      $this->data['spsdecidir_cs'] = $this->config->get('spsdecidir_cs');
    }

    if (isset($this->request->post['spsdecidir_order_status_iniciada'])) {
      $this->data['spsdecidir_order_status_iniciada'] = $this->request->post['spsdecidir_order_status_iniciada'];
    } else {
      $this->data['spsdecidir_order_status_iniciada'] = $this->config->get('spsdecidir_order_status_iniciada');
    }

    if (isset($this->request->post['spsdecidir_order_status_aprobada'])) {
      $this->data['spsdecidir_order_status_aprobada'] = $this->request->post['spsdecidir_order_status_aprobada'];
    } else {
      $this->data['spsdecidir_order_status_aprobada'] = $this->config->get('spsdecidir_order_status_aprobada');
    }

    if (isset($this->request->post['spsdecidir_order_status_rechazada'])) {
      $this->data['spsdecidir_order_status_rechazada'] = $this->request->post['spsdecidir_order_status_rechazada'];
    } else {
      $this->data['spsdecidir_order_status_rechazada'] = $this->config->get('spsdecidir_order_status_rechazada');
    }

    if (isset($this->request->post['spsdecidir_order_status_offline'])) {
      $this->data['spsdecidir_order_status_offline'] = $this->request->post['spsdecidir_order_status_offline'];
    } else {
      $this->data['spsdecidir_order_status_offline'] = $this->config->get('spsdecidir_order_status_offline');
    }

    if (isset($this->request->post['spsdecidir_order_status_devuelta'])) {
      $this->data['spsdecidir_order_status_devuelta']=  $this->request->post['spsdecidir_order_status_devuelta'];
    } else {
      $this->data['spsdecidir_order_status_devuelta'] = $this->config->get('spsdecidir_order_status_devuelta');
    }



    $this->load->model('localisation/order_status');
    $this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
    
    $this->template = 'payment/spsdecidir.tpl';

    $this->children = array(
      'common/header',
      'common/footer'
      );

    $this->response->setOutput($this->render());
  }

  public function getAllMediosdepago(){
    $this->load->model("spsdecidir/mediodepago");
    echo  json_encode($this->model_spsdecidir_mediodepago->get()->rows);    
  }

  public function saveMediodepago()
  {
   $this->load->model("spsdecidir/mediodepago");
   $rta = $this->model_spsdecidir_mediodepago->set($_POST);
   echo $rta;
  }

  public function saveEntidadfinanciera(){
    $this->load->model("spsdecidir/entidadfinanciera");
    $rta = $this->model_spsdecidir_entidadfinanciera->set($_POST);
    echo $rta;
  }

  public function savePromocion(){
    $this->load->model("spsdecidir/promocion");
    $rta = $this->model_spsdecidir_promocion->set($_POST);
    echo $rta;
  }

  public function getAllEntidadesfinancieras(){
    $this->load->model("spsdecidir/entidadfinanciera");
    echo json_encode($this->model_spsdecidir_entidadfinanciera->get()->rows);
  } 

  public function getAllPromociones(){
    $this->load->model("spsdecidir/promocion");
    echo json_encode($this->model_spsdecidir_promocion->get()->rows);
  } 



}