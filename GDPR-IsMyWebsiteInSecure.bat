@echo off
color 1f
cls
:start

rem ===========================================================
rem developed by Oscar Azevedo
rem oscar.azevedo@aeportugal.pt, oscar.msazevedo@gmail.com
rem run webtools to see if website is insecure
rem modified on: 2024-05-03
rem ===========================================================

setlocal enableextensions
setlocal enabledelayedexpansion

rem defaults
(set browser=brave.exe)
(set protocol=https)

:menu
title "Is my Website inSecure?"
cls
echo.
echo. ===========================================================
echo.   Is my Website InSecure?                               
echo.                                                         
echo.   1. Test Website - essential tools (default)           
echo.   2. Test Website - all tools                           
echo.                                                         
echo.   3. Choose browser (optional)                          
echo.                                                         
echo.   F. Free Webtools used and Metrics                     
echo.   L. Legal and Privacy Terms                            
echo.   X. Exit                                               
echo.                                                         
echo.   Important: You should only use this tool to analyze   
echo.   websites whose owners have given you permission to do 
echo.   so. In addition, always make a vulnerability analysis 
echo.   (ex. OWASP ZAP). This is a Free Tool.                 
echo.                                                         
echo.  (c)2024 r2.0 Oscar Azevedo                             
echo. ===========================================================
echo.

rem setting browser private mode
if [%browser%]==[brave.exe]   (set private=incognito)
if [%browser%]==[chrome.exe]  (set private=incognito)
if [%browser%]==[msedge.exe]  (set private=private)
if [%browser%]==[firefox.exe] (set private=private-window)

echo. ======= Defaults =========
echo. Browser  = %browser%
echo. Protocol = %protocol%
echo. Option   = 1. Test Website
echo. ==========================
echo.

choice /t 10 /c 123FLX /d 1 /n /m " Choose an option (1,2,3,F,L,X) ? "

(set option=%ERRORLEVEL%)
goto Label-%option%


:Label-1    Test Website, essencial tools
:Label-2    Test Website, all tools
echo.

rem url = scheme + host + port + ..., ex. https://www.aeportugal.com 
rem scheme = https or http
rem host = like www.example.com

rem Prompt for URL
set /p "url=What is the website to analyze? "
if [%url%]==[] goto :menu

rem If url not have scheme add https://
echo %url% | findstr /b /c:"http://" /c:"https://" >nul 2>&1
if %errorlevel% neq 0 set url=https://%url%

rem get scheme, ex. http or https
for /f "delims=: tokens=1" %%i in ("%url%") do set "scheme=%%i"

rem get host, ex. www.aeportugal.com
for /f "delims=/ tokens=2" %%i in ("%url%") do set "host=%%i"

rem get subdomain, if exist
for /f "delims=. tokens=1,2,3" %%i in ("%host%") do (
  rem if not exist subdomain
  if "%%k"=="" (
    set domain=%%i.%%j
    set subdomain=
  ) else (
    set domain=%%j.%%k
    set subdomain=%%i
  )
)

echo.
echo       url: %url%
echo    scheme: %scheme%
echo      host: %host%
echo subdomain: %subdomain%
echo    domain: %domain%
echo   browser: %browser%
echo   private: %private%
echo.

timeout /t -1


start %browser% -new-window -%private% -disable-extensions %url%
timeout /t 2 >nul

if "%option%"=="2" (
start %browser% -new-tab -%private% "https://checkcybersecurity.service.ncsc.gov.uk/ip-check/form"
timeout /t 2 >nul
)

if "%option%"=="2" (
start %browser% -new-tab -%private% "https://checkcybersecurity.service.ncsc.gov.uk/browser-check/form"
timeout /t 2 >nul
)

start %browser% -new-tab -%private% "https://pentest-tools.com/network-vulnerability-scanning/tcp-port-scanner-online-nmap/"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://www.wpsec.com/"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://sitecheck.sucuri.net/results/%host%"
timeout /t 2 >nul

if "%option%"=="2" (
start %browser% -new-tab -%private% "https://haveibeenpwned.com/"
timeout /t 2 >nul
)

start %browser% -new-tab -%private% "https://powerdmarc.com/dkim-record-lookup/"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://domain-checker.valimail.com/dmarc/%domain%"
timeout /t 2 >nul

if "%option%"=="2" (
start %browser% -new-tab -%private% "https://checkcybersecurity.service.ncsc.gov.uk/email-security-check/results?domain=%domain%"
timeout /t 2 >nul
)

start %browser% -new-tab -%private% "https://www.ssllabs.com/ssltest/analyze.html?d=%url%&hideResults=on&latest"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://securityheaders.com/?followRedirects=on&hide=on&q=%url%"
timeout /t 2 >nul

if "%option%"=="2" (
start %browser% -new-tab -%private% "https://csp-evaluator.withgoogle.com/?csp=%url%"
timeout /t 2 >nul
)

start %browser% -new-tab -%private% "https://report-uri.com/"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://observatory.allizom.org/analyze/%host%?third-party=false"
timeout /t 2 >nul

if "%option%"=="2" (
start %browser% -new-tab -%private% "https://webcheck.pt/pt/dns/loading.php?domain=%domain%"
timeout /t 2 >nul
)

start %browser% -new-tab -%private% "https://internet.nl/site/%host%/"
timeout /t 2 >nul

if "%option%"=="2" (
start %browser% -new-tab -%private% "https://owasp.org/www-project-top-ten/"
timeout /t 2 >nul
)

if "%option%"=="2" (
start %browser% -new-tab -%private% "https://www.immuniweb.com/darkweb/"
timeout /t 2 >nul
)

if "%option%"=="2" (
start %browser% -new-tab -%private% "https://www.immuniweb.com/cloud/"
timeout /t 2 >nul
)

if "%option%"=="2" (
start %browser% -new-tab -%private% "https://www.immuniweb.com/email/"
timeout /t 2 >nul
)

start %browser% -new-tab -%private% "https://www.immuniweb.com/websec/"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://pentest-tools.com/website-vulnerability-scanning/website-scanner"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://www.zaproxy.org/"
timeout /t 2 >nul

if "%option%"=="2" (
start %browser% -new-tab -%private% "https://portswigger.net/burp/pro"
timeout /t 2 >nul
)

start %browser% -new-tab -%private% "https://www.tenable.com/products/nessus/nessus-essentials"
timeout /t 2 >nul

if "%option%"=="2" (
start %browser% -new-tab -%private% "https://community.greenbone.net/getting-started/greenbone-community-edition-via-linux-distribution-packages/"
timeout /t 2 >nul
)

start %browser% -new-tab -%private% "https://snyk.io/product/snyk-code/"
timeout /t 2 >nul

if "%option%"=="2" (
start %browser% -new-tab -%private% "https://cisofy.com/lynis/"
timeout /t 2 >nul
)

if "%option%"=="2" (
start %browser% -new-tab -%private% "https://learn.cisecurity.org/cis-cat-lite"
timeout /t 2 >nul
)

start %browser% -new-tab -%private% "https://www.cookiebot.com/en/compliance-test/?domain=%host%"
timeout /t 2 >nul

if "%option%"=="2" (
start %browser% -new-tab -%private% "https://hub.sovy.com/gdpr-scan/?domain=%host%"
timeout /t 2 >nul
)

start %browser% -new-tab -%private% "https://developers.google.com/speed/pagespeed/insights/?url=%url%"
timeout /t 2 >nul

if "%option%"=="2" (
start %browser% -new-tab -%private% "https://gtmetrix.com/?url=%url%"
timeout /t 2 >nul
)

start %browser% -new-tab -%private% "https://validator.w3.org/nu/?showsource=no&doc=%url%/"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://jigsaw.w3.org/css-validator/validator?uri=%url%&profile=css3svg&usermedium=all&warning=1&vextwarning=&lang=en"
timeout /t 2 >nul

goto :end


:Label-3    Choose Browser
@echo.
choice /n /c bcefx /m "  Choose the browser: (B)rave, (C)hrome, (E)dge, (F)irefox ? "
if ERRORLEVEL 1 (set browser=brave.exe)
if ERRORLEVEL 2 (set browser=chrome.exe)
if ERRORLEVEL 3 (set browser=msedge.exe)
if ERRORLEVEL 4 (set browser=firefox.exe)
goto :menu


:Label-4      Free Webtools and Metrics
@echo.
@echo. We use the following free web tools. Our thanks and appreciation to those who develop and maintain.
@echo.
@echo. 1. category:security, target:hosting
@echo.    "https://pentest-tools.com"                  metric: tcp/443
@echo.    "https://www.wpsec.com/"                     metric: no vulnerabilities, no outdated plugins
@echo.    "https://sitecheck.sucuri.net/"              metric: no malware, no outdated software
@echo.    "https://haveibeenpwned.com/"                metric: no email in a data breach
@echo.    "https://domain-checker.valimail.com/dmarc"  metric: dmarc configured
@echo.    "https://www.ssllabs.com/ssltest"            metric: A
@echo.    "https://securityheaders.com/"               metric: security headers configured
@echo.    "https://observatory.allizom.org/"           metric: A
@echo.    "https://webcheck.pt/"                       metric: Cumpre
@echo.    "https://internet.nl/"                       metric: 90
@echo.    "https://pentest-tools.com/website-vulnerability-scanning/website-scanner"  metric: no vulnerabilities
@echo.    "https://www.owasp.org/"                     metric: no vulnerabilities
@echo.    "https://owasp.org/www-project-top-ten/"     metric: n/a
@echo.    "https://www.immuniweb.com/darkweb/"         metric: no Dark Web Exposure
@echo.
@echo. 2. category:GDPR cookies, target:developers
@echo.    "https://www.ezigdpr.com/"         metric: no action required
@echo.
@echo. 3. category:quality, target:developers
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
(set url=)
(set scheme=)
(set host=)
(set subdomain=)
(set domain=)
(set browser=)
(set private=)
(set option=)
endlocal
