class AuthorController < ApplicationController
  def show
    respond_with @author
  end

protected
  def find_author
    @author = Author.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end
