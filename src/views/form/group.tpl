<div class="form-group{if $errors->has($name)} has-error{/if}">
    {form_label _name="password" class="col-sm-4 control-label"}
    {$label}
    {/form_label}
    <div class="col-sm-8">
        {block name="field"}{/block}
        {if $errors->has($name)}
            <div class="help-block">
                {$errors->first($name)}
            </div>
        {/if}
    </div>
</div>