Return-Path: <alejandro.delcastillo@ni.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 14D4DE00D82; Wed, 14 Dec 2016 13:32:34 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [130.164.80.23 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 3252 seconds by postgrey-1.32 at yocto-www;
	Wed, 14 Dec 2016 13:32:30 PST
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E5A2E00D7E
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Dec 2016 13:32:30 -0800 (PST)
Received: from us-aus-exhub2.ni.corp.natinst.com
	(us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTPS id
	uBEKcHnE022361
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Dec 2016 14:38:17 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 14 Dec 2016 14:38:16 -0600
Received: from delcastillo2.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Wed, 14 Dec 2016 14:38:16 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 14 Dec 2016 14:38:14 -0600
Message-ID: <1481747894-12911-1-git-send-email-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-12-14_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1612140314
Subject: [PATCH] salt: upgrade to 2016.11
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
X-List-Received-Date: Wed, 14 Dec 2016 21:32:34 -0000
Content-Type: text/plain

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 meta-openstack/recipes-support/salt/files/cloud    |   6 +-
 meta-openstack/recipes-support/salt/files/master   | 276 ++++++++++++++++++---
 meta-openstack/recipes-support/salt/files/minion   | 156 ++++++++++--
 .../salt/files/salt-common.logrotate               |  21 +-
 .../salt/{salt_2016.3.0.bb => salt_2016.11.0.bb}   |   4 +-
 5 files changed, 403 insertions(+), 60 deletions(-)
 rename meta-openstack/recipes-support/salt/{salt_2016.3.0.bb => salt_2016.11.0.bb} (98%)

diff --git a/meta-openstack/recipes-support/salt/files/cloud b/meta-openstack/recipes-support/salt/files/cloud
index 5bd28df..921cc04 100644
--- a/meta-openstack/recipes-support/salt/files/cloud
+++ b/meta-openstack/recipes-support/salt/files/cloud
@@ -1,4 +1,4 @@
-# This file should normally be installed at: /etc/salt/cloud 
+# This file should normally be installed at: /etc/salt/cloud
 
 
 ##########################################
@@ -44,7 +44,7 @@
 #log_level_logfile: info
 
 
-# The date and time format used in log messages. Allowed date/time formating
+# The date and time format used in log messages. Allowed date/time formatting
 # can be seen here:
 #
 #	http://docs.python.org/library/time.html#time.strftime
@@ -71,7 +71,7 @@
 #log_fmt_console: '%(colorlevel)s %(colormsg)s'
 #log_fmt_console: '[%(levelname)-8s] %(message)s'
 #
-#log_fmt_logfile: '%(asctime)s,%(msecs)03.0f [%(name)-17s][%(levelname)-8s] %(message)s'
+#log_fmt_logfile: '%(asctime)s,%(msecs)03d [%(name)-17s][%(levelname)-8s] %(message)s'
 
 
 # Logger levels can be used to tweak specific loggers logging levels.
diff --git a/meta-openstack/recipes-support/salt/files/master b/meta-openstack/recipes-support/salt/files/master
index 821f5fc..4ecb160 100644
--- a/meta-openstack/recipes-support/salt/files/master
+++ b/meta-openstack/recipes-support/salt/files/master
@@ -39,12 +39,22 @@
 # key_logfile, pidfile:
 #root_dir: /
 
+# The path to the master's configuration file.
+#conf_file: /etc/salt/master
+
 # Directory used to store public key data:
 #pki_dir: /etc/salt/pki/master
 
+# Key cache. Increases master speed for large numbers of accepted
+# keys. Available options: 'sched'. (Updates on a fixed schedule.)
+# Note that enabling this feature means that minions will not be
+# available to target for up to the length of the maintanence loop
+# which by default is 60s.
+#key_cache: ''
+
 # Directory to store job and cache data:
 # This directory may contain sensitive data and should be protected accordingly.
-# 
+#
 #cachedir: /var/cache/salt/master
 
 # Directory for custom modules. This directory can contain subdirectories for
@@ -54,7 +64,7 @@
 
 # Directory for custom modules. This directory can contain subdirectories for
 # each of Salt's module types such as "runners", "output", "wheel", "modules",
-# "states", "returners", etc.
+# "states", "returners", "engines", etc.
 # Like 'extension_modules' but can take an array of paths
 #module_dirs: <no default>
 #   - /var/cache/salt/minion/extmods
@@ -65,6 +75,10 @@
 # Set the number of hours to keep old job information in the job cache:
 #keep_jobs: 24
 
+# The number of seconds to wait when the client is requesting information
+# about running jobs.
+#gather_job_timeout: 10
+
 # Set the default timeout for the salt command and api. The default is 5
 # seconds.
 #timeout: 5
@@ -77,6 +91,11 @@
 # Set the default outputter used by the salt command. The default is "nested".
 #output: nested
 
+# Set the default output file used by the salt command. Default is to output
+# to the CLI and not to a file. Functions the same way as the "--out-file"
+# CLI option, only sets this to a single file for all salt commands.
+#output_file: None
+
 # Return minions that timeout when running commands like test.ping
 #show_timeout: True
 
@@ -88,6 +107,12 @@
 # (true by default).
 # strip_colors: False
 
+# To display a summary of the number of minions targeted, the number of
+# minions returned, and the number of minions that did not return, set the
+# cli_summary value to True. (False by default.)
+#
+#cli_summary: False
+
 # Set the directory used to hold unix sockets:
 #sock_dir: /var/run/salt/master
 
@@ -106,7 +131,7 @@
 #minion_data_cache: True
 
 # Store all returns in the given returner.
-# Setting this option requires that any returner-specific configuration also 
+# Setting this option requires that any returner-specific configuration also
 # be set. See various returners in salt/returners for details on required
 # configuration values. (See also, event_return_queue below.)
 #
@@ -118,15 +143,15 @@
 # By default, events are not queued.
 #event_return_queue: 0
 
-# Only events returns matching tags in a whitelist
-# event_return_whitelist:
-#   - salt/master/a_tag
-#   - salt/master/another_tag
+# Only return events matching tags in a whitelist, supports glob matches.
+#event_return_whitelist:
+#  - salt/master/a_tag
+#  - salt/run/*/ret
 
-# Store all event returns _except_ the tags in a blacklist
-# event_return_blacklist:
-#   - salt/master/not_this_tag
-#   - salt/master/or_this_one
+# Store all event returns **except** the tags in a blacklist, supports globs.
+#event_return_blacklist:
+#  - salt/master/not_this_tag
+#  - salt/wheel/*/ret
 
 # Passing very large events can cause the minion to consume large amounts of
 # memory. This value tunes the maximum size of a message allowed onto the
@@ -145,12 +170,12 @@
 # the key rotation event as minions reconnect. Consider this carefully if this
 # salt master is managing a large number of minions.
 #
-# If disabled, it is recommended to handle this event by listening for the 
+# If disabled, it is recommended to handle this event by listening for the
 # 'aes_key_rotate' event with the 'key' tag and acting appropriately.
 # ping_on_rotate: False
 
 # By default, the master deletes its cache of minion data when the key for that
-# minion is removed. To preserve the cache after key deletion, set 
+# minion is removed. To preserve the cache after key deletion, set
 # 'preserve_minion_cache' to True.
 #
 # WARNING: This may have security implications if compromised minions auth with
@@ -230,6 +255,14 @@
 # ZMQ high-water-mark for EventPublisher pub socket
 #event_publisher_pub_hwm: 10000
 
+# The master may allocate memory per-event and not
+# reclaim it.
+# To set a high-water mark for memory allocation, use
+# ipc_write_buffer to set a high-water mark for message
+# buffering.
+# Value: In bytes. Set to 'dynamic' to have Salt select
+# a value for you. Default is disabled.
+# ipc_write_buffer: 'dynamic'
 
 
 #####        Security settings       #####
@@ -244,7 +277,7 @@
 # public keys from the minions. Note that this is insecure.
 #auto_accept: False
 
-# Time in minutes that a incoming public key with a matching name found in
+# Time in minutes that an incoming public key with a matching name found in
 # pki_dir/minion_autosign/keyid is automatically accepted. Expired autosign keys
 # are removed when the master checks the minion_autosign directory.
 # 0 equals no timeout
@@ -272,7 +305,7 @@
 # This setting should be treated with care since it opens up execution
 # capabilities to non root users. By default this capability is completely
 # disabled.
-#pulisher_acl:
+#publisher_acl:
 #  larry:
 #    - test.ping
 #    - network.*
@@ -283,6 +316,11 @@
 # running any commands. It would also blacklist any use of the "cmd"
 # module. This is completely disabled by default.
 #
+#
+# Check the list of configured users in client ACL against users on the
+# system and throw errors if they do not exist.
+#client_acl_verify: True
+#
 #publisher_acl_blacklist:
 #  users:
 #    - root
@@ -295,7 +333,7 @@
 # publisher_acl_blacklist instead.
 
 # Enforce publisher_acl & publisher_acl_blacklist when users have sudo
-# access to the salt command. 
+# access to the salt command.
 #
 #sudo_acl: False
 
@@ -308,6 +346,18 @@
 #
 # Time (in seconds) for a newly generated token to live. Default: 12 hours
 #token_expire: 43200
+#
+# Allow eauth users to specify the expiry time of the tokens they generate.
+# A boolean applies to all users or a dictionary of whitelisted eauth backends
+# and usernames may be given.
+# token_expire_user_override:
+#   pam:
+#     - fred
+#     - tom
+#   ldap:
+#     - gary
+#
+#token_expire_user_override: False
 
 # Allow minions to push files to the master. This is disabled by default, for
 # security purposes.
@@ -344,6 +394,10 @@
 #ssh_minion_opts:
 #  gpg_keydir: /root/gpg
 
+# Set this to True to default to using ~/.ssh/id_rsa for salt-ssh
+# authentication with minions
+#ssh_use_home_key: False
+
 #####    Master Module Management    #####
 ##########################################
 # Manage how master side modules are loaded.
@@ -455,7 +509,7 @@
 # When using multiple environments, each with their own top file, the
 # default behaviour is an unordered merge. To prevent top files from
 # being merged together and instead to only use the top file from the
-# requested environment, set this value to 'same'. 
+# requested environment, set this value to 'same'.
 #top_file_merging_strategy: merge
 
 # To specify the order in which environments are merged, set the ordering
@@ -469,12 +523,15 @@
 #default_top: base
 
 # The hash_type is the hash to use when discovering the hash of a file on
-# the master server. The default is md5, but sha1, sha224, sha256, sha384
+# the master server. The default is md5 but sha1, sha224, sha256, sha384
 # and sha512 are also supported.
 #
-# Prior to changing this value, the master should be stopped and all Salt 
+# WARNING: While md5 is also supported, do not use it due to the high chance
+# of possible collisions and thus security breach.
+#
+# Prior to changing this value, the master should be stopped and all Salt
 # caches should be cleared.
-#hash_type: md5
+#hash_type: sha256
 
 # The buffer size in the file server can be adjusted here:
 #file_buffer_size: 1048576
@@ -540,10 +597,37 @@
 
 # Git File Server Backend Configuration
 #
-# Gitfs can be provided by one of two python modules: GitPython or pygit2. If
-# using pygit2, both libgit2 and git must also be installed.
-#gitfs_provider: gitpython
-#
+# Optional parameter used to specify the provider to be used for gitfs. Must
+# be one of the following: pygit2, gitpython, or dulwich. If unset, then each
+# will be tried in that same order, and the first one with a compatible
+# version installed will be the provider that is used.
+#gitfs_provider: pygit2
+
+# Along with gitfs_password, is used to authenticate to HTTPS remotes.
+# gitfs_user: ''
+
+# Along with gitfs_user, is used to authenticate to HTTPS remotes.
+# This parameter is not required if the repository does not use authentication.
+#gitfs_password: ''
+
+# By default, Salt will not authenticate to an HTTP (non-HTTPS) remote.
+# This parameter enables authentication over HTTP. Enable this at your own risk.
+#gitfs_insecure_auth: False
+
+# Along with gitfs_privkey (and optionally gitfs_passphrase), is used to
+# authenticate to SSH remotes. This parameter (or its per-remote counterpart)
+# is required for SSH remotes.
+#gitfs_pubkey: ''
+
+# Along with gitfs_pubkey (and optionally gitfs_passphrase), is used to
+# authenticate to SSH remotes. This parameter (or its per-remote counterpart)
+# is required for SSH remotes.
+#gitfs_privkey: ''
+
+# This parameter is optional, required only when the SSH key being used to
+# authenticate is protected by a passphrase.
+#gitfs_passphrase: ''
+
 # When using the git fileserver backend at least one git remote needs to be
 # defined. The user running the salt master will need read access to the repo.
 #
@@ -551,7 +635,7 @@
 # and the first repo to have the file will return it.
 # When using the git backend branches and tags are translated into salt
 # environments.
-# Note:  file:// repos will be treated as a remote, so refs you want used must
+# Note: file:// repos will be treated as a remote, so refs you want used must
 # exist in that repo as *local* refs.
 #gitfs_remotes:
 #  - git://github.com/saltstack/salt-states.git
@@ -610,10 +694,10 @@
 #pillar_safe_render_error: True
 
 # The pillar_source_merging_strategy option allows you to configure merging strategy
-# between different sources. It accepts four values: recurse, aggregate, overwrite,
-# or smart. Recurse will merge recursively mapping of data. Aggregate instructs
-# aggregation of elements between sources that use the #!yamlex renderer. Overwrite
-# will verwrite elements according the order in which they are processed. This is
+# between different sources. It accepts five values: none, recurse, aggregate, overwrite,
+# or smart. None will not do any merging at all. Recurse will merge recursively mapping of data.
+# Aggregate instructs aggregation of elements between sources that use the #!yamlex renderer. Overwrite
+# will overwrite elements according the order in which they are processed. This is
 # behavior of the 2014.1 branch and earlier. Smart guesses the best strategy based
 # on the "renderer" setting and is the default value.
 #pillar_source_merging_strategy: smart
@@ -621,6 +705,107 @@
 # Recursively merge lists by aggregating them instead of replacing them.
 #pillar_merge_lists: False
 
+# Set this option to 'True' to force a 'KeyError' to be raised whenever an
+# attempt to retrieve a named value from pillar fails. When this option is set
+# to 'False', the failed attempt returns an empty string. Default is 'False'.
+#pillar_raise_on_missing: False
+
+# Git External Pillar (git_pillar) Configuration Options
+#
+# Specify the provider to be used for git_pillar. Must be either pygit2 or
+# gitpython. If unset, then both will be tried in that same order, and the
+# first one with a compatible version installed will be the provider that
+# is used.
+#git_pillar_provider: pygit2
+
+# If the desired branch matches this value, and the environment is omitted
+# from the git_pillar configuration, then the environment for that git_pillar
+# remote will be base.
+#git_pillar_base: master
+
+# If the branch is omitted from a git_pillar remote, then this branch will
+# be used instead
+#git_pillar_branch: master
+
+# Environment to use for git_pillar remotes. This is normally derived from
+# the branch/tag (or from a per-remote env parameter), but if set this will
+# override the process of deriving the env from the branch/tag name.
+#git_pillar_env: ''
+
+# Path relative to the root of the repository where the git_pillar top file
+# and SLS files are located.
+#git_pillar_root: ''
+
+# Specifies whether or not to ignore SSL certificate errors when contacting
+# the remote repository.
+#git_pillar_ssl_verify: False
+
+# When set to False, if there is an update/checkout lock for a git_pillar
+# remote and the pid written to it is not running on the master, the lock
+# file will be automatically cleared and a new lock will be obtained.
+#git_pillar_global_lock: True
+
+# Git External Pillar Authentication Options
+#
+# Along with git_pillar_password, is used to authenticate to HTTPS remotes.
+#git_pillar_user: ''
+
+# Along with git_pillar_user, is used to authenticate to HTTPS remotes.
+# This parameter is not required if the repository does not use authentication.
+#git_pillar_password: ''
+
+# By default, Salt will not authenticate to an HTTP (non-HTTPS) remote.
+# This parameter enables authentication over HTTP.
+#git_pillar_insecure_auth: False
+
+# Along with git_pillar_privkey (and optionally git_pillar_passphrase),
+# is used to authenticate to SSH remotes.
+#git_pillar_pubkey: ''
+
+# Along with git_pillar_pubkey (and optionally git_pillar_passphrase),
+# is used to authenticate to SSH remotes.
+#git_pillar_privkey: ''
+
+# This parameter is optional, required only when the SSH key being used
+# to authenticate is protected by a passphrase.
+#git_pillar_passphrase: ''
+
+# A master can cache pillars locally to bypass the expense of having to render them
+# for each minion on every request. This feature should only be enabled in cases
+# where pillar rendering time is known to be unsatisfactory and any attendant security
+# concerns about storing pillars in a master cache have been addressed.
+#
+# When enabling this feature, be certain to read through the additional ``pillar_cache_*``
+# configuration options to fully understand the tunable parameters and their implications.
+#
+# Note: setting ``pillar_cache: True`` has no effect on targeting Minions with Pillars.
+# See https://docs.saltstack.com/en/latest/topics/targeting/pillar.html
+#pillar_cache: False
+
+# If and only if a master has set ``pillar_cache: True``, the cache TTL controls the amount
+# of time, in seconds, before the cache is considered invalid by a master and a fresh
+# pillar is recompiled and stored.
+#pillar_cache_ttl: 3600
+
+# If and only if a master has set `pillar_cache: True`, one of several storage providers
+# can be utililzed.
+#
+# `disk`: The default storage backend. This caches rendered pillars to the master cache.
+#         Rendered pillars are serialized and deserialized as msgpack structures for speed.
+#         Note that pillars are stored UNENCRYPTED. Ensure that the master cache
+#         has permissions set appropriately. (Same defaults are provided.)
+#
+# memory: [EXPERIMENTAL] An optional backend for pillar caches which uses a pure-Python
+#         in-memory data structure for maximal performance. There are several caveats,
+#         however. First, because each master worker contains its own in-memory cache,
+#         there is no guarantee of cache consistency between minion requests. This
+#         works best in situations where the pillar rarely if ever changes. Secondly,
+#         and perhaps more importantly, this means that unencrypted pillars will
+#         be accessible to any process which can examine the memory of the ``salt-master``!
+#         This may represent a substantial security risk.
+#
+#pillar_cache_backend: disk
+
 
 #####          Syndic settings       #####
 ##########################################
@@ -649,6 +834,12 @@
 # LOG file of the syndic daemon:
 #syndic_log_file: syndic.log
 
+# The behaviour of the multi-syndic when connection to a master of masters failed.
+# Can specify ``random`` (default) or ``ordered``. If set to ``random``, masters
+# will be iterated in random order. If ``ordered`` is specified, the configured
+# order will be used.
+#syndic_failover: random
+
 
 #####      Peer Publish settings     #####
 ##########################################
@@ -738,7 +929,7 @@
 # If using 'log_granular_levels' this must be set to the highest desired level.
 #log_level_logfile: warning
 
-# The date and time format used in log messages. Allowed date/time formating
+# The date and time format used in log messages. Allowed date/time formatting
 # can be seen here: http://docs.python.org/library/time.html#time.strftime
 #log_datefmt: '%H:%M:%S'
 #log_datefmt_logfile: '%Y-%m-%d %H:%M:%S'
@@ -760,7 +951,7 @@
 #log_fmt_console: '%(colorlevel)s %(colormsg)s'
 #log_fmt_console: '[%(levelname)-8s] %(message)s'
 #
-#log_fmt_logfile: '%(asctime)s,%(msecs)03.0f [%(name)-17s][%(levelname)-8s] %(message)s'
+#log_fmt_logfile: '%(asctime)s,%(msecs)03d [%(name)-17s][%(levelname)-8s] %(message)s'
 
 # This can be used to control logging levels more specificically.  This
 # example sets the main salt library at the 'warning' level, but sets
@@ -774,11 +965,18 @@
 
 #####         Node Groups           ######
 ##########################################
-# Node groups allow for logical groupings of minion nodes. A group consists of a group
-# name and a compound target.
+# Node groups allow for logical groupings of minion nodes. A group consists of
+# a group name and a compound target. Nodgroups can reference other nodegroups
+# with 'N@' classifier. Ensure that you do not have circular references.
+#
 #nodegroups:
-#  group1: 'L@foo.domain.com,bar.domain.com,baz.domain.com and bl*.domain.com'
+#  group1: 'L@foo.domain.com,bar.domain.com,baz.domain.com or bl*.domain.com'
 #  group2: 'G@os:Debian and foo.domain.com'
+#  group3: 'G@os:Debian and N@group1'
+#  group4:
+#    - 'G@foo:bar'
+#    - 'or'
+#    - 'G@foo:baz'
 
 
 #####     Range Cluster settings     #####
@@ -824,3 +1022,13 @@
 ############################################
 # Default match type for filtering events tags: startswith, endswith, find, regex, fnmatch
 #event_match_type: startswith
+
+# Save runner returns to the job cache
+#runner_returns: True
+
+# Permanently include any available Python 3rd party modules into Salt Thin
+# when they are generated for Salt-SSH or other purposes.
+# The modules should be named by the names they are actually imported inside the Python.
+# The value of the parameters can be either one module or a comma separated list of them.
+#thin_extra_mods: foo,bar
+
diff --git a/meta-openstack/recipes-support/salt/files/minion b/meta-openstack/recipes-support/salt/files/minion
index bd97c43..ad7a374 100644
--- a/meta-openstack/recipes-support/salt/files/minion
+++ b/meta-openstack/recipes-support/salt/files/minion
@@ -38,6 +38,8 @@
 # value to "str".  Failover masters can be requested by setting
 # to "failover".  MAKE SURE TO SET master_alive_interval if you are
 # using failover.
+# Setting master_type to 'disable' let's you have a running minion (with engines and
+# beacons) without a master connection
 # master_type: str
 
 # Poll interval in seconds for checking if the master is still there.  Only
@@ -46,6 +48,16 @@
 # of TCP connections, such as load balancers.)
 # master_alive_interval: 30
 
+# If the minion is in multi-master mode and the master_type configuration option
+# is set to "failover", this setting can be set to "True" to force the minion
+# to fail back to the first master in the list if the first master is back online.
+#master_failback: False
+
+# If the minion is in multi-master mode, the "master_type" configuration is set to
+# "failover", and the "master_failback" option is enabled, the master failback
+# interval can be set to ping the top master with this interval, in seconds.
+#master_failback_interval: 0
+
 # Set whether the minion should connect to the master via IPv6:
 #ipv6: False
 
@@ -60,11 +72,15 @@
 # The user to run salt.
 #user: root
 
-# Setting sudo_user will cause salt to run all execution modules under an sudo
-# to the user given in sudo_user.  The user under which the salt minion process
-# itself runs will still be that provided in the user config above, but all
-# execution modules run by the minion will be rerouted through sudo.
-#sudo_user: saltdev
+# The user to run salt remote execution commands as via sudo. If this option is
+# enabled then sudo will be used to change the active user executing the remote
+# command. If enabled the user will need to be allowed access via the sudoers
+# file for the user that the salt minion is configured to run as. The most
+# common option would be to use the root user. If this option is set the user
+# option should also be set to a non-root user. If migrating from a root minion
+# to a non root minion the minion cache should be cleared and the minion pki
+# directory will need to be changed to the ownership of the new user.
+#sudo_user: root
 
 # Specify the location of the daemon process ID file.
 #pidfile: /var/run/salt-minion.pid
@@ -73,6 +89,9 @@
 # sock_dir, pidfile.
 #root_dir: /
 
+# The path to the minion's configuration file.
+#conf_file: /etc/salt/minion
+
 # The directory to store the pki information in
 #pki_dir: /etc/salt/pki/minion
 
@@ -83,6 +102,13 @@
 # clusters.
 #id:
 
+# Cache the minion id to a file when the minion's id is not statically defined
+# in the minion config. Defaults to "True". This setting prevents potential
+# problems when automatic minion id resolution changes, which can cause the
+# minion to lose connection with the master. To turn off minion id caching,
+# set this config to ``False``.
+#minion_id_caching: True
+
 # Append a domain to a hostname in the event that it does not exist.  This is
 # useful for systems where socket.getfqdn() does not actually result in a
 # FQDN (for instance, Solaris).
@@ -103,6 +129,13 @@
 # This data may contain sensitive data and should be protected accordingly.
 #cachedir: /var/cache/salt/minion
 
+# Append minion_id to these directories.  Helps with
+# multiple proxies and minions running on the same machine.
+# Allowed elements in the list: pki_dir, cachedir, extension_modules
+# Normally not needed unless running several proxies and/or minions on the same machine
+# Defaults to ['cachedir'] for proxies, [] (empty list) for regular minions
+#append_minionid_config_dirs:
+
 # Verify and set permissions on configuration directories at startup.
 #verify_env: True
 
@@ -171,6 +204,20 @@
 # authenticate.
 #auth_tries: 7
 
+# The number of attempts to connect to a master before giving up.
+# Set this to -1 for unlimited attempts. This allows for a master to have
+# downtime and the minion to reconnect to it later when it comes back up.
+# In 'failover' mode, it is the number of attempts for each set of masters.
+# In this mode, it will cycle through the list of masters for each attempt.
+#
+# This is different than auth_tries because auth_tries attempts to
+# retry auth attempts with a single master. auth_tries is under the
+# assumption that you can connect to the master but not gain
+# authorization from it. master_tries will still cycle through all
+# the masters in a given try, so it is appropriate if you expect
+# occasional downtime from the master(s).
+#master_tries: 1
+
 # If authentication fails due to SaltReqTimeoutError during a ping_interval,
 # cause sub minion process to restart.
 #auth_safemode: False
@@ -249,10 +296,17 @@
 #
 #
 # The loop_interval sets how long in seconds the minion will wait between
-# evaluating the scheduler and running cleanup tasks. This defaults to a
-# sane 60 seconds, but if the minion scheduler needs to be evaluated more
-# often lower this value
-#loop_interval: 60
+# evaluating the scheduler and running cleanup tasks.  This defaults to 1
+# second on the minion scheduler.
+#loop_interval: 1
+
+# Some installations choose to start all job returns in a cache or a returner
+# and forgo sending the results back to a master. In this workflow, jobs
+# are most often executed with --async from the Salt CLI and then results
+# are evaluated by examining job caches on the minions or any configured returners.
+# WARNING: Setting this to False will **disable** returns back to the master.
+#pub_ret: True
+
 
 # The grains can be merged, instead of overridden, using this option.
 # This allows custom grains to defined different subvalues of a dictionary
@@ -286,6 +340,26 @@
 # is not enabled.
 # grains_cache_expiration: 300
 
+# Determines whether or not the salt minion should run scheduled mine updates.
+# Defaults to "True". Set to "False" to disable the scheduled mine updates
+# (this essentially just does not add the mine update function to the minion's
+# scheduler).
+#mine_enabled: True
+
+# Determines whether or not scheduled mine updates should be accompanied by a job
+# return for the job cache. Defaults to "False". Set to "True" to include job
+# returns in the job cache for mine updates.
+#mine_return_job: False
+
+# Example functions that can be run via the mine facility
+# NO mine functions are established by default.
+# Note these can be defined in the minion's pillar as well.
+#mine_functions:
+#  test.ping: []
+#  network.ip_addrs:
+#    interface: eth0
+#    cidr: '10.0.0.0/8'
+
 # Windows platforms lack posix IPC and must rely on slower TCP based inter-
 # process communications. Set ipc_mode to 'tcp' on such systems
 #ipc_mode: ipc
@@ -319,16 +393,33 @@
 #include:
 #  - /etc/salt/extra_config
 #  - /etc/roles/webserver
+
+# The syndic minion can verify that it is talking to the correct master via the
+# key fingerprint of the higher-level master with the "syndic_finger" config.
+#syndic_finger: ''
 #
 #
 #
 #####   Minion module management     #####
 ##########################################
 # Disable specific modules. This allows the admin to limit the level of
-# access the master has to the minion.
-#disable_modules: [cmd,test]
+# access the master has to the minion.  The default here is the empty list,
+# below is an example of how this needs to be formatted in the config file
+#disable_modules:
+#  - cmdmod
+#  - test
 #disable_returners: []
-#
+
+# This is the reverse of disable_modules.  The default, like disable_modules, is the empty list,
+# but if this option is set to *anything* then *only* those modules will load.
+# Note that this is a very large hammer and it can be quite difficult to keep the minion working
+# the way you think it should since Salt uses many modules internally itself.  At a bare minimum
+# you need the following enabled or else the minion won't start.
+#whitelist_modules:
+#  - cmdmod
+#  - test
+#  - config
+
 # Modules can be loaded from arbitrary paths. This enables the easy deployment
 # of third party modules. Modules for returners and minions can be loaded.
 # Specify a list of extra directories to search for minion modules and
@@ -389,6 +480,15 @@
 # environments is to isolate via the top file.
 #environment: None
 #
+# Isolates the pillar environment on the minion side. This functions the same
+# as the environment setting, but for pillar instead of states.
+#pillarenv: None
+#
+# Set this option to 'True' to force a 'KeyError' to be raised whenever an
+# attempt to retrieve a named value from pillar fails. When this option is set
+# to 'False', the failed attempt returns an empty string. Default is 'False'.
+#pillar_raise_on_missing: False
+#
 # If using the local file directory, then the state top file name needs to be
 # defined, by default this is top.sls.
 #state_top: top.sls
@@ -448,6 +548,18 @@
 #  base:
 #    - /srv/salt
 
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
@@ -456,13 +568,19 @@
 # is False.
 #fileserver_limit_traversal: False
 
-# The hash_type is the hash to use when discovering the hash of a file in
+# The hash_type is the hash to use when discovering the hash of a file on
 # the local fileserver. The default is md5, but sha1, sha224, sha256, sha384
 # and sha512 are also supported.
 #
+# WARNING: While md5 and sha1 are also supported, do not use it due to the high chance
+# of possible collisions and thus security breach.
+#
+# WARNING: While md5 is also supported, do not use it due to the high chance
+# of possible collisions and thus security breach.
+#
 # Warning: Prior to changing this value, the minion should be stopped and all
 # Salt caches should be cleared.
-#hash_type: md5
+#hash_type: sha256
 
 # The Salt pillar is searched for locally if file_client is set to local. If
 # this is the case, and pillar data is defined, then the pillar_roots need to
@@ -470,6 +588,10 @@
 #pillar_roots:
 #  base:
 #    - /srv/pillar
+
+# Set a hard-limit on the size of the files that can be pushed to the master.
+# It will be interpreted as megabytes. Default: 100
+#file_recv_max_size: 100
 #
 #
 ######        Security settings       #####
@@ -508,7 +630,7 @@
 
 # Fingerprint of the master public key to validate the identity of your Salt master
 # before the initial key exchange. The master fingerprint can be found by running
-# "salt-key -F master" on the Salt master.
+# "salt-key -f master.pub" on the Salt master.
 #master_finger: ''
 
 
@@ -548,7 +670,7 @@
 # Default: 'warning'
 #log_level_logfile:
 
-# The date and time format used in log messages. Allowed date/time formating
+# The date and time format used in log messages. Allowed date/time formatting
 # can be seen here: http://docs.python.org/library/time.html#time.strftime
 #log_datefmt: '%H:%M:%S'
 #log_datefmt_logfile: '%Y-%m-%d %H:%M:%S'
@@ -570,7 +692,7 @@
 #log_fmt_console: '%(colorlevel)s %(colormsg)s'
 #log_fmt_console: '[%(levelname)-8s] %(message)s'
 #
-#log_fmt_logfile: '%(asctime)s,%(msecs)03.0f [%(name)-17s][%(levelname)-8s] %(message)s'
+#log_fmt_logfile: '%(asctime)s,%(msecs)03d [%(name)-17s][%(levelname)-8s] %(message)s'
 
 # This can be used to control logging levels more specificically.  This
 # example sets the main salt library at the 'warning' level, but sets
diff --git a/meta-openstack/recipes-support/salt/files/salt-common.logrotate b/meta-openstack/recipes-support/salt/files/salt-common.logrotate
index dcfd268..3cd0023 100644
--- a/meta-openstack/recipes-support/salt/files/salt-common.logrotate
+++ b/meta-openstack/recipes-support/salt/files/salt-common.logrotate
@@ -1,7 +1,20 @@
-/var/log/salt/master
-/var/log/salt/minion
-/var/log/salt/*.log
-{
+/var/log/salt/master {
+	weekly
+	missingok
+	rotate 7
+	compress
+	notifempty
+}
+
+/var/log/salt/minion {
+	weekly
+	missingok
+	rotate 7
+	compress
+	notifempty
+}
+
+/var/log/salt/key {
 	weekly
 	missingok
 	rotate 7
diff --git a/meta-openstack/recipes-support/salt/salt_2016.3.0.bb b/meta-openstack/recipes-support/salt/salt_2016.11.0.bb
similarity index 98%
rename from meta-openstack/recipes-support/salt/salt_2016.3.0.bb
rename to meta-openstack/recipes-support/salt/salt_2016.11.0.bb
index 7024f42..ba1def7 100644
--- a/meta-openstack/recipes-support/salt/salt_2016.3.0.bb
+++ b/meta-openstack/recipes-support/salt/salt_2016.11.0.bb
@@ -28,8 +28,8 @@ SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME
            file://roster \
 "
 
-SRC_URI[md5sum] = "8ed82cfb3f9b1764a035edbdacf0fea9"
-SRC_URI[sha256sum] = "e316dd103b7faeaa97820197e4d0d7d358519f0ca2a6dcb1d9b718eea801ed30"
+SRC_URI[md5sum] = "eced07a652cc6a31870fc098d5325a9c"
+SRC_URI[sha256sum] = "b516285926ee95cedc64ecddab05d14422b7c8819c9f6d046a431c41d608e6bc"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4


