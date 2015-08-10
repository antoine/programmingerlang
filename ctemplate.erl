-module(ctemplate).
%-compile(export_all).
-export([start/0, rpc/2]).

%start() -> spawn(fun loop/1).
start() -> spawn(fun() -> loop([]) end).

rpc(Pid, Request) ->
  Pid ! {self(), Request},
  receive
    {Pid, Response} ->
      Response
  after 5000 ->
    io:format("no answer received in time~n")
  end.

loop(X) ->
  receive
    Any ->
      io:format("Received:~p~n", [Any]),
      loop(X)
  end.
      

