## A binary clock in Nim using SDL2

import sdl2, times, os, math

discard sdl2.init(INIT_EVERYTHING)

var
  window: WindowPtr
  render: RendererPtr

window = createWindow("binary", 100, 100, 600, 400, SDL_WINDOW_SHOWN)
render = createRenderer(window, -1, Renderer_Accelerated or
    Renderer_PresentVsync or Renderer_TargetTexture)

var
  evt = sdl2.defaultEvent
  runGame = true
  r: Rect

r.w = 80
r.h = 80

let rmax = [2, 4, 3, 4, 3, 4]

while runGame:
  let d = now().format("HHmmss")
  while pollEvent(evt):
    if evt.kind == QuitEvent:
      runGame = false
      break
  render.setDrawColor(0, 0, 0, 255)
  render.clear

  for y in 0..3:
    for x in 0..5:
      if y >= rmax[x]:
        continue
      if (int(d[x]) - 48 and 2^y) > 0:
        render.setDrawColor(255, 136, 0, 255)
      else:
        render.setDrawColor(0, 85, 170, 255)
      r.x = 10 + 100 * cint(x)
      r.y = 310 - 100 * cint(y)
      render.fillRect(r)

  render.present
  sleep(100)

destroy render
destroy window

