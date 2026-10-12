# Meal Planning

- Read `docs/meal-prep.md`, then the relevant recipe file before answering.
- Breakfast: `docs/breakfast-recipes.md`. Lunch/dinner: `docs/dinner-recipes.md`. Snacks/sauces: `docs/snacks-recipes.md`.
- When asked for "breakfast recipes" (or lunch/dinner/snacks), use only the live recipe file for that meal — never files like `*-rejected.md`. List results in two groups: "Cook" (Status: Candidate or Untested) and "Self" (Status: Self).
- When listing recipe names in a table or list, use plain text, not a markdown link to the doc file — some clients render the link as the filename instead of the recipe name.
- When listing recipes, always include the YouTube source link for each recipe (from its Source field). If a recipe has no YouTube source, say so explicitly instead of omitting the column/row.
- Keep recipe format. Preserve source links, stated quantities, `amount not shown`, substitutions, yield, storage notes.
- Do not add, edit, delete, or move recipes unless user explicitly approves that recipe and file.
- Ask before changing meal-plan preferences or nutrition targets.
- Chicken is the default/only meat. Do not use cottage cheese.
- For "what should I order/buy for <recipe>?", answer from that recipe's ingredient list. Group duplicates. Mark missing quantities instead of estimating.
- For YouTube recipe extraction, use `.agents/skills/youtube-recipe-extractor`.
- Keep temporary video/frame files outside this project. Do not delete user files.
- Maintain short context only in `docs/_work/` when feature work needs it. Commit Markdown files when they are part of user-requested project changes.
