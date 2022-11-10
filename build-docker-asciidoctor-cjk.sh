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
    docker build --build-arg FONTLANG=${FLANG} -t ${CREATOR}/docker-asciidoctor-cjk-${FLANG}:${VERSION} .
    docker tag ${CREATOR}/docker-asciidoctor-cjk-${FLANG}:${VERSION} ${CREATOR}/docker-asciidoctor-cjk-${FLANG}:latest
    docker tag ${CREATOR}/docker-asciidoctor-cjk-${FLANG}:latest docker-asciidoctor-cjk-${FLANG}:latest
    # ADD Alias Name docker-asciidoctor-cjk
    docker tag docker-asciidoctor-cjk-${FLANG}:latest docker-asciidoctor-cjk:latest
    echo "DONE!"
fi

