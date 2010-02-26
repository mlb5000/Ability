class RequirementTypesController < ApplicationController
  # GET /requirement_types
  # GET /requirement_types.xml
  def index
    @requirement_types = RequirementType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @requirement_types }
    end
  end

  # GET /requirement_types/1
  # GET /requirement_types/1.xml
  def show
    @requirement_type = RequirementType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @requirement_type }
    end
  end

  # GET /requirement_types/new
  # GET /requirement_types/new.xml
  def new
    @requirement_type = RequirementType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @requirement_type }
    end
  end

  # GET /requirement_types/1/edit
  def edit
    @requirement_type = RequirementType.find(params[:id])
  end

  # POST /requirement_types
  # POST /requirement_types.xml
  def create
    @requirement_type = RequirementType.new(params[:requirement_type])

    respond_to do |format|
      if @requirement_type.save
        flash[:notice] = 'RequirementType was successfully created.'
        format.html { redirect_to(admin_requirement_type_url(@requirement_type)) }
        format.xml  { render :xml => @requirement_type, :status => :created, :location => @requirement_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @requirement_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /requirement_types/1
  # PUT /requirement_types/1.xml
  def update
    @requirement_type = RequirementType.find(params[:id])

    respond_to do |format|
      if @requirement_type.update_attributes(params[:requirement_type])
        flash[:notice] = 'RequirementType was successfully updated.'
        format.html { redirect_to(admin_requirement_type_url(@requirement_type)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @requirement_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /requirement_types/1
  # DELETE /requirement_types/1.xml
  def destroy
    @requirement_type = RequirementType.find(params[:id])
    @requirement_type.destroy

    respond_to do |format|
      format.html { redirect_to(admin_requirement_types_url) }
      format.xml  { head :ok }
    end
  end
end
