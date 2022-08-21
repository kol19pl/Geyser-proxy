#Use latest ubuntu as base
FROM ubuntu:latest
#Make sure wget is installed
RUN apt update -y && apt install --no-install-recommends wget ca-certificates -y
#Add user "container" which is used to run playit agent later
RUN useradd -d /home/container -s /bin/bash container
#Set the working directory
WORKDIR /home/container
#Download and set permissions
RUN wget -O phantom-linux https://github.com/kol19pl/Geyser-proxy/raw/main/phantom-linux
RUN chmod u+x phantom-linux
#Set user
#USER container
#Create volume, if user didn't set up any
VOLUME ["/home/container"]
ENV ip "0.0.0.0:19132"
#ENV bind_ip ""
ENV bind_port 62669
EXPOSE 19132
EXPOSE 62669
#ENTRYPOINT ["./phantom-linux -server 0.0.0.0:19132", "--stdout-logs"]
#ENTRYPOINT ["./phantom-linux", "-server", $ip]

ENTRYPOINT ./phantom-linux -bind_port $bind_port -server $ip
#$bind_ip 