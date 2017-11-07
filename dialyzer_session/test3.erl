-module(test3).
-export([test/0, factorial/1]).

% Illustrate incorrect program logic
% dialyzer can deduce that the argument to factorial is of type non_neg_integer().
test() -> factorial(-5).

factorial(0) -> 1;
factorial(N) -> N * factorial(N-1).
