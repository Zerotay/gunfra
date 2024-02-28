@echo off
title ip 자동 설정
mode con cols=70 lines=15
color 27
REM #####################################
REM ##삭제해주는 파일입니다......#######
REM #####################################
schtasks /delete /tn "SSAFY_ip_setting"
timeout /t -1
