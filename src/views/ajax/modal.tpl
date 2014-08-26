{strip}
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">
            <span aria-hidden="true">&times;</span><span class="sr-only">{lang}base.modal.btn.close.content{/lang}</span>
        </button>

        <h4 class="modal-title">
            {block name="title"}{/block}
        </h4>
    </div>
    <div class="modal-body">
        {block name="body"}{/block}
    </div>
    {block name="footer" hide}
        <div class="modal-footer">
            {$smarty.block.child}
        </div>
    {/block}
    {block name="append"}{/block}
{/strip}