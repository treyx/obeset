class School

  def self.service
    @service ||= SchoolistService.new
  end

  def self.all
    _build_school(service.schools)
  end

  def self.find(id)
    _build_school(service.school(id))
  end

  def self._build_school(data)
    OpenStruct.new(data)
  end
end
