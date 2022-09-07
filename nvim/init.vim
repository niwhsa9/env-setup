call plug#begin()
    Plug 'preservim/nerdtree'
    Plug 'EdenEast/nightfox.nvim' " Vim-Plug
    Plug 'neovim/nvim-lspconfig'
    Plug 'ray-x/lsp_signature.nvim'
call plug#end()

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

nnoremap <F4> :NERDTreeToggle<CR>
tnoremap <Esc> <C-\><C-n>
nnoremap <silent> g? <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>

" Visuals
set number
set termguicolors
colorscheme nightfox

lua require("lua_config")

" autocmd VimEnter * NERDTree
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
