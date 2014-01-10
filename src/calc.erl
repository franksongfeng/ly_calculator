%%%-------------------------------------------------------------------
%%% @author johhy <https://github.com/johhy>
%%% @copyright (C) 2014, johhy
%%% @doc Main ly_calculator module.
%%% This module calculate expressions input as string and
%%% returned tuple. 
%%%
%%% @end
%%% Created : 10 Jan 2014 by johhy <https://github.com/johhy>
%%%-------------------------------------------------------------------
-module(calc).

%% API
-export([do/1]).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc Run function to calculate expression
%% @spec do(String::string()) -> {ok, Result::float()}
%%                               | {error, Error::any()}
%% @end
%%--------------------------------------------------------------------
do(String) ->
    try
	{ok, Tokens, _} = rule:string(String),
	Res = gram:parse(Tokens),
	Res
    catch
	_:Error ->
	    {error, Error}
    end.
%%%===================================================================
%%% Internal functions
%%%===================================================================
