#!/bin/sh

set -eu

ssh -i ./server-key.pem ec2-user@54.72.209.131 -tt "
    cd /home/ec2-user/aws-graviton/; 
    yarn test;
"
