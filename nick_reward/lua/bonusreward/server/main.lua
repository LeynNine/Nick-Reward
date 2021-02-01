include("bonusreward/config.lua")

util.AddNetworkString("BonusReward_notice")

local function ChatMsg(ply,str)
	--if not IsValid(ply) then return end
	net.Start("BonusReward_notice")
	net.WriteTable({BonusReward.config.Prefix.BracketsColor,"[",BonusReward.config.Prefix.Color,BonusReward.config.Prefix.Text,BonusReward.config.Prefix.BracketsColor,"] ",Color(255,255,255),str})
	net.Send(ply)
end

local function CheckName(ply)
	local Nick = ply:SteamName()
		local founded = false
		for _,v in pairs(BonusReward.config.NickNames) do
			if string.find(Nick,v) then
				founded = true
			end
		end
	return founded
end



timer.Create("BonusReward",BonusReward.config.Time,0, function()
	for _,v in pairs(player.GetAll()) do
		--print(CheckName(v))
		v:SetNWBool("BonusReward_nick",CheckName(v))
		if not CheckName(v) then return end
		if v:GetNWBool("BonusReward_aw",false) == true then return end
		v:SetNWBool("BonusReward_aw",true)
		ChatMsg(v,BonusReward.config.RewardAwMsg)
	end
end)


timer.Create("BonusReward_notifi",BonusReward.config.TimeNotifi,0, function()
	if BonusReward.config.TimeNotifi < 1 then return end
	for _,v in pairs(player.GetAll()) do
		if CheckName(v) then return end
			ChatMsg(v,BonusReward.config.RewardForNicks..table.concat(BonusReward.config.NickNamesPrint," или "))
	end
end)



hook.Add("PlayerSay","GetReward",function(ply,text)
	if text == BonusReward.config.Command then
		if ply:GetNWBool("BonusReward_nick") == false then 
			ChatMsg(ply,BonusReward.config.RewardNoneNick)
			return
		end
		if (ply:GetNWBool("BonusReward_aw",false) == true) then
			ChatMsg(ply,BonusReward.config.RewardedMsg)
			ply:SetNWBool("BonusReward_aw",false)
			ply:addMoney(BonusReward.config.Reward)
		else
			ChatMsg(ply,BonusReward.config.RewardCantMsg)
		end
		return ""
	end
end)