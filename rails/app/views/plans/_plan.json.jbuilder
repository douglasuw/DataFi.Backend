json.extract! plan, :id, :name, :title, :month_value, :year_value, :recommend, :month_discount_percentual, :year_discount_percentual, :year_discount_value, :month_discount_value, :created_at, :updated_at
json.url plan_url(plan, format: :json)
