module Unicon
  # How a person or a parcel gets there
  TRANSPORT = {
    car: { bootstrap: :'car-front', ios: :car, android: :directions_car },
    truck: { bootstrap: :truck, ios: :'truck.box', android: :local_shipping },
    bicycle: { bootstrap: :bicycle, ios: :bicycle, android: :directions_bike },
    airplane: { bootstrap: :airplane, ios: :airplane, android: :flight },
    train: { bootstrap: :'train-front', ios: :'train.side.front.car', android: :train },
    bus: { bootstrap: :'bus-front', ios: :bus, android: :directions_bus },
  }.freeze
end
