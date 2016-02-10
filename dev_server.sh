#!/bin/sh
rm -f log/development.log
touch log/development.log
rm -f log/unicorn.stdout.log
touch log/unicorn.stdout.log
rm -f log/sidekiq.log
touch log/sidekiq.log
foreman start -p 3000