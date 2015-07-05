-module(lib_misc).
-export([sum/1]).
-export([for/3]).
-export([perms/1]).
-export([odds_and_event_acc/1]).

sum(L) -> sum(L,0).

sum([],N) -> N;
sum([H|T], N) -> sum(T, N+H).

for(Max,Max,F) -> [F(Max)];
for(I,Max,F) -> [F(I)|for(I+1,Max,F)].

perms([]) -> [[]];
perms(L) -> [[H|T] || H <- L, T <- perms(L--[H])].

odds_and_event_acc(L) ->
  odds_and_event_acc(L, [], []).

odds_and_event_acc([H|T], O, E) ->
  case H rem 2 of
    1 -> odds_and_event_acc(T, [H|O],E);
    0 -> odds_and_event_acc(T, O, [H|E])
  end;
odds_and_event_acc([], O, E) ->
  {lists:reverse(O),lists:reverse(E)}.

