My Sublime text 3 (Windows) settings. 
Steps:
* Copy the contents of `User\` directory into `c:\sublime\Data\Packages\User\` (for portable version)
* Install packages using https://packagecontrol.io/. For the list of installed packages, refer to `Package Control.sublime-settings`.
* Using ResourceViewer package, comment out the following lines of `nodejs.sublime-build`: 
```
  ...
  // "windows":
  //   {
  //   	"cmd": ["taskkill /F /IM node.exe & node", "$file"]
  //   },
  ...
```