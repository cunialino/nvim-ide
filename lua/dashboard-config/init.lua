local db = require('dashboard')
local home = os.getenv('HOME')
db.preview_command = 'cat | lolcat -F 0.3'
db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
db.preview_file_height = 16
db.preview_file_width = 26

-- vim.g.dashboard_default_executive = 'telescope'

db.custom_center = {
  { icon = '   ', desc = 'Find File      ', shortcut = 'SPC f f', action = 'Telescope find_files' },
  { icon = '   ', desc = 'Search Text    ', shortcut = 'SPC f r', action = 'Telescope live_grep' },
  { icon = '   ', desc = 'Recent Files   ', shortcut = 'SPC f o', action = 'Telescope oldfiles' },
  {
    icon = '   ',
    desc = 'Config           ',
    shortcut = 'SPC c',
    action = 'edit ~/.config/nvim/init.lua'
  }, {
    icon = '   ',
    desc = 'Git            ',
    shortcut = 'SPC u l',
    action = 'lua require("toggleterm.terminal").Terminal:new({cmd="lazygit", direction = "float"}):toggle()'
  }
}
db.custom_footer = { 'Do one thing, do it well - Unix philosophy' }
