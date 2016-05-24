every :sunday, :at => '12:00am' do
  rake 'fetch_bondis'
end

every [:monday, :tuesday, :wednesday, :thursday, :friday] do
  rake 'update_bondis'
end