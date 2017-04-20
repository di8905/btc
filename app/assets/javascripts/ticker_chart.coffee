

@drawChart = (data) ->
  margin = { top: 30, right: 20, bottom: 30, left: 100 }
  width = 900 - margin.left - margin.right
  height = 300 - margin.top - margin.bottom


  xScale = d3.time.scale()
                   .domain(d3.extent(data, (d) -> return new Date(d.updated * 1000 )))
                   .range([0, width])

  yScale = d3.scale.linear()
                   .domain([d3.min(data, (d) -> return +d.value),
                            d3.max(data, (d) -> return +d.value)])
                   .range([height, 0])

  xAxis = d3.svg.axis().scale(xScale)

	        .orient("bottom").ticks(5);

  yAxis = d3.svg.axis().scale(yScale)
          .orient("left").ticks(5)

  svg = d3.select(".chart")
    .append("svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
    .append("g")
      .attr("transform",
            "translate(" + margin.left + "," + margin.top + ")")

  valueline = d3.svg.line()
                    .x( (d) ->
                      return xScale(d.updated * 1000))
                    .y( (d) ->
                      return yScale(d.value) )

  svg.append("path")
    .attr("class", "line")
    .attr("d", valueline(data))

  svg.append("g")
		.attr("class", "x axis")
		.attr("transform", "translate(0," + height + ")")
		.call(xAxis)

  svg.append("g")
        .attr("class", "y axis")
        .call(yAxis)

$(document).ready( -> drawChart(chartData))
