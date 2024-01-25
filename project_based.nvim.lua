--
-- This can be used by putting .nvim.lua in yout workspace root, or python.lua in ftplugin path
--
-- nvim will load .exrc .nvimrc .nvim.lua located in current directory
-- copy this file to your project root directory for project based nvimsettings
-- or simply use FileType( :help ftplugin  )
-- copy and paste the following to a python.lua under ftplugin folder
-- it will set the variable only if you are working with python file type

local user_profile = os.getenv("UserProfile")
local local_site_packages = user_profile .. "\\AppData\\Roaming\\Python\\Python39\\site-packages"
local local_script = user_profile .. "\\AppData\\Roaming\\Python\\Python39\\Scripts"
vim.env.Path = vim.env.Path .. ";" .. local_site_packages .. ";" .. local_script
vim.g.python_host_prog = "U:\\Python\\Python309\\python.exe"
vim.g.python3_host_prog = "U:\\Python\\Python309\\python.exe"
