
local is_file_exist = function()
  local f = io.open(".eslintrc", "r")
  if f ~= nil
  then
    io.close(f)
    return true
  else
    return false
  end
end

return {
  is_file_exist
}
