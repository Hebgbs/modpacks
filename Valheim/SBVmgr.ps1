function modState {
  if ( $modMode -eq 0 ) {
    modEnb
  }
  if ( $modMode -eq 0 ) {
    modDsb
  }
}

function modDsb {
  if ( -not ( Test-Path -Path "$modPath\BepInEx\Plugins\$modPf" ) -or
       -not ( Test-Path -Path "$modPath\BepInEx\Plugins\$modPd" ) ) {
    echo "$modName has already been disabled."
    pakPrompt
    modSel
  }
  if ( -not ( Test-Path -Path "$modPath\BepInEx\DisabledPlugins" ) ) {
    mkdir $modPath\BepInEx\disabledPlugins
  }
  if ( -not ( Test-Path -Path "$modPath\BepInEx\DisabledConfig" ) ) {
    mkdir $modPath\BepInEx\disabledConfig
  }
  Move-Item -Path "$modPath\BepInEx\plugins\$modPf" -Destination "$modPath\BepInEx\disabledPlugins\$modPf"
  Move-Item -Path "$modPath\BepInEx\plugins\$modPd" -Destination "$modPath\BepInEx\disabledPlugins\$modPd"
  Move-Item -Path "$modPath\BepInEx\config\$modCf" -Destination "$modPath\BepInEx\disabledConfig\$modCf"
  echo "$modName has been disabled."
  echo "Re-enable it by changing management mode."
  pakPrompt
  modSel
}

function modEnb {
  if ( -not ( Test-Path -Path "$modPath\BepInEx\disabledPlugins\$modPf" ) -or
       -not ( Test-Path -Path "$modPath\BepInEx\disabledPlugins\$modPd" ) ) {
    echo "$modName is already enabled."
    pakPrompt
    modSel
  }
  Move-Item -Path "$modPath\BepInEx\disabledPlugins\$modPf" -Destination "$modPath\BepInEx\plugins\$modPf"
  Move-Item -Path "$modPath\BepInEx\disabledPlugins\$modPd" -Destination "$modPath\BepInEx\plugins\$modPd"
  Move-Item -Path "$modPath\BepInEx\disabledConfig\$modCf" -Destination "$modPath\BepInEx\config\$modCf"
  echo "$modName has been enabled."
  echo "Re-enable it by changing management mode."
  pakPrompt
  modSel
}

function modSel {
  clearText
  echo "The following modifications can be toggled"
  echo "while not affecting core gameplay mechanics:"
  echo ""
	$m2T = ""
	$m2Q = "Select modification:"
	$m2O = 'ValheimFPS&Boost','1st-&Person mode','E&mote wheel','E&quip wheel','Cloc&k','Com&pass','&Fermenter status','&Ore status','E&xit'
	$m2P = $Host.UI.PromptForChoice($m2T, $m2Q, $m2O, 8)

	if ( $m2P -eq 0 ) {
		$modPf = "ValheimFPSBoost"
    $modPd = ""
    $modCf = ""
    $modName = "$modPf"
    modState
	}
	if ( $m2P -eq 1 ) {
    $modPf = "FirstPersonValheimClientMod.dll"
    $modPd = ""
    $modCf = "com.loki.clientmods.valheim.firstperson.cfg"
    $modName = "Loki's First Person Valheim"
    modState
	}
	if ( $m2P -eq 2 ) {
    $modPf = "EmoteWheel.dll"
    $modPd = ""
    $modCf = "virtuacode.valheim.emotewheel.cfg"
    $modName = "Emote Wheel"
    modState
	}
  if ( $m2P -eq 3 ) {
    $modPf = "EquipWheel*.dll"
    $modPd = ""
    $modCf = "virtuacode.valheim.equipwheel*.cfg"
    $modName = "Equip Wheels"
    modState
	}
  if ( $m2P -eq 4 ) {
    $modPf = "ClockMod.dll"
    $modPd = ""
    $modCf = "aedenthorn.ClockMod.cfg"
    $modName = "Clock"
    modState
	}
  if ( $m2P -eq 5 ) {
    $modPf = "Compass.dll"
    $modPd = "Compass"
    $modCf = "aedenthorn.Compass.cfg"
    $modName = "$modPd"
    modState
	}
  if ( $m2P -eq 6 ) {
    $modPf = "FermenterStatus.dll"
    $modPd = ""
    $modCf = ""
    $modName = "Fermenter Status"
    modState
	}
  if ( $m2P -eq 7 ) {
    $modPf = ""
    $modPd = "Jowleth"
    $modCf = ""
    $modName = "Ore Status"
    modState
	}
  if ( $m2P -eq 8 ) {
		modMgmt
	}
}

function modMgmt {
  clearText
  echo "This menu will allow you to disable use of certain"
  echo "non-critical modifications which will not dramatically"
  echo "effect online gameplay to exclude."
  echo ""
  echo "You can also re-enable plugins which had been disabled"
  echo "through this menu."
  echo ""
	$m1T = ""
	$m1Q = "Select management mode:"
	$m1O = '&Enable', '&Disable','&Main menu'
	$m1P = $Host.UI.PromptForChoice($m1T, $m1Q, $m1O, 2)

	if ( $m1P -eq 0 ) {
		Set-Variable -Name "modMode" -Value "0" -Scope Script
    modSel
	}
	if ( $m1P -eq 1 ) {
		Set-Variable -Name "modMode" -Value "1" -Scope Script
    modSel
	}
	if ( $m1P -eq 2 ) {
		consent
	}
}

function mkLn {
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\assets" -ItemType Junction -Path "$modPath\BepInEx\plugins\assets" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\BetterArchery" -ItemType Junction -Path "$modPath\BepInEx\plugins\BetterArchery" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\Compass" -ItemType Junction -Path "$modPath\BepInEx\plugins\Compass" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\files" -ItemType Junction -Path "$modPath\BepInEx\plugins\files" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\FishFood" -ItemType Junction -Path "$modPath\BepInEx\plugins\FishFood" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\Jowleth" -ItemType Junction -Path "$modPath\BepInEx\plugins\Jowleth" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\MasterChef" -ItemType Junction -Path "$modPath\BepInEx\plugins\MasterChef" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\MeadBaseIconFix" -ItemType Junction -Path "$modPath\BepInEx\plugins\MeadBaseIconFix" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\PotionsPlus" -ItemType Junction -Path "$modPath\BepInEx\plugins\PotionsPlus" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\ValheimFPSBoost" -ItemType Junction -Path "$modPath\BepInEx\plugins\ValheimFPSBoost" | Out-Null

  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\ABearCodes.Valheim.SimpleRecycling.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\ABearCodes.Valheim.SimpleRecycling.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\AddAllFuel.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\AddAllFuel.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\Advize_CartographySkill.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\Advize_CartographySkill.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\AnyPortal.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\AnyPortal.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\AutoSplitStack.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\AutoSplitStack.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\BetterLadders.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\BetterLadders.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\BetterWagon.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\BetterWagon.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\ClockMod.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\ClockMod.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\Compass.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\Compass.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\CookingSkill.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\CookingSkill.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\EmoteWheel.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\EmoteWheel.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\EquipmentAndQuickSlots.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\EquipmentAndQuickSlots.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\EquipWheel.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\EquipWheel.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\EquipWheelFour.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\EquipWheelFour.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\EquipWheelThree.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\EquipWheelThree.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\EquipWheelTwo.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\EquipWheelTwo.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\ExploreTogether.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\ExploreTogether.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\ExtendedItemDataFramework.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\ExtendedItemDataFramework.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\FarmGrid.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\FarmGrid.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\FermenterStatus.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\FermenterStatus.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\FirstPersonValheimClientMod.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\FirstPersonValheimClientMod.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\HanticksRPChatMod1.0.0.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\HanticksRPChatMod1.0.0.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\ImprovedBuildHud.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\ImprovedBuildHud.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\InstantMonsterDrop.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\InstantMonsterDrop.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\itemdrawers.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\itemdrawers.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\JotunnLib.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\JotunnLib.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\LastUsedWeapons.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\LastUsedWeapons.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\MeadBaseIconFix.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\MeadBaseIconFix.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\MerchantWhereabouts.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\MerchantWhereabouts.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\Moregates.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\Moregates.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\MultiCraft.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\MultiCraft.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\Necromancy.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\Necromancy.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\NexusUpdate.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\NexusUpdate.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\NoStamCosts.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\NoStamCosts.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\OverheadAxeSwing.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\OverheadAxeSwing.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\QuickStack.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\QuickStack.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\RepairAll.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\RepairAll.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\SkillInjector.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\SkillInjector.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\Skills Give More Carry Weight.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\Skills Give More Carry Weight.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\skyheim.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\skyheim.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\ToastyTorches.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\ToastyTorches.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\TPWolves.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\TPWolves.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\TrashItems.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\TrashItems.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\UseEquipmentInWater.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\UseEquipmentInWater.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\UsefulPaths.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\UsefulPaths.dll" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\UsefulTrophies.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\UsefulTrophies.dll" | Out-Null

  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\advize.CartographySkill.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\advize.CartographySkill.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\aedenthorn.ClockMod.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\aedenthorn.ClockMod.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\aedenthorn.AutoSplitStack.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\aedenthorn.AutoSplitStack.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\aedenthorn.Compass.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\aedenthorn.Compass.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\aedenthorn.InstantMonsterDrop.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\aedenthorn.InstantMonsterDrop.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\bakaSpaceman.LastUsedWeapons.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\bakaSpaceman.LastUsedWeapons.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\Basil_NoStamCosts.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\Basil_NoStamCosts.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\BepIn.Sarcen.FarmGrid.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\BepIn.Sarcen.FarmGrid.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\com.github.abearcodes.valheim.simplerecycling.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\com.github.abearcodes.valheim.simplerecycling.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\com.lvh-it.valheim.useequipmentinwater.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\com.lvh-it.valheim.useequipmentinwater.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\com.loki.clientmods.valheim.firstperson.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\com.loki.clientmods.valheim.firstperson.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\com.pipakin.SkillInjectorMod.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\com.pipakin.SkillInjectorMod.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\com.rolopogo.plugins.exploretogether.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\com.rolopogo.plugins.exploretogether.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\com.urgemeuwu.betterwagon.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\com.urgemeuwu.betterwagon.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\flueno.MerchantWhereabouts.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\flueno.MerchantWhereabouts.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\gg.khairex.usefultrophies.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\gg.khairex.usefultrophies.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\ishid4.mods.betterarchery.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\ishid4.mods.betterarchery.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\maximods.valheim.multicraft.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\maximods.valheim.multicraft.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\Menthus.bepinex.plugins.UsefulPaths.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\Menthus.bepinex.plugins.UsefulPaths.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\mkz.itemdrawers.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\mkz.itemdrawers.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\Necromancy.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\Necromancy.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\org.bepinex.plugins.valheim.quick_stack.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\org.bepinex.plugins.valheim.quick_stack.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\org.bepinex.valheim.displayinfo.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\org.bepinex.valheim.displayinfo.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\org.davidwofford.plugins.meadbaseiconfix.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\org.davidwofford.plugins.meadbaseiconfix.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\randyknapp.mods.epicloot.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\randyknapp.mods.epicloot.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\randyknapp.mods.equipmentandquickslots.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\randyknapp.mods.equipmentandquickslots.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\randyknapp.mods.extendeditemdataframework.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\randyknapp.mods.extendeditemdataframework.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\randyknapp.mods.improvedbuildhud.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\randyknapp.mods.improvedbuildhud.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\RepairAll.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\RepairAll.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\rin_jugatla.AddAllFuel.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\rin_jugatla.AddAllFuel.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\SkillsGiveMoreCarryWeight.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\SkillsGiveMoreCarryWeight.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\SSyl.FishFood.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\SSyl.FishFood.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\SSyl.ToastyTorches.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\SSyl.ToastyTorches.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\thegreyham.valheim.CookingSkill.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\thegreyham.valheim.CookingSkill.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\Toawy.TPWolves.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\Toawy.TPWolves.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\uk.co.jowleth.valheim.orestatus.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\uk.co.jowleth.valheim.orestatus.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\virtuacode.valheim.emotewheel.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\virtuacode.valheim.emotewheel.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\virtuacode.valheim.equipwheel.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\virtuacode.valheim.equipwheel.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\virtuacode.valheim.equipwheelfour.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\virtuacode.valheim.equipwheelfour.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\virtuacode.valheim.equipwheelthree.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\virtuacode.valheim.equipwheelthree.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\virtuacode.valheim.equipwheeltwo.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\virtuacode.valheim.equipwheeltwo.cfg" | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\virtuacode.valheim.trashitems.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\virtuacode.valheim.trashitems.cfg" | Out-Null
}
