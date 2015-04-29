class SchoolistService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "http://localhost:3000/v1")
  end

  def schools
    parse(connection.get("schools"))
  end

  def school(id)
    parse(connection.get("schools/#{id}"))
  end

  def counties
    parse(connection.get("counties"))
  end

  def county(id)
    parse(connection.get("counties/#{id}"))
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def create_school(params)
    parse(connection.post("schools", params))
  end

  def update_school(id, params)
    connection.put("schools/#{id}", params)
  end

  def destroy_school(id)
    connection.delete("schools/#{id}")
  end
end
