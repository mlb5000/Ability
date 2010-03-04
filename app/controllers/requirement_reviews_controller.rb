class RequirementReviewsController < ApplicationController
  # GET /requirement_reviews
  # GET /requirement_reviews.xml
  def index
    @product = Product.find(params[:product_id])
    @requirement_reviews = @product.requirement_reviews

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @requirement_reviews }
    end
  end

  # GET /requirement_reviews/1
  # GET /requirement_reviews/1.xml
  def show
    @requirement_review = RequirementReview.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @requirement_review }
    end
  end

  # GET /requirement_reviews/new
  # GET /requirement_reviews/new.xml
  def new
    @requirement_review = RequirementReview.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @requirement_review }
    end
  end

  # GET /requirement_reviews/1/edit
  def edit
    @requirement_review = RequirementReview.find(params[:id])
    @product = @requirement_review.requirements[0].product
  end

  # POST /requirement_reviews
  # POST /requirement_reviews.xml
  def create
    @requirement_review = RequirementReview.new(params[:requirement_review])
    @product = @requirement_review.requirements[0].product

    respond_to do |format|
      if @requirement_review.save
        flash[:notice] = 'RequirementReview was successfully created.'
        format.html { redirect_to(product_requirement_review_url(@product, @requirement_review)) }
        format.xml  { render :xml => @requirement_review, :status => :created, :location => @requirement_review }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @requirement_review.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /requirement_reviews/1
  # PUT /requirement_reviews/1.xml
  def update
    @requirement_review = RequirementReview.find(params[:id])
    @product = @requirement_review.requirements[0].product

    respond_to do |format|
      if @requirement_review.update_attributes(params[:requirement_review])
        flash[:notice] = 'RequirementReview was successfully updated.'
        format.html { redirect_to(product_requirement_review_url(@product, @requirement_review)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @requirement_review.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /requirement_reviews/1
  # DELETE /requirement_reviews/1.xml
  def destroy
    @requirement_review = RequirementReview.find(params[:id])
    @product = @requirement_review.requirements[0].product
    @requirement_review.destroy

    respond_to do |format|
      format.html { redirect_to(product_requirement_reviews_url(@product)) }
      format.xml  { head :ok }
    end
  end
end
