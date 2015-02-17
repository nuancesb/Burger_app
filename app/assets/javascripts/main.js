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

     $('#star-rating-cheese').raty({
       path: '/assets/',
       scoreName: 'rating[cheese_rating]'
     });

     $('#star-rating-toppings').raty({
            path: '/assets/',
            scoreName: 'rating[toppings_rating]'
          });

     $('#star-rating-bun').raty({
            path: '/assets/',
            scoreName: 'rating[bun_rating]'
          });
   });