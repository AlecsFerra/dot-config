local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup {
  ensure_installed = "maintained",
  sync_install     = false,
	ignore_install   = { "" },
  highlight        = {
    enable                            = true,
    additional_vim_regex_highlighting = true,
  },
  autopairs        = {
    enable = true,
  },
  rainbow          = {
    enable  = true,
    disable = { "html" },
  },
  playground       = {
    enable = true,
  },
  autotags         = {
    enable = true,
  }
}

local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

npairs.setup {
  check_ts  = true,
  ts_config = {
    lua = { "string", "source" },
  },
  fast_wrap = {
    map            = "<M-e>",
    chars          = { "{", "[", "(", '"', "'" },
    pattern        = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset         = 0, -- Offset from pattern match
    end_key        = "$",
    keys           = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma    = true,
    highlight      = "PmenuSel",
    highlight_grey = "LineNr",
  }
}

local status_ok, gps = pcall(require, "nvim-gps")
if not status_ok then
  return
end

local icons = require "local.icons"
gps.setup {
  disable_icons = false,
  icons         = {
    ["class-name"]        = icons.kind.Class .. " ",
    ["function-name"]     = icons.kind.Function .. " ",
    ["method-name"]       = icons.kind.Method .. " ",
    ["container-name"]    = icons.type.Object .. " ",
    ["tag-name"]          = icons.misc.Tag .. " ",
    ["mapping-name"]      = icons.type.Object .. " ",
    ["sequence-name"]     = icons.type.Array .. " ",
    ["null-name"]         = icons.kind.Field .. " ",
    ["boolean-name"]      = icons.type.Boolean .. " ",
    ["integer-name"]      = icons.type.Number .. " ",
    ["float-name"]        = icons.type.Number .. " ",
    ["string-name"]       = icons.type.String .. " ",
    ["array-name"]        = icons.type.Array .. " ",
    ["object-name"]       = icons.type.Object .. " ",
    ["number-name"]       = icons.type.Number .. " ",
    ["table-name"]        = icons.ui.Table .. " ",
    ["date-name"]         = icons.ui.Calendar .. " ",
    ["date-time-name"]    = icons.ui.Table .. " ",
    ["inline-table-name"] = icons.ui.Calendar .. " ",
    ["time-name"]         = icons.misc.Watch .. " ",
    ["module-name"]       = icons.kind.Module .. " ",
  },
  separator = " " .. icons.ui.ChevronRight .. " ",
  depth = 0,
  depth_limit_indicator = "..",
}
