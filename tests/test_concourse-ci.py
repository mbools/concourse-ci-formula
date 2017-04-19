"""Use testinfra and py.test to verify formula works properly"""

def test_concourse_server_running_and_enabled(Service, Salt):
    concourse = Service(Salt("pillar.get", "concourse-ci:server:service:name"))
    assert concourse.is_running
    assert concourse.is_enabled

def test_concourse_worker_running_and_enabled(Service, Salt):
    concourse = Service(Salt("pillar.get", "concourse-ci:worker:service:name"))
    assert concourse.is_running
    assert concourse.is_enabled
