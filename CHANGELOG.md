# Changelog

Every entry says whether it is a fix, a feature or a breaking change, since that is
what decides both whether a reader can take it and what the next version number is.

## [Unreleased]

## [3.5.0] - 2026-08-21

- **Feature.** `:inquiry` borrows the wand, beside the `:reading` and `:prediction`
  already drawn by it. A question put to a fortune teller and the answer she gives are
  the same sitting under two names, and an app that lists both wants one picture for
  them. 315 names now resolve, 140 of them aliases.

## [3.4.0] - 2026-08-20

- **Feature.** `:wand` is the wand throwing off stars, the nearest thing the three sets
  publish to a crystal ball: none of them draws one, so a fortune teller's trade borrows
  the magic instead. Bootstrap calls it `magic`, SF Symbols `wand.and.stars`, Material
  `wand_stars` — one picture under three spellings, which is the whole reason this gem
  exists. `:reading` and `:prediction` borrow it, naming what the sitting produces rather
  than who produces it. 314 names now resolve, 139 of them aliases.

## [3.3.0] - 2026-08-19

- **Feature.** `:checklist` is the list with ticks, the picture a warehouse pick list
  wants and one `:clipboard` cannot stand in for: the clipboard is empty paperwork in all
  three sets. `:pick` borrows it, beside the `:inventory`, `:shipment` and `:delivery` a
  warehouse already looks up. iOS is `checklist.checked` rather than the plain
  `checklist`, which `:task` has drawn since the first release — two concepts may not
  draw the same picture, and the ticked box is the truer half of the pair anyway.
- **Feature.** `:boost` borrows the bolt. Promotion is a jolt of electricity in all three
  sets and a rocket in only two, SF Symbols publishing none, so the rocket the word wants
  is a concept this gem cannot list. 311 names now resolve, 137 of them aliases.

## [3.2.0] - 2026-08-19

- **Feature.** `:drag` is the grip a row is taken hold of by, which every list that a
  reader puts in order by hand needs and none of the three sets spells alike:
  Bootstrap draws `grip-vertical`, SF Symbols reaches for `line.3.horizontal` — the
  bars iOS has used for a reorder grabber since the first table view — and Material
  names the dots `drag_indicator`. It sits beside `:sort` under editing, since both
  are ways of putting rows in an order and only the hand differs. 308 names now
  resolve.

## [3.1.0] - 2026-08-19

- **Feature.** `:bookmarked` is the state beside `:bookmark`'s action, so a list can
  draw a row somebody has kept apart from one they have not. A variant axis would have
  made all 171 concepts answer whether they fill; two concepts answer only for
  themselves. Android names it `bookmark_added` rather than a filled bookmark, Material
  Symbols Outlined having no filled name to give — fill there is a font axis. 307 names
  now resolve, 135 of them aliases.

## [3.0.0] - 2026-08-15

- **Breaking.** `Unicon.actions` is documented as the doing words, but a third of it
  named pictures instead: a caller asking for `:trash` was naming the bin rather than
  the deletion. Thirteen now read as the deed — `plus` is `add`, `minus` `subtract`,
  `check` `confirm`, `pencil` `edit`, `trash` `delete`, `scissors` `cut`, `person_add`
  `add_member`, `person_remove` `remove_member`, `ellipsis` `truncate`, `menu`
  `open_menu`, `sidebar` `toggle_sidebar`, `printer` `print`, and `eye_slash` `hide`.
- **Breaking.** The eight directional names take verbs too, and deliberately different
  ones, so the two pictures stay apart by their names alone. Every chevron is a `move`:
  `chevron_up` is `move_up`, and the same for down, left and right. Every arrow is a
  `point`: `arrow_up` is `point_up`, and the same three again.
- `power` is the one name left in `ACTIONS` that is a thing rather than a deed. It is
  drawn the same whether it turns something on or off, so a verb would assert a
  direction the picture does not.
- Nothing else moved. No alias pointed at a renamed name, so `:export`, `:import`,
  `:sync` and `:subscription` still borrow the download, the upload, the refresh and
  the repeat, and 306 names resolve as before, 135 of them aliases.

## [2.0.0] - 2026-08-15

- **Breaking.** `:brand` and `:franchise` were both `:building` aliases, so a sidebar
  told them apart by nothing. Each now draws its own picture: a brand is its mark —
  `c-circle` / `c.circle` / `copyright` — and a franchise its premises, `building` /
  `building.2` / `corporate_fare`. Anyone reading either name gets new artwork.
- **Feature.** `:sector` resolves to `:pie_chart`: a sector is a slice of the whole.
  306 names now resolve, 135 of them aliases.

## [1.1.0] - 2026-08-14

- **Feature.** `:post` resolves to `:document`, beside `:page` and `:form`: a post is
  a piece of writing. 305 names now resolve, 136 of them aliases.

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
