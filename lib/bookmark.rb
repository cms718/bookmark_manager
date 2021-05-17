# frozen_string_literal: true

require 'pg'

class Bookmark
  def self.all
    conn = PG.connect(dbname: 'bookmark_manager', user: 'charlieslater')
    rows = conn.exec('SELECT * FROM bookmarks')
    rows.map { |row| row['url'] }
  end
end
