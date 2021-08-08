execute pathogen#infect()

" Generic config
syntax enable
set background=dark
colorscheme solarized
filetype plugin indent on
set expandtab
set tabstop=2
set shiftwidth=2
set number
set colorcolumn=80
vnoremap . :norm.<CR>
inoremap jj <Esc>
inoremap <Esc> <Nop>
nnoremap <silent> <CR> :nohlsearch<CR><CR>
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
set noswapfile
"end Generic config

" Lightline config
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ],
      \              [ 'cocstatus' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'cocstatus': 'coc#status',
      \   'filename': 'LightLineFilename',
      \ }
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction
" end Lightline config
