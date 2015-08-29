-module(ex2p150).
%-compile(export_all).
-export([buildring/1]).

%usage  ex2p150:buildring(3) ! 10.

buildring(N) ->
  io:format("registering ring as: ring~n"),
  register(ring, spawn(fun() -> message(N, ring(N-1)) end)),
  ring.

ring(N) ->
  case N of 
    1 ->
      io:format("creating last ring member~n"),
      spawn(fun() -> message(N) end);
    _ ->
      io:format("creating ring member~n"),
      spawn(fun() -> message(N, ring(N-1)) end)
  end.

message(N, Next) ->
  receive
    M ->
      io:format("~p:~p~n", [N, M]),
      Next ! M,
      message(N, Next)
  end.

message(N) ->
  receive
    1 ->
      io:format("~p:1~nstop on last ring member~n", [N]),
      unregister(ring);
    M ->
      io:format("~p:~p~n", [N, M]),
      ring ! M-1,
      message(N)
  end.


