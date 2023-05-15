# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rmitache <rmitache@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/05 10:37:20 by rmitache          #+#    #+#              #
#    Updated: 2023/05/15 14:24:51 by rmitache         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a
CC = cc
CFLAGS = -Wall -Wextra -Werror
SRC = ft_printf_c.c ft_printf_nosign.c ft_printf_str.c ft_printf.c ft_printf_p.c ft_printf_count.c ft_printf_d.c ft_putnbr_long.c ft_printf_u.c ft_printf_hex.c
LIBFT_PATH = ./libft
LIBFT = $(LIBFT_PATH)/libft.a
OBJ = $(SRC:.c=.o)

all: $(NAME)

$(NAME): $(OBJ) $(LIBFT)
	@cp $(LIBFT) ./$(NAME)
	ar rcs $(NAME) $(OBJ)

$(LIBFT):
	make all -C $(LIBFT_PATH)

$(OBJ): $(SRC)
	$(CC) $(CFLAGS) -c $(SRC)

clean:
		make -C $(LIBFT_PATH) clean
		rm -f $(OBJ)
fclean: clean
		make -C $(LIBFT_PATH) fclean
		rm -f $(NAME)
re:		fclean all

.PHONY: all clean fclean re
