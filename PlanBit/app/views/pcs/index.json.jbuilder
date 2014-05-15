json.array!(@pcs) do |pc|
  json.extract! pc, :id, :mac, :os_ver, :computer_name, :system_type, :ram_size, :ip_address, :is_laptop, :sub_id0, :sub_id1, :sub_id2, :sub_id3, :sub_id4
  json.url pc_url(pc, format: :json)
end
