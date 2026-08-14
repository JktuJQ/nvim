require("core.sets")

require("nvim-lazy")

require("core.remaps")

local os_specific = require("core.os_specific")
os_specific.setup_clipboard()
