#!/usr/bin/env bash

#service_job_id=$TRAVIS_JOB_ID
#service_name='travis-ci'
#service_pull_request=$TRAVIS_PULL_REQUEST
#service_branch=$TRAVIS_BRANCH

echo '$TRAVIS_JOB_ID'=$TRAVIS_JOB_ID

#sed -i -- "s/\"name\":/\"source_digest\":\"3abb17b66815bc7946cefe727737d295\",\"name\":/g" coverage.json
#sed -i -- "s/\"name\":/\"source\":\"\",\"name\":/g" coverage.json
sed -i -- "s/\"source_files\":/\"service_job_id\":\"$TRAVIS_JOB_ID\",\"service_name\":\"travis-ci\", \"source_files\":/g" coverage.json

cat coverage.json
#https://coveralls.io/api/v1/jobs
curl -v -X POST https://coveralls.io/api/v1/jobs -d @"coverage.json" \
-H "Content-Type: application/json"


