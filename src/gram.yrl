%%%-------------------------------------------------------------------
%%% @author johhy <https://github.com/johhy>
%%% @copyright (C) 2014, johhy
%%%
%%% Created : 10 Jan 2014 by johhy <https://github.com/johhy>
%%%-------------------------------------------------------------------

Nonterminals element uminus.

Terminals plus minus multi divide number obrac cbrac.

Rootsymbol element.

Left 100 plus minus.
Left 200 multi divide.
Unary 300 uminus.

element -> element plus element : add('$1', '$3').
element -> element minus element : minus('$1', '$3').
element -> element multi element : multi('$1', '$3').
element -> element divide element : divide('$1', '$3').
element -> plus element: '$2'.
element -> uminus : '$1'.
uminus -> minus element: '$2' * (-1).
element -> number : unwrap('$1').
element -> obrac element cbrac : '$2'.

Erlang code.

unwrap({_, V}) -> V.
add(A, B) -> A + B.
minus(A, B) -> A - B.
multi(A, B) -> A * B.
divide(A, B) -> A / B.
