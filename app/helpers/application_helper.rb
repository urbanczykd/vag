module ApplicationHelper
  
    def tag_content(tag)
    content_for(:tag) { "<meta name='keywords' content='#{tag}' />".html_safe}
  end

    def render_gallery(content)
    id = content.scan(/\{gallery=(\d+)\}/)
    if !id.nil?
      id.each do |id|
        partial_content = render :partial => 'share/gallery', :locals => {:id => id[0].to_i }
        content.sub! /\{gallery=\d+\}/, partial_content
      end
      return content.html_safe
    else
      content.gsub! /\{gallery=\d+\}/, ''
      content.html_safe
    end
  end  
    
  
end
