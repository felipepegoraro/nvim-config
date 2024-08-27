local config = require("nvim-treesitter.configs")

config.setup {
    ensure_installed = {
        "c", "cpp", "rust", "zig", "haskell",  "lua", "python", "javascript", "typescript",
        "elixir", "glsl", "ada", "cuda", "bash", "awk", "css", "html", "commonlisp", "sql"
    },
    highlight = { enable = true },
    indent = { enable = true },
}
