
return {
    'airblade/vim-gitgutter',
    config = function ()
       vim.keymap.set("n", "]h", vim.cmd.GitGutterNextHunk) -- reversed
       vim.keymap.set("n", "[h", vim.cmd.GitGutterPrevHunk) -- reversed
    end
}
