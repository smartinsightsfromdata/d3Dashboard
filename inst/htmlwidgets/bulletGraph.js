HTMLWidgets.widget({

  name: "bulletGraph",

  type: "output",

  initialize: function(el, width, height) {

    d3.select(el).append("svg")
        .attr("width", width)
        .attr("height", height)
        .append("g");

    return d3.bullet();
  },

  renderValue: function(el, x) {

    // alias options
    var options = x.options;

    // get the width and height
    var width = el.offsetWidth;
    var height = el.offsetHeight;

    var margin = {top: 5, right: 40, bottom: 20, left: 120},
    width = 960 - margin.left - margin.right,
    height = 50 - margin.top - margin.bottom;

    var chart = d3.bullet()
    .width(width)
    .height(height);

    var root = JSON.parse(x.root);

    var svg = d3.select("body").selectAll("svg")
      .data(root)
    .enter().append("svg")
      .attr("class", "bullet")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
    .append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
      .call(chart);

  // set attributes ranges
  var ranges0 = svg.selectAll("rect.range.s0");
  ranges0.attr("fill", options.colRangeS0);

  var ranges1 = svg.selectAll("rect.range.s1");
  ranges1.attr("fill", options.colRangeS1);
  
  var ranges2 = svg.selectAll("rect.range.s2");
  ranges2.attr("fill", options.colRangeS2);

  // set attributes ranges
  var measures0 = svg.selectAll("rect.measure.s0");
  measures0.attr("fill", options.colMeasureS0);
  
  var measures1 = svg.selectAll("rect.measure.s1");
  measures1.attr("fill", options.colMeasureS1);
  
  // set ticks
  var ticks = svg.selectAll("line");
  ticks.attr("stroke", options.lineStroke)
      .attr("stroke-width", ".5px");
  
  // set attributes marker
  var marker = svg.selectAll("line.marker");
  marker.attr("stroke",  options.markerStroke)
      .attr("stroke-width", "2px");
      
  var text = svg.selectAll("text");
  text.attr("font-size", options.fontSize)
      .attr("font-family", "san-serif");

  var title = svg.append("g")
      .style("text-anchor", "end")
      .attr("transform", "translate(-6," + height / 2 + ")");

  title.append("text")
      .attr("class", "title")
      .attr("font-size", options.fontSizeTitle)
      .attr("font-weight", "bold")
      .attr("font-family", "san-serif")
      .text(function(d) { return d.title; });

  title.append("text")
      .attr("class", "subtitle")
      .attr("dy", "1em")
      .attr("fill", "#999")
      .attr("font-size", options.fontSize)
      .attr("font-family", "san-serif")
      .text(function(d) { return d.subtitle; });
  },
});
