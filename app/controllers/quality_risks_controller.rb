class QualityRisksController < ApplicationController
  layout "products"
  
  # GET /quality_risks
  # GET /quality_risks.xml
  def index
    @product = Product.find(params[:product_id])
    @quality_risks = @product.quality_risks

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @quality_risks }
    end
  end

  # GET /quality_risks/1
  # GET /quality_risks/1.xml
  def show
    @quality_risk = QualityRisk.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quality_risk }
    end
  end

  # GET /quality_risks/new
  # GET /quality_risks/new.xml
  def new
    @product = Product.find(params[:product_id])
    @quality_risk = QualityRisk.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @quality_risk }
    end
  end

  # GET /quality_risks/1/edit
  def edit
    @quality_risk = QualityRisk.find(params[:id])
  end

  # POST /quality_risks
  # POST /quality_risks.xml
  def create
    @product = Product.find(params[:product_id])
    @quality_risk = QualityRisk.new(params[:quality_risk])
    @quality_risk.product = @product

    respond_to do |format|
      if @quality_risk.save
        flash[:notice] = 'QualityRisk was successfully created.'
        format.html { redirect_to(product_quality_risk_path(@product, @quality_risk)) }
        format.xml  { render :xml => @quality_risk, :status => :created, :location => @quality_risk }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @quality_risk.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /quality_risks/1
  # PUT /quality_risks/1.xml
  def update
    @quality_risk = QualityRisk.find(params[:id])

    respond_to do |format|
      if @quality_risk.update_attributes(params[:quality_risk])
        flash[:notice] = 'QualityRisk was successfully updated.'
        format.html { redirect_to(product_quality_risk_path(@quality_risk.product, @quality_risk)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @quality_risk.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /quality_risks/1
  # DELETE /quality_risks/1.xml
  def destroy
    @quality_risk = QualityRisk.find(params[:id])
    @product = @quality_risk.product
    @quality_risk.destroy

    respond_to do |format|
      format.html { redirect_to(product_quality_risks_url(@product)) }
      format.xml  { head :ok }
    end
  end
end
