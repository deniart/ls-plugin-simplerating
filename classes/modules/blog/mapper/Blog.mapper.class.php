<?php

class PluginSimplerating_ModuleBlog_MapperBlog extends PluginSimplerating_Inherit_ModuleBlog_MapperBlog {
	/**
	 * Получает список подключенных блогов
	 *
	 * @param int $sUserId		ID пользователя
	 * @param int $iLimit		Ограничение на количество в ответе
	 * @param string $sOrderBy	Сортировка
	 */
	public function GetBlogsJoin($sUserId, $iLimit, $sOrderBy) {
		$sql = "SELECT 
					b.*													
				FROM 
					".Config::Get('db.table.blog_user')." as bu,
					".Config::Get('db.table.blog')." as b	
				WHERE 	
					bu.user_id = ?d
					AND
					bu.blog_id = b.blog_id
					AND				
					b.blog_type<>'personal'							
				ORDER by b.{$sOrderBy} desc
				LIMIT 0, ?d 
				;	
					";
		$aReturn=array();
		if ($aRows=$this->oDb->select($sql,$sUserId,$iLimit)) {
			foreach ($aRows as $aRow) {
				$aReturn[]=Engine::GetEntity('Blog',$aRow);
			}
		}
		return $aReturn;
	}
}