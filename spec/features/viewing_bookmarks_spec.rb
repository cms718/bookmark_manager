# frozen_string_literal: true

feature 'viewing /bookmarks' do
  scenario 'a user can see bookmarks' do
    Bookmark.create('http://www.makersacademy.com', 'Makers')
    Bookmark.create('http://www.destroyallsoftware.com', 'Destroy')
    Bookmark.create('http://www.google.com', 'Google')
    visit('/bookmarks')

    expect(page).to have_content 'Makers'
    expect(page).to have_content 'Destroy'
    expect(page).to have_content 'Google'
  end
end
