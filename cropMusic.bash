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
"00:05:52|00:08:52|Sunshine In My Steps.mp3"
"00:08:53|00:11:36|Lighthearted Morning.mp3"
"00:11:37|00:14:26|Gentle Start Glow.mp3"
"00:14:27|00:17:23|Walking On Soft Light.mp3"
"00:17:24|00:20:13|Clear Sky Feeling.mp3"
"00:20:14|00:23:17|Soft Breeze Smile.mp3"
"00:23:18|00:26:14|Golden Hour Energy.mp3"
"00:26:15|00:28:48|Fresh Start Harmony.mp3"
"00:28:49|00:31:40|Morning Color Waves.mp3"
"00:31:41|00:36:45|Shining Steps Ahead.mp3"
)

for cut in "${cuts[@]}"; do
  IFS="|" read -r START END NAME <<< "$cut"
  ffmpeg -loglevel error -i "$INPUT" -ss "$START" -to "$END" -c copy "$OUTPUT_DIR/$NAME"
  echo "✔ $NAME selesai"
done

echo "Semua selesai, cek di: $OUTPUT_DIR"