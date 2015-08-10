-module(ex1p150).
-compile(export_all).

start(Atom, Fun) -> 
  try register(Atom, spawn(Fun) ) of
    true -> io:format("~p registered under ~p~n", [Fun, Atom])
  catch 
    error:_ -> {alreadyregistered, Atom, Fun}
  end.

test() ->
  start(test, fun loop/0),
  start(test, fun loop/0).

% this will wait, making sure our second call
% to register fails
loop() ->
  receive
    Any ->
      io:format("~p Received:~p~n", [erlang:now(), Any]),
      void
  end.
      

