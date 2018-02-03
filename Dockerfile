# EYE Server image, based on EYE Server by Ruben Verborgh
FROM bdevloed/eye
LABEL maintainer="https://github.com/bdevloed"

# Install nodejs and EYEServer
RUN apt-get -qq update && \
	`# Install dependencies:` \
	apt-get -qqy --no-install-recommends install gnupg && \
	curl -fsSL https://deb.nodesource.com/setup_8.x | bash - && \
	apt-get install -qy nodejs && \
	apt-get purge -qy lsb-release && \
	apt-get -qy autoremove && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

#RUN npm -g install https://github.com/RubenVerborgh/EyeServer/tarball/master
RUN npm -g install eyeserver

EXPOSE 8000
CMD ["8000"]

ENTRYPOINT eyeserver
