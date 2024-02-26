@echo off
for /f "delims=" %%a in (C:\Users\SSAFY\ssafy_ip_setting\env.txt) do (
        %%a
    )

echo %WIFI%

netsh wlan show networks | findstr "%WIFI%" > tmp

for /f "delims=" %%a in (tmp) do (set "status=inssafy")
if not defined status set "status=outssafy"
echo %status%
del tmp

if "%status%" equ "inssafy" (
	netsh interface ipv4 set address name="%INTERFACE%" static address=%IP% mask=%SUBNET% gateway=%GATEWAY%
	netsh interface ipv4 set dns name="%INTERFACE%" static address=%DNS1%
	netsh interface ipv4 add dns name="%INTERFACE%" address=%DNS2% index=2
	echo "You are in MultiCampus, IP config complete!!!!"
) else (
	netsh interface ipv4 set address name="%INTERFACE%" source=dhcp
	netsh interface ipv4 set dns name="%INTERFACE%" source=dhcp
	echo "You are not in MultiCampus, ¿ÀÇÏ?DHCP config complete!!!!"
)

set INTERFACE=
set WIFI=
set IP=
set SUBNET=
set GATEWAY=
set DNS1=
set DNS2=
timeout /t -1
