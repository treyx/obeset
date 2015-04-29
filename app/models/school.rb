class School < OpenStruct

  def self.service
    @service ||= SchoolistService.new
  end

  def self.all
    service.schools.map { |school| new(school) }
  end

  def self.find(id)
    new(service.school(id))
  end
end
