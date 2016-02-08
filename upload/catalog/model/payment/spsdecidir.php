<?php
class ModelPaymentSpsdecidir extends Model {
  public function getMethod($address, $total) {
    $this->load->language('payment/spsdecidir');
  
    $method_data = array(
      'code'     => 'spsdecidir',
      'title'    => $this->language->get('text_title'),
      'sort_order' => $this->config->get('spsdecidir_sort_order')
    );
  
    return $method_data;
  }

  public function getMediosDePago($id=null){
    $rta = array();
  
    if (is_null($id))
    {
      $rta = $this->db->query("SELECT DISTINCT oc_spsdecidir_promociones.mp_id, oc_spsdecidir_mediosdepago.name  FROM oc_spsdecidir_promociones
        LEFT JOIN oc_spsdecidir_mediosdepago ON oc_spsdecidir_promociones.mp_id = oc_spsdecidir_mediosdepago.id");
    }
   
    return $rta;
  
  }

  public function getEntidadFinanciera($mp_id){
    $rta = array();
    $rta = $this->db->query("SELECT DISTINCT oc_spsdecidir_promociones.ef_id, oc_spsdecidir_entidadesfinancieras.name  FROM oc_spsdecidir_promociones
            LEFT JOIN oc_spsdecidir_entidadesfinancieras
            ON oc_spsdecidir_promociones.ef_id = oc_spsdecidir_entidadesfinancieras.id
            WHERE oc_spsdecidir_promociones.mp_id = $mp_id");
    

    return $rta;
}
}