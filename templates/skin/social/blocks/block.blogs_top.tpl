<ul class="item-list">
	{foreach from=$aBlogs item=oBlog}
		<li>
			<a href="{$oBlog->getUrlFull()}"><img src="{$oBlog->getAvatarPath(48)}" alt="avatar" class="avatar" /></a>
			
			{if $oBlog->getType()=='close'}<i title="{$aLang.blog_closed}" class="icon icon-lock"></i>{/if}
			<a href="{$oBlog->getUrlFull()}" class="blog-name">{$oBlog->getTitle()|escape:'html'}</a>

			{if {cfg name='plugin.simplerating.sort_blogs_by_count_user'}}
				<p>{$aLang.blogs_readers}: <strong>{$oBlog->getCountUser()}</strong></p>
			{else}
				<p>{$aLang.infobox_blog_topics}: <strong>{$oBlog->getCountTopic()}</strong></p>
			{/if}
		</li>
	{/foreach}
</ul>				