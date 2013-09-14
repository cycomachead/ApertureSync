#! /bin/sh

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

rsync -ahvzP --itemize-changes --progress --delete --exclude="$excls" "$dest_dir" "$source_dir"