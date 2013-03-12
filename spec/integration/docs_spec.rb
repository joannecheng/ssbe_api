require 'spec_helper'

describe "docs/index.html" do
  it 'lists out routes' do
    visit docs_path
    within '#resources_container' do
      page.should have_content "GET /clients"
    end
  end
end
