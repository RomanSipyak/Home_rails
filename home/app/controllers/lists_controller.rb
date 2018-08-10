class ListsController < ApplicationController

  def new
    @list = List.new(dashboard_id: params[:dashboard_id])
  end

  def create
    p  params[:list][:dashboard_id]
    @list = List.new(list_params)
    @list.dashboard_id = params[:list][:dashboard_id]
    p params[:list][:dashboard_id]
    @list.save!
    redirect_to dashboard_path(params[:list][:dashboard_id])
  end

  def update
    @dashboard = List.find(params[:id])
    @dashboard.update(list_params)
    redirect_to dashboard_path(params[:list][:dashboard_id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path(@list.dashboard_id) }
      format.xml  { head :ok }
    end
  end

  def index
  end

  def show
  end

  private
  def list_params
    params.require(:list).permit(:title,:dashboard_id)
  end
end
