local function get_config_path()
  local home = os.getenv("HOME") or os.getenv("USERPROFILE")
  local config_file = "/.markdownlint-cli2.yaml"

  if vim.fn.has("win32") == 1 then
    return home .. config_file:gsub("/", "\\")
  else
    return home .. config_file
  end
end

return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          args = { "--config", get_config_path(), "--" },
        },
      },
    },
  },
}
