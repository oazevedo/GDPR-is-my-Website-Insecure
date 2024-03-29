@echo off
color 1f
cls
:start

rem ===========================================================
rem developed by Oscar Azevedo
rem oscar.azevedo@aeportugal.pt, oscar.msazevedo@gmail.com
rem run webtools to see if website is insecure
rem modified on: 2024-02-27
rem ===========================================================

setlocal enableextensions
setlocal enabledelayedexpansion

rem defaults
(set browser=brave.exe)
(set protocol=https://)

:menu
title "Is my Website inSecure?"
cls
echo.
echo. ===========================================================
echo.   Is my Website InSecure?                      
echo.                                                         
echo.   1. Test Website                                       
echo.   2.   choose browser (optional)                        
echo.   3.   choose protocol (optional)                       
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
echo.  (c)2024 r1.7 Oscar Azevedo                             
echo. ===========================================================
echo.

echo. ======= Defaults =======
echo. Browser = %browser%
echo. Protocol = %protocol%
echo. Option = 1. Test Website
echo. ========================
echo.

choice /c 123FLX /n /m " Choose an option (1,2,3,F,L,X) ? "
goto Label-%ERRORLEVEL%


:Label-1    Test Website
echo.
set /p site="  What is the website to analyze? "
if [%site%]==[] goto :menu

rem remove the protocol http:// or https:// from the website name
set host=!site:*//=!

rem remove forward slash
if [%host:~-1%]==[/] (set host=!host:~0,-1!)

if [%browser%]==[brave.exe]   (set private=incognito)
if [%browser%]==[chrome.exe]  (set private=incognito)
if [%browser%]==[msedge.exe]  (set private=private)
if [%browser%]==[firefox.exe] (set private=private-window)

rem url = protocol + host
(set url=%protocol%%host%)

for /f "tokens=2,3 delims=." %%a in ("%host%") do set domain=%%a.%%b

@echo.
@echo. protocol = %protocol%
@echo.     site = %host%
@echo.   domain = %domain%
@echo.      url = %url%
@echo.  browser = %browser%
@echo.  private = %private%
@echo.
timeout /t 10

start %browser% -new-window -%private% %url%
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://pentest-tools.com/network-vulnerability-scanning/tcp-port-scanner-online-nmap/"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://www.wpsec.com/"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://sitecheck.sucuri.net/results/%url%"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://haveibeenpwned.com/"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://powerdmarc.com/dkim-record-lookup/"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://domain-checker.valimail.com/dmarc/%domain%"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://www.ssllabs.com/ssltest/analyze.html?d=%url%&hideResults=on&latest"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://securityheaders.com/?followRedirects=on&hide=on&q=%url%"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://csp-evaluator.withgoogle.com/?csp=%url%"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://report-uri.com/"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://observatory.allizom.org/analyze/%host%?third-party=false"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://webcheck.pt/pt/dns/loading.php?domain=%domain%"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://internet.nl/site/%host%/"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://owasp.org/www-project-top-ten/"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://www.immuniweb.com/darkweb/"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://www.immuniweb.com/cloud/"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://www.immuniweb.com/email/"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://www.immuniweb.com/websec/"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://pentest-tools.com/website-vulnerability-scanning/website-scanner"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://www.zaproxy.org/"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://www.tenable.com/products/nessus/nessus-essentials"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://snyk.io/product/snyk-code/"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://cisofy.com/lynis/"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://learn.cisecurity.org/cis-cat-lite"
timeout /t 2 >nul

start %browser% -new-tab -%private% "https://www.ezigdpr.com/products/gdpr-website-compliance-checker"
timeout /t 2 >nul

rem start %browser% -new-tab -%private% "https://batchspeed.com/"
rem timeout /t 2 >nul

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
@echo.
choice /n /c bcefx /m "  Choose the browser: (B)rave, (C)hrome, (E)dge, (F)irefox ? "
if ERRORLEVEL 1 (set browser=brave.exe)
if ERRORLEVEL 2 (set browser=chrome.exe)
if ERRORLEVEL 3 (set browser=msedge.exe)
if ERRORLEVEL 4 (set browser=firefox.exe)
goto :menu


:Label-3    Choose Protocol
@echo.
choice /n /c hs /m " Choose the protocol: (h)ttp: or http(s): ? "
if ERRORLEVEL 1 (set protocol=http://)
if ERRORLEVEL 2 (set protocol=https://)
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
rem @echo.    "https://batchspeed.com/"          metric: 90
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
(set domain=)
(set private=)
(set browser=)
(set protocol=)
endlocal
