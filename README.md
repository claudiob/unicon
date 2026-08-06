# Unicon

One concept, three icon names.

An app knows it wants to draw a house. What a house is *called* depends on who is
drawing it: Bootstrap Icons says `house`, SF Symbols says `house`, Material Symbols
says `home`. Unicon holds that translation, so a Rails app can name the concept once
and let the web page, the iOS client and the Android client each draw it from the set
they already ship.

```ruby
Unicon.fetch :house
# => { bootstrap: :house, ios: :house, android: :home }

Unicon[:contact]
# => { bootstrap: :'person-rolodex', ios: :'person.crop.circle', android: :contacts }
```

`Unicon[]` and `Unicon.fetch` are the same method; `[]` is the shorter spelling.

## Installation

```ruby
gem 'unicon'
```

## The three keys

Every concept carries exactly three keys, and never fewer:

| Key | Design system | Licence |
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
# => { bootstrap: :circle, ios: :circle, android: :circle }
```

A caller rendering whatever it is handed never has to check first, and never draws a
blank. A string is read as a symbol, so `Unicon['contact']` works too.

## Model names

A host app looks an icon up by the name of the model it is rendering. These names are
therefore concepts in their own right, each drawing the icons of the concept beside it.

<!-- models:start -->
| Model name | Concept it draws |
| --- | --- |
| `:address` | `:pin` |
| `:agent` | `:badge` |
| `:call` | `:phone` |
| `:comment` | `:chat` |
| `:company` | `:building` |
| `:county` | `:map` |
| `:email` | `:envelope` |
| `:event` | `:calendar` |
| `:file` | `:document` |
| `:home` | `:house` |
| `:job` | `:briefcase` |
| `:location` | `:pin` |
| `:market` | `:shop` |
| `:message` | `:chat` |
| `:order` | `:cart` |
| `:payment` | `:credit_card` |
| `:photo` | `:image` |
| `:product` | `:box` |
| `:setting` | `:gear` |
| `:source` | `:signpost` |
| `:state` | `:map` |
| `:team` | `:people` |
| `:user` | `:person` |
| `:zip` | `:pin` |
<!-- models:end -->

## Every concept

A concept is listed only when all three systems have a sensible icon for it. Where one
of the three has none, the concept is left out rather than filled in with something
close — a receipt, a hospital and a compass all came out on that rule.

The SF Symbols column shows the name and no artwork, on purpose. Apple's licence
permits the symbols only in software running on Apple platforms and forbids
redistributing the artwork, so copying it into a README on the web would break it,
while a name is a fact and may be printed. Look each one up in
[SF Symbols](https://developer.apple.com/sf-symbols/), or in the app of the same name.

<!-- concepts:start -->
| Concept | Bootstrap Icons | SF Symbols | Material Symbols |
| --- | --- | --- | --- |
| `:search` | ![search](vendor/bootstrap-icons/search.svg) `search` | `magnifyingglass` | ![search](vendor/material-symbols/search.svg) `search` |
| `:plus` | ![plus](vendor/bootstrap-icons/plus.svg) `plus` | `plus` | ![add](vendor/material-symbols/add.svg) `add` |
| `:minus` | ![dash](vendor/bootstrap-icons/dash.svg) `dash` | `minus` | ![remove](vendor/material-symbols/remove.svg) `remove` |
| `:check` | ![check](vendor/bootstrap-icons/check.svg) `check` | `checkmark` | ![check](vendor/material-symbols/check.svg) `check` |
| `:close` | ![x](vendor/bootstrap-icons/x.svg) `x` | `xmark` | ![close](vendor/material-symbols/close.svg) `close` |
| `:pencil` | ![pencil](vendor/bootstrap-icons/pencil.svg) `pencil` | `pencil` | ![edit](vendor/material-symbols/edit.svg) `edit` |
| `:trash` | ![trash](vendor/bootstrap-icons/trash.svg) `trash` | `trash` | ![delete](vendor/material-symbols/delete.svg) `delete` |
| `:filter` | ![funnel](vendor/bootstrap-icons/funnel.svg) `funnel` | `line.3.horizontal.decrease` | ![filter_alt](vendor/material-symbols/filter_alt.svg) `filter_alt` |
| `:sort` | ![sort-down](vendor/bootstrap-icons/sort-down.svg) `sort-down` | `arrow.up.arrow.down` | ![sort](vendor/material-symbols/sort.svg) `sort` |
| `:download` | ![download](vendor/bootstrap-icons/download.svg) `download` | `arrow.down.circle` | ![download](vendor/material-symbols/download.svg) `download` |
| `:upload` | ![upload](vendor/bootstrap-icons/upload.svg) `upload` | `arrow.up.circle` | ![upload](vendor/material-symbols/upload.svg) `upload` |
| `:share` | ![share](vendor/bootstrap-icons/share.svg) `share` | `square.and.arrow.up` | ![share](vendor/material-symbols/share.svg) `share` |
| `:link` | ![link](vendor/bootstrap-icons/link.svg) `link` | `link` | ![link](vendor/material-symbols/link.svg) `link` |
| `:copy` | ![copy](vendor/bootstrap-icons/copy.svg) `copy` | `doc.on.doc` | ![content_copy](vendor/material-symbols/content_copy.svg) `content_copy` |
| `:printer` | ![printer](vendor/bootstrap-icons/printer.svg) `printer` | `printer` | ![print](vendor/material-symbols/print.svg) `print` |
| `:refresh` | ![arrow-clockwise](vendor/bootstrap-icons/arrow-clockwise.svg) `arrow-clockwise` | `arrow.clockwise` | ![refresh](vendor/material-symbols/refresh.svg) `refresh` |
| `:undo` | ![arrow-counterclockwise](vendor/bootstrap-icons/arrow-counterclockwise.svg) `arrow-counterclockwise` | `arrow.uturn.backward` | ![undo](vendor/material-symbols/undo.svg) `undo` |
| `:zoom_in` | ![zoom-in](vendor/bootstrap-icons/zoom-in.svg) `zoom-in` | `plus.magnifyingglass` | ![zoom_in](vendor/material-symbols/zoom_in.svg) `zoom_in` |
| `:zoom_out` | ![zoom-out](vendor/bootstrap-icons/zoom-out.svg) `zoom-out` | `minus.magnifyingglass` | ![zoom_out](vendor/material-symbols/zoom_out.svg) `zoom_out` |
| `:scissors` | ![scissors](vendor/bootstrap-icons/scissors.svg) `scissors` | `scissors` | ![content_cut](vendor/material-symbols/content_cut.svg) `content_cut` |
| `:shuffle` | ![shuffle](vendor/bootstrap-icons/shuffle.svg) `shuffle` | `shuffle` | ![shuffle](vendor/material-symbols/shuffle.svg) `shuffle` |
| `:repeat` | ![repeat](vendor/bootstrap-icons/repeat.svg) `repeat` | `repeat` | ![repeat](vendor/material-symbols/repeat.svg) `repeat` |
| `:task` | ![check2-square](vendor/bootstrap-icons/check2-square.svg) `check2-square` | `checklist` | ![task_alt](vendor/material-symbols/task_alt.svg) `task_alt` |
| `:chevron_up` | ![chevron-up](vendor/bootstrap-icons/chevron-up.svg) `chevron-up` | `chevron.up` | ![keyboard_arrow_up](vendor/material-symbols/keyboard_arrow_up.svg) `keyboard_arrow_up` |
| `:chevron_down` | ![chevron-down](vendor/bootstrap-icons/chevron-down.svg) `chevron-down` | `chevron.down` | ![keyboard_arrow_down](vendor/material-symbols/keyboard_arrow_down.svg) `keyboard_arrow_down` |
| `:chevron_left` | ![chevron-left](vendor/bootstrap-icons/chevron-left.svg) `chevron-left` | `chevron.left` | ![keyboard_arrow_left](vendor/material-symbols/keyboard_arrow_left.svg) `keyboard_arrow_left` |
| `:chevron_right` | ![chevron-right](vendor/bootstrap-icons/chevron-right.svg) `chevron-right` | `chevron.right` | ![keyboard_arrow_right](vendor/material-symbols/keyboard_arrow_right.svg) `keyboard_arrow_right` |
| `:arrow_up` | ![arrow-up](vendor/bootstrap-icons/arrow-up.svg) `arrow-up` | `arrow.up` | ![arrow_upward](vendor/material-symbols/arrow_upward.svg) `arrow_upward` |
| `:arrow_down` | ![arrow-down](vendor/bootstrap-icons/arrow-down.svg) `arrow-down` | `arrow.down` | ![arrow_downward](vendor/material-symbols/arrow_downward.svg) `arrow_downward` |
| `:arrow_left` | ![arrow-left](vendor/bootstrap-icons/arrow-left.svg) `arrow-left` | `arrow.left` | ![arrow_back](vendor/material-symbols/arrow_back.svg) `arrow_back` |
| `:arrow_right` | ![arrow-right](vendor/bootstrap-icons/arrow-right.svg) `arrow-right` | `arrow.right` | ![arrow_forward](vendor/material-symbols/arrow_forward.svg) `arrow_forward` |
| `:bar_chart` | ![bar-chart](vendor/bootstrap-icons/bar-chart.svg) `bar-chart` | `chart.bar` | ![bar_chart](vendor/material-symbols/bar_chart.svg) `bar_chart` |
| `:pie_chart` | ![pie-chart](vendor/bootstrap-icons/pie-chart.svg) `pie-chart` | `chart.pie` | ![pie_chart](vendor/material-symbols/pie_chart.svg) `pie_chart` |
| `:trending_up` | ![graph-up](vendor/bootstrap-icons/graph-up.svg) `graph-up` | `chart.line.uptrend.xyaxis` | ![trending_up](vendor/material-symbols/trending_up.svg) `trending_up` |
| `:speedometer` | ![speedometer](vendor/bootstrap-icons/speedometer.svg) `speedometer` | `gauge` | ![speed](vendor/material-symbols/speed.svg) `speed` |
| `:cart` | ![cart](vendor/bootstrap-icons/cart.svg) `cart` | `cart` | ![shopping_cart](vendor/material-symbols/shopping_cart.svg) `shopping_cart` |
| `:bag` | ![bag](vendor/bootstrap-icons/bag.svg) `bag` | `bag` | ![shopping_bag](vendor/material-symbols/shopping_bag.svg) `shopping_bag` |
| `:tag` | ![tag](vendor/bootstrap-icons/tag.svg) `tag` | `tag` | ![sell](vendor/material-symbols/sell.svg) `sell` |
| `:credit_card` | ![credit-card](vendor/bootstrap-icons/credit-card.svg) `credit-card` | `creditcard` | ![credit_card](vendor/material-symbols/credit_card.svg) `credit_card` |
| `:cash` | ![cash](vendor/bootstrap-icons/cash.svg) `cash` | `banknote` | ![payments](vendor/material-symbols/payments.svg) `payments` |
| `:wallet` | ![wallet](vendor/bootstrap-icons/wallet.svg) `wallet` | `wallet.pass` | ![wallet](vendor/material-symbols/wallet.svg) `wallet` |
| `:gift` | ![gift](vendor/bootstrap-icons/gift.svg) `gift` | `gift` | ![redeem](vendor/material-symbols/redeem.svg) `redeem` |
| `:percent` | ![percent](vendor/bootstrap-icons/percent.svg) `percent` | `percent` | ![percent](vendor/material-symbols/percent.svg) `percent` |
| `:ticket` | ![ticket](vendor/bootstrap-icons/ticket.svg) `ticket` | `ticket` | ![confirmation_number](vendor/material-symbols/confirmation_number.svg) `confirmation_number` |
| `:barcode` | ![upc](vendor/bootstrap-icons/upc.svg) `upc` | `barcode` | ![barcode](vendor/material-symbols/barcode.svg) `barcode` |
| `:qr_code` | ![qr-code](vendor/bootstrap-icons/qr-code.svg) `qr-code` | `qrcode` | ![qr_code](vendor/material-symbols/qr_code.svg) `qr_code` |
| `:invoice` | ![file-earmark-text](vendor/bootstrap-icons/file-earmark-text.svg) `file-earmark-text` | `doc.text` | ![receipt_long](vendor/material-symbols/receipt_long.svg) `receipt_long` |
| `:phone` | ![telephone](vendor/bootstrap-icons/telephone.svg) `telephone` | `phone` | ![call](vendor/material-symbols/call.svg) `call` |
| `:mobile` | ![phone](vendor/bootstrap-icons/phone.svg) `phone` | `iphone` | ![mobile](vendor/material-symbols/mobile.svg) `mobile` |
| `:envelope` | ![envelope](vendor/bootstrap-icons/envelope.svg) `envelope` | `envelope` | ![mail](vendor/material-symbols/mail.svg) `mail` |
| `:chat` | ![chat](vendor/bootstrap-icons/chat.svg) `chat` | `message` | ![chat](vendor/material-symbols/chat.svg) `chat` |
| `:bell` | ![bell](vendor/bootstrap-icons/bell.svg) `bell` | `bell` | ![notifications](vendor/material-symbols/notifications.svg) `notifications` |
| `:megaphone` | ![megaphone](vendor/bootstrap-icons/megaphone.svg) `megaphone` | `megaphone` | ![campaign](vendor/material-symbols/campaign.svg) `campaign` |
| `:send` | ![send](vendor/bootstrap-icons/send.svg) `send` | `paperplane` | ![send](vendor/material-symbols/send.svg) `send` |
| `:inbox` | ![inbox](vendor/bootstrap-icons/inbox.svg) `inbox` | `tray` | ![inbox](vendor/material-symbols/inbox.svg) `inbox` |
| `:reply` | ![reply](vendor/bootstrap-icons/reply.svg) `reply` | `arrowshape.turn.up.left` | ![reply](vendor/material-symbols/reply.svg) `reply` |
| `:laptop` | ![laptop](vendor/bootstrap-icons/laptop.svg) `laptop` | `laptopcomputer` | ![computer](vendor/material-symbols/computer.svg) `computer` |
| `:keyboard` | ![keyboard](vendor/bootstrap-icons/keyboard.svg) `keyboard` | `keyboard` | ![keyboard](vendor/material-symbols/keyboard.svg) `keyboard` |
| `:display` | ![display](vendor/bootstrap-icons/display.svg) `display` | `display` | ![monitor](vendor/material-symbols/monitor.svg) `monitor` |
| `:server` | ![hdd-rack](vendor/bootstrap-icons/hdd-rack.svg) `hdd-rack` | `server.rack` | ![dns](vendor/material-symbols/dns.svg) `dns` |
| `:cloud` | ![cloud](vendor/bootstrap-icons/cloud.svg) `cloud` | `cloud` | ![cloud](vendor/material-symbols/cloud.svg) `cloud` |
| `:wifi` | ![wifi](vendor/bootstrap-icons/wifi.svg) `wifi` | `wifi` | ![wifi](vendor/material-symbols/wifi.svg) `wifi` |
| `:battery` | ![battery](vendor/bootstrap-icons/battery.svg) `battery` | `battery.100` | ![battery_full](vendor/material-symbols/battery_full.svg) `battery_full` |
| `:document` | ![file-earmark](vendor/bootstrap-icons/file-earmark.svg) `file-earmark` | `doc` | ![description](vendor/material-symbols/description.svg) `description` |
| `:folder` | ![folder](vendor/bootstrap-icons/folder.svg) `folder` | `folder` | ![folder](vendor/material-symbols/folder.svg) `folder` |
| `:archive` | ![archive](vendor/bootstrap-icons/archive.svg) `archive` | `archivebox` | ![archive](vendor/material-symbols/archive.svg) `archive` |
| `:clipboard` | ![clipboard](vendor/bootstrap-icons/clipboard.svg) `clipboard` | `list.clipboard` | ![content_paste](vendor/material-symbols/content_paste.svg) `content_paste` |
| `:book` | ![book](vendor/bootstrap-icons/book.svg) `book` | `book` | ![book](vendor/material-symbols/book.svg) `book` |
| `:note` | ![sticky](vendor/bootstrap-icons/sticky.svg) `sticky` | `note.text` | ![sticky_note_2](vendor/material-symbols/sticky_note_2.svg) `sticky_note_2` |
| `:paperclip` | ![paperclip](vendor/bootstrap-icons/paperclip.svg) `paperclip` | `paperclip` | ![attach_file](vendor/material-symbols/attach_file.svg) `attach_file` |
| `:box` | ![box](vendor/bootstrap-icons/box.svg) `box` | `shippingbox` | ![inventory_2](vendor/material-symbols/inventory_2.svg) `inventory_2` |
| `:table` | ![table](vendor/bootstrap-icons/table.svg) `table` | `tablecells` | ![table_chart](vendor/material-symbols/table_chart.svg) `table_chart` |
| `:list` | ![list-ul](vendor/bootstrap-icons/list-ul.svg) `list-ul` | `list.bullet` | ![list](vendor/material-symbols/list.svg) `list` |
| `:grid` | ![grid](vendor/bootstrap-icons/grid.svg) `grid` | `square.grid.2x2` | ![grid_view](vendor/material-symbols/grid_view.svg) `grid_view` |
| `:menu` | ![list](vendor/bootstrap-icons/list.svg) `list` | `line.3.horizontal` | ![menu](vendor/material-symbols/menu.svg) `menu` |
| `:sidebar` | ![layout-sidebar](vendor/bootstrap-icons/layout-sidebar.svg) `layout-sidebar` | `sidebar.left` | ![view_sidebar](vendor/material-symbols/view_sidebar.svg) `view_sidebar` |
| `:ellipsis` | ![three-dots](vendor/bootstrap-icons/three-dots.svg) `three-dots` | `ellipsis` | ![more_horiz](vendor/material-symbols/more_horiz.svg) `more_horiz` |
| `:camera` | ![camera](vendor/bootstrap-icons/camera.svg) `camera` | `camera` | ![photo_camera](vendor/material-symbols/photo_camera.svg) `photo_camera` |
| `:image` | ![image](vendor/bootstrap-icons/image.svg) `image` | `photo` | ![image](vendor/material-symbols/image.svg) `image` |
| `:video` | ![camera-video](vendor/bootstrap-icons/camera-video.svg) `camera-video` | `video` | ![videocam](vendor/material-symbols/videocam.svg) `videocam` |
| `:microphone` | ![mic](vendor/bootstrap-icons/mic.svg) `mic` | `mic` | ![mic](vendor/material-symbols/mic.svg) `mic` |
| `:play` | ![play](vendor/bootstrap-icons/play.svg) `play` | `play` | ![play_arrow](vendor/material-symbols/play_arrow.svg) `play_arrow` |
| `:pause` | ![pause](vendor/bootstrap-icons/pause.svg) `pause` | `pause` | ![pause](vendor/material-symbols/pause.svg) `pause` |
| `:stop` | ![stop](vendor/bootstrap-icons/stop.svg) `stop` | `stop` | ![stop](vendor/material-symbols/stop.svg) `stop` |
| `:skip_next` | ![skip-forward](vendor/bootstrap-icons/skip-forward.svg) `skip-forward` | `forward.end` | ![skip_next](vendor/material-symbols/skip_next.svg) `skip_next` |
| `:music` | ![music-note](vendor/bootstrap-icons/music-note.svg) `music-note` | `music.note` | ![music_note](vendor/material-symbols/music_note.svg) `music_note` |
| `:volume` | ![volume-up](vendor/bootstrap-icons/volume-up.svg) `volume-up` | `speaker.wave.2` | ![volume_up](vendor/material-symbols/volume_up.svg) `volume_up` |
| `:headphones` | ![headphones](vendor/bootstrap-icons/headphones.svg) `headphones` | `headphones` | ![headphones](vendor/material-symbols/headphones.svg) `headphones` |
| `:palette` | ![palette](vendor/bootstrap-icons/palette.svg) `palette` | `paintpalette` | ![palette](vendor/material-symbols/palette.svg) `palette` |
| `:brush` | ![brush](vendor/bootstrap-icons/brush.svg) `brush` | `paintbrush` | ![brush](vendor/material-symbols/brush.svg) `brush` |
| `:sun` | ![sun](vendor/bootstrap-icons/sun.svg) `sun` | `sun.max` | ![light_mode](vendor/material-symbols/light_mode.svg) `light_mode` |
| `:moon` | ![moon](vendor/bootstrap-icons/moon.svg) `moon` | `moon` | ![dark_mode](vendor/material-symbols/dark_mode.svg) `dark_mode` |
| `:rain` | ![cloud-rain](vendor/bootstrap-icons/cloud-rain.svg) `cloud-rain` | `cloud.rain` | ![rainy](vendor/material-symbols/rainy.svg) `rainy` |
| `:fire` | ![fire](vendor/bootstrap-icons/fire.svg) `fire` | `flame` | ![local_fire_department](vendor/material-symbols/local_fire_department.svg) `local_fire_department` |
| `:droplet` | ![droplet](vendor/bootstrap-icons/droplet.svg) `droplet` | `drop` | ![water_drop](vendor/material-symbols/water_drop.svg) `water_drop` |
| `:bolt` | ![lightning](vendor/bootstrap-icons/lightning.svg) `lightning` | `bolt` | ![bolt](vendor/material-symbols/bolt.svg) `bolt` |
| `:tree` | ![tree](vendor/bootstrap-icons/tree.svg) `tree` | `tree` | ![park](vendor/material-symbols/park.svg) `park` |
| `:person` | ![person](vendor/bootstrap-icons/person.svg) `person` | `person` | ![person](vendor/material-symbols/person.svg) `person` |
| `:people` | ![people](vendor/bootstrap-icons/people.svg) `people` | `person.2` | ![group](vendor/material-symbols/group.svg) `group` |
| `:person_add` | ![person-plus](vendor/bootstrap-icons/person-plus.svg) `person-plus` | `person.badge.plus` | ![person_add](vendor/material-symbols/person_add.svg) `person_add` |
| `:person_remove` | ![person-dash](vendor/bootstrap-icons/person-dash.svg) `person-dash` | `person.badge.minus` | ![person_remove](vendor/material-symbols/person_remove.svg) `person_remove` |
| `:account` | ![person-circle](vendor/bootstrap-icons/person-circle.svg) `person-circle` | `person.crop.circle` | ![account_circle](vendor/material-symbols/account_circle.svg) `account_circle` |
| `:badge` | ![person-vcard](vendor/bootstrap-icons/person-vcard.svg) `person-vcard` | `person.text.rectangle` | ![badge](vendor/material-symbols/badge.svg) `badge` |
| `:contact` | ![person-rolodex](vendor/bootstrap-icons/person-rolodex.svg) `person-rolodex` | `person.crop.circle` | ![contacts](vendor/material-symbols/contacts.svg) `contacts` |
| `:house` | ![house](vendor/bootstrap-icons/house.svg) `house` | `house` | ![home](vendor/material-symbols/home.svg) `home` |
| `:building` | ![building](vendor/bootstrap-icons/building.svg) `building` | `building` | ![apartment](vendor/material-symbols/apartment.svg) `apartment` |
| `:shop` | ![shop](vendor/bootstrap-icons/shop.svg) `shop` | `storefront` | ![storefront](vendor/material-symbols/storefront.svg) `storefront` |
| `:bank` | ![bank](vendor/bootstrap-icons/bank.svg) `bank` | `building.columns` | ![account_balance](vendor/material-symbols/account_balance.svg) `account_balance` |
| `:map` | ![map](vendor/bootstrap-icons/map.svg) `map` | `map` | ![map](vendor/material-symbols/map.svg) `map` |
| `:pin` | ![geo-alt](vendor/bootstrap-icons/geo-alt.svg) `geo-alt` | `mappin` | ![location_on](vendor/material-symbols/location_on.svg) `location_on` |
| `:globe` | ![globe](vendor/bootstrap-icons/globe.svg) `globe` | `globe` | ![public](vendor/material-symbols/public.svg) `public` |
| `:flag` | ![flag](vendor/bootstrap-icons/flag.svg) `flag` | `flag` | ![flag](vendor/material-symbols/flag.svg) `flag` |
| `:signpost` | ![signpost-split](vendor/bootstrap-icons/signpost-split.svg) `signpost-split` | `signpost.right` | ![signpost](vendor/material-symbols/signpost.svg) `signpost` |
| `:lock` | ![lock](vendor/bootstrap-icons/lock.svg) `lock` | `lock` | ![lock](vendor/material-symbols/lock.svg) `lock` |
| `:unlock` | ![unlock](vendor/bootstrap-icons/unlock.svg) `unlock` | `lock.open` | ![lock_open](vendor/material-symbols/lock_open.svg) `lock_open` |
| `:key` | ![key](vendor/bootstrap-icons/key.svg) `key` | `key` | ![key](vendor/material-symbols/key.svg) `key` |
| `:shield` | ![shield](vendor/bootstrap-icons/shield.svg) `shield` | `shield` | ![shield](vendor/material-symbols/shield.svg) `shield` |
| `:fingerprint` | ![fingerprint](vendor/bootstrap-icons/fingerprint.svg) `fingerprint` | `touchid` | ![fingerprint](vendor/material-symbols/fingerprint.svg) `fingerprint` |
| `:eye` | ![eye](vendor/bootstrap-icons/eye.svg) `eye` | `eye` | ![visibility](vendor/material-symbols/visibility.svg) `visibility` |
| `:eye_slash` | ![eye-slash](vendor/bootstrap-icons/eye-slash.svg) `eye-slash` | `eye.slash` | ![visibility_off](vendor/material-symbols/visibility_off.svg) `visibility_off` |
| `:warning` | ![exclamation-triangle](vendor/bootstrap-icons/exclamation-triangle.svg) `exclamation-triangle` | `exclamationmark.triangle` | ![warning](vendor/material-symbols/warning.svg) `warning` |
| `:info` | ![info-circle](vendor/bootstrap-icons/info-circle.svg) `info-circle` | `info.circle` | ![info](vendor/material-symbols/info.svg) `info` |
| `:question` | ![question-circle](vendor/bootstrap-icons/question-circle.svg) `question-circle` | `questionmark.circle` | ![help](vendor/material-symbols/help.svg) `help` |
| `:check_circle` | ![check-circle](vendor/bootstrap-icons/check-circle.svg) `check-circle` | `checkmark.circle` | ![check_circle](vendor/material-symbols/check_circle.svg) `check_circle` |
| `:close_circle` | ![x-circle](vendor/bootstrap-icons/x-circle.svg) `x-circle` | `xmark.circle` | ![cancel](vendor/material-symbols/cancel.svg) `cancel` |
| `:circle` | ![circle](vendor/bootstrap-icons/circle.svg) `circle` | `circle` | ![circle](vendor/material-symbols/circle.svg) `circle` |
| `:square` | ![square](vendor/bootstrap-icons/square.svg) `square` | `square` | ![square](vendor/material-symbols/square.svg) `square` |
| `:star` | ![star](vendor/bootstrap-icons/star.svg) `star` | `star` | ![star](vendor/material-symbols/star.svg) `star` |
| `:heart` | ![heart](vendor/bootstrap-icons/heart.svg) `heart` | `heart` | ![favorite](vendor/material-symbols/favorite.svg) `favorite` |
| `:bookmark` | ![bookmark](vendor/bootstrap-icons/bookmark.svg) `bookmark` | `bookmark` | ![bookmark](vendor/material-symbols/bookmark.svg) `bookmark` |
| `:thumbs_up` | ![hand-thumbs-up](vendor/bootstrap-icons/hand-thumbs-up.svg) `hand-thumbs-up` | `hand.thumbsup` | ![thumb_up](vendor/material-symbols/thumb_up.svg) `thumb_up` |
| `:thumbs_down` | ![hand-thumbs-down](vendor/bootstrap-icons/hand-thumbs-down.svg) `hand-thumbs-down` | `hand.thumbsdown` | ![thumb_down](vendor/material-symbols/thumb_down.svg) `thumb_down` |
| `:trophy` | ![trophy](vendor/bootstrap-icons/trophy.svg) `trophy` | `trophy` | ![trophy](vendor/material-symbols/trophy.svg) `trophy` |
| `:lightbulb` | ![lightbulb](vendor/bootstrap-icons/lightbulb.svg) `lightbulb` | `lightbulb` | ![lightbulb](vendor/material-symbols/lightbulb.svg) `lightbulb` |
| `:calendar` | ![calendar](vendor/bootstrap-icons/calendar.svg) `calendar` | `calendar` | ![calendar_month](vendor/material-symbols/calendar_month.svg) `calendar_month` |
| `:clock` | ![clock](vendor/bootstrap-icons/clock.svg) `clock` | `clock` | ![schedule](vendor/material-symbols/schedule.svg) `schedule` |
| `:alarm` | ![alarm](vendor/bootstrap-icons/alarm.svg) `alarm` | `alarm` | ![alarm](vendor/material-symbols/alarm.svg) `alarm` |
| `:hourglass` | ![hourglass](vendor/bootstrap-icons/hourglass.svg) `hourglass` | `hourglass` | ![hourglass_empty](vendor/material-symbols/hourglass_empty.svg) `hourglass_empty` |
| `:stopwatch` | ![stopwatch](vendor/bootstrap-icons/stopwatch.svg) `stopwatch` | `stopwatch` | ![timer](vendor/material-symbols/timer.svg) `timer` |
| `:gear` | ![gear](vendor/bootstrap-icons/gear.svg) `gear` | `gearshape` | ![settings](vendor/material-symbols/settings.svg) `settings` |
| `:sliders` | ![sliders](vendor/bootstrap-icons/sliders.svg) `sliders` | `slider.horizontal.3` | ![tune](vendor/material-symbols/tune.svg) `tune` |
| `:toolbox` | ![tools](vendor/bootstrap-icons/tools.svg) `tools` | `wrench.and.screwdriver` | ![handyman](vendor/material-symbols/handyman.svg) `handyman` |
| `:hammer` | ![hammer](vendor/bootstrap-icons/hammer.svg) `hammer` | `hammer` | ![hardware](vendor/material-symbols/hardware.svg) `hardware` |
| `:wrench` | ![wrench](vendor/bootstrap-icons/wrench.svg) `wrench` | `wrench` | ![build](vendor/material-symbols/build.svg) `build` |
| `:power` | ![power](vendor/bootstrap-icons/power.svg) `power` | `power` | ![power_settings_new](vendor/material-symbols/power_settings_new.svg) `power_settings_new` |
| `:ruler` | ![rulers](vendor/bootstrap-icons/rulers.svg) `rulers` | `ruler` | ![straighten](vendor/material-symbols/straighten.svg) `straighten` |
| `:puzzle` | ![puzzle](vendor/bootstrap-icons/puzzle.svg) `puzzle` | `puzzlepiece` | ![extension](vendor/material-symbols/extension.svg) `extension` |
| `:briefcase` | ![briefcase](vendor/bootstrap-icons/briefcase.svg) `briefcase` | `briefcase` | ![work](vendor/material-symbols/work.svg) `work` |
| `:car` | ![car-front](vendor/bootstrap-icons/car-front.svg) `car-front` | `car` | ![directions_car](vendor/material-symbols/directions_car.svg) `directions_car` |
| `:truck` | ![truck](vendor/bootstrap-icons/truck.svg) `truck` | `truck.box` | ![local_shipping](vendor/material-symbols/local_shipping.svg) `local_shipping` |
| `:bicycle` | ![bicycle](vendor/bootstrap-icons/bicycle.svg) `bicycle` | `bicycle` | ![directions_bike](vendor/material-symbols/directions_bike.svg) `directions_bike` |
| `:airplane` | ![airplane](vendor/bootstrap-icons/airplane.svg) `airplane` | `airplane` | ![flight](vendor/material-symbols/flight.svg) `flight` |
| `:train` | ![train-front](vendor/bootstrap-icons/train-front.svg) `train-front` | `train.side.front.car` | ![train](vendor/material-symbols/train.svg) `train` |
| `:bus` | ![bus-front](vendor/bootstrap-icons/bus-front.svg) `bus-front` | `bus` | ![directions_bus](vendor/material-symbols/directions_bus.svg) `directions_bus` |
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
- `data/sf-symbols.txt` — 6,584 names, from `Metadata/name_availability.plist` inside
  `SF Symbols.app`, filtered to names released in 2023 or earlier. That is the
  SF Symbols 5 line, which is what Xcode 15 resolves; a name added in 2024 or later
  would render as an empty box there.

## The artwork in the table

The Bootstrap Icons and Material Symbols columns show copies vendored under `vendor/`,
so the table renders whether or not a CDN answers. They differ from upstream in two
attributes: a grey fill, so a row reads on a light and a dark theme alike, and a 20px
box, so the columns line up. Both licences permit that, and each directory carries the
licence it came with. `rake readme` rebuilds the tables and fetches anything missing.

## Licence

MIT. See `LICENSE.txt`.
