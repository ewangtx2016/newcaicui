<?php

//调用方法
/*参数
一、需要裁切图片的路径
二、图片设置宽度
三、图片设置高度
四、图片裁剪方式：
  1、限制高度；
  2、限制宽度；
  3、宽高比例；
  4、普通切法；
  5、切取中间
*/
//$url="news/new/4.jpg";
//$c=new image($url);
//$arr=$c->thumb($url,1800,850,5);
//echo $arr;



/**
* 图像处理类
* @author DZG
* @example
* $imgs=new image($imgFile);<p>
* 裁剪: if(!$imgs->thumb($targetFile,600,500))die('--图像上传失败！');<p>
* 水印: $imgs->water($targetFile,$water,$pos=0,$pct=50); $targetFile为已经上传到服务器的文件路径
*/
class image {
	// 当前图片
	protected $img;
	// 图像types 对应表
	protected $types = array(
		1 => 'gif',
		2 => 'jpg',
		3 => 'png',
		6 => 'bmp'
	);
	/**
	* 初始化图片类
	* @param string $img: 原图片路径<p>
	*/
	public function __construct($img){
		$this->img = $img;
	} 
	/**
	* 获取图片基本信息
	* @param String $img: 图片路径<p>
	* @return unknown
	*/
	protected function getImageInfo($img){
		
		$info = @getimagesize($img);
		
		if(isset($this->types[$info[2]])){
			$info['ext'] = $info['type'] = $this->types[$info[2]];
		} else{
			$info['ext'] = $info['type'] = 'jpg';
		}
		$info['type'] == 'jpg' && $info['type'] = 'jpeg';$info['size'] = @filesize($img);
		return $info;
	} 

	/**
	* 裁剪图片
	* @param String $filename: 图片保存路径
	* @param number $new_w: 图片裁剪后宽度
	* @param number $new_h: 图片裁剪后高度
	* @param number $cut: 图片裁剪方式：1、限制高度；2、限制宽度；3、宽高比例；4、普通切法；5、切取中间
	* @param boolean $big: 是否允许放大
	* @return boolean|String: false| 图片保存路径
	* @start_w 	目标图像开始 x 坐标
	* @start_h 	目标图像开始 y 坐标，x,y同为 0 则从左上角开始
	* @width 	拷贝图像开始 x 坐标
	* @height 	拷贝图像开始 y 坐标，x,y同为 0 则从左上角开始拷贝
	* @end_w 	（从 src_x 开始）拷贝的宽度
	* @end_h 	（从 src_y 开始）拷贝的高度
	*/
	public function thumb($url,$new_w=160,$new_h=120,$cut=4,$big=true){
		
		$filename=dirname($url).'/'.$new_w.'_'.$new_h.'_'.basename($url);
		if(file_exists($filename)){
			return $filename;
		}
		else{
		// 获取原图信息
		$info = $this->getImageInfo($this->img);
		
		if(!empty($info[0])) {
			$old_w = $info[0];
			$old_h = $info[1];
			$type = $info['type'];
			$ext = $info['ext'];
			unset($info);
			if(!$big){
				if($new_h > $old_h || $new_w > $old_w){
					return false;
				}
			}
			//计算比例（裁剪方式）
			switch($cut){
				//1、指定宽，高按比例（限制宽度）
				case 1:
					if($old_w > $new_w){
						$width = $new_w;
						$height = round($old_h*$new_w/$old_w,0);
					}
					else{
						$width = $old_w;
						$height = $old_h;
					}
					$start_w=$start_h=0;
					$end_w=$old_w;
					$end_h=$old_h;
				break;
				//2、指定高，宽按比例（限制高度）
				case 2:
					if($old_h > $new_h){
						$height = $new_h;
						$width = round($old_w*$new_h/$old_h,0);
					}
					else{
						$width = $old_w;
						$height = $old_h;
					}
					$start_w=$start_h=0;
					$end_w=$old_w;
					$end_h=$old_h;
				break;
				//3、高、宽按比例（宽高比例）
				case 3:
					if($old_h > $new_h || $old_w > $new_w){
						if(($old_h/$new_h) > ($old_w/$new_w)){
							$width = round($old_w * $new_h / $old_h,0);
                            $height = $new_h;
						}
						else{
							$height = round($old_h * $new_w / $old_w,0);
                            $width = $new_w;
						}
					}
					else{
						$width = $old_w;
						$height = $old_h;
					}
					$start_w=$start_h=0;
					$end_w=$old_w;
					$end_h=$old_h;
				break;
				//4、指定高宽裁减（普通切法）
				case 4:
					if(($old_w/$old_h) > ($new_w/$new_h)){
						$end_w = round($old_h*$new_w/$new_h,0);
						$end_h = $old_h;
					}
					else{
						$end_w = $old_w;
						$end_h = round($old_w * $new_h/$new_w,0);
					}
					$start_w=$start_h=0;
					$width = $new_w;
					$height = $new_h;
				break;
				//5、从中间切（切取中间）
				case 5:
					if ($old_w > $new_w){
						if($old_h > $new_h){
							if (($old_w/$new_w) > ($old_h/$new_h)){
								$start_w = round(($old_w-$old_h*$new_w/$new_h)/2,0);
								$start_h = 0;
								$old_w = round($old_h*$new_w/$new_h,0);
							}
							else{
								$start_h = round(($old_h-$old_w*$new_h/$new_w)/2,0);
								$start_w = 0;
								$old_h = round($old_w*$new_h/$new_w,0);
							}
						}
						else{
                            $new_h = $old_h;
                            $new_w = round($new_w * $old_h / $new_h,0);
                            $start_w = round(($old_w - $new_w)/2,0);
                            $start_h = 0;
                            $old_h = $new_h;
                            $old_w = $new_w;
                        }
					}
					else{
						if ($old_h > $new_h){
                            $start_h = round(($old_h-$new_h*$old_w/$new_w)/2,0);
                            if ($start_h > 0){
                                $start_h--;
                            }
                            else{
                                $start_h++;
                            }
                            $old_h = round($old_w * $new_h / $new_w,0);
                            $start_w = 0;
                        }
						else{
							if($old_w/$new_w > $old_h/$new_h){
                                $new_w1 = round($new_w * $old_h / $new_h,0);
                                //$new_h = $old_h;
                                $start_w = round(($old_w - $new_w1)/2,0);
                                $start_h = 0;
								$old_w = $new_w1;
                                //$old_h = $new_h;                                
                            }
                            else{
                                $new_h1 = round($new_h * $old_w / $new_w,0);
                                //$new_w = $old_w;
                                $start_w = 0;
                                $start_h = round(($old_h - $new_h1) / 2,0);
                                $old_h = $new_h1;
                                //$old_w = $new_w;
                            }
						}
					}
					$width=$new_w;
					$height=$new_h;
					$end_w=$old_w;
					$end_h=$old_h;
				break;
			}
			// 载入原图
			$createFun = 'ImageCreateFrom'.$type;
			$oldimg = $createFun($this->img);
			// 创建缩略图
			if($type!='gif' && function_exists('imagecreatetruecolor')){
				$newimg = imagecreatetruecolor($width, $height);
			} else{
				$newimg = imagecreate($width, $height);
			}
			// 复制图片
			if(function_exists("ImageCopyResampled")){
				ImageCopyResampled($newimg, $oldimg, 0, 0, $start_w,$start_h, $width, $height, $end_w,$end_h);
			} 
			else{
				ImageCopyResized($newimg, $oldimg, 0, 0, $start_w,$start_h, $width, $height, $end_w,$end_h);
			} 
			// 对jpeg图形设置隔行扫描
			$type == 'jpeg' && imageinterlace($newimg,1);
			
			// 生成图片
			$imageFun = 'image'.$type;
			if($type=='png'){
				!@$imageFun($newimg,$filename,0) && die('保存失败!检查目录是否存在并且可写?');
			}
			else{
				!@$imageFun($newimg,$filename,100) && die('保存失败!检查目录是否存在并且可写?');
			}
			ImageDestroy($newimg);
			ImageDestroy($oldimg);
			return $filename;
		}
		}
		return false;
	}

	/**
	* 图片添加水印
	* @param String $filename: 新图片保存地址
	* @param unknown $water: 水印图片路径
	* @param number $pos: 水印位置<p>
	* 0=>随机;<p>
	* 1=>顶端居左; 2=>顶端居中; 3=>顶端居右; <p>
	* 4=>中部居左; 5=>中部居中; 6=>中部居右; <p>
	* 7=>底部居左; 8=>底部居中; 9=>底部居右<p>
	* 其它=>随机
	* @param number $pct: 透明度
	* @return boolean|String: false| 图片保存路径
	*/
	public function water($filename,$water,$pos=0,$pct=50){
		// 加载水印图片
		$info = $this->getImageInfo($water);
		if(!empty($info[0])){
			$water_w = $info[0];
			$water_h = $info[1];
			$type = $info['type'];
			$fun = 'imagecreatefrom'.$type;
			$waterimg = $fun($water);
		}
		else{
			return false;
		}
		// 加载背景图片
		$info = $this->getImageInfo($this->img);
		if(!empty($info[0])){
			$old_w = $info[0];
			$old_h = $info[1];
			$type = $info['type'];
			$fun = 'imagecreatefrom'.$type;
			$oldimg = $fun($this->img);
		} 
		else{
			return false;
		}
		// 剪切水印
		$water_w >$old_w && $water_w = $old_w;
		$water_h >$old_h && $water_h = $old_h;
		// 水印位置
		switch($pos){
			case 0://随机
				$posX = rand(0,($old_w - $water_w));
				$posY = rand(0,($old_h - $water_h));
				break;
			case 1://1为顶端居左
				$posX = 0;
				$posY = 0;
				break;
			case 2://2为顶端居中
				$posX = ($old_w - $water_w) / 2;
				$posY = 0;
				break;
			case 3://3为顶端居右
				$posX = $old_w - $water_w;
				$posY = 0;
				break;
			case 4://4为中部居左
				$posX = 0;
				$posY = ($old_h - $water_h) / 2;
				break;
			case 5://5为中部居中
				$posX = ($old_w - $water_w) / 2;
				$posY = ($old_h - $water_h) / 2;
				break;
			case 6://6为中部居右
				$posX = $old_w - $water_w;
				$posY = ($old_h - $water_h) / 2;
				break;
			case 7://7为底端居左$posX = 0;
				$posY = $old_h - $water_h;
				break;
			case 8://8为底端居中
				$posX = ($old_w - $water_w) / 2;
				$posY = $old_h - $water_h;
				break;
			case 9://9为底端居右
				$posX = $old_w - $water_w;
				$posY = $old_h - $water_h;
				break;
			default: //随机
				$posX = rand(0,($old_w - $water_w));
				$posY = rand(0,($old_h - $water_h));
				break;
		}
		// 设定图像的混色模式
		imagealphablending($oldimg, true);
		// 添加水印
		imagecopymerge($oldimg, $waterimg, $posX, $posY, 0, 0,$water_w,$water_h,$pct);
		$fun = 'image'.$type;
		!@$fun($oldimg, $filename,100) && die('保存失败!检查目录是否存在并且可写?');
		imagedestroy($oldimg);
		imagedestroy($waterimg);
		return $filename;
	}
}
?>