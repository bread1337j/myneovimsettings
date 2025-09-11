set rnu
set ai
set tabstop=4
set ls=2
set shiftwidth=4
set incsearch 

func! CompileRunJava()
	exec "w" 
	silent exec "!javac %:p"
	exec "!time java -cp %:p:h %:t:r"
endfunc

func! CompileRunC()
	exec "w"
	exec "!gcc -Wall -o %:r %:p && ./%:r"
endfunc


map <F1> :qa!
map <F2> :wqa!
map <F4> :call CompileRunJava()<cr>
map <F5> :call CompileRunC()<cr>

inoremap {s} {<cr>}<esc>O
inoremap psvm public static void main(String[] args){<cr>}<esc>O
inoremap stdout System.out.println();<left><left>
inoremap pclass public class <C-R>=expand("%:t:r")<CR> {<cr>}<esc>O
inoremap incstd  #include <stdlib.h><CR>#include <stdio.h><CR>

command Q qa!
command WQ wqa!
