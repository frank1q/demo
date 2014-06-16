<?php
class IndexAction extends CommAction {
    public function index(){
    	// 博客部头图片
    	$newsArr=M('news');
    	
		$index = $newsArr->field('id,sort,picture')->where($where)->order('norder asc')->find();
        // dump($index);

		//菜单（首页、日志、相册、关于我）
        $sort = M('sort');
        $where1['deep']=1;
        $where1['ifmenu']=1;
        $sortArr = $sort->field('name,id,path')->where($where1)->order('norder asc')->select();
        // dump($sortArr[0]['id']);

        //日志列表（不显示详细，只显示下面内容
        $photo=M('photo');
        $where2['ispass']=1;
        $where2['sort']='%'.$sortArr[0]['path'].','.$sortArr[0]['id'].'%';
        $whereall['sort']= array('like',$where2); 
        $photoArr = $photo->field('title,picture,addtime,picture,hits,commentCount')->where($whereall)->order('norder asc')->select();
        // dump($photoArr[1]['title']);
		
		//主人留言薄
		$where3['sort']=$index['sort'].','.'100015';
		$indexArr = $newsArr->field('content,picture')->where($where3)->order('id DESC')->find();
        // dump($indexArr);
        
        //图片集
        $where4['ispass']=1;
        $where4['sort']=$sortArr[0]['path'].','.'100007';
        $photolistArr = $photo->field('picture')->where($where4)->order('norder asc')->select();
      	// dump($photolistArr);
 		
 		//日志日期列表 
 		$where5['path']=$sortArr[0]['path'].','.$sortArr[0]['id'];
        $pathArr = $sort->field('name')->where($where5)->order('id DESC')->select();
        dump($pathArr);

        $this->assign('pathArr',$pathArr);
        $this->assign('photolistArr',$photolistArr);
        $this->assign('index',$photo);
        $this->assign('photo',$photo);
        $this->assign('index',$index);
        $this->assign('sortArr',$sortArr);
	}
	//日志列表(与首页列表一样）
	public function index(){
		
	}
}
?>
