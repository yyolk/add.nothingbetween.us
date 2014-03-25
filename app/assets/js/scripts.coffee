# Apache 2.0 J Chris Anderson 2011
# friendly helper http://tinyurl.com/6aow6yn
checkImg = (str) ->
  pattern = new RegExp(/\.(gif|jpg|jpeg|tiff|png)$/i)
  if pattern.test(str)
    true
  else
    false
drawItems = ->
  db.view "nothingbetweenus/recent-items",
    descending: "true"
    limit: 77
    update_seq: true
    success: (data) ->
      setupChanges data.update_seq
      them = $.mustache($("#recent-messages").html(),
        items: data.rows.map((r) ->
          r.value
        )
      )
      $("#content").html them
      return

  return
drawLatest = ->
  db.view "nothingbetweenus/recent-items",
    descending: "true"
    limit: 10
    update_seq: true
    success: (data) ->
      setupChanges data.update_seq
      them = $.mustache($("#recent-messages").html(),
        items: data.rows.map((r) ->
          r.value
        )
      )
      $("#content").html them
      return

  return
setupChanges = (since) ->
  unless changesRunning
    changeHandler = db.changes(since)
    changesRunning = true
    changeHandler.onChange drawItems
  return
window.randomColor = ->
  colors = [
    "aqua"
    "aliceblue"
    "antiquewhite"
    "black"
    "blue"
    "cyan"
    "darkblue"
    "darkcyan"
    "darkgreen"
    "darkturquoise"
    "deepskyblue"
    "green"
    "lime"
    "mediumblue"
    "mediumspringgreen"
    "navy"
    "springgreen"
    "teal"
    "midnightblue"
    "dodgerblue"
    "lightseagreen"
    "forestgreen"
    "seagreen"
    "darkslategray"
    "darkslategrey"
    "limegreen"
    "mediumseagreen"
    "turquoise"
    "royalblue"
    "steelblue"
    "darkslateblue"
    "mediumturquoise"
    "indigo"
    "darkolivegreen"
    "cadetblue"
    "cornflowerblue"
    "mediumaquamarine"
    "dimgray"
    "dimgrey"
    "slateblue"
    "olivedrab"
    "slategray"
    "slategrey"
    "lightslategray"
    "lightslategrey"
    "mediumslateblue"
    "lawngreen"
    "aquamarine"
    "chartreuse"
    "gray"
    "grey"
    "maroon"
    "olive"
    "purple"
    "lightskyblue"
    "skyblue"
    "blueviolet"
    "darkmagenta"
    "darkred"
    "saddlebrown"
    "darkseagreen"
    "lightgreen"
    "mediumpurple"
    "darkviolet"
    "palegreen"
    "darkorchid"
    "yellowgreen"
    "sienna"
    "brown"
    "darkgray"
    "darkgrey"
    "greenyellow"
    "lightblue"
    "paleturquoise"
    "lightsteelblue"
    "powderblue"
    "firebrick"
    "darkgoldenrod"
    "mediumorchid"
    "rosybrown"
    "darkkhaki"
    "silver"
    "mediumvioletred"
    "indianred"
    "peru"
    "chocolate"
    "tan"
    "lightgray"
    "lightgrey"
    "thistle"
    "goldenrod"
    "orchid"
    "palevioletred"
    "crimson"
    "gainsboro"
    "plum"
    "burlywood"
    "lightcyan"
    "lavender"
    "darksalmon"
    "palegoldenrod"
    "violet"
    "azure"
    "honeydew"
    "khaki"
    "lightcoral"
    "sandybrown"
    "beige"
    "mintcream"
    "wheat"
    "whitesmoke"
    "ghostwhite"
    "lightgoldenrodyellow"
    "linen"
    "salmon"
    "oldlace"
    "bisque"
    "blanchedalmond"
    "coral"
    "cornsilk"
    "darkorange"
    "deeppink"
    "floralwhite"
    "fuchsia"
    "gold"
    "hotpink"
    "ivory"
    "lavenderblush"
    "lemonchiffon"
    "lightpink"
    "lightsalmon"
    "lightyellow"
    "magenta"
    "mistyrose"
    "moccasin"
    "navajowhite"
    "orange"
    "orangered"
    "papayawhip"
    "peachpuff"
    "pink"
    "red"
    "seashell"
    "snow"
    "tomato"
    "white"
    "yellow"
  ]
  colors[Math.floor(Math.random() * colors.length)]
window.randomBorderStyle = ->
  borders = [
    "dotted"
    "dashed"
    "solid"
    "double"
    "groove"
    "ridge"
    "inset"
    "outset"
  ]
  borders[Math.floor(Math.random() * borders.length)]
window.createStyle = ->
  window.style = "background-color:" + window.randomColor() + ";border:" + Math.floor(Math.random() * 2 + 3) + "px " + window.randomBorderStyle() + " " + window.randomColor() + ";"
  window.styleEntry()
  return
window.styleEntry = ->
  sessionStorage["style"] = window.style
  $("#entry").attr "style", window.style
  return
$.fn.serializeObject = ->
  o = {}
  a = @serializeArray()
  $.each a, ->
    if o[@name]
      o[@name] = [o[@name]]  unless o[@name].push
      o[@name].push @value or ""
    else
      o[@name] = @value or ""
    return

  o

window.style = ""
unless sessionStorage["style"]
  sessionStorage["style"] = window.createStyle()
else
  window.style = sessionStorage["style"]
window.styleEntry()
$("#new-style #randomize").click (e) ->
  window.createStyle()
  return

return
