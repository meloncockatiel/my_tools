chcp 65001
%鸟%
@echo off
set "filePath=trans_formula_markdown.txt"
setlocal enabledelayedexpansion

set "search1=\("
set "replace1=$"
set "search2=\)"
set "replace2=$"
set "search3=\["
set "replace3=$"
set "search4=\]"
set "replace4=$"

(for /f "tokens=1* delims=:" %%A in ('findstr /n "^" "%filePath%"') do (
    set "line=%%B"
    if "!line!"=="" (
        echo.
    ) else (
        set "line=!line:%search1%=%replace1%!"
        set "line=!line:%search2%=%replace2%!"
        set "line=!line:%search3%=%replace3%!"
        set "line=!line:%search4%=%replace4%!"
        echo !line!
    )
)) > "%filePath%.tmp"

move /y "%filePath%.tmp" "%filePath%"
echo 替换完成。

start "" "%filePath%"
