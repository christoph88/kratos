$(document).ready(function(){var i=$(".grid-boxes"),e=30,n=300;i.imagesLoaded(function(){i.masonry({itemSelector:".grid-boxes-in",gutterWidth:e,isAnimated:!0,columnWidth:function(i){var t=(i-2*e)/3|0;return n>t&&(t=(i-e)/2|0),n>t&&(t=i),$(".grid-boxes-in").width(t),t}})})});