# frozen_string_literal: true

require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns an array of bookmarks' do
      expect(Bookmark.all.include?('http://www.google.com')).to eq(true)
    end
  end
end
