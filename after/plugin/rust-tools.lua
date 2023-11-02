-- Update this path
local extension_path = 'C:\\Users\\chris\\.vscode\\extensions\\vadimcn.vscode-lldb-1.10.0'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb'
local this_os = vim.loop.os_uname().sysname;

-- The path in windows is different
if this_os:find "Windows" then
  codelldb_path = extension_path .. "adapter\\codelldb.exe"
  liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
else
  -- The liblldb extension is .so for linux and .dylib for macOS
  liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
end

local opts = {
    -- ... other configs
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
    }
}


require('rust-tools').setup()
