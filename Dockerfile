FROM debian:9

RUN apt-get update 
RUN apt-get install -y texlive-full 
RUN apt-get clean 
RUN rm -rf /var/lib/apt/lists/*

