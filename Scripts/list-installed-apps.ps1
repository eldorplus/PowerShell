﻿<#
.SYNOPSIS
	list-installed-apps.ps1
.DESCRIPTION
	Lists the installed apps (from Windows Store or snaps)
.EXAMPLE
	PS> ./list-installed-apps
.NOTES
	Author: Markus Fleschutz · License: CC0
.LINK
	https://github.com/fleschutz/PowerShell
#>

try {
	if ($IsLinux) {
		& snap list
	} else {
		get-appxPackage | select-object Name,Version | format-table -autoSize
	}
	exit 0
} catch {
	"⚠️ Error: $($Error[0]) ($($MyInvocation.MyCommand.Name):$($_.InvocationInfo.ScriptLineNumber))"
	exit 1
}
