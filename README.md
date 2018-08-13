# Fonero Sentinel

An all-powerful toolset for Fonero.

Sentinel is an autonomous agent for persisting, processing and automating Fonero governance objects and tasks.

Sentinel is implemented as a Python application that binds to a local version 0.13.0.1 fonerod instance on each Fonero 0.13.0.1 Masternode.

This guide covers installing Sentinel onto an existing 0.13.0.1 Masternode in Ubuntu 14.04 / 16.04.

## Installation

### 1. Install Prerequisites

Make sure Python version 2.7.x or above is installed:

    python --version

### 2. Install Sentinel

Clone the Sentinel repo and install Python dependencies.

    apt-get update && \
    apt-get -y install python-virtualenv && \
    cd /opt && \
    git clone https://github.com/fonero-project/fonero-sentinel fonero-sentinel && \
    cd fonero-sentinel && \
    virtualenv ./venv && \
    ./venv/bin/pip install -r requirements.txt

### 3. Set up Cron

Set up a crontab entry to call Sentinel every minute:

    $ crontab -e

In the crontab editor, add the lines below, replacing '/opt/fonero-sentinel' to the path where you cloned fonero-sentinel to:

    * * * * * cd /opt/fonero-sentinel && ./venv/bin/python bin/sentinel.py >/dev/null 2>&1

### 4. Test the Configuration

Test the config by runnings all tests from the fonero-sentinel folder you cloned into

    $ ./venv/bin/py.test ./test

With all tests passing and crontab setup, Sentinel will stay in sync with fonerod and the installation is complete

## Configuration

An alternative (non-default) path to the `fonero.conf` file can be specified in `sentinel.conf`:

    fonero_conf=/path/to/fonero.conf

## Troubleshooting

To view debug output, set the `SENTINEL_DEBUG` environment variable to anything non-zero, then run the script manually:

    $ SENTINEL_DEBUG=1 ./venv/bin/python bin/sentinel.py

### License

Released under the MIT license, under the same terms as AzartCore itself. See [LICENSE](LICENSE) for more info.
