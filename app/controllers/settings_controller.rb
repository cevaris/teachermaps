class SettingsController < ApplicationController
  
  before_filter :require_session


  def index
    @setting = Setting.find(@current_user.id)

    @google_account = nil
    if @current_user.has_google_account?
       @google_account = @current_user.google_account
    end
    @drop_box_account = nil
    if @current_user.has_drop_box_account?
      @drop_box_account = @current_user.drop_box_account
    end

    if @google_account.nil? and @drop_box_account.nil?
      flash['info'] = t('settings.select_storage_service')
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @settings }
    end
  end

  # GET /settings/1
  # GET /settings/1.json
  def show
    @setting = Setting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @setting }
    end
  end

  # GET /settings/1/edit
  def edit
    @setting = Setting.find(params[:id])
  end

  # PUT /settings/1
  # PUT /settings/1.json
  def update
    @setting = Setting.find(params[:id])

    respond_to do |format|
      if @setting.update_attributes(params[:setting])
        format.html { redirect_to @setting, notice: 'Setting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # # DELETE /settings/1
  # # DELETE /settings/1.json
  # def destroy
  #   @setting = Setting.find(params[:id])
  #   @setting.destroy

  #   respond_to do |format|
  #     format.html { redirect_to settings_url }
  #     format.json { head :no_content }
  #   end
  # end

  private

  # Requires user session
  def require_session
    unless current_user
      redirect_to signin_path
    end
  end
end
