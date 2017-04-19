{% from "concourse-ci/map.jinja" import concourse with context %}

include:
  - concourse-ci.server
  - concourse-ci.worker
