REM make sure you add 
REM C:\Program Files (x86)\Apache Software Foundation\Apache2.2\bin
REM to your path so ab.exe can be found
REM make sure you run as Administrator for IISRESET to work

REM If you want to test self-hosted Web API uncomment the last
REM tests below and make sure to start SELFHOST.EXE from the
REM project with the same name's BIN\RELEASE folder.

del *.txt
del AbParseResults.*


SET CHARGE=1000

REM Warm up

REM HELIOS 

IISRESET
ab.exe -n20 http://localhost/HeliosSample/
ab.exe -n40000 -c%CHARGE% http://localhost/HeliosSample/ > Helios.txt

IISRESET
ab.exe -n20 http://localhost/HeliosSample/test/person/ 
ab.exe -n40000 -c%CHARGE% http://localhost/HeliosSample/test/person/ > HeliosWebApiJson.txt

REM *** IMPORTANT:
REM In order to run these run SelfHost.exe from the SelfHost project first
ab.exe -n20 http://localhost:9000/
ab.exe -n40000 -c%CHARGE% http://localhost:9000/ > SelfHost.txt

ab.exe -n20 http://localhost:9000/test/HelloWorldJson/ 
ab.exe -n40000 -c%CHARGE% http://localhost:9000/test/HelloWorldJson/ > SelfHostJson.txt 

REM RUN StartNode as admin

ab.exe -n20 http://localhost:8081/api/HelloWorldCode/ 
ab.exe -n40000 -c%CHARGE% http://localhost:8081/api/HelloWorldCode/ > NodeCsWebApiStringResult.txt

ab.exe -n20 http://localhost:8081/api/helloworldjson/ 
ab.exe -n40000 -c%CHARGE%  > NodeCswebapijsonTypedResult.txt 

ab.exe -n20 http://localhost:8081/api/HelloWorldJsonCreateResponse/ 
ab.exe -n40000 -c%CHARGE% http://localhost:8081/api/HelloWorldJsonCreateResponse/ > NodeCsWebApiJsonHttpCreateResponse.txt 

ab.exe -n20 http://localhost:8081/api/HelloWorldJsonManualResponse/ 
ab.exe -n40000 -c%CHARGE% http://localhost:8081/api/HelloWorldJsonManualResponse/ > NodeCsWebApiJsonManualResponse.txt 

ab.exe -n20  http://localhost:8081/MvcPerformance/HelloWorldCode/
ab.exe -n40000 -c%CHARGE% http://localhost:8081/MvcPerformance/HelloWorldCode/ > NodeCsMvc.txt

ab.exe -n20 http://localhost:8081/MvcPerformance/HelloWorldJson
ab.exe -n40000 -c%CHARGE% http://localhost:8081/MvcPerformance/HelloWorldJson > NodeCsMvcJson.txt

REM ASPNET 

IISRESET
ab.exe -n20 http://localhost/aspnetperf/api/HelloWorldCode/ 
ab.exe -n40000 -c%CHARGE% http://localhost/aspnetperf/api/HelloWorldCode/ > WebApiStringResult.txt

iisreset 
ab.exe -n20 http://localhost/aspnetperf/api/helloworldjson/ 
ab.exe -n40000 -c%CHARGE% http://localhost/aspnetperf/api/helloworldjson/ > webapijsonTypedResult.txt 

iisreset 
ab.exe -n20 http://localhost/aspnetperf/api/HelloWorldJsonCreateResponse/ 
ab.exe -n40000 -c%CHARGE% http://localhost/aspnetperf/api/HelloWorldJsonCreateResponse/ > WebApiJsonHttpCreateResponse.txt 

iisreset 
ab.exe -n20 http://localhost/aspnetperf/api/HelloWorldJsonManualResponse/ 
ab.exe -n40000 -c%CHARGE% http://localhost/aspnetperf/api/HelloWorldJsonManualResponse/ > WebApiJsonManualResponse.txt 

IISRESET
ab.exe -n20  http://localhost/aspnetperf/handler.ashx 
ab.exe -n40000 -c%CHARGE% http://localhost/aspnetperf/handler.ashx > HttpHandler.txt

IISRESET
ab.exe -n20  http://localhost/aspnetperf/Handler.ashx?action=json
ab.exe -n40000 -c%CHARGE% http://localhost/aspnetperf/Handler.ashx?action=json > HandlerJson.txt

IISRESET
ab.exe -n20  http://localhost/aspnetperf/MvcPerformance/HelloWorldCode/
ab.exe -n40000 -c%CHARGE% http://localhost/aspnetperf/MvcPerformance/HelloWorldCode/ > Mvc.txt

IISRESET
ab.exe -n20 http://localhost/aspnetperf/MvcPerformance/HelloWorldJson
ab.exe -n40000 -c%CHARGE% http://localhost/aspnetperf/MvcPerformance/HelloWorldJson > MvcJson.txt




abParse -i"*.txt" -o"AbParseResults.html" -m"html"
abParse -i"*.txt" -o"AbParseResults.csv" -m"csv"
abParse -i"*.txt" -o"AbParseResults.xml" -m"xml"

abparseresults.html