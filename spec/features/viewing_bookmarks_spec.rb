# frozen_string_literal: true

feature 'listing bookmarks' do
  scenario 'visiting /bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content('google.com')
  end
end
