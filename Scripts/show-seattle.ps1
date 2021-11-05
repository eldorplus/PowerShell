﻿<#
.SYNOPSIS
	Shows Seattle in Google Maps 
.DESCRIPTION
	This script launches the Web browser and shows Seattle (USA) in Google Maps.
.EXAMPLE
	PS> ./show-seattle
.NOTES
	Author: Markus Fleschutz · License: CC0
.LINK
	https://github.com/fleschutz/PowerShell
#>

& "$PSScriptRoot/open-browser.ps1" "https://www.google.com/maps/place/Seattle"
exit 0 # success
