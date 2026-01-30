@echo off
echo ============================================
echo   EVENTOPIA DATABASE SETUP
echo ============================================
echo.
echo Step 1: Checking MySQL...
"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" --version
if errorlevel 1 (
    echo ? MySQL command failed
    goto :error
)
echo.
echo Step 2: Creating Eventopia database...
echo Please enter your MySQL root password when prompted...
echo.
"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -u root -p -e "CREATE DATABASE IF NOT EXISTS eventopia_db; USE eventopia_db; SELECT 'Database ready!' as message;"
if errorlevel 1 goto :error
echo.
echo ============================================
echo ? DATABASE SETUP COMPLETED!
echo ============================================
echo.
echo Next: Update your MySQL password in backend/application.properties
echo Then run: cd backend && .\mvnw.cmd spring-boot:run
pause
exit /b 0
:error
echo.
echo ? Setup failed!
echo.
echo Check:
echo 1. MySQL service is running (run as Admin: net start MySQL80)
echo 2. MySQL password is correct
echo 3. MySQL is installed at C:\Program Files\MySQL\MySQL Server 8.0\
echo.
pause
exit /b 1
