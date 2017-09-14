deploy.ctly-staging() {
  heroku accounts:set contactually
  bundle exec rake ctly:deploy;
}

deploy.ctly-prod() {
  heroku accounts:set contactually
  bundle exec rake ctly:deploy[production];
}

alias ctly.testdb="bundle exec rake environment RAILS_ENV=test ctly:load_schemas"
