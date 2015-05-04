require "rails_helper"

RSpec.describe SchoolistService, type: :service do

  it "returns the schools" do
    schools = SchoolistService.new.schools
  end

end
