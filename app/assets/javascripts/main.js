   $(document).ready(function() {
    $('.star-rating').raty({
      path: '/assets/',
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }

    });
  });
   $(document).ready(function() {
  
     $('#star-rating-meat').raty({
       path: '/assets/',
       scoreName: 'rating[meat_rating]'
     });
   });