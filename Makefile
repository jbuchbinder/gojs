include $(GOROOT)/src/Make.inc

TARG=javascriptcore
CGOFILES=\
	base.go \
	context.go \
	object.go \
	string.go \
	javascriptcore.go
CGO_OFILES=callback.o
CGO_CFLAGS=`pkg-config --cflags webkit-1.0`
CGO_LDFLAGS=`pkg-config --libs webkit-1.0`

include $(GOROOT)/src/Make.pkg

main: install main.go
	$(GC) main.go
	$(LD) -o $@ main.$O