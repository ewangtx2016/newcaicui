<?php
defined('IN_PHPCMS') or exit('No permission resources.');
pc_base::load_app_class('admin', 'admin', 0);
pc_base::load_sys_class('format', '', 0);
pc_base::load_sys_class('form', '', 0);
pc_base::load_app_func('util', 'content');

class xwzx_hd extends admin{
	
	private $db;
	public function __construct() {
		$this->db = pc_base::load_model('xwzx_model');
	}
	
	//栏目文件
	public function create() {
		$this->lxwmset = pc_base::load_model('create_model');
		$userid=param::get_cookie('userid');
		if(!empty($_POST['dosubmit'])){
			$where['id']=29;
			$data=$_POST['info'];
			$data['modiuser']=$userid;//修改人
			$data['moditime']=time();//修改时间
			
			$res=$this->lxwmset->update($data,$where);
			if($res){
				showmessage('操作成功','?m=xwzx&c=xwzx_hd&a=create');
			}
			else{
				showmessage('操作失败，请重新提交','?m=xwzx&c=xwzx_hd&a=create');
			}
		}
		else{
			$where['id']=29;
			$res=$this->lxwmset->get_one($where);
			include $this->admin_tpl('createhd');
		}
	}
	
	//列表
	public function index() {
		$where='1=1';
		$where.=' and `lei`="重要活动" and `status_del`=0';
		//搜索
		/*if(isset($_GET['starttime']) && $_GET['starttime']){
			$where .= " AND `addtime` >= '".strtotime($_GET['starttime'])."'";
		}
		if(isset($_GET['endtime']) && $_GET['endtime']){
			$where .= " AND `addtime` < '".strtotime($_GET['endtime'])."'";
		}*/
		if(!empty($_GET['title'])) {
			$where .= " AND `title` like '%".$_GET['title']."%'";
		}
		
		$order="moditime desc";
		
		$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
		$datas = $this->db->listinfo($where, $order, $page, 20);
		$pages = $this->db->pages;
		include $this->admin_tpl('hdindex');
	}
	
	//判断名称是否存在
	public function get_title() {
		$where="title = '".$_GET['title']."' and id != ".$_GET['hiddenid']."";
		$num=$this->db->select($where);
		if(count($num)>0){
			$html=2;	
		}
		else{
			$html=1;	
		}
		echo $html;
	}
	
	//添加
	public function add() {
		$userid=param::get_cookie('userid');
		if(!empty($_POST['dosubmit'])){
			$data=$_POST['info'];
			$data['adduser']=$userid;//发布人
			$data['modiuser']=$userid;//修改人
			$data['addtime']=time();//添加时间
			$data['moditime']=time();//修改时间
			$data['status_del']=0;
			$res=$this->db->insert($data);
			if($res){
				showmessage('操作成功','?m=xwzx&c=xwzx_hd&a=index');
			}
			else{
				showmessage('操作失败，请重新提交','?m=xwzx&c=xwzx_hd&a=add');
			}
		}
		else{
			include $this->admin_tpl('hdadd');
		}
	}
	
	//编辑
	public function edit() {
		$userid=param::get_cookie('userid');
		if(!empty($_POST['dosubmit'])){
			$where['id']=$_POST['hidden_id'];
			$data=$_POST['info'];
			$data['modiuser']=$userid;//修改人
			$data['moditime']=time();//修改时间
			
			$res=$this->db->update($data,$where);
			if($res){
				showmessage('操作成功','?m=xwzx&c=xwzx_hd&a=index');
			}
			else{
				showmessage('操作失败，请重新提交','?m=xwzx&c=xwzx_hd&a=edit');
			}
		}
		else{
			$where['id']=$_GET['id'];
			$res=$this->db->get_one($where);
			include $this->admin_tpl('hdedit');
		}
	}
	
	//删除
	public function delete() {
		$data['status_del']=1;
		//单条删除
		if(!empty($_GET['id'])){
			$where['id']=$_GET['id'];
			$datas = $this->db->update($data,$where);
			showmessage('已放入回收站');
		}
		//多删
		if(!empty($_POST['hid'])){
			$id=$_POST['id'];
			foreach($id as $b){
				$where['id']=$b;
				$datas = $this->db->update($data,$where);	
			}
			showmessage('已放入回收站');
		}	
	}
	
	//回收站
	public function xwzx_hd_hsz() {
		$where='status_del =1 and `lei`="重要活动"';
		//搜索
		if(!empty($_GET['title'])) {
			$where .= " AND `title` like '%".$_GET['title']."%'";
		}
		
		$order="moditime desc";
		
		$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
		$datas = $this->db->listinfo($where, $order, $page, 20);
		$pages = $this->db->pages;
		include $this->admin_tpl('hdxwzx_hsz');
	}
	
	//还原
	public function xwzx_hd_hszhy() {
		if(!empty($_GET['id'])){
			$where['id']=$_GET['id'];
			$data['status_del']=0;
			$datas = $this->db->update($data,$where);
			if($datas){
				showmessage('操作成功','?m=xwzx&c=xwzx&a=xwzx_hd_hsz');
			}
			else{
				showmessage('操作失败，请重新提交','?m=xwzx&c=xwzx&a=xwzx_hd_hsz');
			}
		}
		else{
			showmessage('操作失败，请重新提交111','?m=xwzx&c=xwzx&a=xwzx_hd_hsz');	
		}	
	}
	
	//回收站删除
	public function xwzx_hd_hszsc() {
		$userid=param::get_cookie('userid');
		//单条删除
		if(!empty($_GET['id'])){
			$where['id']=$_GET['id'];
			$datas = $this->db->delete($where);
			showmessage('已删除');
		}
		//多删
		if(!empty($_POST['hid'])){
			$id=$_POST['id'];
			foreach($id as $b){
				$where['id']=$b;
				$datas = $this->db->delete($where);
			}
			showmessage('已删除');
		}
	}
}