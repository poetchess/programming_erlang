-module(test2).
-export([f1/0]).

% Illustrate incorrect arguments to a BIF.
f1() ->
    tuple_size(list_to_tuple({a, b, c})).
