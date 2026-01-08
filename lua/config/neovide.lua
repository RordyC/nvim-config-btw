if not vim.g.neovide then
	return
end

local scale_file = vim.fn.stdpath("data") .. "/neovide_scale.txt"

local function load_scale()
  local f = io.open(scale_file, "r")
  if f then
    local scale = tonumber(f:read("*l"))
    f:close()
    if scale then
      return scale
    end
  end
  return 1.0
end

local function save_scale()
  local f = io.open(scale_file, "w")
  if f then
    f:write(tostring(vim.g.neovide_scale_factor))
    f:close()
  end
end

local function zoom(delta)
	local scale_factor = math.max(0.5, vim.g.neovide_scale_factor + delta)
	vim.g.neovide_scale_factor = scale_factor
	save_scale()
end

vim.g.neovide_scale_factor = load_scale()
vim.o.guifont = "JetBrainsMono Nerd Font:h14"
vim.g.neovide_fullscreen = true
vim.g.neovide_opacity = 1.0

vim.keymap.set("n", "<leader>=", function() zoom(0.1)  end)
vim.keymap.set("n", "<leader>-", function() zoom(-0.1) end)
