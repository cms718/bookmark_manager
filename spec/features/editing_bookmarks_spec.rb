# frozen_string_literal: true

feature 'editing a bookmark' do
  scenario 'it changes a bookmark url and title' do
    Bookmark.create('http://www.makersacademy.com', 'Makers')
    visit('/bookmarks')

    connection = PG.connect(dbname: 'bookmark_manager_test')
    id = connection.exec('SELECT * FROM bookmarks').first['id']

    first('.bookmark').click_button('Edit')
    expect(current_path).to eq("/bookmarks/#{id}/edit")

    fill_in('url', with: 'http://youtube.com')
    fill_in('title', with: 'Youtube')
    click_button('Update')

    expect(current_path).to eq('/bookmarks')
    expect(page).not_to have_content('Makers')
    expect(page).to have_content('Youtube')
  end
end
