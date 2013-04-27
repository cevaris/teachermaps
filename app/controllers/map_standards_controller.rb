class MapStandardsController < ApplicationController
  include SessionsHelper

  before_filter :require_session
  
  def show
    Rails.logger.info(params)
    @map_standard = MapStandard.find_by_slug params[:id]
  end

  def create

    Rails.logger.info(params)
   
    @map = Map.find_by_id_and_user_id params[:map_id], @current_user.id
    @standard = Standard.find params[:standard_id]

    if !@map or !@standard
      Rails.logger.info("error 404 map #{params[:map_id]} or standard #{params[:standard_id]}") 
      return render nothing: true, status: 404
    end

    if !MapStandard.find_by_standard_id_and_map_id @standard.id, @map.id
      @map_standard = MapStandard.new
      @map_standard.standard = @standard
      @map_standard.map = @map
      @map_standard.user = @current_user
      @map_standard.save

      @map.course_grades << @standard.course_grades
      @map.course_subjects << @standard.course_subject

      if !@map_standard.save
        Rails.logger.info("error create map_standard") 
        return render json: @map_standard.errors, status: :unprocessable_entity
      end
    end

    # Add any children standards
    @standard.children_standards.each do |child_standard|
      # Enforce prevention of the same standard being added twice
      if !MapStandard.find_by_standard_id_and_map_id child_standard.id, @map.id
        @map_standard = MapStandard.new
        @map_standard.standard = child_standard
        @map_standard.map = @map
        @map_standard.user = @current_user

        @map.course_grades << child_standard.course_grades
        @map.course_subjects << child_standard.course_subject
      
        if !@map_standard.save
          Rails.logger.info("error create map_standard") 
          return render json: @map_standard.errors, status: :unprocessable_entity
        end
      end
    end

    return render partial: 'maps/list_map_standards'
  end

  def destroy
    Rails.logger.info(params)
    
    @map_standard = MapStandard.find_by_id_and_user_id params[:id], @current_user.id

    if !@map_standard
      Rails.logger.info("error 404 map_standard #{params[:id]}") 
      return render nothing: true, status: 404
    end

    @map = @map_standard.map

    # Delete metadata
    @map.course_grades -= @map_standard.standard.course_grades
    @map.course_subjects -= [@map_standard.standard.course_subject]
    @map_standard.destroy

    # Update metadata
    @map.update_metadata

    respond_to do |format|
      if @map_standard.destroyed?       
        return render partial: 'maps/list_map_standards'
      else
        Rails.logger.info("error delete map_standard #{@map_standard.errors.inspect}")
        format.html { render json: @map_standard.errors, status: :unprocessable_entity  }
      end 
    end
  end

  def sort


    

    @map = Map.find params[:id]
    @map.sorted_map_standards.each do |map_standard|
      Rails.logger.info params[:new_positions].index(map_standard.id.to_s)+1
      map_standard.position = params[:new_positions].index(map_standard.id.to_s)+1
      map_standard.save
    end



    # params[:map_standards].each_with_index do |id, index|
    #   MapStandard.update_all(['position=?', index+1], ['id=?', id])
    # end
    render :nothing => true
  end

  private 
  
  # Requires user session
  def require_session
    unless current_user
      redirect_to signin_path
    end
  end
end
