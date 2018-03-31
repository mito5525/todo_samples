namespace :db do
  desc 'Create PlayGround DB'
  task :create do
    sh %(mysql -u root -h 127.0.0.1 -e 'CREATE DATABASE IF NOT EXISTS play_ground;')
  end

  desc 'Migrate PlayGround DB'
  task :apply do
    sh %(bundle exec convergence -c database.yml -i database_schema.rb --apply)
  end

  desc 'alias db:apply'
  task migrate: :apply

  desc 'Migrate DryRun PlayGround DB'
  task :dryrun do
    sh %(bundle exec convergence -c database.yml -i database_schema.rb --dryrun)
  end

  desc 'Drop PlayGround DB'
  task :drop do
    sh %(mysql -u root -h 127.0.0.1 -e 'DROP DATABASE IF EXISTS play_ground;')
  end

  desc 'db:drop => db:create => db:migrate'
  task :overhaul do
    %w(db:drop db:create db:migrate).each do |t|
      Rake::Task[t].invoke
    end
  end
end
