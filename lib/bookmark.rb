# frozen_string_literal: true

require 'pg'

class Bookmark
  def self.all
    conn = if ENV['ENVIRONMENT'] == 'test'
             PG.connect(dbname: 'bookmark_manager_test', user: 'charlieslater')
           else
             PG.connect(dbname: 'bookmark_manager', user: 'charlieslater')
           end

    rows = conn.exec('SELECT * FROM bookmarks')
    rows.map { |bookmark| bookmark['url'] }
  end
end
