@echo off
netsh wlan show profiles | find "All User Profile" > profiles.dat

set DATFILE=profiles.dat

for /F "usebackq tokens=* delims=" %%A in (%DATFILE%) do (
	set the_line=%%A
	call :process_line
)
goto TheEnd

:process_line
for /F "usebackq tokens=1,2 delims=:" %%1 in ('%the_line:,=:%') do (
	set PROFILE=%%1
	set SSID=%%2
	echo SSID: %SSID%  >> content.dat
	echo SSID: %SSID%
	netsh wlan show profile%SSID% key=clear | FIND "Key Content" >> content.dat
	netsh wlan show profile%SSID% key=clear | FIND "Key Content"
)	
:TheEnd




