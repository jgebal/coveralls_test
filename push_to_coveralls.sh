#!/usr/bin/env bash

#service_job_id=$TRAVIS_JOB_ID
#service_name='travis-ci'
#service_pull_request=$TRAVIS_PULL_REQUEST
#service_branch=$TRAVIS_BRANCH

echo '$TRAVIS_JOB_ID='$TRAVIS_JOB_ID
echo '$TRAVIS_JOB_NUMBER='$TRAVIS_JOB_NUMBER
echo '$IS_BUILD_RELEASE_JOB='$IS_BUILD_RELEASE_JOB

#sed -i -- "s/\"name\":/\"source_digest\":\"3abb17b66815bc7946cefe727737d295\",\"name\":/g" coverage.json
#sed -i -- "s/\"name\":/\"source\":\"\",\"name\":/g" coverage.json

#sed -i -- "s/\"source_files\":/\"service_job_id\":\"$TRAVIS_JOB_ID\",\"service_name\":\"travis-ci\", \"source_files\":/g" coverage.json
sed -i -- "s/\"source_files\":/\"repo_token\":\"$COVERALLS_REPO_TOKEN\",\"service_job_id\":\"$TRAVIS_JOB_ID\",\"service_name\":\"travis-ci\", \"source_files\":/g" coverage.json

#https://coveralls.io/api/v1/jobs
curl -v -X POST https://coveralls.io/api/v1/jobs -d @"coverage.json" \
-H "Content-Type: application/json"


