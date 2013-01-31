<?php
/*-------------------------------------------------------
*
*   Simple Rating
*   Copyright  2012 Denis Shakhov
*
*--------------------------------------------------------
*
*   Contact e-mail: work@deniart.ru
*
---------------------------------------------------------
*/

/**
 * Запрещаем напрямую через браузер обращение к этому файлу.
 */
if (!class_exists('Plugin')) {
	die('Hacking attempt!');
}

class PluginSimplerating extends Plugin {

    protected $aInherits = array(
       'action' => array('ActionBlogs', 'ActionAjax'), 
       'module' => array('ModuleRating', 'ModuleBlog', 'ModuleStream'), 
       'mapper' => array('ModuleBlog_MapperBlog'), 
       'block' => array('BlockBlogs'), 
    );

	protected $aDelegates=array(
		'template' => array(
            'blog_list.tpl',
            'user_list.tpl',
            'blocks/block.blogs_top.tpl',
            'actions/ActionProfile/profile_top.tpl',
        ),
	);

	
	/**
	 * Активация плагина	 
	 */
	public function Activate() {
		return true;
	}	


	/**
	 * Инициализация плагина
	 */
	public function Init() {
		$this->Viewer_AppendStyle(Plugin::GetTemplateWebPath(__CLASS__) . 'css/simplerating.css');
	}
}
?>