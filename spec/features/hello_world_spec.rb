feature 'testing set up' do
  scenario 'it displays hello world' do
    visit('/')
    expect(page).to have_content('Hello world!')
  end
end