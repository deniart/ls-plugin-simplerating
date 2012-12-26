<?php

class PluginSimplerating_BlockBlogs extends PluginSimplerating_Inherit_BlockBlogs {
	public function Exec() {
		$sOrderBlogsBy = Config::Get('plugin.simplerating.sort_blogs_by_count_user') ? 'blog_count_user' : 'blog_count_topic';

		if ($aResult = $this->Blog_GetBlogsByFilter(array('exclude_type' => 'personal'), array($sOrderBlogsBy => 'desc'), 1, Config::Get('block.blogs.row'))) {
			$aBlogs = $aResult['collection'];
			$oViewer = $this->Viewer_GetLocalViewer();
			$oViewer->Assign('aBlogs', $aBlogs);
			
			$sTextResult = $oViewer->Fetch("blocks/block.blogs_top.tpl");
			$this->Viewer_Assign('sBlogsTop', $sTextResult);
		}
	}
}
?>