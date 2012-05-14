class IncludePage < Liquid::Block
  def initialize(tag_name, permalink, tokens)
    super
  end
  
  def render(context)
    @permalink = super.strip
    @page = Admin::Component.find_by_permalink(@permalink)
    
    @agency = @current_agency
    if @page.nil?
      return "No page found for #{@permalink} link"
    else
      @snippet = Liquid::Template.parse(@page.content).render('page' => @page, 'agency' => @agency).html_safe
    end
  end
end

class IncludeCurrentPage < Liquid::Tag
  def initialize(tag_name, permalink, tokens)
    super
  end
  
  def render(context)
    @page = context.environments()[0]['page']
    @agency = context.environments()[0]['agency']

    if @page.nil?
      return "No page found for #{@permalink} link"
    else
      @snippet = Liquid::Template.parse(@page.content).render('page' => @page, 'agency' => @agency).html_safe
    end
  end
end

class IncludeStylesheet < Liquid::Tag
  def initialize(tag_name, stylesheet_name, tokens)
    super
    @stylesheet_name = stylesheet_name.strip
  end
  
  def render(context)
    @stylesheet = Admin::Component.find_by_title(@stylesheet_name.to_s)

    if @stylesheet.nil?
      return "No stylesheet found for '#{@stylesheet_name}' name."
    else
      @snippet = "<style>" + Liquid::Template.parse(@stylesheet.content).render() + "</style>"
      @snippet.html_safe
    end
  end
end

class IncludeJavascript < Liquid::Tag
  def initialize(tag_name, javascript_title, tokens)
    super
    @javascript_title = javascript_title.strip
  end
  
  def render(context)
    @javascript = Admin::Component.find_by_title(@javascript_title.to_s)

    if @javascript.nil?
      return "No stylesheet found for '#{@javascript_title}' title."
    else
      @snippet = '<script type="text/javascript">' + Liquid::Template.parse(@javascript.content).render() + '</script>'
      @snippet.html_safe
    end
  end
end