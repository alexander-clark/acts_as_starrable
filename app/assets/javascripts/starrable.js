$(document).ready(function() {
  console.log('r: ' + window.rating);
  $('.rateit').bind('reset', function(e) {
    var ri = $(this);

    $.ajax({
      url: '/ratings/' + window.rating + '.json',
      type: 'DELETE',
      success: function(data) {
        window.rating = null;
        ri.rateit('resetable', false);
      }
    });
  });

  $('.rateit').bind('rated', function(e) {
    var ri = $(this);

    var value = ri.rateit('value');
    var rateableID = ri.data('rateableid');
    var stype = window.starrable_type;
    if (window.rating != null) {
      $.ajax({
        url: '/ratings/' + window.rating + '.json',
        data: { value: value },
        type: 'PUT'
      });
    } else {
      $.ajax({
        url: '/ratings.json',
        data: { id: rateableID, value: value, stype: stype, rid: window.rater,
                rtype: window.rater_type },
        type: 'POST',
        success: function(data) {
          window.rating = data['id'];
          ri.rateit('resetable', true);
        }
      });
    }
  });
});
