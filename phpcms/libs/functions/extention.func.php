<?php
/**
 *  extention.func.php 用户自定义函数库
 *
 * @copyright			(C) 2005-2010 PHPCMS
 * @license				http://www.phpcms.cn/license/
 * @lastmodify			2010-10-27
 */
 //获取管理员信息
function admin($id,$name){
	$admin = pc_base::load_model('admin_model');
	$where['userid']=$id;
	$admin_xx=$admin->get_one($where);//获取角色
	switch($name){
		case 'username':
			return $admin_xx['username'];
			break;
		case 'roleid':
			return $admin_xx['roleid'];
			break;
		case 'email':
			return $admin_xx['email'];
			break;
		case 'realname':
			return $admin_xx['realname'];
			break;
	}
}

/*图片裁剪方式：
  1、限制高度；
  2、限制宽度；
  3、宽高比例；
  4、普通切法；
  5、切取中间*/
function cutimg($img,$width,$height,$cut){
	require_once './api/cutimg.php';
	$c=new image($img);
	$arr=$c->thumb($img,$width,$height,$cut);
	return $arr;
}

//截取字符串
function intercept($string,$start,$length){
	if(mb_strlen($string,'utf-8') > $length){
		$str = mb_substr($string,$start,$length,'utf-8').'...';
	}
	else{
		$str = $string;
	}
	return $str;
}

//职位福利分隔
function welfare($string,$num){
	$welfare=explode(',',$string);
	$return='';
	foreach($welfare as $key=>$val){
		if($num==0)
		{
			$return.='<span>'.$val.'</span>';
		}
		else
		{
			if($key < $num){
				$return.='<span>'.$val.'</span>';
			}
			else{
				return $return;
			}
		}
	}
	return $return;
}

//主讲科目分隔(师资团队)
function zjkm($string,$num){
	$welfare=explode(',',$string);
	$return='';
	foreach($welfare as $key=>$val){
		if($num==0)
		{
			$return.='<a class="l_btn">'.$val.'</a>';
		}
		else
		{
			if($key < $num){
				$return.='<a class="l_btn">'.$val.'</a>';
			}
			else{
				return $return;
			}
		}
	}
	return $return;
}

//返回所有上级标签
function parentlinkagename($id){
	if($id!='0')
	{
		$linkage = pc_base::load_model('linkage_model');
		$where['linkageid']=$id;
		$parent=$linkage->get_one($where);
		if(strpos($parent['name'],"市")){
			return $parent['name'];
		}
		else{
			return parentlinkagename($parent['parentid']);
		}
	}
	else
	{
		return "";
	}
}

function citylist($sele){
	$dbfb = pc_base::load_model('gyzb_fb_model');
	$joblist = $dbfb->select('','city','','','city');
	$str="";
	foreach($joblist as $arr)
	{
		if($arr['city']!='0')
		{
			$citys=parentlinkagename($arr['city']);
			if(strpos($str,$citys))
			{

			}
			else
			{
				$str.='<option value="'.$arr['city'].'" '.($sele==$arr['city']?" selected":"").'>'.$citys.'</option>';
			}
		}
	}
	return $str;
}

//调用公共数据
function website($sele){
	$dbfb = pc_base::load_model('set_model');
	$where['id']=1;
	$parent=$dbfb->get_one($where);
	return $parent[$sele];
}


function ban_now($url,$seleadd){
	$url_split=explode('/',$url);
	$url_split_=explode('.',$url_split[1]);
	if(strpos($url_split_[0],'-'))
	{
		$url_split__=explode('-',$url_split_[0]);
		$uur=$url_split__[0];
	}
	else
	{
		$uur=$url_split_[0];
	}
	if(strpos($seleadd,$uur))
	{
		return ' class="one"';
	}
	else
	{
		return '';
	}
}
?>