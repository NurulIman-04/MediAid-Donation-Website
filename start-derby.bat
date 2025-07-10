@echo off
echo Starting Apache Derby Database Server...
echo.
echo This script will start the Derby database server for MediAid.
echo The server will run on localhost:1527
echo.
echo Press Ctrl+C to stop the server when you're done.
echo.

REM Check if Java is installed
java -version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Java is not installed or not in PATH
    echo Please install Java Development Kit (JDK) first
    pause
    exit /b 1
)

REM Start Derby server
echo Starting Derby server...
java -jar derbyrun.jar server start

echo.
echo Derby server has been stopped.
pause 