BonusReward = {}
BonusReward.config = {}
BonusReward.config.Prefix = {}


BonusReward.config.NickNames = {"SERVER"}
BonusReward.config.NickNamesPrint = {"SERVER"}
BonusReward.config.Reward = 1000
BonusReward.config.Time = 10 
BonusReward.config.TimeNotifi = 20 
BonusReward.config.Command = "!reward"
BonusReward.config.RewardForNicks = "Награда за название сервера в нике: "
BonusReward.config.RewardedMsg = "Бонус получен. Следущий бонус через "..BonusReward.config.Time..' сек.' 
BonusReward.config.RewardAwMsg = "Вам доступен бонус! "..BonusReward.config.Command.." для получения награды." 
BonusReward.config.RewardCantMsg = "Вы не можете получать награду так часто."
BonusReward.config.RewardNoneNick = "Вы не выполнили условия, для получения награды."

BonusReward.config.Prefix.Text = "REWARD"
BonusReward.config.Prefix.Color = Color(255,0,0)
BonusReward.config.Prefix.BracketsColor = Color(0,0,0)