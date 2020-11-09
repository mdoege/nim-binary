## A binary clock in Nim using SDL2

"binary.nim" uses vertical binary numbers to show time as six decimal digits (aka binary-coded decimal); "binary2.nim" is fully binary and shows horizontal binary numbers for hours, minutes and seconds.

Compile with

```nim c binary``` and ```nim c binary2```

Window size is fixed at 600x400 pixels and 600x300 pixels, respectively.

### BCD/decimal digit-based clock

Each column of lights corresponds to a digit of decimal time.

The time in the screenshot is 21:40:58.

![screenshot](https://github.com/mdoege/nim-binary/raw/master/screenshot.png "nim-binary screenshot")

### Full binary clock

The rows indicate hours, minutes and seconds in binary, with the most significant bit first.

The time in the screenshot is 18:21:29.

![screenshot](https://github.com/mdoege/nim-binary/raw/master/screenshot2.png "nim-binary2 screenshot")
