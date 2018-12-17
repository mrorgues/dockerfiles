FROM buildpack-deps:stretch AS builder
LABEL github "https://github.com/mrorgues"


#============================#
# Information & Requirements #
#============================#
# *** Add easily "su-exec" into your project ***
# 
# Original Project: https://github.com/ncopa/su-exec
#
# # Dockerfile
# 
# FROM mrorgues/su-exec AS su-exec
# FROM SOME_IMAGE
# USER root
# COPY --from=su-exec --chown=root:root /sbin/su-exec /sbin/su-exec
# RUN chmod 755 /usr/local/bin/su-exec


#=======#
# Build #
#=======#
WORKDIR /tmp/build
ENV BRANCHNAME="v0.2"
RUN git clone --single-branch --branch $BRANCHNAME https://github.com/ncopa/su-exec.git /tmp/build && \
    make


#========#
# Result #
#========#
FROM scratch
COPY --from=builder /tmp/build/su-exec /sbin/su-exec
