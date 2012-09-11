<?php

class PluginSimplerating_ModuleRating extends PluginSimplerating_Inherit_ModuleRating {

	/**
	 * Расчет рейтинга при голосовании за комментарий
	 *
	 * @param ModuleUser_EntityUser $oUser	Объект пользователя, который голосует
	 * @param ModuleComment_EntityComment $oComment	Объект комментария
	 * @param int $iValue
	 * @return int
	 */
	public function VoteComment(ModuleUser_EntityUser $oUser, ModuleComment_EntityComment $oComment, $iValue) {
		
		// Устанавливаем рейтинг комментария
		$oComment->setRating( $oComment->getRating() + $iValue );

		// Обновляем рейтинг пользователя
		$iValue *= Config::Get('plugin.simplerating.user_vote_comment_value');

		$oUserComment = $this->User_GetUserById( $oComment->getUserId() );
		$oUserComment->setRating( $oUserComment->getRating() +  $iValue);

		$this->User_Update($oUserComment);
		
		return $iValue;
	}

	/**
	 * Расчет рейтинга и силы при голосовании за топик
	 *
	 * @param ModuleUser_EntityUser $oUser	Объект пользователя, который голосует
	 * @param ModuleTopic_EntityTopic $oTopic	Объект топика
	 * @param int $iValue
	 * @return int
	 */
	public function VoteTopic(ModuleUser_EntityUser $oUser, ModuleTopic_EntityTopic $oTopic, $iValue) {

		// Устанавливаем рейтинг топика
		$oTopic->setRating( $oTopic->getRating() + $iValue );

		// Обновляем рейтинг пользователя
		$iValue *= Config::Get('plugin.simplerating.user_vote_topic_value');

		$oUserTopic = $this->User_GetUserById( $oTopic->getUserId() );
		$oUserTopic->setRating( $oUserTopic->getRating() + $iValue );

		$this->User_Update($oUserTopic);

		return $iValue;
	}

	/**
	 * Расчет рейтинга и силы при голосовании за блог
	 *
	 * @param ModuleUser_EntityUser $oUser	Объект пользователя, который голосует
	 * @param ModuleBlog_EntityBlog $oBlog	Объект блога
	 * @param int $iValue
	 * @return int
	 */
	public function VoteBlog(ModuleUser_EntityUser $oUser, ModuleBlog_EntityBlog $oBlog, $iValue) {
		return 0;
	}

	/**
	 * Расчет рейтинга и силы при голосовании за пользователя
	 *
	 * @param ModuleUser_EntityUser $oUser
	 * @param ModuleUser_EntityUser $oUserTarget
	 * @param int $iValue
	 * @return float
	 */
	public function VoteUser(ModuleUser_EntityUser $oUser, ModuleUser_EntityUser $oUserTarget, $iValue) {
		return 0;
	}
}