# As a time-pressed user
# So that I can save a website
# I would like to add the site's address and title to my bookmark manager


feature 'Adding links' do


  scenario "adding a site's address and title to bookmark manager" do
    visit '/links'
    click_button("Add link")
    fill_in('url', with: "http://www.google.com")
    fill_in('title', with: "Google")
    click_button('Submit')
    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content("Google")
    end
  end
end
