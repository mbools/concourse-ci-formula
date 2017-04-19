{% from "concourse-ci/map.jinja" import concourse with context %}

include:
  - concourse-ci.install
  - concourse-ci.certs
  - concourse-ci.server
  - concourse-ci.worker
