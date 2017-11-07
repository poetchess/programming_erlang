-module(geometry).
-export([area/1, test/0]).

area({rectangle, Width, Height}) -> Width * Height;
area({square, Side}) -> Side * Side.

test_area() ->
    200 = area({rectangle, 10, 20}),
    36 = area({rectangle, 6, 6}),
    0 = area({rectangle, 0, 6}),
    0 = area({rectangle, 6, 0}),
    0 = area({rectangle, 0, 0}),
    49 = area({square, 7}),
    0 = area({square, 0}),
    test_area_pass.


test() -> 
    test_area().
