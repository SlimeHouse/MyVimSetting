" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Jan 26
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

"***** Setting ***************************************************************

"�t�@�C����ǂݍ��ގ��́A�����R�[�h�������ʂ̏���
set fileencodings=utf-8,cp932,euc-jp,sjs
"�ȉ����e�� fileencodings�̗D�揇�ʂ𖳎����� utf-8�`���ŕK���ǂݍ���
"set encoding=utf-8

"�t�@�C���̃G���R�[�f�B���O�i���s�R�[�h�̎�ށj
set fileformats=unix
" �ۑ��G���R�[�f�B���O�𖾎��I�ɃZ�b�g�iutf-8�ŕۑ�����j
set fenc=utf-8


" �o�b�N�A�b�v�t�@�C�������Ȃ�
set nobackup
" �X���b�v�t�@�C�������Ȃ�
set noswapfile
" �ҏW���̃t�@�C�����ύX���ꂽ�玩���œǂݒ���
set autoread
" �o�b�t�@���ҏW���ł����̑��̃t�@�C�����J����悤��
set hidden
" ���͒��̃R�}���h���X�e�[�^�X�ɕ\������
set showcmd


" �����ڌn
" �s�ԍ���\��
set number
" ���݂̍s�������\���i�c�j
set cursorcolumn
" �s����1������܂ŃJ�[�\�����ړ��ł���悤��
set virtualedit=onemore
" �C���f���g�̓X�}�[�g�C���f���g
set smartindent
" �r�[�v�����~�߂āA��ʂ̓_�ł����Ȃ��B
set visualbell t_vb=
" ���ʓ��͎��̑Ή����銇�ʂ�\��
set showmatch
" �X�e�[�^�X���C������ɕ\��
set laststatus=2
" �R�}���h���C���̕⊮
set wildmode=list:longest
" �܂�Ԃ����ɕ\���s�P�ʂł̈ړ��ł���悤�ɂ���
nnoremap j gj
nnoremap k gk
" �V���^�b�N�X�n�C���C�g�̗L����
syntax enable
" ���݂̍s�������\��
"set cursorline

"�J�[�\���^�C�v�̐ݒ�
if has('vim_starting')
    " �}�����[�h���ɔ�_�ł̏c�_�^�C�v�̃J�[�\��
    let &t_SI .= "\e[6 q"
    " �m�[�}�����[�h���ɔ�_�ł̃u���b�N�^�C�v�̃J�[�\��
    let &t_EI .= "\e[2 q"
    " �u�����[�h���ɔ�_�ł̉����^�C�v�̃J�[�\��
    let &t_SR .= "\e[4 q"
endif

" <BS> <DEL>��L���ɂ���
set backspace=indent,eol,start

"�r�W���A�����[�h�őI�������e�L�X�g���N���b�v�{�[�h�ɓ���悤�ɂ���B
set clipboard+=autoselect
" �������W�X�^�ɓ���f�[�^���A*���W�X�^�ɂ������B*���W�X�^�ɓ����ƃN���b�v�{�[�h�ɂ�����̂ő��̃A�v���P�[�V�����ɂ��R�s�[�\�ɂȂ�B
set clipboard+=unnamed

" Tab�n
" �s������������(�^�u���u?-�v�ƕ\�������)
set list listchars=tab:\?\-
" Tab�����𔼊p�X�y�[�X�ɂ���
set expandtab
" �s���ȊO��Tab�����̕\�����i�X�y�[�X�������j
set tabstop=4
" �s���ł�Tab�����̕\����
set shiftwidth=4


" �����n
" ���������񂪏������̏ꍇ�͑啶������������ʂȂ���������
set ignorecase
" ����������ɑ啶�����܂܂�Ă���ꍇ�͋�ʂ��Č�������
set smartcase
" ������������͎��ɏ����Ώە�����Ƀq�b�g������
set incsearch
" �������ɍŌ�܂ōs������ŏ��ɖ߂�
set wrapscan
" ��������n�C���C�g�\��
set hlsearch
" ESC�A�łŃn�C���C�g����
nmap <Esc><Esc> :nohlsearch<CR><Esc>



