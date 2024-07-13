json.extract! asset, :id, :number, :alt, :img, :video, :audio, :asset_type, :slug, :size, :created_at, :updated_at
json.url asset_url(asset, format: :json)
