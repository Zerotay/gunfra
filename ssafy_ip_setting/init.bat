@echo off
title ip �ڵ� ����
mode con cols=70 lines=15
color 27
REM #####################################
REM ##�ڵ�ȭ�� ���� �⺻ ���� �����Դϴ�.#######
REM #####################################

for /f %%A in ('cd') do set CUR_PATH=%%A
if not %CUR_PATH% ==  C:\Users\SSAFY\ssafy_ip_setting (
		echo "�߸��� ��ġ�� ���丮�� ��ġ���ֽ��ϴ�."
		echo "C:\Users\SSAFY�� ���丮�� ��ġ�����ֽñ� �ٶ��ϴ�."
		timeout /t -1
		exit /b 1
		)

copy AUTO_IP_SETTING.bat "C:\Users\SSAFY\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

REM dir "C:\Users\SSAFY\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
echo ������ �Ϸ�Ǿ����ϴ�! ��ǻ�͸� ų �� ip ������ �ڵ����� ����˴ϴ�.
timeout /t -1 
