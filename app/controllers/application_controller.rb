class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :current_agency
  
  # https://gist.github.com/999482
  # We don't want to render the layout if PJAX is working
  def render(options = nil, extra_options = {}, &block)
    if request.headers['X-PJAX'] == 'true'
      options = {} if options.nil?
      options[:layout] = false
    end
    super(options, extra_options, &block)
  end

  def prepare_sidebar
    @theme = Admin::Theme.find(session[:theme_id])
    @templates = @theme.templates
    @pages = @theme.pages
    @stylesheets = @theme.stylesheets
    @javascripts = @theme.javascripts
    @assets = @theme.assets
  end

  private

  def current_agency
    @current_agency = Admin::Agency.find_by_domain(request.host)
  end

end
