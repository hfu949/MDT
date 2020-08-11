Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'-Name "fDenyTSConnections" -Value 0 -Force
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name "UserAuthentication" -Value 0 -Force
Enable-NetFirewallRule -DisplayGroup "Remote Desktop" 
Enable-NetFirewallRule -Name 'FPS-ICMP4-ERQ-In'
Set-NetFirewallProfile -Profile Domain,Private,Public -Enabled False
Install-WindowsFeature -name Failover-Clustering -IncludeAllSubFeature -IncludeManagementTools
Install-WindowsFeature -name "BitLocker", "Data-Center-Bridging", "FS-FileServer", "Hyper-V", "Hyper-V-PowerShell", "RSAT-Clustering-PowerShell", "Storage-Replica", "FS-SMBBW", "FS-Data-Deduplication" -IncludeAllSubFeature -IncludeManagementTools
