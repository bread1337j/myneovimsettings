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
	exec "!gcc -o %:r %:p && time ./%:r"
endfunc

func! Make()
	exec "wa!"
	exec "make" 
endfunc

map <F1> :qa! <cr>
map <F2> :wqa! <cr>
map <F3> Make() <cr>


inoremap {s} {<cr>}<esc>O
inoremap psvm public static void main(String[] args){<cr>}<esc>O
inoremap stdout System.out.println();<left><left>
inoremap pclass public class <C-R>=expand("%:t:r")<CR> {<cr>}<esc>O
inoremap incstd  #include <stdlib.h><CR>#include <stdio.h><CR>



nnoremap <S-H> <C-W>h
nnoremap <S-J> <C-W>j
nnoremap <S-K> <C-W>k
nnoremap <S-L> <C-W>l
nnoremap <C-K> <C-U>zz
nnoremap <C-J> <C-D>zz
nnoremap <silent> <A-H> <Cmd>BufferPrevious<CR>
nnoremap <silent> <A-L> <Cmd>BufferNext<CR>
nnoremap <silent> <C-P> <Cmd>BufferPick<CR>
nnoremap <silent> <A-Q> <Cmd>BufferClose<CR>
command Q qa!
command WQ wqa!
