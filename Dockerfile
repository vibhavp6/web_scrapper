FROM ubuntu:22.10


RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt install python3.7 -y

# Make python 3.7 the default
RUN echo "alias python=python3.7" >> ~/.bashrc
RUN export PATH=${PATH}:/usr/bin/python3.7
RUN /bin/bash -c "source ~/.bashrc"

# Install pip
RUN apt install python3-pip -y
RUN python3 -m pip install --upgrade pip
RUN pip install requests
RUN pip install lxml

COPY . .
RUN python3 main.py
