# frozen_string_literal: true

# as a user
# so that I can bookmark a page I like
# I would like to add a new bookmark

feature 'Adding a bookmark' do
  scenario 'a bookmark it added to /bookmarks' do
    visit('/add_bookmark')
    fill_in('url', with: 'www.youtube.com')
    click_button('Save')
    expect(page).to have_content('www.youtube.com')
  end
end
