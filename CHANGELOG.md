# Changelog

Every entry says whether it is a fix, a feature or a breaking change, since that is
what decides both whether a reader can take it and what the next version number is.

## [1.0.0] - 2026-08-14

- **Feature.** `:author` resolves to `:account`, beside `:avatar` and `:profile`: the
  person behind a byline is drawn as a person. 304 names now resolve, 135 of them
  aliases.
- The API — `fetch`, `[]`, `icons`, `names`, `actions` — is unchanged and now stable,
  which is what the major version says.

## [0.1.1] - 2026-08-09

- **Fix.** `:franchise` resolves to `:building` rather than `:shop`, and `:market` to
  `:shop` rather than `:map`: a franchise is the organization, a market is the place
  that sells.
- **Fix.** All 126 SF Symbols the table draws are vendored as SVG rather than as a
  20-pixel PNG, so they stay sharp at any size and take the color around them. The
  127th, `receipt`, has no artwork: this macOS cannot draw it, so the table shows the
  dashed circle it shows for any symbol newer than the system.

## [0.1.0] - 2026-08-05

- **Feature.** One concept, three icon names. `Unicon.fetch :house` — or `Unicon[:house]`
  — answers `{ bootstrap: 'house', ios: 'house', android: 'home' }`: symbol keys, frozen
  string names. An app says what it means once and the web page, the iOS client and the
  Android client each draw it from the set they already ship. A name nothing is known by
  answers the circle rather than nil, so a caller that renders whatever it is handed
  cannot draw a blank.
- **Feature.** 169 concepts, listed only where Bootstrap Icons, SF Symbols and Material
  Symbols all have a sensible icon, and 134 model names — `:user`, `:invoice`, `:zip` —
  resolving to the concept they borrow from.
- **Feature.** Three lists to ask for. `Unicon.icons` is the 127 distinct pictures, one
  name each, for offering somebody a choice. `Unicon.names` is all 303 names that
  resolve, for checking a name against. `Unicon.actions` is the 42 doing words —
  `close`, `pencil`, every chevron — which a toolbar draws and no picker should offer.
- **Feature.** `rake validate` checks all 909 names against the list each design system
  publishes, vendored under `data/`, and the default `rake` task runs it. An invented
  name renders as an empty box in an app and passes every other kind of test, so this is
  the check the gem exists for.
