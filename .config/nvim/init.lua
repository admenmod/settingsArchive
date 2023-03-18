function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end


require('plugins')
require('settings')
require('keymaps')
