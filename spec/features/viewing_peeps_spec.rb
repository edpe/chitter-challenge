require 'orderly'

feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the main page' do
    # We can use `.create`, which we used in irb to make a Student, within our test!
    Peep.create(message: 'Here is my opinion on something')

    visit '/peeps'

    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('Here is my opinion on something')
    end
  end

  scenario 'Peeps are in reverse chronological order' do
    Peep.create(message: 'older')
    Peep.create(message: 'newer')
    visit '/peeps'
    expect('newer').to appear_before('older')
  end
end