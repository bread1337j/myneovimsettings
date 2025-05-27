set nu
set ai
set tabstop=4
set ls=2
set shiftwidth=4
set incsearch 

func! CompileRun()
exec "w" 
silent exec "!javac %:p"
exec "!time java -cp %:p:h %:t:r"
endfunc

map <F5> :call CompileRun()<cr>

inoremap { {<cr>}<esc>O<tab>
inoremap psvm public static void main(String[] args){<cr>}<esc>O
inoremap stdout System.out.println();<left><left>
inoremap pclass public class <C-R>=expand("%:t:r")<CR> {<cr>}<esc>O

command Q qa!
command WQ wqa!
