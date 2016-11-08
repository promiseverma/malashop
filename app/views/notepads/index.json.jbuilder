json.array!(@notepads) do |notepad|
  json.extract! notepad, :id, :note_date, :name, :amount, :status
  json.url notepad_url(notepad, format: :json)
end
