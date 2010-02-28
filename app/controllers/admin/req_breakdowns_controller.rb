class Admin::ReqBreakdownsController < ApplicationController

  # GET /req_breakdowns
  # GET /req_breakdowns.xml
  def index
    @req_breakdowns = ReqBreakdown.find(:all)

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
        format.html { redirect_to(admin_req_breakdowns_url) }
        format.xml  { render :xml => @req_breakdown, :status => :created, :location => @req_breakdown }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @req_breakdown.errors, :status => :unprocessable_entity }
      end
    end
  end

  def build_req_breakdowns(level0, level1, level2, level3)
    @level0 = ReqBreakdown.new
    @level0.requirement_level_id=RequirementLevel.find(level0).id
    @level0.save

    @level1 = create_and_link_level(@level0, level1)
    @level2 = create_and_link_level(@level1, level2)
    @level3 = create_and_link_level(@level2, level3)
  end

  def create_and_link_level(breakdown, level_id)
    if (breakdown != nil && level_id != '')
      @new_level = ReqBreakdown.new
      @new_level.previous_breakdown_id=breakdown.id
      @new_level.requirement_level_id=RequirementLevel.find(level_id).id
      @new_level.save
      breakdown.next_breakdown_id=@new_level.id
      breakdown.save
    end
    return @new_level
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
end
