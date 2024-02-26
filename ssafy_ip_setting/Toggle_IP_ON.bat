REM # 싸피 노트북 네트워크 설정
REM # 노트북을 반출해서 사용하긴 해야 하는데..
REM # 매번 네트워크 설정을 하기가 귀찮았던 당신을 위한 자동화 스크립트 파일~
REM # 개선사항, 버그 관련 제보 환영합니다
REM # Made By 싸피 10기 1045374 김동건 
REM # Ver 1.0.0


for /f "delims=" %%a in (C:\Users\SSAFY\ssafy_ip_setting\env.txt) do (
        %%a
    )

netsh interface ipv4 show config name="%WIFI%" | findstr "DHCP" | findstr "Yes" > tmp

set "status="

for /f "delims=" %%a in (tmp) do (
        set "status=outssafy"
    )
if not defined status set "status=inssafy"
echo %status%
del tmp

if "%status%" equ "outssafy" (
	echo setting for multicampus
	rename Toggle_IP_ON.bat Toggle_IP_OFF.bat
	netsh interface ipv4 set address name="%WIFI%" static address=%IP% mask=%SUBNET% gateway=%GATEWAY%
	netsh interface ipv4 set dns name="%WIFI%" static address=%DNS1%
	netsh interface ipv4 add dns name="%WIFI%" address=%DNS2% index=2
) else (
	echo setting for outplace
	rename Toggle_IP_OFF.bat Toggle_IP_ON.bat
	netsh interface ipv4 set address name="%WIFI%" source=dhcp
	netsh interface ipv4 set dns name="%WIFI%" source=dhcp
)

set WIFI=
set IP=
set SUBNET=
set GATEWAY=
set DNS1=
set DNS2=

echo setting done
