-- UI CREATE BY HOANG NAM
local plr = game.Players.LocalPlayer
function Tween(cframeto)
    local targetY = cframeto.Y
    local plrhrp = plr and plr.Character and plr.Character:FindFirstChild('HumanoidRootPart')
    local Distance = (cframeto.Position - plrhrp.Position).Magnitude
    if not plrhrp then return end
    if not cframeto then return end
    tween = game:GetService('TweenService'):Create(plrhrp, TweenInfo.new(Distance/325, Enum.EasingStyle.Linear), {CFrame = cframeto})
    plrhrp.CFrame = CFrame.new(plrhrp.CFrame.X, targetY, plrhrp.CFrame.Z)
    for _, v in pairs(plr.Character:GetDescendants()) do
        if v:IsA("BasePart") and v.CanCollide == true then
            v.CanCollide = false
        end
    end
    tween:Play()
end
function CheckMob(cccc, cc)
    for r, v in pairs(workspace.Enemies:GetChildren()) do
        if ((typeof(cccc) == "table" and table.find(cccc, v.Name)) or (typeof(cccc) == 'string' and v.Name == cccc)) and v:FindFirstChild('HumanoidRootPart') and v:FindFirstChild('Humanoid') and v.Humanoid.Health > 0 then
            return v
        end
    end
    if cc then
        for r, v in pairs(game.ReplicatedStorage:GetChildren()) do
            if ((typeof(cccc) == "table" and table.find(cccc, v.Name)) or (typeof(cccc) == 'string' and v.Name == cccc)) and v:FindFirstChild('HumanoidRootPart') and v:FindFirstChild('Humanoid') and v.Humanoid.Health > 0 then
                return v
            end
        end
    end
end
function GetWeapon()
    for r, v in pairs(plr.Backpack:GetChildren()) do
        if v:IsA('Tool') and v.ToolTip == getgenv().SelectTool then
            return v.Name
        end
    end
    for r, v in pairs(plr.Character:GetChildren()) do
        if v:IsA('Tool') and v.ToolTip == getgenv().SelectTool then
            return v.Name
        end
    end
end
function EquipTool(lol)
    local tool = plr.Backpack:FindFirstChild(lol)
    if tool and plr.Character:FindFirstChild('Humanoid') and plr.Character.Humanoid.Health > 0 then
        plr.Character.Humanoid:EquipTool(tool)
    end
end
function EnableBuso()
    if not plr.Character:FindFirstChild('HasBuso') then
        local args = {
            [1] = "Buso"
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))        
    end
end
function InMyNetWork(object)
	if isnetworkowner then
		return isnetworkowner(object)
	else
		if (object.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 350 then 
			return true
		end
		return false
	end
end
function BringMob(mob, BringCFrame)
    for r, v in pairs(workspace.Enemies:GetChildren()) do
        if v.Name == mob.Name and v:FindFirstChild('Humanoid') and v.Humanoid.Health > 0 and v:FindFirstChild('HumanoidRootPart') and InMyNetWork(v.HumanoidRootPart) and (v.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 180 then
            v.Head.CanCollide = false
            task.spawn(function()
                for r, v in pairs(v:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end)
            v.HumanoidRootPart.CFrame = BringCFrame
            if v.Humanoid:FindFirstChild("Animator") then
                v.Humanoid.Animator:Destroy()
            end
            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
        end
    end
end
function AutoKatakuri()
    if CheckMob({'Cake Prince', 'Dough King'}, true) then
        local v = CheckMob({'Cake Prince', 'Dough King'})
        repeat task.wait()
            EnableBuso()
            EquipTool(GetWeapon())
            Tween(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
        until not v or getgenv().AutoKatakuri == false
    else
        if CheckMob({'Cookie Crafter', 'Cake Guard', 'Baking Staff', 'Head Baker'}) then
            local v = CheckMob({'Cookie Crafter', 'Cake Guard', 'Baking Staff', 'Head Baker'})
            repeat task.wait()
                EnableBuso()
                BringMob(v, v.HumanoidRootPart.CFrame)
                EquipTool(GetWeapon())
                Tween(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
            until not v or getgenv().AutoKatakuri == false
        else
            Tween(CFrame.new(-2125.924072265625, 80.89720153808594, -12237.4072265625))
        end
    end
end
_G.FastAttack = true;
if _G.FastAttack then
	local _ENV = (getgenv or getrenv or getfenv)();
	local function v905(v1827, v1828)
		local v1829, v1830 = pcall(function()
			return v1827:WaitForChild(v1828);
		end);
		if ( not v1829 or  not v1830) then
			warn("noooooo: "   .. v1828 );
		end
		return v1830;
	end
	local function v906(v1831, ...)
		local v1832 = v1831;
		for v1973, v1974 in {
			...
		} do
			v1832 = v1832:FindFirstChild(v1974) or v905(v1832, v1974) ;
			if  not v1832 then
				break;
			end
		end
		return v1832;
	end
	local v907 = game:GetService("VirtualInputManager");
	local v908 = game:GetService("CollectionService");
	local v909 = game:GetService("ReplicatedStorage");
	local v910 = game:GetService("TeleportService");
	local v911 = game:GetService("RunService");
	local v912 = game:GetService("Players");
	local v913 = v912.LocalPlayer;
	if  not v913 then
		warn("Không tìm thấy người chơi cục bộ.");
		return;
	end
	local v914 = v905(v909, "Remotes");
	if  not v914 then
		return;
	end
	local v915 = v905(v914, "Validator");
	local v916 = v905(v914, "CommF_");
	local v917 = v905(v914, "CommE");
	local v918 = v905(workspace, "ChestModels");
	local v919 = v905(workspace, "_WorldOrigin");
	local v920 = v905(workspace, "Characters");
	local v921 = v905(workspace, "Enemies");
	local v922 = v905(workspace, "Map");
	local v923 = v905(v919, "EnemySpawns");
	local v924 = v905(v919, "Locations");
	local v925 = v911.RenderStepped;
	local v926 = v911.Heartbeat;
	local v927 = v911.Stepped;
	local v928 = v905(v909, "Modules");
	local v929 = v905(v928, "Net");
	local v930 = sethiddenproperty or function(...)
		return ...;
	end ;
	local v931 = setupvalue or (debug and debug.setupvalue) ;
	local v932 = getupvalue or (debug and debug.getupvalue) ;
	local v933 = {
		AutoClick = true,
		ClickDelay = 0
	};
	local v934 = {};
	v934.FastAttack = (function()
		if _ENV.rz_FastAttack then
			return _ENV.rz_FastAttack;
		end
		local v1833 = {
			Distance = 100,
			attackMobs = true,
			attackPlayers = true,
			Equipped = nil
		};
		local v1834 = v905(v929, "RE/RegisterAttack");
		local v1835 = v905(v929, "RE/RegisterHit");
		local function v1836(v1975)
			return v1975 and v1975:FindFirstChild("Humanoid") and (v1975.Humanoid.Health > 0) ;
		end
		local function v1837(v1976, v1977)
			local v1978 = nil;
			for v2081, v2082 in v1977:GetChildren() do
				local v2083 = v2082:FindFirstChild("Head");
				if (v2083 and v1836(v2082) and (v913:DistanceFromCharacter(v2083.Position) < v1833.Distance)) then
					if (v2082 ~= v913.Character) then
						table.insert(v1976, {
							v2082,
							v2083
						});
						v1978 = v2083;
					end
				end
			end
			return v1978;
		end
		v1833.Attack = function(v1979, v1980, v1981)
			if ( not v1980 or ( #v1981 == 0)) then
				return;
			end
			v1834:FireServer(v933.ClickDelay or 0 );
			v1835:FireServer(v1980, v1981);
		end;
		v1833.AttackNearest = function(v1982)
			local v1983 = {};
			local v1984 = v1837(v1983, v921);
			local v1985 = v1837(v1983, v920);
			if ( #v1983 > 0) then
				v1982:Attack(v1984 or v1985 , v1983);
			else
				task.wait(0);
			end
		end;
		v1833.BladeHits = function(v1986)
			local v1987 = v1836(v913.Character) and v913.Character:FindFirstChildOfClass("Tool") ;
			if (v1987 and (v1987.ToolTip ~= "Gun")) then
				v1986:AttackNearest();
			else
				task.wait(0);
			end
		end;
		task.spawn(function()
			while task.wait(v933.ClickDelay) do
				if v933.AutoClick then
					v1833:BladeHits();
				end
			end
		end);
		_ENV.rz_FastAttack = v1833;
		return v1833;
	end)();
end
if setscriptable then
	setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
end
if (game.PlaceId == 2753915549) then
	World1 = true;
elseif (game.PlaceId == 4442272183) then
	World2 = true;
elseif (game.PlaceId == 7449423635) then
	World3 = true;
end
function CheckQuest()
	MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value;
	if World1 then
		if ((MyLevel == 1) or (MyLevel <= 9)) then
			Mon = "Bandit";
			LevelQuest = 1;
			NameQuest = "BanditQuest1";
			NameMon = "Bandit";
			CFrameQuest = CFrame.new(1059, 17, 1546);
			CFrameMon = CFrame.new(943, 45, 1562);
		elseif ((MyLevel == 10) or (MyLevel <= 14)) then
			Mon = "Monkey";
			LevelQuest = 1;
			NameQuest = "JungleQuest";
			NameMon = "Monkey";
			CFrameQuest = CFrame.new( -1598, 37, 153);
			CFrameMon = CFrame.new( -1524, 50, 37);
		elseif ((MyLevel == 15) or (MyLevel <= 29)) then
			Mon = "Gorilla";
			LevelQuest = 2;
			NameQuest = "JungleQuest";
			NameMon = "Gorilla";
			CFrameQuest = CFrame.new( -1598, 37, 153);
			CFrameMon = CFrame.new( -1128, 40, -451);
		elseif ((MyLevel == 30) or (MyLevel <= 39)) then
			Mon = "Pirate";
			LevelQuest = 1;
			NameQuest = "BuggyQuest1";
			NameMon = "Pirate";
			CFrameQuest = CFrame.new( -1140, 4, 3829);
			CFrameMon = CFrame.new( -1262, 40, 3905);
		elseif ((MyLevel == 40) or (MyLevel <= 59)) then
			Mon = "Brute";
			LevelQuest = 2;
			NameQuest = "BuggyQuest1";
			NameMon = "Brute";
			CFrameQuest = CFrame.new( -1140, 4, 3829);
			CFrameMon = CFrame.new( -976, 55, 4304);
		elseif ((MyLevel == 60) or (MyLevel <= 74)) then
			Mon = "Desert Bandit";
			LevelQuest = 1;
			NameQuest = "DesertQuest";
			NameMon = "Desert Bandit";
			CFrameQuest = CFrame.new(897, 6, 4389);
			CFrameMon = CFrame.new(924, 7, 4482);
		elseif ((MyLevel == 75) or (MyLevel <= 89)) then
			Mon = "Desert Officer";
			LevelQuest = 2;
			NameQuest = "DesertQuest";
			NameMon = "Desert Officer";
			CFrameQuest = CFrame.new(897, 6, 4389);
			CFrameMon = CFrame.new(1608, 9, 4371);
		elseif ((MyLevel == 90) or (MyLevel <= 99)) then
			Mon = "Snow Bandit";
			LevelQuest = 1;
			NameQuest = "SnowQuest";
			NameMon = "Snow Bandit";
			CFrameQuest = CFrame.new(1385, 87, -1298);
			CFrameMon = CFrame.new(1362, 120, -1531);
		elseif ((MyLevel == 100) or (MyLevel <= 119)) then
			Mon = "Snowman";
			LevelQuest = 2;
			NameQuest = "SnowQuest";
			NameMon = "Snowman";
			CFrameQuest = CFrame.new(1385, 87, -1298);
			CFrameMon = CFrame.new(1243, 140, -1437);
		elseif ((MyLevel == 120) or (MyLevel <= 149)) then
			Mon = "Chief Petty Officer";
			LevelQuest = 1;
			NameQuest = "MarineQuest2";
			NameMon = "Chief Petty Officer";
			CFrameQuest = CFrame.new( -5035, 29, 4326);
			CFrameMon = CFrame.new( -4881, 23, 4274);
		elseif ((MyLevel == 150) or (MyLevel <= 174)) then
			Mon = "Sky Bandit";
			LevelQuest = 1;
			NameQuest = "SkyQuest";
			NameMon = "Sky Bandit";
			CFrameQuest = CFrame.new( -4844, 718, -2621);
			CFrameMon = CFrame.new( -4953, 296, -2899);
		elseif ((MyLevel == 175) or (MyLevel <= 189)) then
			Mon = "Dark Master";
			LevelQuest = 2;
			NameQuest = "SkyQuest";
			NameMon = "Dark Master";
			CFrameQuest = CFrame.new( -4844, 718, -2621);
			CFrameMon = CFrame.new( -5260, 391, -2229);
		elseif ((MyLevel == 190) or (MyLevel <= 209)) then
			Mon = "Prisoner";
			LevelQuest = 1;
			NameQuest = "PrisonerQuest";
			NameMon = "Prisoner";
			CFrameQuest = CFrame.new(5306, 2, 477);
			CFrameMon = CFrame.new(5099, "-0", 474);
		elseif ((MyLevel == 210) or (MyLevel <= 249)) then
			Mon = "Dangerous Prisoner";
			LevelQuest = 2;
			NameQuest = "PrisonerQuest";
			NameMon = "Dangerous Prisoner";
			CFrameQuest = CFrame.new(5306, 2, 477);
			CFrameMon = CFrame.new(5655, 16, 866);
		elseif ((MyLevel == 250) or (MyLevel <= 274)) then
			Mon = "Toga Warrior";
			LevelQuest = 1;
			NameQuest = "ColosseumQuest";
			NameMon = "Toga Warrior";
			CFrameQuest = CFrame.new( -1581, 7, -2982);
			CFrameMon = CFrame.new( -1820, 51, -2741);
		elseif ((MyLevel == 275) or (MyLevel <= 299)) then
			Mon = "Gladiator";
			LevelQuest = 2;
			NameQuest = "ColosseumQuest";
			NameMon = "Gladiator";
			CFrameQuest = CFrame.new( -1581, 7, -2982);
			CFrameMon = CFrame.new( -1268, 30, -2996);
		elseif ((MyLevel == 300) or (MyLevel <= 324)) then
			Mon = "Military Soldier";
			LevelQuest = 1;
			NameQuest = "MagmaQuest";
			NameMon = "Military Soldier";
			CFrameQuest = CFrame.new( -5319, 12, 8515);
			CFrameMon = CFrame.new( -5335, 46, 8638);
		elseif ((MyLevel == 325) or (MyLevel <= 374)) then
			Mon = "Military Spy";
			LevelQuest = 2;
			NameQuest = "MagmaQuest";
			NameMon = "Military Spy";
			CFrameQuest = CFrame.new( -5319, 12, 8515);
			CFrameMon = CFrame.new( -5803, 86, 8829);
		elseif ((MyLevel == 375) or (MyLevel <= 399)) then
			Mon = "Fishman Warrior";
			LevelQuest = 1;
			NameQuest = "FishmanQuest";
			NameMon = "Fishman Warrior";
			CFrameQuest = CFrame.new(61122, 18, 1567);
			CFrameMon = CFrame.new(60998, 50, 1534);
		elseif ((MyLevel == 400) or (MyLevel <= 449)) then
			Mon = "Fishman Commando";
			LevelQuest = 2;
			NameQuest = "FishmanQuest";
			NameMon = "Fishman Commando";
			CFrameQuest = CFrame.new(61122, 18, 1567);
			CFrameMon = CFrame.new(61866, 55, 1655);
		elseif ((MyLevel == 450) or (MyLevel <= 474)) then
			Mon = "God's Guard";
			LevelQuest = 1;
			NameQuest = "SkyExp1Quest";
			NameMon = "God's Guard";
			CFrameQuest = CFrame.new( -4720, 846, -1951);
			CFrameMon = CFrame.new( -4720, 846, -1951);
		elseif ((MyLevel == 475) or (MyLevel <= 524)) then
			Mon = "Shanda";
			LevelQuest = 2;
			NameQuest = "SkyExp1Quest";
			NameMon = "Shanda";
			CFrameQuest = CFrame.new( -7861, 5545, -381);
			CFrameMon = CFrame.new( -7741, 5580, -395);
		elseif ((MyLevel == 525) or (MyLevel <= 549)) then
			Mon = "Royal Squad";
			LevelQuest = 1;
			NameQuest = "SkyExp2Quest";
			NameMon = "Royal Squad";
			CFrameQuest = CFrame.new( -7903, 5636, -1412);
			CFrameMon = CFrame.new( -7727, 5650, -1410);
		elseif ((MyLevel == 550) or (MyLevel <= 624)) then
			Mon = "Royal Soldier";
			LevelQuest = 2;
			NameQuest = "SkyExp2Quest";
			NameMon = "Royal Soldier";
			CFrameQuest = CFrame.new( -7903, 5636, -1412);
			CFrameMon = CFrame.new( -7894, 5640, -1629);
		elseif ((MyLevel == 625) or (MyLevel <= 649)) then
			Mon = "Galley Pirate";
			LevelQuest = 1;
			NameQuest = "FountainQuest";
			NameMon = "Galley Pirate";
			CFrameQuest = CFrame.new(5258, 39, 4052);
			CFrameMon = CFrame.new(5391, 70, 4023);
		elseif (MyLevel >= 650) then
			Mon = "Galley Captain";
			LevelQuest = 2;
			NameQuest = "FountainQuest";
			NameMon = "Galley Captain";
			CFrameQuest = CFrame.new(5258, 39, 4052);
			CFrameMon = CFrame.new(5985, 70, 4790);
		end
	elseif World2 then
		if ((MyLevel == 700) or (MyLevel <= 724)) then
			Mon = "Raider";
			LevelQuest = 1;
			NameQuest = "Area1Quest";
			NameMon = "Raider";
			CFrameQuest = CFrame.new( -427, 73, 1835);
			CFrameMon = CFrame.new( -614, 90, 2240);
		elseif ((MyLevel == 725) or (MyLevel <= 774)) then
			Mon = "Mercenary";
			LevelQuest = 2;
			NameQuest = "Area1Quest";
			NameMon = "Mercenary";
			CFrameQuest = CFrame.new( -427, 73, 1835);
			CFrameMon = CFrame.new( -867, 110, 1621);
		elseif ((MyLevel == 775) or (MyLevel <= 874)) then
			Mon = "Swan Pirate";
			LevelQuest = 1;
			NameQuest = "Area2Quest";
			NameMon = "Swan Pirate";
			CFrameQuest = CFrame.new(635, 73, 919);
			CFrameMon = CFrame.new(635, 73, 919);
		elseif ((MyLevel == 875) or (MyLevel <= 899)) then
			Mon = "Marine Lieutenant";
			LevelQuest = 1;
			NameQuest = "MarineQuest3";
			NameMon = "Marine Lieutenant";
			CFrameQuest = CFrame.new( -2441, 73, -3219);
			CFrameMon = CFrame.new( -2552, 110, -3050);
		elseif ((MyLevel == 900) or (MyLevel <= 949)) then
			Mon = "Marine Captain";
			LevelQuest = 2;
			NameQuest = "MarineQuest3";
			NameMon = "Marine Captain";
			CFrameQuest = CFrame.new( -2441, 73, -3219);
			CFrameMon = CFrame.new( -1695, 110, -3299);
		elseif ((MyLevel == 950) or (MyLevel <= 974)) then
			Mon = "Zombie";
			LevelQuest = 1;
			NameQuest = "ZombieQuest";
			NameMon = "Zombie";
			CFrameQuest = CFrame.new( -5495, 48, -794);
			CFrameMon = CFrame.new( -5715, 90, -917);
		elseif ((MyLevel == 975) or (MyLevel <= 999)) then
			Mon = "Vampire";
			LevelQuest = 2;
			NameQuest = "ZombieQuest";
			NameMon = "Vampire";
			CFrameQuest = CFrame.new( -5495, 48, -794);
			CFrameMon = CFrame.new( -6027, 50, -1130);
		elseif ((MyLevel == 1000) or (MyLevel <= 1049)) then
			Mon = "Snow Trooper";
			LevelQuest = 1;
			NameQuest = "SnowMountainQuest";
			NameMon = "Snow Trooper";
			CFrameQuest = CFrame.new(607, 401, -5371);
			CFrameMon = CFrame.new(445, 440, -5175);
		elseif ((MyLevel == 1050) or (MyLevel <= 1099)) then
			Mon = "Winter Warrior";
			LevelQuest = 2;
			NameQuest = "SnowMountainQuest";
			NameMon = "Winter Warrior";
			CFrameQuest = CFrame.new(607, 401, -5371);
			CFrameMon = CFrame.new(1224, 460, -5332);
		elseif ((MyLevel == 1100) or (MyLevel <= 1124)) then
			Mon = "Lab Subordinate";
			LevelQuest = 1;
			NameQuest = "IceSideQuest";
			NameMon = "Lab Subordinate";
			CFrameQuest = CFrame.new( -6061, 16, -4904);
			CFrameMon = CFrame.new( -5941, 50, -4322);
		elseif ((MyLevel == 1125) or (MyLevel <= 1174)) then
			Mon = "Horned Warrior";
			LevelQuest = 2;
			NameQuest = "IceSideQuest";
			NameMon = "Horned Warrior";
			CFrameQuest = CFrame.new( -6061, 16, -4904);
			CFrameMon = CFrame.new( -6306, 50, -5752);
		elseif ((MyLevel == 1175) or (MyLevel <= 1199)) then
			Mon = "Magma Ninja";
			LevelQuest = 1;
			NameQuest = "FireSideQuest";
			NameMon = "Magma Ninja";
			CFrameQuest = CFrame.new( -5430, 16, -5298);
			CFrameMon = CFrame.new( -5233, 60, -6227);
		elseif ((MyLevel == 1200) or (MyLevel <= 1249)) then
			Mon = "Lava Pirate";
			LevelQuest = 2;
			NameQuest = "FireSideQuest";
			NameMon = "Lava Pirate";
			CFrameQuest = CFrame.new( -5430, 16, -5298);
			CFrameMon = CFrame.new( -4955, 60, -4836);
		elseif ((MyLevel == 1250) or (MyLevel <= 1274)) then
			Mon = "Ship Deckhand";
			LevelQuest = 1;
			NameQuest = "ShipQuest1";
			NameMon = "Ship Deckhand";
			CFrameQuest = CFrame.new(1033, 125, 32909);
			CFrameMon = CFrame.new(1033, 125, 32909);
		elseif ((MyLevel == 1275) or (MyLevel <= 1299)) then
			Mon = "Ship Engineer";
			LevelQuest = 2;
			NameQuest = "ShipQuest1";
			NameMon = "Ship Engineer";
			CFrameQuest = CFrame.new(1033, 125, 32909);
			CFrameMon = CFrame.new(809, 80, 33090);
		elseif ((MyLevel == 1300) or (MyLevel <= 1324)) then
			Mon = "Ship Steward";
			LevelQuest = 1;
			NameQuest = "ShipQuest2";
			NameMon = "Ship Steward";
			CFrameQuest = CFrame.new(973, 125, 33245);
			CFrameMon = CFrame.new(838, 160, 33408);
		elseif ((MyLevel == 1325) or (MyLevel <= 1349)) then
			Mon = "Ship Officer";
			LevelQuest = 2;
			NameQuest = "ShipQuest2";
			NameMon = "Ship Officer";
			CFrameQuest = CFrame.new(973, 125, 33245);
			CFrameMon = CFrame.new(1238, 220, 33148);
		elseif ((MyLevel == 1350) or (MyLevel <= 1374)) then
			Mon = "Arctic Warrior";
			LevelQuest = 1;
			NameQuest = "FrostQuest";
			NameMon = "Arctic Warrior";
			CFrameQuest = CFrame.new(5668, 28, -6484);
			CFrameMon = CFrame.new(5836, 80, -6257);
		elseif ((MyLevel == 1375) or (MyLevel <= 1424)) then
			Mon = "Snow Lurker";
			LevelQuest = 2;
			NameQuest = "FrostQuest";
			NameMon = "Snow Lurker";
			CFrameQuest = CFrame.new(5668, 28, -6484);
			CFrameMon = CFrame.new(5700, 80, -6724);
		elseif ((MyLevel == 1425) or (MyLevel <= 1449)) then
			Mon = "Sea Soldier";
			LevelQuest = 1;
			NameQuest = "ForgottenQuest";
			NameMon = "Sea Soldier";
			CFrameQuest = CFrame.new( -3056, 240, -10145);
			CFrameMon = CFrame.new( -2583, 80, -9821);
		elseif (MyLevel >= 1450) then
			Mon = "Water Fighter";
			LevelQuest = 2;
			NameQuest = "ForgottenQuest";
			NameMon = "Water Fighter";
			CFrameQuest = CFrame.new( -3056, 240, -10145);
			CFrameMon = CFrame.new( -3339, 290, -10412);
		end
	elseif World3 then
		if ((MyLevel == 1500) or (MyLevel <= 1524)) then
			Mon = "Pirate Millionaire";
			LevelQuest = 1;
			NameQuest = "PiratePortQuest";
			NameMon = "Pirate Millionaire";
			CFrameQuest = CFrame.new( -291, 44, 5580);
			CFrameMon = CFrame.new( -44, 70, 5623);
		elseif ((MyLevel == 1525) or (MyLevel <= 1574)) then
			Mon = "Pistol Billionaire";
			LevelQuest = 2;
			NameQuest = "PiratePortQuest";
			NameMon = "Pistol Billionaire";
			CFrameQuest = CFrame.new( -291, 44, 5580);
			CFrameMon = CFrame.new(219, 105, 6018);
		elseif ((MyLevel == 1575) or (MyLevel <= 1599)) then
			Mon = "Dragon Crew Warrior";
			LevelQuest = 1;
			NameQuest = "AmazonQuest";
			NameMon = "Dragon Crew Warrior";
			CFrameQuest = CFrame.new(5834, 51, -1103);
			CFrameMon = CFrame.new(5992, 90, -1581);
		elseif ((MyLevel == 1600) or (MyLevel <= 1624)) then
			Mon = "Dragon Crew Archer";
			NameQuest = "AmazonQuest";
			LevelQuest = 2;
			NameMon = "Dragon Crew Archer";
			CFrameQuest = CFrame.new(5834, 51, -1103);
			CFrameMon = CFrame.new(6472, 370, -151);
		elseif ((MyLevel == 1625) or (MyLevel <= 1649)) then
			Mon = "Female Islander";
			NameQuest = "AmazonQuest2";
			LevelQuest = 1;
			NameMon = "Female Islander";
			CFrameQuest = CFrame.new(5448, 602, 748);
			CFrameMon = CFrame.new(4836, 740, 928);
		elseif ((MyLevel == 1650) or (MyLevel <= 1699)) then
			Mon = "Giant Islander";
			NameQuest = "AmazonQuest2";
			LevelQuest = 2;
			NameMon = "Giant Islander";
			CFrameQuest = CFrame.new(5448, 602, 748);
			CFrameMon = CFrame.new(4784, 660, 155);
		elseif ((MyLevel == 1700) or (MyLevel <= 1724)) then
			Mon = "Marine Commodore";
			LevelQuest = 1;
			NameQuest = "MarineTreeIsland";
			NameMon = "Marine Commodore";
			CFrameQuest = CFrame.new(2180, 29, -6738);
			CFrameMon = CFrame.new(3156, 120, -7837);
		elseif ((MyLevel == 1725) or (MyLevel <= 1774)) then
			Mon = "Marine Rear Admiral";
			NameMon = "Marine Rear Admiral";
			NameQuest = "MarineTreeIsland";
			LevelQuest = 2;
			CFrameQuest = CFrame.new(2180, 29, -6738);
			CFrameMon = CFrame.new(3205, 120, -6742);
		elseif ((MyLevel == 1775) or (MyLevel <= 1799)) then
			Mon = "Fishman Raider";
			LevelQuest = 1;
			NameQuest = "DeepForestIsland3";
			NameMon = "Fishman Raider";
			CFrameQuest = CFrame.new( -10581, 332, -8758);
			CFrameMon = CFrame.new( -10550, 380, -8574);
		elseif ((MyLevel == 1800) or (MyLevel <= 1824)) then
			Mon = "Fishman Captain";
			LevelQuest = 2;
			NameQuest = "DeepForestIsland3";
			NameMon = "Fishman Captain";
			CFrameQuest = CFrame.new( -10581, 332, -8758);
			CFrameMon = CFrame.new( -10764, 380, -8799);
		elseif ((MyLevel == 1825) or (MyLevel <= 1849)) then
			Mon = "Forest Pirate";
			LevelQuest = 1;
			NameQuest = "DeepForestIsland";
			NameMon = "Forest Pirate";
			CFrameQuest = CFrame.new( -13233, 332, -7626);
			CFrameMon = CFrame.new( -13335, 380, -7660);
		elseif ((MyLevel == 1850) or (MyLevel <= 1899)) then
			Mon = "Mythological Pirate";
			LevelQuest = 2;
			NameQuest = "DeepForestIsland";
			NameMon = "Mythological Pirate";
			CFrameQuest = CFrame.new( -13233, 332, -7626);
			CFrameMon = CFrame.new( -13844, 520, -7016);
		elseif ((MyLevel == 1900) or (MyLevel <= 1924)) then
			Mon = "Jungle Pirate";
			LevelQuest = 1;
			NameQuest = "DeepForestIsland2";
			NameMon = "Jungle Pirate";
			CFrameQuest = CFrame.new( -12682, 391, -9901);
			CFrameMon = CFrame.new( -12166, 380, -10375);
		elseif ((MyLevel == 1925) or (MyLevel <= 1974)) then
			Mon = "Musketeer Pirate";
			LevelQuest = 2;
			NameQuest = "DeepForestIsland2";
			NameMon = "Musketeer Pirate";
			CFrameQuest = CFrame.new( -12682, 391, -9901);
			CFrameMon = CFrame.new( -13098, 450, -9831);
		elseif ((MyLevel == 1975) or (MyLevel <= 1999)) then
			Mon = "Reborn Skeleton";
			LevelQuest = 1;
			NameQuest = "HauntedQuest1";
			NameMon = "Reborn Skeleton";
			CFrameQuest = CFrame.new( -9481, 142, 5565);
			CFrameMon = CFrame.new( -8680, 190, 5852);
		elseif ((MyLevel == 2000) or (MyLevel <= 2024)) then
			Mon = "Living Zombie";
			LevelQuest = 2;
			NameQuest = "HauntedQuest1";
			NameMon = "Living Zombie";
			CFrameQuest = CFrame.new( -9481, 142, 5565);
			CFrameMon = CFrame.new( -10144, 140, 5932);
		elseif ((MyLevel == 2025) or (MyLevel <= 2049)) then
			Mon = "Demonic Soul";
			LevelQuest = 1;
			NameQuest = "HauntedQuest2";
			NameMon = "Demonic Soul";
			CFrameQuest = CFrame.new( -9515, 172, 607);
			CFrameMon = CFrame.new( -9275, 210, 6166);
		elseif ((MyLevel == 2050) or (MyLevel <= 2074)) then
			Mon = "Posessed Mummy";
			LevelQuest = 2;
			NameQuest = "HauntedQuest2";
			NameMon = "Posessed Mummy";
			CFrameQuest = CFrame.new( -9515, 172, 607);
			CFrameMon = CFrame.new( -9442, 60, 6304);
		elseif ((MyLevel == 2075) or (MyLevel <= 2099)) then
			Mon = "Peanut Scout";
			LevelQuest = 1;
			NameQuest = "NutsIslandQuest";
			NameMon = "Peanut Scout";
			CFrameQuest = CFrame.new( -2104, 38, -10194);
			CFrameMon = CFrame.new( -1870, 100, -10225);
		elseif ((MyLevel == 2100) or (MyLevel <= 2124)) then
			Mon = "Peanut President";
			LevelQuest = 2;
			NameQuest = "NutsIslandQuest";
			NameMon = "Peanut President";
			CFrameQuest = CFrame.new( -2104, 38, -10194);
			CFrameMon = CFrame.new( -2005, 100, -10585);
		elseif ((MyLevel == 2125) or (MyLevel <= 2149)) then
			Mon = "Ice Cream Chef";
			LevelQuest = 1;
			NameQuest = "IceCreamIslandQuest";
			NameMon = "Ice Cream Chef";
			CFrameQuest = CFrame.new( -818, 66, -10964);
			CFrameMon = CFrame.new( -501, 100, -10883);
		elseif ((MyLevel == 2150) or (MyLevel <= 2199)) then
			Mon = "Ice Cream Commander";
			LevelQuest = 2;
			NameQuest = "IceCreamIslandQuest";
			NameMon = "Ice Cream Commander";
			CFrameQuest = CFrame.new( -818, 66, -10964);
			CFrameMon = CFrame.new( -690, 100, -11350);
		elseif ((MyLevel == 2200) or (MyLevel <= 2224)) then
			Mon = "Cookie Crafter";
			LevelQuest = 1;
			NameQuest = "CakeQuest1";
			NameMon = "Cookie Crafter";
			CFrameQuest = CFrame.new( -2023, 38, -12028);
			CFrameMon = CFrame.new( -2332, 90, -12049);
		elseif ((MyLevel == 2225) or (MyLevel <= 2249)) then
			Mon = "Cake Guard";
			LevelQuest = 2;
			NameQuest = "CakeQuest1";
			NameMon = "Cake Guard";
			CFrameQuest = CFrame.new( -2023, 38, -12028);
			CFrameMon = CFrame.new( -1514, 90, -12422);
		elseif ((MyLevel == 2250) or (MyLevel <= 2274)) then
			Mon = "Baking Staff";
			LevelQuest = 1;
			NameQuest = "CakeQuest2";
			NameMon = "Baking Staff";
			CFrameQuest = CFrame.new( -1931, 38, -12840);
			CFrameMon = CFrame.new( -1930, 90, -12963);
		elseif ((MyLevel == 2275) or (MyLevel <= 2299)) then
			Mon = "Head Baker";
			LevelQuest = 2;
			NameQuest = "CakeQuest2";
			NameMon = "Head Baker";
			CFrameQuest = CFrame.new( -1931, 38, -12840);
			CFrameMon = CFrame.new( -2123, 110, -12777);
		elseif ((MyLevel == 2300) or (MyLevel <= 2324)) then
			Mon = "Cocoa Warrior";
			LevelQuest = 1;
			NameQuest = "ChocQuest1";
			NameMon = "Cocoa Warrior";
			CFrameQuest = CFrame.new(235, 25, -12199);
			CFrameMon = CFrame.new(110, 80, -12245);
		elseif ((MyLevel == 2325) or (MyLevel <= 2349)) then
			Mon = "Chocolate Bar Battler";
			LevelQuest = 2;
			NameQuest = "ChocQuest1";
			NameMon = "Chocolate Bar Battler";
			CFrameQuest = CFrame.new(235, 25, -12199);
			CFrameMon = CFrame.new(579, 80, -12413);
		elseif ((MyLevel == 2350) or (MyLevel <= 2374)) then
			Mon = "Sweet Thief";
			LevelQuest = 1;
			NameQuest = "ChocQuest2";
			NameMon = "Sweet Thief";
			CFrameQuest = CFrame.new(150, 25, -12777);
			CFrameMon = CFrame.new( -68, 80, -12692);
		elseif ((MyLevel == 2375) or (MyLevel <= 2399)) then
			Mon = "Candy Rebel";
			LevelQuest = 2;
			NameQuest = "ChocQuest2";
			NameMon = "Candy Rebel";
			CFrameQuest = CFrame.new(150, 25, -12777);
			CFrameMon = CFrame.new(17, 80, -12962);
		elseif ((MyLevel == 2400) or (MyLevel <= 2424)) then
			Mon = "Candy Pirate";
			LevelQuest = 1;
			NameQuest = "CandyQuest1";
			NameMon = "Candy Pirate";
			CFrameQuest = CFrame.new( -1148, 14, -14446);
			CFrameMon = CFrame.new( -1371, 70, -14405);
		elseif ((MyLevel == 2425) or (MyLevel <= 2449)) then
			Mon = "Snow Demon";
			LevelQuest = 2;
			NameQuest = "CandyQuest1";
			NameMon = "Snow Demon";
			CFrameQuest = CFrame.new( -1148, 14, -14446);
			CFrameMon = CFrame.new( -836, 70, -14326);
		elseif ((MyLevel == 2450) or (MyLevel <= 2474)) then
			Mon = "Isle Outlaw";
			LevelQuest = 1;
			NameQuest = "TikiQuest1";
			NameMon = "Isle Outlaw";
			CFrameQuest = CFrame.new( -16547, 56, -172);
			CFrameMon = CFrame.new( -16431, 90, -223);
		elseif ((MyLevel == 2475) or (MyLevel <= 2499)) then
			Mon = "Island Boy";
			LevelQuest = 2;
			NameQuest = "TikiQuest1";
			NameMon = "Island Boy";
			CFrameQuest = CFrame.new( -16547, 56, -172);
			CFrameMon = CFrame.new( -16668, 70, -243);
		elseif ((MyLevel == 2500) or (MyLevel <= 2524)) then
			Mon = "Sun-kissed Warrior";
			LevelQuest = 1;
			NameQuest = "TikiQuest2";
			NameMon = "kissed";
			CFrameQuest = CFrame.new( -16540, 56, 1051);
			CFrameMon = CFrame.new( -16345, 80, 1004);
		elseif ((MyLevel == 2525) or (MyLevel <= 2549)) then
			Mon = "Isle Champion";
			LevelQuest = 2;
			NameQuest = "TikiQuest2";
			NameMon = "Isle Champion";
			CFrameQuest = CFrame.new( -16540, 56, 1051);
			CFrameMon = CFrame.new( -16634, 85, 1106);
		elseif ((MyLevel == 2550) or (MyLevel <= 2574)) then
			Mon = "Serpent Hunter";
			LevelQuest = 1;
			NameQuest = "TikiQuest3";
			NameMon = "Serpent Hunter";
			CFrameQuest = CFrame.new( -16665, 105, 1580);
			CFrameMon = CFrame.new( -16542.4824, 146.675156, 1529.61401, -0.999948919, 1.0729811e-8, 0.0101067368, 1.0128324e-8, 1, -5.9564663e-8, -0.0101067368, -5.9459257e-8, -0.999948919);
		elseif ((MyLevel == 2575) or (MyLevel <= 2600)) then
			Mon = "Skull Slayer";
			LevelQuest = 2;
			NameQuest = "TikiQuest3";
			NameMon = "Skull Slayer";
			CFrameQuest = CFrame.new( -16665, 105, 1580);
			CFrameMon = CFrame.new( -16849.9336, 147.005066, 1640.88354, 0.470148534, 0.491874039, -0.732816696, 1.72165e-8, 0.83030504, 0.55730921, 0.882587314, -0.262018114, 0.390366673);
		end
	end
end
function AutoFarmLevel()
    CheckQuest()
    local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
    if not string.find(QuestTitle, NameMon) then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
    end
    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
        CheckQuest()
        task.spawn(function()
            Tween(CFrameQuest)
        end)
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <=
            5 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest,
                LevelQuest)
        end
    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
        CheckQuest()
        local v = CheckMob(Mon)
        repeat task.wait()
            EnableBuso()
            BringMob(v, v.HumanoidRootPart.CFrame)
            EquipTool(GetWeapon())
            Tween(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
        until not v or _G.AutoFarm == false
    end
end
loadstring(game:HttpGet(("https://raw.githubusercontent.com/daucobonhi/Ui-Redz-V2/refs/heads/main/UiREDzV2.lua")))()
local Window = MakeWindow({
    Hub = {
    Title = "Jack5m Hub",
    Animation = "welcome to jack5m"
    },
   Key = {
   KeySystem = true,
   Title = "Key System",
   Description = "",
   KeyLink = "",
   Keys = {"Key"},
   Notifi = {
   Notifications = true,
   CorrectKey = "Running the Script...",
  Incorrectkey = "The key is incorrect",
  CopyKeyLink = "Copied to Clipboard"
 }
}
})
MinimizeButton({
    Image = "rbxassetid://113021820179561",
    Size = {60, 60},
    Color = Color3.fromRGB(10, 10, 10),
    Corner = true,
    Stroke = false,
    StrokeColor = Color3.fromRGB(255, 0, 0)
   })
local Tab1 = MakeTab({Name = "Main"})
Dropdown = AddDropdown(Tab1, {
    Name = "Select Tool",
    Options = {"Melee", "Sword"},
    Default = "Melee",
    Callback = function(v)
        getgenv().SelectTool = v
    end
  })
Toggle = AddToggle(Tab1 , {
    Name = "Auto Level",
    Default = false,
    Callback = function(value)
        _G.AutoFarm = value
   end
})
task.spawn(function()
    while task.wait() do
        if _G.AutoFarm then
                AutoFarmLevel()
        end
    end
end)
Togglefc = AddToggle(Tab1 , {
    Name = "Auto Katakuri",
    Default = false,
    Callback = function(value)
        getgenv().AutoKatakuri = value
   end
})
task.spawn(function()
    while task.wait() do
        if getgenv().AutoKatakuri then
            AutoKatakuri()
        end
    end
end)