@echo off
title ip 자동 설정
mode con cols=70 lines=15
color 27
REM #####################################
REM ##자동화를 위한 기본 설정 파일입니다.#######
REM #####################################

for /f %%A in ('cd') do set CUR_PATH=%%A
if not %CUR_PATH% ==  C:\Users\SSAFY\ssafy_ip_setting (
		echo "잘못된 위치에 디렉토리가 위치해있습니다."
		echo "C:\Users\SSAFY에 디렉토리를 위치시켜주시기 바랍니다."
		timeout /t -1
		exit /b 1
		)

copy AUTO_IP_SETTING.bat "C:\Users\SSAFY\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

REM dir "C:\Users\SSAFY\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
echo 설정이 완료되었습니다! 컴퓨터를 킬 때 ip 설정이 자동으로 적용됩니다.
timeout /t -1 
