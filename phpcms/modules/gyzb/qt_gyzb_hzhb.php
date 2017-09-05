<?php
defined('IN_PHPCMS') or exit('No permission resources.');
//模型缓存路径
define('CACHE_MODEL_PATH',CACHE_PATH.'caches_model'.DIRECTORY_SEPARATOR.'caches_data'.DIRECTORY_SEPARATOR);
pc_base::load_app_func('util','content');

class qt_gyzb_hzhb{
	
	private $db;
	public function __construct() {
		$this->db = pc_base::load_model('gyzb_hzhb_model');
	}
	
	//合作伙伴
	public function about_partners() {
		//栏目
		$this->dbcreate = pc_base::load_model('create_model');
		$where['id']=20;
		$create = $this->dbcreate->get_one($where);
		
		$where='`status_del`=0 ';
		
		$order="paixu desc";
		
		$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
		$partners = $this->db->listinfo($where, $order, $page, 20);
		$pages = $this->db->pages;
		
		include template('about','partners');
	}
	
	//创新教育
	public function about_education() {
		//栏目
		$this->dbcreate = pc_base::load_model('create_model');
		$where['id']=21;
		$create = $this->dbcreate->get_one($where);
		
		include template('about','education');
	}
	
	//发展历程
	public function about_development() {
		//栏目
		$this->dbcreate = pc_base::load_model('create_model');
		$where['id']=22;
		$create = $this->dbcreate->get_one($where);
		
		include template('about','development');
	}
	
	//企业荣誉
	public function about_enterprise() {
		//栏目
		$this->dbcreate = pc_base::load_model('create_model');
		$where['id']=23;
		$create = $this->dbcreate->get_one($where);
		
		$this->dbry = pc_base::load_model('gyzb_qyry_model');
		$where='`status_del`=0 ';
		
		$order="paixu desc";
		
		$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
		$enterprise = $this->dbry->listinfo($where, $order, $page, 20);
		$pages = $this->dbry->pages;
		
		include template('about','enterprise');
	}
	
	//加入中博
	public function about_job() {
		//栏目
		$this->dbcreate = pc_base::load_model('create_model');
		$where['id']=24;
		$create = $this->dbcreate->get_one($where);
		
		$this->dbjob = pc_base::load_model('gyzb_model');
		$where['id']=2;
		$job = $this->dbjob->get_one($where);
		
		$this->dbj = pc_base::load_model('gyzb_job_model');
		$wheres='`status_del`=0 ';
		
		$order="addtime desc";
		
		$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
		$joblist = $this->dbj->listinfo($wheres, $order, $page, 9);
		$pages = $this->dbj->pages;
		
		include template('about','job');
	}
	
	//加入中博详细页
	public function about_jobs() {
		//栏目
		$this->dbcreate = pc_base::load_model('create_model');
		$where['id']=24;
		$create = $this->dbcreate->get_one($where);
		
		$this->dbjob = pc_base::load_model('gyzb_model');
		$where['id']=2;
		$job = $this->dbjob->get_one($where);
		
		$this->dbj = pc_base::load_model('gyzb_job_model');
		$where['id']=$_GET['id'];
		$jobs = $this->dbj->get_one($where);
		
		//下一条
		$x=$this->dbj->listinfo(' status_del=0 and id > '.$_GET['id'],'id asc');
		$upspage['id']=$x[0]['id'];
		$upspage['title']=$x[0]['title'];
		//上一条
		$x=$this->dbj->listinfo(' status_del=0 and id < '.$_GET['id'],'id desc');
		$downspage['id']=$x[0]['id'];
		$downspage['title']=$x[0]['title'];

		include template('about','jobs');
	}
	
	//师资团队
	public function about_teacher() {
		//栏目
		$this->dbcreate = pc_base::load_model('create_model');
		$where['id']=25;
		$create = $this->dbcreate->get_one($where);
		
		$this->dbjob = pc_base::load_model('gyzb_model');
		$where['id']=2;
		$job = $this->dbjob->get_one($where);
		
		$this->dbj = pc_base::load_model('gyzb_sztd_model');
		$wheres='`status_del`=0 ';
		
		$order="paixu desc";
		
		$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
		$joblist = $this->dbj->listinfo($wheres, $order, $page, 9);
		$pages = $this->dbj->pages;
		
		include template('about','teacher');
	}
	
	//师资团队详细页
	public function about_teachers() {		
		//栏目
		$this->dbcreate = pc_base::load_model('create_model');
		$where['id']=25;
		$create = $this->dbcreate->get_one($where);
		
		$this->dbj = pc_base::load_model('gyzb_sztd_model');
		$where['id']=$_GET['id'];
		$jobs = $this->dbj->get_one($where);
		
		//下一条
		$x=$this->dbj->listinfo(' status_del=0 and id > '.$_GET['id'],'id asc');
		$upspage['id']=$x[0]['id'];
		$upspage['title']=$x[0]['title'];
		//上一条
		$x=$this->dbj->listinfo(' status_del=0 and id < '.$_GET['id'],'id desc');
		$downspage['id']=$x[0]['id'];
		$downspage['title']=$x[0]['title'];

		include template('about','teachers');
	}
	
	//联系我们
	public function about_contactus() {
		//栏目
		$this->dbcreate = pc_base::load_model('create_model');
		$where['id']=26;
		$create = $this->dbcreate->get_one($where);
		
		$this->dbjob = pc_base::load_model('gyzb_model');
		$where['id']=1;
		$lxwmm = $this->dbjob->get_one($where);
		
		$this->dbj = pc_base::load_model('gyzb_fb_model');
		
		$citycontactus=$_GET['citycontactus'];
		
		$wheres='`status_del`=0 ';
		if($citycontactus!='')
		{
			$wheres.=' and city='.$citycontactus;
		}
		
		$order="paixu desc";
		
		$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
		$joblist = $this->dbj->listinfo($wheres, $order, $page, 6);
		$pages = $this->dbj->pages;
		
		
		include template('about','contactus');
	}
}