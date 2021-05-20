# frozen_string_literal: true

require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
      Bookmark.create('http://www.makersacademy.com', 'Makers')
      Bookmark.create('http://www.destroyallsoftware.com', 'Destroy')
      Bookmark.create('http://www.google.com', 'Google')

      conn = PG.connect(dbname: 'bookmark_manager_test', user: 'charlieslater')
      result = conn.exec('SELECT * FROM bookmarks')

      bookmarks = Bookmark.all

      expect(bookmarks.first.title).to eq(result.first['title'])
    end
  end

  describe '.create' do
    it 'adds a bookmarks to the db' do
      Bookmark.create('www.test1234.com', 'Test')
      conn = PG.connect(dbname: 'bookmark_manager_test', user: 'charlieslater')
      result = conn.exec('SELECT * FROM bookmarks')
      expect(result.first['url']).to eq('www.test1234.com')
    end
  end

  describe '.delete' do
    it 'deletes a bookmark from the db' do
      Bookmark.create('www.test1234.com', 'Test')
      conn = PG.connect(dbname: 'bookmark_manager_test', user: 'charlieslater')
      conn.exec("DELETE FROM bookmarks WHERE title='Test'")
      result = conn.exec('SELECT * FROM bookmarks')
      expect(result.first).to eq(nil)
    end
  end

  describe '.new' do
    subject { described_class.new(1, 'fakeurl.com', 'fake') }

    describe '#id' do
      it 'returns the url' do
        expect(subject.id).to eq(1)
      end
    end
    describe '#url' do
      it 'returns the url' do
        expect(subject.url).to eq('fakeurl.com')
      end
    end
    describe '#title' do
      it 'returns the title' do
        expect(subject.title).to eq('fake')
      end
    end
  end
end
