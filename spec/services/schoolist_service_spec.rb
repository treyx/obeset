require "rails_helper"

RSpec.describe SchoolistService, type: :service do

  it "returns the schools" do
    schools = SchoolistService.new.schools
    first_school = schools.first
    expect(first_school[:id]).to eq(1)
    expect(first_school[:overweight_percentage]).to eq("18.5")
    expect(first_school[:obese_percentage]).to eq("20.8")
    expect(first_school[:county_id]).to eq(1)
  end

end
