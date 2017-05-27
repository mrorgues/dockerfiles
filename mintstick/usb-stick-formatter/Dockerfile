FROM mrorgues/mintstick
LABEL github "https://github.com/mrorgues"


#============================#
# Information & Requirements #
#============================#
# *** Run mintstick in a container ***
#     (USB Stick Formatter)
#
# docker run --rm -it \
#   -v /etc/machine-id:/etc/machine-id \
#   -v /tmp/.X11-unix:/tmp/.X11-unix \
#   -e DISPLAY=unix$DISPLAY \
#   -v /var/run:/var/run \
#   -v /dev/bus/usb:/dev/bus/usb \
#   --privileged \
#   --net host \
#   --name mintstick \
#   mrorgues/mintstick-usb-stick-formatter


#=============#
# Here we go! #
#=============#
ENTRYPOINT ["/usr/bin/mintstick", "-m", "format"]
