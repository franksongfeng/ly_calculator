ERL = /usr/bin/erl
ERLC = /usr/bin/erlc

all:clean compile test

clean:
	@ rm -R -f ebin src/ly_src
	@ rm -f erl_crash.dump
compile:
	@ mkdir -p ebin
	@ mkdir -p src/ly_src
	@ $(ERLC) -o src/ly_src src/*.xrl src/*.yrl
	@ $(ERLC) -o ebin src/ly_src/*.erl src/*.erl
test:
	@ $(ERL) -pa ebin -noshell -eval 'eunit:test(calc, [verbose])'\
	 -s init stop