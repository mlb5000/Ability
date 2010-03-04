class EnvironmentsController < ApplicationController
  # GET /environments
  # GET /environments.xml
  def index
    @environments = Environment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @environments }
    end
  end

  # GET /environments/1
  # GET /environments/1.xml
  def show
    @environment = Environment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @environment }
    end
  end

  # GET /environments/new
  # GET /environments/new.xml
  def new
    @environment = Environment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @environment }
    end
  end

  # GET /environments/1/edit
  def edit
    @environment = Environment.find(params[:id])
  end

  # POST /environments
  # POST /environments.xml
  def create
    @environment = Environment.new(params[:environment])

    respond_to do |format|
      if @environment.save
        flash[:notice] = 'Environment was successfully created.'
        format.html { redirect_to(@environment) }
        format.xml  { render :xml => @environment, :status => :created, :location => @environment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @environment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /environments/1
  # PUT /environments/1.xml
  def update
    @environment = Environment.find(params[:id])

    respond_to do |format|
      if @environment.update_attributes(params[:environment])
        flash[:notice] = 'Environment was successfully updated.'
        format.html { redirect_to(@environment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @environment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /environments/1
  # DELETE /environments/1.xml
  def destroy
    @environment = Environment.find(params[:id])
    @environment.destroy

    respond_to do |format|
      format.html { redirect_to(environments_url) }
      format.xml  { head :ok }
    end
  end

  def factor_griddata
    @environment = Environment.find(params[:id])
    page = (params[:page]).to_i
    rp = (params[:rp]).to_i
    query = params[:query]
    qtype = params[:qtype]
    sortname = params[:sortname]
    sortorder = params[:sortorder]

    if (!sortname)
      sortname = "created_at"
    end

    if (!sortorder)
      sortorder = "desc"
    end

    if (!page)
      page = 1
    end

    if (!rp)
      rp = 10
    end

    start = ((page-1) * rp).to_i
    if query != nil
      query = "%"+query+"%"
    else
      query = "%%"
    end

    # No search terms provided
    if (query == "%%")
      @factors = EnvironmentConfigFactor.find_all_by_environment_id(@environment.id,
                                                                    :order => sortname+' '+sortorder,
                                                                    :limit =>rp,
                                                                    :offset =>start)
      count = @factors.count()
    end

    # Construct a hash from the ActiveRecord result
    return_data = Hash.new()
    return_data[:page] = page
    return_data[:total] = count

    return_data[:rows] = @factors.collect{|u| {:id=>u.config_factor.id,
                                               :cell=>[u.config_factor.name,
                                                       u.value]}}

    # Convert the hash to a json object
    render :text=>return_data.to_json, :layout=>false
  end
end
