#!/bin/sh

case $(file --mime-type "$@" -bL) in
   text/* | application/json | application/xml | application/x-shellscript | application/javascript )
      # Open text files, scripts, JSON, and XML directly with nvim
      nvim "$@"
      ;;
   video/* | audio/* | image/gif)
      # Launch videos, audios, and GIFs with mpv
      mpv --force-window=immediate "$@"
      ;;
   image/jpeg | image/png | image/jpg | image/webp | image/tiff | image/svg+xml)
      # Open all images in the current directory with nsxiv
      # Prioritize the selected file
      selected_file="$@"
      other_files=$(ls -p | grep -E "\.(jpg|jpeg|png|gif|webp|tiff|svg)$" | grep -v "^$(basename "$selected_file")$")
      nsxiv -qb "$selected_file" $other_files 
      ;;
   application/pdf | application/postscript)
      # Open PDFs and PostScript files with zathura
      zathura "$@"
      ;;
   *) # For all other file types, use mimeopen
      mimeopen "$@" ;;
esac
