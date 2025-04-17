-- Neovim configuration

-- Install lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Global settings
require('settings')

-- Load plugins and their configuration from lua/plugins/*.lua
require('lazy').setup({ import = "plugins" })

-- Global keymap
require('keymap')

-- Custom filetypes
require('filetypes')


-- NOTE: other plugins in ./plugin (standard nvim plugin dir?)
