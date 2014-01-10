%%%-------------------------------------------------------------------
%%% @author johhy <https://github.com/johhy>
%%% @copyright (C) 2014, johhy
%%%
%%% Created : 10 Jan 2014 by johhy <https://github.com/johhy>
%%%-------------------------------------------------------------------

Definitions.

Integer = [0-9]+
Float = [0-9]+\.[0-9]+
Plus = \+
Minus = \-
Multi = \*
Divide = \/

Rules.

{Integer} : {token, {number, float(list_to_integer(TokenChars))}}.
{Float} : {token, {number, list_to_float(TokenChars)}}.
{Plus} : {token, {plus}}.
{Minus} : {token, {minus}}.
{Multi} : {token, {multi}}.
{Divide} : {token, {divide}}.
. : {error, {malformed}}.

Erlang code.

