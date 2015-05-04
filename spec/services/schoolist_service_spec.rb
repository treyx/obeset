require "rails_helper"

RSpec.describe SchoolistService, type: :service do

  it "returns the schools" do
    VCR.use_cassette("schoolist_service_schools") do
      schools = SchoolistService.new.schools
      first_school = schools.first
      expect(first_school[:id]).to eq(1)
      expect(first_school[:overweight_percentage]).to eq("18.5")
      expect(first_school[:obese_percentage]).to eq("20.8")
      expect(first_school[:county_id]).to eq(1)
    end
  end

  it "returns a school" do
    VCR.use_cassette("schoolist_service_school") do
      school = SchoolistService.new.school(2)
      expect(school[:id]).to eq(2)
      expect(school[:overweight_percentage]).to eq("17.2")
      expect(school[:obese_percentage]).to eq("25.4")
      expect(school[:county_id]).to eq(1)
    end
  end

  it "creates a school" do
    expect do
      VCR.use_cassette("schoolist_service_create_school") do
        school_params = { school: {uid: "1", overweight_percentage: "1", obese_percentage: "1" }}
        school = SchoolistService.new.create_school(school_params)
        expect(school[:uid]).to eq("1")
        expect(school[:overweight_percentage]).to eq("1.0")
        expect(school[:obese_percentage]).to eq("1.0")

      end.to change{ SchoolistService.new.schools.count }.from(0).to(1)

        SchoolistService.new.destroy_school(school[:id])
    end
  end

  it "updates a school" do
    VCR.use_cassette("schoolist_service_update_school") do
      original_params = { school: {uid: "1", overweight_percentage: "1", obese_percentage: "1" }}
      original_school = SchoolistService.new.create_school(original_params)

      updated_params = { school: {uid: "2", overweight_percentage: "2", obese_percentage: "2" }}
      SchoolistService.new.update_school(original_school[:id], updated_params)
      updated_school = SchoolistService.new.school(original_school["id"])
      expect(original_school).to_not eq(updated_school)

      SchoolistService.new.destroy_school(original_school[:id])
    end

  end

end
