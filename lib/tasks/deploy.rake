namespace :deploy do
  desc "Depoying application to the production instance of Heroku"
  task :production => :environment do
  	

    ########################################################################################################
    # Todo: Check the current branch is the master branch if not throw an error and terminate the task.
    ########################################################################################################

    # Checking if the current branch is master. If not throwing an error and terminating the rake task
    #branch = `branch_name=$(git symbolic-ref HEAD 2>/dev/null); branch_name=${branch_name##refs/heads/}; echo ${branch_name:-HEAD}`.strip
    #if branch != 'master'
    #  raise "You have checked out the #{branch} branch, please only deploy from the master branch!"
    #end
    #if `git status --porcelain`.present?
    #  raise "You have unstaged or uncommitted changes! Please only deploy from a clean working directory!"
    #end

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
    puts 'Pushing to bitbucket'
    puts '###############################################################'
    bitbucket_push_output = `git push origin master`
    puts 'Pushing to bitbucket'
    puts bitbucket_push_output

    puts '###############################################################'
    puts 'Pushing to github'
    puts '###############################################################'
    github_push_output = `git push github master`
    puts 'Pushing to github'
    puts github_push_output

  	puts '###############################################################'
  	puts 'Todo: Deploy to heroku production'
  	puts '###############################################################'
    
    production_push_output = `git push production master`
    puts 'Pushed application to heroku production'
    puts production_push_output

    puts '###############################################################'
    puts 'Migrating database on heroku'
    puts '###############################################################'    
    production_db_migrate_output = `heroku run rake db:migrate --remote production`
    puts 'Migrated the database on heroku production'
    puts production_db_migrate_output

    puts '###############################################################'
    puts 'Removing all the precompiled assets'
    puts '###############################################################'
    assets_clean_output = `rake assets:clean`
    puts 'Assets cleaned'
    puts assets_clean_output


  end

  desc "Depoying application to the staging instance of Heroku"
  task :staging => :environment do
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
    puts 'Pushing to github'
    puts '###############################################################'
    github_push_output = `git push github master`
    puts 'Pushing to github'
    puts github_push_output

    puts '###############################################################'
    puts 'Deploy to heroku staging'
    puts '###############################################################'
    staging_push_output = `git push staging master`
    puts 'Pushed application to heroku staging'
    puts staging_push_output

    puts '###############################################################'
    puts 'Migrating database on heroku'
    puts '###############################################################'    
    staging_db_migrate_output = `heroku run rake db:migrate --remote staging`
    puts 'Migrated the database on heroku staging'
    puts staging_db_migrate_output

    puts '###############################################################'
    puts 'Removing all the precompiled assets'
    puts '###############################################################'
    assets_clean_output = `rake assets:clean`
    puts 'Assets cleaned'
    puts assets_clean_output

  end

end
