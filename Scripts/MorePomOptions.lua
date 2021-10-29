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

ModUtil.WrapBaseFunction( "GetAllUpgradeableGodTraits", function ( )
    local traitNames = {}
	for i, trait in pairs( CurrentRun.Hero.Traits ) do
		if trait.RemainingUses == nil and (IsGodTrait(trait.Name) or string.find(trait.Name, "ChaosBlessing") or string.find(TraitData[trait.Name].Icon, "Hermes")) then
			traitNames[trait.Name] = true
		end
	end
	return traitNames
end, MorePomOptions )

--[[ TODO:
    -  Finish Chaos Boons
    -  Make it so that the Pom Menu correctly displays the values instead of the diminishing percent changes (@SetTraitTextData)
    -  Finish Hermes Boons
    -  Revisit "Unsellable boons" (Demeter)
    -  Revisit Legendary/Duo Boons
    -  Optimally Change function "IsGodTrait" to no longer require the overwriting
        of Global "god.GodLoot"
    -  Test
    -  Release
--]]
function OverrideTraits ()
    -- Standard Boons
    TraitData.RoomRewardBonusTrait.RequiredFalseTraits = nil
    TraitData.HealthRewardBonusTrait.RequiredFalseTraits = nil
    TraitData.AphroditePotencyTrait.RequiredFalseTrait = nil
    TraitData.AphroditeRangedBonusTrait.RequiredFalseTraits = { "ShieldLoadAmmoTrait" }
    TraitData.AphroditeRangedBonusTrait.AddOutgoingDamageModifiers.HitMaxHealthMultiplier = { BaseValue = 1.5, SourceIsMultiplier = true, IdenticalMultiplier = { Value = -0.60, }, }
    TraitData.LastStandDamageBonusTrait.RequiredFalseTrait = nil
    TraitData.AresDragTrait.RequiredFalseTrait = nil
    TraitData.AresDragTrait.PropertyChanges[10].BaseValue = 0.20
    TraitData.AresDragTrait.PropertyChanges[10].SourceIsMultiplier = false
    TraitData.AresDragTrait.PropertyChanges[10].IdenticalMultiplier = { Value = -0.35 }
    TraitData.AresDragTrait.PropertyChanges[10].ExtractValue = { ExtractAs = "TooltipDuration", DecimalPlaces = 2 }
    TraitData.AresDragTrait.PropertyChanges[11].BaseValue = 0.20
    TraitData.AresDragTrait.PropertyChanges[11].SourceIsMultiplier = false
    TraitData.AresDragTrait.PropertyChanges[11].IdenticalMultiplier = { Value = -0.35 }
    TraitData.AresDragTrait.PropertyChanges[11].ExtractValue = { ExtractAs = "TooltipDuration", DecimalPlaces = 2 }
    TraitData.AresLoadCurseTrait.RequiredFalseTrait = nil
    TraitData.AresLoadCurseTrait.PropertyChanges[5].IdenticalMultiplier = { Value = -0.8 }
    TraitData.TrapDamageTrait.RequiredFalseTrait = nil
    TraitData.ZeroAmmoBonusTrait.RequiredFalseTrait = nil
    TraitData.MaximumChillBlast.RequiredFalseTrait = nil
    TraitData.MaximumChillBlast.PropertyChanges[1].IdenticalMultiplier = { Value = -0.80 }
    TraitData.MaximumChillBonusSlow.RequiredFalseTrait = nil
    TraitData.MaximumChillBonusSlow.PropertyChanges[1].IdenticalMultiplier = { Value = -0.60 }
    TraitData.MaximumChillBonusSlow.PropertyChanges[2].IdenticalMultiplier = { Value = -0.60 }
    TraitData.MaximumChillBonusSlow.RarityLevels.Rare = { Multiplier = 1.5 }
    TraitData.MaximumChillBonusSlow.RarityLevels.Epic = { Multiplier = 2.0 }
    TraitData.MaximumChillBonusSlow.RarityLevels.Heroic = { Multiplier = 2.5 }
    TraitData.DoorHealTrait.RequiredFalseTraits = nil
    TraitData.FountainDamageBonusTrait.RequiredFalseTrait = nil
    TraitData.FountainDamageBonusTrait.FountainDamageBonus.DecimalPlaces = 3

    -- Chaos
    --LootData.TrialUpgrade.GodLoot = true
    TraitData.ChaosBlessingMetapointTrait.MetaPointMultiplier.IdenticalMultiplier = { Value = -0.60, }
    TraitData.ChaosBlessingMoneyTrait.MoneyMultiplier.IdenticalMultiplier = { Value = -0.60, }
    TraitData.ChaosBlessingSecondaryTrait.AddOutgoingDamageModifiers.ValidWeaponMultiplier.IdenticalMultiplier = { Value = -0.50 }
    TraitData.ChaosBlessingMeleeTrait.AddOutgoingDamageModifiers.ValidWeaponMultiplier.IdenticalMultiplier = { Value = -0.50 }
    TraitData.ChaosBlessingRangedTrait.AddOutgoingDamageModifiers.ValidWeaponMultiplier.IdenticalMultiplier = { Value = -0.50 }
    TraitData.ChaosBlessingAlphaStrikeTrait.AddOutgoingDamageModifiers.HitMaxHealthMultiplier.IdenticalMultiplier = { Value = -0.50 }
    TraitData.ChaosBlessingBackstabTrait.AddOutgoingDamageModifiers.HitVulnerabilityMultiplier.IdenticalMultiplier = { Value = -0.50 }
    TraitData.ChaosBlessingDashAttackTrait.AddOutgoingDamageModifiers.ValidWeaponMultiplier.IdenticalMultiplier = { Value = -0.50 }
    TraitData.ChaosBlessingBoonRarityTrait.RarityBonus.RareBonus.IdenticalMultiplier = { Value = -0.70 }
    TraitData.ChaosBlessingMaxHealthTrait.PropertyChanges[1].IdenticalMultiplier = { Value = -0.60 }

    -- Hermes
    --LootData.HermesUpgrade.GodLoot = true
    TraitData.HermesShoutDodge.RequiredFalseTraits = nil
    TraitData.MoveSpeedTrait.RequiredFalseTrait = nil
    TraitData.MoveSpeedTrait.PropertyChanges[1].IdenticalMultiplier = { Value = -0.60 }
    TraitData.MoveSpeedTrait.PropertyChanges[1].SourceIsMultiplier = true
    TraitData.HermesSecondaryTrait.RequiredFalseTraits = nil
    TraitData.HermesSecondaryTrait.ExtractEntry.IdenticalMultiplier = { Value = -0.3 }
    TraitData.HermesWeaponTrait.ExtractEntry.IdenticalMultiplier = { Value = -0.8 }
    TraitData.HermesWeaponTrait.ExtractEntry.SourceIsMultiplier = true
    TraitData.HermesShoutDodge.RequiredFalseTraits = nil
    TraitData.HermesShoutDodge.PropertyChanges[1].IdenticalMultiplier = { Value = -0.60 }
    TraitData.DodgeChanceTrait.RequiredFalseTrait = nil
    TraitData.DodgeChanceTrait.PropertyChanges[1].IdenticalMultiplier = { Value = -0.60 }
    TraitData.RapidCastTrait.RequiredFalseTraits = { "BowLoadAmmoTrait", "ShieldLoadAmmoTrait" }
    TraitData.RapidCastTrait.PropertyChanges[1].IdenticalMultiplier = { Value = -0.60 }
    TraitData.RushRallyTrait.RequiredFalseTrait = nil
    TraitData.RushRallyTrait.PropertyChanges[4].IdenticalMultiplier = { Value = -0.60 }
    TraitData.SpeedDamageTrait.AddOutgoingDamageModifiers.SpeedDamageMultiplier.IdenticalMultiplier = { Value = -0.60 }
    TraitData.ChamberGoldTrait.RequiredFalseTraits = nil
    TraitData.ChamberGoldTrait.MoneyPerRoom.ToNearest = 1
    TraitData.ChamberGoldTrait.MoneyPerRoom.IdenticalMultiplier = { Value = -0.60 }
end
