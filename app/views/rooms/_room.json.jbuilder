json.extract! room, :id, :name, :detail, :price, :address, :created_at, :updated_at
json.url room_url(room, format: :json)
