
Function Search-StringInPSFiles {
    Param (
        [String]$RootDirectory,
        [String]$String,
        [String]$Exclude
    )

    $AllFiles = Get-Childitem $RootDirectory -Recurse -File -Include *.ps1

    $result = ForEach ($file in $AllFiles) {
        $global:i = 0
        $content = Get-Content $file.Fullname
        $content = $content | Select @{Label="Line"; Expression={$global:i++;$global:i}}, @{Label="Content";Expression={$_}}
    
        $filter = $content |? {$_.Content -like $String}
        if ($filter -ne $null) {
            ForEach ($item in $filter) {
                [PSCustomObject]@{
                    Fullname = $file.Fullname
                    Text = $item.Content
                    Line = $item.line
                }
            }
        } else {
        }
    }

     $result |? {$_.Fullname -notlike $Exclude}
}

#Examples
#Search-StringInPSFiles -RootDirectory C:\ -String "*MySpecialFunction*" -Exclude '*\Retired\*'

#Search-StringInPSFiles -RootDirectory C:\ -String "*ThisFileInMyScript.ps1*" -Exclude '*\Retired\*'
