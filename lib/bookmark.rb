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
    rows.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title']) }
  end

  def self.create(url, title)
    conn = if ENV['ENVIRONMENT'] == 'test'
             PG.connect(dbname: 'bookmark_manager_test', user: 'charlieslater')
           else
             PG.connect(dbname: 'bookmark_manager', user: 'charlieslater')
           end
    conn.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}');")
  end

  def self.delete(id)
    conn = if ENV['ENVIRONMENT'] == 'test'
             PG.connect(dbname: 'bookmark_manager_test', user: 'charlieslater')
           else
             PG.connect(dbname: 'bookmark_manager', user: 'charlieslater')
           end
    conn.exec("DELETE FROM bookmarks WHERE id=#{id}")
  end

  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end
end
