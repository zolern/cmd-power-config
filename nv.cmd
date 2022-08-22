@echo off
@setlocal

@IF [%1] == [^?] GOTO shownverhelp
@IF [%1] == [^\^?] GOTO shownverhelp
@IF [%1] == [^-^?] GOTO shownverhelp
@IF [%1] == [^/^?] GOTO shownverhelp
@IF [%1] == [^/^?] GOTO shownverhelp
@IF [%1] == [--help] GOTO shownverhelp
@IF [%1] == [^/h] GOTO shownverhelp
@IF [%1] == [-h] GOTO shownverhelp
@IF [%1] == [] goto showver

@set A1=%1
@set FL=%A1:~0,1%

@if [%FL%] == [0] goto :changever
@if [%FL%] == [1] goto :changever
@if [%FL%] == [2] goto :changever
@if [%FL%] == [3] goto :changever
@if [%FL%] == [4] goto :changever
@if [%FL%] == [5] goto :changever
@if [%FL%] == [6] goto :changever
@if [%FL%] == [7] goto :changever
@if [%FL%] == [8] goto :changever
@if [%FL%] == [9] goto :changever

@call n v%1 %2 %3 %4 %5 %6
@goto :eof

:shownverhelp
@call n v ^?
@goto :eof

:showver
@call n v
@goto :eof

:changever
@call n v %1
@goto :eof
