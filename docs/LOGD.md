# LOGD - Debug Log

| Field | Details |
|---|---|
| Date | 2026-11-09 |
| Symptom | The Vegetable Pizza card and detail screen showed a salad bowl, and the Cheese Pizza card showed cheese wheels instead of pizzas. |
| Cause | The stock photos were chosen by file name without checking what they showed. The asset paths were correct, so the app and all widget tests still passed. Tests check text and navigation, not image content. |
| Fix | Replaced assets/images/vegetable.jpg and assets/images/cheese.jpg with actual pizza photos, keeping the same file names. No code change was needed. |
| Evidence | Commit a246c86 "fix: replace mismatched vegetable and cheese pizza images"; before and after screenshots in the submission PDF; flutter test still passes (6 tests). |
| Lesson | Passing tests do not prove the UI looks right. Review the running app visually as well. |
