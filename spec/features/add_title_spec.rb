# feature 'Adding a title to bookmark' do
#   scenario 'A user can add a title to a bookmark' do
#     visit ('/bookmarks/new')
#     fill_in('title', with: 'Google')
#     click_button('Submit')
#
#     expect(page).to have_content 'Google'
#   end
# end
#

# feature 'Adding a new bookmark' do
#   scenario 'A user can add a bookmark to Bookmark Manager' do
#     visit ('/bookmarks/new')
#     fill_in('url', with: 'http://testbookmark.com')
#     click_button('Submit')
#
#     expect(page).to have_content 'http://testbookmark.com'
#   end
# end
