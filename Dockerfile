#Use latest ubuntu as base
FROM ubuntu:latest
#Make sure wget is installed
RUN apt update -y && apt install --no-install-recommends wget ca-certificates -y
#Add user "container" which is used to run playit agent later
RUN useradd -d /home/container -s /bin/bash container
#Set the working directory
WORKDIR /home/container
#Download and set permissions
#RUN wget -O playit https://
#Set user
USER container
#Create volume, if user didn't set up any
VOLUME ["/home/container"]
ENTRYPOINT ["./phantom-linux -server rutki.mine.game:19132", "--stdout-logs"]