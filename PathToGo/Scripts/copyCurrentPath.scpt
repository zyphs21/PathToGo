tell application "Finder"
    set selected to the selection
    if (count of selected) is greater than 1 then
        set theList to ""
        repeat with p in selected
            set theList to theList & POSIX path of (p as text) & return
        end repeat

        set currentPath to theList
        return currentPath

    else if (count of selected) is equal to 1 then
        set currentPath to POSIX path of (selected as text)
        return currentPath

    else
        set currentPath to POSIX path of (target of window 1 as alias)
        return currentPath
    end if
end tell
