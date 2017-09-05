<?php
defined('IN_PHPCMS') or exit('No permission resources.');
//模型缓存路径
define('CACHE_MODEL_PATH',CACHE_PATH.'caches_model'.DIRECTORY_SEPARATOR.'caches_data'.DIRECTORY_SEPARATOR);
pc_base::load_app_func('util','content');

class qt_ywtx{
	
	private $db;
	public function __construct() {
		$this->db = pc_base::load_model('ywtx_model');
	}
	
	//业务体系
	public function business() {
		//栏目
		$this->dbcreate = pc_base::load_model('create_model');
		$where['id']=2;
		$create = $this->dbcreate->get_one($where);
		
		$where['id']=1;
		$ywtx = $this->db->get_one($where);
		
		$where['id']=2;
		$allfb = $this->db->get_one($where);
		
		include template('ywtx','business');
	}
}