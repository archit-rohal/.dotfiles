":imap jk <Esc> 
imap jk <Esc>
vnoremap <leader>u "+y"

" imap jk without semicolon is also valid above
" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk
" I like using H and L for beginning/end of line
nmap H ^
nmap L $
" Quickly remove search highlights
nmap <F9> :nohl

" Yank to system clipboard
set clipboard=unnamed

" Go back and forward with Ctrl+O and Ctrl+I
" (make sure to remove default Obsidian shortcuts for these to work)
" exmap back obcommand app:go-back
" nmap <C-o> :back
" exmap forward obcommand app:go-forward
" nmap <C-i> :forward

" Copied from system-wide vimrc located at /etc/vim/ -

" inoremap jk <esc>
" nmap I ZZ
" nmap O ZQ
" nmap j gj
" nmap k gk
" nmap H 0
" nmap L $
" let mapleader = " "
" nnoremap <Leader>s :update<CR>
set scrolloff=8
" set number
" set relativenumber
" set numberwidth=3
" set linebreak
" set cpoptions+=n
" highlight LineNr term=bold cterm=NONE ctermfg=226 ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
" set tabstop=4 softtabstop=4
" set shiftwidth=4
" set expandtab
" set smartindent
" nnoremap <leader>p :Vex<CR>
