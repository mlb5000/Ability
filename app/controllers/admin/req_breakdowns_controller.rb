class Admin::ReqBreakdownsController < ApplicationController
  layout "products"

  # GET /req_breakdowns
  # GET /req_breakdowns.xml
  def index
    @req_breakdowns = ReqBreakdown.find_all_by_previous_breakdown_id(nil)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @req_breakdowns }
    end
  end

  # GET /req_breakdowns/1
  # GET /req_breakdowns/1.xml
  def show
    @req_breakdown = ReqBreakdown.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @req_breakdown }
    end
  end

  # GET /req_breakdowns/new
  # GET /req_breakdowns/new.xml
  def new
    @req_breakdown = ReqBreakdown.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @req_breakdown }
    end
  end

  # GET /req_breakdowns/1/edit
  def edit
    @req_breakdown = ReqBreakdown.find(params[:id])
  end

  # POST /req_breakdowns
  # POST /req_breakdowns.xml
  def create
    @req_breakdown = ReqBreakdown.new(params[:req_breakdown])

    respond_to do |format|
      if @req_breakdown.save
        flash[:notice] = 'ReqBreakdown was successfully created.'
        format.html { redirect_to(admin_req_breakdown_url(@req_breakdown)) }
        format.xml  { render :xml => @req_breakdown, :status => :created, :location => @req_breakdown }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @req_breakdown.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /req_breakdowns/1
  # PUT /req_breakdowns/1.xml
  def update
    @req_breakdown = ReqBreakdown.find(params[:id])

    respond_to do |format|
      if @req_breakdown.update_attributes(params[:req_breakdown])
        flash[:notice] = 'ReqBreakdown was successfully updated.'
        format.html { redirect_to(admin_req_breakdown_url(@req_breakdown)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @req_breakdown.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /req_breakdowns/1
  # DELETE /req_breakdowns/1.xml
  def destroy
    @req_breakdown = ReqBreakdown.find(params[:id])
    @req_breakdown.destroy

    respond_to do |format|
      format.html { redirect_to(admin_req_breakdowns_url) }
      format.xml  { head :ok }
    end
  end

  def level_zero_update
    return unless request.xhr?
    level_ones = RequirementLevel.find(:all)
    logger.debug 'Count:' + level_ones.count().to_s()
    level_ones.delete(RequirementLevel.find(:level_one_id))
    logger.info level_ones.count()

    render :update do |page|
      page << update_select_box( "level_one_id",
                                 level_ones,
                                 {:text => :name,
                                  :clear => ['level_one_id']} )
    end
  end

  def level_one_update
    return unless request.xhr?
    level_twos = LevelTwo.find(:all, :conditions => ["level_one_id=?", params[:level_one_id]] )
    render :update do |page|
      page << update_select_box( "level_two_id",
                                 level_twos,
                                 {:text => :name,
                                  :clear => ['level_three_id']} )
    end
  end

  def level_two_update
    return unless request.xhr?
    level_threes = LevelThree.find( :all, :conditions => ["level_two_id=?", params[:level_two_id]])
    render :update do |page|
      page << update_select_box( "level_three_id",
                                 level_threes,
                                 {:text => :name} )
    end
  end

  def level_three_update
    return unless request.xhr?
    level_twos = LevelTwo.find(:all, :conditions => ["level_one_id=?", params[:level_one_id]] )
    render :update do |page|
      page << update_select_box( "level_two_id",
                                 level_twos,
                                 {:text => :name,
                                  :clear => ['level_three_id']} )
    end
  end
end
