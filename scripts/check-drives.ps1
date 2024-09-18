﻿<#
.SYNOPSIS
	Checks the drive space
.DESCRIPTION
	This PowerShell script queries the free space of all drives and prints it.
.PARAMETER minLevel
	Specifies the minimum warning level (10GB by default)
.EXAMPLE
	PS> ./check-drives.ps1
	✅ 📂C: uses 489GB (53%) of 930GB, 📂D: uses 3TB (87%) of 4TB, 📂E: is empty
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

param([int64]$minLevel = 10GB)

function Bytes2String { param([int64]$bytes)
        if ($bytes -lt 1KB) { return "$bytes bytes" }
        if ($bytes -lt 1MB) { return '{0:N0}KB' -f ($bytes / 1KB) }
        if ($bytes -lt 1GB) { return '{0:N0}MB' -f ($bytes / 1MB) }
        if ($bytes -lt 1TB) { return '{0:N0}GB' -f ($bytes / 1GB) }
        if ($bytes -lt 1PB) { return '{0:N0}TB' -f ($bytes / 1TB) }
        return '{0:N0}GB' -f ($bytes / 1PB)
}

try {
	Write-Progress "Querying drives..."
	$drives = Get-PSDrive -PSProvider FileSystem
	Write-Progress -completed "Done."
	$status = "✅"
	$reply = ""
	foreach($drive in $drives) {
		$details = (Get-PSDrive $drive.Name)
		if ($IsLinux) { $name = $drive.Name } else { $name = $drive.Name + ":" }
		[int64]$free = $details.Free
 		[int64]$used = $details.Used
		[int64]$total = ($used + $free)
		if ($reply -ne "") { $reply += ", " }
		if ($total -eq 0) {
			$reply += "📂$name is empty"
		} elseif ($free -eq 0) {
			$status = "⚠️"
			$reply += "📂$name with ($(Bytes2String $total)) is FULL"
		} elseif ($free -lt $minLevel) {
			$status = "⚠️"
			$reply += "📂$name is nearly full ($(Bytes2String $free) of $(Bytes2String $total) left)"
		} else {
			[int64]$percent = ($used * 100) / $total
			$reply += "📂$name uses $(Bytes2String $used) ($percent%) of $(Bytes2String $total)"
		}
	}
	Write-Host "$status $reply"
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
