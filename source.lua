-- SERVICES --
local TeleportService = game:GetService("TeleportService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")


-- MODULE --
local module = table.create(1)
module.__index = module


local console_message =
[[

 ██████╗██╗     ██╗███╗   ██╗████████╗    ██╗  ██╗ █████╗ ███████╗    ██████╗ ███████╗███████╗███╗   ██╗    ██╗███╗   ██╗     ██╗███████╗ ██████╗████████╗███████╗██████╗ ██╗
██╔════╝██║     ██║████╗  ██║╚══██╔══╝    ██║  ██║██╔══██╗██╔════╝    ██╔══██╗██╔════╝██╔════╝████╗  ██║    ██║████╗  ██║     ██║██╔════╝██╔════╝╚══██╔══╝██╔════╝██╔══██╗██║
██║     ██║     ██║██╔██╗ ██║   ██║       ███████║███████║███████╗    ██████╔╝█████╗  █████╗  ██╔██╗ ██║    ██║██╔██╗ ██║     ██║█████╗  ██║        ██║   █████╗  ██║  ██║██║
██║     ██║     ██║██║╚██╗██║   ██║       ██╔══██║██╔══██║╚════██║    ██╔══██╗██╔══╝  ██╔══╝  ██║╚██╗██║    ██║██║╚██╗██║██   ██║██╔══╝  ██║        ██║   ██╔══╝  ██║  ██║╚═╝
╚██████╗███████╗██║██║ ╚████║   ██║       ██║  ██║██║  ██║███████║    ██████╔╝███████╗███████╗██║ ╚████║    ██║██║ ╚████║╚█████╔╝███████╗╚██████╗   ██║   ███████╗██████╔╝██╗
 ╚═════╝╚══════╝╚═╝╚═╝  ╚═══╝   ╚═╝       ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝    ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═══╝    ╚═╝╚═╝  ╚═══╝ ╚════╝ ╚══════╝ ╚═════╝   ╚═╝   ╚══════╝╚═════╝ ╚═╝
                                                                                                                                                                             
]]
warn()

function module:FindChild(Instance, Instance_Name, Recursively)
   local Parent, Object, FromDescendants = Instance, nil, Recursively == true or false
   if FromDescendants then
       for _, v in next, Parent:GetDescendants() do
           if v.Name == Instance_Name then
              Object = v
           end
       end
    else
       for _, v in next, Parent:GetDescendants() do
          if v.Name == Instance_Name then
             Object = v
          end
       end
   end
   return Object, typeof(Object) == "Instance" or Object ~= nil
end


function module:IsApart(Parent, Instance_Name)
   for _, v in next, Parent:GetChildren() do
       if v.Parent == Instance_Name then
          return true
       end
   end
   return false
end


function module:Teleport(id)
    TeleportService:Teleport(id or game.PlaceId)
    return module
end


function module:Then(func)
   if not type(func) == "function" then
       return;
   end
   func()
end


return module
