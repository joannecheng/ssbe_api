require 'spec_helper'

describe "docs/index.html" do
  it 'lists out routes' do
    visit docs_path
    within '#resources-container' do
      page.should have_css "#resource_clients"
      page.should have_content "/clients"
    end
  end

  it 'lists out actions underneath the routes' do
    visit docs_path
    within '#resource_clients' do
      page.should have_css 'ul.operations'
      page.should have_css 'li.get.operation'
      page.should have_content 'GET'
    end
  end
end
