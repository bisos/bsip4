# ---------------------------------------------------------------------
# Bash Path Management Library
# ---------------------------------------------------------------------
#
# QUICK USAGE CHEAT SHEET:
#   path_append /my/dir            -> Adds /my/dir to the very end of PATH
#   path_prepend /my/dir           -> Adds /my/dir to the very front of PATH
#   path_before /my/dir /usr/bin   -> Places /my/dir right before /usr/bin
#   path_after /my/dir /usr/bin    -> Places /my/dir right after /usr/bin
#   path_remove /my/dir            -> Completely erases /my/dir from PATH
#   path_contains /my/dir          -> Checks if /my/dir is in PATH (True/False status)
#   path_find_duplicates           -> Lists duplicate entries found in PATH
#
# NOTE: 
#   - All modification functions automatically remove older occurrences first to prevent duplicates.
#   - Addition functions check for directory existence before modifying PATH.
#   - Relative functions fall back to prepend/append if the reference is not found.
# ---------------------------------------------------------------------

# 1. Safely removes a directory from PATH
path_remove() {
    local target="$1"
    PATH=":$PATH:"
    PATH="${PATH//:$target:/:}"
    PATH="${PATH#:}"
    PATH="${PATH%:}"
    export PATH
}

# 2. Adds a directory to the END of PATH
path_append() {
    local target="$1"
    if [ -d "$target" ]; then
        path_remove "$target"
        export PATH="$PATH:$target"
    fi
}

# 3. Adds a directory to the START of PATH
path_prepend() {
    local target="$1"
    if [ -d "$target" ]; then
        path_remove "$target"
        export PATH="$target:$PATH"
    fi
}

# 4. Inserts a directory IMMEDIATELY BEFORE a reference directory
path_before() {
    local target="$1"
    local reference="$2"
    
    if [ -d "$target" ]; then
        path_remove "$target"
        if [[ ":$PATH:" == *":$reference:"* ]]; then
            PATH=":$PATH:"
            PATH="${PATH//:$reference:/:$target:$reference:}"
            PATH="${PATH#:}"
            PATH="${PATH%:}"
            export PATH
        else
            path_prepend "$target"
        fi
    fi
}

# 5. Inserts a directory IMMEDIATELY AFTER a reference directory
path_after() {
    local target="$1"
    local reference="$2"
    
    if [ -d "$target" ]; then
        path_remove "$target"
        if [[ ":$PATH:" == *":$reference:"* ]]; then
            PATH=":$PATH:"
            PATH="${PATH//:$reference:/:$reference:$target:}"
            PATH="${PATH#:}"
            PATH="${PATH%:}"
            export PATH
        else
            path_append "$target"
        fi
    fi
}

# 6. Checks if a directory exists in PATH (Returns 0 if true, 1 if false)
path_contains() {
    local target="$1"
    if [[ ":$PATH:" == *":$target:"* ]]; then
        return 0
    else
        return 1
    fi
}

# 7. Finds and prints all duplicate entries currently in PATH
path_find_duplicates() {
    local IFS=':'
    local dir
    local seen=""
    local duplicates=""
    
    for dir in $PATH; do
        # Use substring bounding to safely match directories with spaces or common names
        if [[ ":$seen:" == *":$dir:"* ]]; then
            if [[ ":$duplicates:" != *":$dir:"* ]]; then
                duplicates="$duplicates:$dir"
                echo "Duplicate found: $dir"
            fi
        else
            seen="$seen:$dir"
        fi
    done
    
    # Return failure status if duplicates were found, success if clean
    [ -z "$duplicates" ]
}
