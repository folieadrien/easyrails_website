class PagesController < ApplicationController
  before_action :authenticate_admin!, only: :update

  def show
    @page_decorator = PageDecorator.new(get_page)
  end

  def update
    @page = get_page
    @page.content = params[:content][:page_content][:value]
    @page.save!
    render json: {}
  end

  private

  def get_page
    Page.get_page!(params[:name])
  end
end
