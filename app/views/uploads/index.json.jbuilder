json.array!(@uploads) do |upload|
  json.extract! upload, :id, :image, :fbID, :name, :tel
  json.url upload_url(upload, format: :json)
end
