@echo off
@if [%1] == [86] (
	@call "C:\sdk\msbuild\2019\BuildTools\VC\Auxiliary\Build\vcvarsamd64_x86.bat"
	@goto :eof
)

@if [%1] == [64] (
	@call "C:\sdk\msbuild\2019\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
	@goto :eof
)


@if [%1] == [8686] (
	@call "C:\sdk\msbuild\2019\BuildTools\VC\Auxiliary\Build\vcvars32.bat"
	@goto :eof
)

@if [%1] == [8664] (
	@call "C:\sdk\msbuild\2019\BuildTools\VC\Auxiliary\Build\vcvarsx86_amd64.bat"
	@goto :eof
)


@if [%1] == [^?] (
	@goto :help
)

@if [%1] == [^/^?] (
	@goto :help
)

@if [%1] == [-^?] (
	@goto :help
)

@if /i [%1] == [help] (
	@goto :help
)
@if /i [%1] == [--help] (
	@goto :help
)
@if /i [%1] == [-h] (
	@goto :help
)


@call "C:\sdk\msbuild\2019\BuildTools\VC\Auxiliary\Build\vcvarsamd64_x86.bat"
@goto :eof

:help
@echo:
@echo MSBuild Companion Util
@echo:
@echo msb 86     prepare environment to buld 32-bit apps
@echo msb 64     prepare environment to buld 64-bit apps
@echo msb 8686   prepare environment to buld 32-bit apps (on 32-bit compiler)
@echo msb 8664   prepare environment to buld 32-bit apps (on 32-bit compiler)
@echo:
@echo msb ?      show this info
@goto :eof