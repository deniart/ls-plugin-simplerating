<?php

class PluginSimplerating_ActionAjax extends PluginSimplerating_Inherit_ActionAjax {
	/**
	 * Обработка получения TOP блогов
	 * Используется в блоке "TOP блогов"
	 *
	 */
	protected function EventBlogsTop() {
		/**
		 * Получаем список блогов и формируем ответ
		 */
		if ($aResult=$this->Blog_GetBlogsByFilter(array('exclude_type'=>'personal'),array('blog_count_user'=>'desc'),1,Config::Get('block.blogs.row'))) {
			$aBlogs=$aResult['collection'];
			$oViewer=$this->Viewer_GetLocalViewer();
			$oViewer->Assign('aBlogs',$aBlogs);
			$sTextResult=$oViewer->Fetch("blocks/block.blogs_top.tpl");
			$this->Viewer_AssignAjax('sText',$sTextResult);
		} else {
			$this->Message_AddErrorSingle($this->Lang_Get('system_error'),$this->Lang_Get('error'));
			return;
		}
	}
	
}