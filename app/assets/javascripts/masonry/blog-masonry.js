/**
 * Base js functions
 */

$(document).ready(function(){
    var $container = $('.grid-boxes');

    //var gutter = 30;
    //var min_width = 300;
    $container.imagesLoaded( function(){
        $container.masonry({
            itemSelector : '.grid-boxes-in',
            gutterWidth: '.grid-boxes-gutter',
            isAnimated: true,
            columnWidth: '.grid-boxes-in'
          
          //function( containerWidth ) {
                //var box_width = (((containerWidth - 2*gutter)/3) | 0) ;
                // (1000 - 60)/3 = 940/3 = 313
                // (x-60)/3 = 300
                // x-60 = 300*3 = 900
                // x = 960

                //if (box_width < min_width) {
                    //box_width = (((containerWidth - gutter)/2) | 0);
                    // 960-30 /2 = 960/2 = 480
                //}

                //if (box_width < min_width) {
                    //box_width = containerWidth;
                //}

                //$('.grid-boxes-in').width(box_width);

                //return box_width;
              //}
        });
    });
});
