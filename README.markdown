# Challenge for Software Engineer
Based on [https://github.com/lschallenges/data-engineering/blob/master/README.markdown](https://github.com/lschallenges/data-engineering/blob/master/README.markdown)

Tested with Ruby 1.9.3p125, Rails 3.2.11

##Set-up

1 - Check out the app from GitHub
```
$ git clone git@github.com:speric/data-engineering.git
$ cd data-engineering
```
2 - Edit `config/database.yml` with the proper credentials for your local db

3 - Run setup script (install gems via Bundler, creates local dbs)
```
$ sh app_setup.sh
```
4 - Start local server
```
$ rails server
```
5 - Navigate to [http://localhost:3000](http://localhost:3000)

Login with `engineering@prudentiadigital.com/test` or create your own account.

##Run Tests
```
$ rake db:test:load
$ rake test
```