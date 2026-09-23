---
name: youtube-recipe-extractor
description: Extract a recipe from a YouTube video, verify on-screen ingredient text, and answer what to buy for that recipe using this meal-planning project.
---

# YouTube Recipe Extractor

Extract recipe facts. Keep shared meal docs trustworthy.

## Before extraction

1. Read `AGENTS.md`.
2. Search `docs/breakfast-recipes.md`, `docs/dinner-recipes.md`, and `docs/snacks-recipes.md` for the recipe/video first. Reuse verified facts; do not re-extract without need.
3. Ask for a destination before saving a new recipe. Never modify a recipe file without explicit approval.

## Extract

1. Check for `yt-dlp`, `ffmpeg`, `tesseract`.
2. Create a scoped temporary directory outside this project.
3. Run `scripts/extract_recipe_frames.sh <youtube-url> <output-directory>`. It retries Chrome, then Brave cookies after a failed download.
4. Search `ocr.txt` for ingredient labels, units, quantities, timings, yield, macros.
5. Visually inspect every ingredient frame. OCR is a lead, never proof. Re-sample blurred/missed text; do not infer amounts from utensils.
6. Keep video facts separate from adaptations. State `amount not shown` where the video omits a quantity.

## Output

- Title, source URL, yield/macros only when stated.
- Ingredients grouped by recipe component; exact quantity/unit.
- Method in video order.
- `amount not shown` list.
- State that on-screen text was visually verified.

## Shopping questions

For "what to order/buy for <recipe>?":

1. Use the saved recipe's ingredient list, or the newly verified extraction.
2. Return ingredients only: grouped duplicates, with stated quantities.
3. Mark unknown quantities. Never estimate package sizes, cost, brands, substitutions, or stock.
4. Keep recipe-specific items separate from assumed pantry basics when the recipe identifies them.

## Failure

- Missing dependency: state which one.
- Download blocked/HTTP 403: `scripts/download_youtube_video.sh` retries Chrome, then Brave once. Keep URL, format, and output path unchanged. Do not retry other browsers or loop.
- No readable on-screen recipe text: use captions/transcript only if available; say quantities were not visually verified.
- Multiple recipes: split them. Never merge ingredient lists.
