require 'spec_helper'

describe "docs/index.html" do
  context 'CRUD' do
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

    it 'lists paths for all CRUD operations for clients resource' do
      visit docs_path
      within '#resource_clients' do
        page.should have_content '/clients'
        page.should have_content '/clients/:id(.:format)'
      end
    end

    it 'displays all http verbs for resources clients' do
      visit docs_path
      within 'ul.operations' do
        page.should have_css 'li.get.operation'
        page.should have_css 'li.post.operation'
        page.should have_css 'li.put.operation'
        page.should have_css 'li.delete.operation'
      end
    end
  end

  it 'lists out descriptions for operations' do
    visit docs_path
    within '#resource_clients' do
      page.should have_content 'gets a collection of clients'
      page.should have_content 'gets a single client by id'
    end
  end
end
