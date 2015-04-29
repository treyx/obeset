class School

  def self.service
    @service ||= SchoolistService.new
  end

  def self.all
    service.schools
  end

  def self.find(id)
    service.school(id)
  end

end
