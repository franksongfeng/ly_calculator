%%%-------------------------------------------------------------------
%%% @author johhy <https://github.com/johhy>
%%% @copyright (C) 2014, johhy
%%% @doc Module for test
%%%
%%% @end
%%% Created : 10 Jan 2014 by johhy <https://github.com/johhy>
%%%-------------------------------------------------------------------
-module(calc_tests).

-compile(export_all).

-include_lib("eunit/include/eunit.hrl").

test_error() ->
    [?_assertMatch({error, _}, calc:do("rrrr")),
    ?_assertMatch({error, _}, calc:do("-5g")),
    ?_assertMatch({error, _}, calc:do("1/0"))].

test_no_error() ->
    [?_assertEqual({ok, 12.0}, calc:do("7+5")),
    ?_assertEqual({ok, 8.0}, calc:do("5+3")),
    ?_assertEqual({ok, 4.0}, calc:do("-5+9")),
    ?_assertEqual({ok, 6.0}, calc:do("+3*2"))].

all_test_() ->
    [test_error(), test_no_error()].
    
