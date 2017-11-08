-module(lib_misc).
-export([for/3, odds_and_evens/1, sleep/1, flush_buffer/0, priority_receive/0]).


% Simulate the for loop.
for(Max, Max, F) -> [F(Max)];
for(I, Max, F) -> [F(I)|for(I+1, Max, F)].

% Return two lists containing odd and even numbers respectively.
% Only iterate the list once.
odds_and_evens(L) ->
    odds_and_evens_impl(L, [], []).

odds_and_evens_impl([], Odds, Evens) ->
    {lists:reverse(Odds), lists:reverse(Evens)};

odds_and_evens_impl([H|T], Odds, Evens) ->
    case (H rem 2) of
        1 -> odds_and_evens_impl(T, [H|Odds], Evens);
        0 -> odds_and_evens_impl(T, Odds, [H|Evens])
    end.

% sleep() using receive with timeout
sleep(T) ->
    receive
    after T ->
        true
    end.


% empty the mailbox using receive with timeout value of zero
flush_buffer() ->
    receive
        _Any ->
            flush_buffer()
    after 0 ->
        true
    end.

% priority receive using receive with timeout value of zero
% using large mailbox with priority receive is rather inefficient
priority_receive() ->
    receive
        {alarm, X} ->
            {alarm, X}
    after 0 ->
        receive
            Any ->
                Any
        end
    end.
