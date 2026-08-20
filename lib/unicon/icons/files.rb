module Unicon
  # Paperwork, and the boxes it is filed in
  FILES = {
    document: { bootstrap: 'file-earmark', ios: 'doc', android: 'description' },
    folder: { bootstrap: 'folder', ios: 'folder', android: 'folder' },
    archive: { bootstrap: 'archive', ios: 'archivebox', android: 'archive' },
    clipboard: { bootstrap: 'clipboard', ios: 'list.clipboard', android: 'content_paste' },
    checklist: { bootstrap: 'card-checklist', ios: 'checklist.checked', android: 'checklist' },
    book: { bootstrap: 'book', ios: 'book', android: 'book' },
    note: { bootstrap: 'sticky', ios: 'note.text', android: 'sticky_note_2' },
    paperclip: { bootstrap: 'paperclip', ios: 'paperclip', android: 'attach_file' },
    signature: { bootstrap: 'pen', ios: 'signature', android: 'draw' },
    box: { bootstrap: 'box', ios: 'shippingbox', android: 'inventory_2' },
    link: { bootstrap: 'link', ios: 'link', android: 'link' },
  }.freeze
end
