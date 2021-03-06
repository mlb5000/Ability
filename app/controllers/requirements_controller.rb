class RequirementsController < ApplicationController
  
  # GET /requirements
  # GET /requirements.xml
  def index
    @product = Product.find(params[:product_id])
    @requirements = @product.requirements

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @requirements }
    end
  end

  # GET /requirements/1
  # GET /requirements/1.xml
  def show
    @requirement = Requirement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @requirement }
    end
  end

  # GET /requirements/new
  # GET /requirements/new.xml
  def new
    @product = Product.find(params[:product_id])
    @requirement = Requirement.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @requirement }
    end
  end

  # GET /requirements/1/edit
  def edit
    @requirement = Requirement.find(params[:id])
  end

  # POST /requirements
  # POST /requirements.xml
  def create
    @product = Product.find(params[:product_id])
    @requirement = Requirement.new(params[:requirement])
    @requirement.product = @product

    respond_to do |format|
      if @requirement.save
        flash[:notice] = 'Requirement was successfully created.'
        format.html { redirect_to(product_requirement_url(@requirement.product, @requirement)) }
        format.xml  { render :xml => @requirement, :status => :created, :location => @requirement }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @requirement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /requirements/1
  # PUT /requirements/1.xml
  def update
    @requirement = Requirement.find(params[:id])

    respond_to do |format|
      if @requirement.update_attributes(params[:requirement])
        flash[:notice] = 'Requirement was successfully updated.'
        format.html { redirect_to(product_requirement_url(@requirement.product, @requirement)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @requirement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /requirements/1
  # DELETE /requirements/1.xml
  def destroy
    @requirement = Requirement.find(params[:id])
    @product = @requirement.product
    @requirement.destroy

    respond_to do |format|
      format.html { redirect_to(product_requirements_url(@product)) }
      format.xml  { head :ok }
    end
  end
end
