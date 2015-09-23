RM       = rm -f
NAME     = libjournal.a
LIB      = -lmy -L ~/Lib/
SRCS     = journal.c \
           journal.h 
OBJ      = $(SRCS:.c=.o)
 
stat: $(NAME)
 
$(NAME): $(OBJ)
	ar rc $(NAME) $(OBJ)
	ranlib $(NAME) 
clean:
	$(RM) $(OBJ) 
fclean: clean
	$(RM) $(NAME)
 
re: fclean all
 
.PHONY: all clean fclean re

dyna: 
	gcc -fPIC -c -Wall journal.c
	gcc -shared -fPIC -Wl,-soname,libjournal.so.1 -o libjournal.so.1.1.57 journal.o -lc
