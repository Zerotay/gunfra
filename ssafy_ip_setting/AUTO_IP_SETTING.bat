@echo off
title ip �ڵ� ����
mode con cols=70 lines=15
color 02
for /f "delims=" %%a in (C:\Users\SSAFY\ssafy_ip_setting\env.txt) do (
	%%a
	echo %%a
    )

netsh wlan show networks | findstr "%WIFI%" > tmp

for /f "delims=" %%a in (tmp) do (set "status=inssafy")
if not defined status set "status=outssafy"
del tmp

if "%status%" equ "inssafy" (
	netsh interface ipv4 set address name="%INTERFACE%" static address=%IP% mask=%SUBNET% gateway=%GATEWAY%
	netsh interface ipv4 set dns name="%INTERFACE%" static address=%DNS1%
	netsh interface ipv4 add dns name="%INTERFACE%" address=%DNS2% index=2
	echo ��Ƽķ�۽��� ��ġ���ֽ��ϴ�. IP ������ �Ϸ��߽��ϴ�!!!!!!
) else (
	netsh interface ipv4 set address name="%INTERFACE%" source=dhcp
	netsh interface ipv4 set dns name="%INTERFACE%" source=dhcp
	echo ��Ƽ ķ�۽��� ��ġ������ �ʽ��ϴ�. DHCP ������ �Ϸ��߽��ϴ�!!!!
)

set INTERFACE=
set WIFI=
set IP=
set SUBNET=
set GATEWAY=
set DNS1=
set DNS2=
timeout /t 3
