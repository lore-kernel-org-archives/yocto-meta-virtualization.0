Return-Path: <alejandro.delcastillo@ni.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F1DE2E00D86; Fri, 10 Jun 2016 08:58:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [130.164.80.24 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 79B7DE00CE6
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Jun 2016 08:58:35 -0700 (PDT)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u5AFwZVi011411 for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Jun 2016 10:58:35 -0500
Received: from delcastillo2.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016061010583516-753941 ;
	Fri, 10 Jun 2016 10:58:35 -0500 
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 10 Jun 2016 10:58:28 -0500
Message-Id: <1465574308-31633-1-git-send-email-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1465505964-21008-1-git-send-email-alejandro.delcastillo@ni.com>
References: <1465505964-21008-1-git-send-email-alejandro.delcastillo@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 06/10/2016 10:58:35 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 06/10/2016 10:58:35 AM,
	Serialize complete at 06/10/2016 10:58:35 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-06-10_10:, , signatures=0
Subject: [PATCH v2] salt: upgrade to 2016.3
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
X-List-Received-Date: Fri, 10 Jun 2016 15:58:41 -0000

* Update conffiles
* Add PKGCONFIG options for zeromq and TCP transports.

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 meta-openstack/recipes-support/salt/files/cloud    |   7 +-
 meta-openstack/recipes-support/salt/files/master   | 541 ++++++++++++++++-----
 meta-openstack/recipes-support/salt/files/minion   | 366 ++++++++++----
 meta-openstack/recipes-support/salt/files/roster   |   1 +
 .../salt/{salt_2015.8.0.bb => salt_2016.3.0.bb}    |  22 +-
 5 files changed, 718 insertions(+), 219 deletions(-)
 rename meta-openstack/recipes-support/salt/{salt_2015.8.0.bb => salt_2016.3.0.bb} (88%)

diff --git a/meta-openstack/recipes-support/salt/files/cloud b/meta-openstack/recipes-support/salt/files/cloud
index 2ea54f1..5bd28df 100644
--- a/meta-openstack/recipes-support/salt/files/cloud
+++ b/meta-openstack/recipes-support/salt/files/cloud
@@ -1,4 +1,4 @@
-# This file should normally be installed at: /etc/salt/cloud
+# This file should normally be installed at: /etc/salt/cloud 
 
 
 ##########################################
@@ -28,6 +28,9 @@
 # The level of messages to send to the console.
 # One of 'garbage', 'trace', 'debug', info', 'warning', 'error', 'critical'.
 #
+# The following log levels are considered INSECURE and may log sensitive data:
+# ['garbage', 'trace', 'debug']
+#
 # Default: 'info'
 #
 #log_level: info
@@ -65,7 +68,9 @@
 # the coloring of the messages, these color formatters also include padding as
 # well.  Color LogRecord attributes are only available for console logging.
 #
+#log_fmt_console: '%(colorlevel)s %(colormsg)s'
 #log_fmt_console: '[%(levelname)-8s] %(message)s'
+#
 #log_fmt_logfile: '%(asctime)s,%(msecs)03.0f [%(name)-17s][%(levelname)-8s] %(message)s'
 
 
diff --git a/meta-openstack/recipes-support/salt/files/master b/meta-openstack/recipes-support/salt/files/master
index 8129a4f..821f5fc 100644
--- a/meta-openstack/recipes-support/salt/files/master
+++ b/meta-openstack/recipes-support/salt/files/master
@@ -1,125 +1,235 @@
 ##### Primary configuration settings #####
 ##########################################
-# This configuration file is used to manage the behavior of the Salt Master
-# Values that are commented out but have no space after the comment are
-# defaults that need not be set in the config. If there is a space after the
-# comment that the value is presented as an example and is not the default.
+# This configuration file is used to manage the behavior of the Salt Master.
+# Values that are commented out but have an empty line after the comment are
+# defaults that do not need to be set in the config. If there is no blank line
+# after the comment then the value is presented as an example and is not the
+# default.
 
 # Per default, the master will automatically include all config files
 # from master.d/*.conf (master.d is a directory in the same directory
-# as the main master config file)
+# as the main master config file).
 #default_include: master.d/*.conf
 
-# The address of the interface to bind to
+# The address of the interface to bind to:
 #interface: 0.0.0.0
 
 # Whether the master should listen for IPv6 connections. If this is set to True,
-# the interface option must be adjusted too (for example: "interface: '::'")
+# the interface option must be adjusted, too. (For example: "interface: '::'")
 #ipv6: False
 
-# The tcp port used by the publisher
+# The tcp port used by the publisher:
 #publish_port: 4505
 
-# The user to run the salt-master as. Salt will update all permissions to
-# allow the specified user to run the master. If the modified files cause
-# conflicts set verify_env to False.
+# The user under which the salt master will run. Salt will update all
+# permissions to allow the specified user to run the master. The exception is
+# the job cache, which must be deleted if this user is changed. If the
+# modified files cause conflicts, set verify_env to False.
 #user: root
 
-# Max open files
-# Each minion connecting to the master uses AT LEAST one file descriptor, the
-# master subscription connection. If enough minions connect you might start
-# seeing on the console(and then salt-master crashes):
-#   Too many open files (tcp_listener.cpp:335)
-#   Aborted (core dumped)
-#
-# By default this value will be the one of `ulimit -Hn`, ie, the hard limit for
-# max open files.
-#
-# If you wish to set a different value than the default one, uncomment and
-# configure this setting. Remember that this value CANNOT be higher than the
-# hard limit. Raising the hard limit depends on your OS and/or distribution,
-# a good way to find the limit is to search the internet for(for example):
-#   raise max open files hard limit debian
-#
-#max_open_files: 100000
-
-# The number of worker threads to start, these threads are used to manage
-# return calls made from minions to the master, if the master seems to be
-# running slowly, increase the number of threads
-#worker_threads: 5
-
 # The port used by the communication interface. The ret (return) port is the
-# interface used for the file server, authentication, job returnes, etc.
+# interface used for the file server, authentication, job returns, etc.
 #ret_port: 4506
 
-# Specify the location of the daemon process ID file
+# Specify the location of the daemon process ID file:
 #pidfile: /var/run/salt-master.pid
 
 # The root directory prepended to these options: pki_dir, cachedir,
-# sock_dir, log_file, autosign_file, extension_modules, key_logfile, pidfile.
+# sock_dir, log_file, autosign_file, autoreject_file, extension_modules,
+# key_logfile, pidfile:
 #root_dir: /
 
-# Directory used to store public key data
+# Directory used to store public key data:
 #pki_dir: /etc/salt/pki/master
 
-# Directory to store job and cache data
+# Directory to store job and cache data:
+# This directory may contain sensitive data and should be protected accordingly.
+# 
 #cachedir: /var/cache/salt/master
 
-# Verify and set permissions on configuration directories at startup
+# Directory for custom modules. This directory can contain subdirectories for
+# each of Salt's module types such as "runners", "output", "wheel", "modules",
+# "states", "returners", etc.
+#extension_modules: <no default>
+
+# Directory for custom modules. This directory can contain subdirectories for
+# each of Salt's module types such as "runners", "output", "wheel", "modules",
+# "states", "returners", etc.
+# Like 'extension_modules' but can take an array of paths
+#module_dirs: <no default>
+#   - /var/cache/salt/minion/extmods
+
+# Verify and set permissions on configuration directories at startup:
 #verify_env: True
 
-# Set the number of hours to keep old job information in the job cache
+# Set the number of hours to keep old job information in the job cache:
 #keep_jobs: 24
 
-# Set the default timeout for the salt command and api, the default is 5
-# seconds
+# Set the default timeout for the salt command and api. The default is 5
+# seconds.
 #timeout: 5
 
-# The loop_interval option controls the seconds for the master's maintinance
+# The loop_interval option controls the seconds for the master's maintenance
 # process check cycle. This process updates file server backends, cleans the
 # job cache and executes the scheduler.
 #loop_interval: 60
 
-# Set the default outputter used by the salt command. The default is "nested"
+# Set the default outputter used by the salt command. The default is "nested".
 #output: nested
 
-# By default output is colored, to disable colored output set the color value
-# to False
+# Return minions that timeout when running commands like test.ping
+#show_timeout: True
+
+# By default, output is colored. To disable colored output, set the color value
+# to False.
 #color: True
 
-# Set the directory used to hold unix sockets
+# Do not strip off the colored output from nested results and state outputs
+# (true by default).
+# strip_colors: False
+
+# Set the directory used to hold unix sockets:
 #sock_dir: /var/run/salt/master
 
 # The master can take a while to start up when lspci and/or dmidecode is used
 # to populate the grains for the master. Enable if you want to see GPU hardware
 # data for your master.
-#
 # enable_gpu_grains: False
 
-# The master maintains a job cache, while this is a great addition it can be
+# The master maintains a job cache. While this is a great addition, it can be
 # a burden on the master for larger deployments (over 5000 minions).
 # Disabling the job cache will make previously executed jobs unavailable to
 # the jobs system and is not generally recommended.
-#
 #job_cache: True
 
 # Cache minion grains and pillar data in the cachedir.
 #minion_data_cache: True
 
+# Store all returns in the given returner.
+# Setting this option requires that any returner-specific configuration also 
+# be set. See various returners in salt/returners for details on required
+# configuration values. (See also, event_return_queue below.)
+#
+#event_return: mysql
+
+# On busy systems, enabling event_returns can cause a considerable load on
+# the storage system for returners. Events can be queued on the master and
+# stored in a batched fashion using a single transaction for multiple events.
+# By default, events are not queued.
+#event_return_queue: 0
+
+# Only events returns matching tags in a whitelist
+# event_return_whitelist:
+#   - salt/master/a_tag
+#   - salt/master/another_tag
+
+# Store all event returns _except_ the tags in a blacklist
+# event_return_blacklist:
+#   - salt/master/not_this_tag
+#   - salt/master/or_this_one
+
+# Passing very large events can cause the minion to consume large amounts of
+# memory. This value tunes the maximum size of a message allowed onto the
+# master event bus. The value is expressed in bytes.
+#max_event_size: 1048576
+
+# By default, the master AES key rotates every 24 hours. The next command
+# following a key rotation will trigger a key refresh from the minion which may
+# result in minions which do not respond to the first command after a key refresh.
+#
+# To tell the master to ping all minions immediately after an AES key refresh, set
+# ping_on_rotate to True. This should mitigate the issue where a minion does not
+# appear to initially respond after a key is rotated.
+#
+# Note that ping_on_rotate may cause high load on the master immediately after
+# the key rotation event as minions reconnect. Consider this carefully if this
+# salt master is managing a large number of minions.
+#
+# If disabled, it is recommended to handle this event by listening for the 
+# 'aes_key_rotate' event with the 'key' tag and acting appropriately.
+# ping_on_rotate: False
+
+# By default, the master deletes its cache of minion data when the key for that
+# minion is removed. To preserve the cache after key deletion, set 
+# 'preserve_minion_cache' to True.
+#
+# WARNING: This may have security implications if compromised minions auth with
+# a previous deleted minion ID.
+#preserve_minion_cache: False
+
+# If max_minions is used in large installations, the master might experience
+# high-load situations because of having to check the number of connected
+# minions for every authentication. This cache provides the minion-ids of
+# all connected minions to all MWorker-processes and greatly improves the
+# performance of max_minions.
+# con_cache: False
+
 # The master can include configuration from other files. To enable this,
 # pass a list of paths to this option. The paths can be either relative or
 # absolute; if relative, they are considered to be relative to the directory
 # the main master configuration file lives in (this file). Paths can make use
 # of shell-style globbing. If no files are matched by a path passed to this
-# option then the master will log a warning message.
-#
+# option, then the master will log a warning message.
 #
 # Include a config file from some other path:
-#include: /etc/salt/extra_config
+# include: /etc/salt/extra_config
 #
 # Include config from several files and directories:
-#include:
-#  - /etc/salt/extra_config
+# include:
+#   - /etc/salt/extra_config
+
+
+#####  Large-scale tuning settings   #####
+##########################################
+# Max open files
+#
+# Each minion connecting to the master uses AT LEAST one file descriptor, the
+# master subscription connection. If enough minions connect you might start
+# seeing on the console (and then salt-master crashes):
+#   Too many open files (tcp_listener.cpp:335)
+#   Aborted (core dumped)
+#
+# By default this value will be the one of `ulimit -Hn`, ie, the hard limit for
+# max open files.
+#
+# If you wish to set a different value than the default one, uncomment and
+# configure this setting. Remember that this value CANNOT be higher than the
+# hard limit. Raising the hard limit depends on your OS and/or distribution,
+# a good way to find the limit is to search the internet. For example:
+#   raise max open files hard limit debian
+#
+#max_open_files: 100000
+
+# The number of worker threads to start. These threads are used to manage
+# return calls made from minions to the master. If the master seems to be
+# running slowly, increase the number of threads. This setting can not be
+# set lower than 3.
+#worker_threads: 5
+
+# Set the ZeroMQ high water marks
+# http://api.zeromq.org/3-2:zmq-setsockopt
+
+# The publisher interface ZeroMQPubServerChannel
+#pub_hwm: 1000
+
+# These two ZMQ HWM settings, salt_event_pub_hwm and event_publisher_pub_hwm
+# are significant for masters with thousands of minions.  When these are
+# insufficiently high it will manifest in random responses missing in the CLI
+# and even missing from the job cache.  Masters that have fast CPUs and many
+# cores with appropriate worker_threads will not need these set as high.
+
+# On deployment with 8,000 minions, 2.4GHz CPUs, 24 cores, 32GiB memory has
+# these settings:
+#
+#   salt_event_pub_hwm: 128000
+#   event_publisher_pub_hwm: 64000
+
+# ZMQ high-water-mark for SaltEvent pub socket
+#salt_event_pub_hwm: 20000
+
+# ZMQ high-water-mark for EventPublisher pub socket
+#event_publisher_pub_hwm: 10000
+
 
 
 #####        Security settings       #####
@@ -134,53 +244,68 @@
 # public keys from the minions. Note that this is insecure.
 #auto_accept: False
 
-# If the autosign_file is specified only incoming keys specified in
-# the autosign_file will be automatically accepted. This is insecure.
-# Regular expressions as well as globing lines are supported.
+# Time in minutes that a incoming public key with a matching name found in
+# pki_dir/minion_autosign/keyid is automatically accepted. Expired autosign keys
+# are removed when the master checks the minion_autosign directory.
+# 0 equals no timeout
+# autosign_timeout: 120
+
+# If the autosign_file is specified, incoming keys specified in the
+# autosign_file will be automatically accepted. This is insecure.  Regular
+# expressions as well as globing lines are supported.
 #autosign_file: /etc/salt/autosign.conf
 
-# Enable permissive access to the salt keys.  This allows you to run the
+# Works like autosign_file, but instead allows you to specify minion IDs for
+# which keys will automatically be rejected. Will override both membership in
+# the autosign_file and the auto_accept setting.
+#autoreject_file: /etc/salt/autoreject.conf
+
+# Enable permissive access to the salt keys. This allows you to run the
 # master or minion as root, but have a non-root group be given access to
-# your pki_dir.  To make the access explicit, root must belong to the group
-# you've given access to.  This is potentially quite insecure.
-# If an autosign_file is specified, enabling permissive_pki_access will allow group access
-# to that specific file.
+# your pki_dir. To make the access explicit, root must belong to the group
+# you've given access to. This is potentially quite insecure. If an autosign_file
+# is specified, enabling permissive_pki_access will allow group access to that
+# specific file.
 #permissive_pki_access: False
 
 # Allow users on the master access to execute specific commands on minions.
 # This setting should be treated with care since it opens up execution
 # capabilities to non root users. By default this capability is completely
 # disabled.
-#
-#client_acl:
+#pulisher_acl:
 #  larry:
 #    - test.ping
 #    - network.*
 #
-
 # Blacklist any of the following users or modules
 #
 # This example would blacklist all non sudo users, including root from
 # running any commands. It would also blacklist any use of the "cmd"
-# module.
-# This is completely disabled by default.
+# module. This is completely disabled by default.
 #
-#client_acl_blacklist:
+#publisher_acl_blacklist:
 #  users:
 #    - root
 #    - '^(?!sudo_).*$'   #  all non sudo users
 #  modules:
 #    - cmd
+#
+# WARNING: client_acl and client_acl_blacklist options are deprecated and will
+# be removed in the future releases. Use publisher_acl and
+# publisher_acl_blacklist instead.
+
+# Enforce publisher_acl & publisher_acl_blacklist when users have sudo
+# access to the salt command. 
+#
+#sudo_acl: False
 
 # The external auth system uses the Salt auth modules to authenticate and
 # validate users to access areas of the Salt system.
-#
 #external_auth:
 #  pam:
 #    fred:
 #      - test.*
 #
-
 # Time (in seconds) for a newly generated token to live. Default: 12 hours
 #token_expire: 43200
 
@@ -188,6 +313,10 @@
 # security purposes.
 #file_recv: False
 
+# Set a hard-limit on the size of the files that can be pushed to the master.
+# It will be interpreted as megabytes. Default: 100
+#file_recv_max_size: 100
+
 # Signature verification on messages published from the master.
 # This causes the master to cryptographically sign all messages published to its event
 # bus, and minions then verify that signature before acting on the message.
@@ -199,20 +328,30 @@
 # no signature, it will still be accepted, and a warning message will be logged.
 # Conversely, if sign_pub_messages is False, but a minion receives a signed
 # message it will be accepted, the signature will not be checked, and a warning message
-# will be logged.  This behavior will go away in Salt 0.17.6 (or Hydrogen RC1, whichever
-# comes first) and these two situations will cause minion to throw an exception and
-# drop the message.
-#
+# will be logged. This behavior went away in Salt 2014.1.0 and these two situations
+# will cause minion to throw an exception and drop the message.
 # sign_pub_messages: False
 
+#####     Salt-SSH Configuration     #####
+##########################################
+
+# Pass in an alternative location for the salt-ssh roster file
+#roster_file: /etc/salt/roster
+
+# Pass in minion option overrides that will be inserted into the SHIM for
+# salt-ssh calls. The local minion config is not used for salt-ssh. Can be
+# overridden on a per-minion basis in the roster (`minion_opts`)
+#ssh_minion_opts:
+#  gpg_keydir: /root/gpg
+
 #####    Master Module Management    #####
 ##########################################
-# Manage how master side modules are loaded
+# Manage how master side modules are loaded.
 
-# Add any additional locations to look for master runners
+# Add any additional locations to look for master runners:
 #runner_dirs: []
 
-# Enable Cython for master side modules
+# Enable Cython for master side modules:
 #cython_enable: False
 
 
@@ -226,6 +365,7 @@
 # The master_tops option replaces the external_nodes option by creating
 # a plugable system for the generation of external top data. The external_nodes
 # option is deprecated by the master_tops option.
+#
 # To gain the capabilities of the classic external_nodes system, use the
 # following configuration:
 # master_tops:
@@ -242,6 +382,19 @@
 # The renderer to use on the minions to render the state data
 #renderer: yaml_jinja
 
+# The Jinja renderer can strip extra carriage returns and whitespace
+# See http://jinja.pocoo.org/docs/api/#high-level-api
+#
+# If this is set to True the first newline after a Jinja block is removed
+# (block, not variable tag!). Defaults to False, corresponds to the Jinja
+# environment init variable "trim_blocks".
+#jinja_trim_blocks: False
+#
+# If this is set to True leading spaces and tabs are stripped from the start
+# of a line to a block. Defaults to False, corresponds to the Jinja
+# environment init variable "lstrip_blocks".
+#jinja_lstrip_blocks: False
+
 # The failhard option tells the minions to stop immediately after the first
 # failure detected in the state execution, defaults to False
 #failhard: False
@@ -256,8 +409,22 @@
 # output for each changed state if set to 'full', but if set to 'terse'
 # the output will be shortened to a single line.  If set to 'mixed', the output
 # will be terse unless a state failed, in which case that output will be full.
+# If set to 'changes', the output will be full unless the state didn't change.
 #state_output: full
 
+# Automatically aggregate all states that have support for mod_aggregate by
+# setting to 'True'. Or pass a list of state module names to automatically
+# aggregate just those types.
+#
+# state_aggregate:
+#   - pkg
+#
+#state_aggregate: False
+
+# Send progress events as each function in a state run completes execution
+# by setting to 'True'. Progress events are in the format
+# 'salt/job/<JID>/prog/<MID>/<RUN NUM>'.
+#state_events: False
 
 #####      File Server settings      #####
 ##########################################
@@ -279,14 +446,34 @@
 #   prod:
 #     - /srv/salt/prod/services
 #     - /srv/salt/prod/states
-
+#
 #file_roots:
 #  base:
 #    - /srv/salt
+#
+
+# When using multiple environments, each with their own top file, the
+# default behaviour is an unordered merge. To prevent top files from
+# being merged together and instead to only use the top file from the
+# requested environment, set this value to 'same'. 
+#top_file_merging_strategy: merge
+
+# To specify the order in which environments are merged, set the ordering
+# in the env_order option. Given a conflict, the last matching value will
+# win.
+#env_order: ['base', 'dev', 'prod']
+
+# If top_file_merging_strategy is set to 'same' and an environment does not
+# contain a top file, the top file in the environment specified by default_top
+# will be used instead.
+#default_top: base
 
 # The hash_type is the hash to use when discovering the hash of a file on
 # the master server. The default is md5, but sha1, sha224, sha256, sha384
 # and sha512 are also supported.
+#
+# Prior to changing this value, the master should be stopped and all Salt 
+# caches should be cleared.
 #hash_type: md5
 
 # The buffer size in the file server can be adjusted here:
@@ -298,7 +485,6 @@
 # For example, if you manage your custom modules and states in subversion
 # and don't want all the '.svn' folders and content synced to your minions,
 # you could set this to '/\.svn($|/)'. By default nothing is ignored.
-#
 #file_ignore_regex:
 #  - '/\.svn($|/)'
 #  - '/\.git($|/)'
@@ -307,58 +493,83 @@
 # path before syncing the modules and states to the minions. This is similar
 # to file_ignore_regex above, but works on globs instead of regex. By default
 # nothing is ignored.
-#
 # file_ignore_glob:
 #  - '*.pyc'
 #  - '*/somefolder/*.bak'
 #  - '*.swp'
 
 # File Server Backend
+#
 # Salt supports a modular fileserver backend system, this system allows
 # the salt master to link directly to third party systems to gather and
 # manage the files available to minions. Multiple backends can be
 # configured and will be searched for the requested file in the order in which
 # they are defined here. The default setting only enables the standard backend
 # "roots" which uses the "file_roots" option.
-#
 #fileserver_backend:
 #  - roots
 #
 # To use multiple backends list them in the order they are searched:
-#
 #fileserver_backend:
 #  - git
 #  - roots
 #
+# Uncomment the line below if you do not want the file_server to follow
+# symlinks when walking the filesystem tree. This is set to True
+# by default. Currently this only applies to the default roots
+# fileserver_backend.
+#fileserver_followsymlinks: False
+#
+# Uncomment the line below if you do not want symlinks to be
+# treated as the files they are pointing to. By default this is set to
+# False. By uncommenting the line below, any detected symlink while listing
+# files on the Master will not be returned to the Minion.
+#fileserver_ignoresymlinks: True
+#
 # By default, the Salt fileserver recurses fully into all defined environments
 # to attempt to find files. To limit this behavior so that the fileserver only
 # traverses directories with SLS files and special Salt directories like _modules,
 # enable the option below. This might be useful for installations where a file root
 # has a very large number of files and performance is impacted. Default is False.
-#
 # fileserver_limit_traversal: False
 #
-# Git fileserver backend configuration
+# The fileserver can fire events off every time the fileserver is updated,
+# these are disabled by default, but can be easily turned on by setting this
+# flag to True
+#fileserver_events: False
+
+# Git File Server Backend Configuration
+#
+# Gitfs can be provided by one of two python modules: GitPython or pygit2. If
+# using pygit2, both libgit2 and git must also be installed.
+#gitfs_provider: gitpython
+#
 # When using the git fileserver backend at least one git remote needs to be
 # defined. The user running the salt master will need read access to the repo.
 #
-#gitfs_remotes:
-#  - git://github.com/saltstack/salt-states.git
-#  - file:///var/git/saltmaster
-#
 # The repos will be searched in order to find the file requested by a client
 # and the first repo to have the file will return it.
 # When using the git backend branches and tags are translated into salt
 # environments.
 # Note:  file:// repos will be treated as a remote, so refs you want used must
 # exist in that repo as *local* refs.
+#gitfs_remotes:
+#  - git://github.com/saltstack/salt-states.git
+#  - file:///var/git/saltmaster
+#
+# The gitfs_ssl_verify option specifies whether to ignore ssl certificate
+# errors when contacting the gitfs backend. You might want to set this to
+# false if you're using a git backend that uses a self-signed certificate but
+# keep in mind that setting this flag to anything other than the default of True
+# is a security concern, you may want to try using the ssh transport.
+#gitfs_ssl_verify: True
 #
 # The gitfs_root option gives the ability to serve files from a subdirectory
 # within the repository. The path is defined relative to the root of the
 # repository and defaults to the repository root.
 #gitfs_root: somefolder/otherfolder
-
-
+#
+#
 #####         Pillar settings        #####
 ##########################################
 # Salt Pillars allow for the building of global data that can be made selectively
@@ -366,28 +577,59 @@
 # Pillar is laid out in the same fashion as the file server, with environments,
 # a top file and sls files. However, pillar data does not need to be in the
 # highstate format, and is generally just key/value pairs.
-
 #pillar_roots:
 #  base:
 #    - /srv/pillar
-
+#
 #ext_pillar:
 #  - hiera: /etc/hiera.yaml
 #  - cmd_yaml: cat /etc/salt/yaml
 
+# The ext_pillar_first option allows for external pillar sources to populate
+# before file system pillar. This allows for targeting file system pillar from
+# ext_pillar.
+#ext_pillar_first: False
+
+# The pillar_gitfs_ssl_verify option specifies whether to ignore ssl certificate
+# errors when contacting the pillar gitfs backend. You might want to set this to
+# false if you're using a git backend that uses a self-signed certificate but
+# keep in mind that setting this flag to anything other than the default of True
+# is a security concern, you may want to try using the ssh transport.
+#pillar_gitfs_ssl_verify: True
+
 # The pillar_opts option adds the master configuration file data to a dict in
 # the pillar called "master". This is used to set simple configurations in the
 # master config file that can then be used on minions.
-#pillar_opts: True
+#pillar_opts: False
+
+# The pillar_safe_render_error option prevents the master from passing pillar
+# render errors to the minion. This is set on by default because the error could
+# contain templating data which would give that minion information it shouldn't
+# have, like a password! When set true the error message will only show:
+#   Rendering SLS 'my.sls' failed. Please see master log for details.
+#pillar_safe_render_error: True
+
+# The pillar_source_merging_strategy option allows you to configure merging strategy
+# between different sources. It accepts four values: recurse, aggregate, overwrite,
+# or smart. Recurse will merge recursively mapping of data. Aggregate instructs
+# aggregation of elements between sources that use the #!yamlex renderer. Overwrite
+# will verwrite elements according the order in which they are processed. This is
+# behavior of the 2014.1 branch and earlier. Smart guesses the best strategy based
+# on the "renderer" setting and is the default value.
+#pillar_source_merging_strategy: smart
+
+# Recursively merge lists by aggregating them instead of replacing them.
+#pillar_merge_lists: False
 
 
 #####          Syndic settings       #####
 ##########################################
 # The Salt syndic is used to pass commands through a master from a higher
-# master. Using the syndic is simple, if this is a master that will have
-# syndic servers(s) below it set the "order_masters" setting to True, if this
-# is a master that will be running a syndic daemon for passthrough the
-# "syndic_master" setting needs to be set to the location of the master server
+# master. Using the syndic is simple. If this is a master that will have
+# syndic servers(s) below it, then set the "order_masters" setting to True.
+#
+# If this is a master that will be running a syndic daemon for passthrough, then
+# the "syndic_master" setting needs to be set to the location of the master server
 # to receive commands from.
 
 # Set the order_masters setting to True if this master will command lower
@@ -398,15 +640,16 @@
 # this master where to receive commands from.
 #syndic_master: masterofmaster
 
-# This is the 'ret_port' of the MasterOfMaster
+# This is the 'ret_port' of the MasterOfMaster:
 #syndic_master_port: 4506
 
-# PID file of the syndic daemon
+# PID file of the syndic daemon:
 #syndic_pidfile: /var/run/salt-syndic.pid
 
-# LOG file of the syndic daemon
+# LOG file of the syndic daemon:
 #syndic_log_file: syndic.log
 
+
 #####      Peer Publish settings     #####
 ##########################################
 # Salt minions can send commands to other minions, but only if the minion is
@@ -418,14 +661,12 @@
 # of regular expressions to match functions. The following will allow the
 # minion authenticated as foo.example.com to execute functions from the test
 # and pkg modules.
-#
 #peer:
 #  foo.example.com:
 #    - test.*
 #    - pkg.*
 #
 # This will allow all minions to execute all commands:
-#
 #peer:
 #  .*:
 #    - .*
@@ -440,16 +681,34 @@
 #
 # All peer runner support is turned off by default and must be enabled before
 # using. This will enable all peer runners for all minions:
-#
 #peer_run:
 #  .*:
 #    - .*
 #
 # To enable just the manage.up runner for the minion foo.example.com:
-#
 #peer_run:
 #  foo.example.com:
 #    - manage.up
+#
+#
+#####         Mine settings     #####
+#####################################
+# Restrict mine.get access from minions. By default any minion has a full access
+# to get all mine data from master cache. In acl definion below, only pcre matches
+# are allowed.
+# mine_get:
+#   .*:
+#     - .*
+#
+# The example below enables minion foo.example.com to get 'network.interfaces' mine
+# data only, minions web* to get all network.* and disk.* mine data and all other
+# minions won't get any mine data.
+# mine_get:
+#   foo.example.com:
+#     - network.interfaces
+#   web.*:
+#     - network.*
+#     - disk.*
 
 
 #####         Logging settings       #####
@@ -468,10 +727,15 @@
 
 # The level of messages to send to the console.
 # One of 'garbage', 'trace', 'debug', info', 'warning', 'error', 'critical'.
+#
+# The following log levels are considered INSECURE and may log sensitive data:
+# ['garbage', 'trace', 'debug']
+#
 #log_level: warning
 
 # The level of messages to send to the log file.
 # One of 'garbage', 'trace', 'debug', info', 'warning', 'error', 'critical'.
+# If using 'log_granular_levels' this must be set to the highest desired level.
 #log_level_logfile: warning
 
 # The date and time format used in log messages. Allowed date/time formating
@@ -481,24 +745,37 @@
 
 # The format of the console logging messages. Allowed formatting options can
 # be seen here: http://docs.python.org/library/logging.html#logrecord-attributes
+#
+# Console log colors are specified by these additional formatters:
+#
+# %(colorlevel)s
+# %(colorname)s
+# %(colorprocess)s
+# %(colormsg)s
+#
+# Since it is desirable to include the surrounding brackets, '[' and ']', in
+# the coloring of the messages, these color formatters also include padding as
+# well.  Color LogRecord attributes are only available for console logging.
+#
+#log_fmt_console: '%(colorlevel)s %(colormsg)s'
 #log_fmt_console: '[%(levelname)-8s] %(message)s'
+#
 #log_fmt_logfile: '%(asctime)s,%(msecs)03.0f [%(name)-17s][%(levelname)-8s] %(message)s'
 
 # This can be used to control logging levels more specificically.  This
 # example sets the main salt library at the 'warning' level, but sets
 # 'salt.modules' to log at the 'debug' level:
 #   log_granular_levels:
-#     'salt': 'warning',
+#     'salt': 'warning'
 #     'salt.modules': 'debug'
 #
 #log_granular_levels: {}
 
 
-#####         Node Groups           #####
+#####         Node Groups           ######
 ##########################################
-# Node groups allow for logical groupings of minion nodes.
-# A group consists of a group name and a compound target.
-#
+# Node groups allow for logical groupings of minion nodes. A group consists of a group
+# name and a compound target.
 #nodegroups:
 #  group1: 'L@foo.domain.com,bar.domain.com,baz.domain.com and bl*.domain.com'
 #  group2: 'G@os:Debian and foo.domain.com'
@@ -507,19 +784,43 @@
 #####     Range Cluster settings     #####
 ##########################################
 # The range server (and optional port) that serves your cluster information
-# https://github.com/grierj/range/wiki/Introduction-to-Range-with-YAML-files
+# https://github.com/ytoolshed/range/wiki/%22yamlfile%22-module-file-spec
 #
 #range_server: range:80
 
 
-#####     Windows Software Repo settings #####
-##############################################
-# Location of the repo on the master
-#win_repo: '/srv/salt/win/repo'
+#####  Windows Software Repo settings #####
+###########################################
+# Location of the repo on the master:
+#winrepo_dir_ng: '/srv/salt/win/repo-ng'
+#
+# List of git repositories to include with the local repo:
+#winrepo_remotes_ng:
+#  - 'https://github.com/saltstack/salt-winrepo-ng.git'
 
-# Location of the master's repo cache file
-#win_repo_mastercachefile: '/srv/salt/win/repo/winrepo.p'
 
-# List of git repositories to include with the local repo
-#win_gitrepos:
+#####  Windows Software Repo settings - Pre 2015.8 #####
+########################################################
+# Legacy repo settings for pre-2015.8 Windows minions.
+#
+# Location of the repo on the master:
+#winrepo_dir: '/srv/salt/win/repo'
+#
+# Location of the master's repo cache file:
+#winrepo_mastercachefile: '/srv/salt/win/repo/winrepo.p'
+#
+# List of git repositories to include with the local repo:
+#winrepo_remotes:
 #  - 'https://github.com/saltstack/salt-winrepo.git'
+
+
+#####      Returner settings          ######
+############################################
+# Which returner(s) will be used for minion's result:
+#return: mysql
+
+
+######    Miscellaneous  settings     ######
+############################################
+# Default match type for filtering events tags: startswith, endswith, find, regex, fnmatch
+#event_match_type: startswith
diff --git a/meta-openstack/recipes-support/salt/files/minion b/meta-openstack/recipes-support/salt/files/minion
index 8fdde14..bd97c43 100644
--- a/meta-openstack/recipes-support/salt/files/minion
+++ b/meta-openstack/recipes-support/salt/files/minion
@@ -1,16 +1,52 @@
 ##### Primary configuration settings #####
 ##########################################
+# This configuration file is used to manage the behavior of the Salt Minion.
+# With the exception of the location of the Salt Master Server, values that are
+# commented out but have an empty line after the comment are defaults that need
+# not be set in the config. If there is no blank line after the comment, the
+# value is presented as an example and is not the default.
 
 # Per default the minion will automatically include all config files
 # from minion.d/*.conf (minion.d is a directory in the same directory
 # as the main minion config file).
 #default_include: minion.d/*.conf
 
-# Set the location of the salt master server, if the master server cannot be
+# Set the location of the salt master server. If the master server cannot be
 # resolved, then the minion will fail to start.
 #master: salt
 
-# Set whether the minion should connect to the master via IPv6
+# Set http proxy information for the minion when doing requests
+#proxy_host:
+#proxy_port:
+#proxy_username:
+#proxy_password:
+
+# If multiple masters are specified in the 'master' setting, the default behavior
+# is to always try to connect to them in the order they are listed. If random_master is
+# set to True, the order will be randomized instead. This can be helpful in distributing
+# the load of many minions executing salt-call requests, for example, from a cron job.
+# If only one master is listed, this setting is ignored and a warning will be logged.
+# NOTE: If master_type is set to failover, use master_shuffle instead.
+#random_master: False
+
+# Use if master_type is set to failover.
+#master_shuffle: False
+
+# Minions can connect to multiple masters simultaneously (all masters
+# are "hot"), or can be configured to failover if a master becomes
+# unavailable.  Multiple hot masters are configured by setting this
+# value to "str".  Failover masters can be requested by setting
+# to "failover".  MAKE SURE TO SET master_alive_interval if you are
+# using failover.
+# master_type: str
+
+# Poll interval in seconds for checking if the master is still there.  Only
+# respected if master_type above is "failover". To disable the interval entirely,
+# set the value to -1. (This may be necessary on machines which have high numbers
+# of TCP connections, such as load balancers.)
+# master_alive_interval: 30
+
+# Set whether the minion should connect to the master via IPv6:
 #ipv6: False
 
 # Set the number of seconds to wait before attempting to resolve
@@ -18,13 +54,19 @@
 # Set to zero if the minion should shutdown and not retry.
 # retry_dns: 30
 
-# Set the port used by the master reply and authentication server
+# Set the port used by the master reply and authentication server.
 #master_port: 4506
 
-# The user to run salt
+# The user to run salt.
 #user: root
 
-# Specify the location of the daemon process ID file
+# Setting sudo_user will cause salt to run all execution modules under an sudo
+# to the user given in sudo_user.  The user under which the salt minion process
+# itself runs will still be that provided in the user config above, but all
+# execution modules run by the minion will be rerouted through sudo.
+#sudo_user: saltdev
+
+# Specify the location of the daemon process ID file.
 #pidfile: /var/run/salt-minion.pid
 
 # The root directory prepended to these options: pki_dir, cachedir, log_file,
@@ -48,7 +90,7 @@
 
 # Custom static grains for this minion can be specified here and used in SLS
 # files just like all other grains. This example sets 4 custom grains, with
-# the 'roles' grain having two values that can be matched against:
+# the 'roles' grain having two values that can be matched against.
 #grains:
 #  roles:
 #    - webserver
@@ -56,36 +98,40 @@
 #  deployment: datacenter4
 #  cabinet: 13
 #  cab_u: 14-15
-
-# Where cache data goes
+#
+# Where cache data goes.
+# This data may contain sensitive data and should be protected accordingly.
 #cachedir: /var/cache/salt/minion
 
-# Verify and set permissions on configuration directories at startup
+# Verify and set permissions on configuration directories at startup.
 #verify_env: True
 
 # The minion can locally cache the return data from jobs sent to it, this
 # can be a good way to keep track of jobs the minion has executed
-# (on the minion side). By default this feature is disabled, to enable
-# set cache_jobs to True
+# (on the minion side). By default this feature is disabled, to enable, set
+# cache_jobs to True.
 #cache_jobs: False
 
-# set the directory used to hold unix sockets
+# Set the directory used to hold unix sockets.
 #sock_dir: /var/run/salt/minion
 
 # Set the default outputter used by the salt-call command. The default is
-# "nested"
+# "nested".
 #output: nested
 #
-# By default output is colored, to disable colored output set the color value
-# to False
+# By default output is colored. To disable colored output, set the color value
+# to False.
 #color: True
 
+# Do not strip off the colored output from nested results and state outputs
+# (true by default).
+# strip_colors: False
+
 # Backup files that are replaced by file.managed and file.recurse under
 # 'cachedir'/file_backups relative to their original location and appended
 # with a timestamp. The only valid setting is "minion". Disabled by default.
 #
 # Alternatively this can be specified for each file in state files:
-#
 # /etc/ssh/sshd_config:
 #   file.managed:
 #     - source: salt://ssh/sshd_config
@@ -103,27 +149,55 @@
 # set to zero, the time between reconnection attempts will stay constant.
 #acceptance_wait_time_max: 0
 
+# If the master rejects the minion's public key, retry instead of exiting.
+# Rejected keys will be handled the same as waiting on acceptance.
+#rejected_retry: False
+
 # When the master key changes, the minion will try to re-auth itself to receive
 # the new master key. In larger environments this can cause a SYN flood on the
 # master because all minions try to re-auth immediately. To prevent this and
 # have a minion wait for a random amount of time, use this optional parameter.
-# The wait-time will be a random number of seconds between
-# 0 and the defined value.
+# The wait-time will be a random number of seconds between 0 and the defined value.
 #random_reauth_delay: 60
 
+# When waiting for a master to accept the minion's public key, salt will
+# continuously attempt to reconnect until successful. This is the timeout value,
+# in seconds, for each individual attempt. After this timeout expires, the minion
+# will wait for acceptance_wait_time seconds before trying again. Unless your master
+# is under unusually heavy load, this should be left at the default.
+#auth_timeout: 60
+
+# Number of consecutive SaltReqTimeoutError that are acceptable when trying to
+# authenticate.
+#auth_tries: 7
+
+# If authentication fails due to SaltReqTimeoutError during a ping_interval,
+# cause sub minion process to restart.
+#auth_safemode: False
+
+# Ping Master to ensure connection is alive (minutes).
+#ping_interval: 0
+
+# To auto recover minions if master changes IP address (DDNS)
+#    auth_tries: 10
+#    auth_safemode: False
+#    ping_interval: 90
+#
+# Minions won't know master is missing until a ping fails. After the ping fail,
+# the minion will attempt authentication and likely fails out and cause a restart.
+# When the minion restarts it will resolve the masters IP and attempt to reconnect.
 
-# If you don't have any problems with syn-floods, dont bother with the
+# If you don't have any problems with syn-floods, don't bother with the
 # three recon_* settings described below, just leave the defaults!
 #
 # The ZeroMQ pull-socket that binds to the masters publishing interface tries
 # to reconnect immediately, if the socket is disconnected (for example if
 # the master processes are restarted). In large setups this will have all
 # minions reconnect immediately which might flood the master (the ZeroMQ-default
-# is usually a 100ms delay). To prevent this, these three recon_* settings 
+# is usually a 100ms delay). To prevent this, these three recon_* settings
 # can be used.
-#
-# recon_default: the interval in milliseconds that the socket should wait before 
-#                trying to reconnect to the master (100ms = 1 second)
+# recon_default: the interval in milliseconds that the socket should wait before
+#                trying to reconnect to the master (1000ms = 1 second)
 #
 # recon_max: the maximum time a socket should wait. each interval the time to wait
 #            is calculated by doubling the previous time. if recon_max is reached,
@@ -136,29 +210,26 @@
 #            reconnect 5: value from previous interval * 2
 #            reconnect x: if value >= recon_max, it starts again with recon_default
 #
-# recon_randomize: generate a random wait time on minion start. The wait time will 
-#                  be a random value between recon_default and recon_default + 
-#                  recon_max. Having all minions reconnect with the same recon_default 
-#                  and recon_max value kind of defeats the purpose of being able to 
-#                  change these settings. If all minions have the same values and your 
-#                  setup is quite large (several thousand minions), they will still 
-#                  flood the master. The desired behaviour is to have timeframe within
-#                  all minions try to reconnect. 
-
-# Example on how to use these settings:
-# The goal: have all minions reconnect within a 60 second timeframe on a disconnect
-#
-# The settings:
-#recon_default: 1000
-#recon_max: 59000
-#recon_randomize: True
+# recon_randomize: generate a random wait time on minion start. The wait time will
+#                  be a random value between recon_default and recon_default +
+#                  recon_max. Having all minions reconnect with the same recon_default
+#                  and recon_max value kind of defeats the purpose of being able to
+#                  change these settings. If all minions have the same values and your
+#                  setup is quite large (several thousand minions), they will still
+#                  flood the master. The desired behavior is to have timeframe within
+#                  all minions try to reconnect.
+#
+# Example on how to use these settings. The goal: have all minions reconnect within a
+# 60 second timeframe on a disconnect.
+# recon_default: 1000
+# recon_max: 59000
+# recon_randomize: True
 #
 # Each minion will have a randomized reconnect value between 'recon_default'
 # and 'recon_default + recon_max', which in this example means between 1000ms
-# 60000ms (or between 1 and 60 seconds). The generated random-value will be 
-# doubled after each attempt to reconnect. Lets say the generated random 
-# value is 11 seconds (or 11000ms). 
-#
+# 60000ms (or between 1 and 60 seconds). The generated random-value will be
+# doubled after each attempt to reconnect. Lets say the generated random
+# value is 11 seconds (or 11000ms).
 # reconnect 1: wait 11 seconds
 # reconnect 2: wait 22 seconds
 # reconnect 3: wait 33 seconds
@@ -172,29 +243,68 @@
 #
 # In a setup with ~6000 thousand hosts these settings would average the reconnects
 # to about 100 per second and all hosts would be reconnected within 60 seconds.
-#recon_default: 100
-#recon_max: 5000
-#recon_randomize: False
-
+# recon_default: 100
+# recon_max: 5000
+# recon_randomize: False
+#
+#
 # The loop_interval sets how long in seconds the minion will wait between
 # evaluating the scheduler and running cleanup tasks. This defaults to a
 # sane 60 seconds, but if the minion scheduler needs to be evaluated more
 # often lower this value
 #loop_interval: 60
 
-# When healing, a dns_check is run. This is to make sure that the originally
-# resolved dns has not changed. If this is something that does not happen in
-# your environment, set this value to False.
-#dns_check: True
+# The grains can be merged, instead of overridden, using this option.
+# This allows custom grains to defined different subvalues of a dictionary
+# grain. By default this feature is disabled, to enable set grains_deep_merge
+# to ``True``.
+#grains_deep_merge: False
+
+# The grains_refresh_every setting allows for a minion to periodically check
+# its grains to see if they have changed and, if so, to inform the master
+# of the new grains. This operation is moderately expensive, therefore
+# care should be taken not to set this value too low.
+#
+# Note: This value is expressed in __minutes__!
+#
+# A value of 10 minutes is a reasonable default.
+#
+# If the value is set to zero, this check is disabled.
+#grains_refresh_every: 1
+
+# Cache grains on the minion. Default is False.
+#grains_cache: False
+
+# Cache rendered pillar data on the minion. Default is False.
+# This may cause 'cachedir'/pillar to contain sensitive data that should be
+# protected accordingly.
+#minion_pillar_cache: False
+
+# Grains cache expiration, in seconds. If the cache file is older than this
+# number of seconds then the grains cache will be dumped and fully re-populated
+# with fresh data. Defaults to 5 minutes. Will have no effect if 'grains_cache'
+# is not enabled.
+# grains_cache_expiration: 300
 
 # Windows platforms lack posix IPC and must rely on slower TCP based inter-
 # process communications. Set ipc_mode to 'tcp' on such systems
 #ipc_mode: ipc
-#
+
 # Overwrite the default tcp ports used by the minion when in tcp mode
 #tcp_pub_port: 4510
 #tcp_pull_port: 4511
 
+# Passing very large events can cause the minion to consume large amounts of
+# memory. This value tunes the maximum size of a message allowed onto the
+# minion event bus. The value is expressed in bytes.
+#max_event_size: 1048576
+
+# To detect failed master(s) and fire events on connect/disconnect, set
+# master_alive_interval to the number of seconds to poll the masters for
+# connection events.
+#
+#master_alive_interval: 30
+
 # The minion can include configuration from other files. To enable this,
 # pass a list of paths to this option. The paths can be either relative or
 # absolute; if relative, they are considered to be relative to the directory
@@ -202,7 +312,6 @@
 # of shell-style globbing. If no files are matched by a path passed to this
 # option then the minion will log a warning message.
 #
-#
 # Include a config file from some other path:
 # include: /etc/salt/extra_config
 #
@@ -210,11 +319,13 @@
 #include:
 #  - /etc/salt/extra_config
 #  - /etc/roles/webserver
-
+#
+#
+#
 #####   Minion module management     #####
 ##########################################
 # Disable specific modules. This allows the admin to limit the level of
-# access the master has to the minion
+# access the master has to the minion.
 #disable_modules: [cmd,test]
 #disable_returners: []
 #
@@ -226,18 +337,22 @@
 #returner_dirs: []
 #states_dirs: []
 #render_dirs: []
+#utils_dirs: []
 #
 # A module provider can be statically overwritten or extended for the minion
 # via the providers option, in this case the default module will be
 # overwritten by the specified module. In this example the pkg module will
 # be provided by the yumpkg5 module instead of the system default.
-#
 #providers:
 #  pkg: yumpkg5
 #
 # Enable Cython modules searching and loading. (Default: False)
 #cython_enable: False
 #
+# Specify a max size (in bytes) for modules on import. This feature is currently
+# only supported on *nix operating systems and requires psutil.
+# modules_max_memory: -1
+
 
 #####    State Management Settings    #####
 ###########################################
@@ -256,21 +371,19 @@
 #renderer: yaml_jinja
 #
 # The failhard option tells the minions to stop immediately after the first
-# failure detected in the state execution, defaults to False
+# failure detected in the state execution. Defaults to False.
 #failhard: False
 #
-# autoload_dynamic_modules Turns on automatic loading of modules found in the
-# environments on the master. This is turned on by default, to turn of
-# autoloading modules when states run set this value to False
+# Reload the modules prior to a highstate run.
 #autoload_dynamic_modules: True
 #
 # clean_dynamic_modules keeps the dynamic modules on the minion in sync with
 # the dynamic modules on the master, this means that if a dynamic module is
-# not on the master it will be deleted from the minion. By default this is
-# enabled and can be disabled by changing this value to False
+# not on the master it will be deleted from the minion. By default, this is
+# enabled and can be disabled by changing this value to False.
 #clean_dynamic_modules: True
 #
-# Normally the minion is not isolated to any single environment on the master
+# Normally, the minion is not isolated to any single environment on the master
 # when running states, but the environment can be isolated on the minion side
 # by statically setting it. Remember that the recommended way to manage
 # environments is to isolate via the top file.
@@ -286,14 +399,23 @@
 # 'top' -- Read top_file option and execute based on that file on the Master
 #startup_states: ''
 #
-# list of states to run when the minion starts up if startup_states is 'sls'
+# List of states to run when the minion starts up if startup_states is 'sls':
 #sls_list:
 #  - edit.vim
 #  - hyper
 #
-# top file to execute if startup_states is 'top'
+# Top file to execute if startup_states is 'top':
 #top_file: ''
 
+# Automatically aggregate all states that have support for mod_aggregate by
+# setting to True. Or pass a list of state module names to automatically
+# aggregate just those types.
+#
+# state_aggregate:
+#   - pkg
+#
+#state_aggregate: False
+
 #####     File Directory Settings    #####
 ##########################################
 # The Salt Minion can redirect all file server operations to a local directory,
@@ -303,7 +425,8 @@
 
 # Set the file client. The client defaults to looking on the master server for
 # files, but can be directed to look at the local file directory setting
-# defined below by setting it to local.
+# defined below by setting it to "local". Setting a local file_client runs the
+# minion in masterless mode.
 #file_client: remote
 
 # The file directory works on environments passed to the minion, each environment
@@ -329,15 +452,16 @@
 # to attempt to find files. To limit this behavior so that the fileserver only
 # traverses directories with SLS files and special Salt directories like _modules,
 # enable the option below. This might be useful for installations where a file root
-# has a very large number of files and performance is negatively impacted.
-#
-# Default is False.
-#
-# fileserver_limit_traversal: False
+# has a very large number of files and performance is negatively impacted. Default
+# is False.
+#fileserver_limit_traversal: False
 
 # The hash_type is the hash to use when discovering the hash of a file in
 # the local fileserver. The default is md5, but sha1, sha224, sha256, sha384
 # and sha512 are also supported.
+#
+# Warning: Prior to changing this value, the minion should be stopped and all
+# Salt caches should be cleared.
 #hash_type: md5
 
 # The Salt pillar is searched for locally if file_client is set to local. If
@@ -346,7 +470,8 @@
 #pillar_roots:
 #  base:
 #    - /srv/pillar
-
+#
+#
 ######        Security settings       #####
 ###########################################
 # Enable "open mode", this mode still maintains encryption, but turns off
@@ -366,23 +491,34 @@
 # The state_verbose setting can be set to True or False, when set to False
 # all data that has a result of True and no changes will be suppressed.
 #state_verbose: True
-#
+
 # The state_output setting changes if the output is the full multi line
 # output for each changed state if set to 'full', but if set to 'terse'
 # the output will be shortened to a single line.
 #state_output: full
-#
-# Fingerprint of the master public key to double verify the master is valid,
-# the master fingerprint can be found by running "salt-key -F master" on the
-# salt master.
+
+# The state_output_diff setting changes whether or not the output from
+# successful states is returned. Useful when even the terse output of these
+# states is cluttering the logs. Set it to True to ignore them.
+#state_output_diff: False
+
+# The state_output_profile setting changes whether profile information
+# will be shown for each state run.
+#state_output_profile: True
+
+# Fingerprint of the master public key to validate the identity of your Salt master
+# before the initial key exchange. The master fingerprint can be found by running
+# "salt-key -F master" on the Salt master.
 #master_finger: ''
 
+
 ######         Thread settings        #####
 ###########################################
 # Disable multiprocessing support, by default when a minion receives a
 # publication a new process is spawned and the command is executed therein.
 #multiprocessing: True
 
+
 #####         Logging settings       #####
 ##########################################
 # The location of the minion log file
@@ -396,14 +532,19 @@
 #
 #log_file: /var/log/salt/minion
 #key_logfile: /var/log/salt/key
-#
+
 # The level of messages to send to the console.
 # One of 'garbage', 'trace', 'debug', info', 'warning', 'error', 'critical'.
+#
+# The following log levels are considered INSECURE and may log sensitive data:
+# ['garbage', 'trace', 'debug']
+#
 # Default: 'warning'
 #log_level: warning
-#
+
 # The level of messages to send to the log file.
 # One of 'garbage', 'trace', 'debug', info', 'warning', 'error', 'critical'.
+# If using 'log_granular_levels' this must be set to the highest desired level.
 # Default: 'warning'
 #log_level_logfile:
 
@@ -411,21 +552,54 @@
 # can be seen here: http://docs.python.org/library/time.html#time.strftime
 #log_datefmt: '%H:%M:%S'
 #log_datefmt_logfile: '%Y-%m-%d %H:%M:%S'
-#
+
 # The format of the console logging messages. Allowed formatting options can
 # be seen here: http://docs.python.org/library/logging.html#logrecord-attributes
+#
+# Console log colors are specified by these additional formatters:
+#
+# %(colorlevel)s
+# %(colorname)s
+# %(colorprocess)s
+# %(colormsg)s
+#
+# Since it is desirable to include the surrounding brackets, '[' and ']', in
+# the coloring of the messages, these color formatters also include padding as
+# well.  Color LogRecord attributes are only available for console logging.
+#
+#log_fmt_console: '%(colorlevel)s %(colormsg)s'
 #log_fmt_console: '[%(levelname)-8s] %(message)s'
-#log_fmt_logfile: '%(asctime)s,%(msecs)03.0f [%(name)-17s][%(levelname)-8s] %(message)s'
 #
+#log_fmt_logfile: '%(asctime)s,%(msecs)03.0f [%(name)-17s][%(levelname)-8s] %(message)s'
+
 # This can be used to control logging levels more specificically.  This
 # example sets the main salt library at the 'warning' level, but sets
 # 'salt.modules' to log at the 'debug' level:
 #   log_granular_levels:
-#     'salt': 'warning',
+#     'salt': 'warning'
 #     'salt.modules': 'debug'
 #
 #log_granular_levels: {}
 
+# To diagnose issues with minions disconnecting or missing returns, ZeroMQ
+# supports the use of monitor sockets to log connection events. This
+# feature requires ZeroMQ 4.0 or higher.
+#
+# To enable ZeroMQ monitor sockets, set 'zmq_monitor' to 'True' and log at a
+# debug level or higher.
+#
+# A sample log event is as follows:
+#
+# [DEBUG   ] ZeroMQ event: {'endpoint': 'tcp://127.0.0.1:4505', 'event': 512,
+# 'value': 27, 'description': 'EVENT_DISCONNECTED'}
+#
+# All events logged will include the string 'ZeroMQ event'. A connection event
+# should be logged as the minion starts up and initially connects to the
+# master. If not, check for debug log level and that the necessary version of
+# ZeroMQ is installed.
+#
+#zmq_monitor: False
+
 ######      Module configuration      #####
 ###########################################
 # Salt allows for modules to be passed arbitrary configuration data, any data
@@ -445,8 +619,8 @@
 #
 # A dict for the test module:
 #test.baz: {spam: sausage, cheese: bread}
-
-
+#
+#
 ######      Update settings          ######
 ###########################################
 # Using the features in Esky, a salt minion can both run as a frozen app and
@@ -468,27 +642,39 @@
 # the risk that it could tear down the connection the master and minion
 # without informing either party that their connection has been taken away.
 # Enabling TCP Keepalives prevents this from happening.
-#
+
 # Overall state of TCP Keepalives, enable (1 or True), disable (0 or False)
 # or leave to the OS defaults (-1), on Linux, typically disabled. Default True, enabled.
 #tcp_keepalive: True
-#
+
 # How long before the first keepalive should be sent in seconds. Default 300
 # to send the first keepalive after 5 minutes, OS default (-1) is typically 7200 seconds
 # on Linux see /proc/sys/net/ipv4/tcp_keepalive_time.
 #tcp_keepalive_idle: 300
-#
+
 # How many lost probes are needed to consider the connection lost. Default -1
 # to use OS defaults, typically 9 on Linux, see /proc/sys/net/ipv4/tcp_keepalive_probes.
 #tcp_keepalive_cnt: -1
-#
+
 # How often, in seconds, to send keepalives after the first one. Default -1 to
 # use OS defaults, typically 75 seconds on Linux, see
 # /proc/sys/net/ipv4/tcp_keepalive_intvl.
 #tcp_keepalive_intvl: -1
 
 
-######      Windows Software settings ######
+######   Windows Software settings    ######
 ############################################
-# Location of the repository cache file on the master
+# Location of the repository cache file on the master:
 #win_repo_cachefile: 'salt://win/repo/winrepo.p'
+
+
+######      Returner  settings        ######
+############################################
+# Which returner(s) will be used for minion's result:
+#return: mysql
+
+
+######    Miscellaneous  settings     ######
+############################################
+# Default match type for filtering events tags: startswith, endswith, find, regex, fnmatch
+#event_match_type: startswith
diff --git a/meta-openstack/recipes-support/salt/files/roster b/meta-openstack/recipes-support/salt/files/roster
index 3eac2fa..e5a8318 100644
--- a/meta-openstack/recipes-support/salt/files/roster
+++ b/meta-openstack/recipes-support/salt/files/roster
@@ -6,3 +6,4 @@
 #  sudo: True         # Whether to sudo to root, not enabled by default
 #web2:
 #  host: 192.168.42.2
+
diff --git a/meta-openstack/recipes-support/salt/salt_2015.8.0.bb b/meta-openstack/recipes-support/salt/salt_2016.3.0.bb
similarity index 88%
rename from meta-openstack/recipes-support/salt/salt_2015.8.0.bb
rename to meta-openstack/recipes-support/salt/salt_2016.3.0.bb
index b22b827..f3bbdba 100644
--- a/meta-openstack/recipes-support/salt/salt_2015.8.0.bb
+++ b/meta-openstack/recipes-support/salt/salt_2016.3.0.bb
@@ -1,18 +1,20 @@
 HOMEPAGE = "http://saltstack.com/"
 SECTION = "admin"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b59c9134761722281bb895f65cb15e9a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fb92f464675f6b5df90f540d60237915"
 DEPENDS = "\
            python-msgpack \
            python-pyyaml \
            python-jinja2 \
            python-markupsafe \
-           python-pyzmq \
-           python-pycrypto \
 "
 
+PACKAGECONFIG ??= "zeromq"
+PACKAGECONFIG[zeromq] = ",,python-pyzmq python-pycrypto,"
+PACKAGECONFIG[tcp] = ",,python-pycrypto"
+
 SRCNAME = "salt"
-SRC_URI = "http://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
            file://set_python_location_hashbang.patch \
            file://minion \
            file://salt-minion \
@@ -26,8 +28,8 @@ SRC_URI = "http://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.
            file://roster \
 "
 
-SRC_URI[md5sum] = "a15842ef0582cca9d26143fe0a6180b7"
-SRC_URI[sha256sum] = "71e1cb2eb1d4b30f3247f5590c00a2089190b8f9a90c9330dc9a65fae517ec9b"
+SRC_URI[md5sum] = "8ed82cfb3f9b1764a035edbdacf0fea9"
+SRC_URI[sha256sum] = "e316dd103b7faeaa97820197e4d0d7d358519f0ca2a6dcb1d9b718eea801ed30"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
@@ -77,7 +79,9 @@ Between the remote execution system, and state management Salt addresses the bac
 
 SUMMARY_${PN}-minion = "client package for salt, the distributed remote execution system"
 DESCRIPTION_${PN}-minion = "${DESCRIPTION_COMMON} This particular package provides the worker agent for salt."
-RDEPENDS_${PN}-minion = "python (>=2.6), ${PN}-common (= ${EXTENDPKGV}) python-pycrypto python-msgpack python-pyzmq (>= 13.1.0)"
+RDEPENDS_${PN}-minion = "python (>=2.6), ${PN}-common (= ${EXTENDPKGV}) python-msgpack"
+RDEPENDS_${PN}-minion += "${@bb.utils.contains('PACKAGECONFIG', 'zeromq', 'python-pycrypto python-pyzmq (>= 13.1.0)', '',d)}"
+RDEPENDS_${PN}-minion += "${@bb.utils.contains('PACKAGECONFIG', 'tcp', 'python-pycrypto', '',d)}"
 RRECOMMENDS_${PN}-minion_append_x64 = "dmidecode"
 RSUGGESTS_${PN}-minion = "python-augeas"
 CONFFILES_${PN}-minion = "${sysconfdir}/${PN}/minion ${sysconfdir}/init.d/${PN}-minion"
@@ -118,7 +122,9 @@ INITSCRIPT_PARAMS_${PN}-api = "defaults"
 
 SUMMARY_${PN}-master = "remote manager to administer servers via salt"
 DESCRIPTION_${PN}-master ="${DESCRIPTION_COMMON} This particular package provides the salt controller."
-RDEPENDS_${PN}-master = "python (>= 2.6) ${PN}-common (= ${EXTENDPKGV}) python-pycrypto python-msgpack python-pyzmq (>= 13.1.0)"
+RDEPENDS_${PN}-master = "python (>= 2.6) ${PN}-common (= ${EXTENDPKGV}) python-msgpack"
+RDEPENDS_${PN}-master += "${@bb.utils.contains('PACKAGECONFIG', 'zeromq', 'python-pycrypto python-pyzmq (>= 13.1.0)', '',d)}"
+RDEPENDS_${PN}-master += "${@bb.utils.contains('PACKAGECONFIG', 'tcp', 'python-pycrypto', '',d)}"
 CONFFILES_${PN}-master="${sysconfdir}/init.d/${PN}-master  ${sysconfdir}/${PN}/master"
 RSUGGESTS_${PN}-master = "python-git"
 FILES_${PN}-master = "${bindir}/${PN} ${bindir}/${PN}-cp ${bindir}/${PN}-key ${bindir}/${PN}-master ${bindir}/${PN}-run ${bindir}/${PN}-unity ${bindir}/spm ${CONFFILES_${PN}-master}"
-- 
1.9.1


