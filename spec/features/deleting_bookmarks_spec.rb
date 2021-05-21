# frozen_string_literal: true

feature 'Deleting a bookmark' do
  scenario 'a bookmark is removed from the homepage' do
    Bookmark.create('http://www.makersacademy.com', 'Makers')
    visit('/bookmarks')
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
    first('.bookmark').click_button('Delete')
    expect(page).not_to have_content('Makers')
    expect(page).not_to have_link('Makers', href: 'http://www.makersacademy.com')
    expect(current_path).to eq('/bookmarks')
  end
end
