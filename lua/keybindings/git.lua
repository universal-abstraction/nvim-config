-- keybindings/git.lua
--
-- Git operations with gitsigns.nvim

local M = {}

-- Setup gitsigns keybindings (called from gitsigns on_attach)
function M.setup(bufnr)
  local gs = package.loaded.gitsigns
  local map = function(mode, l, r, desc)
    vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
  end

  -- Navigation between hunks
  map("n", "]c", function()
    if vim.wo.diff then return "]c" end
    vim.schedule(function() gs.next_hunk() end)
    return "<Ignore>"
  end, "Next hunk")

  map("n", "[c", function()
    if vim.wo.diff then return "[c" end
    vim.schedule(function() gs.prev_hunk() end)
    return "<Ignore>"
  end, "Prev hunk")

  -- Stage/reset actions
  map("n", "<leader>gs", gs.stage_hunk, "Stage hunk")
  map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
  map("v", "<leader>gs", function() gs.stage_hunk({vim.fn.line("."), vim.fn.line("v")}) end, "Stage hunk")
  map("v", "<leader>gr", function() gs.reset_hunk({vim.fn.line("."), vim.fn.line("v")}) end, "Reset hunk")
  map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
  map("n", "<leader>gu", gs.undo_stage_hunk, "Undo stage hunk")
  map("n", "<leader>gR", gs.reset_buffer, "Reset buffer")

  -- View actions
  map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
  map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame line")
  map("n", "<leader>gd", gs.diffthis, "Diff this")
end

return M
