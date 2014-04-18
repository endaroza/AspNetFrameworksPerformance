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

REM *** IMPORTANT:
REM In order to run these run StartNode from this dir as Administrator first

ab.exe -n20 http://localhost:8081/api/HelloWorldCode/ 
ab.exe -n40000 -c%CHARGE% http://localhost:8081/api/HelloWorldCode/ > NodeCsWebApiStringResult.txt

ab.exe -n20 http://localhost:8081/api/helloworldjson/ 
ab.exe -n40000 -c%CHARGE% http://localhost:8081/api/helloworldjson/ > NodeCswebapijsonTypedResult.txt 

ab.exe -n20 http://localhost:8081/api/HelloWorldJsonCreateResponse/ 
ab.exe -n40000 -c%CHARGE% http://localhost:8081/api/HelloWorldJsonCreateResponse/ > NodeCsWebApiJsonHttpCreateResponse.txt 

ab.exe -n20 http://localhost:8081/api/HelloWorldJsonManualResponse/ 
ab.exe -n40000 -c%CHARGE% http://localhost:8081/api/HelloWorldJsonManualResponse/ > NodeCsWebApiJsonManualResponse.txt 

ab.exe -n20 -c%CHARGE% http://localhost:8081/MvcPerformance/HelloWorldCode/
ab.exe -n40000 -c%CHARGE% http://localhost:8081/MvcPerformance/HelloWorldCode/ > NodeCsMvc.txt

ab.exe -n20 http://localhost:8081/MvcPerformance/HelloWorldJson
ab.exe -n40000 -c%CHARGE% http://localhost:8081/MvcPerformance/HelloWorldJson > NodeCsMvcJson.txt

abParse -i"*.txt" -o"AbParseResults.html" -m"html"
abParse -i"*.txt" -o"AbParseResults.csv" -m"csv"
abParse -i"*.txt" -o"AbParseResults.xml" -m"xml"

abparseresults.html