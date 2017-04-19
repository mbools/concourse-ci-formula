============
concourse-ci
============

SaltStack formula for concourse.ci continuous integration server.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.


Available states
================

.. contents::
    :local:

``concourse-ci``
----------------

Install and configure concourse.ci server and worker.

``concourse-ci.install``
---------------------

Install Concourse CI standalone binaries

``concourse-ci.certs``
---------------------

Install Concourse CI certificates

``concourse-ci.server``
---------------------

Install and run server as service. (Currently only `systemd`)

``concourse-ci.worker``
---------------------

Install and run worker as service. (Currently only `systemd`)



Template
========

This formula was created from a cookiecutter template.

See https://github.com/mitodl/saltstack-formula-cookiecutter.
