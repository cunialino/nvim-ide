local wk = require("which-key")
local mappings = {
  l = {
    name = "LSP",
    i = { ":LspInfo<cr>", "Connected Language Servers" },
    k = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', "Signature help" },
    K = { '<cmd>lua vim.lsp.buf.hover()<CR>', "Hover" },
    w = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', "Add workspace folder" },
    W = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', "Remove workspace folder" },
    l = {
      '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
      "List workspace folder"
    },
    t = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', "Type definition" },
    d = { '<cmd>lua vim.lsp.buf.definition()<CR>', "Go to definition" },
    D = { '<cmd>lua vim.lsp.buf.delaration()<CR>', "Go to declaration" },
    r = { '<cmd>lua vim.lsp.buf.references()<CR>', "References" },
    R = { '<cmd>lua vim.lsp.buf.rename()<CR>', "Rename" },
    a = { '<cmd>lua vim.lsp.buf.code_action()<CR>', "Code actions" },
    e = { '<cmd>lua vim.diagnostic.get()<CR>', "Show line diagnostics" },
    n = { '<cmd>lua vim.diagnostic.goto_next()<CR>', "Go to next diagnostic" },
    N = { '<cmd>lua vim.diagnostic.goto_prev()<CR>', "Go to previous diagnostic" },
    I = { '<cmd>LspInstallInfo<cr>', 'Install language server' },
    f = { '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', "Format File" },
    T = { '<cmd> Telescope diagnostics bufnr=0<CR>', "Get Diagnostics" }
  },
  x = { ":bdelete<cr>", "Close Buffer" },
  X = { ":bdelete!<cr>", "Force Close Buffer" },
  q = { ":q<cr>", "Quit" },
  Q = { ":q!<cr>", "Force Quit" },
  w = { ":w<cr>", "Write" },
  E = { ":e ~/.config/nvim/lua/vapour/user-config/init.lua<cr>", "Edit User Config" },
  p = {
    name = "Packer",
    r = { ":PackerClean<cr>", "Remove Unused Plugins" },
    c = { ":PackerCompile profile=true<cr>", "Recompile Plugins" },
    i = { ":PackerInstall<cr>", "Install Plugins" },
    p = { ":PackerProfile<cr>", "Packer Profile" },
    s = { ":PackerSync<cr>", "Sync Plugins" },
    S = { ":PackerStatus<cr>", "Packer Status" },
    u = { ":PackerUpdate<cr>", "Update Plugins" }
  },
  z = {
    name = "Focus",
    z = { ":ZenMode<cr>", "Toggle Zen Mode" },
    t = { ":Twilight<cr>", "Toggle Twilight" }
  },
  e = { ":NvimTreeToggle<cr>", "File Explorer" },
  g = {
    name = "Git",
    d = { ":DiffviewOpen<cr>", "Open diff view" },
    C = { ":DiffviewClose<cr>", "Close diff view" },
    h = { ":DiffviewFileHistory<cr>", "Open file history" },
    f = { ":DiffviewFocusFiles<cr>", "Diff view focus file" },
    s = { ":Gitsigns stage_hunk<cr>", "Stage hunk" },
    S = { ":Gitsigns stage_buffer<cr>", "Stage buffer" },
    r = { ":Gitsigns reset_hunk<cr>", "Reset hunk" },
    R = { ":Gitsigns reset_buffer<cr>", "Reset buffer" },
    n = { ":Gitsigns next_hunk<cr>", "Next hunk" },
    N = { ":Gitsigns prev_hunk<cr>", "Previous hunk" },
    p = { ":Gitsigns preview_hunk<cr>", "Preview hunk" },
    c = { '<cmd>Telescope git_commits<cr>', 'Show commits' },
    b = { '<cmd>Telescope git_branches<cr>', 'Show branches' }
  },
  f = {
    name = "Telescope",
    f = { "<cmd>Telescope find_files<cr>", "Find Files" },
    r = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    o = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
    h = { "<cmd>Telescope help_tags<cr>", "Help tags" },
    s = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buf search" }
  },
  d = {
    name = "Debug",
    b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    c = { "<cmd>:lua require'dap'.continue()<cr>", "Continue debug" },
    o = { "<cmd>:lua require'dap'.step_over()<cr>", "Step over" },
    i = { "<cmd>:lua require'dap'.step_into()<cr>", "Step into" },
    t = { "<cmd>:lua require('dapui').toggle()<cr>", "Toggle ui" }
  },
  D = { ":Dashboard<cr>", "Dashboard" },
  t = {
    name = "Trouble",
    x = { "<cmd>TroubleToggle<cr>", "Toggle" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "Loclist" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" }
  },
  P = { "<cmd>MarkdownPreviewToggle<cr>", "Markdown Preview" },
  u = {
    name = "Utils",
    t = { "<cmd>ToggleTerm<cr>", "Toggle term" },
    f = {
      "<cmd>lua require('toggleterm.terminal').Terminal:new({direction = 'float'}):toggle()<cr>",
      "Toggle float"
    },
    l = {
      "<cmd>lua require('toggleterm.terminal').Terminal:new({cmd='lazygit', direction = 'float'}):toggle()<cr>",
      "Toggle lazygit"
    }
  }
}
mappings["/"] = { ":CommentToggle<cr>", "Toggle Comment" }

local opts = { prefix = "<leader>" }

wk.register(mappings, opts)
