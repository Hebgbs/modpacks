# Perform operations
function chgState {
  if ( $modMode -eq 1 ) {
    if ( -not ( Test-Path -Path "$modPath\BepInEx\$pMgrDst" ) ) {
      mkdir $modPath\BepInEx\$pMgrDst -ErrorAction SilentlyContinue | Out-Null
    }
    if ( -not ( Test-Path -Path "$modPath\BepInEx\$cMgrDst" ) ) {
      mkdir $modPath\BepInEx\$cMgrDst -ErrorAction SilentlyContinue | Out-Null
    }
  }
  if ( Test-Path -Path "$modPath\BepInEx\$pMgrDst\$modChk" ) {
    echo "$modName has already been ${mgrWord}d."
    pakPrompt
    modSel
  }
  if ( $modPf.dll -ne 0 ) {
    if ( ( $modMode -eq 0 ) -and
       ( -not ( Test-Path -Path "$modPath\BepInEx\$pMgrSrc\$modPf.dll" ) ) -and
       ( -not ( Test-Path -Path "$modPath\BepInEx\$pMgrDst\$modPf.dll" ) ) ) {
      New-Item -Target "$repoPath\$repoBranch\BepInEx\$pMgrDst\$modPf.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\$pMgrDst\$modPf.dll" -ErrorAction SilentlyContinue | Out-Null
    }
    if ( Test-Path -Path "$modPath\BepInEx\$pMgrSrc\$modPf.dll" ) {
      Move-Item -Path "$modPath\BepInEx\$pMgrSrc\$modPf.dll" -Destination "$modPath\BepInEx\$pMgrDst\$modPf.dll"
    }
  }
  if ( $modPd -ne 0 ) {
    if ( ( $modMode -eq 0 ) -and
       ( -not ( Test-Path -Path "$modPath\BepInEx\$pMgrSrc\$modPd" ) ) -and
       ( -not ( Test-Path -Path "$modPath\BepInEx\$pMgrDst\$modPd" ) ) ) {
      New-Item -Target "$repoPath\$repoBranch\BepInEx\$pMgrDst\$modPd" -ItemType Junction -Path "$modPath\BepInEx\$pMgrDst\$modPd" -ErrorAction SilentlyContinue | Out-Null
    }
    if ( Test-Path -Path "$modPath\BepInEx\$pMgrSrc\$modPd" ) {
      Move-Item -Path "$modPath\BepInEx\$pMgrSrc\$modPd" -Destination "$modPath\BepInEx\$pMgrDst\$modPd"
    }
  }
  if ( $modCf.cfg -ne 0 ) {
    if ( ( $modMode -eq 0 ) -and
       ( -not ( Test-Path -Path "$modPath\BepInEx\$cMgrSrc\$modCf.cfg" ) ) -and
       ( -not ( Test-Path -Path "$modPath\BepInEx\$cMgrDst\$modCf.cfg" ) ) ) {
      New-Item -Target "$repoPath\$repoBranch\BepInEx\$cMgrDst\$modCf.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\$cMgrDst\$modCf.cfg" -ErrorAction SilentlyContinue | Out-Null
    }
    if ( Test-Path -Path "$modPath\BepInEx\$cMgrSrc\$modCf.cfg" ) {
      Move-Item -Path "$modPath\BepInEx\$cMgrSrc\$modCf.cfg" -Destination "$modPath\BepInEx\$cMgrDst\$modCf.cfg"
    }
  }
  if ( $m2P -eq 3 ) {
    if ( ( $modMode -eq 0 ) -and
       ( -not ( Test-Path -Path "$modPath\BepInEx\$pMgrSrc\${modPf}four.dll" ) ) -and
       ( -not ( Test-Path -Path "$modPath\BepInEx\$pMgrDst\${modPf}four.dll" ) ) ) {
      New-Item -Target "$repoPath\$repoBranch\BepInEx\$pMgrDst\${modPf}two.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\$pMgrDst\${modPf}two.dll" -ErrorAction SilentlyContinue | Out-Null
      New-Item -Target "$repoPath\$repoBranch\BepInEx\$pMgrDst\${modPf}three.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\$pMgrDst\${modPf}three.dll" -ErrorAction SilentlyContinue | Out-Null
      New-Item -Target "$repoPath\$repoBranch\BepInEx\$pMgrDst\${modPf}four.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\$pMgrDst\${modPf}four.dll" -ErrorAction SilentlyContinue | Out-Null
    }
    if ( Test-Path -Path "$modPath\BepInEx\$pMgrSrc\${modPf}four.dll" ) {
      Move-Item -Path "$modPath\BepInEx\$pMgrSrc\${modPf}two.dll" -Destination "$modPath\BepInEx\$pMgrDst\${modPf}two.dll"
      Move-Item -Path "$modPath\BepInEx\$pMgrSrc\${modPf}three.dll" -Destination "$modPath\BepInEx\$pMgrDst\${modPf}three.dll"
      Move-Item -Path "$modPath\BepInEx\$pMgrSrc\${modPf}four.dll" -Destination "$modPath\BepInEx\$pMgrDst\${modPf}four.dll"
    }
    if ( ( $modMode -eq 0 ) -and
       ( -not ( Test-Path -Path "$modPath\BepInEx\$cMgrSrc\${modCf}four.cfg" ) ) -and
       ( -not ( Test-Path -Path "$modPath\BepInEx\$cMgrDst\${modCf}four.cfg" ) ) ) {
      New-Item -Target "$repoPath\$repoBranch\BepInEx\$cMgrDst\${modCf}two.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\$cMgrDst\${modCf}two.cfg" -ErrorAction SilentlyContinue | Out-Null
      New-Item -Target "$repoPath\$repoBranch\BepInEx\$cMgrDst\${modCf}three.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\$cMgrDst\${modCf}three.cfg" -ErrorAction SilentlyContinue | Out-Null
      New-Item -Target "$repoPath\$repoBranch\BepInEx\$cMgrDst\${modCf}four.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\$cMgrDst\${modCf}four.cfg" -ErrorAction SilentlyContinue | Out-Null
    }
    if ( Test-Path -Path "$modPath\BepInEx\$cMgrSrc\${modCf}four.cfg" ) {
      Move-Item -Path "$modPath\BepInEx\$cMgrSrc\${modCf}two.cfg" -Destination "$modPath\BepInEx\$cMgrDst\${modCf}two.cfg"
      Move-Item -Path "$modPath\BepInEx\$cMgrSrc\${modCf}three.cfg" -Destination "$modPath\BepInEx\$cMgrDst\${modCf}three.cfg"
      Move-Item -Path "$modPath\BepInEx\$cMgrSrc\${modCf}four.cfg" -Destination "$modPath\BepInEx\$cMgrDst\${modCf}four.cfg"
    }
  }
  chgFin
}

function chgFin {
  echo "$modName has been ${mgrWord}d."
  if ( $postOpMsg -ne 0 ) {
    echo "$postOpMsg"
  }
  pakPrompt
  modSel
}

# User-interactive mod selection menu
function modSel {
  clearText
	$m2T = ""
	$m2Q = "Select modification to ${mgrWord}:"
	$m2O = 'ValheimFPS&Boost','&1st-Person camera','E&mote wheel','E&quip wheel','Cloc&k','Com&pass','&Fermenter status','&Ore status','&Troll armor rework','E&xit'
	$m2P = $Host.UI.PromptForChoice($m2T, $m2Q, $m2O, 9)

  if ( $m2P -eq 0 ) {
    $modPf = "ValheimFPSBoost"
    $modPd = "0"
    $modCf = "0"
    $modChk = "$modPd"
    $modName = "$modPd"
    chgState
  }
  if ( $m2P -eq 1 ) {
    $modPf = "FirstPersonValheimClientMod"
    $modPd = "0"
    $modCf = "com.loki.clientmods.valheim.firstperson"
    $modChk = "$modPd"
    $modName = "Loki's First Person Valheim"
    chgState
  }
  if ( $m2P -eq 2 ) {
    $modPf = "EmoteWheel"
    $modPd = "0"
    $modCf = "virtuacode.valheim.emotewheel"
    $modChk = "$modPf"
    $modName = "Emote Wheel"
    chgState
  }
  if ( $m2P -eq 3 ) {
    $modPf = "EquipWheel"
    $modPd = "0"
    $modCf = "virtuacode.valheim.equipwheel"
    $modChk = "$modPf"
    $modName = "Equip Wheels"
    chgState
  }
  if ( $m2P -eq 4 ) {
    $modPf = "ClockMod"
    $modPd = "0"
    $modCf = "aedenthorn.ClockMod"
    $modChk = "$modPf"
    $modName = "Clock"
    chgState
  }
  if ( $m2P -eq 5 ) {
    $modPf = "Compass"
    $modPd = "Compass"
    $modCf = "aedenthorn.Compass"
    $modChk = "$modPf"
    $modName = "$modPd"
    chgState
  }
  if ( $m2P -eq 6 ) {
    $modPf = "FermenterStatus"
    $modPd = "0"
    $modCf = "0"
    $modChk = "$modPf"
    $modName = "Fermenter Status"
    chgState
  }
  if ( $m2P -eq 7 ) {
    $modPf = "0"
    $modPd = "Jowleth"
    $modCf = "0"
    $modChk = "$modPd"
    $modName = "Ore Status"
    chgState
  }
  if ( $m2P -eq 8 ) {
    $modPf = "TrollArmorRework"
    $modPd = "0"
    $modCf = "StrykeDev.TrollArmorRework"
    $modChk = "$modPf"
    $modName = "Troll armor rework"
    chgState
  }
  if ( $m2P -eq 9 ) {
		modMgmt
	}
}

# User-interactive mod managament menu
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
	$m1O = '&Enable','&Disable','&Main menu'
	$m1P = $Host.UI.PromptForChoice($m1T, $m1Q, $m1O, 2)

	if ( $m1P -eq 0 ) {
		Set-Variable -Name "modMode" -Value "0" -Scope Script
    $mgrWord = "enable"
    $postOpMsg = "0"
    $pMgrSrc = "disabledPlugins"
    $pMgrDst = "plugins"
    $cMgrSrc = "disabledConfig"
    $cMgrDst = "config"
    modSel
	}
	if ( $m1P -eq 1 ) {
		Set-Variable -Name "modMode" -Value "1" -Scope Script
    $mgrWord = "disable"
    $postOpMsg = "Re-enable it by changing management mode."
    $pMgrSrc = "plugins"
    $pMgrDst = "disabledPlugins"
    $cMgrSrc = "config"
    $cMgrDst = "disabledConfig"
    modSel
	}
	if ( $m1P -eq 2 ) {
		consent
	}
}

function mkLnOnce {
  # BepInEx plugin directories
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\Compass" -ItemType Junction -Path "$modPath\BepInEx\plugins\Compass" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\Jowleth" -ItemType Junction -Path "$modPath\BepInEx\plugins\Jowleth" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\ValheimFPSBoost" -ItemType Junction -Path "$modPath\BepInEx\plugins\ValheimFPSBoost" -ErrorAction SilentlyContinue | Out-Null
  # BepInEx plugins
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\ClockMod.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\ClockMod.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\Compass.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\Compass.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\EmoteWheel.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\EmoteWheel.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\EquipWheel.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\EquipWheel.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\EquipWheelFour.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\EquipWheelFour.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\EquipWheelThree.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\EquipWheelThree.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\EquipWheelTwo.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\EquipWheelTwo.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\FermenterStatus.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\FermenterStatus.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\FirstPersonValheimClientMod.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\FirstPersonValheimClientMod.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\TrollArmorRework.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\TrollArmorRework.dll" -ErrorAction SilentlyContinue | Out-Null
  # BepInEx configuration files
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\aedenthorn.ClockMod.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\aedenthorn.ClockMod.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\aedenthorn.Compass.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\aedenthorn.Compass.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\com.loki.clientmods.valheim.firstperson.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\com.loki.clientmods.valheim.firstperson.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\virtuacode.valheim.emotewheel.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\virtuacode.valheim.emotewheel.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\virtuacode.valheim.equipwheel.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\virtuacode.valheim.equipwheel.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\virtuacode.valheim.equipwheelfour.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\virtuacode.valheim.equipwheelfour.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\virtuacode.valheim.equipwheelthree.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\virtuacode.valheim.equipwheelthree.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\virtuacode.valheim.equipwheeltwo.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\virtuacode.valheim.equipwheeltwo.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\StrykeDev.TrollArmorRework.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\StrykeDev.TrollArmorRework.cfg" -ErrorAction SilentlyContinue | Out-Null
}

function mkLn {
  # BepInEx and MMHookGem
    # Directories
  New-Item -Target "$repoPath\$repoBranch\doorstop_libs" -ItemType Junction -Path "$modPath\doorstop_libs" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\unstripped_corlib" -ItemType Junction -Path "$modPath\unstripped_corlib" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\core" -ItemType Junction -Path "$modPath\BepInEx\core" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\patchers" -ItemType Junction -Path "$modPath\BepInEx\patchers" -ErrorAction SilentlyContinue | Out-Null
    # Files
  New-Item -Target "$repoPath\$repoBranch\doorstop_config.ini" -ItemType SymbolicLink -Path "$modPath\doorstop_config.ini" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\start_game_bepinex.sh" -ItemType SymbolicLink -Path "$modPath\start_game_bepinex.sh" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\start_server_bepinex.sh" -ItemType SymbolicLink -Path "$modPath\start_server_bepinex.sh" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\winhttp.dll" -ItemType SymbolicLink -Path "$modPath\winhttp.dll" -ErrorAction SilentlyContinue | Out-Null
    # config
  # BepInEx plugin directories
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\assets" -ItemType Junction -Path "$modPath\BepInEx\plugins\assets" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\BetterArchery" -ItemType Junction -Path "$modPath\BepInEx\plugins\BetterArchery" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\files" -ItemType Junction -Path "$modPath\BepInEx\plugins\files" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\FishFood" -ItemType Junction -Path "$modPath\BepInEx\plugins\FishFood" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\MasterChef" -ItemType Junction -Path "$modPath\BepInEx\plugins\MasterChef" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\MeadBaseIconFix" -ItemType Junction -Path "$modPath\BepInEx\plugins\MeadBaseIconFix" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\MMHOOK" -ItemType Junction -Path "$modPath\BepInEx\plugins\MMHOOK" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\OdinArchitect" -ItemType Junction -Path "$modPath\BepInEx\plugins\OdinArchitect" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\PotionsPlus" -ItemType Junction -Path "$modPath\BepInEx\plugins\PotionsPlus" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\RuneSwords" -ItemType Junction -Path "$modPath\BepInEx\plugins\RuneSwords" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\ValEx" -ItemType Junction -Path "$modPath\BepInEx\plugins\ValEx" -ErrorAction SilentlyContinue | Out-Null
  # BepInEx plugins
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\ABearCodes.Valheim.SimpleRecycling.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\ABearCodes.Valheim.SimpleRecycling.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\AddAllFuel.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\AddAllFuel.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\Advize_CartographySkill.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\Advize_CartographySkill.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\AnyPortal.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\AnyPortal.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\AutoSplitStack.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\AutoSplitStack.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\BetterLadders.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\BetterLadders.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\BetterWagon.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\BetterWagon.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\BuildExpansion.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\BuildExpansion.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\CookingSkill.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\CookingSkill.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\EquipmentAndQuickSlots.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\EquipmentAndQuickSlots.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\ExploreTogether.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\ExploreTogether.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\ExtendedItemDataFramework.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\ExtendedItemDataFramework.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\FarmGrid.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\FarmGrid.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\GodSword.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\GodSword.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\Gravekeeper.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\Gravekeeper.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\HanticksRPChatMod1.0.0.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\HanticksRPChatMod1.0.0.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\ImprovedBuildHud.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\ImprovedBuildHud.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\ImprovedSwimming.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\ImprovedSwimming.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\InstantMonsterDrop.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\InstantMonsterDrop.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\itemdrawers.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\itemdrawers.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\Jotunn.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\Jotunn.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\Jotunn.dll.mdb" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\Jotunn.dll.mdb" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\JotunnLib.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\JotunnLib.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\LastUsedWeapons.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\LastUsedWeapons.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\MeadBaseIconFix.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\MeadBaseIconFix.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\MerchantWhereabouts.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\MerchantWhereabouts.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\Moregates.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\Moregates.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\MultiCraft.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\MultiCraft.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\Necromancy.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\Necromancy.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\NexusUpdate.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\NexusUpdate.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\NoStamCosts.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\NoStamCosts.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\OverheadAxeSwing.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\OverheadAxeSwing.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\QuickStack.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\QuickStack.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\RepairAll.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\RepairAll.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\SkillInjector.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\SkillInjector.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\Skills Give More Carry Weight.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\Skills Give More Carry Weight.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\skyheim.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\skyheim.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\ToastyTorches.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\ToastyTorches.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\TPWolves.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\TPWolves.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\TrashItems.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\TrashItems.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\UseEquipmentInWater.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\UseEquipmentInWater.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\UsefulPaths.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\UsefulPaths.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\UsefulTrophies.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\UsefulTrophies.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\plugins\Valheim.DisplayBepInExInfo.dll" -ItemType SymbolicLink -Path "$modPath\BepInEx\plugins\Valheim.DisplayBepInExInfo.dll" -ErrorAction SilentlyContinue | Out-Null
  # BepInEx configuration Files
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\advize.CartographySkill.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\advize.CartographySkill.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\aedenthorn.AutoSplitStack.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\aedenthorn.AutoSplitStack.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\aedenthorn.InstantMonsterDrop.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\aedenthorn.InstantMonsterDrop.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\bakaSpaceman.LastUsedWeapons.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\bakaSpaceman.LastUsedWeapons.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\Basil_NoStamCosts.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\Basil_NoStamCosts.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\BepIn.Sarcen.FarmGrid.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\BepIn.Sarcen.FarmGrid.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\BepInEx.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\BepInEx.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\com.github.abearcodes.valheim.simplerecycling.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\com.github.abearcodes.valheim.simplerecycling.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\com.lvh-it.valheim.useequipmentinwater.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\com.lvh-it.valheim.useequipmentinwater.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\com.pipakin.SkillInjectorMod.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\com.pipakin.SkillInjectorMod.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\com.rolopogo.plugins.exploretogether.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\com.rolopogo.plugins.exploretogether.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\com.urgemeuwu.betterwagon.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\com.urgemeuwu.betterwagon.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\flueno.MerchantWhereabouts.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\flueno.MerchantWhereabouts.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\gg.khairex.usefultrophies.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\gg.khairex.usefultrophies.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\GodSwordKG.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\GodSwordKG.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\HookGenPatcher.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\HookGenPatcher.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\ishid4.mods.betterarchery.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\ishid4.mods.betterarchery.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\maximods.valheim.multicraft.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\maximods.valheim.multicraft.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\Menthus.bepinex.plugins.UsefulPaths.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\Menthus.bepinex.plugins.UsefulPaths.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\mixone.valheimplus.buildexpansion.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\mixone.valheimplus.buildexpansion.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\mkz.itemdrawers.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\mkz.itemdrawers.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\net.mtnewton.gravekeeper.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\net.mtnewton.gravekeeper.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\Necromancy.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\Necromancy.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\org.bepinex.plugins.valheim.quick_stack.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\org.bepinex.plugins.valheim.quick_stack.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\org.bepinex.valheim.displayinfo.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\org.bepinex.valheim.displayinfo.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\org.davidwofford.plugins.meadbaseiconfix.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\org.davidwofford.plugins.meadbaseiconfix.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\projjm.improvedswimming.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\projjm.improvedswimming.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\randyknapp.mods.epicloot.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\randyknapp.mods.epicloot.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\randyknapp.mods.equipmentandquickslots.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\randyknapp.mods.equipmentandquickslots.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\randyknapp.mods.extendeditemdataframework.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\randyknapp.mods.extendeditemdataframework.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\randyknapp.mods.improvedbuildhud.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\randyknapp.mods.improvedbuildhud.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\RepairAll.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\RepairAll.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\rin_jugatla.AddAllFuel.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\rin_jugatla.AddAllFuel.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\SkillsGiveMoreCarryWeight.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\SkillsGiveMoreCarryWeight.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\SSyl.FishFood.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\SSyl.FishFood.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\SSyl.ToastyTorches.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\SSyl.ToastyTorches.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\thegreyham.valheim.CookingSkill.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\thegreyham.valheim.CookingSkill.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\Toawy.TPWolves.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\Toawy.TPWolves.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\uk.co.jowleth.valheim.orestatus.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\uk.co.jowleth.valheim.orestatus.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$repoPath\$repoBranch\BepInEx\config\virtuacode.valheim.trashitems.cfg" -ItemType SymbolicLink -Path "$modPath\BepInEx\config\virtuacode.valheim.trashitems.cfg" -ErrorAction SilentlyContinue | Out-Null
}
