module Unicon
  # The people an app keeps records about, and the records themselves
  PEOPLE = {
    person: { bootstrap: :person, ios: :person, android: :person },
    people: { bootstrap: :people, ios: :'person.2', android: :group },
    person_add: { bootstrap: :'person-plus', ios: :'person.badge.plus', android: :person_add },
    person_remove: {
      bootstrap: :'person-dash', ios: :'person.badge.minus', android: :person_remove,
    },
    account: { bootstrap: :'person-circle', ios: :'person.crop.circle', android: :account_circle },
    badge: { bootstrap: :'person-vcard', ios: :'person.text.rectangle', android: :badge },
    contact: { bootstrap: :'person-rolodex', ios: :'person.crop.circle', android: :contacts },
  }.freeze
end
