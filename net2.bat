@echo off

ipconfig | findstr /R "IPv4 Address\. \.\. \.\. \.\. : (.+\.){3}\d+"
hostname
pause