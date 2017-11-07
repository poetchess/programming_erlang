-module(limit).
-export([myand1/2, bug1/2]).

% Limitations of the type system.
% typer and dialyzer both report ok, but calling bug1(1.0, 2.0) will make the 
% function crash. It indicates that under-specification of the types of the
% arguments leads to errors that could not be detected when the program was
% analyzed.

myand1(true, true) -> true;
myand1(false, _) -> false;
myand1(_, false) -> false.

bug1(X, Y) ->
    case myand1(X, Y) of 
        true ->
            X + Y
    end.
