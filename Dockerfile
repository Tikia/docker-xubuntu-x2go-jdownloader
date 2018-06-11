FROM ubuntu:16.04
MAINTAINER Tikia "renaud@tikia.net"

# Update OS
RUN apt-get update
RUN apt-get -y upgrade

#Define ENV
ENV DEBIAN_FRONTEND noninteractive

#Install ssh-server, xubuntu, java and others dependencies
RUN apt-get install -y openssh-server xubuntu-desktop openjdk-8-jre wget vim-nox

#Install x2go
RUN add-apt-repository ppa:x2go/stable
RUN apt-get update
RUN apt-get install -y x2goserver x2goserver-xsession pwgen

#Config OS
RUN mkdir -p /var/run/sshd && sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config
RUN sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config
RUN sed -i "s/#PasswordAuthentication/PasswordAuthentication/g" /etc/ssh/sshd_config
RUN mkdir -p /tmp/.X11-unix && chmod 1777 /tmp/.X11-unix

#Install JDownloader
ADD http://installer.jdownloader.org/JD2Setup_x64.sh /home/dockerx/
RUN chmod +x /home/dockerx/JD2Setup_x64.sh
#RUN /home/dockerx/JD2Setup_x64.sh

#Add password script
ADD https://raw.githubusercontent.com/Tikia/docker-xubuntu-x2go-jdownloader/master/root_pw_set.sh /
ADD https://raw.githubusercontent.com/Tikia/docker-xubuntu-x2go-jdownloader/master/run.sh /
RUN chmod +x /*.sh

#Define port
EXPOSE 22

#Define Volume
VOLUME ["/home/dockerx/Downloads"]

#Define CMD
CMD ["/run.sh"]
