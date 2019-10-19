-module(anagram).

-include_lib("eunit/include/eunit.hrl").

-export([find_anagrams/2]).

%% Handling 12_words_are_not_anagrams_of_themselves_case_insensitive_test means we have to call
%% string:lowercase(C) twice in this solution.
%%
%% find_anagrams(Subject, Candidates) -> 
%%     SubjLowercase = string:lowercase(Subject),
%%     SubjLetterCount = count_letters(SubjLowercase),
%%     [
%%      C || C <- Candidates,
%%           string:lowercase(C) /= SubjLowercase,
%%           SubjLetterCount == count_letters(string:lowercase(C))
%%     ].

find_anagrams(Subject, Candidates) -> 
    SubjLowercase = string:lowercase(Subject),
    SubjLetterCount = count_letters(SubjLowercase),
    find_anagrams(SubjLowercase, SubjLetterCount, Candidates, []).

find_anagrams(SubjLowercase, SubjLetterCount, [Candidate|Tail], Acc) -> 
    CandLowerCase = string:lowercase(Candidate),
    Acc1 = case (SubjLowercase /= CandLowerCase) and (count_letters(CandLowerCase) == SubjLetterCount) of
        true -> [Candidate | Acc];
        _ -> Acc
    end,
    find_anagrams(SubjLowercase, SubjLetterCount, Tail, Acc1);
find_anagrams(_SubjLowercase, _SubjLetterCount, [], Acc) -> 
    Acc.

count_letters(Word) ->
    count_letters(Word, #{}).

count_letters([Letter | Rest], Counts) ->
    LetterCount = maps:get(Letter, Counts, 0) + 1,
    NewCounts = maps:put(Letter, LetterCount, Counts),
    count_letters(Rest, NewCounts);
count_letters([], Counts) ->
    Counts.


%% tests for private functions
-ifdef(EUNIT).

count_test_() ->
    [
     ?_assertEqual(#{}, count_letters("")),
     ?_assertEqual(#{$f=>1, $o=>2}, count_letters("foo"))
    ].

-endif.
