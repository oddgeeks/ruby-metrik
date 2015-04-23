class RegisteredApplicationsController < ApplicationController
  def index
    @registered_applications = RegisteredApplication.all
  end

  def show
  end

  def new
    @registered_applications = RegisteredApplication.new
  end

  def edit
  end

  def create
    @registered_applications = RegisteredApplication.new(registered_application_params)

    respond_to do |format|
      if @registered_application.save
        format.html { redirect_to @registered_application, notice: 'Registered Application was successfully created.' }
        format.json { render :show, status: :created, location: @registered_application }
      else
        format.html { render :new }
        format.json { render json: @registered_application.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @registered_application.update(registered_application_params)
        format.html { redirect_to @registered_application, notice: 'Registered Application was successfully updated.' }
        format.json { render :show, status: :ok, location: @registered_application }
      else
        format.html { render :edit }
        format.json { render json: @registered_application.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @registered_application.destroy
    respond_to do |format|
      format.html { redirect_to registered_applications_url, notice: 'Registered Application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_registered_application
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def registered_application_params
    params[:registered_application]
  end
end
