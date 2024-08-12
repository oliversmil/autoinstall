# Install IIS role with all features
Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature

# Install .NET Framework 4.8
Invoke-WebRequest -Uri "https://go.microsoft.com/fwlink/?LinkId=2085155" -OutFile "ndp48-web.exe"
Start-Process -FilePath "ndp48-web.exe" -ArgumentList "/q /norestart" -Wait

# Install .NET Runtime 6.0
Invoke-WebRequest -Uri "https://download.visualstudio.microsoft.com/download/pr/39a92353-b3e7-4349-86ee-8d2b90747618/c461fa0973654fa3a611944ed24a90d5/dotnet-hosting-6.0.16-win.exe" -OutFile "dotnet-hosting-6.0.16-win.exe"
Start-Process -FilePath "dotnet-hosting-6.0.16-win.exe" -ArgumentList "/install /quiet /norestart" -Wait

# Install Microsoft Visual C++ 2015-2019 Redistributable
Invoke-WebRequest -Uri "https://aka.ms/vs/16/release/vc_redist.x86.exe" -OutFile "vc_redist.x86.exe"
Invoke-WebRequest -Uri "https://aka.ms/vs/16/release/vc_redist.x64.exe" -OutFile "vc_redist.x64.exe"
Start-Process -FilePath "vc_redist.x86.exe" -ArgumentList "/install /quiet /norestart" -Wait
Start-Process -FilePath "vc_redist.x64.exe" -ArgumentList "/install /quiet /norestart" -Wait

# Install PowerShell 7.2
Invoke-WebRequest -Uri "https://github.com/PowerShell/PowerShell/releases/download/v7.2.11/PowerShell-7.2.11-win-x64.msi" -OutFile "PowerShell-7.2.11-win-x64.msi"
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i PowerShell-7.2.11-win-x64.msi /qn" -Wait

# Restart the server to apply changes
Restart-Computer -Force