class Admin::RequirementLevelsController < ApplicationController
  
  # GET /requirement_levels
  # GET /requirement_levels.xml
  def index
    @requirement_levels = RequirementLevel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @requirement_levels }
    end
  end

  # GET /requirement_levels/1
  # GET /requirement_levels/1.xml
  def show
    @requirement_level = RequirementLevel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @requirement_level }
    end
  end

  # GET /requirement_levels/new
  # GET /requirement_levels/new.xml
  def new
    @requirement_level = RequirementLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @requirement_level }
    end
  end

  # GET /requirement_levels/1/edit
  def edit
    @requirement_level = RequirementLevel.find(params[:id])
  end

  # POST /requirement_levels
  # POST /requirement_levels.xml
  def create
    @requirement_level = RequirementLevel.new(params[:requirement_level])

    respond_to do |format|
      if @requirement_level.save
        flash[:notice] = 'RequirementLevel was successfully created.'
        format.html { redirect_to(admin_requirement_level_url(@requirement_level)) }
        format.xml  { render :xml => @requirement_level, :status => :created, :location => @requirement_level }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @requirement_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /requirement_levels/1
  # PUT /requirement_levels/1.xml
  def update
    @requirement_level = RequirementLevel.find(params[:id])

    respond_to do |format|
      if @requirement_level.update_attributes(params[:requirement_level])
        flash[:notice] = 'RequirementLevel was successfully updated.'
        format.html { redirect_to(admin_requirement_level_url(@requirement_level)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @requirement_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /requirement_levels/1
  # DELETE /requirement_levels/1.xml
  def destroy
    @requirement_level = RequirementLevel.find(params[:id])
    @requirement_level.destroy

    respond_to do |format|
      format.html { redirect_to(admin_requirement_levels_url) }
      format.xml  { head :ok }
    end
  end
end
