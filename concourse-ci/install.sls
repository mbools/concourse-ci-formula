{% from "concourse-ci/map.jinja" import concourse with context %}

group_{{ concourse.group }}:
  group.present:
    - name: {{ concourse.group }}
    - system: True

user_{{ concourse.user }}:
  user.present:
    - name: {{ concourse.user }}
    - gid: {{ concourse.group }}
    - system: True

{{ concourse.config_dir }}:
  file.directory:
    - user: {{ concourse.user }}
    - group: {{ concourse.group }}
    - mode: 600
    - makedirs: True

{{ concourse.pki_dir }}:
  file.directory:
    - user: {{ concourse.user }}
    - group: {{ concourse.group }}
    - mode: 600
    - makedirs: True

{{ concourse.install_dir }}:
  file.directory:
    - user: {{ concourse.user }}
    - group: {{ concourse.group }}
    - mode: 700
    - makedirs: True

{{ concourse.install_dir }}/concourse:
  file.managed:
    - source:
    {%- if concourse.exectuable_url is defined %}
      - {{ concourse.executable_url }}
    {% else %}
      - https://github.com/concourse/concourse/releases/download/v{{ concourse.version }}/concourse_linux_amd64
    {%- endif %}
    {%- if concourse.source_hash is defined %}
    - source_hash: {{ concourse.source_hash }}
    {%- else %}
    - skip_verify: True
    {%- endif %}
    - user: {{ concourse.user }}
    - group: {{ concourse.group }}
    - mode: 700
