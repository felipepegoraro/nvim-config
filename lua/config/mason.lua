require('mason').setup()

require('mason-lspconfig').setup({
    ensure_installed = { "lua_ls" }
})

local lspconfig = require('lspconfig')

local servers = {
  "clangd", "bashls", "tsserver", "texlab", "r_language_server",
  "awk_ls", "pylsp", "gopls", "vimls", "hls", "jdtls", "sqlls",
  "phpactor", "rust_analyzer", "lua_ls"
}

for _,server in ipairs(servers) do
  lspconfig[server].setup({})
end
