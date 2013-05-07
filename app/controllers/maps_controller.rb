class MapsController < ApplicationController
   include SessionsHelper

  before_filter :require_session

  def show

  	@map = Map.find_by_slug_and_user_id params[:id], @current_user.id

    # Used for rendering standards filter
    @filter_standard_types = StandardType.all
    @filter_resource_types = ResourceType.all
    @filter_course_grades = CourseGrade.all
    @filter_course_subjects = CourseSubject.all   


    # @map_standards_by_id = Hash[@map.map_standards.map { |p| [p['id'], p] }]
      
    # @map_standard_children = {}
    # @map.map_standards.each do |map_standard|
    #   if not map_standard.standard.is_parent_standard
        
    #     if not @map_standard_children.has_key?(map_standard.standard.id)
    #       @map_standard_children[map_standard.standard.id] = []
    #     end



    #     @map_standard_children[map_standard.standard.id] << map_standard

    #   end
    # end

    # @parent_child_standards = Hash[@map_standards.map { |p| [p['standard_id'], [p.standard.parent_standard]] }]
    # @standards = Standard.where(parent_standard_id: nil)
    # Rails.logger.info @parent_child_standards
    # @map_standards_by_standard_id = Hash[@map_standards.map { |p| [p['standard_id'], p] }]


  end

  def create
    Rails.logger.info(params)

    @map = Map.new user_id: @current_user.id
    
    respond_to do |format|
      if @map.save
        @maps = @current_user.maps
        format.html { render partial: 'users/table_maps'}
      else
        Rails.logger.info("error create map #{@map.errors.inspect}")
        format.html { render json: @map.errors, status: :unprocessable_entity  }
      end
    end
  end

  def destroy
    Rails.logger.info(params)
    
    @map = Map.find_by_id_and_user_id params[:id], @current_user.id
    @map.destroy if @map
  
    respond_to do |format|
      if @map.destroyed?
        @maps = @current_user.maps
        format.html { render partial: 'users/table_maps'}
      else
        Rails.logger.info("error delete map #{@map.errors.inspect}")
        format.html { render json: @map.errors, status: :unprocessable_entity  }
      end 
    end
  end


  def update
    @map = Map.find_by_id_and_user_id params[:id], @current_user.id
    unless @map
      Rails.logger.info("error 404 map #{params[:id]}") 
      return render nothing: true, status: 404
    end

    respond_to do |format|
      if @map.update_attributes(params[:map])
        format.json { respond_with_bip(@map) }
      else
        format.json { respond_with_bip(@map) }
      end
    end
  end


  def sort_assessments

    @map = Map.find params[:map_id]
    return render nothing: true, status: 404 unless @map

    @map.map_assessments.each do |map_assessment|
      map_assessment.position = params[:map_assessment].index(map_assessment.id.to_s)+1
      map_assessment.save
    end

    render :nothing => true
  end

  def sort_standards

    @map = Map.find params[:map_id]
    return render nothing: true, status: 404 unless @map

    @map.map_standards.each do |map_standard|
      map_standard.position = params[:map_standard].index(map_standard.id.to_s)+1
      map_standard.save
    end

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
