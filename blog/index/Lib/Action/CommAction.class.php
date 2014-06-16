<?php
// 公共类（基类）
class CommAction extends Action {

	
	// 用户密码加密
	protected function newPwd($password){
		return md5(substr(md5($password), 7,-7));
	}


}