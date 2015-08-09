-module(area_server0).
-export([loop/0]).

loop() ->
  receive
    {rectangle, Width, Ht} ->
      io:format("Area of rectangle is ~p~n", [Width * Ht]),
      loop();
    {circle, R} ->
      io:format("Area of circle is ~p~n", [R * 3.14159]),
      loop();
    Other ->
      io:format("no idea what the format of ~p is~n", [Other]),
      loop()
  end.
      

