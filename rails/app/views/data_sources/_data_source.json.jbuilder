json.extract! data_source, :id, :name, :description, :created_at, :updated_at
json.url data_source_url(data_source, format: :json)
