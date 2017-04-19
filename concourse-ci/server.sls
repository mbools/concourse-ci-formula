{% from "concourse-ci/map.jinja" import concourse with context %}

include:
  - concourse-ci.install
  - concourse-ci.certs


# setup pki certs


concourse-ci-server_systemd_unit:
  file.managed:
    - name: /etc/systemd/system/{{ concourse.server.service.name }}.service
    - source: salt://concourse-ci/templates/server.unit.jinja
    - template: jinja
  module.run:
    - name: service.systemctl_reload
    - onchanges:
      - file: concourse-ci-server_systemd_unit

concourse-ci-server_running:
  service.running:
    - name: {{ concourse.server.service.name }}
    - watch:
      - module: concourse-ci-server_systemd_unit
