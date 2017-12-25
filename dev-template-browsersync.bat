@echo off
rem --------------------
rem | File name  : dev-template-browsersync.bat
rem | Author     : yama-dev - https://github.com/yama-dev
rem | Repository : yama-dev - https://github.com/yama-dev/dev-template-browsersync
rem --------------------

echo dev-template-browsersync.bat
echo ====================
echo Starting the server ...


rem --------------------
rem | Set config.
rem --------------------
set WATCH_FILES="**/*.html,**/*.css,**/*.js"
set PROXY_URL=""


rem --------------------
rem | Check if nodejs is installed.
rem --------------------

where node > nul 2>&1

if %ERRORLEVEL% NEQ 0 goto FAILURE

:SUCCESS
echo ====================
echo STATUS:SUCCESS
echo   nodejs installed
node --version
echo ====================
goto CHECK_NODEJS_END

:FAILURE
echo ====================
echo STATUS:ERROR
echo   nodejs���C���X�g�[������Ă��܂���B
echo;
echo nodejs���C���X�g�[�����Ă��������B
echo ������
echo �ynodejs�z
echo   https://nodejs.org/en/
echo;
echo �ynodist�z
echo   https://github.com/marcelklehr/nodist/releases
echo   ��Windows�̏ꍇ�́unodist�v�𗘗p����ƃo�[�W�����Ǘ����ȒP�ł��B
echo ====================
cmd /k

:CHECK_NODEJS_END


rem --------------------
rem | Check if browser-sync is installed.
rem --------------------

where browser-sync > nul 2>&1

if %ERRORLEVEL% NEQ 0 goto FAILURE

:SUCCESS
echo STATUS:SUCCESS
echo   browser-sync installed
echo ====================
goto BOOT_SERVER

:FAILURE
echo STATUS:ERROR
echo   browser-sync���C���X�g�[������Ă��܂���B
echo ====================
goto INSTALL_BROWSERSYNC

:INSTALL_BROWSERSYNC
set /p answer="browser-sync�̃C���X�g�[�����J�n���܂���(y/n)�H  : %answer%"
if "%answer%"=="y" (
  echo start browser-sync install...
  npm install -g browser-sync
  goto BOOT_SERVER
) else if "%answer%"=="n" ( 
  echo �L�����Z�����܂����B
  echo ====================
  goto END
) else (
  echo �L�����Z�����܂����B
  echo ====================
  goto END
)

:END
cmd /k

:BOOT_SERVER
  echo BOOT_SERVER
  echo ====================
  rem browser-sync start --proxy %PROXY_URL% --files %WATCH_FILES%
  browser-sync start --server --files %WATCH_FILES%
