module Unicon
  # Who may see a record, and how they prove it
  SECURITY = {
    lock: { bootstrap: 'lock', ios: 'lock', android: 'lock' },
    key: { bootstrap: 'key', ios: 'key', android: 'key' },
    shield: { bootstrap: 'shield', ios: 'shield', android: 'shield' },
    fingerprint: { bootstrap: 'fingerprint', ios: 'touchid', android: 'fingerprint' },
    eye: { bootstrap: 'eye', ios: 'eye', android: 'visibility' },
  }.freeze
end
