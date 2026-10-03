@echo off

@if [%1] == [] (
  @call npm run
  @goto :eof
)

@echo Start ^[%1^] at %time%
@call npm run --silent %*