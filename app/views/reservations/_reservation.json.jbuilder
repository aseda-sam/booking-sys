json.extract! reservation, :id, :reserve_date, :time_start, :time_end, :status, :group, :activity, :person, :phone, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
