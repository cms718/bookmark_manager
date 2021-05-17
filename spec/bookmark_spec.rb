# frozen_string_literal: true

require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns an array of bookmarks' do
      expect(Bookmark.all).to eq(['google.com'])
    end
  end
end
