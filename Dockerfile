FROM python:3.13-slim-bullseye AS dev
COPY .requirements /tmp
RUN \
    set -x \
    && apt-get clean \
    && apt-get update \
    && apt-get install -y --no-install-recommends\
    git\
    ca-certificates\
    gcc\
    libc6-dev\
    && pip install --upgrade pip\
    && pip install --upgrade build\
    && pip install\
    -r /tmp/build.txt\
    -r /tmp/docs.txt\
    -r /tmp/ipython.txt\
    -r /tmp/lint.txt\
    -r /tmp/test.txt
