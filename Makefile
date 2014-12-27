PREFIX	?= /usr
CFLAGS	+= -std=c99 -Os
LDFLAGS	+= -static

SRC	 = stdout.c
OBJ	 = ${SRC:.c=.o}

all: stdout

.c.o: ${SRC}
	@echo CC $<
	@${CC} -c ${CFLAGS} $<

stdout: ${OBJ}
	@echo LD $@
	@${CC} -o $@ ${OBJ} ${LDFLAGS}

clean: stdout ${OBJ}
	rm stdout ${OBJ}

install: stdout
	install -m 755 stdout ${DESTDIR}${PREFIX}/bin/stdout

uninstall: ${DESTDIR}${PREFIX}/bin/stdout
	rm ${DESTDIR}${PREFIX}/bin/stdout
