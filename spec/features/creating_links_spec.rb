feature 'user can add links' do
  scenario 'adding links' do
    visit('/links')
    click_link('Add a New Link')
    fill_in('Title', with: 'Makers Curriculum')
    fill_in 'Link', :with => 'http://ronin.makersacademy.com/curriculum/'
    click_button('Submit')
    expect(page).to have_content('Makers Curriculum')
  end

  scenario 'adding tags to links' do
    visit('/links')
    click_link('Add a New Link')
    fill_in('Title', with: 'Makers Curriculum')
    fill_in 'Link', :with => 'http://ronin.makersacademy.com/curriculum/'
    fill_in('Tags', with: 'Coding' )
    click_button('Submit')
    link = Link.first
    expect(link.tags.map(&:name)).to include('Coding')
  end

  scenario 'adding multiple tags to links' do
    visit('/links')
    click_link('Add a New Link')
    fill_in('Title', with: 'Makers Curriculum')
    fill_in 'Link', :with => 'http://ronin.makersacademy.com/curriculum/'
    fill_in('Tags', with: 'Coding Programming Schools' )
    click_button('Submit')
    link = Link.first
    expect(link.tags.map(&:name)).to include('Coding','Programming', 'Schools' )
  end


end