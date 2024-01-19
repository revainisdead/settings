1. Use `alias.cmd` as a Windows equivalent of `.bashrc`
    - Place `alias.cmd` in a directory (ex. C:\Users\Christian\alias.cmd)
    - Run (Win-R)
    - Run the command `cmd /K C:\bin\alias.cmd`

2. Memory consumed in Task Manager, but no process will claim it in interface (zombies)
    - Download all 5 files from  https://github.com/randomascii/blogstuff/tree/main/FindZombieHandles/prebuilt
    - Tip: Find process, right click and select "Go to service" -> then check the service memory usage
    - Tip: Go to Task Manager Details tab, right click column, "select columns", then click "Handle" column.
    - Solution: End process for not necessary or zombie processes to clean up.

Windows Repair Commands

- Windows checks file integrity and solves it automically if possible.
```
SFC /scannow
```

- No reboot needed if scan now used first.
```
DISM.exe /Online /Cleanup-image /Restorehealth
```

- Acquire new IP address / if original ip conflicted with static ip
```
ipconfig /release
ipconfig /renew
```
