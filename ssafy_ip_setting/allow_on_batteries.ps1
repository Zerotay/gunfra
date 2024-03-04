$settings = (Get-ScheduledTask -Taskname "SSAFY_ip_setting").settings
$settings.disallowstartifonbatteries = $false
Set-ScheduledTask -TaskName "SSAFY_ip_setting" -settings $settings
remove-variable -name settings
