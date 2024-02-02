# SearchPS1File
Have you ever wanted to search PS1 files for a specific phrase, module in use, function, etc? 

Using Search-StringInPSFiles will greatly speed up your ability in large script bodies to quickly process full code cutovers.

**RootDirectory**
    This is the root directory path you want to search. Personally I set this to my project folder path.
    
**String**
    This is the string you are looking for. When you can be line specific or if you are only looking for a function
    or specific line use the "*" on the beginning and end of the string with your text in the middle.

**Exclude Option**
    Provides the ability to exclude searching within specific powershell files. Useful for excluding versioned and retired files.

**Examples**

**Returns all results with "MyScriptFile.ps1" within your powershell scripts within your project folder.**
Search-StringInPSFiles -RootDirectory C:\MyProject\ -String "*MyScriptFile.ps1*"

**Returns all results with "PnP" within your powershell scripts within your project folder. Also excluded any files within the Retired folder.**
Search-StringInPSFiles -RootDirectory C:\MyProject\ -String "*PnP*" -Exclude '*\Retired\*'

**Returns all results with "MyScriptFile.ps1" within your powershell scripts within your project folder. Also excluded any files within the Retired folder.**
Search-StringInPSFiles -RootDirectory C:\MyProject\ -String "*MyScriptFile.ps1*" -Exclude '*\Retired\*'
