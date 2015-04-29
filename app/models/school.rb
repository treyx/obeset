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

  def self.create(params)
    new(service.create_school(params))
  end

  def self.update(id, params)
    service.update_school(id, params)
  end

  def self.destroy
    service.destroy_school(id)
  end
end
