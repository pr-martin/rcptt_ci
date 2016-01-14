REM !!! Replace the value below with the path to the directory there
REM application under test (AUT) is located.


REM SET AUT=C:\absolute\path\to\your\application\directory
SET AUT=C:\eclipse\osate2-2.1.2-win32.win32.x86_64

REM SET RUNNER=%USERPROFILE%\runner
SET RUNNER=C:\eclipse\rcptt.runner-2.0.1\eclipse

REM SET PROJECT=.
SET PROJECT=.\regressionSuite\rcpttSuite

REM SET AUT_WS=.\osate2_workspace

REM Path to directory with test results, default is C:\Users\User\results
SET RESULTS=%PROJECT%\..\results

REM Remove results dir if present
IF NOT EXIST %RESULTS% GOTO NORESULTS
RMDIR /S /Q %RESULTS%

:NORESULTS
md %RESULTS%

java -jar %RUNNER%/plugins/org.eclipse.equinox.launcher_1.3.100.v20150511-1540.jar ^
 -application org.eclipse.rcptt.runner.headless ^
 -data %RESULTS%/runner-workspace/ ^
 -aut %AUT% ^
 -autWsPrefix C:\jenkins\rcptt_ci\osate2_workspace ^
 -autConsolePrefix %RESULTS%/aut-output ^
 -htmlReport %RESULTS%/report.html ^
 -junitReport %RESULTS%/report.xml ^
 -import %PROJECT% ^
 -reuseExistingWorkspace ^
 -testOptions "testExecTimeout=2700"
 
REM java -jar %RUNNER%/plugins/org.eclipse.equinox.launcher_1.3.100.v20150511-1540.jar ^
REM  -application org.eclipse.rcptt.runner.headless ^
REM  -data %RESULTS%/runner-workspace/ ^
REM  -aut %AUT% ^
REM  -autWsPrefix %RESULTS%/aut-workspace ^
REM  -autConsolePrefix %RESULTS%/aut-output ^
REM  -htmlReport %RESULTS%/report.html ^
REM  -junitReport %RESULTS%/report.xml ^
REM  -import %PROJECT%