%%%-------------------------------------------------------------------
%%% @author johhy <https://github.com/johhy>
%%% @copyright (C) 2014, johhy
%%% @doc
%%%
%%% @end
%%% Created : 10 Jan 2014 by johhy <https://github.com/johhy>
%%%-------------------------------------------------------------------
-module(ly_calculator_tests).

-compile(export_all).

-include_lib("eunit/include/eunit.hrl").

test_error() ->
    [?_assertMatch({error, _}, ly_calculator:do("rrrr")),
    ?_assertMatch({error, _}, ly_calculator:do("-5g")),
    ?_assertMatch({error, _}, ly_calculator:do("1/0"))].

test_no_error() ->
    [?_assertEqual({ok, 12.0}, ly_calculator:do("7+5")),
    ?_assertEqual({ok, 8.0}, ly_calculator:do("5+3")),
    ?_assertEqual({ok, 4.0}, ly_calculator:do("-5+9")),
    ?_assertEqual({ok, 6.0}, ly_calculator:do("+3*2"))].

all_test_() ->
    [test_error(), test_no_error()].
    
