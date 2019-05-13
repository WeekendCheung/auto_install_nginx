# Get the offical latest Nginx image
FROM nginx:latest

# The information of maintainer
MAINTAINER weekend

# set certificate key
RUN mkdir /etc/ssl/private
COPY ./private/server.crt /etc/ssl/private
COPY ./private/server.key /etc/ssl/private

# set configuration file
#RUN rm /etc/nginx/conf.d/default.conf
#COPY ./conf/default.conf /etc/nginx/conf.d/default.conf

# Set ports which can be listened
#EXPOSE 80
#EXPOSE 443

# Start the nginx service
#CMD ["nginx"]
