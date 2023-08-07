powershell -command "Expand-Archive -Force '*PreCompiledCore.zip' '.'"
cd %~dp0PreCompiledCore\Data\MySQL\bin
start cmd /c "mysqld.exe --defaults-file=my.ini --console"
timeout /t 5
mysqldump -u root -padmin hotfixes > hotfixes.sql
mysqldump -u root -padmin world > world.sql
mysqldump -u root -padmin --no-data --no-create-info --no-create-db --no-set-names --skip-comments --skip-dump-date --skip-opt --triggers characters > characters_trigger.sql
move hotfixes.sql %~dp0
move world.sql %~dp0
move characters_trigger.sql %~dp0
taskkill /F /IM mysqld.exe
cd %~dp0
rmdir /S /Q %~dp0PreCompiledCore
del %~dp0*PreCompiledCOre.zip