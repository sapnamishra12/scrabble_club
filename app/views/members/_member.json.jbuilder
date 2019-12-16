json.extract! member, :id, :name, :contact_number, :is_deleted, :created_at, :updated_at
json.url member_url(member, format: :json)
