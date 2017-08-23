Resque::Server.use(Rack::Auth::Basic) do |user,password|
  password == ENV['resque_password']
end