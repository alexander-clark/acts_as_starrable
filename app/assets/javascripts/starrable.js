$(document).ready(function() {
  // $.getJSON('products/124.json', function(data) {
  //   $("div[data-productid=423]").attr('data-rateit-value', data.average_rating / 2);
  //   $("div[data-productid=423]").attr('data-rateit-ispreset', true);
  //   /*var items = [];
  //   $.each(data, function(key, val) {
  //     items.push('<li id=""' + key + '">' + val + '</li>');
  //   });*/
  // });

	$('.rateit').bind('rated reset', function (e) {
		console.log("hello");
		var ri = $(this);

	  //if the use pressed reset, it will get value: 0 (to be compatible with the HTML range control), we could check if e.type == 'reset', and then set the value to  null .
	  var value = ri.rateit('value');
	  var rateableID = ri.data('rateableid'); // if the product id was in some hidden field: ri.closest('li').find('input[name="productid"]').val()
		var stype = 'Gallery';

	  //maybe we want to disable voting?
	  //ri.rateit('readonly', true);

	  $.ajax({
	    url: '/starrable/ratings.json', //your server side script
	    data: { id: rateableID, value: value, stype: stype }, //our data
	    type: 'POST',
	    success: function (data) {
	      //$('#response').append('<li>' + data + '</li>');
	    },
	    error: function (jxhr, msg, err) {
	      //$('#response').append('<li style="color:red">' + msg + '</li>');
	    }
	  });
	});
});
