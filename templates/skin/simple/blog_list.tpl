<table class="table table-blogs" cellspacing="0">
	{if $bBlogsUseOrder}
		<thead>
			<tr>
				<th class="cell-info">&nbsp;</th>
				<th class="cell-name cell-tab">
					<div class="cell-tab-inner {if $sBlogOrder=='blog_title'}active{/if}"><a href="{$sBlogsRootPage}?order=blog_title&order_way={if $sBlogOrder=='blog_title'}{$sBlogOrderWayNext}{else}{$sBlogOrderWay}{/if}" {if $sBlogOrder=='blog_title'}class="{$sBlogOrderWay}"{/if}><span>{$aLang.blogs_title}</span></a></div>
				</th>

				{if $oUserCurrent}
					<th class="cell-join">&nbsp;</th>
				{/if}

				<th class="cell-readers cell-tab">
					<div class="cell-tab-inner {if $sBlogOrder=='blog_count_topic'}active{/if}">
						<a href="{$sBlogsRootPage}?order=blog_count_topic&order_way={if $sBlogOrder=='blog_count_topic'}{$sBlogOrderWayNext}{else}{$sBlogOrderWay}{/if}" 
						{if $sBlogOrder=='blog_count_topic'}class="{$sBlogOrderWay}"{/if}>
							<span>{$aLang.infobox_blog_topics}</span>
						</a>
					</div>
				</th>

				<th class="cell-readers cell-tab">
					<div class="cell-tab-inner {if $sBlogOrder=='blog_count_user'}active{/if}"><a href="{$sBlogsRootPage}?order=blog_count_user&order_way={if $sBlogOrder=='blog_count_user'}{$sBlogOrderWayNext}{else}{$sBlogOrderWay}{/if}" {if $sBlogOrder=='blog_count_user'}class="{$sBlogOrderWay}"{/if}><span>{$aLang.blogs_readers}</span></a></div>
				</th>
			</tr>
		</thead>
	{else}
		<thead>
			<tr>
				<th class="cell-info">&nbsp;</th>
				<th class="cell-name cell-tab"><div class="cell-tab-inner"><span>{$aLang.blogs_title}</span></div></th>

				{if $oUserCurrent}
					<th class="cell-join">&nbsp;</th>
				{/if}

				<th class="cell-readers cell-tab"><div class="cell-tab-inner"><span>{$aLang.infobox_blog_topics}</span></div></th>
				<th class="cell-readers cell-tab"><div class="cell-tab-inner"><span>{$aLang.blogs_readers}</span></div></th>
			</tr>
		</thead>
	{/if}
	
	
	<tbody>
		{if $aBlogs}
			{foreach from=$aBlogs item=oBlog}
				{assign var="oUserOwner" value=$oBlog->getOwner()}

				<tr>
					<td class="cell-info">
						<a href="#" onclick="return ls.infobox.showInfoBlog(this,{$oBlog->getId()});" class="blog-list-info"></a>
					</td>
					<td class="cell-name">
						<p>
							<a href="{$oBlog->getUrlFull()}" class="blog-name">{$oBlog->getTitle()|escape:'html'}</a>
							
							{if $oBlog->getType() == 'close'}
								<i title="{$aLang.blog_closed}" class="icon-synio-topic-private"></i>
							{/if}
						</p>
						
						<span class="user-avatar">
							<a href="{$oUserOwner->getUserWebPath()}"><img src="{$oUserOwner->getProfileAvatarPath(24)}" alt="avatar" /></a>
							<a href="{$oUserOwner->getUserWebPath()}">{$oUserOwner->getLogin()}</a>
						</span>
					</td>

					{if $oUserCurrent}
						<td class="cell-join">
							{if $oUserCurrent->getId() != $oBlog->getOwnerId() and $oBlog->getType() == 'open'}
								<button type="submit"  onclick="ls.blog.toggleJoin(this, {$oBlog->getId()}); return false;" class="button button-action button-action-join {if $oBlog->getUserIsJoin()}active{/if}">
									<i class="icon-synio-join"></i>
									<span>{if $oBlog->getUserIsJoin()}{$aLang.blog_leave}{else}{$aLang.blog_join}{/if}</span>
								</button>
							{else}
								&mdash;
							{/if}
						</td>
					{/if}

					<td class="cell-readers" id="blog_topic_count_{$oBlog->getId()}">{$oBlog->getCountTopic()}</td>
					<td class="cell-readers" id="blog_user_count_{$oBlog->getId()}">{$oBlog->getCountUser()}</td>
				</tr>
			{/foreach}
		{else}
			<tr>
				<td colspan="5">
					{if $sBlogsEmptyList}
						{$sBlogsEmptyList}
					{else}

					{/if}
				</td>
			</tr>
		{/if}
	</tbody>
</table>