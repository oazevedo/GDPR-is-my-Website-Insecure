@echo off
color 1f
cls
:start

rem ===========================================================
rem developed by Oscar Azevedo
rem oscar.azevedo@aeportugal.pt, oscar.msazevedo@gmail.com
rem 2019-06-29
rem run webtools to see if website is insecure
rem ===========================================================

setlocal enableextensions
setlocal enabledelayedexpansion

rem defaults
(set browser=chrome.exe)
(set protocol=https://)

:menu
title "Is my Website inSecure?"
cls
echo.
echo. ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo. º    GDPR - Is my Website inSecure?                      º
echo. º                                                        º
echo. º  1. Test Website                                       º
echo. º  2.   choose browser (optional)                        º
echo. º  3.   choose protocol (optional)                       º
echo. º                                                        º
echo. º  F. Free Webtools used and Metrics                     º
echo. º  L. Legal and Privacy Terms                            º
echo. º  X. Exit                                               º
echo. º                                                        º
echo. º  Important: You should only use this tool to analyze   º
echo. º  websites whose owners have given you permission to do º
echo. º  so. In addition, always make a vulnerability analysis º
echo. º  (ex. OWASP). This is a Free Tool.                     º
echo. º                                                        º
echo. º (c)2019 r1.3 Oscar Azevedo                             º
echo. ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.

choice /c 123FLX /n /m " Choose an option (1,2,3,L,T,X) ? "
goto Label-%ERRORLEVEL%


:Label-1    Test Website
echo.
set /p site="  What is the website to analyze? "
if [%site%]==[] goto :menu

rem remove the protocol http:// or https:// from the website name
set host=!site:*//=!

rem remove forward slash
set host=!host:/=!

if [%browser%]==[chrome.exe]  (set private=incognito)
if [%browser%]==[msedge.exe]  (set private=private)
if [%browser%]==[firefox.exe] (set private=private-window)

rem url = protocol + host
(set url=%protocol%%host%)

@echo.
@echo. protocol = %protocol%
@echo.     site = %host%
@echo.      url = %url%
@echo.  browser = %browser%
@echo.  private = %private%
@echo.
timeout /t 30

start %browser% -new-tab -%private% %url%
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://pentest-tools.com/network-vulnerability-scanning/tcp-port-scanner-online-nmap/"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://sitecheck.sucuri.net/results/%url%"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://www.ssllabs.com/ssltest/analyze.html?d=%url%&hideResults=on&latest"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://observatory.allizom.org/analyze/index.html?host=%host%"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://internet.nl/site/%host%/"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://www.owasp.org/index.php/OWASP_Zed_Attack_Proxy_Project"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://www.ezigdpr.com/products/gdpr-website-compliance-checker"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://batchspeed.com/"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://developers.google.com/speed/pagespeed/insights/?url=%url%"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://gtmetrix.com/?url=%url%"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://validator.w3.org/nu/?showsource=no&doc=%url%/"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://jigsaw.w3.org/css-validator/validator?uri=%url%&profile=css3svg&usermedium=all&warning=1&vextwarning=&lang=en"
timeout /t 2 >nul

rem start %browser% -new-tab -%private% "https://website.grader.com/results/%url%"
rem timeout /t 2 >nul

goto :end


:Label-2    Choose Browser
choice /n /c cefx /m "  Choose the browser: (C)hrome, (E)dge Chromium, (F)irefox ? "
if ERRORLEVEL 1 (set browser=chrome.exe)
if ERRORLEVEL 2 (set browser=msedge.exe)
if ERRORLEVEL 3 (set browser=firefox.exe)
goto :menu


:Label-3    Choose Protocol
choice /n /c hs /m " Choose the protocol: (h)ttp: or http(s): ? "
if ERRORLEVEL 1 (set protocol=http://)
if ERRORLEVEL 2 (set protocol=https://)
goto :menu


:Label-4      Free Webtools and Metrics
@echo.
@echo. We use the following free web tools. Our thanks and appreciation to those who develop and maintain.
@echo.
@echo. 1. category:security, target:hosting
@echo.    "https://pentest-tools.com",       metric: tcp/443
@echo.    "https://sitecheck.sucuri.net/"    metric: no malware, no outdated software
@echo.    "https://www.ssllabs.com/ssltest"  metric: A
@echo.    "https://observatory.allizom.org/" metric: A
@echo.    "https://internet.nl/"             metric: 90
@echo.    "https://www.owasp.org/"           metric: no vulnerabilities
@echo.
@echo. 2. category:GDPR cookies, target:developers
@echo.    "https://www.ezigdpr.com/"         metric: no action required
@echo.
@echo. 3. category:quality, target:developers
@echo.    "https://batchspeed.com/"          metric: 90
@echo.    "https://developers.google.com/"   metric: 90 
@echo.    "https://gtmetrix.com/"            metric: 90
@echo.    "https://validator.w3.org/"        metric: no errors
@echo.    "https://jigsaw.w3.org/"           metric: no errors
@echo.
pause
goto :menu


:Label-5     Legal & Privacy
@echo.
@echo. Very Important:
@echo.
@echo. You should only use this tool to analyze/inspect websites whose owners have given you permission to do so.
@echo. Third party scanners are included on this tool for your convenience, and this does not imply an endorsement,
@echo. they are subject to different legal and privacy terms and may be licensed under different terms.
@echo. This tool is available "as is" and does not guarantee the accuracy of scan results.
@echo.
@echo. This free tool was developed by Oscar Azevedo. I hope you like it and please send your suggestions to 
@echo. oscar.azevedo@aeportugal.pt or oscar.msazevedo@gmail.com
@echo.
pause
goto :menu


:Label-6
:end
(set site=)
(set url=)
(set private=)
(set browser=)
(set protocol=)
endlocal


