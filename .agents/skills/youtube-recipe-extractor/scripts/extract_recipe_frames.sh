#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <youtube-url> <output-directory>" >&2
  exit 64
fi

url="$1"
output_dir="$2"

for dependency in yt-dlp ffmpeg tesseract; do
  command -v "$dependency" >/dev/null || {
    echo "Missing dependency: $dependency" >&2
    exit 69
  }
done

mkdir -p "$output_dir/frames"

"$(dirname "$0")/download_youtube_video.sh" "$url" "$output_dir"

video="$(find "$output_dir" -maxdepth 1 -type f \( -name '*.mp4' -o -name '*.mkv' -o -name '*.webm' \) -print -quit)"
if [[ -z "$video" ]]; then
  echo "Downloaded video file not found." >&2
  exit 1
fi

ffmpeg -hide_banner -loglevel error -i "$video" \
  -vf 'fps=1,scale=1280:-2' -q:v 2 "$output_dir/frames/%06d.jpg"

find "$output_dir/frames" -name '*.jpg' -print0 | \
  xargs -0 -n 1 -P 8 sh -c \
  'tesseract "$1" "${1%.jpg}" -l eng --psm 6 >/dev/null 2>&1 || true' sh

{
  printf 'Video: %s\n' "$video"
  while IFS= read -r text_file; do
    printf '\n===== %s =====\n' "${text_file##*/}"
    cat "$text_file"
  done < <(find "$output_dir/frames" -name '*.txt' | sort)
} > "$output_dir/ocr.txt"

printf 'Video: %s\nFrames: %s\nOCR: %s\n' "$video" "$output_dir/frames" "$output_dir/ocr.txt"
