<?php
class ModelSpsdecidirEntidadfinanciera extends Model {
	
	public function get($id=null){
		$rta = array();
		if (is_null($id))
		{
			$rta = $this->db->query("SELECT id, name from oc_spsdecidir_entidadesfinancieras");
		}else
		{
			$rta = $this->db->query("SELECT name from oc_spsdecidir_entidadesfinancieras WHERE id=$id");
		}
		return $rta;
	}

	public function set(array $new_entidadfinanciera)
	{	
		$name = $new_entidadfinanciera["name"];
		$rta = $this->db->query("INSERT INTO oc_spsdecidir_entidadesfinancieras ( name) VALUES ( \"$name\" );");
		return $rta;
	}	
}