# eeagle.ai Engineering Rules

These rules apply to every change in this repository.

## Architecture

- Follow `UI -> Bloc -> UseCase -> abstract Repository -> Repository Impl -> API/SDK`.
- REST, WebSocket, Firebase, storage access, and DTO/domain mapping belong in `lib/src/data/`.
- Repository contracts belong in `lib/src/domain/repository/`.
- Business actions belong in dedicated use cases in `lib/src/domain/use_case/`.
- Blocs belong in `lib/src/presentation/<feature>/bloc/` and depend on use cases or domain repository contracts only when an existing feature has not yet introduced a use-case wrapper.
- Screens provide injected Blocs, handle navigation, and compose feature widgets.
- Feature UI components belong in `lib/src/presentation/<feature>/widgets/`.
- Do not put JSON parsing, API response handling, or data-source logic in UI code.
- Use meaningful names; avoid vague names such as `x`, `y`, `z`, or `a`.

## UI Purity

- Screens and widgets read Bloc state, dispatch events, render UI, and navigate.
- The only DI call allowed in UI is `BlocProvider(create: (_) => di<MyBloc>())`.
- Business validation, filtering, sorting, grouping, and domain transformations belong outside widgets.
- Route inputs arrive through constructors or typed route arguments, never by parsing `ModalRoute.of(context)`.
- Small view-only state such as a selected tab, controller, focus node, or animation may remain local to a widget.
- Keep displayed values ready to render in state or domain models.

## Project UI Components

- Inspect `lib/src/presentation/ui/` and nearby feature widgets before creating UI.
- Prefer `EeagleText`, `EeaglePrimaryButton`, `EeagleTextField`, `EeagleTheme`, shared loaders, backgrounds, sheets, and controls over duplicate raw widgets.
- Use the existing dark eeagle visual language, spacing, typography, and interaction patterns.
- Extend a shared component only when the behavior is useful across features.
- Keep layouts responsive and verify that long website names, URLs, labels, and buttons do not overflow on narrow phones.

## Dependency Injection

- Register repositories, use cases, services, and Blocs in `lib/src/di/register_module.dart`.
- Repositories/services use singleton registration when shared; Blocs use factory registration.
- Never manually instantiate app dependencies in UI.
- After DI registration changes, run `dart run build_runner build`.

## Freezed And Models

- Bloc events and states use Freezed in separate `*_event.dart` and `*_state.dart` files.
- API DTOs belong in `lib/src/data/models/` and should use Freezed/JSON generation when their shape is stable or shared.
- Domain models do not contain JSON parsing.
- Prefer const constructors, required fields, `@Default`, immutable state, and `TaskEither<OperationFailure, Result>` for repository operations.

## User-Facing Text

- Reuse existing wording and keep copy short and clear.
- When localization support is introduced, move all visible strings to ARB files and use generated localizations. Until then, keep feature copy centralized in its feature widgets and avoid constructing sentences from fragments.

## Verification

- Run formatting, analysis, and relevant tests after implementation.
- Add tests for behavior changes and API mapping when practical.
- Do not revert or overwrite unrelated user changes.
