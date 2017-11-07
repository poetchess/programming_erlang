-module(count_chars).
-export([count_chars/1]).
-import(maps, [find/2, update/3, put/3]).

% Please refer https://pragprog.com/titles/jaerlang2/errata?utf8=%E2%9C%93&what_to_show=1626

count_chars(Str) ->
    count_chars(Str, #{}).
    
count_chars([H|T], X) ->
    count_chars(T, case maps:find(H, X) of
        {ok, N} -> maps:update(H, N+1, X);
        error -> maps:put(H, 1, X)
        end);

count_chars([], X) ->
    X.
