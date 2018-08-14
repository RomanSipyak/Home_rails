class CardsController < ApplicationController
  def new
    @card = Card.new(list_id: params[:list_id])
  end

  def create
    @date = DateTime.new(params[:card]["date(1i)"].to_i,
                         params[:card]["date(2i)"].to_i,
                         params[:card]["date(3i)"].to_i,
                         params[:card]["date(4i)"].to_i,
                         params[:card]["date(5i)"].to_i,
                        0)
    @card = Card.new
    @card.date = @date
    @card.title = card_params[:title]
    @card.description = card_params[:description]
    @card.list_id = params[:card][:list_id]
    @card.save!
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    @card.update(card_params)
    @list = List.find(params[:card][:list_id])
    redirect_to dashboard_path(@list.dashboard_id)
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    respond_to do |format|
        format.html { redirect_to dashboard_path(params[:dashboard_id]) }
        format.xml  { head :ok }
      end
  end

  def index
  end

  def show
  end

  private
  def card_params
    params.require(:card).permit(:title, :description)
  end
end
