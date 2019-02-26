<?php

/*
 * вызываю так:
 * if(!empty($_FILES['file']['name'])) {
		if($infoload = Uploader::upload($_FILES['file'])){
			$inforesize = Uploader::resize(200,200,'/uploaded/goods_200x200/');
			$_SESSION['file'] = Uploader::$filename;
		} else {
			$infoload = Uploader::$infoload;
в виде исправить <img src="<?php echo '/uploaded/goods_200x200/'.hc($row['img']); ?>
 */


class Uploader {
	static public $array = array('image/gif', 'image/jpeg', 'image/png');
	static public $array2 = array('gif', 'jpeg','jpg','png');
	static public $infoload = '';
	static public $filename = '';
	static public $file = array ();
	static public $temp = array ();

	static public function upload($file) {
		if($file['error'] == 0) {
			if($file['size'] < 5000 || $file['size'] > 5000000) {
				self:: $infoload = ' Ошибка загрузки изображения: файл должен быть от 5 КБ до 5 MБ';
			}
			else {
				preg_match('#\.([a-z]+)$#iu', $file['name'], $matches);
				if(isset($matches[1])) {
					$matches[1] = strtolower($matches[1]);
					$temp = getimagesize($file['tmp_name']);
					$name = date('Ymd-His').'img'.rand(10000, 99999).'.'.$matches[1];

					if(!in_array($matches[1], self::$array2)) {
						self::$infoload = 'Ошибка загрузки изображения: поддерживается только .gif .jpg .png';
					}
					elseif(!in_array($temp['mime'], self::$array)) {
						self::$infoload = 'Ошибка загрузки изображения: поддерживается только .gif .jpg .png';
					}
					elseif(!move_uploaded_file($file['tmp_name'], './uploaded/'.$name)) {
						self::$infoload = 'Ошибка загрузки изображения';
					}
					self::$infoload = 'Изображение успешно загружено';
					self::$filename = $name;
					self::$temp = $temp;
				}
			}
		}
		else {
			self::$infoload = ' Ошибка загрузки изображения';
		}
		self::$file = $file;
		return self::$infoload;
	}

	static public function resize($newwidth, $newheight, $dest) {
		$name = self::$filename;
		$file = self::$file;
		$temp = self::$temp;
		preg_match('#\.([a-z]+)$#iu', $file['name'], $matches);
		if(isset($matches[1])) {
			$matches[1] = strtolower($matches[1]);
			if($temp[0] >= $newwidth && $temp[1] >= $newheight) {
				$ratio = $newheight / $temp[1];
				$newwidth = $temp[0] * $ratio;
				if(copy('./uploaded/'.$name, '.'.$dest.$name)) {
					if($matches[1] == 'jpg' || $matches[1] == 'jpeg') {
						$temp1 = imagecreatefromjpeg('.'.$dest.$name);
						$temp2 = imagecreatetruecolor($newwidth, $newheight);
						imagecopyresampled($temp2, $temp1, 0, 0, 0, 0, $newwidth, $newheight, $temp[0], $temp[1]);
						imagejpeg($temp2, '.'.$dest.$name, 100);
					}
					elseif($matches[1] == 'gif') {
						$temp1 = imagecreatefromgif('.'.$dest.$name);
						$temp2 = imagecreatetruecolor($newwidth, $newheight);
						$transparent = imagecolortransparent($temp2);
						imagefill($temp2, 0, 0, $transparent);
						/*
						 * прозрачность
						 * $transparent_index = imagecolortransparent($temp1);
						$transparent_color = imagecolorsforindex($temp1, $transparent_index);
						$transparent_destination_index = imagecolorallocate($temp2, $transparent_color['red'], $transparent_color['green'], $transparent_color['blue']);
						imagecolortransparent($temp2, $transparent_destination_index);
						imagefill($temp2, 0, 0, $transparent_destination_index);
						 */
						imagecopyresampled($temp2, $temp1, 0, 0, 0, 0, $newwidth, $newheight, $temp[0], $temp[1]);
						imagegif($temp2, '.'.$dest.$name);
					}
					elseif($matches[1] == 'png') {
						$temp1 = imagecreatefrompng('.'.$dest.$name);
						$temp2 = imagecreatetruecolor($newwidth, $newheight);
						$transparent = imagecolorallocatealpha($temp2, 0, 0, 0, 127);
						imagefill($temp2, 0, 0, $transparent);
						imagesavealpha($temp2, true);
						imagecopyresampled($temp2, $temp1, 0, 0, 0, 0, $newwidth, $newheight, $temp[0], $temp[1]);
						imagepng($temp2, '.'.$dest.$name, 9);
					}
					imagedestroy($temp1);
					$inforesize = 'Размер изображения успешно изменён';
				}
				else {
					$inforesize = 'Ошибка изменения размера изображения';
				}
			}
			else {
				$inforesize = ' Ошибка изменения размера изображения: длинна должны быть не менее '.$newwidth.' px, ширина не менее '.$newheight.' px';
			}
		}
		else {
			$inforesize = 'Ошибка изменения размера изображения';
		}
		unlink('./uploaded/'.$name);
		return $inforesize;
	}
}