My Sublime text 3 (Windows) settings. 
Steps:
* Install package control plugin using the instruction from https://packagecontrol.io/.
* Copy the contents of `User\` directory into `c:\sublime\Data\Packages\User\` (for portable version). Note that you do NOT want to sync `Packages/` ad `Installed Packages/` folders, as their contents may depend on OS.
* Start sublime. The packages will be installed automatically based on `Package Control.sublime-settings`. 
* Using ResourceViewer package, comment out the following lines of `nodejs.sublime-build`: 
```
  ...
  // "windows":
  //   {
  //   	"cmd": ["taskkill /F /IM node.exe & node", "$file"]
  //   },
  ...
```