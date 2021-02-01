net.Receive("BonusReward_notice",function(len,ply)
	chat.AddText(unpack(net.ReadTable()))
end)