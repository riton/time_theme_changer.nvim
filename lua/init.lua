local M = {}

local function hour_to_colorscheme()
  local hour = tonumber(os.date("%H"))

  local scheme_mode = "dark"
  if hour >= 8 and hour <= 19
  then
    scheme_mode = "light"
  end

  local colorscheme = "catppuccin-mocha"
  if scheme_mode == "dark"
  then
    colorscheme = "tokyonight-night"
  end

  -- print("Setting colorscheme to ", colorscheme, ", hour is ", hour)

  vim.api.nvim_command("colorscheme " .. colorscheme)

end

local function background_job(user_config)
  local timer = vim.loop.new_timer()
  timer:start(1800000, 1800000, vim.schedule_wrap(function()
    hour_to_colorscheme()
  end))
end

M.setup = function(user_config)
  user_config = user_config or {}
  hour_to_colorscheme()
  background_job(user_config)
end

return M
