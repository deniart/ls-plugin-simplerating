<div class="profile" id="profile">
	{hook run='profile_top_begin' oUserProfile=$oUserProfile}
	
	<a href="{$oUserProfile->getUserWebPath()}"><img src="{$oUserProfile->getProfileAvatarPath(48)}" alt="avatar" class="avatar" itemprop="photo" /></a>
	
	
	<h2 class="page-header user-login word-wrap {if !$oUserProfile->getProfileName()}no-user-name{/if}" itemprop="nickname">{$oUserProfile->getLogin()}</h2>
	
	{if $oUserProfile->getProfileName()}
		<p class="user-name" itemprop="name">{$oUserProfile->getProfileName()|escape:'html'}</p>
	{/if}
	
	
	{assign var="oSession" value=$oUserProfile->getSession()}
	
	{if $oSession}
		{if $oUserProfile->isOnline() &&  $smarty.now - strtotime($oSession->getDateLast()) < 60*5}
			<div class="status status-online">{$aLang.user_status_online}</div>
		{else}
			<div class="status status-offline">

			{if $oUserProfile->getProfileSex() != 'woman'}
				{$aLang.was_online_male}
			{else}
				{$aLang.was_online_female}
			{/if}
			 
			{date_format date=$oSession->getDateLast() hours_back="12" minutes_back="60" day_back="8" now="60*5" day="day H:i" format="j F в G:i"}</div>
		{/if}
	{/if}
	
	
	{hook run='profile_top_end' oUserProfile=$oUserProfile}
</div>