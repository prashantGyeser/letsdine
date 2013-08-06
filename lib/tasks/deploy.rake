namespace :deploy do
  desc "Depoying application to the production instance of Heroku"
  task :production => :environment do
  	
  	puts '###############################################################'
  	puts 'Removing all the precompiled assets'
  	puts '###############################################################'
  	assets_clean_output = `rake assets:clean`
  	puts 'Assets cleaned'
  	puts assets_clean_output

  	puts '###############################################################'
  	puts 'Precompiling assets'
  	puts '###############################################################'
  	precompile_output = `rake assets:precompile`
  	puts 'Precompile done'
  	puts assets_clean_output
  	
    puts '###############################################################'
    puts 'Commiting content for deployment to heroku'
    puts '###############################################################'
    git_add_output = `git add .`
    git_commit_output = `git commit -m 'Precompiled assets and preparing to deploy to heroku'`
    puts 'Assets added to git and commited'
    puts git_add_output
    puts git_commit_output

  	puts '###############################################################'
  	puts 'Todo: Deploy to heroku production'
  	puts '###############################################################'
    

	puts '###############################################################'
  	puts 'Todo: Migrating database on heroku'
  	puts '###############################################################'  	

  end

  desc "TODO"
  task :staging => :environment do
  end

end
