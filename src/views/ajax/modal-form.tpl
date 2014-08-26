{extends file="view:bootstrap-helper::ajax/modal"}

{block name="body"}{strip}
    {form class="form-horizontal" role="form"}
    {block name="form"}{/block}
    {/form}
{/strip}{/block}

{block name="append"}{strip}
    <script type="text/javascript">
        (function ($, undefined) {
            'use strict';

            var modal = $('#modal');

            modal.find('.btn-submit').on('click', function (event) {
                var form = modal.find('form');

                $(this).button('loading');
                modal.find('.modal-footer').find('.btn:not(.btn-submit)').prop('disabled', true);

                $.post(form.attr('action'), form.serialize())
                        .done(function (data) {
                                  console.log(data);
                                  if (data !== undefined && data.hasOwnProperty('success') && data.hasOwnProperty('content')) {
                                      modal.find('.modal-content').html(data.content);
                                      if (data.success) {
                                          setTimeout(function () {
                                              modal.modal('hide');
                                          }, 1500);
                                      }
                                      modal.trigger('reload.bs.modal');
                                  }
                              })
                        .fail(function (jqXHR) {
                                  if (jqXHR.hasOwnProperty('responseJSON') && jqXHR.responseJSON.hasOwnProperty('error')) {
                                      modal.find('.modal-header').find('h4').html(jqXHR.responseJSON.error.type);
                                      modal.find('.modal-body').html(
                                              '<span class="text-primary">' + jqXHR.responseJSON.error.message + '</span>' +
                                              '<br/>' +
                                              '<small class="text-muted"><strong>' + jqXHR.responseJSON.error.file + '</strong> at line <strong>' + jqXHR.responseJSON.error.line + '</strong></small>');
                                  } else {
                                      if (jqXHR.hasOwnProperty('responseText')) {
                                          console.log(jqXHR.responseText);
                                      }
                                      modal.find('.modal-body').html('<div class="alert alert-danger text-justify">{lang}base.modal.alert.ajax-error.content{/lang}</div>');
                                  }
                                  modal.find('.modal-footer').remove();
                                  modal.trigger('reload.bs.modal');
                              });
            });
        })(jQuery);
    </script>
{/strip}{/block}