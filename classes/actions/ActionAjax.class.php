<?php

class PluginSimplerating_ActionAjax extends PluginSimplerating_Inherit_ActionAjax {
	protected $sOrderBlogsBy;


	public function Init() {
		parent::Init();

		$this->sOrderBlogsBy = Config::Get('plugin.simplerating.sort_blogs_by_count_user') ? 'blog_count_user' : 'blog_count_topic';
	}

	/**
	 * Обработка получения TOP блогов
	 * Используется в блоке "TOP блогов"
	 *
	 */
	protected function EventBlogsTop() {
		/**
		 * Получаем список блогов и формируем ответ
		 */
		if ($aResult=$this->Blog_GetBlogsByFilter(array('exclude_type'=>'personal'),array($this->sOrderBlogsBy=>'desc'),1,Config::Get('block.blogs.row'))) {
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


	/**
	 * Обработка получения своих блогов
	 * Используется в блоке "TOP блогов"
	 *
	 */
	protected function EventBlogsSelf() {
		/**
		 * Пользователь авторизован?
		 */
		if (!$this->oUserCurrent) {
			$this->Message_AddErrorSingle($this->Lang_Get('need_authorization'),$this->Lang_Get('error'));
			return;
		}
		/**
		 * Получаем список блогов и формируем ответ
		 */

		if ($aBlogs = $this->Blog_GetBlogsByFilter( array('exclude_type' => 'personal', 'user_owner_id' => $this->oUserCurrent->getId() ), array($this->sOrderBlogsBy => 'desc'), 1, Config::Get('block.blogs.row'))) {
			$oViewer=$this->Viewer_GetLocalViewer();
			$oViewer->Assign('aBlogs',$aBlogs['collection']);
			$sTextResult=$oViewer->Fetch("blocks/block.blogs_top.tpl");
			$this->Viewer_AssignAjax('sText',$sTextResult);
		} else {
			$this->Message_AddErrorSingle($this->Lang_Get('block_blogs_self_error'),$this->Lang_Get('attention'));
			return;
		}
	}

	/**
	 * Обработка получения подключенных блогов
	 * Используется в блоке "TOP блогов"
	 *
	 */
	protected function EventBlogsJoin() {
		/**
		 * Пользователь авторизован?
		 */
		if (!$this->oUserCurrent) {
			$this->Message_AddErrorSingle($this->Lang_Get('need_authorization'),$this->Lang_Get('error'));
			return;
		}
		/**
		 * Получаем список блогов и формируем ответ
		 */
		if ($aBlogs=$this->Blog_GetBlogsJoin($this->oUserCurrent->getId(), Config::Get('block.blogs.row'), $this->sOrderBlogsBy)) {
			$oViewer=$this->Viewer_GetLocalViewer();
			$oViewer->Assign('aBlogs',$aBlogs);
			$sTextResult=$oViewer->Fetch("blocks/block.blogs_top.tpl");
			$this->Viewer_AssignAjax('sText',$sTextResult);
		} else {
			$this->Message_AddErrorSingle($this->Lang_Get('block_blogs_join_error'),$this->Lang_Get('attention'));
			return;
		}
	}
	
}