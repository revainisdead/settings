@echo off

REM ** Windows equivalent of .bashrc
REM ** Run this command in windows: `cmd /K C:\destination\alias.cmd`

REM List of all aliases, mirror alias command on linux.
doskey alias=doskey /MACROS

REM QoL
doskey gs=git status
doskey gd=git diff
doskey gb=git branch
doskey gba=git branch -a
doskey gl=git log

doskey apacheconf=cd /d C:\Apache24\conf

doskey binh=cd /d C:\Users\Christian\Documents\binh
doskey cards=cd /d C:\Users\Christian\Documents\binh\House-of-Cards
doskey tcards=cd /d C:\Users\Christian\Documents\binh\xprt_E_checking\

doskey plotter=cd /d Z:\CA-CIE-Tools-TestRepos\ca-plot-scripts-christian

doskey gtp=cd /d C:\Users\christian\Documents\binh\gtpaper-env\gtpaper

REM install was being robbed by vim (install.exe), alternative to adding to path.
REM Highly preferred, lower path size.
doskey vim="C:\Program Files (x86)\Vim\vim80\vim.exe" "$*"

REM Activate gtpaper virtual environment
doskey gtpact=C:\Users\Christian\Documents\binh\gtpaper-env\gtpaper\scripts\win_act.bat
