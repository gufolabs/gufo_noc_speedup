FROM python:3.14-slim-trixie AS dev
COPY . /workspaces/gufo_noc_speedup
WORKDIR /workspaces/gufo_noc_speedup
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
    && pip install -e .[build,docs,ipython,lint,test]
