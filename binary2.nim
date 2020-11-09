## A binary clock in Nim using SDL2 (fully binary)

import sdl2, times, os, strutils

discard sdl2.init(INIT_EVERYTHING)

var
  window: WindowPtr
  render: RendererPtr

window = createWindow("binary2", 100, 100, 600, 300, SDL_WINDOW_SHOWN)
render = createRenderer(window, -1, Renderer_Accelerated or
    Renderer_PresentVsync or Renderer_TargetTexture)

var
  evt = sdl2.defaultEvent
  runGame = true
  r: Rect

r.w = 80
r.h = 80

while runGame:
  let
    d = now()
    h = d.hour
    m = d.minute
    s = d.second
    b = [toBin(h, 6), toBin(m, 6), toBin(s, 6)]
  while pollEvent(evt):
    if evt.kind == QuitEvent:
      runGame = false
      break
  render.setDrawColor(0, 0, 0, 255)
  render.clear

  for y in 0..2:
    for x in 0..5:
      if x == 0 and y == 0:
        continue
      if int(b[y][x]) > 48:
        render.setDrawColor(255, 136, 0, 255)
      else:
        render.setDrawColor(0, 85, 170, 255)
      r.x = 10 + 100 * cint(x)
      r.y = 10 + 100 * cint(y)
      render.fillRect(r)

  render.present
  sleep(100)

destroy render
destroy window

