ready = ->
  margin = { top: 30, right: 20, bottom: 30, left: 50 }
  width = 600 - margin.left - margin.right
  height = 300 - margin.top - margin.bottom
  parseDate = d3.time.format("%d-%b-%y").parse

  data = [1, 2, 2, 1]

  xScale = d3.scale.linear()
                   .domain([0, data.length])
                   .range([0, width])
  yScale = d3.scale.linear()
                   .domain([0, d3.max(data)])
                   .range([height, 0])


  svg = d3.select(".chart")
    .append("svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
    .append("g")
      .attr("transform",
            "translate(" + margin.left + "," + margin.top + ")")

  valueline = d3.svg.line()
                    .x( (d, i) ->
                      console.log(i)
                      console.log(xScale(i))
                      return xScale(i))
                    .y( (d) -> return yScale(d) )

  svg.append("path")
    .attr("class", "line")
    .attr("d", valueline(data))

$(document).on("turbolinks:load", ready)
