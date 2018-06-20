FROM ubuntu:bionic
LABEL github "https://github.com/mrorgues"


#===========================#
# Basics, Zsh and Oh-my-zsh #
#===========================#
ENV DEBIAN_FRONTEND=noninteractive \
    DEBCONF_NONINTERACTIVE_SEEN=true \
    TZ="Europe/Paris" \
    LANGUAGE="fr_FR.UTF-8" \
    LANG="fr_FR.UTF-8" \
    LC_ALL="fr_FR.UTF-8" \
    TERM="xterm-256color" \
    SHELL="/bin/zsh"
RUN apt-get update -qq && \
    apt-get install -qqy \
        apt-transport-https \
        ca-certificates \
        curl \
        fontconfig \
        git \
        gnupg \
        language-pack-en \
        language-pack-fr \
        locales \
        tzdata \
        wget \
        zsh \
        zsh-syntax-highlighting \
        --no-install-recommends && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/* && \
    echo "\n\nSettings: Timzeone\n\n" && \
    echo "${TZ}" > /etc/timezone && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    echo "\n\nSettings: Locales\n\n" && \
    locale-gen ${LANGUAGE} && \
    dpkg-reconfigure --frontend noninteractive locales && \
    FONT_DIR="$HOME/.local/share/fonts" && \
    mkdir -p $FONT_DIR && \
    echo "\n\nSettings: Fonts\n\n" && \
    cd $FONT_DIR; curl -fLo Meslo_LG_L_Regular_Nerd_Font_Complete_Mono.otf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/L/complete/Meslo%20LG%20L%20Regular%20Nerd%20Font%20Complete%20Mono.otf && \
    fc-cache -f $FONT_DIR && \
    echo "\n\nSettings: Zsh and Oh-my-zsh\n\n" && \
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
    usermod -s /bin/zsh root && \
    rm $HOME/.bashrc && \
    rm $HOME/.profile && \
    sed -i 's,ZSH_THEME="robbyrussell",ZSH_THEME="agnoster",g' $HOME/.zshrc && \
    sed -i 's,prompt_segment black default "%(!.%{%F{yellow}%}.)$USER@%m",# prompt_segment black default "%(!.%{%F{yellow}%}.)$USER@%m",g' $HOME/.oh-my-zsh/themes/agnoster.zsh-theme && \
    sed -i 's,\[\[ $UID -eq 0 \]\],# [[ $UID -eq 0 \]\],g' $HOME/.oh-my-zsh/themes/agnoster.zsh-theme && \
    echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> .zshrc


#=============#
# Here we go! #
#=============#
WORKDIR /root
ENTRYPOINT ["/bin/zsh"]
