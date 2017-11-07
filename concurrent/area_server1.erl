-module(area_server1).
-export([loop/0, rpc/2]).

% There is one problem: we do not wait for a response from the server,
% we wait for any message.
rpc(Pid, Request) ->
    Pid ! {self(), Request},
    receive
        Response ->
            Response
    end.

loop() ->
    receive
        {From, {rectangle, Width, Ht}} ->
            From ! Width * Ht,
            loop();
        {From, {circle, R}} ->
            From ! 3.14159 * R * R,
            loop();
        {From, {square, Side}} ->
            From ! Side * Side,
            loop();
        {From, Other} ->
            From ! {error, Other},
            loop()
    end.
