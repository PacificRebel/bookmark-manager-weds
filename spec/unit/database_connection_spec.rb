require 'database_connection'

describe '.setup' do
  it 'should set up a connection to database through pg' do
    expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
    DatabaseConnection.setup('bookmark_manager_test')
  end

  describe '.query' do
    it 'should execute SQL query string on database via pg' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(connection).to receive(:exec).with('SELECT * FROM bookmarks')
      DatabaseConnection.query('SELECT * FROM bookmarks')
    end
  end

  describe '.connection' do
    it 'this connection is persistent' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end
end
