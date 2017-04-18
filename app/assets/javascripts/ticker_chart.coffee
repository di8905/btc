
@data = [{'time': 1, 'val': 1 },
        {'time': 2, 'val': 2 },
        {'time': 3, 'val': 1 },
        {'time': 4, 'val': 1 }]

@drawChart = (data) ->
  margin = { top: 30, right: 20, bottom: 30, left: 50 }
  width = 600 - margin.left - margin.right
  height = 300 - margin.top - margin.bottom
  parseDate = d3.time.format("%d-%b-%y").parse

  xScale = d3.scale.linear()
                   .domain([d3.min(data, (d) -> return d.time),
                            d3.max(data, (d) -> return d.time)])
                   .range([0, width])
  yScale = d3.scale.linear()
                   .domain([0,
                            d3.max(data, (d) -> return d.val)])
                   .range([height, 0])

  svg = d3.select(".chart")
    .append("svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
    .append("g")
      .attr("transform",
            "translate(" + margin.left + "," + margin.top + ")")

  valueline = d3.svg.line()
                    .x( (d) ->
                      return xScale(d.time))
                    .y( (d) ->
                      return yScale(d.val) )

  svg.append("path")
    .attr("class", "line")
    .attr("d", valueline(data))

$(document).on("turbolinks:load", -> drawChart(data))
