# Shorten paths
$pBPXsrc = "$repoPath\$repoBranch\BepInEx\plugins"
$pBPXdst = "$modPath\BepInEx\plugins"
$cBPXsrc = "$repoPath\$repoBranch\BepInEx\config"
$cBPXdst = "$modPath\BepInEx\config"

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
	$m2O = 'ValheimFPS&Boost','&1st-Person camera','E&mote wheel','E&quip wheel','Cloc&k','Com&pass','&Fermenter status','&Ore status','&Troll armor rework','Movable inventory &windows','E&xit'
	$m2P = $Host.UI.PromptForChoice($m2T, $m2Q, $m2O, 10)

  if ( $m2P -eq 0 ) {
    $modPf = "0"
    $modPd = "ValheimFPSBoost"
    $modCf = "0"
    $modChk = "$modPd"
    $modName = "$modPd"
    chgState
  }
  if ( $m2P -eq 1 ) {
    $modPf = "FirstPersonValheimClientMod"
    $modPd = "0"
    $modCf = "com.loki.clientmods.valheim.firstperson"
    $modChk = "$modPf."
    $modName = "Loki's First Person Valheim"
    chgState
  }
  if ( $m2P -eq 2 ) {
    $modPf = "EmoteWheel"
    $modPd = "0"
    $modCf = "virtuacode.valheim.emotewheel"
    $modChk = "$modPf.dll"
    $modName = "Emote Wheel"
    chgState
  }
  if ( $m2P -eq 3 ) {
    $modPf = "EquipWheel"
    $modPd = "0"
    $modCf = "virtuacode.valheim.equipwheel"
    $modChk = "$modPf.dll"
    $modName = "Equip Wheels"
    chgState
  }
  if ( $m2P -eq 4 ) {
    $modPf = "ClockMod"
    $modPd = "0"
    $modCf = "aedenthorn.ClockMod"
    $modChk = "$modPf.dll"
    $modName = "Clock"
    chgState
  }
  if ( $m2P -eq 5 ) {
    $modPf = "Compass"
    $modPd = "Compass"
    $modCf = "aedenthorn.Compass"
    $modChk = "$modPf.dll"
    $modName = "$modPd"
    chgState
  }
  if ( $m2P -eq 6 ) {
    $modPf = "FermenterStatus"
    $modPd = "0"
    $modCf = "0"
    $modChk = "$modPf.dll"
    $modName = "Fermenter Status"
    chgState
  }
  if ( $m2P -eq 7 ) {
    $modPf = "0"
    $modPd = "Jowleth"
    $modCf = "uk.co.jowleth.valheim.orestatus.cfg"
    $modChk = "$modPd"
    $modName = "Ore Status"
    chgState
  }
  if ( $m2P -eq 8 ) {
    $modPf = "TrollArmorRework"
    $modPd = "0"
    $modCf = "StrykeDev.TrollArmorRework"
    $modChk = "$modPf.dll"
    $modName = "Troll armor rework"
    chgState
  }
  if ( $m2P -eq 9 ) {
    $modPf = "MovableInventoryWindows"
    $modPd = "0"
    $modCf = "aedenthorn.MovableInventoryWindows"
    $modChk = "$modPf.dll"
    $modName = "Movable inventory windows"
    chgState
  }
  if ( $m2P -eq 10 ) {
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
  New-Item -Target "$pBPXsrc\Compass" -ItemType Junction -Path "$pBPXdst\Compass" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$pBPXsrc\Jowleth" -ItemType Junction -Path "$pBPXdst\Jowleth" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$pBPXsrc\ValheimFPSBoost" -ItemType Junction -Path "$pBPXdst\ValheimFPSBoost" -ErrorAction SilentlyContinue | Out-Null
  # BepInEx plugins
  New-Item -Target "$pBPXsrc\ClockMod.dll" -ItemType SymbolicLink -Path "$pBPXdst\ClockMod.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$pBPXsrc\Compass.dll" -ItemType SymbolicLink -Path "$pBPXdst\Compass.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$pBPXsrc\EmoteWheel.dll" -ItemType SymbolicLink -Path "$pBPXdst\EmoteWheel.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$pBPXsrc\EquipWheel.dll" -ItemType SymbolicLink -Path "$pBPXdst\EquipWheel.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$pBPXsrc\EquipWheelFour.dll" -ItemType SymbolicLink -Path "$pBPXdst\EquipWheelFour.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$pBPXsrc\EquipWheelThree.dll" -ItemType SymbolicLink -Path "$pBPXdst\EquipWheelThree.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$pBPXsrc\EquipWheelTwo.dll" -ItemType SymbolicLink -Path "$pBPXdst\EquipWheelTwo.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$pBPXsrc\FermenterStatus.dll" -ItemType SymbolicLink -Path "$pBPXdst\FermenterStatus.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$pBPXsrc\FirstPersonValheimClientMod.dll" -ItemType SymbolicLink -Path "$pBPXdst\FirstPersonValheimClientMod.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$pBPXsrc\MovableInventoryWindows.dll" -ItemType SymbolicLink -Path "$pBPXdst\MovableInventoryWindows.dll" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$pBPXsrc\TrollArmorRework.dll" -ItemType SymbolicLink -Path "$pBPXdst\TrollArmorRework.dll" -ErrorAction SilentlyContinue | Out-Null
  # BepInEx configuration
  New-Item -Target "$cBPXsrc\aedenthorn.ClockMod.cfg" -ItemType SymbolicLink -Path "$cBPXdst\aedenthorn.ClockMod.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$cBPXsrc\aedenthorn.Compass.cfg" -ItemType SymbolicLink -Path "$cBPXdst\aedenthorn.Compass.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$cBPXsrc\aedenthorn.MovableInventoryWindows.cfg" -ItemType SymbolicLink -Path "$cBPXdst\aedenthorn.MovableInventoryWindows.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$cBPXsrc\com.loki.clientmods.valheim.firstperson.cfg" -ItemType SymbolicLink -Path "$cBPXdst\com.loki.clientmods.valheim.firstperson.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$cBPXsrc\virtuacode.valheim.emotewheel.cfg" -ItemType SymbolicLink -Path "$cBPXdst\virtuacode.valheim.emotewheel.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$cBPXsrc\virtuacode.valheim.equipwheel.cfg" -ItemType SymbolicLink -Path "$cBPXdst\virtuacode.valheim.equipwheel.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$cBPXsrc\virtuacode.valheim.equipwheelfour.cfg" -ItemType SymbolicLink -Path "$cBPXdst\virtuacode.valheim.equipwheelfour.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$cBPXsrc\virtuacode.valheim.equipwheelthree.cfg" -ItemType SymbolicLink -Path "$cBPXdst\virtuacode.valheim.equipwheelthree.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$cBPXsrc\virtuacode.valheim.equipwheeltwo.cfg" -ItemType SymbolicLink -Path "$cBPXdst\virtuacode.valheim.equipwheeltwo.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-Item -Target "$cBPXsrc\StrykeDev.TrollArmorRework.cfg" -ItemType SymbolicLink -Path "$cBPXdst\StrykeDev.TrollArmorRework.cfg" -ErrorAction SilentlyContinue | Out-Null
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
  New-item -Target "$pBPXsrc\assets" -ItemType Junction -Path "$pBPXdst\assets" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\BetterArchery" -ItemType Junction -Path "$pBPXdst\BetterArchery" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\files" -ItemType Junction -Path "$pBPXdst\files" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\FishFood" -ItemType Junction -Path "$pBPXdst\FishFood" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\MasterChef" -ItemType Junction -Path "$pBPXdst\MasterChef" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\MeadBaseIconFix" -ItemType Junction -Path "$pBPXdst\MeadBaseIconFix" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\OdinArchitect" -ItemType Junction -Path "$pBPXdst\OdinArchitect" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\PotionsPlus" -ItemType Junction -Path "$pBPXdst\PotionsPlus" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\RuneSwords" -ItemType Junction -Path "$pBPXdst\RuneSwords" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\ValEx" -ItemType Junction -Path "$pBPXdst\ValEx" -ErrorAction SilentlyContinue | Out-Null
  # BepInEx plugins
  New-item -Target "$pBPXsrc\ABearCodes.Valheim.SimpleRecycling.dll" -ItemType SymbolicLink -Path "$pBPXdst\ABearCodes.Valheim.SimpleRecycling.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\AddAllFuel.dll" -ItemType SymbolicLink -Path "$pBPXdst\AddAllFuel.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\Advize_CartographySkill.dll" -ItemType SymbolicLink -Path "$pBPXdst\Advize_CartographySkill.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\AnyPortal.dll" -ItemType SymbolicLink -Path "$pBPXdst\AnyPortal.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\AutoSplitStack.dll" -ItemType SymbolicLink -Path "$pBPXdst\AutoSplitStack.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\BetterLadders.dll" -ItemType SymbolicLink -Path "$pBPXdst\BetterLadders.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\BetterWagon.dll" -ItemType SymbolicLink -Path "$pBPXdst\BetterWagon.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\BuildExpansion.dll" -ItemType SymbolicLink -Path "$pBPXdst\BuildExpansion.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\CookingSkill.dll" -ItemType SymbolicLink -Path "$pBPXdst\CookingSkill.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\ExploreTogether.dll" -ItemType SymbolicLink -Path "$pBPXdst\ExploreTogether.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\ExtendedItemDataFramework.dll" -ItemType SymbolicLink -Path "$pBPXdst\ExtendedItemDataFramework.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\FarmGrid.dll" -ItemType SymbolicLink -Path "$pBPXdst\FarmGrid.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\fastJSON.dll" -ItemType SymbolicLink -Path "$pBPXdst\fastJSON.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\Fisticuffs.dll" -ItemType SymbolicLink -Path "$pBPXdst\Fisticuffs.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\GodSword.dll" -ItemType SymbolicLink -Path "$pBPXdst\GodSword.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\Gravekeeper.dll" -ItemType SymbolicLink -Path "$pBPXdst\Gravekeeper.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\HanticksRPChatMod1.0.0.dll" -ItemType SymbolicLink -Path "$pBPXdst\HanticksRPChatMod1.0.0.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\ImprovedBuildHud.dll" -ItemType SymbolicLink -Path "$pBPXdst\ImprovedBuildHud.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\ImprovedSwimming.dll" -ItemType SymbolicLink -Path "$pBPXdst\ImprovedSwimming.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\InstantMonsterDrop.dll" -ItemType SymbolicLink -Path "$pBPXdst\InstantMonsterDrop.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\itemdrawers.dll" -ItemType SymbolicLink -Path "$pBPXdst\itemdrawers.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\Jotunn.dll" -ItemType SymbolicLink -Path "$pBPXdst\Jotunn.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\Jotunn.dll.mdb" -ItemType SymbolicLink -Path "$pBPXdst\Jotunn.dll.mdb" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\JotunnLib.dll" -ItemType SymbolicLink -Path "$pBPXdst\JotunnLib.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\LastUsedWeapons.dll" -ItemType SymbolicLink -Path "$pBPXdst\LastUsedWeapons.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\MeadBaseIconFix.dll" -ItemType SymbolicLink -Path "$pBPXdst\MeadBaseIconFix.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\MerchantWhereabouts.dll" -ItemType SymbolicLink -Path "$pBPXdst\MerchantWhereabouts.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\Moregates.dll" -ItemType SymbolicLink -Path "$pBPXdst\Moregates.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\MultiCraft.dll" -ItemType SymbolicLink -Path "$pBPXdst\MultiCraft.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\Necromancy.dll" -ItemType SymbolicLink -Path "$pBPXdst\Necromancy.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\NexusUpdate.dll" -ItemType SymbolicLink -Path "$pBPXdst\NexusUpdate.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\NoStamCosts.dll" -ItemType SymbolicLink -Path "$pBPXdst\NoStamCosts.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\OverheadAxeSwing.dll" -ItemType SymbolicLink -Path "$pBPXdst\OverheadAxeSwing.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\QuickStack.dll" -ItemType SymbolicLink -Path "$pBPXdst\QuickStack.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\RepairAll.dll" -ItemType SymbolicLink -Path "$pBPXdst\RepairAll.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\RRRBetterRaids_0.2.0.dll" -ItemType SymbolicLink -Path "$pBPXdst\RRRBetterRaids_0.2.0.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\RRRCore.dll" -ItemType SymbolicLink -Path "$pBPXdst\RRRCore.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\RRRMonsters.dll" -ItemType SymbolicLink -Path "$pBPXdst\RRRMonsters.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\RRRNpcs_0.2.2.dll" -ItemType SymbolicLink -Path "$pBPXdst\RRRNpcs_0.2.2.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\SkillInjector.dll" -ItemType SymbolicLink -Path "$pBPXdst\SkillInjector.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\Skills" -ItemType SymbolicLink -Path "$pBPXdst\Skills" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\skyheim.dll" -ItemType SymbolicLink -Path "$pBPXdst\skyheim.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\ToastyTorches.dll" -ItemType SymbolicLink -Path "$pBPXdst\ToastyTorches.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\TPWolves.dll" -ItemType SymbolicLink -Path "$pBPXdst\TPWolves.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\TrashItems.dll" -ItemType SymbolicLink -Path "$pBPXdst\TrashItems.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\UseEquipmentInWater.dll" -ItemType SymbolicLink -Path "$pBPXdst\UseEquipmentInWater.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\UsefulPaths.dll" -ItemType SymbolicLink -Path "$pBPXdst\UsefulPaths.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\UsefulTrophies.dll" -ItemType SymbolicLink -Path "$pBPXdst\UsefulTrophies.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\Valheim.CustomRaids.dll" -ItemType SymbolicLink -Path "$pBPXdst\Valheim.CustomRaids.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\Valheim.DisplayBepInExInfo.dll" -ItemType SymbolicLink -Path "$pBPXdst\Valheim.DisplayBepInExInfo.dll" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$pBPXsrc\Valheim.SpawnThat.dll" -ItemType SymbolicLink -Path "$pBPXdst\Valheim.SpawnThat.dll" -ErrorAction SilentlyContinue | Out-Null
  # BepInEx configuration directories
  New-item -Target "$cBPXsrc\" -ItemType Junction -Path "$cBPXdst\" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\AshLand" -ItemType Junction -Path "$cBPXdst\AshLand" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\custom_raids.supplemental.Ashlands" -ItemType Junction -Path "$cBPXdst\custom_raids.supplemental.Ashlands" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\custom_raids.supplemental.Svartalfar" -ItemType Junction -Path "$cBPXdst\custom_raids.supplemental.Svartalfar" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\Ocean" -ItemType Junction -Path "$cBPXdst\Ocean" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\Svartalfar" -ItemType Junction -Path "$cBPXdst\Svartalfar" -ErrorAction SilentlyContinue | Out-Null
  # BepInEx configuration
  New-item -Target "$cBPXsrc\advize.CartographySkill.cfg" -ItemType SymbolicLink -Path "$cBPXdst\advize.CartographySkill.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\aedenthorn.AutoSplitStack.cfg" -ItemType SymbolicLink -Path "$cBPXdst\aedenthorn.AutoSplitStack.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\aedenthorn.CustomMeshes.cfg" -ItemType SymbolicLink -Path "$cBPXdst\aedenthorn.CustomMeshes.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\aedenthorn.InstantMonsterDrop.cfg" -ItemType SymbolicLink -Path "$cBPXdst\aedenthorn.InstantMonsterDrop.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\aedenthorn.NexusUpdate.cfg" -ItemType SymbolicLink -Path "$cBPXdst\aedenthorn.NexusUpdate.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\bakaSpaceman.LastUsedWeapons.cfg" -ItemType SymbolicLink -Path "$cBPXdst\bakaSpaceman.LastUsedWeapons.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\Basil_NoStamCosts.cfg" -ItemType SymbolicLink -Path "$cBPXdst\Basil_NoStamCosts.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\BepInEx.cfg" -ItemType SymbolicLink -Path "$cBPXdst\BepInEx.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\BepIn.Sarcen.FarmGrid.cfg" -ItemType SymbolicLink -Path "$cBPXdst\BepIn.Sarcen.FarmGrid.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\com.alexanderstrada.rrrbetterraids.cfg" -ItemType SymbolicLink -Path "$cBPXdst\com.alexanderstrada.rrrbetterraids.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\com.alexanderstrada.rrrmonsters.cfg" -ItemType SymbolicLink -Path "$cBPXdst\com.alexanderstrada.rrrmonsters.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\com.alexanderstrada.rrrnpcs.cfg" -ItemType SymbolicLink -Path "$cBPXdst\com.alexanderstrada.rrrnpcs.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\com.github.abearcodes.valheim.simplerecycling.cfg" -ItemType SymbolicLink -Path "$cBPXdst\com.github.abearcodes.valheim.simplerecycling.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\com.lvh-it.valheim.useequipmentinwater.cfg" -ItemType SymbolicLink -Path "$cBPXdst\com.lvh-it.valheim.useequipmentinwater.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\com.pipakin.SkillInjectorMod.cfg" -ItemType SymbolicLink -Path "$cBPXdst\com.pipakin.SkillInjectorMod.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\com.rolopogo.plugins.exploretogether.cfg" -ItemType SymbolicLink -Path "$cBPXdst\com.rolopogo.plugins.exploretogether.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\com.urgemeuwu.betterwagon.cfg" -ItemType SymbolicLink -Path "$cBPXdst\com.urgemeuwu.betterwagon.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\custom_raids.cfg" -ItemType SymbolicLink -Path "$cBPXdst\custom_raids.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\custom_raids.supplemental.deathsquitoseason.cfg" -ItemType SymbolicLink -Path "$cBPXdst\custom_raids.supplemental.deathsquitoseason.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\custom_raids.supplemental.ragnarok.cfg" -ItemType SymbolicLink -Path "$cBPXdst\custom_raids.supplemental.ragnarok.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\flueno.MerchantWhereabouts.cfg" -ItemType SymbolicLink -Path "$cBPXdst\flueno.MerchantWhereabouts.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\gg.khairex.usefultrophies.cfg" -ItemType SymbolicLink -Path "$cBPXdst\gg.khairex.usefultrophies.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\GodSwordKG.cfg" -ItemType SymbolicLink -Path "$cBPXdst\GodSwordKG.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\HookGenPatcher.cfg" -ItemType SymbolicLink -Path "$cBPXdst\HookGenPatcher.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\ishid4.mods.betterarchery.cfg" -ItemType SymbolicLink -Path "$cBPXdst\ishid4.mods.betterarchery.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\maximods.valheim.multicraft.cfg" -ItemType SymbolicLink -Path "$cBPXdst\maximods.valheim.multicraft.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\Menthus.bepinex.plugins.UsefulPaths.cfg" -ItemType SymbolicLink -Path "$cBPXdst\Menthus.bepinex.plugins.UsefulPaths.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\mixone.valheimplus.buildexpansion.cfg" -ItemType SymbolicLink -Path "$cBPXdst\mixone.valheimplus.buildexpansion.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\mkz.itemdrawers.cfg" -ItemType SymbolicLink -Path "$cBPXdst\mkz.itemdrawers.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\Necromancy.cfg" -ItemType SymbolicLink -Path "$cBPXdst\Necromancy.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\net.mtnewton.gravekeeper.cfg" -ItemType SymbolicLink -Path "$cBPXdst\net.mtnewton.gravekeeper.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\org.bepinex.plugins.valheim.quick_stack.cfg" -ItemType SymbolicLink -Path "$cBPXdst\org.bepinex.plugins.valheim.quick_stack.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\org.bepinex.valheim.displayinfo.cfg" -ItemType SymbolicLink -Path "$cBPXdst\org.bepinex.valheim.displayinfo.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\org.davidwofford.plugins.meadbaseiconfix.cfg" -ItemType SymbolicLink -Path "$cBPXdst\org.davidwofford.plugins.meadbaseiconfix.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\org.zarboz.fisticuffs.cfg" -ItemType SymbolicLink -Path "$cBPXdst\org.zarboz.fisticuffs.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\projjm.improvedswimming.cfg" -ItemType SymbolicLink -Path "$cBPXdst\projjm.improvedswimming.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\QuickStack_player_1004870602.dat" -ItemType SymbolicLink -Path "$cBPXdst\QuickStack_player_1004870602.dat" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\QuickStack_player_1838963051.dat" -ItemType SymbolicLink -Path "$cBPXdst\QuickStack_player_1838963051.dat" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\QuickStack_player_750192959.dat" -ItemType SymbolicLink -Path "$cBPXdst\QuickStack_player_750192959.dat" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\randyknapp.mods.epicloot.cfg" -ItemType SymbolicLink -Path "$cBPXdst\randyknapp.mods.epicloot.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\randyknapp.mods.equipmentandquickslots.cfg" -ItemType SymbolicLink -Path "$cBPXdst\randyknapp.mods.equipmentandquickslots.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\randyknapp.mods.extendeditemdataframework.cfg" -ItemType SymbolicLink -Path "$cBPXdst\randyknapp.mods.extendeditemdataframework.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\randyknapp.mods.improvedbuildhud.cfg" -ItemType SymbolicLink -Path "$cBPXdst\randyknapp.mods.improvedbuildhud.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\RepairAll.cfg" -ItemType SymbolicLink -Path "$cBPXdst\RepairAll.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\rin_jugatla.AddAllFuel.cfg" -ItemType SymbolicLink -Path "$cBPXdst\rin_jugatla.AddAllFuel.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\SkillsGiveMoreCarryWeight.cfg" -ItemType SymbolicLink -Path "$cBPXdst\SkillsGiveMoreCarryWeight.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\spawn_that.cfg" -ItemType SymbolicLink -Path "$cBPXdst\spawn_that.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\spawn_that.local_spawners.ashlands.cfg" -ItemType SymbolicLink -Path "$cBPXdst\spawn_that.local_spawners.ashlands.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\spawn_that.world_spawners.ashlands.cfg" -ItemType SymbolicLink -Path "$cBPXdst\spawn_that.world_spawners.ashlands.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\spawn_that.world_spawners.ocean.cfg" -ItemType SymbolicLink -Path "$cBPXdst\spawn_that.world_spawners.ocean.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\SSyl.FishFood.cfg" -ItemType SymbolicLink -Path "$cBPXdst\SSyl.FishFood.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\SSyl.ToastyTorches.cfg" -ItemType SymbolicLink -Path "$cBPXdst\SSyl.ToastyTorches.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\thegreyham.valheim.CookingSkill.cfg" -ItemType SymbolicLink -Path "$cBPXdst\thegreyham.valheim.CookingSkill.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\Toawy.TPWolves.cfg" -ItemType SymbolicLink -Path "$cBPXdst\Toawy.TPWolves.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\virtuacode.valheim.trashitems.cfg" -ItemType SymbolicLink -Path "$cBPXdst\virtuacode.valheim.trashitems.cfg" -ErrorAction SilentlyContinue | Out-Null
  New-item -Target "$cBPXsrc\zarboz.fisticuffs.cfg" -ItemType SymbolicLink -Path "$cBPXdst\zarboz.fisticuffs.cfg" -ErrorAction SilentlyContinue | Out-Null
}
