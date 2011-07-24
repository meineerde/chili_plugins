class PluginsController < ApplicationController
  respond_to :html, :xml, :json
  respond_to :atom, :only => :index

  before_filter :find_plugin, :only => [:show, :edit, :update, :destroy]
  before_filter :authorize, :only => [:edit, :update, :destroy]

  ORDER_BY = {
    'name' => 'name',
    'updated' => 'updated_at DESC'
  }

  def index
    if params[:format] != "atom"
      order = ORDER_BY[params[:order_by]] || ORDER_BY['name']
    else
      order = ORDER_BY['updated']
    end

    @plugins = Plugin.order(order).page(params[:page]).includes(:author)
    respond_with @plugins
  end

  def show
    respond_with @plugin
  end

  def new
    @plugin = Plugin.new
    respond_with @plugin
  end

  def create
    @plugin = Plugin.new(params[:plugin])
    flash[:notice] = t(:plugin_registered) if @plugin.save
    respond_with @plugin
  end

  def edit
    respond_with @plugin
  end

  def update
    @plugin.update_attributes(params[:plugin])
    flash[:notice] = t(:plugin_updated) if @plugin.save
    respond_with @plugin
  end

  def destroy
    flash[:notice] = t(:plugin_destroyed) if @plugin.destroy
    respond_with @plugin
  end

protected
  def find_plugin
    @plugin = Plugin.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def authorize
    unless User.current.can_edit?(@plugin)
      respond_with({:error => "You can only edit your own plugins"}, :status => :forbidden)
      return false
    end
  end
end
