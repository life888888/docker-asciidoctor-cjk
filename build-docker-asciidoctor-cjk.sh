export VERSION=0.0.1
export CREATOR=life888888

if [ -z "$1" ]
  then
    echo "No language code input."
    echo ""
    echo "Usage: ./build-docker-asciidoctor-cjk.sh [language code]"
    echo ""
    echo "language code:"
    echo "    sc	(Simplified Chinese)"
    echo "    tc	(Traditional Chinese"
    echo "    hk	(Hong Kong)"
    echo "    jp	(Japanese)"
    echo "    kr	(Korean)"
    echo ""
    echo "if your language code is 'sc'"
    echo "    ./build-docker-asciidoctor-cjk.sh sc"
    echo ""
  else
    export FLANG=$1
    docker build  \
       --label "org.opencontainers.image.source=https://github.com/life888888/docker-asciidoctor-cjk" \
       --label "org.opencontainers.image.description=docker-asciidoctor-cjk-${FLANG}" \
       --label "org.opencontainers.image.licenses=MIT" \
       --build-arg FONTLANG=${FLANG} \
       -t docker-asciidoctor-cjk-${FLANG}:${VERSION} .
       
    docker tag docker-asciidoctor-cjk-${FLANG}:${VERSION} docker-asciidoctor-cjk-${FLANG}:latest

    # ADD Alias Name docker-asciidoctor-cjk
    # docker tag docker-asciidoctor-cjk-${FLANG}:latest docker-asciidoctor-cjk:latest
    echo "DONE!"
fi

