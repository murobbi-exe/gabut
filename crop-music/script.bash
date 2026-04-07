#!/bin/bash

# lokasi File input
INPUT="$HOME/Downloads/Lagu.mp3"

# lokasi output
OUTPUT_DIR="$HOME/Music/Cropped"

if [ ! -f "$INPUT" ]; then
  echo "File tidak ditemukan: $INPUT"
  exit 1
fi

mkdir -p "$OUTPUT_DIR"

# cek file ada atau tidak


cuts=(
"00:00:00|00:03:06|Start With A Smile.mp3"
"00:03:06|00:05:51|Bright Side Melody.mp3"
)

for cut in "${cuts[@]}"; do
  IFS="|" read -r START END NAME <<< "$cut"
  ffmpeg -loglevel error -i "$INPUT" -ss "$START" -to "$END" -c copy "$OUTPUT_DIR/$NAME"
  echo "✔ $NAME selesai"
done

echo "Semua selesai, cek di: $OUTPUT_DIR"