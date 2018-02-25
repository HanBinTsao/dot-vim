set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"以下是個人設定
"設定字型大小背景色
:colorscheme evening
set guifont=Consolas:h14:cANSI

"顯示行數和顯示相對行數。結果會混合顯示。
set number
set relativenumber

"設定左邊行數顏色顯示為灰色
highlight LineNr guifg=#808080

"設定搜尋的時候忽略大小寫
set ic

"標記游標所在的列
set cursorline

"檔案遭其它程式更改時會自動重新讀取
set autoread

"按F3新增一個分頁
"按F4關掉分頁
"按F9上一個分頁
"按F10下一個分頁
nmap <F3> :tabnew<cr>
nmap <F4> :tabclose<cr>
nmap <F9> gT
nmap <F10> gt

"讓GVIM看起來像是Console版面
"see :h guioptions
set guioptions+=c
set guioptions-=e
set guioptions-=T
set guioptions-=m
set guioptions-=r

"在insert mode裡移動游標
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l

" Moving cursor in command line
cnoremap <A-h> <Left>
cnoremap <A-j> <Down>
cnoremap <A-k> <Up>
cnoremap <A-l> <Right>

" Use four space to replace tab, when use tab key, vim will automaticaly convert tab to 4 space
syntax enable
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

