module Unicon
  # Who may see a record, and how they prove it
  SECURITY = {
    lock: { bootstrap: :lock, ios: :lock, android: :lock },
    unlock: { bootstrap: :unlock, ios: :'lock.open', android: :lock_open },
    key: { bootstrap: :key, ios: :key, android: :key },
    shield: { bootstrap: :shield, ios: :shield, android: :shield },
    fingerprint: { bootstrap: :fingerprint, ios: :touchid, android: :fingerprint },
    eye: { bootstrap: :eye, ios: :eye, android: :visibility },
    eye_slash: { bootstrap: :'eye-slash', ios: :'eye.slash', android: :visibility_off },
  }.freeze
end
