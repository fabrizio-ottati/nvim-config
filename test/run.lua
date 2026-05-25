-- Test runner for nvim config
-- Usage: :source test/run.lua

require("lazy").load({ plugins = { "nvim-treesitter", "conform.nvim", "nvim-lspconfig" } })

local config_dir = vim.fn.stdpath("config")
local results = {}

local function pass(name) results[#results + 1] = { name = name, ok = true } end
local function fail(name, detail) results[#results + 1] = { name = name, ok = false, detail = detail } end

-- ---------------------------------------------------------------------------
-- Treesitter suite
-- ---------------------------------------------------------------------------
local ts_cases = {
  { file = "treesitter/sample.lua",  lang = "lua" },
  { file = "treesitter/sample.py",   lang = "python" },
  { file = "treesitter/sample.c",    lang = "c" },
  { file = "treesitter/sample.cpp",  lang = "cpp" },
  { file = "treesitter/sample.sh",   lang = "bash" },
  { file = "treesitter/sample.llvm", lang = "llvm" },
  { file = "treesitter/sample.mlir", lang = "mlir" },
  { file = "treesitter/sample.td",   lang = "tablegen" },
  { file = "treesitter/sample.vim",  lang = "vim" },
  { file = "treesitter/sample.txt",  lang = "vimdoc" },
  { file = "treesitter/sample.md",   lang = "markdown" },
  { file = "treesitter/sample.toml", lang = "toml" },
}

for _, tc in ipairs(ts_cases) do
  local path = config_dir .. "/test/" .. tc.file
  local bufnr = vim.fn.bufadd(path)
  vim.fn.bufload(bufnr)
  local ok, parser = pcall(vim.treesitter.get_parser, bufnr, tc.lang)
  if ok and parser ~= nil then
    pass("treesitter/" .. tc.lang)
  else
    fail("treesitter/" .. tc.lang, ok and "parser not installed" or parser)
  end
  vim.api.nvim_buf_delete(bufnr, { force = true })
end

-- ---------------------------------------------------------------------------
-- Conform suite
-- ---------------------------------------------------------------------------
local conform_cases = {
  { file = "conform/sample.py",  ft = "python" },
  { file = "conform/sample.c",   ft = "c" },
  { file = "conform/sample.cpp", ft = "cpp" },
}

for _, tc in ipairs(conform_cases) do
  local path = config_dir .. "/test/" .. tc.file
  local bufnr = vim.fn.bufadd(path)
  vim.fn.bufload(bufnr)
  vim.bo[bufnr].filetype = tc.ft
  local ok, result = pcall(require("conform").list_formatters_for_buffer, bufnr)
  if ok and result and #result > 0 then
    pass("conform/" .. tc.ft)
  else
    fail("conform/" .. tc.ft, ok and "no formatters found" or result)
  end
  vim.api.nvim_buf_delete(bufnr, { force = true })
end

-- ---------------------------------------------------------------------------
-- LSP suite
-- ---------------------------------------------------------------------------
local lsp_cases = {
  { file = "lsp/sample.py",   ft = "python", server = "pyright" },
  { file = "lsp/sample.cpp",  ft = "cpp",    server = "clangd" },
  { file = "lsp/sample.mlir", ft = "mlir",   server = "clangd" },
}

local lsp_pending = #lsp_cases

for _, tc in ipairs(lsp_cases) do
  local path = config_dir .. "/test/" .. tc.file
  local bufnr = vim.fn.bufadd(path)
  vim.fn.bufload(bufnr)
  vim.bo[bufnr].filetype = tc.ft
  vim.api.nvim_set_current_buf(bufnr)

  local name = "lsp/" .. tc.server .. " (" .. tc.ft .. ")"
  local server = tc.server

  -- Wait up to 5 s for the server to attach
  vim.wait(5000, function()
    for _, c in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
      if c.name == server then return true end
    end
    return false
  end, 200)

  local attached = false
  for _, c in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
    if c.name == server then attached = true; break end
  end

  if attached then pass(name) else fail(name, "server did not attach") end
  vim.api.nvim_buf_delete(bufnr, { force = true })
end

-- ---------------------------------------------------------------------------
-- Report
-- ---------------------------------------------------------------------------
local lines = { "── nvim config tests ──────────────────" }
local failed = 0
for _, r in ipairs(results) do
  if r.ok then
    lines[#lines + 1] = "  ✓ " .. r.name
  else
    lines[#lines + 1] = "  ✗ " .. r.name .. (r.detail and ("  →  " .. r.detail) or "")
    failed = failed + 1
  end
end
lines[#lines + 1] = string.format("───────────────────────────────────────")
lines[#lines + 1] = string.format("  %d passed, %d failed", #results - failed, failed)

vim.notify(table.concat(lines, "\n"), failed == 0 and vim.log.levels.INFO or vim.log.levels.WARN)
