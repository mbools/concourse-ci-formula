{% from "concourse-ci/map.jinja" import concourse with context %}

include:
  - concourse-ci.install
  - concourse-ci.certs

# set up pki certs


{{ concourse.worker.work_dir }}:
  file.directory:
    - user: {{ concourse.user }}
    - group: {{ concourse.group }}
    - mode: 755
    - makedirs: True

concourse-ci-worker_{{ concourse.worker.service.name }}_systemd_unit:
  file.managed:
    - name: /etc/systemd/system/{{ concourse.worker.service.name }}.service
    - source: salt://concourse-ci/templates/worker.unit.jinja
    - template: jinja
  module.run:
    - name: service.systemctl_reload
    - onchanges:
      - file: concourse-ci-worker_{{ concourse.worker.service.name }}_systemd_unit

concourse-ci-worker_{{ concourse.worker.service.name }}_running:
  service.running:
    - name: {{ concourse.worker.service.name }}
    - watch:
      - module: concourse-ci-worker_{{ concourse.worker.service.name }}_systemd_unit
