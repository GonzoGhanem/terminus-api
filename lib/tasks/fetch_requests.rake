desc "Grabs all the pending requests of the site"
task :fetch_requests => :environment do
  puts "Requests pendientes:"
  Request.where(status: Request::PENDING_STATUS).each do |request|
    puts "Destino: #{request.text}, EMAIL: #{request.email}, Pendiente desde el #{request.request_date.strftime("%d/%m/%Y")}"
  end
end