require 'sqlite3'

# create database
DB = {:conn => SQLite3::Database.new("db/songs.db")}

# drop songs to avoid errors
DB[:conn].execute("DROP TABLE IF EXISTS songs")

# create songs table
sql = <<-SQL
  CREATE TABLE IF NOT EXISTS songs (
  id INTEGER PRIMARY KEY,
  name TEXT,
  album TEXT
  )
SQL

DB[:conn].execute(sql)

# Do not return database rows as array but as hash with column names as keys
DB[:conn].results_as_hash = true
