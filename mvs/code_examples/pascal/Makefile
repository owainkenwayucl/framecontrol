FPC=fpc

default: mandel julian julia pipascal

mandel: mandel.pas Makefile
	$(FPC) mandel.pas

julian: julian.pas Makefile
	$(FPC) julian.pas

julia: julia.pas Makefile
	$(FPC) julia.pas

pipascal: pipascal.pas Makefile
	$(FPC) pipascal.pas

clean:
	rm -f mandel julian julia pipascal
