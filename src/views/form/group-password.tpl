{extends file="view:bootstrap-helper::form/group"}

{block name="field"}{strip}
    {if isset($index)}
        {form_password _name=$name class="form-control" data-index={$index}}
    {else}
        {form_password _name=$name class="form-control"}
    {/if}
{/strip}{/block}