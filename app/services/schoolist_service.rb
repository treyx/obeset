class SchoolistService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "http://localhost:3000/v1")
  end

  def schools
    JSON.parse(connection.get("schools").body, symbolize_names: true)
  end

  def school(id)
    JSON.parse(connection.get("schools/#{id}").body, symbolize_names: true)
  end

end
