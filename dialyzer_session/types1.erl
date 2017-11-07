-module(types1).
-export([f1/1, f2/1, f3/1]).

% type inference: A process of deriving the types of a function by analyzing
%                 the code.
% success typing: The types that the arguments in a function had to have in
%                 order for the function evaluation to succeed.

f1({H, M, S}) ->
    (H + M * 60) * 60 + S.

f2({H, M, S}) when is_integer(H) ->
    (H + M * 60) * 60 + S.

f3({H, M, S}) ->
    print(H, M, S),
    (H + M * 60) * 60 + S.

print(H, M, S) ->
    Str = integer_to_list(H) ++ ":" ++ integer_to_list(M) ++ ":" ++
        integer_to_list(S),
    io:format("~s", [Str]).
