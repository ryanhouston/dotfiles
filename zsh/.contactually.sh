function ctly-staging {
  heroku accounts:set contactually
  echo "heroku run rails console --app contactually-staging"
  heroku run rails console --app contactually-staging;
}

function ctly-prod {
  heroku accounts:set contactually
  echo "heroku run rails console --app contactually"
  heroku run rails console --app contactually;
}

function deploy.ctly-staging {
  heroku accounts:set contactually
  bundle exec rake ctly:deploy;
}

function deploy.ctly-prod {
  heroku accounts:set contactually
  bundle exec rake ctly:deploy[production];
}

alias ctly.testdb="bundle exec rake environment RAILS_ENV=test ctly:load_schemas"
