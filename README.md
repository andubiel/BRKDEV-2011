# BRKDEV-2011

SSHLibrary
===============

.. contents::

Introduction
------------

SSHLibrary_ is a `Robot Framework`_ test
library for SSH and SFTP.  The project is hosted on GitHub_
and downloads can be found from PyPI_.

SSHLibrary is operating system independent and supports Python 2.7 as well
as Python 3.4 or newer. In addition to the normal Python_ interpreter,
it also works with `Jython 2.7`_.

The library has the following main usages:

- Executing commands on the remote machine, either with blocking or
  non-blocking behavior.
- Writing and reading in an interactive shell.
- Transferring files and directories over SFTP.
- Ensuring that files and directories exist on the remote machine.

.. image:: https://img.shields.io/pypi/l/robotframework-sshlibrary.svg
   :target: http://www.apache.org/licenses/LICENSE-2.0

.. image:: https://api.travis-ci.org/robotframework/SSHLibrary.png
   :target: http://travis-ci.org/robotframework/SSHLibrary

Documentation
-------------

See `keyword documentation`_ for available keywords and more information
about the library in general.

For general information about using test libraries with Robot Framework, see
`Robot Framework User Guide`_.

Installation
------------

The recommended installation method is using pip_::

    pip install --upgrade robotframework-sshlibrary

Running this command installs also the latest Robot Framework, paramiko_
and scp_ versions. The minimum supported paramiko version is ``1.15.3`` and
minimum supported scp version is ``0.13.0``.
The ``--upgrade`` option can be omitted when installing the library for the
first time.

With recent versions of ``pip`` it is possible to install directly from the
GitHub_ repository. To install latest source from the master branch, use
this command::

    pip install git+https://github.com/robotframework/SSHLibrary.git

Alternatively you can download the source distribution from PyPI_, extract
it, and install it using one of the following depending are you using
Python or Jython::

    python setup.py install
    jython setup.py install
