---@section SACOPYBOILERPLATE
-- Author: Nameous Changey
-- Changed: samohtGTO (using it for my self, I dont take credits for this file)
-- GitHub: https://github.com/nameouschangey/STORMWORKS_VSCodeExtension
-- Workshop: https://steamcommunity.com/id/Bilkokuya/myworkshopfiles/?appid=573090
--- Developed using LifeBoatAPI - Stormworks Lua plugin for VSCode - https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--- If you have any issues, please report them here: https://github.com/nameouschangey/STORMWORKS_VSCodeExtension/issues - by Nameous Changey
---@endsection

---@diagnostic disable: undefined-doc-name

---@section samohtAPI 1 samohtAPICLASS
SamohtAPI = SamohtAPI or {}

---@section sa_copy
--- Copies data from (from) to (to)
--- underwrites values copied (leaves original if it exists)
--- Can be used to instantiate classes, or inherit from classes
--- @generic T
--- @param from T source to copy from
--- @param to any destination to copy into
--- @param overwrite boolean true if all keys should be overwritten
--- @overload fun(from:T):T
--- @return T true if the current instance, is a type that inherits from the given class
SamohtAPI.lb_copy = function(from,to,overwrite)
    to=to or {}
    for k,v in pairs(from) do
        to[k] = not overwrite and to[k] or v  --underwrites, so the original values are kept if they existed
    end
    return to
end;
---@endsection

---@section lb_doNothing
--- An empty function for any stubs, but also reducing the code needed for 
---   "if onHoverFunction ~= nil then onHoverFunction end -> (onHoverFunction or LBEmptyFunction)()"
---@vararg any any
SamohtAPI.lb_doNothing = function()end;
---@endsection

---@endsection samohtAPICLASS
