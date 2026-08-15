-- Custom filetype definitions

-- Detect Jinja2 + something with dotted filetype syntax
-- used mainly for YAML + Jinja2 templates for CF
-- vim.filetype.add {
--   filename = {
--     ['.template.yaml'] = 'yaml.jinja'
--   }
-- }
vim.cmd('au BufNewFile,BufRead *.template.yaml set filetype=yaml.jinja')

-- Journard: sectioned TODO / work-journal notes
--   *.journard, *.journ
--   *.txt / *.todo / *.notes whose first lines look like ==== / = title / ====
vim.filetype.add({
  extension = {
    journard = 'journard',
    journ = 'journard',
  },
})

local function looks_like_journard(bufnr)
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, 8, false)
  local eq = 0
  local titled = false
  for _, line in ipairs(lines) do
    if line:match('^[=][=][=]+%s*$') then
      eq = eq + 1
    elseif line:match('^=%s+%S') then
      titled = true
    elseif line:match('%S') and eq == 0 then
      -- non-empty content before any banner → not this format
      return false
    end
    if eq >= 2 and titled then
      return true
    end
  end
  return false
end

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*.txt', '*.todo', '*.notes' },
  callback = function(ev)
    if vim.bo[ev.buf].filetype ~= '' and vim.bo[ev.buf].filetype ~= 'text' then
      return
    end
    if looks_like_journard(ev.buf) then
      vim.bo[ev.buf].filetype = 'journard'
    end
  end,
})
