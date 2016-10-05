#!/bin/bash

# add/replace if variable is non empty
# $1 = variable to replace/remove
# $2 = new value to set
function update_conf() {
    local query
    if [ "$1" == "" ]; then return 0; fi

    # First remove existing configuration info
    if [ -e /code/extractor_config.py ]; then
        if [ "$2" != "" ]; then
            query="$1"
	        mv /code/extractor_config.py /code/extractor_config.py.old
            grep -v "^$query" /code/extractor_config.py.old > /code/extractor_config.py
            rm /code/extractor_config.py.old
	    fi
    fi

    # Then, update config info
    if [ "$2" != "" ]; then
        echo "$1=\"$2\"" >> /code/extractor_config.py
    fi
}

# Update configuration information 
update_conf   "rabbitmqURL" "$RABBITMQ_URL"
update_conf   "rabbitmqExchange" "$RABBITMQ_EXCHANGE"
update_conf   "messageType" "$MESSAGE_TYPE"
update_conf   "sslVerify" $SSL_VERIFY

# Start extractor 
cd /code
python extractor.py 
