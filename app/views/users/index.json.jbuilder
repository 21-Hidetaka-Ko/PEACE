json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :sex, :major, :birthday, :password, :university, :national
  json.url user_url(user, format: :json)
end
