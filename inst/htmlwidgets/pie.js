HTMLWidgets.widget({
  name: 'pie',
  type: 'output',
  factory: function(el, width, height) {
    // empty chart (shared variable)
    var chart = null;
    return {
      renderValue: function(x) {
        if(chart === null){
          chart = c3.generate({
            bindto: el,
            data: {
              json: [],
              type: 'pie'
            },
            legend: {
              position: x.legendPosition
            }
          });
        }
        var old_keys = _.keys(chart.x());
        var new_keys = _.keys(x.values);
        var diff  = _.difference(old_keys,new_keys);

        // load new data
        chart.load({
          json:
          x.values,
          // unload unwanted data
          unload: diff
        });
      },
      resize: function(width, height) {
        // TODO: code to re-render the widget with a new size
      }
    };
  }
});
