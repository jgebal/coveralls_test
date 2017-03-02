#!/usr/bin/env bash

service_job_id=$TRAVIS_JOB_ID
service_name='travis-ci'
service_pull_request=$TRAVIS_PULL_REQUEST
service_branch=$TRAVIS_BRANCH

#https://coveralls.io/api/v1/jobs
curl -vX POST https://coveralls.io/api/v1/jobs -d @coverage.json \
--header "Content-Type: application/json"
