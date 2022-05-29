class WidgetEditingService
  def edit_widget(widget, widget_params)
    widget.update(widget_params)

    if widget.valid?
      # create the InventoryReport
      # check the manufacturer to see who notify
      # trigger the AdminMailer to notify whoever
      # should be notified
    end

    widget
  end
end
