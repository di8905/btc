

@drawChart = (data) ->
  margin = { top: 30, right: 20, bottom: 30, left: 50 }
  width = 600 - margin.left - margin.right
  height = 300 - margin.top - margin.bottom
  parseDate = d3.time.format("%d-%b-%y").parse

  xScale = d3.scale.linear()
                   .domain([d3.min(data, (d) -> return d.updated),
                            d3.max(data, (d) -> return d.updated)])
                   .range([0, width])
  yScale = d3.scale.linear()
                   .domain([d3.min(data, (d) -> return d.value),
                            d3.max(data, (d) -> return d.value)])
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
                      return xScale(d.updated))
                    .y( (d) ->
                      return yScale(d.value) )

  svg.append("path")
    .attr("class", "line")
    .attr("d", valueline(data))

$(document).on("turbolinks:load", -> drawChart(data))
