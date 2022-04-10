local status_ok, todo_comments = pcall(require, "todo-comments")
if not status_ok then
  return
end

local icons = require "local.icons"

local error_red = "#F44747"
local warning_orange = "#ff8800"
local info_yellow = "#FFCC66"
local hint_blue = "#4FC1FF"
local perf_purple = "#7C3AED"

todo_comments.setup {
  signs = true, -- show icons in the signs column
  sign_priority = 8, -- sign priority
  -- keywords recognized as todo comments
  keywords = {
    FIX = {
      icon = icons.ui.Bug, -- icon used for the sign, and in search results
      color = error_red, -- can be a hex color, or a named color (see below)
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
    },
    TODO = { icon = icons.ui.Check, color = hint_blue, alt = { "TIP" } },
    HACK = { icon = icons.ui.Fire, color = warning_orange },
    WARN = { icon = icons.diagnostics.Warning, color = warning_orange, alt = { "WARNING", "XXX" } },
    PERF = { icon = icons.ui.Dashboard, color = perf_purple, alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = icons.ui.Note, color = info_yellow, alt = { "INFO" } },
  },
  highlight = {
    before = "", -- "fg" or "bg" or empty
    keyword = "fg", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
    after = "fg", -- "fg" or "bg" or empty
    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
    comments_only = true, -- uses treesitter to match keywords in comments only
    max_line_len = 400, -- ignore lines longer than this
    exclude = {}, -- list of file types to exclude highlighting
  },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
    pattern = [[\b(KEYWORDS):]], -- ripgrep regex
  },
}
