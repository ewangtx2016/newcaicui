<?php
defined('IN_PHPCMS') or exit('No permission resources.');
//模型缓存路径
define('CACHE_MODEL_PATH',CACHE_PATH.'caches_model'.DIRECTORY_SEPARATOR.'caches_data'.DIRECTORY_SEPARATOR);
pc_base::load_app_func('util','content');

class qt_shzr{
	
	private $db;
	public function __construct() {
		$this->db = pc_base::load_model('shzr_model');
	}
	
	//创始人寄语
	public function founder() {
		//栏目
		$this->dbcreate = pc_base::load_model('create_model');
		$where['id']=30;
		$create = $this->dbcreate->get_one($where);
		
		
		$where['id']=1;
		$founder = $this->db->get_one($where);
		
		include template('shzr','founder');
	}
	
	//社会公益
	public function welfare() {
		//栏目
		$this->dbcreate = pc_base::load_model('create_model');
		$where['id']=31;
		$create = $this->dbcreate->get_one($where);
		
		$this->dbwel = pc_base::load_model('xwzx_model');
		$where=' tui=0 and `status_del`=0 and lei="社会公益"';
		
		$order="moditime desc";
		
		$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
		$welfare = $this->dbwel->listinfo($where, $order, $page, 1000);
		$pages = $this->dbwel->pages;
		
		include template('shzr','welfare');
	}
	
	//社会公益详细页
	public function welfares() {
		//栏目
		$this->dbcreate = pc_base::load_model('create_model');
		$where['id']=31;
		$create = $this->dbcreate->get_one($where);
		
		$this->dbwel = pc_base::load_model('xwzx_model');
		$where['id']=$_GET['id'];
		$qydt = $this->dbwel->get_one($where);
		
		$data['hits']=$qydt[hits]+1;
			
		$res=$this->dbwel->update($data,$where);
		
		//下一条
		$x=$this->dbwel->listinfo(' status_del=0 and lei="社会公益" and id > '.$_GET['id'],'id asc');
		$upspage['id']=$x[0]['id'];
		$upspage['title']=$x[0]['title'];
		//上一条
		$x=$this->dbwel->listinfo(' status_del=0 and lei="社会公益" and id < '.$_GET['id'],'id desc');
		$downspage['id']=$x[0]['id'];
		$downspage['title']=$x[0]['title'];
		
		include template('shzr','welfares');
	}
	
	//奖学金
	public function scholarship() {
		//栏目
		$this->dbcreate = pc_base::load_model('create_model');
		$where['id']=32;
		$create = $this->dbcreate->get_one($where);
		
		$where['id']=2;
		$scholarship = $this->db->get_one($where);
		
		include template('shzr','scholarship');
	}
}