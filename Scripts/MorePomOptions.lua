ModUtil.RegisterMod("MorePomOptions")

local config = {
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
    -  Make it so that the Pom Menu correctly displays the values instead of the diminishing percent changes (@SetTraitTextData)
    -  Finish Hermes Boons
    -  Revisit "Unsellable boons" (Demeter)
    -  Revisit Legendary/Duo Boons
    -  Test
    -  Release
--]]
function OverrideTraits ()
    ModUtil.MapNilTable(TraitData, {
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
        HermesSecondaryTrait = { RequiredFalseTraits = true },
        DodgeChanceTrait = { RequiredFalseTrait = true },
        RushRallyTrait = { RequiredFalseTrait = true },
        ChamberGoldTrait = { RequiredFalseTraits = true },
    })

    ModUtil.MapSetTable(TraitData, {
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
                    ExtractValues =
                    {
                        ExtractAs = "ToolTipDuration",
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
                    ExtractValues =
                    {
                        ExtractAs = "ToolTipDuration",
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
                        Value = -0.35
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
                        Value = -0.70
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
                SourceIsMultiplier = true,
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
                    SourceIsMultiplier = true,
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
        }
    })
    -- Hermes
    --TraitData.MoveSpeedTrait.PropertyChanges[1].IdenticalMultiplier = { Value = -0.60 }
    --TraitData.MoveSpeedTrait.PropertyChanges[1].SourceIsMultiplier = true
    --TraitData.HermesSecondaryTrait.ExtractEntry.IdenticalMultiplier = { Value = -0.3 }
    --TraitData.HermesWeaponTrait.ExtractEntry.IdenticalMultiplier = { Value = -0.8 }
    --TraitData.HermesWeaponTrait.ExtractEntry.SourceIsMultiplier = true
    --TraitData.HermesShoutDodge.PropertyChanges[1].IdenticalMultiplier = { Value = -0.60 }
    --TraitData.DodgeChanceTrait.PropertyChanges[1].IdenticalMultiplier = { Value = -0.60 }
    --TraitData.RapidCastTrait.RequiredFalseTraits = { "BowLoadAmmoTrait", "ShieldLoadAmmoTrait" }
    --TraitData.RapidCastTrait.PropertyChanges[1].IdenticalMultiplier = { Value = -0.60 }
    --TraitData.RushRallyTrait.PropertyChanges[4].IdenticalMultiplier = { Value = -0.60 }
    --TraitData.SpeedDamageTrait.AddOutgoingDamageModifiers.SpeedDamageMultiplier.IdenticalMultiplier = { Value = -0.60 }
    --TraitData.ChamberGoldTrait.MoneyPerRoom.ToNearest = 1
    --TraitData.ChamberGoldTrait.MoneyPerRoom.IdenticalMultiplier = { Value = -0.60 }
    --
    ---- Chaos
    --TraitData.ChaosBlessingMetapointTrait.MetaPointMultiplier.IdenticalMultiplier = { Value = -0.60, }
    --TraitData.ChaosBlessingMoneyTrait.MoneyMultiplier.IdenticalMultiplier = { Value = -0.60, }
    --TraitData.ChaosBlessingSecondaryTrait.AddOutgoingDamageModifiers.ValidWeaponMultiplier.IdenticalMultiplier = { Value = -0.50 }
    --TraitData.ChaosBlessingMeleeTrait.AddOutgoingDamageModifiers.ValidWeaponMultiplier.IdenticalMultiplier = { Value = -0.50 }
    --TraitData.ChaosBlessingRangedTrait.AddOutgoingDamageModifiers.ValidWeaponMultiplier.IdenticalMultiplier = { Value = -0.50 }
    --TraitData.ChaosBlessingAlphaStrikeTrait.AddOutgoingDamageModifiers.HitMaxHealthMultiplier.IdenticalMultiplier = { Value = -0.50 }
    --TraitData.ChaosBlessingBackstabTrait.AddOutgoingDamageModifiers.HitVulnerabilityMultiplier.IdenticalMultiplier = { Value = -0.50 }
    --TraitData.ChaosBlessingDashAttackTrait.AddOutgoingDamageModifiers.ValidWeaponMultiplier.IdenticalMultiplier = { Value = -0.50 }
    --TraitData.ChaosBlessingBoonRarityTrait.RarityBonus.RareBonus.IdenticalMultiplier = { Value = -0.70 }
    --TraitData.ChaosBlessingMaxHealthTrait.PropertyChanges[1].IdenticalMultiplier = { Value = -0.60 }
    --TraitData.AphroditeRangedBonusTrait.RequiredFalseTraits = { "ShieldLoadAmmoTrait" }
    --TraitData.AphroditeRangedBonusTrait.AddOutgoingDamageModifiers.HitMaxHealthMultiplier = { BaseValue = 1.5, SourceIsMultiplier = true, IdenticalMultiplier = { Value = -0.60, }, }
    --TraitData.AresDragTrait.PropertyChanges[10].BaseValue = 0.20
    --TraitData.AresDragTrait.PropertyChanges[10].SourceIsMultiplier = false
    --TraitData.AresDragTrait.PropertyChanges[10].IdenticalMultiplier = { Value = -0.35 }
    --TraitData.AresDragTrait.PropertyChanges[10].ExtractValue = { ExtractAs = "TooltipDuration", DecimalPlaces = 2 }
    --TraitData.AresDragTrait.PropertyChanges[11].BaseValue = 0.20
    --TraitData.AresDragTrait.PropertyChanges[11].SourceIsMultiplier = false
    --TraitData.AresDragTrait.PropertyChanges[11].IdenticalMultiplier = { Value = -0.35 }
    --TraitData.AresDragTrait.PropertyChanges[11].ExtractValue = { ExtractAs = "TooltipDuration", DecimalPlaces = 2 }
    --TraitData.AresLoadCurseTrait.PropertyChanges[5].IdenticalMultiplier = { Value = -0.8 }
    --TraitData.MaximumChillBlast.PropertyChanges[1].IdenticalMultiplier = { Value = -0.80 }
    --TraitData.MaximumChillBonusSlow.PropertyChanges[1].IdenticalMultiplier = { Value = -0.60 }
    --TraitData.MaximumChillBonusSlow.PropertyChanges[2].IdenticalMultiplier = { Value = -0.60 }
    --TraitData.MaximumChillBonusSlow.RarityLevels.Rare = { Multiplier = 1.5 }
    --TraitData.MaximumChillBonusSlow.RarityLevels.Epic = { Multiplier = 2.0 }
    --TraitData.MaximumChillBonusSlow.RarityLevels.Heroic = { Multiplier = 2.5 }
    --TraitData.FountainDamageBonusTrait.FountainDamageBonus.DecimalPlaces = 3
end
