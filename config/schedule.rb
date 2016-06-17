every :sunday, :at => '6:00am' do
  rake 'fetch_bondis'
end

every [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday] do
  rake 'update_bondis'
end