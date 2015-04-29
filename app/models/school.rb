class School < OpenStruct

  def self.service
    @service ||= SchoolistService.new
  end

  def self.all
    new(service.schools)
  end

  def self.find(id)
    new(service.school(id))
  end
end
