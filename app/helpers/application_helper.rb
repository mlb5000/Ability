# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # This helper method is used to generate the javascript to execute on the client
  # It assumes that the function update_select_options is already in the open document
  #
  # Options
  # :text - The method to use on collection objects to get the text for the option
  # :value - The method to use on collection objects to get the value attribute for the option
  # :include_blank - Includes a blank option at the top of cascaded boxes
  # :clear - An array that contains the dom id's of select boxes to clear when target_dom_id changes
  def update_select_box( target_dom_id, collection, options={} )
                  logger.info 'Entered update_select_box'
    # Set the default options
    options[:text] ||= 'name'
    options[:value] ||= 'id'
    options[:include_blank] = true if options[:include_blank].nil?
    options[:clear] ||= []
    pre = options[:include_blank] ? [['', '']] : []

    out = "update_select_options( $('" << target_dom_id.to_s << "'),"
    out << "#{(pre + collection.collect{ |c| [c.send(options[:text]), c.send(options[:value])]}).to_json}" << ","
    out << "#{options[:clear].to_json} )"
  end
end
