<?php

//文件上传
class uploads{
	
	private $db;
	public function __construct() {
		$this->branch_img=pc_base::load_model('branch_img_model');
	}
	
	public function index() {
		$year=date('Y',time());
		$riqi=date('md',time());
		if (!is_dir("uploadfile/img/".$year."/")) mkdir("uploadfile/img/".$year."/",0777); // 如果不存在则创建
		if (!is_dir("uploadfile/img/".$year."/".$riqi."/")) mkdir("uploadfile/img/".$year."/".$riqi."/",0777); // 如果不存在则创建
		$path = "uploadfile/img/".$year."/".$riqi."/";//上传路径
		if (isset($_POST)) {
			$name = $_FILES['file']['name'];
			$size = $_FILES['file']['size'];
			$name_tmp = $_FILES['file']['tmp_name'];
			$type = strtolower(substr(strrchr($name, '.'), 1)); //获取文件类型
			$pic_name = time() . rand(10000, 99999) . "." . $type;//图片名称
			$pic_url = $path . $pic_name;//上传后图片路径+名称
			if (move_uploaded_file($name_tmp, $pic_url)) { //临时文件转移到目标文件夹
				echo json_encode(array("error"=>"0","pic"=>$pic_url,"name"=>$pic_name));
			} 
			else {
				echo json_encode(array("error"=>"上传有误，请检查服务器配置！"));
			}
		}
	}
	
	public function delimg() {
		$imgUrl=$_POST['imgUrl'];
		if(@unlink($imgUrl) || empty($imgUrl)){
			echo 1;
		}
		else{
			echo 0;
		}	
	}
}


?>