# LOGTEST - Test Run Log

| Date | Test file | Command | Result | Notes |
|---|---|---|---|---|
| 2026-11-09 | test/pizza_store_test.dart | flutter test | 3 passed | Menu lists 3 items; tapping Cheese Pizza opens its detail screen; Back returns to the menu. |
| 2026-11-09 | test/order_summary_test.dart (+ all tests) | flutter test | 6 passed ("All tests passed!") | orderTotal(12.50, 2) = 25.00; summary shows "Total: RM 25.00"; Back button pops to previous screen. |
| 2026-11-09 | Whole project | flutter analyze | No issues found | Run before every commit, together with dart format. |
| 2026-11-09 | CI (GitHub Actions, PR #1) | flutter analyze + flutter test | Passed | Green check on the pull request before merging. |
