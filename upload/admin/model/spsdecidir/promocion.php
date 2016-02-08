<?php
class ModelSpsdecidirPromocion extends Model {

	public function get(){
		$rta = array();
		$rta = $this->db->query("SELECT oc_spsdecidir_promociones.id AS id, 
				oc_spsdecidir_mediosdepago.name AS mediodepago,
				oc_spsdecidir_entidadesfinancieras.name AS entidadfinanciera, 
				oc_spsdecidir_promociones.cuotas AS cuotas,
				oc_spsdecidir_promociones.porcentaje AS porcentaje,
				oc_spsdecidir_promociones.desde AS desde,
				oc_spsdecidir_promociones.hasta AS hasta
				FROM oc_spsdecidir_promociones
				JOIN oc_spsdecidir_entidadesfinancieras ON oc_spsdecidir_promociones.ef_id=oc_spsdecidir_entidadesfinancieras.id
				JOIN oc_spsdecidir_mediosdepago ON oc_spsdecidir_promociones.mp_id=oc_spsdecidir_mediosdepago.id");
		return $rta;
	}

	public function set(array $new_promocion){
		$ef_id = $new_promocion['ef_id'];
		$mp_id = $new_promocion["mp_id"];
		$cuotas = $new_promocion["cuotas"];
		$porcentaje = $new_promocion["porcentaje"];

		$rta = $this->db->query("INSERT INTO oc_spsdecidir_promociones (ef_id, mp_id, cuotas, porcentaje) VALUES ($ef_id, $mp_id, $cuotas, $porcentaje );");
		return $rta;
 	}
	
}