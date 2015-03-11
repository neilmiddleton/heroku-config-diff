## heroku-config-diff

[Heroku Toolbelt](http://toolbelt.heroku.com) plugin that compares config keys
between two apps.

```
$ heroku config:diff myapp-staging -a myapp
=== The following keys exist only in myapp-staging
UNICORN_BACKLOG
UNICORN_WORKERS

=== The following keys exist only in myapp
ASSET_HOST
LIBRATO_USER
LIBRATO_PASSWORD
LIBRATO_TOKEN
LIBRATO_SOURCE
```

#### Installation

```
$ heroku plugins:install https://github.com/neilmiddleton/heroku-config-diff
```
