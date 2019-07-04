-module(series).

-export([slices/2]).





slices([], Accumulator, Prefix) ->
    ;
slices([Head | Series], Accumulator, Prefix) ->
    Accumulator1 = [string:reverse(Prefix) | Accumulator],
    slices(Series, Accumulator1, [Head | Prefix]).

grow_prefix(SliceLength, [Head | Series], Prefix, PrefixLength) when PrefixLength < SliceLength ->
    grow_prefix(SliceLength, Series, [Head | Prefix]);
grow_prefix(SliceLength, [SeriesHead | SeriesTail], Prefix, PrefixLength) ->
    slices(SliceLength, SeriesTail, [], Prefix).

slices(_SliceLength, _Series) -> undefined.
