json.array!(@profiles) do |profile|
  json.extract! profile, :id, :first_name, :last_name, :country, :occupation, :specialization, :phone_number, :age, :years_of_commitment, :date_of_birth
  json.url profile_url(profile, format: :json)
end
