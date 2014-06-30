-module(queens).

%% API
-export([q/1]).

q(0) -> [[]];
q(N) -> [[{N,C} | Colums] || C <- [1,2,3,4,5,6,7,8], Colums <- q(N-1), safe(N,C,Colums)].

safe(_, _, []) -> true;
safe(R, C, [{X,Y} | Pairs]) -> R /= X andalso C /= Y andalso erlang:abs(R - X) /= erlang:abs(C - Y) andalso safe(R, C, Pairs).
