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

"�H�U�O�ӤH�]�w
"�]�w�r���j�p�I����
:colorscheme evening
set guifont=Consolas:h14:cANSI

"��ܦ�ƩM��ܬ۹��ơC���G�|�V�X��ܡC
set number
set relativenumber

"�]�w�������C����ܬ��Ǧ�
highlight LineNr guifg=#808080

"�]�w�j�M���ɭԩ����j�p�g
set ic

"�аO��ЩҦb���C
set cursorline

"�ɮ׾D�䥦�{�����ɷ|�۰ʭ��sŪ��
set autoread

"��F3�s�W�@�Ӥ���
"��F4��������
"��F9�W�@�Ӥ���
"��F10�U�@�Ӥ���
nmap <F3> :tabnew<cr>
nmap <F4> :tabclose<cr>
nmap <F9> gT
nmap <F10> gt

"��GVIM�ݰ_�ӹ��OConsole����
"see :h guioptions
set guioptions+=c
set guioptions-=e
set guioptions-=T
set guioptions-=m
set guioptions-=r

"�binsert mode�̲��ʴ��
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

