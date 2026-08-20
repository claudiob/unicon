# Unicon

One concept, three icon names.

An app knows it wants to draw a house. What a house is *called* depends on who is
drawing it: Bootstrap Icons says `house`, SF Symbols says `house`, Material Symbols
says `home`. Unicon holds that translation, so a Rails app can name the concept once
and let the web page, the iOS client and the Android client each draw it from the set
they already ship.

```ruby
Unicon.fetch :house
# => { bootstrap: 'house', ios: 'house', android: 'home' }

Unicon[:contact]
# => { bootstrap: 'person-rolodex', ios: 'person.crop.circle', android: 'contacts' }
```

`Unicon[]` and `Unicon.fetch` are the same method; `[]` is the shorter spelling.

The keys are symbols and the names are frozen strings: a name is on its way into
`"bi bi-#{icon}"` or into JSON either way, and `person.crop.circle` is a string long
before it is a symbol.

## How to install

To install on your system, run

    gem install unicon

To use inside a bundled Ruby project, add this line to the Gemfile:

    gem 'unicon', '~> 3.0'

Since the gem follows [Semantic Versioning](http://semver.org), indicating `~> *major*.*minor*`
guarantees your project won’t occur in breaking changes whenever you `bundle update`.

## The three keys

Every concept carries exactly three keys, and never fewer:

| Key | Design system | License |
| --- | --- | --- |
| `:bootstrap` | [Bootstrap Icons](https://icons.getbootstrap.com) | MIT |
| `:ios` | [SF Symbols](https://developer.apple.com/sf-symbols/) | Apple, Apple platforms only |
| `:android` | [Material Symbols](https://fonts.google.com/icons) | Apache 2.0 |

The keys are named after the client that draws the icon rather than after the system,
because that is the question a caller is answering. `:ios` always holds an SF Symbols
name and `:android` always holds a Material Symbols name — nothing else is meant by
them.

## Anything unknown draws a circle

```ruby
Unicon.fetch :nothing_by_this_name
# => { bootstrap: 'circle', ios: 'circle', android: 'circle' }
```

A caller rendering whatever it is handed never has to check first, and never draws a
blank. A concept may be given as a string, so `Unicon['contact']` works too.

## Three lists, and which one you want

```ruby
Unicon.icons    # => [:account, :airplane, :alarm, :archive, :award, :badge, ...]    131
Unicon.names    # => [:account, :add, :add_member, :address, :agent, ...]            311
Unicon.actions  # => [:add, :add_member, :close, :confirm, ...]                       43
```

- `Unicon.icons` is **one name per distinct picture**. No two entries draw the same
  thing, which is what makes it the list to show somebody choosing an icon.
- `Unicon.names` is **the union of all three groups** — the icons, the actions and the
  model synonyms — and so every name that resolves. Ask for it to find out whether a
  name draws something; ask for `icons` when somebody is choosing one.
- `Unicon.actions` is **the doing words**: `close`, `edit`, every `move`. A toolbar
  needs them and `Unicon[:close]` answers, but nobody has a Close model, so `icons`
  leaves them out on purpose. Each names the deed rather than the picture of it — `add`
  rather than `plus`, `delete` rather than `trash` — bar `power`, which is drawn the same
  whether it turns something on or off. The four chevrons are `move_up` and its three
  directions, the four arrows `point_up` and its three, so the families stay apart.

All three are frozen, sorted arrays of symbols; only what `fetch` returns is strings.
`Unicon::ICONS`, `Unicon::TABLE` and `Unicon::ACTIONS` are the tables behind them, for a
caller who wants the pictures as well as the names.

## Model names

A host app looks an icon up by the name of the model it is rendering, and the more names
answer, the less any app has to declare. 137 of them borrow the icons of a concept —
`:user` takes the person, `:zip` takes the pin — and the Aliases column of the table below
says which took which. They resolve without swelling the list a picker offers.

Four borrow an action rather than a thing, so they are the four the table cannot show:
`:export` takes the download, `:import` the upload, `:sync` the refresh, `:subscription`
the repeat. Each still answers to `Unicon[]` like any other name.

## Every concept

A concept is listed only when all three systems have a sensible icon for it. Where one
of the three has none, the concept is left out rather than filled in with something
close — an agent is a badge rather than a robot here, because Bootstrap and Material
both draw a robot and SF Symbols has none.

The SF Symbols are shown under section 2.11 of the Xcode and Apple SDKs Agreement, which
licenses them for developing applications for Apple-branded products, and this repository
is part of building one. They may not be redistributed for any other purpose, so anyone
reusing this gem outside that context should show the names alone.

The cells hold the icon and not its name, so the table stays readable at 131 rows. **The
name each system uses is on the icon**: hover it, or reach it with a screen reader, and
`Unicon[:search][:ios]` reads back as `magnifyingglass`.

The 43 action icons are not in the table. They are fetchable — `Unicon[:edit]` answers
— but they name what an app does rather than what it has, and this table is `Unicon.icons`
drawn out. `Unicon.actions` names them all.

<!-- concepts:start -->
| Icon | Aliases | Bootstrap | iOS | Android |
| --- | --- | --- | --- | --- |
| `:account` | `:author` `:avatar` `:profile` | ![person-circle](vendor/bootstrap-icons/person-circle.svg "person-circle") | ![person.crop.circle](vendor/sf-symbols/person.crop.circle.svg "person.crop.circle") | ![account_circle](vendor/material-symbols/account_circle.svg "account_circle") |
| `:airplane` |  | ![airplane](vendor/bootstrap-icons/airplane.svg "airplane") | ![airplane](vendor/sf-symbols/airplane.svg "airplane") | ![flight](vendor/material-symbols/flight.svg "flight") |
| `:alarm` | `:deadline` | ![alarm](vendor/bootstrap-icons/alarm.svg "alarm") | ![alarm](vendor/sf-symbols/alarm.svg "alarm") | ![alarm](vendor/material-symbols/alarm.svg "alarm") |
| `:archive` |  | ![archive](vendor/bootstrap-icons/archive.svg "archive") | ![archivebox](vendor/sf-symbols/archivebox.svg "archivebox") | ![archive](vendor/material-symbols/archive.svg "archive") |
| `:award` | `:specialty` | ![award](vendor/bootstrap-icons/award.svg "award") | ![rosette](vendor/sf-symbols/rosette.svg "rosette") | ![workspace_premium](vendor/material-symbols/workspace_premium.svg "workspace_premium") |
| `:badge` | `:agent` `:employee` `:role` | ![person-vcard](vendor/bootstrap-icons/person-vcard.svg "person-vcard") | ![person.text.rectangle](vendor/sf-symbols/person.text.rectangle.svg "person.text.rectangle") | ![badge](vendor/material-symbols/badge.svg "badge") |
| `:bag` |  | ![bag](vendor/bootstrap-icons/bag.svg "bag") | ![bag](vendor/sf-symbols/bag.svg "bag") | ![shopping_bag](vendor/material-symbols/shopping_bag.svg "shopping_bag") |
| `:bank` |  | ![bank](vendor/bootstrap-icons/bank.svg "bank") | ![building.columns](vendor/sf-symbols/building.columns.svg "building.columns") | ![account_balance](vendor/material-symbols/account_balance.svg "account_balance") |
| `:bar_chart` | `:vertical` | ![bar-chart](vendor/bootstrap-icons/bar-chart.svg "bar-chart") | ![chart.bar](vendor/sf-symbols/chart.bar.svg "chart.bar") | ![bar_chart](vendor/material-symbols/bar_chart.svg "bar_chart") |
| `:barcode` |  | ![upc](vendor/bootstrap-icons/upc.svg "upc") | ![barcode](vendor/sf-symbols/barcode.svg "barcode") | ![barcode](vendor/material-symbols/barcode.svg "barcode") |
| `:battery` |  | ![battery](vendor/bootstrap-icons/battery.svg "battery") | ![battery.100](vendor/sf-symbols/battery.100.svg "battery.100") | ![battery_full](vendor/material-symbols/battery_full.svg "battery_full") |
| `:bell` | `:notification` `:reminder` | ![bell](vendor/bootstrap-icons/bell.svg "bell") | ![bell](vendor/sf-symbols/bell.svg "bell") | ![notifications](vendor/material-symbols/notifications.svg "notifications") |
| `:bicycle` |  | ![bicycle](vendor/bootstrap-icons/bicycle.svg "bicycle") | ![bicycle](vendor/sf-symbols/bicycle.svg "bicycle") | ![directions_bike](vendor/material-symbols/directions_bike.svg "directions_bike") |
| `:bolt` | `:boost` | ![lightning](vendor/bootstrap-icons/lightning.svg "lightning") | ![bolt](vendor/sf-symbols/bolt.svg "bolt") | ![bolt](vendor/material-symbols/bolt.svg "bolt") |
| `:book` |  | ![book](vendor/bootstrap-icons/book.svg "book") | ![book](vendor/sf-symbols/book.svg "book") | ![book](vendor/material-symbols/book.svg "book") |
| `:bookmark` |  | ![bookmark](vendor/bootstrap-icons/bookmark.svg "bookmark") | ![bookmark](vendor/sf-symbols/bookmark.svg "bookmark") | ![bookmark](vendor/material-symbols/bookmark.svg "bookmark") |
| `:bookmarked` |  | ![bookmark-fill](vendor/bootstrap-icons/bookmark-fill.svg "bookmark-fill") | ![bookmark.fill](vendor/sf-symbols/bookmark.fill.svg "bookmark.fill") | ![bookmark_added](vendor/material-symbols/bookmark_added.svg "bookmark_added") |
| `:box` | `:inventory` `:item` `:package` `:product` | ![box](vendor/bootstrap-icons/box.svg "box") | ![shippingbox](vendor/sf-symbols/shippingbox.svg "shippingbox") | ![inventory_2](vendor/material-symbols/inventory_2.svg "inventory_2") |
| `:brand` |  | ![c-circle](vendor/bootstrap-icons/c-circle.svg "c-circle") | ![c.circle](vendor/sf-symbols/c.circle.svg "c.circle") | ![copyright](vendor/material-symbols/copyright.svg "copyright") |
| `:briefcase` | `:provider` | ![briefcase](vendor/bootstrap-icons/briefcase.svg "briefcase") | ![briefcase](vendor/sf-symbols/briefcase.svg "briefcase") | ![work](vendor/material-symbols/work.svg "work") |
| `:brush` |  | ![brush](vendor/bootstrap-icons/brush.svg "brush") | ![paintbrush](vendor/sf-symbols/paintbrush.svg "paintbrush") | ![brush](vendor/material-symbols/brush.svg "brush") |
| `:building` | `:business` `:city` `:company` `:office` `:organization` | ![building](vendor/bootstrap-icons/building.svg "building") | ![building](vendor/sf-symbols/building.svg "building") | ![apartment](vendor/material-symbols/apartment.svg "apartment") |
| `:bus` |  | ![bus-front](vendor/bootstrap-icons/bus-front.svg "bus-front") | ![bus](vendor/sf-symbols/bus.svg "bus") | ![directions_bus](vendor/material-symbols/directions_bus.svg "directions_bus") |
| `:calendar` | `:event` `:plan` `:schedule` | ![calendar](vendor/bootstrap-icons/calendar.svg "calendar") | ![calendar](vendor/sf-symbols/calendar.svg "calendar") | ![calendar_month](vendor/material-symbols/calendar_month.svg "calendar_month") |
| `:calendar_check` | `:appointment` `:booking` | ![calendar-check](vendor/bootstrap-icons/calendar-check.svg "calendar-check") | ![calendar.badge.checkmark](vendor/sf-symbols/calendar.badge.checkmark.svg "calendar.badge.checkmark") | ![event_available](vendor/material-symbols/event_available.svg "event_available") |
| `:camera` |  | ![camera](vendor/bootstrap-icons/camera.svg "camera") | ![camera](vendor/sf-symbols/camera.svg "camera") | ![photo_camera](vendor/material-symbols/photo_camera.svg "photo_camera") |
| `:car` | `:ride` `:vehicle` | ![car-front](vendor/bootstrap-icons/car-front.svg "car-front") | ![car](vendor/sf-symbols/car.svg "car") | ![directions_car](vendor/material-symbols/directions_car.svg "directions_car") |
| `:cart` | `:order` `:purchase` | ![cart](vendor/bootstrap-icons/cart.svg "cart") | ![cart](vendor/sf-symbols/cart.svg "cart") | ![shopping_cart](vendor/material-symbols/shopping_cart.svg "shopping_cart") |
| `:cash` | `:cost` | ![cash](vendor/bootstrap-icons/cash.svg "cash") | ![banknote](vendor/sf-symbols/banknote.svg "banknote") | ![payments](vendor/material-symbols/payments.svg "payments") |
| `:chat` | `:comment` `:conversation` `:message` | ![chat](vendor/bootstrap-icons/chat.svg "chat") | ![message](vendor/sf-symbols/message.svg "message") | ![chat](vendor/material-symbols/chat.svg "chat") |
| `:check_circle` |  | ![check-circle](vendor/bootstrap-icons/check-circle.svg "check-circle") | ![checkmark.circle](vendor/sf-symbols/checkmark.circle.svg "checkmark.circle") | ![check_circle](vendor/material-symbols/check_circle.svg "check_circle") |
| `:checklist` | `:pick` | ![card-checklist](vendor/bootstrap-icons/card-checklist.svg "card-checklist") | ![checklist.checked](vendor/sf-symbols/checklist.checked.svg "checklist.checked") | ![checklist](vendor/material-symbols/checklist.svg "checklist") |
| `:circle` |  | ![circle](vendor/bootstrap-icons/circle.svg "circle") | ![circle](vendor/sf-symbols/circle.svg "circle") | ![circle](vendor/material-symbols/circle.svg "circle") |
| `:clipboard` | `:assessment` `:survey` | ![clipboard](vendor/bootstrap-icons/clipboard.svg "clipboard") | ![list.clipboard](vendor/sf-symbols/list.clipboard.svg "list.clipboard") | ![content_paste](vendor/material-symbols/content_paste.svg "content_paste") |
| `:clock` | `:history` `:session` `:shift` | ![clock](vendor/bootstrap-icons/clock.svg "clock") | ![clock](vendor/sf-symbols/clock.svg "clock") | ![schedule](vendor/material-symbols/schedule.svg "schedule") |
| `:close_circle` |  | ![x-circle](vendor/bootstrap-icons/x-circle.svg "x-circle") | ![xmark.circle](vendor/sf-symbols/xmark.circle.svg "xmark.circle") | ![cancel](vendor/material-symbols/cancel.svg "cancel") |
| `:cloud` | `:backup` | ![cloud](vendor/bootstrap-icons/cloud.svg "cloud") | ![cloud](vendor/sf-symbols/cloud.svg "cloud") | ![cloud](vendor/material-symbols/cloud.svg "cloud") |
| `:compass` |  | ![compass](vendor/bootstrap-icons/compass.svg "compass") | ![location.north.circle](vendor/sf-symbols/location.north.circle.svg "location.north.circle") | ![explore](vendor/material-symbols/explore.svg "explore") |
| `:contact` |  | ![person-rolodex](vendor/bootstrap-icons/person-rolodex.svg "person-rolodex") | ![person.crop.circle](vendor/sf-symbols/person.crop.circle.svg "person.crop.circle") | ![contacts](vendor/material-symbols/contacts.svg "contacts") |
| `:credit_card` | `:charge` `:payment` `:transaction` | ![credit-card](vendor/bootstrap-icons/credit-card.svg "credit-card") | ![creditcard](vendor/sf-symbols/creditcard.svg "creditcard") | ![credit_card](vendor/material-symbols/credit_card.svg "credit_card") |
| `:display` | `:screen` | ![display](vendor/bootstrap-icons/display.svg "display") | ![display](vendor/sf-symbols/display.svg "display") | ![monitor](vendor/material-symbols/monitor.svg "monitor") |
| `:document` | `:file` `:form` `:page` `:post` `:summary` | ![file-earmark](vendor/bootstrap-icons/file-earmark.svg "file-earmark") | ![doc](vendor/sf-symbols/doc.svg "doc") | ![description](vendor/material-symbols/description.svg "description") |
| `:droplet` |  | ![droplet](vendor/bootstrap-icons/droplet.svg "droplet") | ![drop](vendor/sf-symbols/drop.svg "drop") | ![water_drop](vendor/material-symbols/water_drop.svg "water_drop") |
| `:envelope` | `:email` | ![envelope](vendor/bootstrap-icons/envelope.svg "envelope") | ![envelope](vendor/sf-symbols/envelope.svg "envelope") | ![mail](vendor/material-symbols/mail.svg "mail") |
| `:eye` | `:view` | ![eye](vendor/bootstrap-icons/eye.svg "eye") | ![eye](vendor/sf-symbols/eye.svg "eye") | ![visibility](vendor/material-symbols/visibility.svg "visibility") |
| `:filter` |  | ![funnel](vendor/bootstrap-icons/funnel.svg "funnel") | ![line.3.horizontal.decrease](vendor/sf-symbols/line.3.horizontal.decrease.svg "line.3.horizontal.decrease") | ![filter_alt](vendor/material-symbols/filter_alt.svg "filter_alt") |
| `:fingerprint` |  | ![fingerprint](vendor/bootstrap-icons/fingerprint.svg "fingerprint") | ![touchid](vendor/sf-symbols/touchid.svg "touchid") | ![fingerprint](vendor/material-symbols/fingerprint.svg "fingerprint") |
| `:fire` |  | ![fire](vendor/bootstrap-icons/fire.svg "fire") | ![flame](vendor/sf-symbols/flame.svg "flame") | ![local_fire_department](vendor/material-symbols/local_fire_department.svg "local_fire_department") |
| `:flag` | `:milestone` | ![flag](vendor/bootstrap-icons/flag.svg "flag") | ![flag](vendor/sf-symbols/flag.svg "flag") | ![flag](vendor/material-symbols/flag.svg "flag") |
| `:folder` | `:project` | ![folder](vendor/bootstrap-icons/folder.svg "folder") | ![folder](vendor/sf-symbols/folder.svg "folder") | ![folder](vendor/material-symbols/folder.svg "folder") |
| `:franchise` |  | ![building](vendor/bootstrap-icons/building.svg "building") | ![building.2](assets/undrawn.svg "building.2") | ![corporate_fare](vendor/material-symbols/corporate_fare.svg "corporate_fare") |
| `:gear` | `:configuration` `:setting` | ![gear](vendor/bootstrap-icons/gear.svg "gear") | ![gearshape](vendor/sf-symbols/gearshape.svg "gearshape") | ![settings](vendor/material-symbols/settings.svg "settings") |
| `:gift` | `:coupon` `:offer` | ![gift](vendor/bootstrap-icons/gift.svg "gift") | ![gift](vendor/sf-symbols/gift.svg "gift") | ![redeem](vendor/material-symbols/redeem.svg "redeem") |
| `:globe` | `:country` `:site` | ![globe](vendor/bootstrap-icons/globe.svg "globe") | ![globe](vendor/sf-symbols/globe.svg "globe") | ![public](vendor/material-symbols/public.svg "public") |
| `:grid` |  | ![grid](vendor/bootstrap-icons/grid.svg "grid") | ![square.grid.2x2](vendor/sf-symbols/square.grid.2x2.svg "square.grid.2x2") | ![grid_view](vendor/material-symbols/grid_view.svg "grid_view") |
| `:hammer` | `:job` | ![hammer](vendor/bootstrap-icons/hammer.svg "hammer") | ![hammer](vendor/sf-symbols/hammer.svg "hammer") | ![hardware](vendor/material-symbols/hardware.svg "hardware") |
| `:headphones` |  | ![headphones](vendor/bootstrap-icons/headphones.svg "headphones") | ![headphones](vendor/sf-symbols/headphones.svg "headphones") | ![headphones](vendor/material-symbols/headphones.svg "headphones") |
| `:heart` |  | ![heart](vendor/bootstrap-icons/heart.svg "heart") | ![heart](vendor/sf-symbols/heart.svg "heart") | ![favorite](vendor/material-symbols/favorite.svg "favorite") |
| `:hospital` |  | ![hospital](vendor/bootstrap-icons/hospital.svg "hospital") | ![cross.case](vendor/sf-symbols/cross.case.svg "cross.case") | ![local_hospital](vendor/material-symbols/local_hospital.svg "local_hospital") |
| `:hourglass` |  | ![hourglass](vendor/bootstrap-icons/hourglass.svg "hourglass") | ![hourglass](vendor/sf-symbols/hourglass.svg "hourglass") | ![hourglass_empty](vendor/material-symbols/hourglass_empty.svg "hourglass_empty") |
| `:house` | `:home` | ![house](vendor/bootstrap-icons/house.svg "house") | ![house](vendor/sf-symbols/house.svg "house") | ![home](vendor/material-symbols/home.svg "home") |
| `:image` | `:banner` `:photo` `:picture` | ![image](vendor/bootstrap-icons/image.svg "image") | ![photo](vendor/sf-symbols/photo.svg "photo") | ![image](vendor/material-symbols/image.svg "image") |
| `:inbox` |  | ![inbox](vendor/bootstrap-icons/inbox.svg "inbox") | ![tray](vendor/sf-symbols/tray.svg "tray") | ![inbox](vendor/material-symbols/inbox.svg "inbox") |
| `:infinity` |  | ![infinity](vendor/bootstrap-icons/infinity.svg "infinity") | ![infinity](vendor/sf-symbols/infinity.svg "infinity") | ![all_inclusive](vendor/material-symbols/all_inclusive.svg "all_inclusive") |
| `:info` |  | ![info-circle](vendor/bootstrap-icons/info-circle.svg "info-circle") | ![info.circle](vendor/sf-symbols/info.circle.svg "info.circle") | ![info](vendor/material-symbols/info.svg "info") |
| `:invoice` | `:bill` | ![file-earmark-text](vendor/bootstrap-icons/file-earmark-text.svg "file-earmark-text") | ![doc.text](vendor/sf-symbols/doc.text.svg "doc.text") | ![receipt_long](vendor/material-symbols/receipt_long.svg "receipt_long") |
| `:key` | `:credential` `:permission` `:token` | ![key](vendor/bootstrap-icons/key.svg "key") | ![key](vendor/sf-symbols/key.svg "key") | ![key](vendor/material-symbols/key.svg "key") |
| `:keyboard` |  | ![keyboard](vendor/bootstrap-icons/keyboard.svg "keyboard") | ![keyboard](vendor/sf-symbols/keyboard.svg "keyboard") | ![keyboard](vendor/material-symbols/keyboard.svg "keyboard") |
| `:laptop` |  | ![laptop](vendor/bootstrap-icons/laptop.svg "laptop") | ![laptopcomputer](vendor/sf-symbols/laptopcomputer.svg "laptopcomputer") | ![computer](vendor/material-symbols/computer.svg "computer") |
| `:lightbulb` |  | ![lightbulb](vendor/bootstrap-icons/lightbulb.svg "lightbulb") | ![lightbulb](vendor/sf-symbols/lightbulb.svg "lightbulb") | ![lightbulb](vendor/material-symbols/lightbulb.svg "lightbulb") |
| `:link` |  | ![link](vendor/bootstrap-icons/link.svg "link") | ![link](vendor/sf-symbols/link.svg "link") | ![link](vendor/material-symbols/link.svg "link") |
| `:list` | `:log` | ![list-ul](vendor/bootstrap-icons/list-ul.svg "list-ul") | ![list.bullet](vendor/sf-symbols/list.bullet.svg "list.bullet") | ![list](vendor/material-symbols/list.svg "list") |
| `:lock` | `:password` | ![lock](vendor/bootstrap-icons/lock.svg "lock") | ![lock](vendor/sf-symbols/lock.svg "lock") | ![lock](vendor/material-symbols/lock.svg "lock") |
| `:map` | `:area` `:county` `:region` `:state` `:territory` `:trip` | ![map](vendor/bootstrap-icons/map.svg "map") | ![map](vendor/sf-symbols/map.svg "map") | ![map](vendor/material-symbols/map.svg "map") |
| `:megaphone` | `:announcement` `:campaign` | ![megaphone](vendor/bootstrap-icons/megaphone.svg "megaphone") | ![megaphone](vendor/sf-symbols/megaphone.svg "megaphone") | ![campaign](vendor/material-symbols/campaign.svg "campaign") |
| `:microphone` | `:recording` | ![mic](vendor/bootstrap-icons/mic.svg "mic") | ![mic](vendor/sf-symbols/mic.svg "mic") | ![mic](vendor/material-symbols/mic.svg "mic") |
| `:mobile` |  | ![phone](vendor/bootstrap-icons/phone.svg "phone") | ![smartphone](vendor/sf-symbols/smartphone.svg "smartphone") | ![mobile](vendor/material-symbols/mobile.svg "mobile") |
| `:moon` |  | ![moon](vendor/bootstrap-icons/moon.svg "moon") | ![moon](vendor/sf-symbols/moon.svg "moon") | ![dark_mode](vendor/material-symbols/dark_mode.svg "dark_mode") |
| `:music` | `:track` | ![music-note](vendor/bootstrap-icons/music-note.svg "music-note") | ![music.note](vendor/sf-symbols/music.note.svg "music.note") | ![music_note](vendor/material-symbols/music_note.svg "music_note") |
| `:note` | `:memo` | ![sticky](vendor/bootstrap-icons/sticky.svg "sticky") | ![note.text](vendor/sf-symbols/note.text.svg "note.text") | ![sticky_note_2](vendor/material-symbols/sticky_note_2.svg "sticky_note_2") |
| `:palette` |  | ![palette](vendor/bootstrap-icons/palette.svg "palette") | ![paintpalette](vendor/sf-symbols/paintpalette.svg "paintpalette") | ![palette](vendor/material-symbols/palette.svg "palette") |
| `:paperclip` | `:attachment` | ![paperclip](vendor/bootstrap-icons/paperclip.svg "paperclip") | ![paperclip](vendor/sf-symbols/paperclip.svg "paperclip") | ![attach_file](vendor/material-symbols/attach_file.svg "attach_file") |
| `:people` | `:group` `:staff` `:team` | ![people](vendor/bootstrap-icons/people.svg "people") | ![person.2](vendor/sf-symbols/person.2.svg "person.2") | ![group](vendor/material-symbols/group.svg "group") |
| `:percent` | `:discount` | ![percent](vendor/bootstrap-icons/percent.svg "percent") | ![percent](vendor/sf-symbols/percent.svg "percent") | ![percent](vendor/material-symbols/percent.svg "percent") |
| `:person` | `:client` `:customer` `:lead` `:member` `:user` | ![person](vendor/bootstrap-icons/person.svg "person") | ![person](vendor/sf-symbols/person.svg "person") | ![person](vendor/material-symbols/person.svg "person") |
| `:phone` | `:call` | ![telephone](vendor/bootstrap-icons/telephone.svg "telephone") | ![phone](vendor/sf-symbols/phone.svg "phone") | ![call](vendor/material-symbols/call.svg "call") |
| `:pie_chart` | `:sector` | ![pie-chart](vendor/bootstrap-icons/pie-chart.svg "pie-chart") | ![chart.pie](vendor/sf-symbols/chart.pie.svg "chart.pie") | ![pie_chart](vendor/material-symbols/pie_chart.svg "pie_chart") |
| `:pin` | `:address` `:destination` `:location` `:zip` | ![geo-alt](vendor/bootstrap-icons/geo-alt.svg "geo-alt") | ![mappin](vendor/sf-symbols/mappin.svg "mappin") | ![location_on](vendor/material-symbols/location_on.svg "location_on") |
| `:playlist` | `:episode` | ![collection-play](vendor/bootstrap-icons/collection-play.svg "collection-play") | ![play.square.stack](vendor/sf-symbols/play.square.stack.svg "play.square.stack") | ![video_library](vendor/material-symbols/video_library.svg "video_library") |
| `:puzzle` | `:integration` `:platform` `:plugin` | ![puzzle](vendor/bootstrap-icons/puzzle.svg "puzzle") | ![puzzlepiece](vendor/sf-symbols/puzzlepiece.svg "puzzlepiece") | ![extension](vendor/material-symbols/extension.svg "extension") |
| `:qr_code` |  | ![qr-code](vendor/bootstrap-icons/qr-code.svg "qr-code") | ![qrcode](vendor/sf-symbols/qrcode.svg "qrcode") | ![qr_code](vendor/material-symbols/qr_code.svg "qr_code") |
| `:question` | `:answer` | ![question-circle](vendor/bootstrap-icons/question-circle.svg "question-circle") | ![questionmark.circle](vendor/sf-symbols/questionmark.circle.svg "questionmark.circle") | ![help](vendor/material-symbols/help.svg "help") |
| `:rain` |  | ![cloud-rain](vendor/bootstrap-icons/cloud-rain.svg "cloud-rain") | ![cloud.rain](vendor/sf-symbols/cloud.rain.svg "cloud.rain") | ![rainy](vendor/material-symbols/rainy.svg "rainy") |
| `:receipt` |  | ![receipt](vendor/bootstrap-icons/receipt.svg "receipt") | ![receipt](assets/undrawn.svg "receipt") | ![receipt](vendor/material-symbols/receipt.svg "receipt") |
| `:reply` |  | ![reply](vendor/bootstrap-icons/reply.svg "reply") | ![arrowshape.turn.up.left](vendor/sf-symbols/arrowshape.turn.up.left.svg "arrowshape.turn.up.left") | ![reply](vendor/material-symbols/reply.svg "reply") |
| `:ruler` |  | ![rulers](vendor/bootstrap-icons/rulers.svg "rulers") | ![ruler](vendor/sf-symbols/ruler.svg "ruler") | ![straighten](vendor/material-symbols/straighten.svg "straighten") |
| `:search` |  | ![search](vendor/bootstrap-icons/search.svg "search") | ![magnifyingglass](vendor/sf-symbols/magnifyingglass.svg "magnifyingglass") | ![search](vendor/material-symbols/search.svg "search") |
| `:server` |  | ![hdd-rack](vendor/bootstrap-icons/hdd-rack.svg "hdd-rack") | ![server.rack](vendor/sf-symbols/server.rack.svg "server.rack") | ![dns](vendor/material-symbols/dns.svg "dns") |
| `:shield` |  | ![shield](vendor/bootstrap-icons/shield.svg "shield") | ![shield](vendor/sf-symbols/shield.svg "shield") | ![shield](vendor/material-symbols/shield.svg "shield") |
| `:shop` | `:market` `:vendor` | ![shop](vendor/bootstrap-icons/shop.svg "shop") | ![storefront](vendor/sf-symbols/storefront.svg "storefront") | ![storefront](vendor/material-symbols/storefront.svg "storefront") |
| `:signature` | `:contract` | ![pen](vendor/bootstrap-icons/pen.svg "pen") | ![signature](vendor/sf-symbols/signature.svg "signature") | ![draw](vendor/material-symbols/draw.svg "draw") |
| `:signpost` | `:route` `:source` | ![signpost-split](vendor/bootstrap-icons/signpost-split.svg "signpost-split") | ![signpost.right](vendor/sf-symbols/signpost.right.svg "signpost.right") | ![signpost](vendor/material-symbols/signpost.svg "signpost") |
| `:sliders` | `:optimization` `:preference` | ![sliders](vendor/bootstrap-icons/sliders.svg "sliders") | ![slider.horizontal.3](vendor/sf-symbols/slider.horizontal.3.svg "slider.horizontal.3") | ![tune](vendor/material-symbols/tune.svg "tune") |
| `:smiley` | `:feedback` | ![emoji-smile](vendor/bootstrap-icons/emoji-smile.svg "emoji-smile") | ![face.smiling](vendor/sf-symbols/face.smiling.svg "face.smiling") | ![sentiment_satisfied](vendor/material-symbols/sentiment_satisfied.svg "sentiment_satisfied") |
| `:snow` |  | ![snow](vendor/bootstrap-icons/snow.svg "snow") | ![snowflake](vendor/sf-symbols/snowflake.svg "snowflake") | ![weather_snowy](vendor/material-symbols/weather_snowy.svg "weather_snowy") |
| `:speedometer` | `:dashboard` `:evaluation` | ![speedometer](vendor/bootstrap-icons/speedometer.svg "speedometer") | ![gauge](vendor/sf-symbols/gauge.svg "gauge") | ![speed](vendor/material-symbols/speed.svg "speed") |
| `:square` |  | ![square](vendor/bootstrap-icons/square.svg "square") | ![square](vendor/sf-symbols/square.svg "square") | ![square](vendor/material-symbols/square.svg "square") |
| `:star` | `:rating` `:review` | ![star](vendor/bootstrap-icons/star.svg "star") | ![star](vendor/sf-symbols/star.svg "star") | ![star](vendor/material-symbols/star.svg "star") |
| `:stopwatch` |  | ![stopwatch](vendor/bootstrap-icons/stopwatch.svg "stopwatch") | ![stopwatch](vendor/sf-symbols/stopwatch.svg "stopwatch") | ![timer](vendor/material-symbols/timer.svg "timer") |
| `:sun` |  | ![sun](vendor/bootstrap-icons/sun.svg "sun") | ![sun.max](vendor/sf-symbols/sun.max.svg "sun.max") | ![light_mode](vendor/material-symbols/light_mode.svg "light_mode") |
| `:table` |  | ![table](vendor/bootstrap-icons/table.svg "table") | ![tablecells](vendor/sf-symbols/tablecells.svg "tablecells") | ![table_chart](vendor/material-symbols/table_chart.svg "table_chart") |
| `:tag` | `:category` `:label` `:price` | ![tag](vendor/bootstrap-icons/tag.svg "tag") | ![tag](vendor/sf-symbols/tag.svg "tag") | ![sell](vendor/material-symbols/sell.svg "sell") |
| `:task` | `:todo` | ![check2-square](vendor/bootstrap-icons/check2-square.svg "check2-square") | ![checklist](vendor/sf-symbols/checklist.svg "checklist") | ![task_alt](vendor/material-symbols/task_alt.svg "task_alt") |
| `:terminal` | `:api` `:prompt` | ![terminal](vendor/bootstrap-icons/terminal.svg "terminal") | ![terminal](vendor/sf-symbols/terminal.svg "terminal") | ![terminal](vendor/material-symbols/terminal.svg "terminal") |
| `:thumbs_down` |  | ![hand-thumbs-down](vendor/bootstrap-icons/hand-thumbs-down.svg "hand-thumbs-down") | ![hand.thumbsdown](vendor/sf-symbols/hand.thumbsdown.svg "hand.thumbsdown") | ![thumb_down](vendor/material-symbols/thumb_down.svg "thumb_down") |
| `:thumbs_up` |  | ![hand-thumbs-up](vendor/bootstrap-icons/hand-thumbs-up.svg "hand-thumbs-up") | ![hand.thumbsup](vendor/sf-symbols/hand.thumbsup.svg "hand.thumbsup") | ![thumb_up](vendor/material-symbols/thumb_up.svg "thumb_up") |
| `:ticket` |  | ![ticket](vendor/bootstrap-icons/ticket.svg "ticket") | ![ticket](vendor/sf-symbols/ticket.svg "ticket") | ![confirmation_number](vendor/material-symbols/confirmation_number.svg "confirmation_number") |
| `:toolbox` |  | ![tools](vendor/bootstrap-icons/tools.svg "tools") | ![wrench.and.screwdriver](vendor/sf-symbols/wrench.and.screwdriver.svg "wrench.and.screwdriver") | ![handyman](vendor/material-symbols/handyman.svg "handyman") |
| `:train` |  | ![train-front](vendor/bootstrap-icons/train-front.svg "train-front") | ![train.side.front.car](vendor/sf-symbols/train.side.front.car.svg "train.side.front.car") | ![train](vendor/material-symbols/train.svg "train") |
| `:tree` |  | ![tree](vendor/bootstrap-icons/tree.svg "tree") | ![tree](vendor/sf-symbols/tree.svg "tree") | ![park](vendor/material-symbols/park.svg "park") |
| `:trending_up` |  | ![graph-up](vendor/bootstrap-icons/graph-up.svg "graph-up") | ![chart.line.uptrend.xyaxis](vendor/sf-symbols/chart.line.uptrend.xyaxis.svg "chart.line.uptrend.xyaxis") | ![trending_up](vendor/material-symbols/trending_up.svg "trending_up") |
| `:trophy` | `:goal` | ![trophy](vendor/bootstrap-icons/trophy.svg "trophy") | ![trophy](vendor/sf-symbols/trophy.svg "trophy") | ![trophy](vendor/material-symbols/trophy.svg "trophy") |
| `:truck` | `:delivery` `:fleet` `:shipment` `:supplier` | ![truck](vendor/bootstrap-icons/truck.svg "truck") | ![truck.box](vendor/sf-symbols/truck.box.svg "truck.box") | ![local_shipping](vendor/material-symbols/local_shipping.svg "local_shipping") |
| `:video` | `:movie` | ![camera-video](vendor/bootstrap-icons/camera-video.svg "camera-video") | ![video](vendor/sf-symbols/video.svg "video") | ![videocam](vendor/material-symbols/videocam.svg "videocam") |
| `:volume` |  | ![volume-up](vendor/bootstrap-icons/volume-up.svg "volume-up") | ![speaker.wave.2](vendor/sf-symbols/speaker.wave.2.svg "speaker.wave.2") | ![volume_up](vendor/material-symbols/volume_up.svg "volume_up") |
| `:wallet` |  | ![wallet](vendor/bootstrap-icons/wallet.svg "wallet") | ![wallet.pass](vendor/sf-symbols/wallet.pass.svg "wallet.pass") | ![wallet](vendor/material-symbols/wallet.svg "wallet") |
| `:warning` | `:alert` `:issue` | ![exclamation-triangle](vendor/bootstrap-icons/exclamation-triangle.svg "exclamation-triangle") | ![exclamationmark.triangle](vendor/sf-symbols/exclamationmark.triangle.svg "exclamationmark.triangle") | ![warning](vendor/material-symbols/warning.svg "warning") |
| `:waveform` | `:audio` `:echo` | ![soundwave](vendor/bootstrap-icons/soundwave.svg "soundwave") | ![waveform](vendor/sf-symbols/waveform.svg "waveform") | ![graphic_eq](vendor/material-symbols/graphic_eq.svg "graphic_eq") |
| `:wifi` |  | ![wifi](vendor/bootstrap-icons/wifi.svg "wifi") | ![wifi](vendor/sf-symbols/wifi.svg "wifi") | ![wifi](vendor/material-symbols/wifi.svg "wifi") |
| `:window` | `:app` | ![window](vendor/bootstrap-icons/window.svg "window") | ![macwindow](vendor/sf-symbols/macwindow.svg "macwindow") | ![web_asset](vendor/material-symbols/web_asset.svg "web_asset") |
| `:wrench` |  | ![wrench](vendor/bootstrap-icons/wrench.svg "wrench") | ![wrench](vendor/sf-symbols/wrench.svg "wrench") | ![build](vendor/material-symbols/build.svg "build") |

A dashed circle is a symbol newer than the macOS that drew this table, which knows the SF Symbols 5 set. Hover it for the name, which resolves in an app built against a newer SDK.
<!-- concepts:end -->

## Where the names come from

Every name in the table is checked, by `rake validate`, against the list its own design
system publishes. The lists are vendored under `data/`, so the check needs no network
and runs as part of the default `rake` task.

- `data/bootstrap-icons.txt` — 2,078 names, from `font/bootstrap-icons.json` at tag
  `v1.13.1` of [twbs/icons](https://github.com/twbs/icons).
- `data/material-symbols.txt` — 3,896 names, from Google's
  [metadata endpoint](https://fonts.google.com/metadata/icons), keeping only what
  Material Symbols Outlined actually ships. The endpoint also lists legacy Material
  Icons, such as `laptop` and `smartphone`, which no longer resolve as symbols.
- `data/sf-symbols.txt` — 8,295 names, from `Metadata/name_availability.plist` inside
  `SF Symbols.app`, filtered to names whose iOS availability is 18.3 or earlier. The
  plist gives each release an iOS version, and that version is the constraint, so the
  filter reads it rather than the release year. A name added in iOS 18.4 or later is
  left out and cannot enter the table.

## The artwork in the table

All three columns show artwork vendored under `vendor/`, so the table renders whether or
not a CDN answers, and each directory carries the license its artwork came with.

Bootstrap Icons and Material Symbols are downloaded from their published sources, and
differ from upstream in two attributes: a gray fill, so a row reads on a light and a dark
theme alike, and a 20px box, so the columns line up. Apple publishes no files to fetch,
so `tools/sf_symbols.swift` asks macOS to draw each symbol and writes a PNG in the same
gray and the same box.

That rendering is done by the machine running `rake readme`, and a machine only knows the
symbols its own system shipped with. Anything newer gets `assets/undrawn.svg` — a dashed
circle of our own drawing, not Apple's — with the symbol's name still on it to hover.
One row is in that state today: `:receipt`, whose SF symbol arrived in iOS 18.2, drawn on
a Mac running macOS 14.3. `rake validate` has already proved every name real, which is
why a symbol this Mac cannot draw is reported rather than fatal.

## License

MIT. See `LICENSE.txt`.
