<?php

class PluginSimplerating_ModuleStream extends PluginSimplerating_Inherit_ModuleStream {
	protected $aEventTypes = array(
		'add_wall' => array('related' => 'wall','unique'=>true),
		'add_topic' => array('related' => 'topic','unique'=>true),
		'add_comment' => array('related' => 'comment','unique'=>true),
		'add_blog' => array('related' => 'blog','unique'=>true),
		'vote_topic' => array('related' => 'topic'),
		'vote_comment' => array('related' => 'comment'),
		'add_friend' => array('related' => 'user','unique_user'=>true),
		'join_blog' => array('related' => 'blog','unique_user'=>true)
	);
}