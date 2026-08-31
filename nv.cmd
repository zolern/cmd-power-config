@echo off
@setlocal

@if [%1] == [] goto showhelp

@IF [%1] == [^?] GOTO showhelp
@IF [%1] == [^\^?] GOTO showhelp
@IF [%1] == [^-^?] GOTO showhelp
@IF [%1] == [^/^?] GOTO showhelp

SET fc=%1
SET fc=%fc:~0,1%

@if [%fc%] == [0] goto :changever
@if [%fc%] == [1] goto :changever
@if [%fc%] == [2] goto :changever
@if [%fc%] == [3] goto :changever
@if [%fc%] == [4] goto :changever
@if [%fc%] == [5] goto :changever
@if [%fc%] == [6] goto :changever
@if [%fc%] == [7] goto :changever
@if [%fc%] == [8] goto :changever
@if [%fc%] == [9] goto :changever

@call n v%*
@goto :endnv

:changever
@call n v %*
@goto :endnv

:showhelp
@call n v ?
@goto :eof

:endnv
@endlocal
@goto :eof
