"""""""""""""""""""" ~/.vimrc índice """"""""""""""""""""
"
" 0) Definição de funções auxiliares
" 1) Configurações gerais
" 2) Interface do vim
" 3) Cores e fontes
" 4) Texto e tabulações
" 5) Linha de status
" 6) Desfazer persistente
" 7) Plugins instalados
" 8) Keybindings
" 
"
"""""""""""""""""""" ~/.vimrc índice """"""""""""""""""""

"""""""""""""""""""" 0) Definição de funções auxiliares """"""""""""""""""""
"
" Retorna verdadeiro se o modo de copiar e colar estiver ativado
function! HasPaste()
        if &paste
                return 'PASTE MODE ON '
        en
                return 'PASTE MODE OFF '
        return ''
endfunction
"
" Abre terminal na base do vim
function OpenTerminal()                                                                                                                                                     
      wincmd j                                                                                                                                                                
      if &bt == ""                                                                                                                                                            
          vs                                                                                                                                                                 
          wincmd J                                                                                                                                                            
          res 10                                                                                                                                                  
          call term_start($SHELL, {'curwin' : 1})                                                                                                                             
      elseif &bt == "terminal"                                                                                                                                              
         vsp                                                                                                                                                                  
         wincmd l                                                                                                                                                    
         call term_start($SHELL, {'curwin' : 1})                                                                                                                              
      endif                                                                                                                                                    
  endfunction     
"  
"""""""""""""""""""" 0) Definição de funções auxiliares """"""""""""""""""""


"""""""""""""""""""" 1) Configurações gerais """"""""""""""""""""
set encoding=UTF-8

" Usa as definições do vim, não as do vi
set nocompatible

" Define o tamanho do histórico de comandos do vim:
set history=1000

" Habilita o comando / para buscas
set incsearch

" Habilita highlight nas buscas
set hlsearch

" Habilita o reconhecimento de arquivos
filetype plugin on
filetype indent on

" Recarrega o arquivo caso ele seja editado por um programa externo enquanto aberto
set autoread
 
" Habilita o uso do mouse no vim para cliques e coisas do tipo
set mouse=a

"""""""""""""""""""" 1) Configurações gerais """"""""""""""""""""

"""""""""""""""""""" 2) Interface do vim """""""""""""""""""""
"
"cor de fundo
color murphy
" Ativa o menu WiLd (entre outras coisas, ativa <Ctrl>n e <Ctrl>p para navegar entre as correspondências da busca
set wildmenu
"
" Sempre mostra a posição atual do cursor
set ruler
"
" Altura da barra de comandos
set cmdheight=2
"
" Configurando a tecla <Backspace> para o que ela tem que fazer
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Habilita expressões regulares
set magic
"
" Destaca pares de colchetes ao passar o cursor, e configura o tempo do destaque em décimos de segundo
set showmatch
set mat=10
"
""""""" NERDTree configs""""""""""""""""""""""""
" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree
"
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
"
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
"
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

""""""" NERDTree configs""""""""""""""""""""""""
"
"
"
"""""""""""""""""""" 2) Interface do vim """""""""""""""""""""
"""""""""""""""""""" 3) Cores e fontes """"""""""""""""""""
"
" Ativa a numeração das linhas
set number
"
" Habilita o destaque de sintaxe
syntax enable
"
" Esquema de cores do vim
"colorscheme srcery
set background=dark
"
" Desativa a quebra de linha automática (comentado por padrão)
set nolinebreak
"
" Permite a navegação dentro de uma mesma linha longa com j e k
set wrap
"
"""""""""""""""""""" 3) Cores e fontes """"""""""""""""""""
"""""""""""""""""""" 4) Texto e tabulações """"""""""""""""""""
"
" Insere espaços no lugar de caracteres de tabulação
set expandtab
"
" Uso inteligente de tabulações
set smarttab
"
" Define uma tabulação como sendo oito espaços
set shiftwidth=4
set tabstop=4
"
"""""""""""""""""""" 4) Texto e tabulações """"""""""""""""""""
"""""""""""""""""""" 5) Linha de status """"""""""""""""""""
"
" Sempre mostra a linha de status
set laststatus=2
"
" Formato da linha de status
set statusline=\ %{HasPaste()}\ Arquivo:\ %F%m%r%h\ %w\ \ Diretório\ de\ trabalho:\ %r%{getcwd()}%h\ -\ Linha:\ %l\ -\ Coluna:\ %c
"
"""""""""""""""""""" 5) Linha de status """"""""""""""""""""
"""""""""""""""""""" 6) Desfazer persistente """"""""""""""""""""
"
" Preserva o histórico do desfazer após o fim da sessão atual salvando-o em um arquivo
set undodir=~/.vim/undobackups
set undofile
"
"""""""""""""""""""" 6) Desfazer persistente """"""""""""""""""""
"""""""""""""""""""" 7) Plugins instalados """"""""""""""""""""
call plug#begin()

    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'srcery-colors/srcery-vim'
    Plug 'morhetz/gruvbox'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-fugitive'
    Plug 'leafgarland/typescript-vim'
    Plug 'vim-utils/vim-man'
    Plug 'mbbill/undotree'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'ryanoasis/vim-devicons'

call plug#end()

"""""""""""""""""""" 7) Plugins instalados """""""""""""""""""""
"
"""""""""""""""""""" 8) KEY BINDINGS """""""""""""""""""""
"
"q para sair 
map q :quit<CR>
"
"crtl q para sair sem salvar
map <C-q> :quit!<CR>
"
"ctrl s salva
map <C-s> :w<<CR>
"
"Ctrl a seleciona tudo
nnoremap <C-a> ggVG
"
"Ctrl c para copiar
vmap <C-c> "*yy
"
"<F5> key to search for the keyword under the cursor in the current directory using the 'grep' command
:nnoremap <F5> :grep <C-R><C-W> *<CR>
"
" declara leader como espaço
let mapleader=" "
nnoremap <leader>t :call OpenTerminal()<CR> 
"""""""" NERDTree """"""""""""""""""""""""
"
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
"""""""" NERDTree """"""""""""""""""""""""
"
"""""""""""""""""""" 8) KEY BINDINGS """""""""""""""""""""

