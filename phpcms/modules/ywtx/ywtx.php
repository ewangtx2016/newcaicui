<?php
defined('IN_PHPCMS') or exit('No permission resources.');
pc_base::load_app_class('admin', 'admin', 0);
pc_base::load_sys_class('format', '', 0);
pc_base::load_sys_class('form', '', 0);
pc_base::load_app_func('util', 'content');

class ywtx extends admin{
	
	private $db;
	public function __construct() {
		$this->db = pc_base::load_model('ywtx_model');
	}
	
	//栏目文件
	public function create() {
		$this->lxwmset = pc_base::load_model('create_model');
		$userid=param::get_cookie('userid');
		if(!empty($_POST['dosubmit'])){
			$where['id']=2;
			$data=$_POST['info'];
			$data['modiuser']=$userid;//修改人
			$data['moditime']=time();//修改时间
			
			$res=$this->lxwmset->update($data,$where);
			if($res){
				showmessage('操作成功','?m=ywtx&c=ywtx&a=create');
			}
			else{
				showmessage('操作失败，请重新提交','?m=ywtx&c=ywtx&a=create');
			}
		}
		else{
			$where['id']=2;
			$res=$this->lxwmset->get_one($where);
			include $this->admin_tpl('create');
		}
	}
	
	//业务板块
	public function ywtx() {
		$userid=param::get_cookie('userid');
		if(!empty($_POST['dosubmit'])){
			$where['id']=1;
			$data=$_POST['info'];
			require_once './api/fileupload.php';
			if($_FILES){
				$errs="";
				$up = new fileupload;
				$year=date('Y',time());
				$riqi=date('md',time());
				if (!is_dir("statics/ywtx/".$year."/")) mkdir("statics/ywtx/".$year."/",0777); // 如果不存在则创建
				if (!is_dir("statics/ywtx/".$year."/".$riqi."/")) mkdir("statics/ywtx/".$year."/".$riqi."/",0777); // 如果不存在则创建
				//设置属性(上传的位置， 大小， 类型， 名是是否要随机生成)
				$up -> set("path", "./statics/ywtx/".$year."/".$riqi."/");
				$up -> set("maxsize", 10485760);//10mb
				$up -> set("allowtype", array("gif", "png", "jpg","jpeg"));
				$up -> set("israndname", true);
				$filename=array("pic", "pic2", "pic3","pic4","pic5","pic6","pic7","pic8");
				foreach($filename as $val){
					if(!empty($_FILES[$val]['name'])) {
						if($up->upload($val)) {
							$data[$val]="statics/ywtx/".$year."/".$riqi."/".$up->getFileName();
							@unlink($_POST[$val.'_hidden']);
						}
						else{
							$errs.=$up->getErrorMsg().";";
							showmessage($errs);
						}
					}
				}
			}

			
			$data['modiuser']=$userid;//修改人
			$data['moditime']=time();//修改时间
			$res=$this->db->update($data,$where);
			if($res){
				showmessage('操作成功','?m=ywtx&c=ywtx&a=ywtx');
			}
			else{
				showmessage('操作失败，请重新提交','?m=ywtx&c=ywtx&a=ywtx');
			}
		}
		else{
			$where['id']=1;
			$res=$this->db->get_one($where);
			include $this->admin_tpl('ywtxs');
		}
	}
	
	//全国分部
	public function allfb() {
		$userid=param::get_cookie('userid');
		if(!empty($_POST['dosubmit'])){
			$where['id']=2;
			$data=$_POST['info'];
			$data['modiuser']=$userid;//修改人
			$data['moditime']=time();//修改时间
			$res=$this->db->update($data,$where);
			if($res){
				showmessage('操作成功','?m=ywtx&c=ywtx&a=allfb');
			}
			else{
				showmessage('操作失败，请重新提交','?m=ywtx&c=ywtx&a=allfb');
			}
		}
		else{
			$where['id']=2;
			$res=$this->db->get_one($where);
			include $this->admin_tpl('allfb');
		}
	}
}