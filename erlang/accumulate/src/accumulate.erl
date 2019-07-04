-module(accumulate).

-export([accumulate/2]).

accumulate(_Fn, [], Accumulator) ->
    lists:reverse(Accumulator);
accumulate(Fn, [Head | Tail], Accumulator) ->
    accumulate(Fn, Tail, [Fn(Head) | Accumulator]).

accumulate(_Fn, []) ->
    [];
accumulate(Fn, List) ->
    accumulate(Fn, List, []).

