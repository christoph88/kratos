/**
 * Base js functions
 */

$(document).ready(function(){
    var $container = $('.grid-boxes');

    $container.imagesLoaded( function(){
        $container.masonry({
            itemSelector : '.grid-boxes-in',
            percentPosition: true,
            gutter: '.grid-gutter',
            columnWidth: '.grid-sizer'
        });
    });
});
