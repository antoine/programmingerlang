-module(attrs).
-vsn(12333).
-author({antoine, delauné}).
-export([fac/1]).

fac(1) -> 1;
fac(N) -> N * fac (N-1).
