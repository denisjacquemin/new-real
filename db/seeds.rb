# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

real = Admin::Agency.create(:name => 'Real WebSite', :domain => 'localhost')
theme = Admin::Theme.create(:title => 'Shadow Theme', :agency_id => real.id)
component_template = Admin::ComponentType.create(:label => 'Template')
component_page = Admin::ComponentType.create(:label => 'Page')
component_stylesheet = Admin::ComponentType.create(:label => 'Stylesheet')
component_javascript = Admin::ComponentType.create(:label => 'Javascript')


template = Admin::Component.create(:title => 'Dark Shadow', :component_type_id => component_template.id, :content => '<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>{{page.title}}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="page.title" content="{{page.title}}">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="http://twitter.github.com/bootstrap/examples/images/favicon.ico">
    <link rel="apple-touch-icon" href="http://twitter.github.com/bootstrap/examples/images/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="http://twitter.github.com/bootstrap/examples/images/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="http://twitter.github.com/bootstrap/examples/images/apple-touch-icon-114x114.png">
  </head>

  <body>
    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <a data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a href="#" class="brand">This is my template</a>
          <div class="nav-collapse">
            <ul class="nav">
              <li class="active"><a href="/admin/themes/index">Themes</a></li>
              <li><a href="/admin/items">Items</a></li>
              <li><a href="/admin/agencies/1/edit">Agency Details</a></li>
              <li class="divider-vertical"></li>
              <li><a href="/" target="_blank">Public Website</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
            <div class="well" style="padding: 8px 0;">  
              <ul class="nav nav-list">
                <li class="nav-header">Templates</li>
                  <li  ><a href="/admin/templates/1/edit">Dark Shadow</a></li>
                <li><a href="/admin/pages/new">New Template...</a></li>
              </ul>
              <ul class="nav nav-list">
                <li class="nav-header">Pages</li>
                  <li  ><a href="/admin/pages/1/edit">home real website</a></li>
                  <li  ><a href="/admin/pages/2/edit">contact real website</a></li>
                <li><a href="/admin/templates/new">New Page...</a></li>
              </ul>
            </div>
        </div>
        <div class="span9">
          {{ page.content }}
        </div>
      </div>
    </div>
  </body>
</html>', :theme_id => theme.id)

Admin::Component.create(:title => 'home real website', 
            :component_type_id => component_page.id,
            :permalink => 'home',
            :template_id => template.id,
            :theme_id => theme.id,
            :content => '<h1>Welcome Home my friend</h1>')
Admin::Component.create(:title => 'contact real website', 
            :component_type_id => component_page.id,
            :permalink => 'contact',
            :template_id => template.id,
            :theme_id => theme.id,
            :content => 'Please contact me at <a href="mailto:denis.jacquemin@gmail.com">denis jacquemin</a>')
Admin::Item.create(:title => 'Villa 4 facades', :description => 'Superbe villa 4 facade a renover en plein centre, proximite de tout, 5min gare', :type_id => 1, :agency_id => real.id)
surface = Admin::Category.create(:label => 'Surface', :active => true, :agency_id => real.id)
etage = Admin::Category.create(:label => 'Etage', :active => true, :agency_id => real.id)
rez = Admin::Category.create(:label => 'Rez de chaussee', :active => true, :agency_id => real.id)
sous = Admin::Category.create(:label => 'Sous sol', :active => true, :agency_id => real.id)
isolation = Admin::Category.create(:label => 'Isolation', :active => true, :agency_id => real.id)

Admin::Field.create(:label => 'Terrain', :category_id => surface.id)
Admin::Field.create(:label => 'Habitable', :category_id => surface.id)
Admin::Field.create(:label => 'Amenageable', :category_id => surface.id)
Admin::Field.create(:label => 'Nombre de piece', :category_id => etage.id)
Admin::Field.create(:label => 'sale de bain', :category_id => etage.id)
Admin::Field.create(:label => 'Nombre de piece', :category_id => rez.id)






