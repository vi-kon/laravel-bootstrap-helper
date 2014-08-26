{extends file="view:bootstrap-helper::ajax/modal"}


{block name="title"}
    {$title}
{/block}


{block name="body"}{strip}
    <div class="alert alert-{block name="type"}{$type|default:"info"}{/block} text-justify">
        {block name="message"}{$message}{/block}
    </div>
{/strip}{/block}
