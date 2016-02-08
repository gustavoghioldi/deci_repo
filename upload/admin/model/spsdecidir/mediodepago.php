<?php
class ModelSpsdecidirMediodepago extends Model {

	public function get($id=null){
		$rta = array();
		if (is_null($id))
		{
			$rta = $this->db->query("SELECT id,code, name from oc_spsdecidir_mediosdepago");
		}
		return $rta;
	}

	public function set(array $new_mediodepago)
	{	
		$code = $new_mediodepago["code"];
		$name = $new_mediodepago["name"];
		$rta = $this->db->query("INSERT INTO oc_spsdecidir_mediosdepago (code, name) VALUES ($code, \"$name\" );");
		return $rta;
	}
}