Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4DF9EE0097D; Wed, 13 May 2015 13:48:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.42 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D3696E008DC
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 May 2015 13:48:07 -0700 (PDT)
Received: by yhrr66 with SMTP id r66so17307238yhr.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 May 2015 13:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=E4LaBHVu7jJcQGA5qpDjCWJ8wsFXVaDNpP3ymTEJ8dA=;
	b=vW/C1sXXnaA+6yG75lPPADp4fsuuAOBA2pnIKy6ZqB31cZgnlegzUaAGos4X2PDMt2
	sNc4XBR0TB8u1pXNFWIMtVqbkkvuUmzarz4Y/jAonMUNkbgOM5Q26Zr6RB2zYcaii7D7
	QTsI1i0g5lyF6gBwZKiIv5P+Qg5oXPs6hS7RG498RtAz5F6QAUJ+O8FJeIr3rZ8Vgv97
	CheVI5pMygGZJ63RI0IfRbXvBBuiMPRdf5r+3U7eQimXvdmoqO7xRShPZzZB8K+7hhHr
	HE05IWf5MsUR487m/oWBRSDXqxKIwgYU2Hvkx+ih6gmA5lhzj1Sfax8lgilIScie5CaB
	kWag==
MIME-Version: 1.0
X-Received: by 10.170.149.194 with SMTP id q185mr916157ykc.16.1431550087519;
	Wed, 13 May 2015 13:48:07 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Wed, 13 May 2015 13:48:07 -0700 (PDT)
In-Reply-To: <1431098920-13669-1-git-send-email-alejandro.delcastillo@ni.com>
References: <1431098920-13669-1-git-send-email-alejandro.delcastillo@ni.com>
Date: Wed, 13 May 2015 16:48:07 -0400
Message-ID: <CADkTA4NzFzTnqgUnOkdxJ1gybx-intLq6TMf=3+7AVJx=PyK6Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, code@joelwhitehouse.com,
	Joseph Hall <perlhoser@gmail.com>
Subject: Re: [PATCH] salt: add recipe for salt
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 13 May 2015 20:48:14 -0000
Content-Type: text/plain; charset=UTF-8

I've merged these changes to the master branch, I'll propagate them to kilo
shortly as well.

.. and due to popular demand, I'll also start including and creating the Yocto
release names in the branches.

Expect that tomorrow.

Bruce

On Fri, May 8, 2015 at 11:28 AM, Alejandro del Castillo
<alejandro.delcastillo@ni.com> wrote:
> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> ---
>  meta-openstack/recipes-support/salt/files/cloud    |  94 ++++
>  meta-openstack/recipes-support/salt/files/master   | 525 +++++++++++++++++++++
>  meta-openstack/recipes-support/salt/files/minion   | 494 +++++++++++++++++++
>  meta-openstack/recipes-support/salt/files/roster   |   8 +
>  meta-openstack/recipes-support/salt/files/salt-api | 110 +++++
>  .../salt/files/salt-common.bash_completion         | 332 +++++++++++++
>  .../salt/files/salt-common.logrotate               |  10 +
>  .../recipes-support/salt/files/salt-master         | 111 +++++
>  .../recipes-support/salt/files/salt-minion         | 111 +++++
>  .../recipes-support/salt/files/salt-syndic         | 111 +++++
>  .../salt/salt/set_python_location_hashbang.patch   | 107 +++++
>  .../recipes-support/salt/salt_2014.7.4.bb          | 145 ++++++
>  12 files changed, 2158 insertions(+)
>  create mode 100644 meta-openstack/recipes-support/salt/files/cloud
>  create mode 100644 meta-openstack/recipes-support/salt/files/master
>  create mode 100644 meta-openstack/recipes-support/salt/files/minion
>  create mode 100644 meta-openstack/recipes-support/salt/files/roster
>  create mode 100755 meta-openstack/recipes-support/salt/files/salt-api
>  create mode 100644 meta-openstack/recipes-support/salt/files/salt-common.bash_completion
>  create mode 100644 meta-openstack/recipes-support/salt/files/salt-common.logrotate
>  create mode 100755 meta-openstack/recipes-support/salt/files/salt-master
>  create mode 100755 meta-openstack/recipes-support/salt/files/salt-minion
>  create mode 100755 meta-openstack/recipes-support/salt/files/salt-syndic
>  create mode 100644 meta-openstack/recipes-support/salt/salt/set_python_location_hashbang.patch
>  create mode 100644 meta-openstack/recipes-support/salt/salt_2014.7.4.bb
>
> diff --git a/meta-openstack/recipes-support/salt/files/cloud b/meta-openstack/recipes-support/salt/files/cloud
> new file mode 100644
> index 0000000..2ea54f1
> --- /dev/null
> +++ b/meta-openstack/recipes-support/salt/files/cloud
> @@ -0,0 +1,94 @@
> +# This file should normally be installed at: /etc/salt/cloud
> +
> +
> +##########################################
> +#####          VM Defaults           #####
> +##########################################
> +
> +# Set the size of minion keys to generate, defaults to 2048
> +#
> +#keysize: 2048
> +
> +
> +# Set the default os being deployed. This sets which deployment script to
> +# apply. This argument is optional.
> +#
> +#script: bootstrap-salt
> +
> +
> +##########################################
> +#####         Logging Settings       #####
> +##########################################
> +
> +# The location of the master log file
> +#
> +#log_file: /var/log/salt/cloud
> +
> +
> +# The level of messages to send to the console.
> +# One of 'garbage', 'trace', 'debug', info', 'warning', 'error', 'critical'.
> +#
> +# Default: 'info'
> +#
> +#log_level: info
> +
> +
> +# The level of messages to send to the log file.
> +# One of 'garbage', 'trace', 'debug', info', 'warning', 'error', 'critical'.
> +#
> +# Default: 'info'
> +#
> +#log_level_logfile: info
> +
> +
> +# The date and time format used in log messages. Allowed date/time formating
> +# can be seen here:
> +#
> +#      http://docs.python.org/library/time.html#time.strftime
> +#
> +#log_datefmt: '%Y-%m-%d %H:%M:%S'
> +
> +
> +# The format of the console logging messages. Allowed formatting options can
> +# be seen here:
> +#
> +#      http://docs.python.org/library/logging.html#logrecord-attributes
> +#
> +# Console log colors are specified by these additional formatters:
> +#
> +# %(colorlevel)s
> +# %(colorname)s
> +# %(colorprocess)s
> +# %(colormsg)s
> +#
> +# Since it is desirable to include the surrounding brackets, '[' and ']', in
> +# the coloring of the messages, these color formatters also include padding as
> +# well.  Color LogRecord attributes are only available for console logging.
> +#
> +#log_fmt_console: '[%(levelname)-8s] %(message)s'
> +#log_fmt_logfile: '%(asctime)s,%(msecs)03.0f [%(name)-17s][%(levelname)-8s] %(message)s'
> +
> +
> +# Logger levels can be used to tweak specific loggers logging levels.
> +# For example, if you want to have the salt library at the 'warning' level,
> +# but you still wish to have 'salt.modules' at the 'debug' level:
> +#
> +#   log_granular_levels:
> +#     'salt': 'warning',
> +#     'salt.modules': 'debug'
> +#     'saltcloud': 'info'
> +#
> +#log_granular_levels: {}
> +
> +
> +##########################################
> +#####         Misc Defaults          #####
> +##########################################
> +
> +# Whether or not to remove the accompanying SSH key from the known_hosts file
> +# when an instance is destroyed.
> +#
> +# Default: 'False'
> +#
> +#delete_sshkeys: False
> +
> diff --git a/meta-openstack/recipes-support/salt/files/master b/meta-openstack/recipes-support/salt/files/master
> new file mode 100644
> index 0000000..8129a4f
> --- /dev/null
> +++ b/meta-openstack/recipes-support/salt/files/master
> @@ -0,0 +1,525 @@
> +##### Primary configuration settings #####
> +##########################################
> +# This configuration file is used to manage the behavior of the Salt Master
> +# Values that are commented out but have no space after the comment are
> +# defaults that need not be set in the config. If there is a space after the
> +# comment that the value is presented as an example and is not the default.
> +
> +# Per default, the master will automatically include all config files
> +# from master.d/*.conf (master.d is a directory in the same directory
> +# as the main master config file)
> +#default_include: master.d/*.conf
> +
> +# The address of the interface to bind to
> +#interface: 0.0.0.0
> +
> +# Whether the master should listen for IPv6 connections. If this is set to True,
> +# the interface option must be adjusted too (for example: "interface: '::'")
> +#ipv6: False
> +
> +# The tcp port used by the publisher
> +#publish_port: 4505
> +
> +# The user to run the salt-master as. Salt will update all permissions to
> +# allow the specified user to run the master. If the modified files cause
> +# conflicts set verify_env to False.
> +#user: root
> +
> +# Max open files
> +# Each minion connecting to the master uses AT LEAST one file descriptor, the
> +# master subscription connection. If enough minions connect you might start
> +# seeing on the console(and then salt-master crashes):
> +#   Too many open files (tcp_listener.cpp:335)
> +#   Aborted (core dumped)
> +#
> +# By default this value will be the one of `ulimit -Hn`, ie, the hard limit for
> +# max open files.
> +#
> +# If you wish to set a different value than the default one, uncomment and
> +# configure this setting. Remember that this value CANNOT be higher than the
> +# hard limit. Raising the hard limit depends on your OS and/or distribution,
> +# a good way to find the limit is to search the internet for(for example):
> +#   raise max open files hard limit debian
> +#
> +#max_open_files: 100000
> +
> +# The number of worker threads to start, these threads are used to manage
> +# return calls made from minions to the master, if the master seems to be
> +# running slowly, increase the number of threads
> +#worker_threads: 5
> +
> +# The port used by the communication interface. The ret (return) port is the
> +# interface used for the file server, authentication, job returnes, etc.
> +#ret_port: 4506
> +
> +# Specify the location of the daemon process ID file
> +#pidfile: /var/run/salt-master.pid
> +
> +# The root directory prepended to these options: pki_dir, cachedir,
> +# sock_dir, log_file, autosign_file, extension_modules, key_logfile, pidfile.
> +#root_dir: /
> +
> +# Directory used to store public key data
> +#pki_dir: /etc/salt/pki/master
> +
> +# Directory to store job and cache data
> +#cachedir: /var/cache/salt/master
> +
> +# Verify and set permissions on configuration directories at startup
> +#verify_env: True
> +
> +# Set the number of hours to keep old job information in the job cache
> +#keep_jobs: 24
> +
> +# Set the default timeout for the salt command and api, the default is 5
> +# seconds
> +#timeout: 5
> +
> +# The loop_interval option controls the seconds for the master's maintinance
> +# process check cycle. This process updates file server backends, cleans the
> +# job cache and executes the scheduler.
> +#loop_interval: 60
> +
> +# Set the default outputter used by the salt command. The default is "nested"
> +#output: nested
> +
> +# By default output is colored, to disable colored output set the color value
> +# to False
> +#color: True
> +
> +# Set the directory used to hold unix sockets
> +#sock_dir: /var/run/salt/master
> +
> +# The master can take a while to start up when lspci and/or dmidecode is used
> +# to populate the grains for the master. Enable if you want to see GPU hardware
> +# data for your master.
> +#
> +# enable_gpu_grains: False
> +
> +# The master maintains a job cache, while this is a great addition it can be
> +# a burden on the master for larger deployments (over 5000 minions).
> +# Disabling the job cache will make previously executed jobs unavailable to
> +# the jobs system and is not generally recommended.
> +#
> +#job_cache: True
> +
> +# Cache minion grains and pillar data in the cachedir.
> +#minion_data_cache: True
> +
> +# The master can include configuration from other files. To enable this,
> +# pass a list of paths to this option. The paths can be either relative or
> +# absolute; if relative, they are considered to be relative to the directory
> +# the main master configuration file lives in (this file). Paths can make use
> +# of shell-style globbing. If no files are matched by a path passed to this
> +# option then the master will log a warning message.
> +#
> +#
> +# Include a config file from some other path:
> +#include: /etc/salt/extra_config
> +#
> +# Include config from several files and directories:
> +#include:
> +#  - /etc/salt/extra_config
> +
> +
> +#####        Security settings       #####
> +##########################################
> +# Enable "open mode", this mode still maintains encryption, but turns off
> +# authentication, this is only intended for highly secure environments or for
> +# the situation where your keys end up in a bad state. If you run in open mode
> +# you do so at your own risk!
> +#open_mode: False
> +
> +# Enable auto_accept, this setting will automatically accept all incoming
> +# public keys from the minions. Note that this is insecure.
> +#auto_accept: False
> +
> +# If the autosign_file is specified only incoming keys specified in
> +# the autosign_file will be automatically accepted. This is insecure.
> +# Regular expressions as well as globing lines are supported.
> +#autosign_file: /etc/salt/autosign.conf
> +
> +# Enable permissive access to the salt keys.  This allows you to run the
> +# master or minion as root, but have a non-root group be given access to
> +# your pki_dir.  To make the access explicit, root must belong to the group
> +# you've given access to.  This is potentially quite insecure.
> +# If an autosign_file is specified, enabling permissive_pki_access will allow group access
> +# to that specific file.
> +#permissive_pki_access: False
> +
> +# Allow users on the master access to execute specific commands on minions.
> +# This setting should be treated with care since it opens up execution
> +# capabilities to non root users. By default this capability is completely
> +# disabled.
> +#
> +#client_acl:
> +#  larry:
> +#    - test.ping
> +#    - network.*
> +#
> +
> +# Blacklist any of the following users or modules
> +#
> +# This example would blacklist all non sudo users, including root from
> +# running any commands. It would also blacklist any use of the "cmd"
> +# module.
> +# This is completely disabled by default.
> +#
> +#client_acl_blacklist:
> +#  users:
> +#    - root
> +#    - '^(?!sudo_).*$'   #  all non sudo users
> +#  modules:
> +#    - cmd
> +
> +# The external auth system uses the Salt auth modules to authenticate and
> +# validate users to access areas of the Salt system.
> +#
> +#external_auth:
> +#  pam:
> +#    fred:
> +#      - test.*
> +#
> +
> +# Time (in seconds) for a newly generated token to live. Default: 12 hours
> +#token_expire: 43200
> +
> +# Allow minions to push files to the master. This is disabled by default, for
> +# security purposes.
> +#file_recv: False
> +
> +# Signature verification on messages published from the master.
> +# This causes the master to cryptographically sign all messages published to its event
> +# bus, and minions then verify that signature before acting on the message.
> +#
> +# This is False by default.
> +#
> +# Note that to facilitate interoperability with masters and minions that are different
> +# versions, if sign_pub_messages is True but a message is received by a minion with
> +# no signature, it will still be accepted, and a warning message will be logged.
> +# Conversely, if sign_pub_messages is False, but a minion receives a signed
> +# message it will be accepted, the signature will not be checked, and a warning message
> +# will be logged.  This behavior will go away in Salt 0.17.6 (or Hydrogen RC1, whichever
> +# comes first) and these two situations will cause minion to throw an exception and
> +# drop the message.
> +#
> +# sign_pub_messages: False
> +
> +#####    Master Module Management    #####
> +##########################################
> +# Manage how master side modules are loaded
> +
> +# Add any additional locations to look for master runners
> +#runner_dirs: []
> +
> +# Enable Cython for master side modules
> +#cython_enable: False
> +
> +
> +#####      State System settings     #####
> +##########################################
> +# The state system uses a "top" file to tell the minions what environment to
> +# use and what modules to use. The state_top file is defined relative to the
> +# root of the base environment as defined in "File Server settings" below.
> +#state_top: top.sls
> +
> +# The master_tops option replaces the external_nodes option by creating
> +# a plugable system for the generation of external top data. The external_nodes
> +# option is deprecated by the master_tops option.
> +# To gain the capabilities of the classic external_nodes system, use the
> +# following configuration:
> +# master_tops:
> +#   ext_nodes: <Shell command which returns yaml>
> +#
> +#master_tops: {}
> +
> +# The external_nodes option allows Salt to gather data that would normally be
> +# placed in a top file. The external_nodes option is the executable that will
> +# return the ENC data. Remember that Salt will look for external nodes AND top
> +# files and combine the results if both are enabled!
> +#external_nodes: None
> +
> +# The renderer to use on the minions to render the state data
> +#renderer: yaml_jinja
> +
> +# The failhard option tells the minions to stop immediately after the first
> +# failure detected in the state execution, defaults to False
> +#failhard: False
> +
> +# The state_verbose and state_output settings can be used to change the way
> +# state system data is printed to the display. By default all data is printed.
> +# The state_verbose setting can be set to True or False, when set to False
> +# all data that has a result of True and no changes will be suppressed.
> +#state_verbose: True
> +
> +# The state_output setting changes if the output is the full multi line
> +# output for each changed state if set to 'full', but if set to 'terse'
> +# the output will be shortened to a single line.  If set to 'mixed', the output
> +# will be terse unless a state failed, in which case that output will be full.
> +#state_output: full
> +
> +
> +#####      File Server settings      #####
> +##########################################
> +# Salt runs a lightweight file server written in zeromq to deliver files to
> +# minions. This file server is built into the master daemon and does not
> +# require a dedicated port.
> +
> +# The file server works on environments passed to the master, each environment
> +# can have multiple root directories, the subdirectories in the multiple file
> +# roots cannot match, otherwise the downloaded files will not be able to be
> +# reliably ensured. A base environment is required to house the top file.
> +# Example:
> +# file_roots:
> +#   base:
> +#     - /srv/salt/
> +#   dev:
> +#     - /srv/salt/dev/services
> +#     - /srv/salt/dev/states
> +#   prod:
> +#     - /srv/salt/prod/services
> +#     - /srv/salt/prod/states
> +
> +#file_roots:
> +#  base:
> +#    - /srv/salt
> +
> +# The hash_type is the hash to use when discovering the hash of a file on
> +# the master server. The default is md5, but sha1, sha224, sha256, sha384
> +# and sha512 are also supported.
> +#hash_type: md5
> +
> +# The buffer size in the file server can be adjusted here:
> +#file_buffer_size: 1048576
> +
> +# A regular expression (or a list of expressions) that will be matched
> +# against the file path before syncing the modules and states to the minions.
> +# This includes files affected by the file.recurse state.
> +# For example, if you manage your custom modules and states in subversion
> +# and don't want all the '.svn' folders and content synced to your minions,
> +# you could set this to '/\.svn($|/)'. By default nothing is ignored.
> +#
> +#file_ignore_regex:
> +#  - '/\.svn($|/)'
> +#  - '/\.git($|/)'
> +
> +# A file glob (or list of file globs) that will be matched against the file
> +# path before syncing the modules and states to the minions. This is similar
> +# to file_ignore_regex above, but works on globs instead of regex. By default
> +# nothing is ignored.
> +#
> +# file_ignore_glob:
> +#  - '*.pyc'
> +#  - '*/somefolder/*.bak'
> +#  - '*.swp'
> +
> +# File Server Backend
> +# Salt supports a modular fileserver backend system, this system allows
> +# the salt master to link directly to third party systems to gather and
> +# manage the files available to minions. Multiple backends can be
> +# configured and will be searched for the requested file in the order in which
> +# they are defined here. The default setting only enables the standard backend
> +# "roots" which uses the "file_roots" option.
> +#
> +#fileserver_backend:
> +#  - roots
> +#
> +# To use multiple backends list them in the order they are searched:
> +#
> +#fileserver_backend:
> +#  - git
> +#  - roots
> +#
> +# By default, the Salt fileserver recurses fully into all defined environments
> +# to attempt to find files. To limit this behavior so that the fileserver only
> +# traverses directories with SLS files and special Salt directories like _modules,
> +# enable the option below. This might be useful for installations where a file root
> +# has a very large number of files and performance is impacted. Default is False.
> +#
> +# fileserver_limit_traversal: False
> +#
> +# Git fileserver backend configuration
> +# When using the git fileserver backend at least one git remote needs to be
> +# defined. The user running the salt master will need read access to the repo.
> +#
> +#gitfs_remotes:
> +#  - git://github.com/saltstack/salt-states.git
> +#  - file:///var/git/saltmaster
> +#
> +# The repos will be searched in order to find the file requested by a client
> +# and the first repo to have the file will return it.
> +# When using the git backend branches and tags are translated into salt
> +# environments.
> +# Note:  file:// repos will be treated as a remote, so refs you want used must
> +# exist in that repo as *local* refs.
> +#
> +# The gitfs_root option gives the ability to serve files from a subdirectory
> +# within the repository. The path is defined relative to the root of the
> +# repository and defaults to the repository root.
> +#gitfs_root: somefolder/otherfolder
> +
> +
> +#####         Pillar settings        #####
> +##########################################
> +# Salt Pillars allow for the building of global data that can be made selectively
> +# available to different minions based on minion grain filtering. The Salt
> +# Pillar is laid out in the same fashion as the file server, with environments,
> +# a top file and sls files. However, pillar data does not need to be in the
> +# highstate format, and is generally just key/value pairs.
> +
> +#pillar_roots:
> +#  base:
> +#    - /srv/pillar
> +
> +#ext_pillar:
> +#  - hiera: /etc/hiera.yaml
> +#  - cmd_yaml: cat /etc/salt/yaml
> +
> +# The pillar_opts option adds the master configuration file data to a dict in
> +# the pillar called "master". This is used to set simple configurations in the
> +# master config file that can then be used on minions.
> +#pillar_opts: True
> +
> +
> +#####          Syndic settings       #####
> +##########################################
> +# The Salt syndic is used to pass commands through a master from a higher
> +# master. Using the syndic is simple, if this is a master that will have
> +# syndic servers(s) below it set the "order_masters" setting to True, if this
> +# is a master that will be running a syndic daemon for passthrough the
> +# "syndic_master" setting needs to be set to the location of the master server
> +# to receive commands from.
> +
> +# Set the order_masters setting to True if this master will command lower
> +# masters' syndic interfaces.
> +#order_masters: False
> +
> +# If this master will be running a salt syndic daemon, syndic_master tells
> +# this master where to receive commands from.
> +#syndic_master: masterofmaster
> +
> +# This is the 'ret_port' of the MasterOfMaster
> +#syndic_master_port: 4506
> +
> +# PID file of the syndic daemon
> +#syndic_pidfile: /var/run/salt-syndic.pid
> +
> +# LOG file of the syndic daemon
> +#syndic_log_file: syndic.log
> +
> +#####      Peer Publish settings     #####
> +##########################################
> +# Salt minions can send commands to other minions, but only if the minion is
> +# allowed to. By default "Peer Publication" is disabled, and when enabled it
> +# is enabled for specific minions and specific commands. This allows secure
> +# compartmentalization of commands based on individual minions.
> +
> +# The configuration uses regular expressions to match minions and then a list
> +# of regular expressions to match functions. The following will allow the
> +# minion authenticated as foo.example.com to execute functions from the test
> +# and pkg modules.
> +#
> +#peer:
> +#  foo.example.com:
> +#    - test.*
> +#    - pkg.*
> +#
> +# This will allow all minions to execute all commands:
> +#
> +#peer:
> +#  .*:
> +#    - .*
> +#
> +# This is not recommended, since it would allow anyone who gets root on any
> +# single minion to instantly have root on all of the minions!
> +
> +# Minions can also be allowed to execute runners from the salt master.
> +# Since executing a runner from the minion could be considered a security risk,
> +# it needs to be enabled. This setting functions just like the peer setting
> +# except that it opens up runners instead of module functions.
> +#
> +# All peer runner support is turned off by default and must be enabled before
> +# using. This will enable all peer runners for all minions:
> +#
> +#peer_run:
> +#  .*:
> +#    - .*
> +#
> +# To enable just the manage.up runner for the minion foo.example.com:
> +#
> +#peer_run:
> +#  foo.example.com:
> +#    - manage.up
> +
> +
> +#####         Logging settings       #####
> +##########################################
> +# The location of the master log file
> +# The master log can be sent to a regular file, local path name, or network
> +# location. Remote logging works best when configured to use rsyslogd(8) (e.g.:
> +# ``file:///dev/log``), with rsyslogd(8) configured for network logging. The URI
> +# format is: <file|udp|tcp>://<host|socketpath>:<port-if-required>/<log-facility>
> +#log_file: /var/log/salt/master
> +#log_file: file:///dev/log
> +#log_file: udp://loghost:10514
> +
> +#log_file: /var/log/salt/master
> +#key_logfile: /var/log/salt/key
> +
> +# The level of messages to send to the console.
> +# One of 'garbage', 'trace', 'debug', info', 'warning', 'error', 'critical'.
> +#log_level: warning
> +
> +# The level of messages to send to the log file.
> +# One of 'garbage', 'trace', 'debug', info', 'warning', 'error', 'critical'.
> +#log_level_logfile: warning
> +
> +# The date and time format used in log messages. Allowed date/time formating
> +# can be seen here: http://docs.python.org/library/time.html#time.strftime
> +#log_datefmt: '%H:%M:%S'
> +#log_datefmt_logfile: '%Y-%m-%d %H:%M:%S'
> +
> +# The format of the console logging messages. Allowed formatting options can
> +# be seen here: http://docs.python.org/library/logging.html#logrecord-attributes
> +#log_fmt_console: '[%(levelname)-8s] %(message)s'
> +#log_fmt_logfile: '%(asctime)s,%(msecs)03.0f [%(name)-17s][%(levelname)-8s] %(message)s'
> +
> +# This can be used to control logging levels more specificically.  This
> +# example sets the main salt library at the 'warning' level, but sets
> +# 'salt.modules' to log at the 'debug' level:
> +#   log_granular_levels:
> +#     'salt': 'warning',
> +#     'salt.modules': 'debug'
> +#
> +#log_granular_levels: {}
> +
> +
> +#####         Node Groups           #####
> +##########################################
> +# Node groups allow for logical groupings of minion nodes.
> +# A group consists of a group name and a compound target.
> +#
> +#nodegroups:
> +#  group1: 'L@foo.domain.com,bar.domain.com,baz.domain.com and bl*.domain.com'
> +#  group2: 'G@os:Debian and foo.domain.com'
> +
> +
> +#####     Range Cluster settings     #####
> +##########################################
> +# The range server (and optional port) that serves your cluster information
> +# https://github.com/grierj/range/wiki/Introduction-to-Range-with-YAML-files
> +#
> +#range_server: range:80
> +
> +
> +#####     Windows Software Repo settings #####
> +##############################################
> +# Location of the repo on the master
> +#win_repo: '/srv/salt/win/repo'
> +
> +# Location of the master's repo cache file
> +#win_repo_mastercachefile: '/srv/salt/win/repo/winrepo.p'
> +
> +# List of git repositories to include with the local repo
> +#win_gitrepos:
> +#  - 'https://github.com/saltstack/salt-winrepo.git'
> diff --git a/meta-openstack/recipes-support/salt/files/minion b/meta-openstack/recipes-support/salt/files/minion
> new file mode 100644
> index 0000000..8fdde14
> --- /dev/null
> +++ b/meta-openstack/recipes-support/salt/files/minion
> @@ -0,0 +1,494 @@
> +##### Primary configuration settings #####
> +##########################################
> +
> +# Per default the minion will automatically include all config files
> +# from minion.d/*.conf (minion.d is a directory in the same directory
> +# as the main minion config file).
> +#default_include: minion.d/*.conf
> +
> +# Set the location of the salt master server, if the master server cannot be
> +# resolved, then the minion will fail to start.
> +#master: salt
> +
> +# Set whether the minion should connect to the master via IPv6
> +#ipv6: False
> +
> +# Set the number of seconds to wait before attempting to resolve
> +# the master hostname if name resolution fails. Defaults to 30 seconds.
> +# Set to zero if the minion should shutdown and not retry.
> +# retry_dns: 30
> +
> +# Set the port used by the master reply and authentication server
> +#master_port: 4506
> +
> +# The user to run salt
> +#user: root
> +
> +# Specify the location of the daemon process ID file
> +#pidfile: /var/run/salt-minion.pid
> +
> +# The root directory prepended to these options: pki_dir, cachedir, log_file,
> +# sock_dir, pidfile.
> +#root_dir: /
> +
> +# The directory to store the pki information in
> +#pki_dir: /etc/salt/pki/minion
> +
> +# Explicitly declare the id for this minion to use, if left commented the id
> +# will be the hostname as returned by the python call: socket.getfqdn()
> +# Since salt uses detached ids it is possible to run multiple minions on the
> +# same machine but with different ids, this can be useful for salt compute
> +# clusters.
> +#id:
> +
> +# Append a domain to a hostname in the event that it does not exist.  This is
> +# useful for systems where socket.getfqdn() does not actually result in a
> +# FQDN (for instance, Solaris).
> +#append_domain:
> +
> +# Custom static grains for this minion can be specified here and used in SLS
> +# files just like all other grains. This example sets 4 custom grains, with
> +# the 'roles' grain having two values that can be matched against:
> +#grains:
> +#  roles:
> +#    - webserver
> +#    - memcache
> +#  deployment: datacenter4
> +#  cabinet: 13
> +#  cab_u: 14-15
> +
> +# Where cache data goes
> +#cachedir: /var/cache/salt/minion
> +
> +# Verify and set permissions on configuration directories at startup
> +#verify_env: True
> +
> +# The minion can locally cache the return data from jobs sent to it, this
> +# can be a good way to keep track of jobs the minion has executed
> +# (on the minion side). By default this feature is disabled, to enable
> +# set cache_jobs to True
> +#cache_jobs: False
> +
> +# set the directory used to hold unix sockets
> +#sock_dir: /var/run/salt/minion
> +
> +# Set the default outputter used by the salt-call command. The default is
> +# "nested"
> +#output: nested
> +#
> +# By default output is colored, to disable colored output set the color value
> +# to False
> +#color: True
> +
> +# Backup files that are replaced by file.managed and file.recurse under
> +# 'cachedir'/file_backups relative to their original location and appended
> +# with a timestamp. The only valid setting is "minion". Disabled by default.
> +#
> +# Alternatively this can be specified for each file in state files:
> +#
> +# /etc/ssh/sshd_config:
> +#   file.managed:
> +#     - source: salt://ssh/sshd_config
> +#     - backup: minion
> +#
> +#backup_mode: minion
> +
> +# When waiting for a master to accept the minion's public key, salt will
> +# continuously attempt to reconnect until successful. This is the time, in
> +# seconds, between those reconnection attempts.
> +#acceptance_wait_time: 10
> +
> +# If this is nonzero, the time between reconnection attempts will increase by
> +# acceptance_wait_time seconds per iteration, up to this maximum. If this is
> +# set to zero, the time between reconnection attempts will stay constant.
> +#acceptance_wait_time_max: 0
> +
> +# When the master key changes, the minion will try to re-auth itself to receive
> +# the new master key. In larger environments this can cause a SYN flood on the
> +# master because all minions try to re-auth immediately. To prevent this and
> +# have a minion wait for a random amount of time, use this optional parameter.
> +# The wait-time will be a random number of seconds between
> +# 0 and the defined value.
> +#random_reauth_delay: 60
> +
> +
> +# If you don't have any problems with syn-floods, dont bother with the
> +# three recon_* settings described below, just leave the defaults!
> +#
> +# The ZeroMQ pull-socket that binds to the masters publishing interface tries
> +# to reconnect immediately, if the socket is disconnected (for example if
> +# the master processes are restarted). In large setups this will have all
> +# minions reconnect immediately which might flood the master (the ZeroMQ-default
> +# is usually a 100ms delay). To prevent this, these three recon_* settings
> +# can be used.
> +#
> +# recon_default: the interval in milliseconds that the socket should wait before
> +#                trying to reconnect to the master (100ms = 1 second)
> +#
> +# recon_max: the maximum time a socket should wait. each interval the time to wait
> +#            is calculated by doubling the previous time. if recon_max is reached,
> +#            it starts again at recon_default. Short example:
> +#
> +#            reconnect 1: the socket will wait 'recon_default' milliseconds
> +#            reconnect 2: 'recon_default' * 2
> +#            reconnect 3: ('recon_default' * 2) * 2
> +#            reconnect 4: value from previous interval * 2
> +#            reconnect 5: value from previous interval * 2
> +#            reconnect x: if value >= recon_max, it starts again with recon_default
> +#
> +# recon_randomize: generate a random wait time on minion start. The wait time will
> +#                  be a random value between recon_default and recon_default +
> +#                  recon_max. Having all minions reconnect with the same recon_default
> +#                  and recon_max value kind of defeats the purpose of being able to
> +#                  change these settings. If all minions have the same values and your
> +#                  setup is quite large (several thousand minions), they will still
> +#                  flood the master. The desired behaviour is to have timeframe within
> +#                  all minions try to reconnect.
> +
> +# Example on how to use these settings:
> +# The goal: have all minions reconnect within a 60 second timeframe on a disconnect
> +#
> +# The settings:
> +#recon_default: 1000
> +#recon_max: 59000
> +#recon_randomize: True
> +#
> +# Each minion will have a randomized reconnect value between 'recon_default'
> +# and 'recon_default + recon_max', which in this example means between 1000ms
> +# 60000ms (or between 1 and 60 seconds). The generated random-value will be
> +# doubled after each attempt to reconnect. Lets say the generated random
> +# value is 11 seconds (or 11000ms).
> +#
> +# reconnect 1: wait 11 seconds
> +# reconnect 2: wait 22 seconds
> +# reconnect 3: wait 33 seconds
> +# reconnect 4: wait 44 seconds
> +# reconnect 5: wait 55 seconds
> +# reconnect 6: wait time is bigger than 60 seconds (recon_default + recon_max)
> +# reconnect 7: wait 11 seconds
> +# reconnect 8: wait 22 seconds
> +# reconnect 9: wait 33 seconds
> +# reconnect x: etc.
> +#
> +# In a setup with ~6000 thousand hosts these settings would average the reconnects
> +# to about 100 per second and all hosts would be reconnected within 60 seconds.
> +#recon_default: 100
> +#recon_max: 5000
> +#recon_randomize: False
> +
> +# The loop_interval sets how long in seconds the minion will wait between
> +# evaluating the scheduler and running cleanup tasks. This defaults to a
> +# sane 60 seconds, but if the minion scheduler needs to be evaluated more
> +# often lower this value
> +#loop_interval: 60
> +
> +# When healing, a dns_check is run. This is to make sure that the originally
> +# resolved dns has not changed. If this is something that does not happen in
> +# your environment, set this value to False.
> +#dns_check: True
> +
> +# Windows platforms lack posix IPC and must rely on slower TCP based inter-
> +# process communications. Set ipc_mode to 'tcp' on such systems
> +#ipc_mode: ipc
> +#
> +# Overwrite the default tcp ports used by the minion when in tcp mode
> +#tcp_pub_port: 4510
> +#tcp_pull_port: 4511
> +
> +# The minion can include configuration from other files. To enable this,
> +# pass a list of paths to this option. The paths can be either relative or
> +# absolute; if relative, they are considered to be relative to the directory
> +# the main minion configuration file lives in (this file). Paths can make use
> +# of shell-style globbing. If no files are matched by a path passed to this
> +# option then the minion will log a warning message.
> +#
> +#
> +# Include a config file from some other path:
> +# include: /etc/salt/extra_config
> +#
> +# Include config from several files and directories:
> +#include:
> +#  - /etc/salt/extra_config
> +#  - /etc/roles/webserver
> +
> +#####   Minion module management     #####
> +##########################################
> +# Disable specific modules. This allows the admin to limit the level of
> +# access the master has to the minion
> +#disable_modules: [cmd,test]
> +#disable_returners: []
> +#
> +# Modules can be loaded from arbitrary paths. This enables the easy deployment
> +# of third party modules. Modules for returners and minions can be loaded.
> +# Specify a list of extra directories to search for minion modules and
> +# returners. These paths must be fully qualified!
> +#module_dirs: []
> +#returner_dirs: []
> +#states_dirs: []
> +#render_dirs: []
> +#
> +# A module provider can be statically overwritten or extended for the minion
> +# via the providers option, in this case the default module will be
> +# overwritten by the specified module. In this example the pkg module will
> +# be provided by the yumpkg5 module instead of the system default.
> +#
> +#providers:
> +#  pkg: yumpkg5
> +#
> +# Enable Cython modules searching and loading. (Default: False)
> +#cython_enable: False
> +#
> +
> +#####    State Management Settings    #####
> +###########################################
> +# The state management system executes all of the state templates on the minion
> +# to enable more granular control of system state management. The type of
> +# template and serialization used for state management needs to be configured
> +# on the minion, the default renderer is yaml_jinja. This is a yaml file
> +# rendered from a jinja template, the available options are:
> +# yaml_jinja
> +# yaml_mako
> +# yaml_wempy
> +# json_jinja
> +# json_mako
> +# json_wempy
> +#
> +#renderer: yaml_jinja
> +#
> +# The failhard option tells the minions to stop immediately after the first
> +# failure detected in the state execution, defaults to False
> +#failhard: False
> +#
> +# autoload_dynamic_modules Turns on automatic loading of modules found in the
> +# environments on the master. This is turned on by default, to turn of
> +# autoloading modules when states run set this value to False
> +#autoload_dynamic_modules: True
> +#
> +# clean_dynamic_modules keeps the dynamic modules on the minion in sync with
> +# the dynamic modules on the master, this means that if a dynamic module is
> +# not on the master it will be deleted from the minion. By default this is
> +# enabled and can be disabled by changing this value to False
> +#clean_dynamic_modules: True
> +#
> +# Normally the minion is not isolated to any single environment on the master
> +# when running states, but the environment can be isolated on the minion side
> +# by statically setting it. Remember that the recommended way to manage
> +# environments is to isolate via the top file.
> +#environment: None
> +#
> +# If using the local file directory, then the state top file name needs to be
> +# defined, by default this is top.sls.
> +#state_top: top.sls
> +#
> +# Run states when the minion daemon starts. To enable, set startup_states to:
> +# 'highstate' -- Execute state.highstate
> +# 'sls' -- Read in the sls_list option and execute the named sls files
> +# 'top' -- Read top_file option and execute based on that file on the Master
> +#startup_states: ''
> +#
> +# list of states to run when the minion starts up if startup_states is 'sls'
> +#sls_list:
> +#  - edit.vim
> +#  - hyper
> +#
> +# top file to execute if startup_states is 'top'
> +#top_file: ''
> +
> +#####     File Directory Settings    #####
> +##########################################
> +# The Salt Minion can redirect all file server operations to a local directory,
> +# this allows for the same state tree that is on the master to be used if
> +# copied completely onto the minion. This is a literal copy of the settings on
> +# the master but used to reference a local directory on the minion.
> +
> +# Set the file client. The client defaults to looking on the master server for
> +# files, but can be directed to look at the local file directory setting
> +# defined below by setting it to local.
> +#file_client: remote
> +
> +# The file directory works on environments passed to the minion, each environment
> +# can have multiple root directories, the subdirectories in the multiple file
> +# roots cannot match, otherwise the downloaded files will not be able to be
> +# reliably ensured. A base environment is required to house the top file.
> +# Example:
> +# file_roots:
> +#   base:
> +#     - /srv/salt/
> +#   dev:
> +#     - /srv/salt/dev/services
> +#     - /srv/salt/dev/states
> +#   prod:
> +#     - /srv/salt/prod/services
> +#     - /srv/salt/prod/states
> +#
> +#file_roots:
> +#  base:
> +#    - /srv/salt
> +
> +# By default, the Salt fileserver recurses fully into all defined environments
> +# to attempt to find files. To limit this behavior so that the fileserver only
> +# traverses directories with SLS files and special Salt directories like _modules,
> +# enable the option below. This might be useful for installations where a file root
> +# has a very large number of files and performance is negatively impacted.
> +#
> +# Default is False.
> +#
> +# fileserver_limit_traversal: False
> +
> +# The hash_type is the hash to use when discovering the hash of a file in
> +# the local fileserver. The default is md5, but sha1, sha224, sha256, sha384
> +# and sha512 are also supported.
> +#hash_type: md5
> +
> +# The Salt pillar is searched for locally if file_client is set to local. If
> +# this is the case, and pillar data is defined, then the pillar_roots need to
> +# also be configured on the minion:
> +#pillar_roots:
> +#  base:
> +#    - /srv/pillar
> +
> +######        Security settings       #####
> +###########################################
> +# Enable "open mode", this mode still maintains encryption, but turns off
> +# authentication, this is only intended for highly secure environments or for
> +# the situation where your keys end up in a bad state. If you run in open mode
> +# you do so at your own risk!
> +#open_mode: False
> +
> +# Enable permissive access to the salt keys.  This allows you to run the
> +# master or minion as root, but have a non-root group be given access to
> +# your pki_dir.  To make the access explicit, root must belong to the group
> +# you've given access to. This is potentially quite insecure.
> +#permissive_pki_access: False
> +
> +# The state_verbose and state_output settings can be used to change the way
> +# state system data is printed to the display. By default all data is printed.
> +# The state_verbose setting can be set to True or False, when set to False
> +# all data that has a result of True and no changes will be suppressed.
> +#state_verbose: True
> +#
> +# The state_output setting changes if the output is the full multi line
> +# output for each changed state if set to 'full', but if set to 'terse'
> +# the output will be shortened to a single line.
> +#state_output: full
> +#
> +# Fingerprint of the master public key to double verify the master is valid,
> +# the master fingerprint can be found by running "salt-key -F master" on the
> +# salt master.
> +#master_finger: ''
> +
> +######         Thread settings        #####
> +###########################################
> +# Disable multiprocessing support, by default when a minion receives a
> +# publication a new process is spawned and the command is executed therein.
> +#multiprocessing: True
> +
> +#####         Logging settings       #####
> +##########################################
> +# The location of the minion log file
> +# The minion log can be sent to a regular file, local path name, or network
> +# location. Remote logging works best when configured to use rsyslogd(8) (e.g.:
> +# ``file:///dev/log``), with rsyslogd(8) configured for network logging. The URI
> +# format is: <file|udp|tcp>://<host|socketpath>:<port-if-required>/<log-facility>
> +#log_file: /var/log/salt/minion
> +#log_file: file:///dev/log
> +#log_file: udp://loghost:10514
> +#
> +#log_file: /var/log/salt/minion
> +#key_logfile: /var/log/salt/key
> +#
> +# The level of messages to send to the console.
> +# One of 'garbage', 'trace', 'debug', info', 'warning', 'error', 'critical'.
> +# Default: 'warning'
> +#log_level: warning
> +#
> +# The level of messages to send to the log file.
> +# One of 'garbage', 'trace', 'debug', info', 'warning', 'error', 'critical'.
> +# Default: 'warning'
> +#log_level_logfile:
> +
> +# The date and time format used in log messages. Allowed date/time formating
> +# can be seen here: http://docs.python.org/library/time.html#time.strftime
> +#log_datefmt: '%H:%M:%S'
> +#log_datefmt_logfile: '%Y-%m-%d %H:%M:%S'
> +#
> +# The format of the console logging messages. Allowed formatting options can
> +# be seen here: http://docs.python.org/library/logging.html#logrecord-attributes
> +#log_fmt_console: '[%(levelname)-8s] %(message)s'
> +#log_fmt_logfile: '%(asctime)s,%(msecs)03.0f [%(name)-17s][%(levelname)-8s] %(message)s'
> +#
> +# This can be used to control logging levels more specificically.  This
> +# example sets the main salt library at the 'warning' level, but sets
> +# 'salt.modules' to log at the 'debug' level:
> +#   log_granular_levels:
> +#     'salt': 'warning',
> +#     'salt.modules': 'debug'
> +#
> +#log_granular_levels: {}
> +
> +######      Module configuration      #####
> +###########################################
> +# Salt allows for modules to be passed arbitrary configuration data, any data
> +# passed here in valid yaml format will be passed on to the salt minion modules
> +# for use. It is STRONGLY recommended that a naming convention be used in which
> +# the module name is followed by a . and then the value. Also, all top level
> +# data must be applied via the yaml dict construct, some examples:
> +#
> +# You can specify that all modules should run in test mode:
> +#test: True
> +#
> +# A simple value for the test module:
> +#test.foo: foo
> +#
> +# A list for the test module:
> +#test.bar: [baz,quo]
> +#
> +# A dict for the test module:
> +#test.baz: {spam: sausage, cheese: bread}
> +
> +
> +######      Update settings          ######
> +###########################################
> +# Using the features in Esky, a salt minion can both run as a frozen app and
> +# be updated on the fly. These options control how the update process
> +# (saltutil.update()) behaves.
> +#
> +# The url for finding and downloading updates. Disabled by default.
> +#update_url: False
> +#
> +# The list of services to restart after a successful update. Empty by default.
> +#update_restart_services: []
> +
> +
> +######      Keepalive settings        ######
> +############################################
> +# ZeroMQ now includes support for configuring SO_KEEPALIVE if supported by
> +# the OS. If connections between the minion and the master pass through
> +# a state tracking device such as a firewall or VPN gateway, there is
> +# the risk that it could tear down the connection the master and minion
> +# without informing either party that their connection has been taken away.
> +# Enabling TCP Keepalives prevents this from happening.
> +#
> +# Overall state of TCP Keepalives, enable (1 or True), disable (0 or False)
> +# or leave to the OS defaults (-1), on Linux, typically disabled. Default True, enabled.
> +#tcp_keepalive: True
> +#
> +# How long before the first keepalive should be sent in seconds. Default 300
> +# to send the first keepalive after 5 minutes, OS default (-1) is typically 7200 seconds
> +# on Linux see /proc/sys/net/ipv4/tcp_keepalive_time.
> +#tcp_keepalive_idle: 300
> +#
> +# How many lost probes are needed to consider the connection lost. Default -1
> +# to use OS defaults, typically 9 on Linux, see /proc/sys/net/ipv4/tcp_keepalive_probes.
> +#tcp_keepalive_cnt: -1
> +#
> +# How often, in seconds, to send keepalives after the first one. Default -1 to
> +# use OS defaults, typically 75 seconds on Linux, see
> +# /proc/sys/net/ipv4/tcp_keepalive_intvl.
> +#tcp_keepalive_intvl: -1
> +
> +
> +######      Windows Software settings ######
> +############################################
> +# Location of the repository cache file on the master
> +#win_repo_cachefile: 'salt://win/repo/winrepo.p'
> diff --git a/meta-openstack/recipes-support/salt/files/roster b/meta-openstack/recipes-support/salt/files/roster
> new file mode 100644
> index 0000000..3eac2fa
> --- /dev/null
> +++ b/meta-openstack/recipes-support/salt/files/roster
> @@ -0,0 +1,8 @@
> +# Sample salt-ssh config file
> +#web1:
> +#  host: 192.168.42.1 # The IP addr or DNS hostname
> +#  user: fred         # Remote executions will be executed as user fred
> +#  passwd: foobarbaz  # The password to use for login, if omitted, keys are used
> +#  sudo: True         # Whether to sudo to root, not enabled by default
> +#web2:
> +#  host: 192.168.42.2
> diff --git a/meta-openstack/recipes-support/salt/files/salt-api b/meta-openstack/recipes-support/salt/files/salt-api
> new file mode 100755
> index 0000000..4b45bd2
> --- /dev/null
> +++ b/meta-openstack/recipes-support/salt/files/salt-api
> @@ -0,0 +1,110 @@
> +#!/bin/sh
> +### BEGIN INIT INFO
> +# Provides:          salt-api
> +# Required-Start:    $remote_fs $network
> +# Required-Stop:     $remote_fs $network
> +# Default-Start:     2 3 4 5
> +# Default-Stop:      0 1 6
> +# Short-Description: salt api control daemon
> +# Description:       This is a daemon that exposes an external API
> +### END INIT INFO
> +
> +# Author: Michael Prokop <mika@debian.org>
> +
> +PATH=/sbin:/usr/sbin:/bin:/usr/bin
> +DESC="salt api control daemon"
> +NAME=salt-api
> +DAEMON=/usr/bin/salt-api
> +DAEMON_ARGS="-d"
> +PIDFILE=/var/run/$NAME.pid
> +SCRIPTNAME=/etc/init.d/$NAME
> +
> +# Exit if the package is not installed
> +[ -x "$DAEMON" ] || exit 0
> +
> +# Read configuration variable file if it is present
> +[ -r /etc/default/$NAME ] && . /etc/default/$NAME
> +
> +# Source function library.
> +. /etc/init.d/functions
> +
> +do_start() {
> +    # Return
> +    #   0 if daemon has been started
> +    #   1 if daemon was already running
> +    #   2 if daemon could not be started
> +    pid=$(pidof -x $DAEMON)
> +    if [ -n "$pid" ] ; then
> +        return 1
> +    fi
> +
> +    start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON -- $DAEMON_ARGS \
> +            || return 2
> +}
> +
> +do_stop() {
> +    # Return
> +    #   0 if daemon has been stopped
> +    #   1 if daemon was already stopped
> +    #   2 if daemon could not be stopped
> +    #   other if a failure occ
> +    start-stop-daemon --stop --retry=TERM/30/KILL/5 --quiet --pidfile $PIDFILE --name $NAME
> +    RETVAL=$?
> +    [ "$RETVAL" = 2 ] && return 2
> +    rm -f $PIDFILE
> +    return "$RETVAL"
> +}
> +
> +case "$1" in
> +    start)
> +        [ "$VERBOSE" != no ] && echo "Starting $DESC" "$NAME"
> +        do_start
> +        case "$?" in
> +            0|1) [ "$VERBOSE" != no ] && echo OK ;;
> +              2) [ "$VERBOSE" != no ] && echo FAILED ;;
> +        esac
> +        ;;
> +    stop)
> +        [ "$VERBOSE" != no ] && echo "Stopping $DESC" "$NAME"
> +        do_stop
> +        case "$?" in
> +            0|1) [ "$VERBOSE" != no ] && echo OK ;;
> +              2) [ "$VERBOSE" != no ] && echo FAILED ;;
> +        esac
> +        ;;
> +    status)
> +        pid=`pidof -x $DAEMON`
> +        if [ -n "$pid" ]; then
> +            echo "$NAME (pid $pid) is running ..."
> +        else
> +            echo "$NAME is stopped"
> +        fi
> +       ;;
> +    #reload)
> +        # not implemented
> +        #;;
> +    restart|force-reload)
> +        echo "Restarting $DESC" "$NAME"
> +        do_stop
> +        case "$?" in
> +          0|1)
> +              do_start
> +              case "$?" in
> +                  0) echo OK ;;
> +                  1) echo FAILED ;; # Old process is still running
> +                  *) echo FAILED ;; # Failed to start
> +              esac
> +              ;;
> +          *)
> +              # Failed to stop
> +              echo FAILED
> +              ;;
> +        esac
> +        ;;
> +    *)
> +        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
> +        exit 3
> +        ;;
> +esac
> +
> +exit 0
> diff --git a/meta-openstack/recipes-support/salt/files/salt-common.bash_completion b/meta-openstack/recipes-support/salt/files/salt-common.bash_completion
> new file mode 100644
> index 0000000..a457f4d
> --- /dev/null
> +++ b/meta-openstack/recipes-support/salt/files/salt-common.bash_completion
> @@ -0,0 +1,332 @@
> +# written by David Pravec
> +#   - feel free to /msg alekibango on IRC if you want to talk about this file
> +
> +# TODO: check if --config|-c was used and use configured config file for queries
> +# TODO: solve somehow completion for  salt -G pythonversion:[tab]
> +#       (not sure what to do with lists)
> +# TODO: --range[tab] --   how?
> +# TODO: -E --exsel[tab] -- how?
> +# TODO: --compound[tab] -- how?
> +# TODO: use history to extract some words, esp. if ${cur} is empty
> +# TODO: TEST EVERYTING a lot
> +# TODO: cache results of some functions?  where? how long?
> +# TODO: is it ok to use '--timeout 2' ?
> +
> +
> +_salt_get_grains(){
> +    if [ "$1" = 'local' ] ; then
> +        salt-call --out=txt -- grains.ls | sed  's/^.*\[//' | tr -d ",']" |sed 's:\([a-z0-9]\) :\1\: :g'
> +    else
> +      salt '*' --timeout 2 --out=txt -- grains.ls | sed  's/^.*\[//' | tr -d ",']" |sed 's:\([a-z0-9]\) :\1\: :g'
> +    fi
> +}
> +
> +_salt_get_grain_values(){
> +    if [ "$1" = 'local' ] ; then
> +        salt-call --out=txt -- grains.item $1 |sed 's/^\S*:\s//' |grep -v '^\s*$'
> +    else
> +        salt '*' --timeout 2 --out=txt -- grains.item $1 |sed 's/^\S*:\s//' |grep -v '^\s*$'
> +    fi
> +}
> +
> +
> +_salt(){
> +    local cur prev opts _salt_grains _salt_coms pprev ppprev
> +    COMPREPLY=()
> +    cur="${COMP_WORDS[COMP_CWORD]}"
> +    prev="${COMP_WORDS[COMP_CWORD-1]}"
> +    if [ ${COMP_CWORD} -gt 2 ]; then
> +       pprev="${COMP_WORDS[COMP_CWORD-2]}"
> +    fi
> +    if [ ${COMP_CWORD} -gt 3 ]; then
> +       ppprev="${COMP_WORDS[COMP_CWORD-3]}"
> +    fi
> +
> +    opts="-h --help -d --doc --documentation --version --versions-report -c \
> +          --config-dir= -v --verbose -t --timeout= -s --static -b --batch= \
> +          --batch-size= -E --pcre -L --list -G --grain --grain-pcre -N \
> +          --nodegroup -R --range -C --compound -X --exsel -I --pillar \
> +          --return= -a --auth= --eauth= --extended-auth= -T --make-token -S \
> +          --ipcidr --out=pprint --out=yaml --out=overstatestage --out=json \
> +          --out=raw --out=highstate --out=key --out=txt --no-color --out-indent= "
> +
> +    if [[ "${cur}" == -* ]] ; then
> +        COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
> +        return 0
> +    fi
> +
> +    # 2 special cases for filling up grain values
> +    case "${pprev}" in
> +    -G|--grain|--grain-pcre)
> +    if [ "${cur}" = ":" ]; then
> +        COMPREPLY=($(compgen -W "`_salt_get_grain_values ${prev}`"  ))
> +        return 0
> +    fi
> +    ;;
> +    esac
> +    case "${ppprev}" in
> +    -G|--grain|--grain-pcre)
> +        if [ "${prev}" = ":" ]; then
> +        COMPREPLY=( $(compgen -W "`_salt_get_grain_values ${pprev}`" -- ${cur}) )
> +        return 0
> +        fi
> +    ;;
> +    esac
> +
> +    if [ "${cur}" = "=" ] && [[ "${prev}" == --* ]]; then
> +       cur=""
> +    fi
> +    if [ "${prev}" = "=" ] && [[ "${pprev}" == --* ]]; then
> +       prev="${pprev}"
> +    fi
> +
> +   case "${prev}" in
> +
> +     -c|--config)
> +        COMPREPLY=($(compgen -f -- ${cur}))
> +        return 0
> +        ;;
> +     salt)
> +        COMPREPLY=($(compgen -W "\'*\' ${opts} `salt-key --no-color -l acc`" -- ${cur}))
> +        return 0
> +        ;;
> +     -E|--pcre)
> +        COMPREPLY=($(compgen -W "`salt-key --no-color -l acc`" -- ${cur}))
> +        return 0
> +        ;;
> +     -G|--grain|--grain-pcre)
> +        COMPREPLY=($(compgen -W "$(_salt_get_grains)" -- ${cur}))
> +        return 0
> +       ;;
> +     -C|--compound)
> +        COMPREPLY=() # TODO: finish this one? how?
> +        return 0
> +        ;;
> +     -t|--timeout)
> +        COMPREPLY=($( compgen -W "1 2 3 4 5 6 7 8 9 10 15 20 30 40 60 90 120 180" -- ${cur}))
> +        return 0
> +        ;;
> +     -b|--batch|--batch-size)
> +        COMPREPLY=($(compgen -W "1 2 3 4 5 6 7 8 9 10 15 20 30 40 50 60 70 80 90 100 120 150 200"))
> +        return 0
> +        ;;
> +     -X|--exsel) # TODO: finish this one? how?
> +        return 0
> +        ;;
> +     -N|--nodegroup)
> +           MASTER_CONFIG='/etc/salt/master'
> +        COMPREPLY=($(compgen -W "`awk -F ':'  'BEGIN {print_line = 0};  /^nodegroups/ {print_line = 1;getline } print_line && /^  */ {print $1} /^[^ ]/ {print_line = 0}' <${MASTER_CONFIG}`" -- ${cur}))
> +        return 0
> +     ;;
> +    esac
> +
> +    _salt_coms="$(salt '*' --timeout 2 --out=txt -- sys.list_functions | sed 's/^.*\[//' | tr -d ",']" )"
> +    all="${opts} ${_salt_coms}"
> +    COMPREPLY=( $(compgen -W "${all}" -- ${cur}) )
> +
> +  return 0
> +}
> +
> +complete -F _salt salt
> +
> +
> +_saltkey(){
> +    local cur prev opts prev pprev
> +    COMPREPLY=()
> +    cur="${COMP_WORDS[COMP_CWORD]}"
> +    prev="${COMP_WORDS[COMP_CWORD-1]}"
> +    opts="-c --config-dir= -h --help --version --versions-report -q --quiet \
> +          -y --yes --gen-keys= --gen-keys-dir= --keysize= --key-logfile= \
> +          -l --list= -L --list-all -a --accept= -A --accept-all \
> +          -r --reject= -R --reject-all -p --print= -P --print-all \
> +          -d --delete= -D --delete-all -f --finger= -F --finger-all \
> +          --out=pprint --out=yaml --out=overstatestage --out=json --out=raw \
> +          --out=highstate --out=key --out=txt --no-color --out-indent= "
> +    if [ ${COMP_CWORD} -gt 2 ]; then
> +        pprev="${COMP_WORDS[COMP_CWORD-2]}"
> +    fi
> +    if [ ${COMP_CWORD} -gt 3 ]; then
> +        ppprev="${COMP_WORDS[COMP_CWORD-3]}"
> +    fi
> +    if [[ "${cur}" == -* ]] ; then
> +        COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
> +        return 0
> +    fi
> +
> +    if [ "${cur}" = "=" ] && [[ "${prev}" == --* ]]; then
> +       cur=""
> +    fi
> +    if [ "${prev}" = "=" ] && [[ "${pprev}" == --* ]]; then
> +       prev="${pprev}"
> +    fi
> +
> +    case "${prev}" in
> +     -a|--accept)
> +        COMPREPLY=($(compgen -W "$(salt-key -l un --no-color; salt-key -l rej --no-color)" -- ${cur}))
> +        return 0
> +      ;;
> +     -r|--reject)
> +        COMPREPLY=($(compgen -W "$(salt-key -l acc --no-color)" -- ${cur}))
> +        return 0
> +        ;;
> +     -d|--delete)
> +        COMPREPLY=($(compgen -W "$(salt-key -l acc --no-color; salt-key -l un --no-color; salt-key -l rej --no-color)" -- ${cur}))
> +        return 0
> +        ;;
> +     -c|--config)
> +        COMPREPLY=($(compgen -f -- ${cur}))
> +        return 0
> +        ;;
> +     --keysize)
> +        COMPREPLY=($(compgen -W "2048 3072 4096 5120 6144" -- ${cur}))
> +        return 0
> +        ;;
> +     --gen-keys)
> +        return 0
> +        ;;
> +     --gen-keys-dir)
> +        COMPREPLY=($(compgen -d -- ${cur}))
> +        return 0
> +        ;;
> +     -p|--print)
> +        COMPREPLY=($(compgen -W "$(salt-key -l acc --no-color; salt-key -l un --no-color; salt-key -l rej --no-color)" -- ${cur}))
> +        return 0
> +     ;;
> +     -l|--list)
> +        COMPREPLY=($(compgen -W "pre un acc accepted unaccepted rej rejected all" -- ${cur}))
> +        return 0
> +     ;;
> +     --accept-all)
> +       return 0
> +     ;;
> +    esac
> +    COMPREPLY=($(compgen -W "${opts} " -- ${cur}))
> +    return 0
> +}
> +
> +complete -F _saltkey salt-key
> +
> +_saltcall(){
> +    local cur prev opts _salt_coms pprev ppprev
> +    COMPREPLY=()
> +    cur="${COMP_WORDS[COMP_CWORD]}"
> +    prev="${COMP_WORDS[COMP_CWORD-1]}"
> +    opts="-h --help -d --doc --documentation --version --versions-report \
> +          -m --module-dirs= -g --grains --return= --local -c --config-dir= -l --log-level= \
> +          --out=pprint --out=yaml --out=overstatestage --out=json --out=raw \
> +          --out=highstate --out=key --out=txt --no-color --out-indent= "
> +    if [ ${COMP_CWORD} -gt 2 ]; then
> +        pprev="${COMP_WORDS[COMP_CWORD-2]}"
> +    fi
> +    if [ ${COMP_CWORD} -gt 3 ]; then
> +        ppprev="${COMP_WORDS[COMP_CWORD-3]}"
> +    fi
> +    if [[ "${cur}" == -* ]] ; then
> +        COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
> +        return 0
> +    fi
> +
> +    if [ "${cur}" = "=" ] && [[ ${prev} == --* ]]; then
> +       cur=""
> +    fi
> +    if [ "${prev}" = "=" ] && [[ ${pprev} == --* ]]; then
> +       prev="${pprev}"
> +    fi
> +
> +    case ${prev} in
> +        -m|--module-dirs)
> +                COMPREPLY=( $(compgen -d ${cur} ))
> +               return 0
> +               ;;
> +       -l|--log-level)
> +               COMPREPLY=( $(compgen -W "info none garbage trace warning error debug" -- ${cur}))
> +               return 0
> +               ;;
> +       -g|grains)
> +                return 0
> +               ;;
> +       salt-call)
> +                COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
> +               return 0
> +               ;;
> +    esac
> +
> +    _salt_coms="$(salt-call --out=txt -- sys.list_functions|sed 's/^.*\[//' | tr -d ",']"  )"
> +    COMPREPLY=( $(compgen -W "${opts} ${_salt_coms}" -- ${cur} ))
> +    return 0
> +}
> +
> +complete -F _saltcall salt-call
> +
> +
> +_saltcp(){
> +    local cur prev opts target prefpart postpart helper filt pprev ppprev
> +    COMPREPLY=()
> +    cur="${COMP_WORDS[COMP_CWORD]}"
> +    prev="${COMP_WORDS[COMP_CWORD-1]}"
> +    opts="-t --timeout= -s --static -b --batch= --batch-size= \
> +          -h --help --version --versions-report -c --config-dir= \
> +          -E --pcre -L --list -G --grain --grain-pcre -N --nodegroup \
> +          -R --range -C --compound -X --exsel -I --pillar \
> +          --out=pprint --out=yaml --out=overstatestage --out=json --out=raw \
> +          --out=highstate --out=key --out=txt --no-color --out-indent= "
> +    if [[ "${cur}" == -* ]] ; then
> +        COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
> +        return 0
> +    fi
> +
> +    if [ "${cur}" = "=" ] && [[ "${prev}" == --* ]]; then
> +       cur=""
> +    fi
> +    if [ "${prev}" = "=" ] && [[ "${pprev}" == --* ]]; then
> +       prev=${pprev}
> +    fi
> +
> +    case ${prev} in
> +       salt-cp)
> +           COMPREPLY=($(compgen -W "${opts} `salt-key -l acc --no-color`" -- ${cur}))
> +           return 0
> +       ;;
> +        -t|--timeout)
> +           # those numbers are just a hint
> +            COMPREPLY=($(compgen -W "2 3 4 8 10 15 20 25 30 40 60 90 120 180 240 300" -- ${cur} ))
> +           return 0
> +        ;;
> +       -E|--pcre)
> +            COMPREPLY=($(compgen -W "`salt-key -l acc --no-color`" -- ${cur}))
> +            return 0
> +       ;;
> +       -L|--list)
> +           # IMPROVEMENTS ARE WELCOME
> +           prefpart="${cur%,*},"
> +           postpart=${cur##*,}
> +           filt="^\($(echo ${cur}| sed 's:,:\\|:g')\)$"
> +            helper=($(salt-key -l acc --no-color | grep -v "${filt}" | sed "s/^/${prefpart}/"))
> +           COMPREPLY=($(compgen -W "${helper[*]}" -- ${cur}))
> +
> +           return 0
> +       ;;
> +       -G|--grain|--grain-pcre)
> +            COMPREPLY=($(compgen -W "$(_salt_get_grains)" -- ${cur}))
> +            return 0
> +           ;;
> +           # FIXME
> +       -R|--range)
> +           # FIXME ??
> +           return 0
> +       ;;
> +       -C|--compound)
> +           # FIXME ??
> +           return 0
> +       ;;
> +       -c|--config)
> +           COMPREPLY=($(compgen -f -- ${cur}))
> +           return 0
> +       ;;
> +    esac
> +
> +   # default is using opts:
> +   COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
> +}
> +
> +complete -F _saltcp salt-cp
> diff --git a/meta-openstack/recipes-support/salt/files/salt-common.logrotate b/meta-openstack/recipes-support/salt/files/salt-common.logrotate
> new file mode 100644
> index 0000000..dcfd268
> --- /dev/null
> +++ b/meta-openstack/recipes-support/salt/files/salt-common.logrotate
> @@ -0,0 +1,10 @@
> +/var/log/salt/master
> +/var/log/salt/minion
> +/var/log/salt/*.log
> +{
> +       weekly
> +       missingok
> +       rotate 7
> +       compress
> +       notifempty
> +}
> diff --git a/meta-openstack/recipes-support/salt/files/salt-master b/meta-openstack/recipes-support/salt/files/salt-master
> new file mode 100755
> index 0000000..b534b36
> --- /dev/null
> +++ b/meta-openstack/recipes-support/salt/files/salt-master
> @@ -0,0 +1,111 @@
> +#!/bin/sh
> +### BEGIN INIT INFO
> +# Provides:          salt-master
> +# Required-Start:    $remote_fs $network
> +# Required-Stop:     $remote_fs $network
> +# Default-Start:     2 3 4 5
> +# Default-Stop:      0 1 6
> +# Short-Description: salt master control daemon
> +# Description:       This is a daemon that controls the salt minions
> +### END INIT INFO
> +
> +# Author: Michael Prokop <mika@debian.org>
> +
> +PATH=/sbin:/usr/sbin:/bin:/usr/bin
> +DESC="salt master control daemon"
> +NAME=salt-master
> +DAEMON=/usr/bin/salt-master
> +DAEMON_ARGS="-d"
> +PIDFILE=/var/run/$NAME.pid
> +SCRIPTNAME=/etc/init.d/$NAME
> +
> +# Exit if the package is not installed
> +[ -x "$DAEMON" ] || exit 0
> +
> +# Read configuration variable file if it is present
> +[ -r /etc/default/$NAME ] && . /etc/default/$NAME
> +
> +# Source function library.
> +. /etc/init.d/functions
> +
> +do_start() {
> +    # Return
> +    #   0 if daemon has been started
> +    #   1 if daemon was already running
> +    #   2 if daemon could not be started
> +    pid=$(pidof -x  $DAEMON)
> +    if [ -n "$pid" ] ; then
> +        return 1
> +    fi
> +
> +    start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON -- \
> +            $DAEMON_ARGS \
> +            || return 2
> +}
> +
> +do_stop() {
> +    # Return
> +    #   0 if daemon has been stopped
> +    #   1 if daemon was already stopped
> +    #   2 if daemon could not be stopped
> +    #   other if a failure occurred
> +    start-stop-daemon --stop --quiet --retry=TERM/30/KILL/5 --pidfile $PIDFILE --name $NAME
> +    RETVAL="$?"
> +    [ "$RETVAL" = 2 ] && return 2
> +    rm -f $PIDFILE
> +    return "$RETVAL"
> +}
> +
> +case "$1" in
> +    start)
> +        [ "$VERBOSE" != no ] && echo "Starting $DESC" "$NAME"
> +        do_start
> +        case "$?" in
> +            0|1) [ "$VERBOSE" != no ] && echo OK ;;
> +              2) [ "$VERBOSE" != no ] && echo FAILED ;;
> +        esac
> +        ;;
> +    stop)
> +        [ "$VERBOSE" != no ] && echo "Stopping $DESC" "$NAME"
> +        do_stop
> +        case "$?" in
> +            0|1) [ "$VERBOSE" != no ] && echo OK ;;
> +              2) [ "$VERBOSE" != no ] && echo FAILED ;;
> +        esac
> +        ;;
> +    status)
> +        pid=`pidof -x $DAEMON`
> +        if [ -n "$pid" ]; then
> +           echo "$NAME (pid $pid) is running ..."
> +       else
> +           echo "$NAME is stopped"
> +       fi
> +        ;;
> +    #reload)
> +        # not implemented
> +        #;;
> +    restart|force-reload)
> +        echo "Restarting $DESC" "$NAME"
> +        do_stop
> +        case "$?" in
> +          0|1)
> +              do_start
> +              case "$?" in
> +                  0) echo OK ;;
> +                  1) echo FAILED ;; # Old process is still running
> +                  *) echo FAILED ;; # Failed to start
> +              esac
> +              ;;
> +          *)
> +              # Failed to stop
> +              echo FAILED
> +              ;;
> +        esac
> +        ;;
> +    *)
> +        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
> +        exit 3
> +        ;;
> +esac
> +
> +exit 0
> diff --git a/meta-openstack/recipes-support/salt/files/salt-minion b/meta-openstack/recipes-support/salt/files/salt-minion
> new file mode 100755
> index 0000000..e062017
> --- /dev/null
> +++ b/meta-openstack/recipes-support/salt/files/salt-minion
> @@ -0,0 +1,111 @@
> +#!/bin/sh
> +### BEGIN INIT INFO
> +# Provides:          salt-minion
> +# Required-Start:    $remote_fs $network
> +# Required-Stop:     $remote_fs $network
> +# Default-Start:     2 3 4 5
> +# Default-Stop:      0 1 6
> +# Short-Description: salt minion control daemon
> +# Description:       This is a daemon that receives commands from a salt-master
> +### END INIT INFO
> +
> +# Author: Michael Prokop <mika@debian.org>
> +
> +PATH=/sbin:/usr/sbin:/bin:/usr/bin
> +DESC="salt minion control daemon"
> +NAME=salt-minion
> +DAEMON=/usr/bin/salt-minion
> +DAEMON_ARGS="-d"
> +PIDFILE=/var/run/$NAME.pid
> +SCRIPTNAME=/etc/init.d/$NAME
> +
> +# Exit if the package is not installed
> +[ -x "$DAEMON" ] || exit 0
> +
> +# Read configuration variable file if it is present
> +[ -r /etc/default/$NAME ] && . /etc/default/$NAME
> +
> +# Source function library.
> +. /etc/init.d/functions
> +
> +do_start() {
> +    # Return
> +    #   0 if daemon has been started
> +    #   1 if daemon was already running
> +    #   2 if daemon could not be started
> +    pid=$(pidof -x $DAEMON)
> +    if [ -n "$pid" ] ; then
> +        return 1
> +    fi
> +
> +    start-stop-daemon --start --quiet --background --pidfile $PIDFILE --exec $DAEMON -- \
> +            $DAEMON_ARGS \
> +            || return 2
> +}
> +
> +do_stop() {
> +    # Return
> +    #   0 if daemon has been stopped
> +    #   1 if daemon was already stopped
> +    #   2 if daemon could not be stopped
> +    #   other if a failure occurred
> +    start-stop-daemon --stop --quiet --retry=TERM/30/KILL/5 --pidfile $PIDFILE --name $NAME
> +    RETVAL="$?"
> +    [ "$RETVAL" = 2 ] && return 2
> +    rm -f $PIDFILE
> +    return "$RETVAL"
> +}
> +
> +case "$1" in
> +    start)
> +        [ "$VERBOSE" != no ] && echo "Starting $DESC" "$NAME"
> +        do_start
> +        case "$?" in
> +            0|1) [ "$VERBOSE" != no ] && echo OK ;;
> +              2) [ "$VERBOSE" != no ] && echo FAILED ;;
> +        esac
> +        ;;
> +    stop)
> +        [ "$VERBOSE" != no ] && echo "Stopping $DESC" "$NAME"
> +        do_stop
> +        case "$?" in
> +            0|1) [ "$VERBOSE" != no ] && echo OK ;;
> +              2) [ "$VERBOSE" != no ] && echo FAILED ;;
> +        esac
> +        ;;
> +    status)
> +        pid=`pidof -x $DAEMON`
> +       if [ -n "$pid" ]; then
> +               echo "$NAME (pid $pid) is running ..."
> +       else
> +               echo "$NAME is stopped"
> +       fi
> +       ;;
> +    #reload)
> +        # not implemented
> +        #;;
> +    restart|force-reload)
> +        echo "Restarting $DESC" "$NAME"
> +        do_stop
> +        case "$?" in
> +          0|1)
> +              do_start
> +              case "$?" in
> +                  0) echo OK ;;
> +                  1) echo FAILED ;; # Old process is still running
> +                  *) echo FAILED ;; # Failed to start
> +              esac
> +              ;;
> +          *)
> +              # Failed to stop
> +              echo FAILED
> +              ;;
> +        esac
> +        ;;
> +    *)
> +        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
> +        exit 3
> +        ;;
> +esac
> +
> +exit 0
> diff --git a/meta-openstack/recipes-support/salt/files/salt-syndic b/meta-openstack/recipes-support/salt/files/salt-syndic
> new file mode 100755
> index 0000000..6d5cdff
> --- /dev/null
> +++ b/meta-openstack/recipes-support/salt/files/salt-syndic
> @@ -0,0 +1,111 @@
> +#!/bin/sh
> +### BEGIN INIT INFO
> +# Provides:          salt-syndic
> +# Required-Start:    $remote_fs $network
> +# Required-Stop:     $remote_fs $network
> +# Default-Start:     2 3 4 5
> +# Default-Stop:      0 1 6
> +# Short-Description: salt syndic control daemon
> +# Description:       This is a daemon for the master of masters
> +### END INIT INFO
> +
> +# Author: Michael Prokop <mika@debian.org>
> +
> +PATH=/sbin:/usr/sbin:/bin:/usr/bin
> +DESC="salt syndic control daemon"
> +NAME=salt-syndic
> +DAEMON=/usr/bin/salt-syndic
> +DAEMON_ARGS="-d"
> +PIDFILE=/var/run/$NAME.pid
> +SCRIPTNAME=/etc/init.d/$NAME
> +
> +# Exit if the package is not installed
> +[ -x "$DAEMON" ] || exit 0
> +
> +# Read configuration variable file if it is present
> +[ -r /etc/default/$NAME ] && . /etc/default/$NAME
> +
> +# Source function library.
> +. /etc/init.d/functions
> +
> +do_start() {
> +    # Return
> +    #   0 if daemon has been started
> +    #   1 if daemon was already running
> +    #   2 if daemon could not be started
> +    pid=$(pidof -x $DAEMON)
> +    if [ -n "$pid" ] ; then
> +        return 1
> +    fi
> +
> +    start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON -- \
> +            $DAEMON_ARGS \
> +            || return 2
> +}
> +
> +do_stop() {
> +    # Return
> +    #   0 if daemon has been stopped
> +    #   1 if daemon was already stopped
> +    #   2 if daemon could not be stopped
> +    #   other if a failure occurred
> +    start-stop-daemon --stop --quiet --retry=TERM/30/KILL/5 --pidfile $PIDFILE --name $NAME
> +    RETVAL="$?"
> +    [ "$RETVAL" = 2 ] && return 2
> +    rm -f $PIDFILE
> +    return "$RETVAL"
> +}
> +
> +case "$1" in
> +    start)
> +        [ "$VERBOSE" != no ] && echo "Starting $DESC" "$NAME"
> +        do_start
> +        case "$?" in
> +            0|1) [ "$VERBOSE" != no ] && echo OK ;;
> +              2) [ "$VERBOSE" != no ] && echo FAILED ;;
> +        esac
> +        ;;
> +    stop)
> +        [ "$VERBOSE" != no ] && echo "Stopping $DESC" "$NAME"
> +        do_stop
> +        case "$?" in
> +            0|1) [ "$VERBOSE" != no ] && echo OK ;;
> +              2) [ "$VERBOSE" != no ] && echo FAILED ;;
> +        esac
> +        ;;
> +    status)
> +        pid=`pidof -x $DAEMON`
> +        if [ -n "$pid" ]; then
> +           echo "$NAME (pid $pid) is running ..."
> +       else
> +           echo "$NAME is stopped"
> +        fi
> +       ;;
> +    #reload)
> +        # not implemented
> +        #;;
> +    restart|force-reload)
> +        echo "Restarting $DESC" "$NAME"
> +        do_stop
> +        case "$?" in
> +          0|1)
> +              do_start
> +              case "$?" in
> +                  0) echo OK ;;
> +                  1) echo FAILED ;; # Old process is still running
> +                  *) echo FAILED ;; # Failed to start
> +              esac
> +              ;;
> +          *)
> +              # Failed to stop
> +              echo FAILED
> +              ;;
> +        esac
> +        ;;
> +    *)
> +        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
> +        exit 3
> +        ;;
> +esac
> +
> +exit 0
> diff --git a/meta-openstack/recipes-support/salt/salt/set_python_location_hashbang.patch b/meta-openstack/recipes-support/salt/salt/set_python_location_hashbang.patch
> new file mode 100644
> index 0000000..2369d4c
> --- /dev/null
> +++ b/meta-openstack/recipes-support/salt/salt/set_python_location_hashbang.patch
> @@ -0,0 +1,107 @@
> +Upstream-Status: Pending
> +
> +# The Salt SysV scripts require that the process name of the salt
> +# components have the form "salt-<component>".
> +# The current python shebangs on the salt components scripts spwans
> +# processes that are generically named python. Changed shebang so
> +# process names will be identifiable by the init scripts.
> +
> +diff -Naur a/scripts/salt-api b/scripts/salt-api
> +--- a/scripts/salt-api 2015-04-08 16:48:01.912294278 -0500
> ++++ b/scripts/salt-api 2015-04-08 16:49:03.336483297 -0500
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/python
> +
> + # Import salt libs
> + from salt.scripts import salt_api
> +diff -Naur a/scripts/salt-call b/scripts/salt-call
> +--- a/scripts/salt-call        2015-04-08 16:48:01.912294278 -0500
> ++++ b/scripts/salt-call        2015-04-08 16:49:11.360507977 -0500
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/python
> + '''
> + Directly call a salt command in the modules, does not require a running salt
> + minion to run.
> +diff -Naur a/scripts/salt-cloud b/scripts/salt-cloud
> +--- a/scripts/salt-cloud       2015-04-08 16:48:01.912294278 -0500
> ++++ b/scripts/salt-cloud       2015-04-08 16:49:20.612536436 -0500
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/python
> + '''
> + Publish commands to the salt system from the command line on the master.
> + '''
> +diff -Naur a/scripts/salt-cp b/scripts/salt-cp
> +--- a/scripts/salt-cp  2015-04-08 16:48:01.912294278 -0500
> ++++ b/scripts/salt-cp  2015-04-08 16:49:30.132565723 -0500
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/python
> + '''
> + Publish commands to the salt system from the command line on the master.
> + '''
> +diff -Naur a/scripts/salt-key b/scripts/salt-key
> +--- a/scripts/salt-key 2015-04-08 16:48:01.912294278 -0500
> ++++ b/scripts/salt-key 2015-04-08 16:49:39.912595801 -0500
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/python
> + '''
> + Manage the authentication keys with salt-key
> + '''
> +diff -Naur a/scripts/salt-master b/scripts/salt-master
> +--- a/scripts/salt-master      2015-04-08 16:48:01.912294278 -0500
> ++++ b/scripts/salt-master      2015-04-08 16:49:50.224627508 -0500
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/python
> + '''
> + Start the salt-master
> + '''
> +diff -Naur a/scripts/salt-minion b/scripts/salt-minion
> +--- a/scripts/salt-minion      2015-04-08 16:48:01.912294278 -0500
> ++++ b/scripts/salt-minion      2015-04-08 16:49:57.808650832 -0500
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/python
> + '''
> + This script is used to kick off a salt minion daemon
> + '''
> +diff -Naur a/scripts/salt-run b/scripts/salt-run
> +--- a/scripts/salt-run 2015-04-08 16:48:01.912294278 -0500
> ++++ b/scripts/salt-run 2015-04-08 16:50:06.588677825 -0500
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/python
> + '''
> + Execute a salt convenience routine
> + '''
> +diff -Naur a/scripts/salt-ssh b/scripts/salt-ssh
> +--- a/scripts/salt-ssh 2015-04-08 16:48:01.912294278 -0500
> ++++ b/scripts/salt-ssh 2015-04-08 16:50:13.680699631 -0500
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/python
> + '''
> + Execute the salt ssh system
> + '''
> +diff -Naur a/scripts/salt-syndic b/scripts/salt-syndic
> +--- a/scripts/salt-syndic      2015-04-08 16:48:01.912294278 -0500
> ++++ b/scripts/salt-syndic      2015-04-08 16:50:20.892721803 -0500
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/python
> + '''
> + This script is used to kick off a salt syndic daemon
> + '''
> +diff -Naur a/scripts/salt-unity b/scripts/salt-unity
> +--- a/scripts/salt-unity       2015-04-08 16:48:01.912294278 -0500
> ++++ b/scripts/salt-unity       2015-04-08 16:50:35.968768142 -0500
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python2
> ++#!/usr/bin/python2
> +
> + # Import python libs
> + import sys
> diff --git a/meta-openstack/recipes-support/salt/salt_2014.7.4.bb b/meta-openstack/recipes-support/salt/salt_2014.7.4.bb
> new file mode 100644
> index 0000000..5b618e0
> --- /dev/null
> +++ b/meta-openstack/recipes-support/salt/salt_2014.7.4.bb
> @@ -0,0 +1,145 @@
> +HOMEPAGE = "http://saltstack.com/"
> +SECTION = "admin"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5357642471cfab4740d1d0a20c51af6a"
> +DEPENDS = "\
> +           python-msgpack \
> +           python-pyyaml \
> +           python-jinja2 \
> +           python-markupsafe \
> +           python-requests \
> +           python-pyzmq \
> +           python-pycrypto \
> +           python-m2crypto \
> +"
> +
> +SRCNAME = "salt"
> +SRC_URI = "http://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
> +           file://set_python_location_hashbang.patch \
> +           file://minion \
> +           file://salt-minion \
> +           file://salt-common.bash_completion \
> +           file://salt-common.logrotate \
> +           file://salt-api \
> +           file://salt-master \
> +           file://master \
> +           file://salt-syndic \
> +           file://cloud \
> +           file://roster \
> +"
> +
> +SRC_URI[md5sum] = "622404c0a6c38224f82a4c7b2927db61"
> +SRC_URI[sha256sum] = "0adf4c138ebd26745b1d1157be0772d89da3582fe8a6622a8031cbe32a28e9f3"
> +
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +inherit setuptools update-rc.d
> +
> +PACKAGES += "\
> +           ${PN}-api \
> +           ${PN}-cloud \
> +           ${PN}-common \
> +           ${PN}-master \
> +           ${PN}-minion \
> +           ${PN}-ssh \
> +           ${PN}-syndic \
> +           ${PN}-bash-completion \
> +"
> +
> +do_install_append() {
> +        install -d ${D}${sysconfdir}/bash_completion.d/
> +        install -m 0644 ${WORKDIR}/salt-common.bash_completion ${D}${sysconfdir}/bash_completion.d/${PN}-common
> +        install -d ${D}${sysconfdir}/logrotate.d/
> +        install -m 0644 ${WORKDIR}/salt-common.logrotate ${D}${sysconfdir}/logrotate.d/${PN}-common
> +        install -d ${D}${sysconfdir}/init.d/
> +        install -m 0755 ${WORKDIR}/salt-minion ${D}${sysconfdir}/init.d/${PN}-minion
> +        install -m 0755 ${WORKDIR}/salt-api ${D}${sysconfdir}/init.d/${PN}-api
> +        install -m 0755 ${WORKDIR}/salt-master ${D}${sysconfdir}/init.d/${PN}-master
> +        install -m 0755 ${WORKDIR}/salt-syndic ${D}${sysconfdir}/init.d/${PN}-syndic
> +        install -d ${D}${sysconfdir}/${PN}/
> +        install -m 0644 ${WORKDIR}/minion ${D}${sysconfdir}/${PN}/minion
> +        install -m 0644 ${WORKDIR}/master ${D}${sysconfdir}/${PN}/master
> +        install -m 0644 ${WORKDIR}/cloud ${D}${sysconfdir}/${PN}/cloud
> +        install -m 0644 ${WORKDIR}/roster ${D}${sysconfdir}/${PN}/roster
> +        install -d ${D}${sysconfdir}/${PN}/cloud.conf.d ${D}${sysconfdir}/${PN}/cloud.profiles.d ${D}${sysconfdir}/${PN}/cloud.providers.d
> +}
> +
> +ALLOW_EMPTY_${PN} = "1"
> +FILES_${PN} = ""
> +
> +INITSCRIPT_PACKAGES = "${PN}-minion ${PN}-api ${PN}-master ${PN}-syndic"
> +
> +DESCRIPTION_COMMON = "salt is a powerful remote execution manager that can be used to administer servers in a\
> + fast and efficient way. It allows commands to be executed across large groups of servers. This means systems\
> + can be easily managed, but data can also be easily gathered. Quick introspection into running systems becomes\
> + a reality. Remote execution is usually used to set up a certain state on a remote system. Salt addresses this\
> + problem as well, the salt state system uses salt state files to define the state a server needs to be in. \
> +Between the remote execution system, and state management Salt addresses the backbone of cloud and data center\
> + management."
> +
> +SUMMARY_${PN}-minion = "client package for salt, the distributed remote execution system"
> +DESCRIPTION_${PN}-minion = "${DESCRIPTION_COMMON} This particular package provides the worker agent for salt."
> +RDEPENDS_${PN}-minion = "python ${PN}-common (= ${EXTENDPKGV}) python-m2crypto python-pycrypto python-msgpack python-pyzmq (>= 13.1.0)"
> +RRECOMMENDS_${PN}-minion_append_x64 = "dmidecode"
> +RSUGGESTS_${PN}-minion = "python-augeas"
> +CONFFILES_${PN}-minion = "${sysconfdir}/${PN}/minion ${sysconfdir}/init.d/${PN}-minion"
> +FILES_${PN}-minion = "${bindir}/${PN}-minion ${sysconfdir}/${PN}/minion.d/ ${CONFFILES_${PN}-minion}"
> +INITSCRIPT_NAME_${PN}-minion = "${PN}-minion"
> +INITSCRIPT_PARAMS_${PN}-minion = "defaults"
> +
> +SUMMARY_${PN}-common = "shared libraries that salt requires for all packages"
> +DESCRIPTION_${PN}-common ="${DESCRIPTION_COMMON} This particular package provides shared libraries that \
> +salt-master, salt-minion, and salt-syndic require to function."
> +RDEPENDS_${PN}-common = "python (>= 2.7) python (< 2.8) python-jinja2 python-pyyaml python-requests"
> +RRECOMMENDS_${PN}-common = "lsb"
> +RSUGGESTS_${PN}-common = "python-mako python-git"
> +RCONFLICTS_${PN}-common = "python-mako (< 0.7.0)"
> +CONFFILES_${PN}-common="${sysconfdir}/logrotate.d/${PN}-common"
> +FILES_${PN}-common = "${bindir}/${PN}-call ${libdir}/python2.7/ ${CONFFILES_${PN}-common}"
> +
> +SUMMARY_${PN}-ssh = "remote manager to administer servers via salt"
> +DESCRIPTION_${PN}-ssh = "${DESCRIPTION_COMMON} This particular package provides the salt ssh controller. It \
> +is able to run salt modules and states on remote hosts via ssh. No minion or other salt specific software needs\
> + to be installed on the remote host."
> +RDEPENDS_${PN}-ssh = "python ${PN}-common (= ${EXTENDPKGV}) python-msgpack"
> +CONFFILES_${PN}-ssh="${sysconfdir}/${PN}/roster"
> +FILES_${PN}-ssh = "${bindir}/${PN}-ssh ${CONFFILES_${PN}-ssh}"
> +
> +SUMMARY_${PN}-api = "generic, modular network access system"
> +DESCRIPTION_${PN}-api = "a modular interface on top of Salt that can provide a variety of entry points into a \
> +running Salt system. It can start and manage multiple interfaces allowing a REST API to coexist with XMLRPC or \
> +even a Websocket API. The Salt API system is used to expose the fundamental aspects of Salt control to external\
> + sources. salt-api acts as the bridge between Salt itself and REST, Websockets, etc. Documentation is available\
> + on Read the Docs: http://salt-api.readthedocs.org/"
> +RDEPENDS_${PN}-api = "python ${PN}-master"
> +RSUGGESTS_${PN}-api = "python-cherrypy"
> +CONFFILES_${PN}-api = "${sysconfdir}/init.d/${PN}-api"
> +FILES_${PN}-api = "${bindir}/${PN}-api ${CONFFILES_${PN}-api}"
> +INITSCRIPT_NAME_${PN}-api = "${PN}-api"
> +INITSCRIPT_PARAMS_${PN}-api = "defaults"
> +
> +SUMMARY_${PN}-master = "remote manager to administer servers via salt"
> +DESCRIPTION_${PN}-master ="${DESCRIPTION_COMMON} This particular package provides the salt controller."
> +RDEPENDS_${PN}-master = "python ${PN}-common (= ${EXTENDPKGV}) python-m2crypto python-pycrypto python-msgpack python-pyzmq (>= 13.1.0)"
> +CONFFILES_${PN}-master="${sysconfdir}/init.d/${PN}-master  ${sysconfdir}/${PN}/master"
> +FILES_${PN}-master = "${bindir}/${PN} ${bindir}/${PN}-cp ${bindir}/${PN}-key ${bindir}/${PN}-master ${bindir}/${PN}-run ${bindir}/${PN}-unity ${CONFFILES_${PN}-master}"
> +INITSCRIPT_NAME_${PN}-master = "${PN}-master"
> +INITSCRIPT_PARAMS_${PN}-master = "defaults"
> +
> +SUMMARY_${PN}-syndic = "master-of-masters for salt, the distributed remote execution system"
> +DESCRIPTION_${PN}-syndic = "${DESCRIPTION_COMMON} This particular package provides the master of masters for \
> +salt; it enables the management of multiple masters at a time."
> +RDEPENDS_${PN}-syndic = "python ${PN}-master (= ${EXTENDPKGV})"
> +CONFFILES_${PN}-syndic="${sysconfdir}/init.d/${PN}-syndic"
> +FILES_${PN}-syndic = "${bindir}/${PN}-syndic ${CONFFILES_${PN}-syndic}"
> +INITSCRIPT_NAME_${PN}-syndic = "${PN}-syndic"
> +INITSCRIPT_PARAMS_${PN}-syndic = "defaults"
> +
> +SUMMARY_${PN}-cloud = "public cloud VM management system"
> +DESCRIPTION_${PN}-cloud = "provision virtual machines on various public clouds via a cleanly controlled profile and mapping system."
> +RDEPENDS_${PN}-cloud = "python ${PN}-common (= ${EXTENDPKGV}) python-msgpack"
> +RSUGGESTS_${PN}-cloud = "python-netaddr python-botocore"
> +CONFFILES_${PN}-cloud = "${sysconfdir}/${PN}/cloud"
> +FILES_${PN}-cloud = "${bindir}/${PN}-cloud ${sysconfdir}/${PN}/cloud.conf.d/ ${sysconfdir}/${PN}/cloud.profiles.d/ ${sysconfdir}/${PN}/cloud.providers.d/ ${CONFFILES_${PN}-cloud}"
> +
> +FILES_${PN}-bash-completion = "${sysconfdir}/bash_completion.d/${PN}-common"
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

