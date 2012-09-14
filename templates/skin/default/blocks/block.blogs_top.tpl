<ul class="block-blog-list">
	{foreach from=$aBlogs item=oBlog}
		<li>
			{strip}
				<a href="{$oBlog->getUrlFull()}">{$oBlog->getTitle()|escape:'html'}</a>
				{if $oBlog->getType()=='close'}<i title="{$aLang.blog_closed}" class="icon-synio-topic-private"></i>{/if}
			{/strip}
			
			{if {cfg name='plugin.simplerating.sort_blogs_by_count_user'}}
				<strong>{$oBlog->getCountUser()}</strong>
			{else}
				<strong>{$oBlog->getCountTopic()}</strong>
			{/if}
		</li>
	{/foreach}
</ul>				