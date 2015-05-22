stackgrid = new Stackgrid

window.onload = ->
  stackgrid.config.column_width = 220
  stackgrid.config.gutter = 20
  stackgrid.config.is_fluid = false

  stackgrid.config.move = (item, left, top, callback) ->
    Velocity item,
      left: left
      top: top,
      queue: false
      duration: 200,
      callback

  stackgrid.config.scale = (container, width, height, callback) ->
    Velocity container,
      height: height
      width: width,
      queue: false
      duration: 200,
      callback

  stackgrid.initialize '.grid-container', '.grid-item'
  return

grid =
  $container: undefined
  $items: undefined

grid.remove_item = ->
  grid.$container.removeChild this
  stackgrid.reset()
  stackgrid.restack()
  return

(grid.update = ->
  grid.$container = document.querySelector '.grid-container'
  grid.$items = document.querySelectorAll '.grid-item'
  item.addEventListener 'click', grid.remove_item for item in grid.$items
  return
)()

grid.append = (url) ->
  grid_item = document.createElement 'div'
  grid_item.setAttribute 'class', 'grid-item'
  grid_item.innerHTML =  "<img src=\"#{url}\" alt=\"\">"
  onimgload url, ->
    grid.$container.appendChild grid_item
    grid.update()
    stackgrid.append grid_item
  return

buttons = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'eleven', 'twelve', 'thirteen']
button = {}
for i in buttons
  button[i] = document.querySelector ".control-button.-#{i}"

button.one.onclick = (-> grid.append 'img/short.jpg' )
button.two.onclick = (-> grid.append 'img/medium.jpg' )
button.three.onclick = (-> grid.append 'img/tall.jpg' )

button.four.onclick = ->
  stackgrid.config.gutter = 20
  stackgrid.restack()
  return

button.five.onclick = ->
  stackgrid.config.gutter = 0
  stackgrid.restack()
  return

button.six.onclick = ->
  stackgrid.config.is_optimized = true
  stackgrid.restack()
  return

button.seven.onclick = ->
  stackgrid.config.is_optimized = false
  stackgrid.restack()
  return

button.eight.onclick = ->
  stackgrid.config.is_fluid = true
  stackgrid.restack()
  return

button.nine.onclick = ->
  stackgrid.config.is_fluid = false
  stackgrid.restack()
  return

button.ten.onclick = ->
  grid.$container.removeChild item for item in grid.$items
  stackgrid.reset()
  stackgrid.restack()
  return

button.eleven.onclick = ->
  stackgrid.config.column_width = 320
  stackgrid.reset()
  stackgrid.restack()
  return

button.twelve.onclick = ->
  stackgrid.config.column_width = 220
  stackgrid.reset()
  stackgrid.restack()
  return

button.thirteen.onclick = ->
  stackgrid.config.column_width = 120
  stackgrid.reset()
  stackgrid.restack()
  return