json.array!(@plans) do |plan|
  json.extract! plan, :id, :name, :price, :company_id
  json.url plan_url(plan, format: :json)
end
