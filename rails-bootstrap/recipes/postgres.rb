if yes?("Will you be using PostgreSQL locally? [yes]")
  gem 'pg'

  host = ask?("What is your database host? [localhost]")
  host = "localhost" if host.blank?
  database = ask?("What is the name of the database? [#{app_name}]")
  database = app_name if database.blank?

  after_bundler do
    remove_file "config/database.yml"
    remove_file "db/development.sqlite3"
    remove_file "db/test.sqlite3"

    create_file "config/database.yml", <<-CFG
  common: &common
    host: #{host}
    adapter: postgresql

  development:
    <<: *common
    database: #{database}_dev

  test: &test
    <<: *common
    database: #{database}_test

  cucumber:
    <<: *test

  production:
    <<: *common
    database: #{database}_prod
  CFG
  end
else
  insert_into_file 'Gemfile', :after => "group :staging, :production do\n" do
    "  gem 'pg', '~> 0.13.2'\n"
  end
end
