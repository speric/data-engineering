# Challenge for Software Engineer
Based on [https://github.com/lschallenges/data-engineering/blob/master/README.markdown](https://github.com/lschallenges/data-engineering/blob/master/README.markdown)

##Set-up

1 - Check out the app from GitHub
```
$ git clone git@github.com:speric/data-engineering.git
$ cd data-engineering
```
2 - Edit `config/database.yml` with the proper credentials for your local db
3 - Run setup script (install gems via Bundler, creates local dbs)
```
$ ./app-setup.sh
```
4 - Start local server
```
$ rails server
```
5 - Navigate to [http://localhost:3000](http://localhost:3000)

##Run Tests
```
$ rake test
```

- controller: test for blank uploaded file
- controller tests
- parser tests
- authentication