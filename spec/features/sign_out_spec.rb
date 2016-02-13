feature " allows a user to sign out" do
  scenario "if a user signs out, name no longer visible" do
    sign_in
    log_in
    click_button('Log out')
    expect(page).not_to have_content('David')
  end
end

