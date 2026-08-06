module Unicon
  # Where something is, from one address to the whole world
  PLACES = {
    house: { bootstrap: :house, ios: :house, android: :home },
    building: { bootstrap: :building, ios: :building, android: :apartment },
    shop: { bootstrap: :shop, ios: :storefront, android: :storefront },
    bank: { bootstrap: :bank, ios: :'building.columns', android: :account_balance },
    map: { bootstrap: :map, ios: :map, android: :map },
    pin: { bootstrap: :'geo-alt', ios: :mappin, android: :location_on },
    globe: { bootstrap: :globe, ios: :globe, android: :public },
    flag: { bootstrap: :flag, ios: :flag, android: :flag },
    signpost: { bootstrap: :'signpost-split', ios: :'signpost.right', android: :signpost },
    hospital: { bootstrap: :hospital, ios: :'cross.case', android: :local_hospital },
    compass: { bootstrap: :compass, ios: :'location.north.circle', android: :explore },
  }.freeze
end
