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

## Two lists, and which one you want

```ruby
Unicon.concepts   # => [:account, :address, :agent, :airplane, :alarm, :alert, ...]
Unicon.meanings   # => [:account, :airplane, :alarm, :archive, :arrow_down, ...]
```

- `Unicon.concepts` is **every name `fetch` answers to**, the model names below included.
  It is what you check a name against.
- `Unicon.meanings` is **one name per distinct icon**, with the model names left out. It
  is what you offer somebody to choose from: a menu holding both `house` and `home`
  against the same glyph gives a person two ways to pick the same thing.

Both are sorted and frozen. `Unicon::ICONS` and `Unicon::MEANINGS` are the tables behind
them, for a caller wanting the icons as well as the names.

## Model names

A host app looks an icon up by the name of the model it is rendering, and the more names
answer, the less any app has to declare. These borrow the icons of the concept beside
them, so they resolve without swelling the list a picker offers.

<!-- models:start -->
| Model name | Concept it draws |
| --- | --- |
| `:address` | `:pin` |
| `:agent` | `:badge` |
| `:alert` | `:warning` |
| `:announcement` | `:megaphone` |
| `:answer` | `:question` |
| `:api` | `:terminal` |
| `:app` | `:window` |
| `:appointment` | `:calendar_check` |
| `:area` | `:map` |
| `:assessment` | `:clipboard` |
| `:attachment` | `:paperclip` |
| `:audio` | `:waveform` |
| `:avatar` | `:account` |
| `:backup` | `:cloud` |
| `:banner` | `:image` |
| `:bill` | `:invoice` |
| `:booking` | `:calendar_check` |
| `:brand` | `:building` |
| `:business` | `:building` |
| `:call` | `:phone` |
| `:campaign` | `:megaphone` |
| `:category` | `:tag` |
| `:charge` | `:credit_card` |
| `:city` | `:building` |
| `:client` | `:person` |
| `:comment` | `:chat` |
| `:company` | `:building` |
| `:configuration` | `:gear` |
| `:contract` | `:signature` |
| `:conversation` | `:chat` |
| `:cost` | `:cash` |
| `:country` | `:globe` |
| `:county` | `:map` |
| `:coupon` | `:gift` |
| `:credential` | `:key` |
| `:customer` | `:person` |
| `:dashboard` | `:speedometer` |
| `:deadline` | `:alarm` |
| `:delivery` | `:truck` |
| `:destination` | `:pin` |
| `:discount` | `:percent` |
| `:echo` | `:waveform` |
| `:email` | `:envelope` |
| `:employee` | `:badge` |
| `:episode` | `:playlist` |
| `:evaluation` | `:speedometer` |
| `:event` | `:calendar` |
| `:export` | `:download` |
| `:feedback` | `:smiley` |
| `:file` | `:document` |
| `:fleet` | `:truck` |
| `:form` | `:document` |
| `:franchise` | `:shop` |
| `:goal` | `:trophy` |
| `:group` | `:people` |
| `:history` | `:clock` |
| `:home` | `:house` |
| `:import` | `:upload` |
| `:integration` | `:puzzle` |
| `:inventory` | `:box` |
| `:issue` | `:warning` |
| `:item` | `:box` |
| `:job` | `:hammer` |
| `:label` | `:tag` |
| `:lead` | `:person` |
| `:location` | `:pin` |
| `:log` | `:list` |
| `:market` | `:map` |
| `:member` | `:person` |
| `:memo` | `:note` |
| `:message` | `:chat` |
| `:milestone` | `:flag` |
| `:movie` | `:video` |
| `:notification` | `:bell` |
| `:offer` | `:gift` |
| `:office` | `:building` |
| `:optimization` | `:sliders` |
| `:order` | `:cart` |
| `:organization` | `:building` |
| `:package` | `:box` |
| `:page` | `:document` |
| `:password` | `:lock` |
| `:payment` | `:credit_card` |
| `:permission` | `:key` |
| `:photo` | `:image` |
| `:picture` | `:image` |
| `:plan` | `:calendar` |
| `:platform` | `:puzzle` |
| `:plugin` | `:puzzle` |
| `:preference` | `:sliders` |
| `:price` | `:tag` |
| `:product` | `:box` |
| `:profile` | `:account` |
| `:project` | `:folder` |
| `:prompt` | `:terminal` |
| `:provider` | `:briefcase` |
| `:purchase` | `:cart` |
| `:rating` | `:star` |
| `:recording` | `:microphone` |
| `:region` | `:map` |
| `:reminder` | `:bell` |
| `:review` | `:star` |
| `:ride` | `:car` |
| `:role` | `:badge` |
| `:route` | `:signpost` |
| `:schedule` | `:calendar` |
| `:screen` | `:display` |
| `:session` | `:clock` |
| `:setting` | `:gear` |
| `:shift` | `:clock` |
| `:shipment` | `:truck` |
| `:site` | `:globe` |
| `:source` | `:signpost` |
| `:specialty` | `:award` |
| `:staff` | `:people` |
| `:state` | `:map` |
| `:subscription` | `:repeat` |
| `:summary` | `:document` |
| `:supplier` | `:truck` |
| `:survey` | `:clipboard` |
| `:sync` | `:refresh` |
| `:team` | `:people` |
| `:territory` | `:map` |
| `:todo` | `:task` |
| `:token` | `:key` |
| `:track` | `:music` |
| `:transaction` | `:credit_card` |
| `:trip` | `:map` |
| `:user` | `:person` |
| `:vehicle` | `:car` |
| `:vendor` | `:shop` |
| `:vertical` | `:bar_chart` |
| `:view` | `:eye` |
| `:zip` | `:pin` |
<!-- models:end -->

## Every concept

A concept is listed only when all three systems have a sensible icon for it. Where one
of the three has none, the concept is left out rather than filled in with something
close — an agent is a badge rather than a robot here, because Bootstrap and Material
both draw a robot and SF Symbols has none.

The SF Symbols are shown under section 2.11 of the Xcode and Apple SDKs Agreement, which
licenses them for developing applications for Apple-branded products, and this repository
is part of building one. They may not be redistributed for any other purpose, so anyone
reusing this gem outside that context should show the names alone.

<!-- concepts:start -->
| Concept | Bootstrap Icons | SF Symbols | Material Symbols |
| --- | --- | --- | --- |
| `:search` | ![search](vendor/bootstrap-icons/search.svg) `search` | ![magnifyingglass](vendor/sf-symbols/magnifyingglass.png) `magnifyingglass` | ![search](vendor/material-symbols/search.svg) `search` |
| `:plus` | ![plus](vendor/bootstrap-icons/plus.svg) `plus` | ![plus](vendor/sf-symbols/plus.png) `plus` | ![add](vendor/material-symbols/add.svg) `add` |
| `:minus` | ![dash](vendor/bootstrap-icons/dash.svg) `dash` | ![minus](vendor/sf-symbols/minus.png) `minus` | ![remove](vendor/material-symbols/remove.svg) `remove` |
| `:check` | ![check](vendor/bootstrap-icons/check.svg) `check` | ![checkmark](vendor/sf-symbols/checkmark.png) `checkmark` | ![check](vendor/material-symbols/check.svg) `check` |
| `:close` | ![x](vendor/bootstrap-icons/x.svg) `x` | ![xmark](vendor/sf-symbols/xmark.png) `xmark` | ![close](vendor/material-symbols/close.svg) `close` |
| `:pencil` | ![pencil](vendor/bootstrap-icons/pencil.svg) `pencil` | ![pencil](vendor/sf-symbols/pencil.png) `pencil` | ![edit](vendor/material-symbols/edit.svg) `edit` |
| `:trash` | ![trash](vendor/bootstrap-icons/trash.svg) `trash` | ![trash](vendor/sf-symbols/trash.png) `trash` | ![delete](vendor/material-symbols/delete.svg) `delete` |
| `:filter` | ![funnel](vendor/bootstrap-icons/funnel.svg) `funnel` | ![line.3.horizontal.decrease](vendor/sf-symbols/line.3.horizontal.decrease.png) `line.3.horizontal.decrease` | ![filter_alt](vendor/material-symbols/filter_alt.svg) `filter_alt` |
| `:sort` | ![sort-down](vendor/bootstrap-icons/sort-down.svg) `sort-down` | ![arrow.up.arrow.down](vendor/sf-symbols/arrow.up.arrow.down.png) `arrow.up.arrow.down` | ![sort](vendor/material-symbols/sort.svg) `sort` |
| `:download` | ![download](vendor/bootstrap-icons/download.svg) `download` | ![arrow.down.circle](vendor/sf-symbols/arrow.down.circle.png) `arrow.down.circle` | ![download](vendor/material-symbols/download.svg) `download` |
| `:upload` | ![upload](vendor/bootstrap-icons/upload.svg) `upload` | ![arrow.up.circle](vendor/sf-symbols/arrow.up.circle.png) `arrow.up.circle` | ![upload](vendor/material-symbols/upload.svg) `upload` |
| `:share` | ![share](vendor/bootstrap-icons/share.svg) `share` | ![square.and.arrow.up](vendor/sf-symbols/square.and.arrow.up.png) `square.and.arrow.up` | ![share](vendor/material-symbols/share.svg) `share` |
| `:link` | ![link](vendor/bootstrap-icons/link.svg) `link` | ![link](vendor/sf-symbols/link.png) `link` | ![link](vendor/material-symbols/link.svg) `link` |
| `:copy` | ![copy](vendor/bootstrap-icons/copy.svg) `copy` | ![doc.on.doc](vendor/sf-symbols/doc.on.doc.png) `doc.on.doc` | ![content_copy](vendor/material-symbols/content_copy.svg) `content_copy` |
| `:printer` | ![printer](vendor/bootstrap-icons/printer.svg) `printer` | ![printer](vendor/sf-symbols/printer.png) `printer` | ![print](vendor/material-symbols/print.svg) `print` |
| `:refresh` | ![arrow-clockwise](vendor/bootstrap-icons/arrow-clockwise.svg) `arrow-clockwise` | ![arrow.clockwise](vendor/sf-symbols/arrow.clockwise.png) `arrow.clockwise` | ![refresh](vendor/material-symbols/refresh.svg) `refresh` |
| `:undo` | ![arrow-counterclockwise](vendor/bootstrap-icons/arrow-counterclockwise.svg) `arrow-counterclockwise` | ![arrow.uturn.backward](vendor/sf-symbols/arrow.uturn.backward.png) `arrow.uturn.backward` | ![undo](vendor/material-symbols/undo.svg) `undo` |
| `:zoom_in` | ![zoom-in](vendor/bootstrap-icons/zoom-in.svg) `zoom-in` | ![plus.magnifyingglass](vendor/sf-symbols/plus.magnifyingglass.png) `plus.magnifyingglass` | ![zoom_in](vendor/material-symbols/zoom_in.svg) `zoom_in` |
| `:zoom_out` | ![zoom-out](vendor/bootstrap-icons/zoom-out.svg) `zoom-out` | ![minus.magnifyingglass](vendor/sf-symbols/minus.magnifyingglass.png) `minus.magnifyingglass` | ![zoom_out](vendor/material-symbols/zoom_out.svg) `zoom_out` |
| `:scissors` | ![scissors](vendor/bootstrap-icons/scissors.svg) `scissors` | ![scissors](vendor/sf-symbols/scissors.png) `scissors` | ![content_cut](vendor/material-symbols/content_cut.svg) `content_cut` |
| `:shuffle` | ![shuffle](vendor/bootstrap-icons/shuffle.svg) `shuffle` | ![shuffle](vendor/sf-symbols/shuffle.png) `shuffle` | ![shuffle](vendor/material-symbols/shuffle.svg) `shuffle` |
| `:repeat` | ![repeat](vendor/bootstrap-icons/repeat.svg) `repeat` | ![repeat](vendor/sf-symbols/repeat.png) `repeat` | ![repeat](vendor/material-symbols/repeat.svg) `repeat` |
| `:task` | ![check2-square](vendor/bootstrap-icons/check2-square.svg) `check2-square` | ![checklist](vendor/sf-symbols/checklist.png) `checklist` | ![task_alt](vendor/material-symbols/task_alt.svg) `task_alt` |
| `:chevron_up` | ![chevron-up](vendor/bootstrap-icons/chevron-up.svg) `chevron-up` | ![chevron.up](vendor/sf-symbols/chevron.up.png) `chevron.up` | ![keyboard_arrow_up](vendor/material-symbols/keyboard_arrow_up.svg) `keyboard_arrow_up` |
| `:chevron_down` | ![chevron-down](vendor/bootstrap-icons/chevron-down.svg) `chevron-down` | ![chevron.down](vendor/sf-symbols/chevron.down.png) `chevron.down` | ![keyboard_arrow_down](vendor/material-symbols/keyboard_arrow_down.svg) `keyboard_arrow_down` |
| `:chevron_left` | ![chevron-left](vendor/bootstrap-icons/chevron-left.svg) `chevron-left` | ![chevron.left](vendor/sf-symbols/chevron.left.png) `chevron.left` | ![keyboard_arrow_left](vendor/material-symbols/keyboard_arrow_left.svg) `keyboard_arrow_left` |
| `:chevron_right` | ![chevron-right](vendor/bootstrap-icons/chevron-right.svg) `chevron-right` | ![chevron.right](vendor/sf-symbols/chevron.right.png) `chevron.right` | ![keyboard_arrow_right](vendor/material-symbols/keyboard_arrow_right.svg) `keyboard_arrow_right` |
| `:arrow_up` | ![arrow-up](vendor/bootstrap-icons/arrow-up.svg) `arrow-up` | ![arrow.up](vendor/sf-symbols/arrow.up.png) `arrow.up` | ![arrow_upward](vendor/material-symbols/arrow_upward.svg) `arrow_upward` |
| `:arrow_down` | ![arrow-down](vendor/bootstrap-icons/arrow-down.svg) `arrow-down` | ![arrow.down](vendor/sf-symbols/arrow.down.png) `arrow.down` | ![arrow_downward](vendor/material-symbols/arrow_downward.svg) `arrow_downward` |
| `:arrow_left` | ![arrow-left](vendor/bootstrap-icons/arrow-left.svg) `arrow-left` | ![arrow.left](vendor/sf-symbols/arrow.left.png) `arrow.left` | ![arrow_back](vendor/material-symbols/arrow_back.svg) `arrow_back` |
| `:arrow_right` | ![arrow-right](vendor/bootstrap-icons/arrow-right.svg) `arrow-right` | ![arrow.right](vendor/sf-symbols/arrow.right.png) `arrow.right` | ![arrow_forward](vendor/material-symbols/arrow_forward.svg) `arrow_forward` |
| `:bar_chart` | ![bar-chart](vendor/bootstrap-icons/bar-chart.svg) `bar-chart` | ![chart.bar](vendor/sf-symbols/chart.bar.png) `chart.bar` | ![bar_chart](vendor/material-symbols/bar_chart.svg) `bar_chart` |
| `:pie_chart` | ![pie-chart](vendor/bootstrap-icons/pie-chart.svg) `pie-chart` | ![chart.pie](vendor/sf-symbols/chart.pie.png) `chart.pie` | ![pie_chart](vendor/material-symbols/pie_chart.svg) `pie_chart` |
| `:trending_up` | ![graph-up](vendor/bootstrap-icons/graph-up.svg) `graph-up` | ![chart.line.uptrend.xyaxis](vendor/sf-symbols/chart.line.uptrend.xyaxis.png) `chart.line.uptrend.xyaxis` | ![trending_up](vendor/material-symbols/trending_up.svg) `trending_up` |
| `:speedometer` | ![speedometer](vendor/bootstrap-icons/speedometer.svg) `speedometer` | ![gauge](vendor/sf-symbols/gauge.png) `gauge` | ![speed](vendor/material-symbols/speed.svg) `speed` |
| `:cart` | ![cart](vendor/bootstrap-icons/cart.svg) `cart` | ![cart](vendor/sf-symbols/cart.png) `cart` | ![shopping_cart](vendor/material-symbols/shopping_cart.svg) `shopping_cart` |
| `:bag` | ![bag](vendor/bootstrap-icons/bag.svg) `bag` | ![bag](vendor/sf-symbols/bag.png) `bag` | ![shopping_bag](vendor/material-symbols/shopping_bag.svg) `shopping_bag` |
| `:tag` | ![tag](vendor/bootstrap-icons/tag.svg) `tag` | ![tag](vendor/sf-symbols/tag.png) `tag` | ![sell](vendor/material-symbols/sell.svg) `sell` |
| `:credit_card` | ![credit-card](vendor/bootstrap-icons/credit-card.svg) `credit-card` | ![creditcard](vendor/sf-symbols/creditcard.png) `creditcard` | ![credit_card](vendor/material-symbols/credit_card.svg) `credit_card` |
| `:cash` | ![cash](vendor/bootstrap-icons/cash.svg) `cash` | ![banknote](vendor/sf-symbols/banknote.png) `banknote` | ![payments](vendor/material-symbols/payments.svg) `payments` |
| `:wallet` | ![wallet](vendor/bootstrap-icons/wallet.svg) `wallet` | ![wallet.pass](vendor/sf-symbols/wallet.pass.png) `wallet.pass` | ![wallet](vendor/material-symbols/wallet.svg) `wallet` |
| `:gift` | ![gift](vendor/bootstrap-icons/gift.svg) `gift` | ![gift](vendor/sf-symbols/gift.png) `gift` | ![redeem](vendor/material-symbols/redeem.svg) `redeem` |
| `:percent` | ![percent](vendor/bootstrap-icons/percent.svg) `percent` | ![percent](vendor/sf-symbols/percent.png) `percent` | ![percent](vendor/material-symbols/percent.svg) `percent` |
| `:ticket` | ![ticket](vendor/bootstrap-icons/ticket.svg) `ticket` | ![ticket](vendor/sf-symbols/ticket.png) `ticket` | ![confirmation_number](vendor/material-symbols/confirmation_number.svg) `confirmation_number` |
| `:barcode` | ![upc](vendor/bootstrap-icons/upc.svg) `upc` | ![barcode](vendor/sf-symbols/barcode.png) `barcode` | ![barcode](vendor/material-symbols/barcode.svg) `barcode` |
| `:qr_code` | ![qr-code](vendor/bootstrap-icons/qr-code.svg) `qr-code` | ![qrcode](vendor/sf-symbols/qrcode.png) `qrcode` | ![qr_code](vendor/material-symbols/qr_code.svg) `qr_code` |
| `:receipt` | ![receipt](vendor/bootstrap-icons/receipt.svg) `receipt` | `receipt` † | ![receipt](vendor/material-symbols/receipt.svg) `receipt` |
| `:invoice` | ![file-earmark-text](vendor/bootstrap-icons/file-earmark-text.svg) `file-earmark-text` | ![doc.text](vendor/sf-symbols/doc.text.png) `doc.text` | ![receipt_long](vendor/material-symbols/receipt_long.svg) `receipt_long` |
| `:phone` | ![telephone](vendor/bootstrap-icons/telephone.svg) `telephone` | ![phone](vendor/sf-symbols/phone.png) `phone` | ![call](vendor/material-symbols/call.svg) `call` |
| `:mobile` | ![phone](vendor/bootstrap-icons/phone.svg) `phone` | ![smartphone](vendor/sf-symbols/smartphone.png) `smartphone` | ![mobile](vendor/material-symbols/mobile.svg) `mobile` |
| `:envelope` | ![envelope](vendor/bootstrap-icons/envelope.svg) `envelope` | ![envelope](vendor/sf-symbols/envelope.png) `envelope` | ![mail](vendor/material-symbols/mail.svg) `mail` |
| `:chat` | ![chat](vendor/bootstrap-icons/chat.svg) `chat` | ![message](vendor/sf-symbols/message.png) `message` | ![chat](vendor/material-symbols/chat.svg) `chat` |
| `:bell` | ![bell](vendor/bootstrap-icons/bell.svg) `bell` | ![bell](vendor/sf-symbols/bell.png) `bell` | ![notifications](vendor/material-symbols/notifications.svg) `notifications` |
| `:megaphone` | ![megaphone](vendor/bootstrap-icons/megaphone.svg) `megaphone` | ![megaphone](vendor/sf-symbols/megaphone.png) `megaphone` | ![campaign](vendor/material-symbols/campaign.svg) `campaign` |
| `:send` | ![send](vendor/bootstrap-icons/send.svg) `send` | ![paperplane](vendor/sf-symbols/paperplane.png) `paperplane` | ![send](vendor/material-symbols/send.svg) `send` |
| `:inbox` | ![inbox](vendor/bootstrap-icons/inbox.svg) `inbox` | ![tray](vendor/sf-symbols/tray.png) `tray` | ![inbox](vendor/material-symbols/inbox.svg) `inbox` |
| `:reply` | ![reply](vendor/bootstrap-icons/reply.svg) `reply` | ![arrowshape.turn.up.left](vendor/sf-symbols/arrowshape.turn.up.left.png) `arrowshape.turn.up.left` | ![reply](vendor/material-symbols/reply.svg) `reply` |
| `:laptop` | ![laptop](vendor/bootstrap-icons/laptop.svg) `laptop` | ![laptopcomputer](vendor/sf-symbols/laptopcomputer.png) `laptopcomputer` | ![computer](vendor/material-symbols/computer.svg) `computer` |
| `:keyboard` | ![keyboard](vendor/bootstrap-icons/keyboard.svg) `keyboard` | ![keyboard](vendor/sf-symbols/keyboard.png) `keyboard` | ![keyboard](vendor/material-symbols/keyboard.svg) `keyboard` |
| `:display` | ![display](vendor/bootstrap-icons/display.svg) `display` | ![display](vendor/sf-symbols/display.png) `display` | ![monitor](vendor/material-symbols/monitor.svg) `monitor` |
| `:server` | ![hdd-rack](vendor/bootstrap-icons/hdd-rack.svg) `hdd-rack` | ![server.rack](vendor/sf-symbols/server.rack.png) `server.rack` | ![dns](vendor/material-symbols/dns.svg) `dns` |
| `:cloud` | ![cloud](vendor/bootstrap-icons/cloud.svg) `cloud` | ![cloud](vendor/sf-symbols/cloud.png) `cloud` | ![cloud](vendor/material-symbols/cloud.svg) `cloud` |
| `:wifi` | ![wifi](vendor/bootstrap-icons/wifi.svg) `wifi` | ![wifi](vendor/sf-symbols/wifi.png) `wifi` | ![wifi](vendor/material-symbols/wifi.svg) `wifi` |
| `:battery` | ![battery](vendor/bootstrap-icons/battery.svg) `battery` | ![battery.100](vendor/sf-symbols/battery.100.png) `battery.100` | ![battery_full](vendor/material-symbols/battery_full.svg) `battery_full` |
| `:terminal` | ![terminal](vendor/bootstrap-icons/terminal.svg) `terminal` | ![terminal](vendor/sf-symbols/terminal.png) `terminal` | ![terminal](vendor/material-symbols/terminal.svg) `terminal` |
| `:document` | ![file-earmark](vendor/bootstrap-icons/file-earmark.svg) `file-earmark` | ![doc](vendor/sf-symbols/doc.png) `doc` | ![description](vendor/material-symbols/description.svg) `description` |
| `:folder` | ![folder](vendor/bootstrap-icons/folder.svg) `folder` | ![folder](vendor/sf-symbols/folder.png) `folder` | ![folder](vendor/material-symbols/folder.svg) `folder` |
| `:archive` | ![archive](vendor/bootstrap-icons/archive.svg) `archive` | ![archivebox](vendor/sf-symbols/archivebox.png) `archivebox` | ![archive](vendor/material-symbols/archive.svg) `archive` |
| `:clipboard` | ![clipboard](vendor/bootstrap-icons/clipboard.svg) `clipboard` | ![list.clipboard](vendor/sf-symbols/list.clipboard.png) `list.clipboard` | ![content_paste](vendor/material-symbols/content_paste.svg) `content_paste` |
| `:book` | ![book](vendor/bootstrap-icons/book.svg) `book` | ![book](vendor/sf-symbols/book.png) `book` | ![book](vendor/material-symbols/book.svg) `book` |
| `:note` | ![sticky](vendor/bootstrap-icons/sticky.svg) `sticky` | ![note.text](vendor/sf-symbols/note.text.png) `note.text` | ![sticky_note_2](vendor/material-symbols/sticky_note_2.svg) `sticky_note_2` |
| `:paperclip` | ![paperclip](vendor/bootstrap-icons/paperclip.svg) `paperclip` | ![paperclip](vendor/sf-symbols/paperclip.png) `paperclip` | ![attach_file](vendor/material-symbols/attach_file.svg) `attach_file` |
| `:signature` | ![pen](vendor/bootstrap-icons/pen.svg) `pen` | ![signature](vendor/sf-symbols/signature.png) `signature` | ![draw](vendor/material-symbols/draw.svg) `draw` |
| `:box` | ![box](vendor/bootstrap-icons/box.svg) `box` | ![shippingbox](vendor/sf-symbols/shippingbox.png) `shippingbox` | ![inventory_2](vendor/material-symbols/inventory_2.svg) `inventory_2` |
| `:table` | ![table](vendor/bootstrap-icons/table.svg) `table` | ![tablecells](vendor/sf-symbols/tablecells.png) `tablecells` | ![table_chart](vendor/material-symbols/table_chart.svg) `table_chart` |
| `:list` | ![list-ul](vendor/bootstrap-icons/list-ul.svg) `list-ul` | ![list.bullet](vendor/sf-symbols/list.bullet.png) `list.bullet` | ![list](vendor/material-symbols/list.svg) `list` |
| `:grid` | ![grid](vendor/bootstrap-icons/grid.svg) `grid` | ![square.grid.2x2](vendor/sf-symbols/square.grid.2x2.png) `square.grid.2x2` | ![grid_view](vendor/material-symbols/grid_view.svg) `grid_view` |
| `:menu` | ![list](vendor/bootstrap-icons/list.svg) `list` | ![line.3.horizontal](vendor/sf-symbols/line.3.horizontal.png) `line.3.horizontal` | ![menu](vendor/material-symbols/menu.svg) `menu` |
| `:window` | ![window](vendor/bootstrap-icons/window.svg) `window` | ![macwindow](vendor/sf-symbols/macwindow.png) `macwindow` | ![web_asset](vendor/material-symbols/web_asset.svg) `web_asset` |
| `:sidebar` | ![layout-sidebar](vendor/bootstrap-icons/layout-sidebar.svg) `layout-sidebar` | ![sidebar.left](vendor/sf-symbols/sidebar.left.png) `sidebar.left` | ![view_sidebar](vendor/material-symbols/view_sidebar.svg) `view_sidebar` |
| `:ellipsis` | ![three-dots](vendor/bootstrap-icons/three-dots.svg) `three-dots` | ![ellipsis](vendor/sf-symbols/ellipsis.png) `ellipsis` | ![more_horiz](vendor/material-symbols/more_horiz.svg) `more_horiz` |
| `:camera` | ![camera](vendor/bootstrap-icons/camera.svg) `camera` | ![camera](vendor/sf-symbols/camera.png) `camera` | ![photo_camera](vendor/material-symbols/photo_camera.svg) `photo_camera` |
| `:image` | ![image](vendor/bootstrap-icons/image.svg) `image` | ![photo](vendor/sf-symbols/photo.png) `photo` | ![image](vendor/material-symbols/image.svg) `image` |
| `:video` | ![camera-video](vendor/bootstrap-icons/camera-video.svg) `camera-video` | ![video](vendor/sf-symbols/video.png) `video` | ![videocam](vendor/material-symbols/videocam.svg) `videocam` |
| `:microphone` | ![mic](vendor/bootstrap-icons/mic.svg) `mic` | ![mic](vendor/sf-symbols/mic.png) `mic` | ![mic](vendor/material-symbols/mic.svg) `mic` |
| `:play` | ![play](vendor/bootstrap-icons/play.svg) `play` | ![play](vendor/sf-symbols/play.png) `play` | ![play_arrow](vendor/material-symbols/play_arrow.svg) `play_arrow` |
| `:pause` | ![pause](vendor/bootstrap-icons/pause.svg) `pause` | ![pause](vendor/sf-symbols/pause.png) `pause` | ![pause](vendor/material-symbols/pause.svg) `pause` |
| `:stop` | ![stop](vendor/bootstrap-icons/stop.svg) `stop` | ![stop](vendor/sf-symbols/stop.png) `stop` | ![stop](vendor/material-symbols/stop.svg) `stop` |
| `:skip_next` | ![skip-forward](vendor/bootstrap-icons/skip-forward.svg) `skip-forward` | ![forward.end](vendor/sf-symbols/forward.end.png) `forward.end` | ![skip_next](vendor/material-symbols/skip_next.svg) `skip_next` |
| `:playlist` | ![collection-play](vendor/bootstrap-icons/collection-play.svg) `collection-play` | ![play.square.stack](vendor/sf-symbols/play.square.stack.png) `play.square.stack` | ![video_library](vendor/material-symbols/video_library.svg) `video_library` |
| `:waveform` | ![soundwave](vendor/bootstrap-icons/soundwave.svg) `soundwave` | ![waveform](vendor/sf-symbols/waveform.png) `waveform` | ![graphic_eq](vendor/material-symbols/graphic_eq.svg) `graphic_eq` |
| `:music` | ![music-note](vendor/bootstrap-icons/music-note.svg) `music-note` | ![music.note](vendor/sf-symbols/music.note.png) `music.note` | ![music_note](vendor/material-symbols/music_note.svg) `music_note` |
| `:volume` | ![volume-up](vendor/bootstrap-icons/volume-up.svg) `volume-up` | ![speaker.wave.2](vendor/sf-symbols/speaker.wave.2.png) `speaker.wave.2` | ![volume_up](vendor/material-symbols/volume_up.svg) `volume_up` |
| `:headphones` | ![headphones](vendor/bootstrap-icons/headphones.svg) `headphones` | ![headphones](vendor/sf-symbols/headphones.png) `headphones` | ![headphones](vendor/material-symbols/headphones.svg) `headphones` |
| `:palette` | ![palette](vendor/bootstrap-icons/palette.svg) `palette` | ![paintpalette](vendor/sf-symbols/paintpalette.png) `paintpalette` | ![palette](vendor/material-symbols/palette.svg) `palette` |
| `:brush` | ![brush](vendor/bootstrap-icons/brush.svg) `brush` | ![paintbrush](vendor/sf-symbols/paintbrush.png) `paintbrush` | ![brush](vendor/material-symbols/brush.svg) `brush` |
| `:sun` | ![sun](vendor/bootstrap-icons/sun.svg) `sun` | ![sun.max](vendor/sf-symbols/sun.max.png) `sun.max` | ![light_mode](vendor/material-symbols/light_mode.svg) `light_mode` |
| `:moon` | ![moon](vendor/bootstrap-icons/moon.svg) `moon` | ![moon](vendor/sf-symbols/moon.png) `moon` | ![dark_mode](vendor/material-symbols/dark_mode.svg) `dark_mode` |
| `:rain` | ![cloud-rain](vendor/bootstrap-icons/cloud-rain.svg) `cloud-rain` | ![cloud.rain](vendor/sf-symbols/cloud.rain.png) `cloud.rain` | ![rainy](vendor/material-symbols/rainy.svg) `rainy` |
| `:fire` | ![fire](vendor/bootstrap-icons/fire.svg) `fire` | ![flame](vendor/sf-symbols/flame.png) `flame` | ![local_fire_department](vendor/material-symbols/local_fire_department.svg) `local_fire_department` |
| `:droplet` | ![droplet](vendor/bootstrap-icons/droplet.svg) `droplet` | ![drop](vendor/sf-symbols/drop.png) `drop` | ![water_drop](vendor/material-symbols/water_drop.svg) `water_drop` |
| `:bolt` | ![lightning](vendor/bootstrap-icons/lightning.svg) `lightning` | ![bolt](vendor/sf-symbols/bolt.png) `bolt` | ![bolt](vendor/material-symbols/bolt.svg) `bolt` |
| `:snow` | ![snow](vendor/bootstrap-icons/snow.svg) `snow` | ![snowflake](vendor/sf-symbols/snowflake.png) `snowflake` | ![weather_snowy](vendor/material-symbols/weather_snowy.svg) `weather_snowy` |
| `:tree` | ![tree](vendor/bootstrap-icons/tree.svg) `tree` | ![tree](vendor/sf-symbols/tree.png) `tree` | ![park](vendor/material-symbols/park.svg) `park` |
| `:person` | ![person](vendor/bootstrap-icons/person.svg) `person` | ![person](vendor/sf-symbols/person.png) `person` | ![person](vendor/material-symbols/person.svg) `person` |
| `:people` | ![people](vendor/bootstrap-icons/people.svg) `people` | ![person.2](vendor/sf-symbols/person.2.png) `person.2` | ![group](vendor/material-symbols/group.svg) `group` |
| `:person_add` | ![person-plus](vendor/bootstrap-icons/person-plus.svg) `person-plus` | ![person.badge.plus](vendor/sf-symbols/person.badge.plus.png) `person.badge.plus` | ![person_add](vendor/material-symbols/person_add.svg) `person_add` |
| `:person_remove` | ![person-dash](vendor/bootstrap-icons/person-dash.svg) `person-dash` | ![person.badge.minus](vendor/sf-symbols/person.badge.minus.png) `person.badge.minus` | ![person_remove](vendor/material-symbols/person_remove.svg) `person_remove` |
| `:account` | ![person-circle](vendor/bootstrap-icons/person-circle.svg) `person-circle` | ![person.crop.circle](vendor/sf-symbols/person.crop.circle.png) `person.crop.circle` | ![account_circle](vendor/material-symbols/account_circle.svg) `account_circle` |
| `:badge` | ![person-vcard](vendor/bootstrap-icons/person-vcard.svg) `person-vcard` | ![person.text.rectangle](vendor/sf-symbols/person.text.rectangle.png) `person.text.rectangle` | ![badge](vendor/material-symbols/badge.svg) `badge` |
| `:contact` | ![person-rolodex](vendor/bootstrap-icons/person-rolodex.svg) `person-rolodex` | ![person.crop.circle](vendor/sf-symbols/person.crop.circle.png) `person.crop.circle` | ![contacts](vendor/material-symbols/contacts.svg) `contacts` |
| `:house` | ![house](vendor/bootstrap-icons/house.svg) `house` | ![house](vendor/sf-symbols/house.png) `house` | ![home](vendor/material-symbols/home.svg) `home` |
| `:building` | ![building](vendor/bootstrap-icons/building.svg) `building` | ![building](vendor/sf-symbols/building.png) `building` | ![apartment](vendor/material-symbols/apartment.svg) `apartment` |
| `:shop` | ![shop](vendor/bootstrap-icons/shop.svg) `shop` | ![storefront](vendor/sf-symbols/storefront.png) `storefront` | ![storefront](vendor/material-symbols/storefront.svg) `storefront` |
| `:bank` | ![bank](vendor/bootstrap-icons/bank.svg) `bank` | ![building.columns](vendor/sf-symbols/building.columns.png) `building.columns` | ![account_balance](vendor/material-symbols/account_balance.svg) `account_balance` |
| `:map` | ![map](vendor/bootstrap-icons/map.svg) `map` | ![map](vendor/sf-symbols/map.png) `map` | ![map](vendor/material-symbols/map.svg) `map` |
| `:pin` | ![geo-alt](vendor/bootstrap-icons/geo-alt.svg) `geo-alt` | ![mappin](vendor/sf-symbols/mappin.png) `mappin` | ![location_on](vendor/material-symbols/location_on.svg) `location_on` |
| `:globe` | ![globe](vendor/bootstrap-icons/globe.svg) `globe` | ![globe](vendor/sf-symbols/globe.png) `globe` | ![public](vendor/material-symbols/public.svg) `public` |
| `:flag` | ![flag](vendor/bootstrap-icons/flag.svg) `flag` | ![flag](vendor/sf-symbols/flag.png) `flag` | ![flag](vendor/material-symbols/flag.svg) `flag` |
| `:signpost` | ![signpost-split](vendor/bootstrap-icons/signpost-split.svg) `signpost-split` | ![signpost.right](vendor/sf-symbols/signpost.right.png) `signpost.right` | ![signpost](vendor/material-symbols/signpost.svg) `signpost` |
| `:hospital` | ![hospital](vendor/bootstrap-icons/hospital.svg) `hospital` | ![cross.case](vendor/sf-symbols/cross.case.png) `cross.case` | ![local_hospital](vendor/material-symbols/local_hospital.svg) `local_hospital` |
| `:compass` | ![compass](vendor/bootstrap-icons/compass.svg) `compass` | ![location.north.circle](vendor/sf-symbols/location.north.circle.png) `location.north.circle` | ![explore](vendor/material-symbols/explore.svg) `explore` |
| `:lock` | ![lock](vendor/bootstrap-icons/lock.svg) `lock` | ![lock](vendor/sf-symbols/lock.png) `lock` | ![lock](vendor/material-symbols/lock.svg) `lock` |
| `:unlock` | ![unlock](vendor/bootstrap-icons/unlock.svg) `unlock` | ![lock.open](vendor/sf-symbols/lock.open.png) `lock.open` | ![lock_open](vendor/material-symbols/lock_open.svg) `lock_open` |
| `:key` | ![key](vendor/bootstrap-icons/key.svg) `key` | ![key](vendor/sf-symbols/key.png) `key` | ![key](vendor/material-symbols/key.svg) `key` |
| `:shield` | ![shield](vendor/bootstrap-icons/shield.svg) `shield` | ![shield](vendor/sf-symbols/shield.png) `shield` | ![shield](vendor/material-symbols/shield.svg) `shield` |
| `:fingerprint` | ![fingerprint](vendor/bootstrap-icons/fingerprint.svg) `fingerprint` | ![touchid](vendor/sf-symbols/touchid.png) `touchid` | ![fingerprint](vendor/material-symbols/fingerprint.svg) `fingerprint` |
| `:login` | ![box-arrow-in-right](vendor/bootstrap-icons/box-arrow-in-right.svg) `box-arrow-in-right` | ![rectangle.portrait.and.arrow.forward](vendor/sf-symbols/rectangle.portrait.and.arrow.forward.png) `rectangle.portrait.and.arrow.forward` | ![login](vendor/material-symbols/login.svg) `login` |
| `:logout` | ![box-arrow-right](vendor/bootstrap-icons/box-arrow-right.svg) `box-arrow-right` | ![rectangle.portrait.and.arrow.right](vendor/sf-symbols/rectangle.portrait.and.arrow.right.png) `rectangle.portrait.and.arrow.right` | ![logout](vendor/material-symbols/logout.svg) `logout` |
| `:eye` | ![eye](vendor/bootstrap-icons/eye.svg) `eye` | ![eye](vendor/sf-symbols/eye.png) `eye` | ![visibility](vendor/material-symbols/visibility.svg) `visibility` |
| `:eye_slash` | ![eye-slash](vendor/bootstrap-icons/eye-slash.svg) `eye-slash` | ![eye.slash](vendor/sf-symbols/eye.slash.png) `eye.slash` | ![visibility_off](vendor/material-symbols/visibility_off.svg) `visibility_off` |
| `:warning` | ![exclamation-triangle](vendor/bootstrap-icons/exclamation-triangle.svg) `exclamation-triangle` | ![exclamationmark.triangle](vendor/sf-symbols/exclamationmark.triangle.png) `exclamationmark.triangle` | ![warning](vendor/material-symbols/warning.svg) `warning` |
| `:info` | ![info-circle](vendor/bootstrap-icons/info-circle.svg) `info-circle` | ![info.circle](vendor/sf-symbols/info.circle.png) `info.circle` | ![info](vendor/material-symbols/info.svg) `info` |
| `:question` | ![question-circle](vendor/bootstrap-icons/question-circle.svg) `question-circle` | ![questionmark.circle](vendor/sf-symbols/questionmark.circle.png) `questionmark.circle` | ![help](vendor/material-symbols/help.svg) `help` |
| `:check_circle` | ![check-circle](vendor/bootstrap-icons/check-circle.svg) `check-circle` | ![checkmark.circle](vendor/sf-symbols/checkmark.circle.png) `checkmark.circle` | ![check_circle](vendor/material-symbols/check_circle.svg) `check_circle` |
| `:close_circle` | ![x-circle](vendor/bootstrap-icons/x-circle.svg) `x-circle` | ![xmark.circle](vendor/sf-symbols/xmark.circle.png) `xmark.circle` | ![cancel](vendor/material-symbols/cancel.svg) `cancel` |
| `:circle` | ![circle](vendor/bootstrap-icons/circle.svg) `circle` | ![circle](vendor/sf-symbols/circle.png) `circle` | ![circle](vendor/material-symbols/circle.svg) `circle` |
| `:square` | ![square](vendor/bootstrap-icons/square.svg) `square` | ![square](vendor/sf-symbols/square.png) `square` | ![square](vendor/material-symbols/square.svg) `square` |
| `:star` | ![star](vendor/bootstrap-icons/star.svg) `star` | ![star](vendor/sf-symbols/star.png) `star` | ![star](vendor/material-symbols/star.svg) `star` |
| `:heart` | ![heart](vendor/bootstrap-icons/heart.svg) `heart` | ![heart](vendor/sf-symbols/heart.png) `heart` | ![favorite](vendor/material-symbols/favorite.svg) `favorite` |
| `:bookmark` | ![bookmark](vendor/bootstrap-icons/bookmark.svg) `bookmark` | ![bookmark](vendor/sf-symbols/bookmark.png) `bookmark` | ![bookmark](vendor/material-symbols/bookmark.svg) `bookmark` |
| `:thumbs_up` | ![hand-thumbs-up](vendor/bootstrap-icons/hand-thumbs-up.svg) `hand-thumbs-up` | ![hand.thumbsup](vendor/sf-symbols/hand.thumbsup.png) `hand.thumbsup` | ![thumb_up](vendor/material-symbols/thumb_up.svg) `thumb_up` |
| `:thumbs_down` | ![hand-thumbs-down](vendor/bootstrap-icons/hand-thumbs-down.svg) `hand-thumbs-down` | ![hand.thumbsdown](vendor/sf-symbols/hand.thumbsdown.png) `hand.thumbsdown` | ![thumb_down](vendor/material-symbols/thumb_down.svg) `thumb_down` |
| `:trophy` | ![trophy](vendor/bootstrap-icons/trophy.svg) `trophy` | ![trophy](vendor/sf-symbols/trophy.png) `trophy` | ![trophy](vendor/material-symbols/trophy.svg) `trophy` |
| `:lightbulb` | ![lightbulb](vendor/bootstrap-icons/lightbulb.svg) `lightbulb` | ![lightbulb](vendor/sf-symbols/lightbulb.png) `lightbulb` | ![lightbulb](vendor/material-symbols/lightbulb.svg) `lightbulb` |
| `:smiley` | ![emoji-smile](vendor/bootstrap-icons/emoji-smile.svg) `emoji-smile` | ![face.smiling](vendor/sf-symbols/face.smiling.png) `face.smiling` | ![sentiment_satisfied](vendor/material-symbols/sentiment_satisfied.svg) `sentiment_satisfied` |
| `:award` | ![award](vendor/bootstrap-icons/award.svg) `award` | ![rosette](vendor/sf-symbols/rosette.png) `rosette` | ![workspace_premium](vendor/material-symbols/workspace_premium.svg) `workspace_premium` |
| `:infinity` | ![infinity](vendor/bootstrap-icons/infinity.svg) `infinity` | ![infinity](vendor/sf-symbols/infinity.png) `infinity` | ![all_inclusive](vendor/material-symbols/all_inclusive.svg) `all_inclusive` |
| `:calendar` | ![calendar](vendor/bootstrap-icons/calendar.svg) `calendar` | ![calendar](vendor/sf-symbols/calendar.png) `calendar` | ![calendar_month](vendor/material-symbols/calendar_month.svg) `calendar_month` |
| `:calendar_check` | ![calendar-check](vendor/bootstrap-icons/calendar-check.svg) `calendar-check` | ![calendar.badge.checkmark](vendor/sf-symbols/calendar.badge.checkmark.png) `calendar.badge.checkmark` | ![event_available](vendor/material-symbols/event_available.svg) `event_available` |
| `:clock` | ![clock](vendor/bootstrap-icons/clock.svg) `clock` | ![clock](vendor/sf-symbols/clock.png) `clock` | ![schedule](vendor/material-symbols/schedule.svg) `schedule` |
| `:alarm` | ![alarm](vendor/bootstrap-icons/alarm.svg) `alarm` | ![alarm](vendor/sf-symbols/alarm.png) `alarm` | ![alarm](vendor/material-symbols/alarm.svg) `alarm` |
| `:hourglass` | ![hourglass](vendor/bootstrap-icons/hourglass.svg) `hourglass` | ![hourglass](vendor/sf-symbols/hourglass.png) `hourglass` | ![hourglass_empty](vendor/material-symbols/hourglass_empty.svg) `hourglass_empty` |
| `:stopwatch` | ![stopwatch](vendor/bootstrap-icons/stopwatch.svg) `stopwatch` | ![stopwatch](vendor/sf-symbols/stopwatch.png) `stopwatch` | ![timer](vendor/material-symbols/timer.svg) `timer` |
| `:gear` | ![gear](vendor/bootstrap-icons/gear.svg) `gear` | ![gearshape](vendor/sf-symbols/gearshape.png) `gearshape` | ![settings](vendor/material-symbols/settings.svg) `settings` |
| `:sliders` | ![sliders](vendor/bootstrap-icons/sliders.svg) `sliders` | ![slider.horizontal.3](vendor/sf-symbols/slider.horizontal.3.png) `slider.horizontal.3` | ![tune](vendor/material-symbols/tune.svg) `tune` |
| `:toolbox` | ![tools](vendor/bootstrap-icons/tools.svg) `tools` | ![wrench.and.screwdriver](vendor/sf-symbols/wrench.and.screwdriver.png) `wrench.and.screwdriver` | ![handyman](vendor/material-symbols/handyman.svg) `handyman` |
| `:hammer` | ![hammer](vendor/bootstrap-icons/hammer.svg) `hammer` | ![hammer](vendor/sf-symbols/hammer.png) `hammer` | ![hardware](vendor/material-symbols/hardware.svg) `hardware` |
| `:wrench` | ![wrench](vendor/bootstrap-icons/wrench.svg) `wrench` | ![wrench](vendor/sf-symbols/wrench.png) `wrench` | ![build](vendor/material-symbols/build.svg) `build` |
| `:power` | ![power](vendor/bootstrap-icons/power.svg) `power` | ![power](vendor/sf-symbols/power.png) `power` | ![power_settings_new](vendor/material-symbols/power_settings_new.svg) `power_settings_new` |
| `:ruler` | ![rulers](vendor/bootstrap-icons/rulers.svg) `rulers` | ![ruler](vendor/sf-symbols/ruler.png) `ruler` | ![straighten](vendor/material-symbols/straighten.svg) `straighten` |
| `:puzzle` | ![puzzle](vendor/bootstrap-icons/puzzle.svg) `puzzle` | ![puzzlepiece](vendor/sf-symbols/puzzlepiece.png) `puzzlepiece` | ![extension](vendor/material-symbols/extension.svg) `extension` |
| `:briefcase` | ![briefcase](vendor/bootstrap-icons/briefcase.svg) `briefcase` | ![briefcase](vendor/sf-symbols/briefcase.png) `briefcase` | ![work](vendor/material-symbols/work.svg) `work` |
| `:car` | ![car-front](vendor/bootstrap-icons/car-front.svg) `car-front` | ![car](vendor/sf-symbols/car.png) `car` | ![directions_car](vendor/material-symbols/directions_car.svg) `directions_car` |
| `:truck` | ![truck](vendor/bootstrap-icons/truck.svg) `truck` | ![truck.box](vendor/sf-symbols/truck.box.png) `truck.box` | ![local_shipping](vendor/material-symbols/local_shipping.svg) `local_shipping` |
| `:bicycle` | ![bicycle](vendor/bootstrap-icons/bicycle.svg) `bicycle` | ![bicycle](vendor/sf-symbols/bicycle.png) `bicycle` | ![directions_bike](vendor/material-symbols/directions_bike.svg) `directions_bike` |
| `:airplane` | ![airplane](vendor/bootstrap-icons/airplane.svg) `airplane` | ![airplane](vendor/sf-symbols/airplane.png) `airplane` | ![flight](vendor/material-symbols/flight.svg) `flight` |
| `:train` | ![train-front](vendor/bootstrap-icons/train-front.svg) `train-front` | ![train.side.front.car](vendor/sf-symbols/train.side.front.car.png) `train.side.front.car` | ![train](vendor/material-symbols/train.svg) `train` |
| `:bus` | ![bus-front](vendor/bootstrap-icons/bus-front.svg) `bus-front` | ![bus](vendor/sf-symbols/bus.png) `bus` | ![directions_bus](vendor/material-symbols/directions_bus.svg) `directions_bus` |

† Newer than the macOS that drew this table, which renders the SF Symbols 5 set; the name resolves, the picture is on Apple’s site.
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
not a CDN answers, and each directory carries the licence its artwork came with.

Bootstrap Icons and Material Symbols are downloaded from their published sources, and
differ from upstream in two attributes: a grey fill, so a row reads on a light and a dark
theme alike, and a 20px box, so the columns line up. Apple publishes no files to fetch,
so `tools/sf_symbols.swift` asks macOS to draw each symbol and writes a PNG in the same
grey and the same box.

That rendering is done by the machine running `rake readme`, and a machine only knows the
symbols its own system shipped with. Anything newer is marked `†` in the table and shows
its name alone — the name still resolves in an app built against a newer SDK. `rake
validate` has already proved every one of them real, which is why a symbol this Mac
cannot draw is reported rather than fatal.

## Licence

MIT. See `LICENSE.txt`.
