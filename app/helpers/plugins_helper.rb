module PluginsHelper
  def view_orders(current)
    PluginsController::ORDER_BY.keys.sort.collect do |order|
      if current == order
        t ".order_by_#{order}"
      else
        link_to t(".order_by_#{order}"), :order => order
      end
    end.join(' | ')
  end
end
