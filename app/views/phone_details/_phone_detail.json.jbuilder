json.extract! phone_detail, :id, :name, :processor, :storage, :battery, :display, :display, :created_at, :updated_at
json.url phone_detail_url(phone_detail, format: :json)
