require 'pg'

feature 'Viewing the list of Bookmarks' do
  scenario 'displays Bookmarks' do
    # connection = PG.connect(dbname: 'bookmark_manager_test')

    # add the test data - old code below, before it was refactored
    # connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    # connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.twitter.com');")
    # connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")
    Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
    Bookmark.create(url: "http://www.google.com", title: "Google")
    Bookmark.create(url: "http://www.twitter.com", title: "Twitter")

    visit ('/bookmarks')

    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
    expect(page).to have_link('Twitter', href: 'http://www.twitter.com')
  end
end
