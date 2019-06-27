@echo off
color 1f
cls
:start

rem =======================================================
rem developed by Oscar Azevedo
rem oscar.azevedo@aeportugal.pt, oscar.msazevedo@gmail.com
rem 2019-06-05
rem run webtools to see if website is insecure
rem =======================================================

@echo.
@echo.
@echo.    GDPR - Is my Website inSecure?

@echo.
@echo. Importante:
@echo.  Leia primeiro o guia "GDPR - Websites: security, privacy, performance and quality".
@echo.  Adicionalmente fa‡a sempre uma an lise de vulnerabilidades (ex. OWASP)!
@echo.  O uso desta ferramenta ‚ da exclusiva responsabilidade de quem a utiliza!
@echo.  
@echo.
@echo. (c)2019 r1.3, AEP / Sistemas de Informacao
@echo. 

setlocal enabledelayedexpansion

set /p host="  Indique o site a analisar? "

choice /n /c hs /t 3 /d s /m " Indique o protocolo (h)ttp: ou http(s): ? "
if ERRORLEVEL 1 (set protocol=http://)
if ERRORLEVEL 2 (set protocol=https://)

choice /n /c cefx /t 3 /d c /m "  Indique o seu browser (C)hrome, (E)dge, (F)irefox ? "
if ERRORLEVEL 1 (set browser=chrome.exe)
if ERRORLEVEL 2 (set browser=msedge.exe)
if ERRORLEVEL 3 (set browser=firefox.exe)

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

choice /n /c cx /m " (C)ontinue or e(X)it ? "
if ERRORLEVEL 2 goto :end

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

start %browser% -new-tab -%private% "https://website.grader.com/results/%url%"
timeout /t 2 >nul

:end
set (browser=)
endlocal
