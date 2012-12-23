<ul class="block-blog-list">
	{foreach from=$aBlogs item=oBlog}
		<li {if $smarty.foreach.cmt.iteration == 1}style="border-top:0px; padding-top:0px"{/if}>
			{strip}
				<a href="{router page='blog'}{$oBlog->getUrl()}/"><img src="{$oBlog->getAvatarPath(48)}" alt="avatar" class="avatar" title="{$oBlog->getTitle()|escape:'html'}" /></a>
				<div class="infa">
					<a href="{$oBlog->getUrlFull()}">{$oBlog->getTitle()|escape:'html'}</a>
					{if $oBlog->getType()=='close'}<i title="{$aLang.blog_closed}" class="icon-synio-topic-private"></i>{/if}
				</div>
			{/strip}
			
			{if {cfg name='plugin.simplerating.sort_blogs_by_count_user'}}
				<span>{$oBlog->getCountUser()}</span>
			{else}
				<span>{$oBlog->getCountTopic()}</span>
			{/if}
		</li>
	{/foreach}
</ul>				