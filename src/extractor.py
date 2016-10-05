#!/usr/bin/env python

import logging
from extractor_config import *
import pyclowder.extractors as extractors


def main():
    global extractorName, messageType, rabbitmqExchange, rabbitmqURL, logger

    #set logging
    logging.basicConfig(format='%(levelname)-7s : %(name)s -  %(message)s', level=logging.INFO)
    logging.getLogger('4ceed.extractors').setLevel(logging.DEBUG)
    logger = logging.getLogger(extractorName)
    logger.setLevel(logging.DEBUG)

    #connect to rabbitmq
    extractors.connect_message_bus(extractorName=extractorName,
                                   messageType=messageType,
                                   processFileFunction=process_msg,
                                   rabbitmqExchange=rabbitmqExchange,
                                   rabbitmqURL=rabbitmqURL)

# ----------------------------------------------------------------------
# Process incoming message 
def process_msg(parameters):
    
    print(parameters['inputfile'])


if __name__ == "__main__":
    main()
