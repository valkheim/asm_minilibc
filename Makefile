NAME := libasm.so

SRCS := \
	x86-64/memcpy/my_memcpy.asm \
	x86-64/memmove/my_memmove.asm \
	x86-64/memset/my_memset.asm \
	x86-64/rindex/my_rindex.asm \
	x86-64/strcasecmp/my_strcasecmp.asm \
	x86-64/strchr/my_strchr.asm \
	x86-64/strcmp/my_strcmp.asm \
	x86-64/strncmp/my_strncmp.asm \
	x86-64/strstr/my_strstr.asm \
	x86-64/strlen/my_strlen.asm   \
	x86-64/strpbrk/my_strpbrk.asm \
	x86-64/strcspn/my_strcspn.asm \
	x86-64/read/my_read.asm \
	x86-64/write/my_write.asm \

OBJS := $(SRCS:%.asm=obj/%.o)

$(NAME): all

all: $(OBJS)
	ld -o $(NAME) $(OBJS) -fpic -shared
	#gcc -o $(NAME) $(OBJS) -fpic -shared

obj/%.o: %.asm
	@mkdir -p $(dir $@)
	nasm -f elf64 $< -o $@

clean:
	find -name "*~" -delete -o -name "#*#" -delete
	rm -rf obj

fclean: clean
	rm -rf $(NAME)

re: fclean all



