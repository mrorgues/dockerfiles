FROM php:apache
LABEL github "https://github.com/mrorgues"


#============================#
# Information & Requirements #
#============================#
# *** Run har viewer in a container ***
# 
# docker run --rm -d -p 8080:80 --name harviewer mrorgues/harviewer
#
# *** Access ***
#
# http://localhost:8080/
#
# *** Related Projects ***
#
# 1. Original Project: https://github.com/janodvarko/harviewer
# 2. Builder: TBD


#=================#
# Web Application #
#=================#
ADD harviewer.tar.gz /var/www/html/
