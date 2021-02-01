if SERVER then
	include("bonusreward/server/main.lua")
	AddCSLuaFile("bonusreward/client/msg.lua")
	AddCSLuaFile("bonusreward/config.lua")
end

if CLIENT then
	include("bonusreward/client/msg.lua")
end

include("bonusreward/config.lua")