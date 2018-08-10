class DashboardsController < ApplicationController

  def new
    @dashboard = Dashboard.new
  end

  def create
    @dashboard = Dashboard.new(dashboard_params)
    @dashboard.user = current_user
    @dashboard.save
    redirect_to root_path
  end

  def edit
    @dashboard = Dashboard.find(params[:id])
  end

  def update
    @dashboard = Dashboard.find(params[:id])
    @dashboard.update(dashboard_params)
    redirect_to root_path
  end

  def destroy
    @dashboard = Dashboard.find(params[:id])
    @dashboard.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.xml  { head :ok }
    end
  end

  def index

  end

  def show
    @dashboard = Dashboard.find(params[:id])
    @list = List.new
  end

  private
  def dashboard_params
    params.require(:dashboard).permit(:title, :visions)
  end
end
