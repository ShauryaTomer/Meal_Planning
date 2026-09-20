# Meal Library Structure

## Goal

- Split meal collection by eating occasion.
- Keep preferences and meal-prep rules in one high-level file.

## Files

- `docs/Meal_prep.md`: goals, preferences, nutrition direction, ingredient access, prep system.
- `docs/Breakfast.md`: breakfast recipes only.
- `docs/Lunch_Dinner.md`: lunch and dinner recipes only.
- `docs/research/`: source research and idea lists only.

## Migration

- Move breakfast recipes from `docs/recipes.md` and `docs/meal-prep.md` into `Breakfast.md`.
- Move non-breakfast recipes from `docs/recipes.md` into `Lunch_Dinner.md`.
- Consolidate high-level preferences from work notes and recipe notes into `Meal_prep.md`.
- Preserve recipe status, source, ingredients, method, macros, tags, prep/storage notes.
- Remove replaced documents after migration; update work memory.

## Boundaries

- `Meal_prep.md` does not hold full recipes.
- Meal documents do not repeat global preferences.
- Research documents remain uncurated source notes.
