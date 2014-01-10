%%%-------------------------------------------------------------------
%%% @author johhy <https://github.com/johhy>
%%% @copyright (C) 2014, johhy
%%% @doc Main ly_calculator module.
%%% This module provide arithmetic operations whith expressions as
%%% string.
%%% Return value possibly process to change to any type what is needs.  
%%%
%%% @end
%%% Created : 10 Jan 2014 by johhy <https://github.com/johhy>
%%%-------------------------------------------------------------------
-module(ly_calculator).

%% API
-export([do/1]).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc Calculator
%% @spec do(String::string()) -> {ok, Result::float()}
%%                               | {error, Error::any()}
%% @end
%%--------------------------------------------------------------------
do(String) ->
    try
	case rule:string(String) of
	{ok, Tokens, _} ->
		Res = gram:parse(Tokens),
		Res;
	{error, {_, _,{_, {malformed}}}, _} ->
		{error, malformed_expression}
        end
    catch
	_:Error ->
	    {error, Error}
    end.

%%%===================================================================
%%% Internal functions
%%%===================================================================
