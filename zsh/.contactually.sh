ctly-staging() {
  heroku accounts:set contactually
  echo "heroku $@ --app contactually-staging"
  heroku $@ --app contactually-staging;
}

ctly-prod() {
  heroku accounts:set contactually
  echo "heroku $@ --app contactually"
  heroku $@ --app contactually;
}

deploy.ctly-staging() {
  heroku accounts:set contactually
  bundle exec rake ctly:deploy;
}

deploy.ctly-prod() {
  heroku accounts:set contactually
  bundle exec rake ctly:deploy[production];
}

alias ctly.testdb="bundle exec rake environment RAILS_ENV=test ctly:load_schemas"
