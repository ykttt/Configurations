-- configurations/ibl.lua
--
require("dap").adapters = {
  lldb = {
    name = "lldb",
    type = "executable",
    command = "/nix/store/mg2qmsqmgdrh4f129v15fl3l698yy6ni-lldb-18.1.8/bin/lldb-dap",
  },
}
require("dap").configurations = {
  c = {
    {
      name = "Launch File",
      type = "lldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = true,
      args = {},
      runInTerminal = true,
    },
  },
}
vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
vim.keymap.set("n", "<F7>", function()
  require("dap").continue()
end)
vim.keymap.set("n", "<F10>", function()
  require("dap").step_over()
end)
vim.keymap.set("n", "<F11>", function()
  require("dap").step_into()
end)
vim.keymap.set("n", "<F12>", function()
  require("dap").step_out()
end)
vim.keymap.set("n", "<F6>", function()
  require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", "<Leader><F6>", function()
  require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
