#! /bin/bash

# Script to sync 2 aperture libraries on OS X based on rsync
# the destination will match the source and no merging will happen

current_machine=$(hostname -s)

# paths to my libraries
ap_loc="Pictures/Aperture Library.aplibrary/"
local_prefix="/Volumes/Michael/Users/Michael/"
remote_prefix="/Volumes/Michael-1/Users/Michael/"
excls="iPod Photo Cache"

source_dir="$local_prefix$ap_loc"
dest_dir="$remote_prefix$ap_loc"

command="rsync -ahvzP --itemize-changes --progress --delete --exclude=\"$excls\""
rev="$1"
if [rev -eq ""]; then
    echo "Source Directory: $source_dir"
    echo "Destination Directory: $dest_dir"
    $command "$source_dir" "$dest_dir"
else
    echo "Source Directory: $dest_dir"
    echo "Destination Directory: $source_dir"
    $command "$dest_dir" "$source_dir"
fi

