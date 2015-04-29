class School

  def self.service
    @service ||= SchoolistService.new
  end

  def self.all
    new(service.schools)
  end

  def self.find(id)
    new(service.school(id))
  end

  attr_reader :uid, :id, :overweight_percentage, :obese_percentage

  def initialize(data)
    @uid                   = data[:uid]
    @id                    = data[:id]
    @overweight_percentage = data[:overweight_percentage]
    @obese_percentage      = data[:obese_percentage]
  end

end
