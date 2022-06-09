ModUtil.RegisterMod("MorePomOptions")

local config = {
    ModName = "MorePomOptions",
    Enabled = true,
}
MorePomOptions.config = config

ModUtil.LoadOnce(function ()
    if ModConfigMenu then
        ModConfigMenu.Register( config )
    end
    if config.Enabled then
        OverrideTraits()
    end
end)

ModUtil.BaseOverride ( "GetAllUpgradeableGodTraits", function ( )
    local traitNames = {}
	for _, trait in pairs( CurrentRun.Hero.Traits ) do
 		if trait.RemainingUses == nil and (IsGodTrait(trait.Name) or TraitData[trait.Name].Icon ~= nil and
        string.find(TraitData[trait.Name].Icon, "Hermes") or string.find(trait.Name, "ChaosBlessing")) then
			traitNames[trait.Name] = true
        end
	end
	return traitNames
end, MorePomOptions )

--[[ TODO:
    -  Write the remaining text patches while simoultaneously checking the stats for all mods
    -  Write TXT/Finish Up
    -  Release
--]]

--function AddNewTextFormat () 
--    ModUtil.MapSetTable(TextFormats, {
--        PlusFormat =
--        {
--            
--        }
--    }
--)
--end

function OverrideTraits ()
    ModUtil.MapNilTable(TraitData,
    {
        RoomRewardBonusTrait = { RequiredFalseTraits = true },
        HealthRewardBonusTrait = { RequiredFalseTraits = true },
        AphroditePotencyTrait = { RequiredFalseTrait = true },
        LastStandDamageBonusTrait = { RequiredFalseTrait = true },
        AresDragTrait = { RequiredFalseTrait = true },
        AresLoadCurseTrait = { RequiredFalseTrait = true },
        TrapDamageTrait = { RequiredFalseTrait = true },
        MaximumChillBlast = { RequiredFalseTrait = true },
        ZeroAmmoBonusTrait = { RequiredFalseTrait = true },
        MaximumChillBonusSlow = { RequiredFalseTrait = true },
        DoorHealTrait = { RequiredFalseTraits = true },
        FountainDamageBonusTrait = { RequiredFalseTrait = true },
        HermesShoutDodge = { RequiredFalseTraits = true },
        MoveSpeedTrait = { RequiredFalseTrait = true },
        SpeedDamageTrait = { RequiredFalseTraits = true },
        HermesSecondaryTrait = { RequiredFalseTraits = true },
        DodgeChanceTrait = { RequiredFalseTrait = true },
        RushRallyTrait = { RequiredFalseTrait = true },
        ChamberGoldTrait = { RequiredFalseTraits = true },
    })

    ModUtil.MapSetTable(TraitData,
    {
        AphroditeRangedBonusTrait =
        {
            RequiredFalseTraits = { "ShieldLoadAmmoTrait" },
            AddOutgoingDamageModifiers =
            {
                HitMaxHealthMultiplier =
                {
                    BaseValue = 1.50,
                    SourceIsMultiplier = true,
                    IdenticalMultiplier =
                    {
                        Value = -0.60
                    }
                }
            }
        },
        AresDragTrait =
        {
            PropertyChanges =
            {
                [10] =
                {
                    BaseValue = 0.20,
                    SourceIsMultiplier = false,
                    IdenticalMultiplier =
                    {
                        Value = -0.35
                    },
                    ExtractValue =
                    {
                        ExtractAs = "TooltipDuration",
                        DecimalPlaces = 2.00
                    }
                },
                [11] =
                {
                    BaseValue = 0.20,
                    SourceIsMultiplier = false,
                    IdenticalMultiplier =
                    {
                        Value = -0.35
                    },
                    ExtractValue =
                    {
                        ExtractAs = "TooltipDuration",
                        DecimalPlaces = 2.00
                    }
                }
            }
        },
        AresLoadCurseTrait =
        {
            PropertyChanges =
            {
                [5] =
                {
                    IdenticalMultiplier =
                    {
                        Value = -0.80
                    }
                }
            }
        },
        MaximumChillBlast =
        {
            PropertyChanges =
            {
                [1] =
                {
                    IdenticalMultiplier =
                    {
                        Value = -0.50
                    }
                }
            }
        },
        MaximumChillBonusSlow =
        {
            PropertyChanges =
            {
                [1] =
                {
                    IdenticalMultiplier =
                    {
                        Value = -0.60
                    }
                },
                [2] =
                {
                    IdenticalMultiplier =
                    {
                        Value = -0.60
                    }
                }
            },
            RarityLevels =
            {
                Rare =
                {
                    Multiplier = 1.50
                },
                Epic =
                {
                    Multiplier = 2.00
                },
                Heroic =
                {
                    Multiplier = 2.50
                }
            }
        },
        FountainDamageBonusTrait =
        {
            FountainDamageBonus =
            {
                DecimalPlaces = 3.00
            }
        },
        ChaosBlessingMetapointTrait =
        {
            MetaPointMultiplier =
            {
                IdenticalMultiplier =
                {
                    Value = -0.60
                }
            }
        },
        ChaosBlessingMoneyTrait =
        {
            MoneyMultiplier =
            {
                IdenticalMultiplier =
                {
                    Value = -0.60
                }
            }
        },
        ChaosBlessingSecondaryTrait =
        {
            AddOutgoingDamageModifiers =
            {
                ValidWeaponMultiplier =
                {
                    IdenticalMultiplier =
                    {
                        Value = -0.50
                    }
                }
            }
        },
        ChaosBlessingMeleeTrait =
        {
            AddOutgoingDamageModifiers =
            {
                ValidWeaponMultiplier =
                {
                    IdenticalMultiplier =
                    {
                        Value = -0.50
                    }
                }
            }
        },
        ChaosBlessingRangedTrait =
        {
            AddOutgoingDamageModifiers =
            {
                ValidWeaponMultiplier =
                {
                    IdenticalMultiplier =
                    {
                        Value = -0.50
                    }
                }
            }
        },
        ChaosBlessingAlphaStrikeTrait =
        {
            AddOutgoingDamageModifiers =
            {
                HitMaxHealthMultiplier =
                {
                    IdenticalMultiplier =
                    {
                        Value = -0.50
                    }
                }
            }
        },
        ChaosBlessingBackstabTrait =
        {
            AddOutgoingDamageModifiers =
            {
                HitVulnerabilityMultiplier =
                {
                    IdenticalMultiplier =
                    {
                        Value = -0.50
                    }
                }
            }
        },
        ChaosBlessingDashAttackTrait =
        {
            AddOutgoingDamageModifiers =
            {
                ValidWeaponMultiplier =
                {
                    IdenticalMultiplier =
                    {
                        Value = -0.50
                    }
                }
            }
        },
        ChaosBlessingBoonRarityTrait =
        {
            RarityBonus =
            {
                RareBonus =
                {
                    IdenticalMultiplier =
                    {
                        Value = -0.50
                    }
                }
            }
        },
        ChaosBlessingMaxHealthTrait =
        {
            PropertyChanges =
            {
                [1] =
                {
                    IdenticalMultiplier =
                    {
                        Value = -0.70
                    }
                }
            }
        },
        MoveSpeedTrait =
        {
            PropertyChanges =
            {
                [1] =
                {
                    SourceIsMultiplier = true,
                    IdenticalMultiplier =
                    {
                        Value = -0.60
                    }
                }
            }
        },
        HermesSecondaryTrait =
        {
            ExtractEntry =
            {
                IdenticalMultiplier =
                {
                    Value = -0.30
                }
            }
        },
        HermesWeaponTrait =
        {
            ExtractEntry =
            {
                IdenticalMultiplier =
                {
                    Value = -0.80
                }
            }
        },
        HermesShoutDodge =
        {
            PropertyChanges =
            {
                [1] =
                {
                    IdenticalMultiplier =
                    {
                        Value = -0.60
                    }
                },
                [2] =
                {
                    IdenticalMultiplier =
                    {
                        Value = -0.60
                    }
                },
                [3] =
                {
                    IdenticalMultiplier =
                    {
                        Value = -0.60
                    }
                },
                [4] =
                {
                    IdenticalMultiplier =
                    {
                        Value = -0.60
                    }
                }
            }
        },
        RapidCastTrait =
        {
            RequiredFalseTraits = { "BowLoadAmmoTrait", "ShieldLoadAmmoTrait" },
            PropertyChanges =
            {
                [1] =
                {
                    IdenticalMultiplier =
                    {
                        Value = -0.60
                    }
                },
                [4] =
                {
                    IdenticalMultiplier =
                    {
                        Value = -0.60
                    }
                }
            }
        },
        SpeedDamageTrait =
        {
            AddOutgoingDamageModifiers =
            {
                SpeedDamageMultiplier =
                {
                    IdenticalMultiplier =
                    {
                        Value = -0.60
                    }
                }
            }
        },
        ChamberGoldTrait =
        {
            MoneyPerRoom =
            {
                ToNearest = 1,
                IdenticalMultiplier =
                {
                    Value = -0.60
                }
            }
        },
        DodgeChanceTrait =
        {
            PropertyChanges =
            {
                [1] =
                {
                    IdenticalMultiplier =
                    {
                        Value = -0.60
                    }
                }
            }
        },
        RushRallyTrait =
        {
            PropertyChanges =
            {
                [4] =
                {
                    IdenticalMultiplier =
                    {
                        Value = -0.60
                    }
                }
            }
        },
    })
end
