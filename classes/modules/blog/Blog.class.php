<?php

class PluginSimplerating_ModuleBlog extends PluginSimplerating_Inherit_ModuleBlog {
	/**
	 * Получает список подключенных блогов
	 *
	 * @param int $sUserId		ID пользователя
	 * @param int $iLimit		Ограничение на количество в ответе
	 * @param string $sOrderBy	Сортировка
	 * @return array
	 */
	public function GetBlogsJoin($sUserId, $iLimit, $sOrderBy) {
		if (false === ($data = $this->Cache_Get("blog_rating_join_{$sUserId}_{$iLimit}_{$sOrderBy}"))) {
			$data = $this->oMapperBlog->GetBlogsJoin($sUserId, $iLimit, $sOrderBy);
			$this->Cache_Set($data, "blog_rating_join_{$sUserId}_{$iLimit}_{$sOrderBy}", array('blog_update',"blog_relation_change_{$sUserId}"), 60*60*24);
		}
		return $data;
	}
}