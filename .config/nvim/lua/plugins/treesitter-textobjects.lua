-- neovim plugin: treesitter-textobjects

return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  lazy = true,
  config = function()
    require("nvim-treesitter-textobjects").setup({
      select = {
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        selection_modes = {
          ['@parameter.outer'] = 'v', -- charwise
          ['@function.outer'] = 'V',  -- linewise
          ['@class.outer'] = '<c-v>', -- blockwise
        },
        include_surrounding_whitespace = true,
      },
      move = {
        set_jumps = true, -- whether to set jumps in the jumplist
      },
    })

    local ts_select = require("nvim-treesitter-textobjects.select")
    local ts_swap = require("nvim-treesitter-textobjects.swap")
    local ts_move = require("nvim-treesitter-textobjects.move")
    local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

    local function map_select(lhs, textobject)
      vim.keymap.set({ "x", "o" }, lhs, function()
        ts_select.select_textobject(textobject.query, textobject.query_group)
      end, { desc = textobject.desc })
    end

    local function map_move(lhs, direction, textobject)
      vim.keymap.set({ "n", "x", "o" }, lhs, function()
        ts_move[direction](textobject.query, textobject.query_group)
      end, { desc = textobject.desc })
    end

    local function map_swap(lhs, direction, query, desc)
      vim.keymap.set("n", lhs, function()
        ts_swap[direction](query)
      end, { desc = desc })
    end

    map_select("a=", { query = "@assignment.outer", desc = "Select outer part of an assignment" })
    map_select("i=", { query = "@assignment.inner", desc = "Select inner part of an assignment" })
    map_select("l=", { query = "@assignment.lhs", desc = "Select left hand side of an assignment" })
    map_select("r=", { query = "@assignment.rhs", desc = "Select right hand side of an assignment" })
    map_select("aa", { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" })
    map_select("ia", { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" })
    map_select("ai", { query = "@conditional.outer", desc = "Select outer part of a conditional" })
    map_select("ii", { query = "@conditional.inner", desc = "Select inner part of a conditional" })
    map_select("al", { query = "@loop.outer", desc = "Select outer part of a loop" })
    map_select("il", { query = "@loop.inner", desc = "Select inner part of a loop" })
    map_select("af", { query = "@call.outer", desc = "Select outer part of a function call" })
    map_select("if", { query = "@call.inner", desc = "Select inner part of a function call" })
    map_select("am", { query = "@function.outer", desc = "Select outer part of a function/method definition" })
    map_select("im", { query = "@function.inner", desc = "Select inner part of a function/method definition" })
    map_select("ac", { query = "@class.outer", desc = "Select outer part of a class" })
    map_select("ic", { query = "@class.inner", desc = "Select inner part of a class" })
    map_select("aC", { query = "@comment.outer", desc = "Select outer part of a comment" })
    map_select("iC", { query = "@comment.inner", desc = "Select inner part of a comment" })
    map_select("ak", { query = "@scope", query_group = "locals", desc = "Select language scope" })

    map_swap("<Leader>na", "swap_next", "@parameter.inner", "Swap parameter/argument with next")
    map_swap("<Leader>nm", "swap_next", "@function.outer", "Swap function with next")
    map_swap("<Leader>nc", "swap_next", "@class.outer", "Swap class with next")
    map_swap("<Leader>pa", "swap_previous", "@parameter.inner", "Swap parameter/argument with previous")
    map_swap("<Leader>pm", "swap_previous", "@function.outer", "Swap function with previous")
    map_swap("<Leader>pc", "swap_previous", "@class.outer", "Swap class with previous")

    map_move("]f", "goto_next_start", { query = "@call.outer", desc = "Next function call start" })
    map_move("]m", "goto_next_start", { query = "@function.outer", desc = "Next function/method start" })
    map_move("]c", "goto_next_start", { query = "@class.outer", desc = "Next class start" })
    map_move("]i", "goto_next_start", { query = "@conditional.outer", desc = "Next conditional start" })
    map_move("]l", "goto_next_start", { query = "@loop.outer", desc = "Next loop start" })
    map_move("]z", "goto_next_start", { query = "@fold", query_group = "folds", desc = "Next fold" })
    map_move("]F", "goto_next_end", { query = "@call.outer", desc = "Next function call end" })
    map_move("]M", "goto_next_end", { query = "@function.outer", desc = "Next function/method end" })
    map_move("]C", "goto_next_end", { query = "@class.outer", desc = "Next class end" })
    map_move("]I", "goto_next_end", { query = "@conditional.outer", desc = "Next conditional end" })
    map_move("]L", "goto_next_end", { query = "@loop.outer", desc = "Next loop end" })
    map_move("[f", "goto_previous_start", { query = "@call.outer", desc = "Previous function call start" })
    map_move("[m", "goto_previous_start", { query = "@function.outer", desc = "Previous function/method start" })
    map_move("[c", "goto_previous_start", { query = "@class.outer", desc = "Previous class start" })
    map_move("[i", "goto_previous_start", { query = "@conditional.outer", desc = "Previous conditional start" })
    map_move("[l", "goto_previous_start", { query = "@loop.outer", desc = "Previous loop start" })
    map_move("[z", "goto_previous_start", { query = "@fold", query_group = "folds", desc = "Previous fold" })
    map_move("[F", "goto_previous_end", { query = "@call.outer", desc = "Previous function call end" })
    map_move("[M", "goto_previous_end", { query = "@function.outer", desc = "Previous function/method end" })
    map_move("[C", "goto_previous_end", { query = "@class.outer", desc = "Previous class end" })
    map_move("[I", "goto_previous_end", { query = "@conditional.outer", desc = "Previous conditional end" })
    map_move("[L", "goto_previous_end", { query = "@loop.outer", desc = "Previous loop end" })

    -- Repeat movement with ; and ,
    -- ensure ; goes forward and , goes backward regardless of the last direction
    -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
    -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

    -- vim way: ; goes to the direction you were moving.
    -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
    -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

    -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
    -- vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
    -- vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
    -- vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
    -- vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
  end,
}
