## Quick context (Roll_Dice)

- Tech stack: Flutter (Dart) app. Entry point: `lib/main.dart`.
- UI widgets live in `lib/` (key files: `lib/dice_roller.dart`, `lib/gradient_container.dart`, `lib/styled_text.dart`).
- Static assets: `images/dice-1.png` ... `images/dice-6.png` (referenced as `images/dice-$n.png`).
- Platform folders (`ios/`, `android/`, `web/`, `macos/`, `windows/`, `linux/`) contain platform-specific build artifacts and runners.

## What to prioritize when editing

- Keep all UI logic in `lib/`. `DiceRoller` is a stateful widget that controls the dice state and calls `Random()` in `lib/dice_roller.dart`.
- Assets are referenced directly by path (e.g. `Image.asset('images/dice-$activeDice.png')`) — preserve naming and relative paths when changing images.
- Avoid modifying platform folders unless adjusting native integration (these are treated as vendored/generated).

## Build / test / run (common commands)

- Install deps: `flutter pub get`
- Run on connected device/emulator: `flutter run`
- Run tests: `flutter test` (unit/widget tests in `test/`)

Note: This project is a simple Flutter app; no extra CI steps or special scripts are present.

## Patterns & conventions specific to this repo

- Widget structure: small, single-purpose widgets (e.g. `StyledText` for text appearance). Follow this pattern — prefer small reusable widgets.
- Asset naming: dice images use `dice-<1..6>.png`. Any additional image must follow the same naming if used by `dice_roller.dart`.
- Keep presentation (gradients, styling) in `GradientContainer` and `StyledText` rather than embedding global styles.

## Integration points / gotchas

- The `web/index.html` exists for Flutter web builds; its presence can cause GitHub to report HTML as the repo language. A `.gitattributes` file is included to exclude web and platform files from language metrics.
- Platform directories contain generated/native code — treat as vendor directories. Don't change them unless you are updating native integrations or fixing a platform-specific bug.

## Example edits to follow (concrete)

- Add a new widget: create `lib/widgets/my_widget.dart`, export it from `lib/` and use from `lib/main.dart` or `lib/gradient_container.dart`.
- Add an image asset: place PNG in `images/`, list it in `pubspec.yaml` under `flutter.assets`, then reference with `Image.asset('images/your.png')`.

## When to change repository metadata

- If you add many non-Dart files that should count in language stats, update or remove `.gitattributes` accordingly. Current `.gitattributes` is conservative: it forces `lib/` and `test/` to Dart and marks platform/build/images as vendored.

## Where to look for more context

- `pubspec.yaml` — dependencies and declared assets.
- `lib/` — primary app code (most changes belong here).
- `test/` — example widget test (may be scaffold code).

If anything here is unclear or you want the instructions expanded to cover CI, commit message style, or more examples, tell me which area to expand and I will update this file.
