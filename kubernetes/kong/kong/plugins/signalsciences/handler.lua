-- kong plugin handler

-- Grab pluginname from module name
local plugin_name = ({...})[1]:match("^kong%.plugins%.([^%.]+)")

-- load the base plugin object and create a subclass
local plugin = require("kong.plugins.base_plugin"):extend()

-- constructor
-- do initialization here, runs in the 'init_by_lua_block', 
-- before worker processes are forked.
function plugin:new()
  plugin.super.new(self, plugin_name)

    sigsci = require("SignalSciences")
    -- override defaults.
    sigsci.agenthost = "localhost"
    sigsci.agentport = 12345
    --sigsci.timeout = 100
    --sigsci.maxpost = 100000
    sigsci.reuse_connections = true
    sigsci._SERVER_FLAVOR = sigsci._SERVER_FLAVOR .. ",kong" 
end

--runs in the 'access_by_lua_block'
function plugin:access(plugin_conf)
  plugin.super.access(self)

  sigsci.prerequest()
end

-- runs in the 'log_by_lua_block'
function plugin:log(plugin_conf)
  plugin.super.log(self)

  sigsci.postrequest()
end

-- set the plugin priority, which determines plugin execution order
plugin.PRIORITY = 1000

-- return our plugin object
return plugin
