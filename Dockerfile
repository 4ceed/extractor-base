FROM python:2.7

# Install extractor's dependencies
ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

# Install pyclowder
RUN pip install git+https://bitbucket.org/todd_n/t2-c2-pyclowder.git

# Your extra setup commands go here

# Copy files to working dir
ADD ./src /code
COPY extractor-start.sh /code/
WORKDIR /code

CMD ["/code/extractor-start.sh"]
