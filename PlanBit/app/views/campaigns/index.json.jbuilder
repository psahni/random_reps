json.array!(@campaigns) do |campaign|
  json.extract! campaign, :id, :id, :sub_id0, :sub_id1, :sub_id2, :sub_id3, :sub_id4, :pool_id
  json.url campaign_url(campaign, format: :json)
end
