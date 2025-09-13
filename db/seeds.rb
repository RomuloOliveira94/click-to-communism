12.times do |i|
  Click.find_or_create_by!(ip_address: "192.168.0.#{i}", user_agent: "SeedAgent/#{i}.0")
end
