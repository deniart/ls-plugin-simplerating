{if $aBlogs}
	{foreach from=$aBlogs item=oBlog}
		{assign var="oUserOwner" value=$oBlog->getOwner()}

		<div class="blog-item">
			<div class="blog-badge" id="blog_badge_{$oBlog->getId()}" {if !$oUserCurrent or !$oBlog->getUserIsJoin()}style="display: none"{/if}></div>

			<a href="{$oBlog->getUrlFull()}">
				<img src="{$oBlog->getAvatarPath(100)}" width="100" height="100" alt="avatar" class="avatar" />
			</a>
			
			
			<dl>
				<dt>{$aLang.blog_name}:</dt>
				<dd>
					{if $oBlog->getType() == 'close'}
						<i title="{$aLang.blog_closed}" class="icon-lock"></i>
					{/if}
					<a href="{router page='blog'}{$oBlog->getUrl()}/" class="blog-header">{$oBlog->getTitle()|escape:'html'}</a>
				</dd>
			</dl>
			<dl>
				<dt>{$aLang.blog_description}:</dt>
				<dd>{$oBlog->getDescription()|strip_tags|truncate:300:"..."}</dd>
			</dl>
			<dl>
				<dt>{$aLang.blogs_readers}:</dt>
				<dd><span id="blog_user_count_{$oBlog->getId()}">{$oBlog->getCountUser()}</span></dd>
			</dl>
			<dl>
				<dt>{$aLang.blog_topics_count}:</dt>
				<dd>{$oBlog->getCountTopic()}</dd>
			</dl>
			
			<ul class="blog-actions">
				<li><a href="{router page='blog'}{$oBlog->getUrl()}/">{$aLang.blog_view}</a></li>
				{if $oUserCurrent and $oUserCurrent->getId() != $oBlog->getOwnerId() and $oBlog->getType() == 'open'}
					<li>
						<a href="#" onclick="ls.blog.toggleJoin(this, {$oBlog->getId()}); return false;">
							{if $oBlog->getUserIsJoin()}{$aLang.blog_leave}{else}{$aLang.blog_join}{/if}
						</a>
					</li>
				{/if}
			</ul>
		</div>
	{/foreach}
{else}
	<div class="notice-empty">
		{if $sBlogsEmptyList}
			{$sBlogsEmptyList}
		{else}

		{/if}
	</div>
{/if}
