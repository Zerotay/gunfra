@echo off
title ip �ڵ� ����
mode con cols=70 lines=15
color 27
REM #####################################
REM ##�������ִ� �����Դϴ�......#######
REM #####################################
schtasks /delete /tn "SSAFY_ip_setting"
timeout /t -1
