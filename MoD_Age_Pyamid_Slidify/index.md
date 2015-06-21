---
title       : UK Armed Forces Age Statistics
subtitle    : Using Shiny and Slidify to display data interactively
author      : Ewan Keith
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
ext_widgets: {rCharts: [libraries/nvd3]}
mode        : selfcontained # {standalone, draft}
---

## Age of the UK Armed Forces

The British Ministry of Defence (MoD) Publishes Annual Statistics 
on the age  of it's military personnel.

These figures are reported in the MoD's 
*UK armed forces annual personnel report*. 

Recent reports can be found [here](
https://www.gov.uk/government/collections/uk-armed-forces-annual-manning-statistics-index)

--- 

## Available Breakdown

The published figures provide age data broken down by:

- Rank Type (Officer or Other Rank)
- Gender
- Service (Naval Services, Army or RAF)

This Shiny App did not focus on differences between services, 
although could easily be extended in order to do so. 

---

## Why use Shiny to display this data?

Shiny allows for the interactive display of both absolute 
numbers and relative percentage within gender depending 
on user input.

This helpfully illustrates both the age distributions within 
each rank *and* the large differences in total numbers between
men and woman at all ranks.

The age pyramids were produced using the NVD3 Javascript
library called via rCharts. Formatting and code were heavily 
borrowed from [Kyle Walker's blog post on age pyramids](
http://walkerke.github.io/2014/06/rcharts-pyramids/).

---

## Other options

Another option for display would have been to show Officers and Other ranks as the two sides to a single pyramid. See an example of this beow.


<div id = 'chart168864052e33' class = 'rChart nvd3'></div>
<script type='text/javascript'>
 $(document).ready(function(){
      drawchart168864052e33()
    });
    function drawchart168864052e33(){  
      var opts = {
 "dom": "chart168864052e33",
"width":    800,
"height":    400,
"x": "Age.group",
"y": "numbers",
"group": "rank.type",
"type": "multiBarHorizontalChart",
"title": "Age of Male Personnel by Rank Type",
"id": "chart168864052e33" 
},
        data = [
 {
 "Age.group": "Under 18",
"numbers":              0,
"gender": "male",
"percent":              0,
"rank.type": "officer" 
},
{
 "Age.group": "18-19",
"numbers":             30,
"gender": "male",
"percent":    0.001398314,
"rank.type": "officer" 
},
{
 "Age.group": "20-24",
"numbers":           1470,
"gender": "male",
"percent":    0.060621016,
"rank.type": "officer" 
},
{
 "Age.group": "25-29",
"numbers":           4300,
"gender": "male",
"percent":    0.177010076,
"rank.type": "officer" 
},
{
 "Age.group": "30-34",
"numbers":           4130,
"gender": "male",
"percent":    0.169689492,
"rank.type": "officer" 
},
{
 "Age.group": "35-39",
"numbers":           3650,
"gender": "male",
"percent":    0.149948591,
"rank.type": "officer" 
},
{
 "Age.group": "40-44",
"numbers":           4090,
"gender": "male",
"percent":    0.168167798,
"rank.type": "officer" 
},
{
 "Age.group": "45-49",
"numbers":           3980,
"gender": "male",
"percent":    0.163890603,
"rank.type": "officer" 
},
{
 "Age.group": "50 and over",
"numbers":           2660,
"gender": "male",
"percent":    0.109274111,
"rank.type": "officer" 
},
{
 "Age.group": "Under 18",
"numbers":          -1610,
"gender": "male",
"percent":    0.013509328,
"rank.type": "other.rank" 
},
{
 "Age.group": "18-19",
"numbers":          -5790,
"gender": "male",
"percent":    0.048454463,
"rank.type": "other.rank" 
},
{
 "Age.group": "20-24",
"numbers":         -29700,
"gender": "male",
"percent":    0.248574992,
"rank.type": "other.rank" 
},
{
 "Age.group": "25-29",
"numbers":         -29910,
"gender": "male",
"percent":    0.250382932,
"rank.type": "other.rank" 
},
{
 "Age.group": "30-34",
"numbers":         -22040,
"gender": "male",
"percent":    0.184443347,
"rank.type": "other.rank" 
},
{
 "Age.group": "35-39",
"numbers":         -15080,
"gender": "male",
"percent":    0.126204247,
"rank.type": "other.rank" 
},
{
 "Age.group": "40-44",
"numbers":          -9580,
"gender": "male",
"percent":    0.080218962,
"rank.type": "other.rank" 
},
{
 "Age.group": "45-49",
"numbers":          -4010,
"gender": "male",
"percent":    0.033564069,
"rank.type": "other.rank" 
},
{
 "Age.group": "50 and over",
"numbers":          -1750,
"gender": "male",
"percent":    0.014647661,
"rank.type": "other.rank" 
} 
]
  
      var data = d3.nest()
        .key(function(d){
          return opts.group === undefined ? 'main' : d[opts.group]
        })
        .entries(data)
      
      nv.addGraph(function() {
        var chart = nv.models[opts.type]()
          .x(function(d) { return d[opts.x] })
          .y(function(d) { return d[opts.y] })
          .width(opts.width)
          .height(opts.height)
         
        chart
  .xDomain([ "50 and over", "45-49", "40-44", "35-39", "30-34", "25-29", "20-24", "18-19", "Under 18" ])
  .stacked(true)
  .tooltipContent( function(key, x, y, e){
               var format = d3.format('0,000');
               return '<h3>' + key + ', age ' + x + '</h3>' + 
               '<p>' + 'Population: ' + y + '</p>'
    } )
  .margin({
 "left":     70,
"right":     40 
})
  .color([ "darkred", "silver" ])
  .showControls(false)
          
        

        
        
        chart.yAxis
  .axisLabel("Population")
  .tickFormat( function(d) {
               var format = d3.format('0,000');
               return format(Math.abs(d))
  } )
      
       d3.select("#" + opts.id)
        .append('svg')
        .datum(data)
        .transition().duration(500)
        .call(chart);

       nv.utils.windowResize(chart.update);
       return chart;
      });
      
      //add our title with html
      //might be better with svg
      d3.select("#" + opts.id).insert("h3","svg")
        .text(opts.title);
        //if desired, could change styling with css or with d3
        //some examples here http://tympanus.net/codrops/2012/11/02/heading-set-styling-with-css/
        //will use example
        //.style("float","right");
        //.style("text-shadow", "0 -1px 1px rgba(0,0,0,0.4)")
        //.style("font-size","22px")
        //.style("line-height", "40px")
        //.style("color", "#355681")
        //.style("ext-transform", "uppercase")
        //.style("border-bottom", "1px solid rgba(53,86,129, 0.3)");
    };
</script>
