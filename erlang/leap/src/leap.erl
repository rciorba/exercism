-module(leap).

-export([leap_year/1]).


leap_year(Year) -> 
    By4 = (Year rem 4) =:= 0,
    By100 = (Year rem 100) =:= 0,
    By400 = (Year rem 400) =:= 0,
    case {By4, By100, By400} of
        {true, true, true} -> true;
        {true, false, _} -> true;
        _ -> false
    end.
