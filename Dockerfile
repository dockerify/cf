FROM alpine

RUN apk --no-cache add curl tar
RUN curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&source=github" | tar -zx && \ 
    chmod +x cf && \
    mv cf /usr/local/bin/ && \
    cf --version
RUN cf add-plugin-repo CF-Community http://plugins.cloudfoundry.org && \
    cf list-plugin-repos && \
    cf repo-plugins -r CF-Community

