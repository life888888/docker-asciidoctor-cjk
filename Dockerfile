#asciidoctor/docker-asciidoctor

FROM asciidoctor/docker-asciidoctor AS base


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Minimal image with asciidoctor
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

FROM base AS main-minimal

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Haskell build for: erd
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

FROM base AS build-haskell
ARG FONTLANG
RUN addgroup -g 1000 -S demo && \
adduser -u 1000 -S demo -G demo --shell /bin/bash

USER demo

RUN cd /tmp && wget https://github.com/life888888/asciidoctor-pdf-cjk-ext/raw/main/install-zip-to-downloaded-resources-dir.sh && chmod u+x install-zip-to-downloaded-resources-dir.sh && /bin/bash ./install-zip-to-downloaded-resources-dir.sh $FONTLANG

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Final image
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

FROM main-minimal AS main

RUN addgroup -g 1000 -S demo && \
adduser -u 1000 -S demo -G demo --shell /bin/bash

COPY --from=build-haskell /home/demo/downloaded-resources /home/demo/downloaded-resources

RUN chown -R demo:demo /home/demo/downloaded-resources

USER demo

WORKDIR /documents
VOLUME /documents

CMD ["/bin/bash"]
