// $Id$

(function ($) {

Drupal.behaviors.tableOfContents = {
  attach: function (context, settings) {
    $('.toc:has(.toc-toggle-message)', context)
      .once('ebay_ckeditor_tableofcontents')
      .each(function(){
        var self = $(this);
        if (settings.ebay_ckeditor_tableofcontents.collapse) {
          $('.toc-list', self).hide();
          label = Drupal.t('show');
        }
        else {
          label = Drupal.t('hide');
        }
        $('.toc-toggle-message', self).html(' [<a href="#" class="toc-toggle">' + label + '</a>]');
    
        // allow toggling
        $('a.toc-toggle', self).click(function() {
          $('.toc-list', self).slideToggle();
          var text = $(this).text();
          if (text == Drupal.t('hide')) {
            $(this).text(Drupal.t('show'));
          }
          else {
            $(this).text(Drupal.t('hide'));
          }
          return false;
        });
        
      });

    // if available, do localScroll
    if (settings.ebay_ckeditor_tableofcontents.scroll && $.localScroll) {
      $('.toc-list, .toc-back-to-top', context)
        .once('ebay_ckeditor_tableofcontents')
        .localScroll({ hash: true });
    }
    
  }
}

})(jQuery);
