-- Custom filetype definitions

-- Detect Jinja2 + something with dotted filetype syntax
-- used mainly for YAML + Jinja2 templates for CF
-- vim.filetype.add {
--   filename = {
--     ['.template.yaml'] = 'yaml.jinja'
--   }
-- }
vim.cmd('au BufNewFile,BufRead *.template.yaml set filetype=yaml.jinja')
