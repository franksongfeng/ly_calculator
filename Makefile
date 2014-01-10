REBAR =rebar

all:clean compile
clean:
	@ $(REBAR) clean
compile:
	@ $(REBAR) compile
eunit:
	@ $(REBAR) eunit

