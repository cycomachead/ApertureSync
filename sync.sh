#! /bin/bash

# Script to sync 2 aperture libraries on OS X based on rsync
# the destination will match the source and no merging will happen

current_machine=$(hostname -s)

# paths to my libraries
ap_loc="Pictures/Aperture\ Library.aplibrary/"
local_prefix="~/"
remote_prefix="/Volumes/Michael/"
excls="iPod\ Photo\ Cache"
excls="$local_prefix$excles"

source_dir="$local_prefix$ap_loc"
# dest_dir="/Volumes/Michael-1/$ap_loc"
dest_dir="$remote_prefix$ap_loc"

comm="rsync -ahvzP --itemize-changes --progress --delete"

echo "Source Directory: $source_dir"
echo "Destination Directory: $dest_dir"
$comm "$source_dir" "$dest_dir"
# rev="$1"
# if [$rev -eq ""]; then
#     echo "Source Directory: $source_dir"
#     echo "Destination Directory: $dest_dir"
#     $comm "$source_dir" "$dest_dir"
# else
#     echo "Source Directory: $dest_dir"
#     echo "Destination Directory: $source_dir"
#     $comm "$dest_dir" "$source_dir"
# fi

