module Unicon
  # Model names a host app may look up, each naming the concept it takes its icons from
  ALIASES = {
    address: :pin, agent: :badge, call: :phone,
    comment: :chat, company: :building, county: :map,
    email: :envelope, event: :calendar, file: :document,
    home: :house, job: :briefcase, location: :pin,
    market: :shop, message: :chat, order: :cart,
    payment: :credit_card, photo: :image, product: :box,
    setting: :gear, source: :signpost, state: :map,
    team: :people, user: :person, zip: :pin,
  }.freeze
end
