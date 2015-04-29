class SchoolsController < ApplicationController
  def index
    @schools = School.all

  end

  def show
    @school = School.find(params[:id])
  end

  def new

  end

  def create
    school = School.create(params)

    redirect_to school_path(school.id)
  end
end
