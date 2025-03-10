The *open-microsoft-store.ps1* Script
===========================

This script launches the Microsoft Store application.

Parameters
----------
```powershell
/home/markus/Repos/PowerShell/scripts/open-microsoft-store.ps1 [<CommonParameters>]

[<CommonParameters>]
    This script supports the common parameters: Verbose, Debug, ErrorAction, ErrorVariable, WarningAction, 
    WarningVariable, OutBuffer, PipelineVariable, and OutVariable.
```

Example
-------
```powershell
PS> ./open-microsoft-store

```

Notes
-----
Author: Markus Fleschutz | License: CC0

Related Links
-------------
https://github.com/fleschutz/PowerShell

Script Content
--------------
```powershell
<#
.SYNOPSIS
	Starts the Microsoft Store app
.DESCRIPTION
	This script launches the Microsoft Store application.
.EXAMPLE
	PS> ./open-microsoft-store
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

Start-Process ms-windows-store:
exit 0 # success
```

*(generated by convert-ps2md.ps1 as of 11/20/2024 11:51:58)*
