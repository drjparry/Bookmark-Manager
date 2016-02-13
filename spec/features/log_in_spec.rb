feature 'logs in users' do

  scenario 'allows a user to log in ' do
  sign_in
  log_in
  expect(page).to have_content("Welcome David")
  end

end