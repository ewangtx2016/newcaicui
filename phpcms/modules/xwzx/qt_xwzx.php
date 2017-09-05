<?php
defined('IN_PHPCMS') or exit('No permission resources.');
//模型缓存路径
define('CACHE_MODEL_PATH',CACHE_PATH.'caches_model'.DIRECTORY_SEPARATOR.'caches_data'.DIRECTORY_SEPARATOR);
pc_base::load_app_func('util','content');

class qt_xwzx{
	
	private $db;
	public function __construct() {
		$this->db = pc_base::load_model('xwzx_model');
	}
	
	//企业动态
	public function qydt() {
		//栏目
		$this->dbcreate = pc_base::load_model('create_model');
		$where['id']=27;
		$create = $this->dbcreate->get_one($where);
		
		$where=' tui=0 and `status_del`=0 and lei="企业动态"';
		
		$order="addtime desc";
		
		$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
		$qydt = $this->db->listinfo($where, $order, $page, 6);
		$pages = $this->db->pages;
		include template('xwzx','qydt');
	}
	
	//企业动态详细页
	public function qydts() {
		//栏目
		$this->dbcreate = pc_base::load_model('create_model');
		$where['id']=27;
		$create = $this->dbcreate->get_one($where);
		
		$where['id']=$_GET['id'];
		$qydt = $this->db->get_one($where);
		
		$data['hits']=$qydt[hits]+1;
			
		$res=$this->db->update($data,$where);
		
		//下一条
		$x=$this->db->listinfo(' status_del=0 and lei="企业动态" and id > '.$_GET['id'],'id asc');
		$upspage['id']=$x[0]['id'];
		$upspage['title']=$x[0]['title'];
		//上一条
		$x=$this->db->listinfo(' status_del=0 and lei="企业动态" and id < '.$_GET['id'],'id desc');
		$downspage['id']=$x[0]['id'];
		$downspage['title']=$x[0]['title'];
		
		include template('xwzx','qydts');
	}
	
	//媒体报道
	public function mtbd() {
		//栏目
		$this->dbcreate = pc_base::load_model('create_model');
		$where['id']=28;
		$create = $this->dbcreate->get_one($where);
		
		$where=' tui=0 and `status_del`=0 and lei="媒体报道"';
		
		$order="addtime desc";
		
		$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
		$qydt = $this->db->listinfo($where, $order, $page, 6);
		$pages = $this->db->pages;
		
		include template('xwzx','mtbd');
	}
	
	//媒体报道详细页
	public function mtbds() {
		//栏目
		$this->dbcreate = pc_base::load_model('create_model');
		$where['id']=28;
		$create = $this->dbcreate->get_one($where);
		
		$where['id']=$_GET['id'];
		$qydt = $this->db->get_one($where);
		
		$data['hits']=$qydt[hits]+1;
			
		$res=$this->db->update($data,$where);
		
		//下一条
		$x=$this->db->listinfo(' status_del=0 and lei="媒体报道" and id > '.$_GET['id'],'id asc');
		$upspage['id']=$x[0]['id'];
		$upspage['title']=$x[0]['title'];
		//上一条
		$x=$this->db->listinfo(' status_del=0 and lei="媒体报道" and id < '.$_GET['id'],'id desc');
		$downspage['id']=$x[0]['id'];
		$downspage['title']=$x[0]['title'];
		
		include template('xwzx','mtbds');
	}
	
	//重要活动
	public function zyhd() {
		//栏目
		$this->dbcreate = pc_base::load_model('create_model');
		$where['id']=29;
		$create = $this->dbcreate->get_one($where);
		
		$where=' tui=0 and `status_del`=0 and lei="重要活动"';
		
		$order="addtime desc";
		
		$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
		$qydt = $this->db->listinfo($where, $order, $page, 6);
		$pages = $this->db->pages;
		
		include template('xwzx','zyhd');
	}
	
	//重要活动详细页
	public function zyhds() {
		//栏目
		$this->dbcreate = pc_base::load_model('create_model');
		$where['id']=29;
		$create = $this->dbcreate->get_one($where);
		
		$where['id']=$_GET['id'];
		$qydt = $this->db->get_one($where);
		
		$data['hits']=$qydt[hits]+1;
			
		$res=$this->db->update($data,$where);
		
		//下一条
		$x=$this->db->listinfo(' status_del=0 and lei="重要活动" and id > '.$_GET['id'],'id asc');
		$upspage['id']=$x[0]['id'];
		$upspage['title']=$x[0]['title'];
		//上一条
		$x=$this->db->listinfo(' status_del=0 and lei="重要活动" and id < '.$_GET['id'],'id desc');
		$downspage['id']=$x[0]['id'];
		$downspage['title']=$x[0]['title'];
		
		include template('xwzx','zyhds');
	}
	
	//通知公告
	public function tzgg() {
		//栏目
		$this->dbcreate = pc_base::load_model('create_model');
		$where['id']=33;
		$create = $this->dbcreate->get_one($where);
		
		$where='`status_del`=0 and lei="通知公告"';
		
		$order="addtime desc";
		
		$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
		$qydt = $this->db->listinfo($where, $order, $page, 6);
		$pages = $this->db->pages;
		include template('xwzx','tzgg');
	}
	
	//通知公告详细页
	public function tzggs() {
		//栏目
		$this->dbcreate = pc_base::load_model('create_model');
		$where['id']=33;
		$create = $this->dbcreate->get_one($where);
		
		$where['id']=$_GET['id'];
		$qydt = $this->db->get_one($where);
		
		$data['hits']=$qydt[hits]+1;
			
		$res=$this->db->update($data,$where);
		
		//下一条
		$x=$this->db->listinfo(' status_del=0 and lei="通知公告" and id > '.$_GET['id'],'id asc');
		$upspage['id']=$x[0]['id'];
		$upspage['title']=$x[0]['title'];
		//上一条
		$x=$this->db->listinfo(' status_del=0 and lei="通知公告" and id < '.$_GET['id'],'id desc');
		$downspage['id']=$x[0]['id'];
		$downspage['title']=$x[0]['title'];
		
		include template('xwzx','tzggs');
	}
}