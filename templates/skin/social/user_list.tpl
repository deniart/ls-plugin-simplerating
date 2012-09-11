{if $aUsersList}
	{foreach from=$aUsersList item=oUserList}
		{assign var="oSession" value=$oUserList->getSession()}
		{assign var="oUserNote" value=$oUserList->getUserNote()}

		<div class="user-item">
			<a href="{$oUserList->getUserWebPath()}">
				<img src="{$oUserList->getProfileAvatarPath(100)}" alt="avatar" class="avatar" />
			</a>
			
			<div class="user-wrapper">
				<div class="user-login"><a href="{$oUserList->getUserWebPath()}">{$oUserList->getLogin()}</a></div>
				<div class="user-name">{$oUserList->getProfileName()|escape:'html'}</div>
			</div>


			{if $oUserCurrent and $oUserNote}
				<div class="user-item-note">
					{$oUserNote->getText()|escape:'html'}
				</div>
			{/if}

			
			{if $oSession}
				<dl>
					<dt>{$aLang.user_date_last}:</dt>
					<dd>
						<span title="{date_format date=$oSession->getDateLast() format="j F Y, H:i"}">{date_format date=$oSession->getDateLast() hours_back="12" minutes_back="60" now="60" day="day H:i" format="j F Y, H:i"}</span>
					</dd>
				</dl>
			{/if}
			
			<dl>
				<dt>{$aLang.user_date_registration}:</dt>
				<dd>
					<span title="{date_format date=$oUserList->getDateRegister() format="j F Y, H:i"}">{date_format date=$oUserList->getDateRegister() hours_back="12" minutes_back="60" now="60" day="day H:i" format="j F Y, H:i"}</span>
				</dd>
			</dl>
			
			<dl>
				<dt>{$aLang.user_rating}:</dt>
				<dd>
					<strong>{$oUserList->getRating()}</strong>
				</dd>
			</dl>
		</div>
	{/foreach}
{else}
	<div class="notice-empty">
		{if $sUserListEmpty}
			{$sUserListEmpty}
		{else}
			{$aLang.user_empty}
		{/if}
	</div>
{/if}



{include file='paging.tpl' aPaging=$aPaging}