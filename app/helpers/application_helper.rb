# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def template_error(*params)   
    options = params.last.is_a?(Hash) ? params.pop.symbolize_keys : {}   
    objects = params.collect {|object_name| instance_variable_get("@#{object_name}") }.compact   
    count   = objects.inject(0) {|sum, object| sum + object.errors.count }   
    unless count.zero?   
      html = {}   
      [:id, :class].each do |key|   
        if options.include?(key)   
          value = options[key]   
          html[key] = value unless value.blank?   
        else   
          html[key] = 'errorExplanation'   
        end   
      end   
      header_message = ""#"#{pluralize(count, 'error')} prohibited this #{(options[:object_name] || params.first).to_s.gsub('_', ' ')} from being saved"   
      #error_messages = objects.map {|object| object.errors.full_messages.map {|msg| content_tag(:li, msg) } }   
      error_messages = objects.map do |object|   
        full_messages = []   
        object.errors.each do |attr,msg|   
          full_messages << msg unless msg.nil? || msg.blank?   
        end   
        full_messages.map{|msg| content_tag(:li,msg)}   
      end   
      content_tag(:div,   
        content_tag(options[:header_tag] || :h2, header_message) <<   
          content_tag(:p, '发生以下错误:') <<   
          content_tag(:ul, error_messages),   
        html   
      )   
    else   
      ''   
    end   
  end   

end
