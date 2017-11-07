-module(shop).
-export([cost/1, total/1, test/0]).

cost(orange) -> 5;
cost(newspaper) -> 8;
cost(apple) -> 2;
cost(pear) -> 9;
cost(milk) -> 7.

total([]) -> 0;
total([{Item, Amount}|NewList]) ->
    cost(Item) * Amount + total(NewList).

test() -> 
    test_total().

test_total() ->
    0 = total([]),
    58 = total([{orange, 8}, {apple, 5}, {newspaper, 1}]),
    31 = total([{orange, 1}, {apple, 1}, {newspaper, 1}, {pear, 1}, {milk, 1}]),
    test_total_pass.
