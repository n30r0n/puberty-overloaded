FROM ubuntu:20.04

# install packages
RUN apt-get update -y && apt-get install -y \
    lib32z1 xinetd gcc python3 python3-pip \
 && rm -rf /var/lib/apt/lists/*
# RUN python3 -m pip install pycryptodome

# add challenge files
RUN echo "You've been blocked by our xinetd - try again, and report if this repeats." > /etc/banner_fail
COPY ./config/ctf.xinetd /etc/xinetd.d/pwn
COPY ./config/start.sh /start.sh
COPY ./config/setup.sh /setup.sh
RUN mkdir /pwn
ADD ./main.py /pwn
ADD ./8d15b8bb54975773fad997403d35ce1a.txt /pwn
RUN chmod 777 /pwn/8d15b8bb54975773fad997403d35ce1a.txt
ADD ./src/ /pwn/
WORKDIR /pwn

# set permissions
RUN useradd error
RUN chmod +x /setup.sh
RUN chown root:error /start.sh && chmod 750 /start.sh

# expose the port application is reachable on
EXPOSE 9999

CMD ["/setup.sh"]
