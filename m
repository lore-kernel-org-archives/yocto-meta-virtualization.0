Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 74467E00A4F; Sun, 18 Dec 2016 19:42:01 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.220.178 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6916E0043F
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Dec 2016 19:41:56 -0800 (PST)
Received: by mail-qk0-f178.google.com with SMTP id n21so14535074qka.3
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Dec 2016 19:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DQhDnEOXtJ7hVIyoA7hgEtNnrLi+5eNg3ZTwVVzuaSA=;
	b=s4r4w2REYFhtT0AP57pCrjek8TZlMOl2E7RM+2ivIjR4KPvR2H745ZhRbLJ9I2yxEe
	hXBU7WVUcBUh/6Xs4ORw3iv9cxuBsVVZarQU4HgnpJ1nRbu6iUqF91FM383ge5MF5eyq
	UxvUiCxgg4ua4Z7PS0OXm6LOJeWEBQ9ftAecc6NFZLGzoyuZPz+gX1Zkl9mrD0XEV1cP
	ph3hleez28mSIVVieGXaxQ0+WErwHyYbo94qLixwX0kiZ0kz3cOxbgLzHjxZKM5pXcvp
	SE6HMbjZ+0qD6HJsXq7wISdU+kIgj6ndulIZtSMRr+o+3tzmsLojM8EJJB9kuCalR0Fs
	TspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DQhDnEOXtJ7hVIyoA7hgEtNnrLi+5eNg3ZTwVVzuaSA=;
	b=WG1JJ21fwlTGUfMEpxNGSD6VptJs7VW6qOiu3BCiAba3U9FLsrwifuxBqc66CsSZFZ
	rTGyNi3PBG8GwsQLTWzuUji48gRzrmhLHXo88aFJDRMadbjoLvnTtXdEJp8Yw9N3or5Q
	fEAxLDrzbx5C28RQNQDZTFvvVlL5qE4i5MOITLY+L5i+gdXRPr2SlDgegOG/faW1gkhY
	xqpFQ8ytB8hHmElvwKgTF3Myx9rCZTEZ/YW+TjC/M09Nyz7VCY5NQdhxqkaSiIS4dsAB
	hYVrk6vBZJ0MbpblwEaSse89iz1ItpWDzM3bMcwEaB80RQ2vWhQvZb3AbuIjxazTrjhe
	e2Iw==
X-Gm-Message-State: AIkVDXJvlG/k33VQQqw3uBc28rEe5wo566RI96GyxyG5sVWrqJ9kZh6I6Tf/xruXVPW1KI2mVrV5zsjIemLEHA==
X-Received: by 10.55.77.134 with SMTP id a128mr661767qkb.157.1482118915264;
	Sun, 18 Dec 2016 19:41:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.129.227 with HTTP; Sun, 18 Dec 2016 19:41:54 -0800 (PST)
In-Reply-To: <1481747894-12911-1-git-send-email-alejandro.delcastillo@ni.com>
References: <1481747894-12911-1-git-send-email-alejandro.delcastillo@ni.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 18 Dec 2016 22:41:54 -0500
Message-ID: <CADkTA4MMXksWszwwrRc1pfkqDpwk1XKKssPnDCNJ0FAQhcc5pQ@mail.gmail.com>
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] salt: upgrade to 2016.11
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
X-List-Received-Date: Mon, 19 Dec 2016 03:42:01 -0000
Content-Type: multipart/alternative; boundary=001a114884b27598790543fab399

--001a114884b27598790543fab399
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Wed, Dec 14, 2016 at 3:38 PM, Alejandro del Castillo <
alejandro.delcastillo@ni.com> wrote:

> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> ---
>  meta-openstack/recipes-support/salt/files/cloud    |   6 +-
>  meta-openstack/recipes-support/salt/files/master   | 276
> ++++++++++++++++++---
>  meta-openstack/recipes-support/salt/files/minion   | 156 ++++++++++--
>  .../salt/files/salt-common.logrotate               |  21 +-
>  .../salt/{salt_2016.3.0.bb => salt_2016.11.0.bb}   |   4 +-
>  5 files changed, 403 insertions(+), 60 deletions(-)
>  rename meta-openstack/recipes-support/salt/{salt_2016.3.0.bb =>
> salt_2016.11.0.bb} (98%)
>
> diff --git a/meta-openstack/recipes-support/salt/files/cloud
> b/meta-openstack/recipes-support/salt/files/cloud
> index 5bd28df..921cc04 100644
> --- a/meta-openstack/recipes-support/salt/files/cloud
> +++ b/meta-openstack/recipes-support/salt/files/cloud
> @@ -1,4 +1,4 @@
> -# This file should normally be installed at: /etc/salt/cloud
> +# This file should normally be installed at: /etc/salt/cloud
>
>
>  ##########################################
> @@ -44,7 +44,7 @@
>  #log_level_logfile: info
>
>
> -# The date and time format used in log messages. Allowed date/time
> formating
> +# The date and time format used in log messages. Allowed date/time
> formatting
>  # can be seen here:
>  #
>  #      http://docs.python.org/library/time.html#time.strftime
> @@ -71,7 +71,7 @@
>  #log_fmt_console: '%(colorlevel)s %(colormsg)s'
>  #log_fmt_console: '[%(levelname)-8s] %(message)s'
>  #
> -#log_fmt_logfile: '%(asctime)s,%(msecs)03.0f
> [%(name)-17s][%(levelname)-8s] %(message)s'
> +#log_fmt_logfile: '%(asctime)s,%(msecs)03d [%(name)-17s][%(levelname)-8s]
> %(message)s'
>
>
>  # Logger levels can be used to tweak specific loggers logging levels.
> diff --git a/meta-openstack/recipes-support/salt/files/master
> b/meta-openstack/recipes-support/salt/files/master
> index 821f5fc..4ecb160 100644
> --- a/meta-openstack/recipes-support/salt/files/master
> +++ b/meta-openstack/recipes-support/salt/files/master
> @@ -39,12 +39,22 @@
>  # key_logfile, pidfile:
>  #root_dir: /
>
> +# The path to the master's configuration file.
> +#conf_file: /etc/salt/master
> +
>  # Directory used to store public key data:
>  #pki_dir: /etc/salt/pki/master
>
> +# Key cache. Increases master speed for large numbers of accepted
> +# keys. Available options: 'sched'. (Updates on a fixed schedule.)
> +# Note that enabling this feature means that minions will not be
> +# available to target for up to the length of the maintanence loop
> +# which by default is 60s.
> +#key_cache: ''
> +
>  # Directory to store job and cache data:
>  # This directory may contain sensitive data and should be protected
> accordingly.
> -#
> +#
>  #cachedir: /var/cache/salt/master
>
>  # Directory for custom modules. This directory can contain subdirectories
> for
> @@ -54,7 +64,7 @@
>
>  # Directory for custom modules. This directory can contain subdirectories
> for
>  # each of Salt's module types such as "runners", "output", "wheel",
> "modules",
> -# "states", "returners", etc.
> +# "states", "returners", "engines", etc.
>  # Like 'extension_modules' but can take an array of paths
>  #module_dirs: <no default>
>  #   - /var/cache/salt/minion/extmods
> @@ -65,6 +75,10 @@
>  # Set the number of hours to keep old job information in the job cache:
>  #keep_jobs: 24
>
> +# The number of seconds to wait when the client is requesting information
> +# about running jobs.
> +#gather_job_timeout: 10
> +
>  # Set the default timeout for the salt command and api. The default is 5
>  # seconds.
>  #timeout: 5
> @@ -77,6 +91,11 @@
>  # Set the default outputter used by the salt command. The default is
> "nested".
>  #output: nested
>
> +# Set the default output file used by the salt command. Default is to
> output
> +# to the CLI and not to a file. Functions the same way as the "--out-file"
> +# CLI option, only sets this to a single file for all salt commands.
> +#output_file: None
> +
>  # Return minions that timeout when running commands like test.ping
>  #show_timeout: True
>
> @@ -88,6 +107,12 @@
>  # (true by default).
>  # strip_colors: False
>
> +# To display a summary of the number of minions targeted, the number of
> +# minions returned, and the number of minions that did not return, set the
> +# cli_summary value to True. (False by default.)
> +#
> +#cli_summary: False
> +
>  # Set the directory used to hold unix sockets:
>  #sock_dir: /var/run/salt/master
>
> @@ -106,7 +131,7 @@
>  #minion_data_cache: True
>
>  # Store all returns in the given returner.
> -# Setting this option requires that any returner-specific configuration
> also
> +# Setting this option requires that any returner-specific configuration
> also
>  # be set. See various returners in salt/returners for details on required
>  # configuration values. (See also, event_return_queue below.)
>  #
> @@ -118,15 +143,15 @@
>  # By default, events are not queued.
>  #event_return_queue: 0
>
> -# Only events returns matching tags in a whitelist
> -# event_return_whitelist:
> -#   - salt/master/a_tag
> -#   - salt/master/another_tag
> +# Only return events matching tags in a whitelist, supports glob matches.
> +#event_return_whitelist:
> +#  - salt/master/a_tag
> +#  - salt/run/*/ret
>
> -# Store all event returns _except_ the tags in a blacklist
> -# event_return_blacklist:
> -#   - salt/master/not_this_tag
> -#   - salt/master/or_this_one
> +# Store all event returns **except** the tags in a blacklist, supports
> globs.
> +#event_return_blacklist:
> +#  - salt/master/not_this_tag
> +#  - salt/wheel/*/ret
>
>  # Passing very large events can cause the minion to consume large amounts
> of
>  # memory. This value tunes the maximum size of a message allowed onto the
> @@ -145,12 +170,12 @@
>  # the key rotation event as minions reconnect. Consider this carefully if
> this
>  # salt master is managing a large number of minions.
>  #
> -# If disabled, it is recommended to handle this event by listening for the
> +# If disabled, it is recommended to handle this event by listening for the
>  # 'aes_key_rotate' event with the 'key' tag and acting appropriately.
>  # ping_on_rotate: False
>
>  # By default, the master deletes its cache of minion data when the key
> for that
> -# minion is removed. To preserve the cache after key deletion, set
> +# minion is removed. To preserve the cache after key deletion, set
>  # 'preserve_minion_cache' to True.
>  #
>  # WARNING: This may have security implications if compromised minions
> auth with
> @@ -230,6 +255,14 @@
>  # ZMQ high-water-mark for EventPublisher pub socket
>  #event_publisher_pub_hwm: 10000
>
> +# The master may allocate memory per-event and not
> +# reclaim it.
> +# To set a high-water mark for memory allocation, use
> +# ipc_write_buffer to set a high-water mark for message
> +# buffering.
> +# Value: In bytes. Set to 'dynamic' to have Salt select
> +# a value for you. Default is disabled.
> +# ipc_write_buffer: 'dynamic'
>
>
>  #####        Security settings       #####
> @@ -244,7 +277,7 @@
>  # public keys from the minions. Note that this is insecure.
>  #auto_accept: False
>
> -# Time in minutes that a incoming public key with a matching name found in
> +# Time in minutes that an incoming public key with a matching name found
> in
>  # pki_dir/minion_autosign/keyid is automatically accepted. Expired
> autosign keys
>  # are removed when the master checks the minion_autosign directory.
>  # 0 equals no timeout
> @@ -272,7 +305,7 @@
>  # This setting should be treated with care since it opens up execution
>  # capabilities to non root users. By default this capability is completely
>  # disabled.
> -#pulisher_acl:
> +#publisher_acl:
>  #  larry:
>  #    - test.ping
>  #    - network.*
> @@ -283,6 +316,11 @@
>  # running any commands. It would also blacklist any use of the "cmd"
>  # module. This is completely disabled by default.
>  #
> +#
> +# Check the list of configured users in client ACL against users on the
> +# system and throw errors if they do not exist.
> +#client_acl_verify: True
> +#
>  #publisher_acl_blacklist:
>  #  users:
>  #    - root
> @@ -295,7 +333,7 @@
>  # publisher_acl_blacklist instead.
>
>  # Enforce publisher_acl & publisher_acl_blacklist when users have sudo
> -# access to the salt command.
> +# access to the salt command.
>  #
>  #sudo_acl: False
>
> @@ -308,6 +346,18 @@
>  #
>  # Time (in seconds) for a newly generated token to live. Default: 12 hours
>  #token_expire: 43200
> +#
> +# Allow eauth users to specify the expiry time of the tokens they
> generate.
> +# A boolean applies to all users or a dictionary of whitelisted eauth
> backends
> +# and usernames may be given.
> +# token_expire_user_override:
> +#   pam:
> +#     - fred
> +#     - tom
> +#   ldap:
> +#     - gary
> +#
> +#token_expire_user_override: False
>
>  # Allow minions to push files to the master. This is disabled by default,
> for
>  # security purposes.
> @@ -344,6 +394,10 @@
>  #ssh_minion_opts:
>  #  gpg_keydir: /root/gpg
>
> +# Set this to True to default to using ~/.ssh/id_rsa for salt-ssh
> +# authentication with minions
> +#ssh_use_home_key: False
> +
>  #####    Master Module Management    #####
>  ##########################################
>  # Manage how master side modules are loaded.
> @@ -455,7 +509,7 @@
>  # When using multiple environments, each with their own top file, the
>  # default behaviour is an unordered merge. To prevent top files from
>  # being merged together and instead to only use the top file from the
> -# requested environment, set this value to 'same'.
> +# requested environment, set this value to 'same'.
>  #top_file_merging_strategy: merge
>
>  # To specify the order in which environments are merged, set the ordering
> @@ -469,12 +523,15 @@
>  #default_top: base
>
>  # The hash_type is the hash to use when discovering the hash of a file on
> -# the master server. The default is md5, but sha1, sha224, sha256, sha384
> +# the master server. The default is md5 but sha1, sha224, sha256, sha384
>  # and sha512 are also supported.
>  #
> -# Prior to changing this value, the master should be stopped and all Salt
> +# WARNING: While md5 is also supported, do not use it due to the high
> chance
> +# of possible collisions and thus security breach.
> +#
> +# Prior to changing this value, the master should be stopped and all Salt
>  # caches should be cleared.
> -#hash_type: md5
> +#hash_type: sha256
>
>  # The buffer size in the file server can be adjusted here:
>  #file_buffer_size: 1048576
> @@ -540,10 +597,37 @@
>
>  # Git File Server Backend Configuration
>  #
> -# Gitfs can be provided by one of two python modules: GitPython or
> pygit2. If
> -# using pygit2, both libgit2 and git must also be installed.
> -#gitfs_provider: gitpython
> -#
> +# Optional parameter used to specify the provider to be used for gitfs.
> Must
> +# be one of the following: pygit2, gitpython, or dulwich. If unset, then
> each
> +# will be tried in that same order, and the first one with a compatible
> +# version installed will be the provider that is used.
> +#gitfs_provider: pygit2
> +
> +# Along with gitfs_password, is used to authenticate to HTTPS remotes.
> +# gitfs_user: ''
> +
> +# Along with gitfs_user, is used to authenticate to HTTPS remotes.
> +# This parameter is not required if the repository does not use
> authentication.
> +#gitfs_password: ''
> +
> +# By default, Salt will not authenticate to an HTTP (non-HTTPS) remote.
> +# This parameter enables authentication over HTTP. Enable this at your
> own risk.
> +#gitfs_insecure_auth: False
> +
> +# Along with gitfs_privkey (and optionally gitfs_passphrase), is used to
> +# authenticate to SSH remotes. This parameter (or its per-remote
> counterpart)
> +# is required for SSH remotes.
> +#gitfs_pubkey: ''
> +
> +# Along with gitfs_pubkey (and optionally gitfs_passphrase), is used to
> +# authenticate to SSH remotes. This parameter (or its per-remote
> counterpart)
> +# is required for SSH remotes.
> +#gitfs_privkey: ''
> +
> +# This parameter is optional, required only when the SSH key being used to
> +# authenticate is protected by a passphrase.
> +#gitfs_passphrase: ''
> +
>  # When using the git fileserver backend at least one git remote needs to
> be
>  # defined. The user running the salt master will need read access to the
> repo.
>  #
> @@ -551,7 +635,7 @@
>  # and the first repo to have the file will return it.
>  # When using the git backend branches and tags are translated into salt
>  # environments.
> -# Note:  file:// repos will be treated as a remote, so refs you want used
> must
> +# Note: file:// repos will be treated as a remote, so refs you want used
> must
>  # exist in that repo as *local* refs.
>  #gitfs_remotes:
>  #  - git://github.com/saltstack/salt-states.git
> @@ -610,10 +694,10 @@
>  #pillar_safe_render_error: True
>
>  # The pillar_source_merging_strategy option allows you to configure
> merging strategy
> -# between different sources. It accepts four values: recurse, aggregate,
> overwrite,
> -# or smart. Recurse will merge recursively mapping of data. Aggregate
> instructs
> -# aggregation of elements between sources that use the #!yamlex renderer.
> Overwrite
> -# will verwrite elements according the order in which they are processed.
> This is
> +# between different sources. It accepts five values: none, recurse,
> aggregate, overwrite,
> +# or smart. None will not do any merging at all. Recurse will merge
> recursively mapping of data.
> +# Aggregate instructs aggregation of elements between sources that use
> the #!yamlex renderer. Overwrite
> +# will overwrite elements according the order in which they are
> processed. This is
>  # behavior of the 2014.1 branch and earlier. Smart guesses the best
> strategy based
>  # on the "renderer" setting and is the default value.
>  #pillar_source_merging_strategy: smart
> @@ -621,6 +705,107 @@
>  # Recursively merge lists by aggregating them instead of replacing them.
>  #pillar_merge_lists: False
>
> +# Set this option to 'True' to force a 'KeyError' to be raised whenever an
> +# attempt to retrieve a named value from pillar fails. When this option
> is set
> +# to 'False', the failed attempt returns an empty string. Default is
> 'False'.
> +#pillar_raise_on_missing: False
> +
> +# Git External Pillar (git_pillar) Configuration Options
> +#
> +# Specify the provider to be used for git_pillar. Must be either pygit2 or
> +# gitpython. If unset, then both will be tried in that same order, and the
> +# first one with a compatible version installed will be the provider that
> +# is used.
> +#git_pillar_provider: pygit2
> +
> +# If the desired branch matches this value, and the environment is omitted
> +# from the git_pillar configuration, then the environment for that
> git_pillar
> +# remote will be base.
> +#git_pillar_base: master
> +
> +# If the branch is omitted from a git_pillar remote, then this branch will
> +# be used instead
> +#git_pillar_branch: master
> +
> +# Environment to use for git_pillar remotes. This is normally derived from
> +# the branch/tag (or from a per-remote env parameter), but if set this
> will
> +# override the process of deriving the env from the branch/tag name.
> +#git_pillar_env: ''
> +
> +# Path relative to the root of the repository where the git_pillar top
> file
> +# and SLS files are located.
> +#git_pillar_root: ''
> +
> +# Specifies whether or not to ignore SSL certificate errors when
> contacting
> +# the remote repository.
> +#git_pillar_ssl_verify: False
> +
> +# When set to False, if there is an update/checkout lock for a git_pillar
> +# remote and the pid written to it is not running on the master, the lock
> +# file will be automatically cleared and a new lock will be obtained.
> +#git_pillar_global_lock: True
> +
> +# Git External Pillar Authentication Options
> +#
> +# Along with git_pillar_password, is used to authenticate to HTTPS
> remotes.
> +#git_pillar_user: ''
> +
> +# Along with git_pillar_user, is used to authenticate to HTTPS remotes.
> +# This parameter is not required if the repository does not use
> authentication.
> +#git_pillar_password: ''
> +
> +# By default, Salt will not authenticate to an HTTP (non-HTTPS) remote.
> +# This parameter enables authentication over HTTP.
> +#git_pillar_insecure_auth: False
> +
> +# Along with git_pillar_privkey (and optionally git_pillar_passphrase),
> +# is used to authenticate to SSH remotes.
> +#git_pillar_pubkey: ''
> +
> +# Along with git_pillar_pubkey (and optionally git_pillar_passphrase),
> +# is used to authenticate to SSH remotes.
> +#git_pillar_privkey: ''
> +
> +# This parameter is optional, required only when the SSH key being used
> +# to authenticate is protected by a passphrase.
> +#git_pillar_passphrase: ''
> +
> +# A master can cache pillars locally to bypass the expense of having to
> render them
> +# for each minion on every request. This feature should only be enabled
> in cases
> +# where pillar rendering time is known to be unsatisfactory and any
> attendant security
> +# concerns about storing pillars in a master cache have been addressed.
> +#
> +# When enabling this feature, be certain to read through the additional
> ``pillar_cache_*``
> +# configuration options to fully understand the tunable parameters and
> their implications.
> +#
> +# Note: setting ``pillar_cache: True`` has no effect on targeting Minions
> with Pillars.
> +# See https://docs.saltstack.com/en/latest/topics/targeting/pillar.html
> +#pillar_cache: False
> +
> +# If and only if a master has set ``pillar_cache: True``, the cache TTL
> controls the amount
> +# of time, in seconds, before the cache is considered invalid by a master
> and a fresh
> +# pillar is recompiled and stored.
> +#pillar_cache_ttl: 3600
> +
> +# If and only if a master has set `pillar_cache: True`, one of several
> storage providers
> +# can be utililzed.
> +#
> +# `disk`: The default storage backend. This caches rendered pillars to
> the master cache.
> +#         Rendered pillars are serialized and deserialized as msgpack
> structures for speed.
> +#         Note that pillars are stored UNENCRYPTED. Ensure that the
> master cache
> +#         has permissions set appropriately. (Same defaults are provided.)
> +#
> +# memory: [EXPERIMENTAL] An optional backend for pillar caches which uses
> a pure-Python
> +#         in-memory data structure for maximal performance. There are
> several caveats,
> +#         however. First, because each master worker contains its own
> in-memory cache,
> +#         there is no guarantee of cache consistency between minion
> requests. This
> +#         works best in situations where the pillar rarely if ever
> changes. Secondly,
> +#         and perhaps more importantly, this means that unencrypted
> pillars will
> +#         be accessible to any process which can examine the memory of
> the ``salt-master``!
> +#         This may represent a substantial security risk.
> +#
> +#pillar_cache_backend: disk
> +
>
>  #####          Syndic settings       #####
>  ##########################################
> @@ -649,6 +834,12 @@
>  # LOG file of the syndic daemon:
>  #syndic_log_file: syndic.log
>
> +# The behaviour of the multi-syndic when connection to a master of
> masters failed.
> +# Can specify ``random`` (default) or ``ordered``. If set to ``random``,
> masters
> +# will be iterated in random order. If ``ordered`` is specified, the
> configured
> +# order will be used.
> +#syndic_failover: random
> +
>
>  #####      Peer Publish settings     #####
>  ##########################################
> @@ -738,7 +929,7 @@
>  # If using 'log_granular_levels' this must be set to the highest desired
> level.
>  #log_level_logfile: warning
>
> -# The date and time format used in log messages. Allowed date/time
> formating
> +# The date and time format used in log messages. Allowed date/time
> formatting
>  # can be seen here: http://docs.python.org/library/time.html#time.
> strftime
>  #log_datefmt: '%H:%M:%S'
>  #log_datefmt_logfile: '%Y-%m-%d %H:%M:%S'
> @@ -760,7 +951,7 @@
>  #log_fmt_console: '%(colorlevel)s %(colormsg)s'
>  #log_fmt_console: '[%(levelname)-8s] %(message)s'
>  #
> -#log_fmt_logfile: '%(asctime)s,%(msecs)03.0f
> [%(name)-17s][%(levelname)-8s] %(message)s'
> +#log_fmt_logfile: '%(asctime)s,%(msecs)03d [%(name)-17s][%(levelname)-8s]
> %(message)s'
>
>  # This can be used to control logging levels more specificically.  This
>  # example sets the main salt library at the 'warning' level, but sets
> @@ -774,11 +965,18 @@
>
>  #####         Node Groups           ######
>  ##########################################
> -# Node groups allow for logical groupings of minion nodes. A group
> consists of a group
> -# name and a compound target.
> +# Node groups allow for logical groupings of minion nodes. A group
> consists of
> +# a group name and a compound target. Nodgroups can reference other
> nodegroups
> +# with 'N@' classifier. Ensure that you do not have circular references.
> +#
>  #nodegroups:
> -#  group1: 'L@foo.domain.com,bar.domain.com,baz.domain.com and bl*.
> domain.com'
> +#  group1: 'L@foo.domain.com,bar.domain.com,baz.domain.com or bl*.
> domain.com'
>  #  group2: 'G@os:Debian and foo.domain.com'
> +#  group3: 'G@os:Debian and N@group1'
> +#  group4:
> +#    - 'G@foo:bar'
> +#    - 'or'
> +#    - 'G@foo:baz'
>
>
>  #####     Range Cluster settings     #####
> @@ -824,3 +1022,13 @@
>  ############################################
>  # Default match type for filtering events tags: startswith, endswith,
> find, regex, fnmatch
>  #event_match_type: startswith
> +
> +# Save runner returns to the job cache
> +#runner_returns: True
> +
> +# Permanently include any available Python 3rd party modules into Salt
> Thin
> +# when they are generated for Salt-SSH or other purposes.
> +# The modules should be named by the names they are actually imported
> inside the Python.
> +# The value of the parameters can be either one module or a comma
> separated list of them.
> +#thin_extra_mods: foo,bar
> +
> diff --git a/meta-openstack/recipes-support/salt/files/minion
> b/meta-openstack/recipes-support/salt/files/minion
> index bd97c43..ad7a374 100644
> --- a/meta-openstack/recipes-support/salt/files/minion
> +++ b/meta-openstack/recipes-support/salt/files/minion
> @@ -38,6 +38,8 @@
>  # value to "str".  Failover masters can be requested by setting
>  # to "failover".  MAKE SURE TO SET master_alive_interval if you are
>  # using failover.
> +# Setting master_type to 'disable' let's you have a running minion (with
> engines and
> +# beacons) without a master connection
>  # master_type: str
>
>  # Poll interval in seconds for checking if the master is still there.
> Only
> @@ -46,6 +48,16 @@
>  # of TCP connections, such as load balancers.)
>  # master_alive_interval: 30
>
> +# If the minion is in multi-master mode and the master_type configuration
> option
> +# is set to "failover", this setting can be set to "True" to force the
> minion
> +# to fail back to the first master in the list if the first master is
> back online.
> +#master_failback: False
> +
> +# If the minion is in multi-master mode, the "master_type" configuration
> is set to
> +# "failover", and the "master_failback" option is enabled, the master
> failback
> +# interval can be set to ping the top master with this interval, in
> seconds.
> +#master_failback_interval: 0
> +
>  # Set whether the minion should connect to the master via IPv6:
>  #ipv6: False
>
> @@ -60,11 +72,15 @@
>  # The user to run salt.
>  #user: root
>
> -# Setting sudo_user will cause salt to run all execution modules under an
> sudo
> -# to the user given in sudo_user.  The user under which the salt minion
> process
> -# itself runs will still be that provided in the user config above, but
> all
> -# execution modules run by the minion will be rerouted through sudo.
> -#sudo_user: saltdev
> +# The user to run salt remote execution commands as via sudo. If this
> option is
> +# enabled then sudo will be used to change the active user executing the
> remote
> +# command. If enabled the user will need to be allowed access via the
> sudoers
> +# file for the user that the salt minion is configured to run as. The most
> +# common option would be to use the root user. If this option is set the
> user
> +# option should also be set to a non-root user. If migrating from a root
> minion
> +# to a non root minion the minion cache should be cleared and the minion
> pki
> +# directory will need to be changed to the ownership of the new user.
> +#sudo_user: root
>
>  # Specify the location of the daemon process ID file.
>  #pidfile: /var/run/salt-minion.pid
> @@ -73,6 +89,9 @@
>  # sock_dir, pidfile.
>  #root_dir: /
>
> +# The path to the minion's configuration file.
> +#conf_file: /etc/salt/minion
> +
>  # The directory to store the pki information in
>  #pki_dir: /etc/salt/pki/minion
>
> @@ -83,6 +102,13 @@
>  # clusters.
>  #id:
>
> +# Cache the minion id to a file when the minion's id is not statically
> defined
> +# in the minion config. Defaults to "True". This setting prevents
> potential
> +# problems when automatic minion id resolution changes, which can cause
> the
> +# minion to lose connection with the master. To turn off minion id
> caching,
> +# set this config to ``False``.
> +#minion_id_caching: True
> +
>  # Append a domain to a hostname in the event that it does not exist.
> This is
>  # useful for systems where socket.getfqdn() does not actually result in a
>  # FQDN (for instance, Solaris).
> @@ -103,6 +129,13 @@
>  # This data may contain sensitive data and should be protected
> accordingly.
>  #cachedir: /var/cache/salt/minion
>
> +# Append minion_id to these directories.  Helps with
> +# multiple proxies and minions running on the same machine.
> +# Allowed elements in the list: pki_dir, cachedir, extension_modules
> +# Normally not needed unless running several proxies and/or minions on
> the same machine
> +# Defaults to ['cachedir'] for proxies, [] (empty list) for regular
> minions
> +#append_minionid_config_dirs:
> +
>  # Verify and set permissions on configuration directories at startup.
>  #verify_env: True
>
> @@ -171,6 +204,20 @@
>  # authenticate.
>  #auth_tries: 7
>
> +# The number of attempts to connect to a master before giving up.
> +# Set this to -1 for unlimited attempts. This allows for a master to have
> +# downtime and the minion to reconnect to it later when it comes back up.
> +# In 'failover' mode, it is the number of attempts for each set of
> masters.
> +# In this mode, it will cycle through the list of masters for each
> attempt.
> +#
> +# This is different than auth_tries because auth_tries attempts to
> +# retry auth attempts with a single master. auth_tries is under the
> +# assumption that you can connect to the master but not gain
> +# authorization from it. master_tries will still cycle through all
> +# the masters in a given try, so it is appropriate if you expect
> +# occasional downtime from the master(s).
> +#master_tries: 1
> +
>  # If authentication fails due to SaltReqTimeoutError during a
> ping_interval,
>  # cause sub minion process to restart.
>  #auth_safemode: False
> @@ -249,10 +296,17 @@
>  #
>  #
>  # The loop_interval sets how long in seconds the minion will wait between
> -# evaluating the scheduler and running cleanup tasks. This defaults to a
> -# sane 60 seconds, but if the minion scheduler needs to be evaluated more
> -# often lower this value
> -#loop_interval: 60
> +# evaluating the scheduler and running cleanup tasks.  This defaults to 1
> +# second on the minion scheduler.
> +#loop_interval: 1
> +
> +# Some installations choose to start all job returns in a cache or a
> returner
> +# and forgo sending the results back to a master. In this workflow, jobs
> +# are most often executed with --async from the Salt CLI and then results
> +# are evaluated by examining job caches on the minions or any configured
> returners.
> +# WARNING: Setting this to False will **disable** returns back to the
> master.
> +#pub_ret: True
> +
>
>  # The grains can be merged, instead of overridden, using this option.
>  # This allows custom grains to defined different subvalues of a dictionary
> @@ -286,6 +340,26 @@
>  # is not enabled.
>  # grains_cache_expiration: 300
>
> +# Determines whether or not the salt minion should run scheduled mine
> updates.
> +# Defaults to "True". Set to "False" to disable the scheduled mine updates
> +# (this essentially just does not add the mine update function to the
> minion's
> +# scheduler).
> +#mine_enabled: True
> +
> +# Determines whether or not scheduled mine updates should be accompanied
> by a job
> +# return for the job cache. Defaults to "False". Set to "True" to include
> job
> +# returns in the job cache for mine updates.
> +#mine_return_job: False
> +
> +# Example functions that can be run via the mine facility
> +# NO mine functions are established by default.
> +# Note these can be defined in the minion's pillar as well.
> +#mine_functions:
> +#  test.ping: []
> +#  network.ip_addrs:
> +#    interface: eth0
> +#    cidr: '10.0.0.0/8'
> +
>  # Windows platforms lack posix IPC and must rely on slower TCP based
> inter-
>  # process communications. Set ipc_mode to 'tcp' on such systems
>  #ipc_mode: ipc
> @@ -319,16 +393,33 @@
>  #include:
>  #  - /etc/salt/extra_config
>  #  - /etc/roles/webserver
> +
> +# The syndic minion can verify that it is talking to the correct master
> via the
> +# key fingerprint of the higher-level master with the "syndic_finger"
> config.
> +#syndic_finger: ''
>  #
>  #
>  #
>  #####   Minion module management     #####
>  ##########################################
>  # Disable specific modules. This allows the admin to limit the level of
> -# access the master has to the minion.
> -#disable_modules: [cmd,test]
> +# access the master has to the minion.  The default here is the empty
> list,
> +# below is an example of how this needs to be formatted in the config file
> +#disable_modules:
> +#  - cmdmod
> +#  - test
>  #disable_returners: []
> -#
> +
> +# This is the reverse of disable_modules.  The default, like
> disable_modules, is the empty list,
> +# but if this option is set to *anything* then *only* those modules will
> load.
> +# Note that this is a very large hammer and it can be quite difficult to
> keep the minion working
> +# the way you think it should since Salt uses many modules internally
> itself.  At a bare minimum
> +# you need the following enabled or else the minion won't start.
> +#whitelist_modules:
> +#  - cmdmod
> +#  - test
> +#  - config
> +
>  # Modules can be loaded from arbitrary paths. This enables the easy
> deployment
>  # of third party modules. Modules for returners and minions can be loaded.
>  # Specify a list of extra directories to search for minion modules and
> @@ -389,6 +480,15 @@
>  # environments is to isolate via the top file.
>  #environment: None
>  #
> +# Isolates the pillar environment on the minion side. This functions the
> same
> +# as the environment setting, but for pillar instead of states.
> +#pillarenv: None
> +#
> +# Set this option to 'True' to force a 'KeyError' to be raised whenever an
> +# attempt to retrieve a named value from pillar fails. When this option
> is set
> +# to 'False', the failed attempt returns an empty string. Default is
> 'False'.
> +#pillar_raise_on_missing: False
> +#
>  # If using the local file directory, then the state top file name needs
> to be
>  # defined, by default this is top.sls.
>  #state_top: top.sls
> @@ -448,6 +548,18 @@
>  #  base:
>  #    - /srv/salt
>
> +# Uncomment the line below if you do not want the file_server to follow
> +# symlinks when walking the filesystem tree. This is set to True
> +# by default. Currently this only applies to the default roots
> +# fileserver_backend.
> +#fileserver_followsymlinks: False
> +#
> +# Uncomment the line below if you do not want symlinks to be
> +# treated as the files they are pointing to. By default this is set to
> +# False. By uncommenting the line below, any detected symlink while
> listing
> +# files on the Master will not be returned to the Minion.
> +#fileserver_ignoresymlinks: True
> +#
>  # By default, the Salt fileserver recurses fully into all defined
> environments
>  # to attempt to find files. To limit this behavior so that the fileserver
> only
>  # traverses directories with SLS files and special Salt directories like
> _modules,
> @@ -456,13 +568,19 @@
>  # is False.
>  #fileserver_limit_traversal: False
>
> -# The hash_type is the hash to use when discovering the hash of a file in
> +# The hash_type is the hash to use when discovering the hash of a file on
>  # the local fileserver. The default is md5, but sha1, sha224, sha256,
> sha384
>  # and sha512 are also supported.
>  #
> +# WARNING: While md5 and sha1 are also supported, do not use it due to
> the high chance
> +# of possible collisions and thus security breach.
> +#
> +# WARNING: While md5 is also supported, do not use it due to the high
> chance
> +# of possible collisions and thus security breach.
> +#
>  # Warning: Prior to changing this value, the minion should be stopped and
> all
>  # Salt caches should be cleared.
> -#hash_type: md5
> +#hash_type: sha256
>
>  # The Salt pillar is searched for locally if file_client is set to local.
> If
>  # this is the case, and pillar data is defined, then the pillar_roots
> need to
> @@ -470,6 +588,10 @@
>  #pillar_roots:
>  #  base:
>  #    - /srv/pillar
> +
> +# Set a hard-limit on the size of the files that can be pushed to the
> master.
> +# It will be interpreted as megabytes. Default: 100
> +#file_recv_max_size: 100
>  #
>  #
>  ######        Security settings       #####
> @@ -508,7 +630,7 @@
>
>  # Fingerprint of the master public key to validate the identity of your
> Salt master
>  # before the initial key exchange. The master fingerprint can be found by
> running
> -# "salt-key -F master" on the Salt master.
> +# "salt-key -f master.pub" on the Salt master.
>  #master_finger: ''
>
>
> @@ -548,7 +670,7 @@
>  # Default: 'warning'
>  #log_level_logfile:
>
> -# The date and time format used in log messages. Allowed date/time
> formating
> +# The date and time format used in log messages. Allowed date/time
> formatting
>  # can be seen here: http://docs.python.org/library/time.html#time.
> strftime
>  #log_datefmt: '%H:%M:%S'
>  #log_datefmt_logfile: '%Y-%m-%d %H:%M:%S'
> @@ -570,7 +692,7 @@
>  #log_fmt_console: '%(colorlevel)s %(colormsg)s'
>  #log_fmt_console: '[%(levelname)-8s] %(message)s'
>  #
> -#log_fmt_logfile: '%(asctime)s,%(msecs)03.0f
> [%(name)-17s][%(levelname)-8s] %(message)s'
> +#log_fmt_logfile: '%(asctime)s,%(msecs)03d [%(name)-17s][%(levelname)-8s]
> %(message)s'
>
>  # This can be used to control logging levels more specificically.  This
>  # example sets the main salt library at the 'warning' level, but sets
> diff --git a/meta-openstack/recipes-support/salt/files/salt-common.logrotate
> b/meta-openstack/recipes-support/salt/files/salt-common.logrotate
> index dcfd268..3cd0023 100644
> --- a/meta-openstack/recipes-support/salt/files/salt-common.logrotate
> +++ b/meta-openstack/recipes-support/salt/files/salt-common.logrotate
> @@ -1,7 +1,20 @@
> -/var/log/salt/master
> -/var/log/salt/minion
> -/var/log/salt/*.log
> -{
> +/var/log/salt/master {
> +       weekly
> +       missingok
> +       rotate 7
> +       compress
> +       notifempty
> +}
> +
> +/var/log/salt/minion {
> +       weekly
> +       missingok
> +       rotate 7
> +       compress
> +       notifempty
> +}
> +
> +/var/log/salt/key {
>         weekly
>         missingok
>         rotate 7
> diff --git a/meta-openstack/recipes-support/salt/salt_2016.3.0.bb
> b/meta-openstack/recipes-support/salt/salt_2016.11.0.bb
> similarity index 98%
> rename from meta-openstack/recipes-support/salt/salt_2016.3.0.bb
> rename to meta-openstack/recipes-support/salt/salt_2016.11.0.bb
> index 7024f42..ba1def7 100644
> --- a/meta-openstack/recipes-support/salt/salt_2016.3.0.bb
> +++ b/meta-openstack/recipes-support/salt/salt_2016.11.0.bb
> @@ -28,8 +28,8 @@ SRC_URI = "https://files.pythonhosted.
> org/packages/source/s/${SRCNAME}/${SRCNAME
>             file://roster \
>  "
>
> -SRC_URI[md5sum] = "8ed82cfb3f9b1764a035edbdacf0fea9"
> -SRC_URI[sha256sum] = "e316dd103b7faeaa97820197e4d0d7
> d358519f0ca2a6dcb1d9b718eea801ed30"
> +SRC_URI[md5sum] = "eced07a652cc6a31870fc098d5325a9c"
> +SRC_URI[sha256sum] = "b516285926ee95cedc64ecddab05d1
> 4422b7c8819c9f6d046a431c41d608e6bc"
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114884b27598790543fab399
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Wed, Dec 14, 2016 at 3:38 PM=
, Alejandro del Castillo <span dir=3D"ltr">&lt;<a href=3D"mailto:alejandro.=
delcastillo@ni.com" target=3D"_blank">alejandro.delcastillo@ni.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">Signed-off-by: Alejandro de=
l Castillo &lt;<a href=3D"mailto:alejandro.delcastillo@ni.com">alejandro.de=
lcastillo@ni.com</a>&gt;<br>
---<br>
=C2=A0meta-openstack/recipes-<wbr>support/salt/files/cloud=C2=A0 =C2=A0 |=
=C2=A0 =C2=A06 +-<br>
=C2=A0meta-openstack/recipes-<wbr>support/salt/files/master=C2=A0 =C2=A0| 2=
76 ++++++++++++++++++---<br>
=C2=A0meta-openstack/recipes-<wbr>support/salt/files/minion=C2=A0 =C2=A0| 1=
56 ++++++++++--<br>
=C2=A0.../salt/files/salt-common.<wbr>logrotate=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 21 +-<br>
=C2=A0.../salt/{<a href=3D"http://salt_2016.3.0.bb" rel=3D"noreferrer" targ=
et=3D"_blank">salt_2016.3.0.bb</a> =3D&gt; <a href=3D"http://salt_2016.11.0=
.bb" rel=3D"noreferrer" target=3D"_blank">salt_2016.11.0.bb</a>}=C2=A0 =C2=
=A0|=C2=A0 =C2=A04 +-<br>
=C2=A05 files changed, 403 insertions(+), 60 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-<wbr>support/salt/{<a href=3D"http://sa=
lt_2016.3.0.bb" rel=3D"noreferrer" target=3D"_blank">salt_2016.3.0.bb</a> =
=3D&gt; <a href=3D"http://salt_2016.11.0.bb" rel=3D"noreferrer" target=3D"_=
blank">salt_2016.11.0.bb</a>} (98%)<br>
<br>
diff --git a/meta-openstack/recipes-<wbr>support/salt/files/cloud b/meta-op=
enstack/recipes-<wbr>support/salt/files/cloud<br>
index 5bd28df..921cc04 100644<br>
--- a/meta-openstack/recipes-<wbr>support/salt/files/cloud<br>
+++ b/meta-openstack/recipes-<wbr>support/salt/files/cloud<br>
@@ -1,4 +1,4 @@<br>
-# This file should normally be installed at: /etc/salt/cloud<br>
+# This file should normally be installed at: /etc/salt/cloud<br>
<br>
<br>
=C2=A0##############################<wbr>############<br>
@@ -44,7 +44,7 @@<br>
=C2=A0#log_level_logfile: info<br>
<br>
<br>
-# The date and time format used in log messages. Allowed date/time formati=
ng<br>
+# The date and time format used in log messages. Allowed date/time formatt=
ing<br>
=C2=A0# can be seen here:<br>
=C2=A0#<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://docs.python.org/library/time.=
html#time.strftime" rel=3D"noreferrer" target=3D"_blank">http://docs.python=
.org/<wbr>library/time.html#time.<wbr>strftime</a><br>
@@ -71,7 +71,7 @@<br>
=C2=A0#log_fmt_console: &#39;%(colorlevel)s %(colormsg)s&#39;<br>
=C2=A0#log_fmt_console: &#39;[%(levelname)-8s] %(message)s&#39;<br>
=C2=A0#<br>
-#log_fmt_logfile: &#39;%(asctime)s,%(msecs)03.0f [%(name)-17s][%(levelname=
)-8s] %(message)s&#39;<br>
+#log_fmt_logfile: &#39;%(asctime)s,%(msecs)03d [%(name)-17s][%(levelname)-=
8s] %(message)s&#39;<br>
<br>
<br>
=C2=A0# Logger levels can be used to tweak specific loggers logging levels.=
<br>
diff --git a/meta-openstack/recipes-<wbr>support/salt/files/master b/meta-o=
penstack/recipes-<wbr>support/salt/files/master<br>
index 821f5fc..4ecb160 100644<br>
--- a/meta-openstack/recipes-<wbr>support/salt/files/master<br>
+++ b/meta-openstack/recipes-<wbr>support/salt/files/master<br>
@@ -39,12 +39,22 @@<br>
=C2=A0# key_logfile, pidfile:<br>
=C2=A0#root_dir: /<br>
<br>
+# The path to the master&#39;s configuration file.<br>
+#conf_file: /etc/salt/master<br>
+<br>
=C2=A0# Directory used to store public key data:<br>
=C2=A0#pki_dir: /etc/salt/pki/master<br>
<br>
+# Key cache. Increases master speed for large numbers of accepted<br>
+# keys. Available options: &#39;sched&#39;. (Updates on a fixed schedule.)=
<br>
+# Note that enabling this feature means that minions will not be<br>
+# available to target for up to the length of the maintanence loop<br>
+# which by default is 60s.<br>
+#key_cache: &#39;&#39;<br>
+<br>
=C2=A0# Directory to store job and cache data:<br>
=C2=A0# This directory may contain sensitive data and should be protected a=
ccordingly.<br>
-#<br>
+#<br>
=C2=A0#cachedir: /var/cache/salt/master<br>
<br>
=C2=A0# Directory for custom modules. This directory can contain subdirecto=
ries for<br>
@@ -54,7 +64,7 @@<br>
<br>
=C2=A0# Directory for custom modules. This directory can contain subdirecto=
ries for<br>
=C2=A0# each of Salt&#39;s module types such as &quot;runners&quot;, &quot;=
output&quot;, &quot;wheel&quot;, &quot;modules&quot;,<br>
-# &quot;states&quot;, &quot;returners&quot;, etc.<br>
+# &quot;states&quot;, &quot;returners&quot;, &quot;engines&quot;, etc.<br>
=C2=A0# Like &#39;extension_modules&#39; but can take an array of paths<br>
=C2=A0#module_dirs: &lt;no default&gt;<br>
=C2=A0#=C2=A0 =C2=A0- /var/cache/salt/minion/extmods<br>
@@ -65,6 +75,10 @@<br>
=C2=A0# Set the number of hours to keep old job information in the job cach=
e:<br>
=C2=A0#keep_jobs: 24<br>
<br>
+# The number of seconds to wait when the client is requesting information<=
br>
+# about running jobs.<br>
+#gather_job_timeout: 10<br>
+<br>
=C2=A0# Set the default timeout for the salt command and api. The default i=
s 5<br>
=C2=A0# seconds.<br>
=C2=A0#timeout: 5<br>
@@ -77,6 +91,11 @@<br>
=C2=A0# Set the default outputter used by the salt command. The default is =
&quot;nested&quot;.<br>
=C2=A0#output: nested<br>
<br>
+# Set the default output file used by the salt command. Default is to outp=
ut<br>
+# to the CLI and not to a file. Functions the same way as the &quot;--out-=
file&quot;<br>
+# CLI option, only sets this to a single file for all salt commands.<br>
+#output_file: None<br>
+<br>
=C2=A0# Return minions that timeout when running commands like test.ping<br=
>
=C2=A0#show_timeout: True<br>
<br>
@@ -88,6 +107,12 @@<br>
=C2=A0# (true by default).<br>
=C2=A0# strip_colors: False<br>
<br>
+# To display a summary of the number of minions targeted, the number of<br=
>
+# minions returned, and the number of minions that did not return, set the=
<br>
+# cli_summary value to True. (False by default.)<br>
+#<br>
+#cli_summary: False<br>
+<br>
=C2=A0# Set the directory used to hold unix sockets:<br>
=C2=A0#sock_dir: /var/run/salt/master<br>
<br>
@@ -106,7 +131,7 @@<br>
=C2=A0#minion_data_cache: True<br>
<br>
=C2=A0# Store all returns in the given returner.<br>
-# Setting this option requires that any returner-specific configuration al=
so<br>
+# Setting this option requires that any returner-specific configuration al=
so<br>
=C2=A0# be set. See various returners in salt/returners for details on requ=
ired<br>
=C2=A0# configuration values. (See also, event_return_queue below.)<br>
=C2=A0#<br>
@@ -118,15 +143,15 @@<br>
=C2=A0# By default, events are not queued.<br>
=C2=A0#event_return_queue: 0<br>
<br>
-# Only events returns matching tags in a whitelist<br>
-# event_return_whitelist:<br>
-#=C2=A0 =C2=A0- salt/master/a_tag<br>
-#=C2=A0 =C2=A0- salt/master/another_tag<br>
+# Only return events matching tags in a whitelist, supports glob matches.<=
br>
+#event_return_whitelist:<br>
+#=C2=A0 - salt/master/a_tag<br>
+#=C2=A0 - salt/run/*/ret<br>
<br>
-# Store all event returns _except_ the tags in a blacklist<br>
-# event_return_blacklist:<br>
-#=C2=A0 =C2=A0- salt/master/not_this_tag<br>
-#=C2=A0 =C2=A0- salt/master/or_this_one<br>
+# Store all event returns **except** the tags in a blacklist, supports glo=
bs.<br>
+#event_return_blacklist:<br>
+#=C2=A0 - salt/master/not_this_tag<br>
+#=C2=A0 - salt/wheel/*/ret<br>
<br>
=C2=A0# Passing very large events can cause the minion to consume large amo=
unts of<br>
=C2=A0# memory. This value tunes the maximum size of a message allowed onto=
 the<br>
@@ -145,12 +170,12 @@<br>
=C2=A0# the key rotation event as minions reconnect. Consider this carefull=
y if this<br>
=C2=A0# salt master is managing a large number of minions.<br>
=C2=A0#<br>
-# If disabled, it is recommended to handle this event by listening for the=
<br>
+# If disabled, it is recommended to handle this event by listening for the=
<br>
=C2=A0# &#39;aes_key_rotate&#39; event with the &#39;key&#39; tag and actin=
g appropriately.<br>
=C2=A0# ping_on_rotate: False<br>
<br>
=C2=A0# By default, the master deletes its cache of minion data when the ke=
y for that<br>
-# minion is removed. To preserve the cache after key deletion, set<br>
+# minion is removed. To preserve the cache after key deletion, set<br>
=C2=A0# &#39;preserve_minion_cache&#39; to True.<br>
=C2=A0#<br>
=C2=A0# WARNING: This may have security implications if compromised minions=
 auth with<br>
@@ -230,6 +255,14 @@<br>
=C2=A0# ZMQ high-water-mark for EventPublisher pub socket<br>
=C2=A0#event_publisher_pub_hwm: 10000<br>
<br>
+# The master may allocate memory per-event and not<br>
+# reclaim it.<br>
+# To set a high-water mark for memory allocation, use<br>
+# ipc_write_buffer to set a high-water mark for message<br>
+# buffering.<br>
+# Value: In bytes. Set to &#39;dynamic&#39; to have Salt select<br>
+# a value for you. Default is disabled.<br>
+# ipc_write_buffer: &#39;dynamic&#39;<br>
<br>
<br>
=C2=A0#####=C2=A0 =C2=A0 =C2=A0 =C2=A0 Security settings=C2=A0 =C2=A0 =C2=
=A0 =C2=A0#####<br>
@@ -244,7 +277,7 @@<br>
=C2=A0# public keys from the minions. Note that this is insecure.<br>
=C2=A0#auto_accept: False<br>
<br>
-# Time in minutes that a incoming public key with a matching name found in=
<br>
+# Time in minutes that an incoming public key with a matching name found i=
n<br>
=C2=A0# pki_dir/minion_autosign/keyid is automatically accepted. Expired au=
tosign keys<br>
=C2=A0# are removed when the master checks the minion_autosign directory.<b=
r>
=C2=A0# 0 equals no timeout<br>
@@ -272,7 +305,7 @@<br>
=C2=A0# This setting should be treated with care since it opens up executio=
n<br>
=C2=A0# capabilities to non root users. By default this capability is compl=
etely<br>
=C2=A0# disabled.<br>
-#pulisher_acl:<br>
+#publisher_acl:<br>
=C2=A0#=C2=A0 larry:<br>
=C2=A0#=C2=A0 =C2=A0 - test.ping<br>
=C2=A0#=C2=A0 =C2=A0 - network.*<br>
@@ -283,6 +316,11 @@<br>
=C2=A0# running any commands. It would also blacklist any use of the &quot;=
cmd&quot;<br>
=C2=A0# module. This is completely disabled by default.<br>
=C2=A0#<br>
+#<br>
+# Check the list of configured users in client ACL against users on the<br=
>
+# system and throw errors if they do not exist.<br>
+#client_acl_verify: True<br>
+#<br>
=C2=A0#publisher_acl_blacklist:<br>
=C2=A0#=C2=A0 users:<br>
=C2=A0#=C2=A0 =C2=A0 - root<br>
@@ -295,7 +333,7 @@<br>
=C2=A0# publisher_acl_blacklist instead.<br>
<br>
=C2=A0# Enforce publisher_acl &amp; publisher_acl_blacklist when users have=
 sudo<br>
-# access to the salt command.<br>
+# access to the salt command.<br>
=C2=A0#<br>
=C2=A0#sudo_acl: False<br>
<br>
@@ -308,6 +346,18 @@<br>
=C2=A0#<br>
=C2=A0# Time (in seconds) for a newly generated token to live. Default: 12 =
hours<br>
=C2=A0#token_expire: 43200<br>
+#<br>
+# Allow eauth users to specify the expiry time of the tokens they generate=
.<br>
+# A boolean applies to all users or a dictionary of whitelisted eauth back=
ends<br>
+# and usernames may be given.<br>
+# token_expire_user_override:<br>
+#=C2=A0 =C2=A0pam:<br>
+#=C2=A0 =C2=A0 =C2=A0- fred<br>
+#=C2=A0 =C2=A0 =C2=A0- tom<br>
+#=C2=A0 =C2=A0ldap:<br>
+#=C2=A0 =C2=A0 =C2=A0- gary<br>
+#<br>
+#token_expire_user_override: False<br>
<br>
=C2=A0# Allow minions to push files to the master. This is disabled by defa=
ult, for<br>
=C2=A0# security purposes.<br>
@@ -344,6 +394,10 @@<br>
=C2=A0#ssh_minion_opts:<br>
=C2=A0#=C2=A0 gpg_keydir: /root/gpg<br>
<br>
+# Set this to True to default to using ~/.ssh/id_rsa for salt-ssh<br>
+# authentication with minions<br>
+#ssh_use_home_key: False<br>
+<br>
=C2=A0#####=C2=A0 =C2=A0 Master Module Management=C2=A0 =C2=A0 #####<br>
=C2=A0##############################<wbr>############<br>
=C2=A0# Manage how master side modules are loaded.<br>
@@ -455,7 +509,7 @@<br>
=C2=A0# When using multiple environments, each with their own top file, the=
<br>
=C2=A0# default behaviour is an unordered merge. To prevent top files from<=
br>
=C2=A0# being merged together and instead to only use the top file from the=
<br>
-# requested environment, set this value to &#39;same&#39;.<br>
+# requested environment, set this value to &#39;same&#39;.<br>
=C2=A0#top_file_merging_strategy: merge<br>
<br>
=C2=A0# To specify the order in which environments are merged, set the orde=
ring<br>
@@ -469,12 +523,15 @@<br>
=C2=A0#default_top: base<br>
<br>
=C2=A0# The hash_type is the hash to use when discovering the hash of a fil=
e on<br>
-# the master server. The default is md5, but sha1, sha224, sha256, sha384<=
br>
+# the master server. The default is md5 but sha1, sha224, sha256, sha384<b=
r>
=C2=A0# and sha512 are also supported.<br>
=C2=A0#<br>
-# Prior to changing this value, the master should be stopped and all Salt<=
br>
+# WARNING: While md5 is also supported, do not use it due to the high chan=
ce<br>
+# of possible collisions and thus security breach.<br>
+#<br>
+# Prior to changing this value, the master should be stopped and all Salt<=
br>
=C2=A0# caches should be cleared.<br>
-#hash_type: md5<br>
+#hash_type: sha256<br>
<br>
=C2=A0# The buffer size in the file server can be adjusted here:<br>
=C2=A0#file_buffer_size: 1048576<br>
@@ -540,10 +597,37 @@<br>
<br>
=C2=A0# Git File Server Backend Configuration<br>
=C2=A0#<br>
-# Gitfs can be provided by one of two python modules: GitPython or pygit2.=
 If<br>
-# using pygit2, both libgit2 and git must also be installed.<br>
-#gitfs_provider: gitpython<br>
-#<br>
+# Optional parameter used to specify the provider to be used for gitfs. Mu=
st<br>
+# be one of the following: pygit2, gitpython, or dulwich. If unset, then e=
ach<br>
+# will be tried in that same order, and the first one with a compatible<br=
>
+# version installed will be the provider that is used.<br>
+#gitfs_provider: pygit2<br>
+<br>
+# Along with gitfs_password, is used to authenticate to HTTPS remotes.<br>
+# gitfs_user: &#39;&#39;<br>
+<br>
+# Along with gitfs_user, is used to authenticate to HTTPS remotes.<br>
+# This parameter is not required if the repository does not use authentica=
tion.<br>
+#gitfs_password: &#39;&#39;<br>
+<br>
+# By default, Salt will not authenticate to an HTTP (non-HTTPS) remote.<br=
>
+# This parameter enables authentication over HTTP. Enable this at your own=
 risk.<br>
+#gitfs_insecure_auth: False<br>
+<br>
+# Along with gitfs_privkey (and optionally gitfs_passphrase), is used to<b=
r>
+# authenticate to SSH remotes. This parameter (or its per-remote counterpa=
rt)<br>
+# is required for SSH remotes.<br>
+#gitfs_pubkey: &#39;&#39;<br>
+<br>
+# Along with gitfs_pubkey (and optionally gitfs_passphrase), is used to<br=
>
+# authenticate to SSH remotes. This parameter (or its per-remote counterpa=
rt)<br>
+# is required for SSH remotes.<br>
+#gitfs_privkey: &#39;&#39;<br>
+<br>
+# This parameter is optional, required only when the SSH key being used to=
<br>
+# authenticate is protected by a passphrase.<br>
+#gitfs_passphrase: &#39;&#39;<br>
+<br>
=C2=A0# When using the git fileserver backend at least one git remote needs=
 to be<br>
=C2=A0# defined. The user running the salt master will need read access to =
the repo.<br>
=C2=A0#<br>
@@ -551,7 +635,7 @@<br>
=C2=A0# and the first repo to have the file will return it.<br>
=C2=A0# When using the git backend branches and tags are translated into sa=
lt<br>
=C2=A0# environments.<br>
-# Note:=C2=A0 file:// repos will be treated as a remote, so refs you want =
used must<br>
+# Note: file:// repos will be treated as a remote, so refs you want used m=
ust<br>
=C2=A0# exist in that repo as *local* refs.<br>
=C2=A0#gitfs_remotes:<br>
=C2=A0#=C2=A0 - git://<a href=3D"http://github.com/saltstack/salt-states.gi=
t" rel=3D"noreferrer" target=3D"_blank">github.com/saltstack/<wbr>salt-stat=
es.git</a><br>
@@ -610,10 +694,10 @@<br>
=C2=A0#pillar_safe_render_error: True<br>
<br>
=C2=A0# The pillar_source_merging_strategy option allows you to configure m=
erging strategy<br>
-# between different sources. It accepts four values: recurse, aggregate, o=
verwrite,<br>
-# or smart. Recurse will merge recursively mapping of data. Aggregate inst=
ructs<br>
-# aggregation of elements between sources that use the #!yamlex renderer. =
Overwrite<br>
-# will verwrite elements according the order in which they are processed. =
This is<br>
+# between different sources. It accepts five values: none, recurse, aggreg=
ate, overwrite,<br>
+# or smart. None will not do any merging at all. Recurse will merge recurs=
ively mapping of data.<br>
+# Aggregate instructs aggregation of elements between sources that use the=
 #!yamlex renderer. Overwrite<br>
+# will overwrite elements according the order in which they are processed.=
 This is<br>
=C2=A0# behavior of the 2014.1 branch and earlier. Smart guesses the best s=
trategy based<br>
=C2=A0# on the &quot;renderer&quot; setting and is the default value.<br>
=C2=A0#pillar_source_merging_<wbr>strategy: smart<br>
@@ -621,6 +705,107 @@<br>
=C2=A0# Recursively merge lists by aggregating them instead of replacing th=
em.<br>
=C2=A0#pillar_merge_lists: False<br>
<br>
+# Set this option to &#39;True&#39; to force a &#39;KeyError&#39; to be ra=
ised whenever an<br>
+# attempt to retrieve a named value from pillar fails. When this option is=
 set<br>
+# to &#39;False&#39;, the failed attempt returns an empty string. Default =
is &#39;False&#39;.<br>
+#pillar_raise_on_missing: False<br>
+<br>
+# Git External Pillar (git_pillar) Configuration Options<br>
+#<br>
+# Specify the provider to be used for git_pillar. Must be either pygit2 or=
<br>
+# gitpython. If unset, then both will be tried in that same order, and the=
<br>
+# first one with a compatible version installed will be the provider that<=
br>
+# is used.<br>
+#git_pillar_provider: pygit2<br>
+<br>
+# If the desired branch matches this value, and the environment is omitted=
<br>
+# from the git_pillar configuration, then the environment for that git_pil=
lar<br>
+# remote will be base.<br>
+#git_pillar_base: master<br>
+<br>
+# If the branch is omitted from a git_pillar remote, then this branch will=
<br>
+# be used instead<br>
+#git_pillar_branch: master<br>
+<br>
+# Environment to use for git_pillar remotes. This is normally derived from=
<br>
+# the branch/tag (or from a per-remote env parameter), but if set this wil=
l<br>
+# override the process of deriving the env from the branch/tag name.<br>
+#git_pillar_env: &#39;&#39;<br>
+<br>
+# Path relative to the root of the repository where the git_pillar top fil=
e<br>
+# and SLS files are located.<br>
+#git_pillar_root: &#39;&#39;<br>
+<br>
+# Specifies whether or not to ignore SSL certificate errors when contactin=
g<br>
+# the remote repository.<br>
+#git_pillar_ssl_verify: False<br>
+<br>
+# When set to False, if there is an update/checkout lock for a git_pillar<=
br>
+# remote and the pid written to it is not running on the master, the lock<=
br>
+# file will be automatically cleared and a new lock will be obtained.<br>
+#git_pillar_global_lock: True<br>
+<br>
+# Git External Pillar Authentication Options<br>
+#<br>
+# Along with git_pillar_password, is used to authenticate to HTTPS remotes=
.<br>
+#git_pillar_user: &#39;&#39;<br>
+<br>
+# Along with git_pillar_user, is used to authenticate to HTTPS remotes.<br=
>
+# This parameter is not required if the repository does not use authentica=
tion.<br>
+#git_pillar_password: &#39;&#39;<br>
+<br>
+# By default, Salt will not authenticate to an HTTP (non-HTTPS) remote.<br=
>
+# This parameter enables authentication over HTTP.<br>
+#git_pillar_insecure_auth: False<br>
+<br>
+# Along with git_pillar_privkey (and optionally git_pillar_passphrase),<br=
>
+# is used to authenticate to SSH remotes.<br>
+#git_pillar_pubkey: &#39;&#39;<br>
+<br>
+# Along with git_pillar_pubkey (and optionally git_pillar_passphrase),<br>
+# is used to authenticate to SSH remotes.<br>
+#git_pillar_privkey: &#39;&#39;<br>
+<br>
+# This parameter is optional, required only when the SSH key being used<br=
>
+# to authenticate is protected by a passphrase.<br>
+#git_pillar_passphrase: &#39;&#39;<br>
+<br>
+# A master can cache pillars locally to bypass the expense of having to re=
nder them<br>
+# for each minion on every request. This feature should only be enabled in=
 cases<br>
+# where pillar rendering time is known to be unsatisfactory and any attend=
ant security<br>
+# concerns about storing pillars in a master cache have been addressed.<br=
>
+#<br>
+# When enabling this feature, be certain to read through the additional ``=
pillar_cache_*``<br>
+# configuration options to fully understand the tunable parameters and the=
ir implications.<br>
+#<br>
+# Note: setting ``pillar_cache: True`` has no effect on targeting Minions =
with Pillars.<br>
+# See <a href=3D"https://docs.saltstack.com/en/latest/topics/targeting/pil=
lar.html" rel=3D"noreferrer" target=3D"_blank">https://docs.saltstack.com/e=
n/<wbr>latest/topics/targeting/<wbr>pillar.html</a><br>
+#pillar_cache: False<br>
+<br>
+# If and only if a master has set ``pillar_cache: True``, the cache TTL co=
ntrols the amount<br>
+# of time, in seconds, before the cache is considered invalid by a master =
and a fresh<br>
+# pillar is recompiled and stored.<br>
+#pillar_cache_ttl: 3600<br>
+<br>
+# If and only if a master has set `pillar_cache: True`, one of several sto=
rage providers<br>
+# can be utililzed.<br>
+#<br>
+# `disk`: The default storage backend. This caches rendered pillars to the=
 master cache.<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Rendered pillars are serialized and des=
erialized as msgpack structures for speed.<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Note that pillars are stored UNENCRYPTE=
D. Ensure that the master cache<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0has permissions set appropriately. (Sam=
e defaults are provided.)<br>
+#<br>
+# memory: [EXPERIMENTAL] An optional backend for pillar caches which uses =
a pure-Python<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in-memory data structure for maximal pe=
rformance. There are several caveats,<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0however. First, because each master wor=
ker contains its own in-memory cache,<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0there is no guarantee of cache consiste=
ncy between minion requests. This<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0works best in situations where the pill=
ar rarely if ever changes. Secondly,<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and perhaps more importantly, this mean=
s that unencrypted pillars will<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0be accessible to any process which can =
examine the memory of the ``salt-master``!<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This may represent a substantial securi=
ty risk.<br>
+#<br>
+#pillar_cache_backend: disk<br>
+<br>
<br>
=C2=A0#####=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Syndic settings=C2=A0 =C2=A0 =
=C2=A0 =C2=A0#####<br>
=C2=A0##############################<wbr>############<br>
@@ -649,6 +834,12 @@<br>
=C2=A0# LOG file of the syndic daemon:<br>
=C2=A0#syndic_log_file: syndic.log<br>
<br>
+# The behaviour of the multi-syndic when connection to a master of masters=
 failed.<br>
+# Can specify ``random`` (default) or ``ordered``. If set to ``random``, m=
asters<br>
+# will be iterated in random order. If ``ordered`` is specified, the confi=
gured<br>
+# order will be used.<br>
+#syndic_failover: random<br>
+<br>
<br>
=C2=A0#####=C2=A0 =C2=A0 =C2=A0 Peer Publish settings=C2=A0 =C2=A0 =C2=A0##=
###<br>
=C2=A0##############################<wbr>############<br>
@@ -738,7 +929,7 @@<br>
=C2=A0# If using &#39;log_granular_levels&#39; this must be set to the high=
est desired level.<br>
=C2=A0#log_level_logfile: warning<br>
<br>
-# The date and time format used in log messages. Allowed date/time formati=
ng<br>
+# The date and time format used in log messages. Allowed date/time formatt=
ing<br>
=C2=A0# can be seen here: <a href=3D"http://docs.python.org/library/time.ht=
ml#time.strftime" rel=3D"noreferrer" target=3D"_blank">http://docs.python.o=
rg/<wbr>library/time.html#time.<wbr>strftime</a><br>
=C2=A0#log_datefmt: &#39;%H:%M:%S&#39;<br>
=C2=A0#log_datefmt_logfile: &#39;%Y-%m-%d %H:%M:%S&#39;<br>
@@ -760,7 +951,7 @@<br>
=C2=A0#log_fmt_console: &#39;%(colorlevel)s %(colormsg)s&#39;<br>
=C2=A0#log_fmt_console: &#39;[%(levelname)-8s] %(message)s&#39;<br>
=C2=A0#<br>
-#log_fmt_logfile: &#39;%(asctime)s,%(msecs)03.0f [%(name)-17s][%(levelname=
)-8s] %(message)s&#39;<br>
+#log_fmt_logfile: &#39;%(asctime)s,%(msecs)03d [%(name)-17s][%(levelname)-=
8s] %(message)s&#39;<br>
<br>
=C2=A0# This can be used to control logging levels more specificically.=C2=
=A0 This<br>
=C2=A0# example sets the main salt library at the &#39;warning&#39; level, =
but sets<br>
@@ -774,11 +965,18 @@<br>
<br>
=C2=A0#####=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Node Groups=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0######<br>
=C2=A0##############################<wbr>############<br>
-# Node groups allow for logical groupings of minion nodes. A group consist=
s of a group<br>
-# name and a compound target.<br>
+# Node groups allow for logical groupings of minion nodes. A group consist=
s of<br>
+# a group name and a compound target. Nodgroups can reference other nodegr=
oups<br>
+# with &#39;N@&#39; classifier. Ensure that you do not have circular refer=
ences.<br>
+#<br>
=C2=A0#nodegroups:<br>
-#=C2=A0 group1: &#39;<a href=3D"mailto:L@foo.domain.com">L@foo.domain.com<=
/a>,<a href=3D"http://bar.domain.com" rel=3D"noreferrer" target=3D"_blank">=
bar.domain.<wbr>com</a>,<a href=3D"http://baz.domain.com" rel=3D"noreferrer=
" target=3D"_blank">baz.domain.com</a> and bl*.<a href=3D"http://domain.com=
" rel=3D"noreferrer" target=3D"_blank">domain.com</a>&#39;<br>
+#=C2=A0 group1: &#39;<a href=3D"mailto:L@foo.domain.com">L@foo.domain.com<=
/a>,<a href=3D"http://bar.domain.com" rel=3D"noreferrer" target=3D"_blank">=
bar.domain.<wbr>com</a>,<a href=3D"http://baz.domain.com" rel=3D"noreferrer=
" target=3D"_blank">baz.domain.com</a> or bl*.<a href=3D"http://domain.com"=
 rel=3D"noreferrer" target=3D"_blank">domain.com</a>&#39;<br>
=C2=A0#=C2=A0 group2: &#39;G@os:Debian and <a href=3D"http://foo.domain.com=
" rel=3D"noreferrer" target=3D"_blank">foo.domain.com</a>&#39;<br>
+#=C2=A0 group3: &#39;G@os:Debian and N@group1&#39;<br>
+#=C2=A0 group4:<br>
+#=C2=A0 =C2=A0 - &#39;G@foo:bar&#39;<br>
+#=C2=A0 =C2=A0 - &#39;or&#39;<br>
+#=C2=A0 =C2=A0 - &#39;G@foo:baz&#39;<br>
<br>
<br>
=C2=A0#####=C2=A0 =C2=A0 =C2=A0Range Cluster settings=C2=A0 =C2=A0 =C2=A0##=
###<br>
@@ -824,3 +1022,13 @@<br>
=C2=A0##############################<wbr>##############<br>
=C2=A0# Default match type for filtering events tags: startswith, endswith,=
 find, regex, fnmatch<br>
=C2=A0#event_match_type: startswith<br>
+<br>
+# Save runner returns to the job cache<br>
+#runner_returns: True<br>
+<br>
+# Permanently include any available Python 3rd party modules into Salt Thi=
n<br>
+# when they are generated for Salt-SSH or other purposes.<br>
+# The modules should be named by the names they are actually imported insi=
de the Python.<br>
+# The value of the parameters can be either one module or a comma separate=
d list of them.<br>
+#thin_extra_mods: foo,bar<br>
+<br>
diff --git a/meta-openstack/recipes-<wbr>support/salt/files/minion b/meta-o=
penstack/recipes-<wbr>support/salt/files/minion<br>
index bd97c43..ad7a374 100644<br>
--- a/meta-openstack/recipes-<wbr>support/salt/files/minion<br>
+++ b/meta-openstack/recipes-<wbr>support/salt/files/minion<br>
@@ -38,6 +38,8 @@<br>
=C2=A0# value to &quot;str&quot;.=C2=A0 Failover masters can be requested b=
y setting<br>
=C2=A0# to &quot;failover&quot;.=C2=A0 MAKE SURE TO SET master_alive_interv=
al if you are<br>
=C2=A0# using failover.<br>
+# Setting master_type to &#39;disable&#39; let&#39;s you have a running mi=
nion (with engines and<br>
+# beacons) without a master connection<br>
=C2=A0# master_type: str<br>
<br>
=C2=A0# Poll interval in seconds for checking if the master is still there.=
=C2=A0 Only<br>
@@ -46,6 +48,16 @@<br>
=C2=A0# of TCP connections, such as load balancers.)<br>
=C2=A0# master_alive_interval: 30<br>
<br>
+# If the minion is in multi-master mode and the master_type configuration =
option<br>
+# is set to &quot;failover&quot;, this setting can be set to &quot;True&qu=
ot; to force the minion<br>
+# to fail back to the first master in the list if the first master is back=
 online.<br>
+#master_failback: False<br>
+<br>
+# If the minion is in multi-master mode, the &quot;master_type&quot; confi=
guration is set to<br>
+# &quot;failover&quot;, and the &quot;master_failback&quot; option is enab=
led, the master failback<br>
+# interval can be set to ping the top master with this interval, in second=
s.<br>
+#master_failback_interval: 0<br>
+<br>
=C2=A0# Set whether the minion should connect to the master via IPv6:<br>
=C2=A0#ipv6: False<br>
<br>
@@ -60,11 +72,15 @@<br>
=C2=A0# The user to run salt.<br>
=C2=A0#user: root<br>
<br>
-# Setting sudo_user will cause salt to run all execution modules under an =
sudo<br>
-# to the user given in sudo_user.=C2=A0 The user under which the salt mini=
on process<br>
-# itself runs will still be that provided in the user config above, but al=
l<br>
-# execution modules run by the minion will be rerouted through sudo.<br>
-#sudo_user: saltdev<br>
+# The user to run salt remote execution commands as via sudo. If this opti=
on is<br>
+# enabled then sudo will be used to change the active user executing the r=
emote<br>
+# command. If enabled the user will need to be allowed access via the sudo=
ers<br>
+# file for the user that the salt minion is configured to run as. The most=
<br>
+# common option would be to use the root user. If this option is set the u=
ser<br>
+# option should also be set to a non-root user. If migrating from a root m=
inion<br>
+# to a non root minion the minion cache should be cleared and the minion p=
ki<br>
+# directory will need to be changed to the ownership of the new user.<br>
+#sudo_user: root<br>
<br>
=C2=A0# Specify the location of the daemon process ID file.<br>
=C2=A0#pidfile: /var/run/salt-minion.pid<br>
@@ -73,6 +89,9 @@<br>
=C2=A0# sock_dir, pidfile.<br>
=C2=A0#root_dir: /<br>
<br>
+# The path to the minion&#39;s configuration file.<br>
+#conf_file: /etc/salt/minion<br>
+<br>
=C2=A0# The directory to store the pki information in<br>
=C2=A0#pki_dir: /etc/salt/pki/minion<br>
<br>
@@ -83,6 +102,13 @@<br>
=C2=A0# clusters.<br>
=C2=A0#id:<br>
<br>
+# Cache the minion id to a file when the minion&#39;s id is not statically=
 defined<br>
+# in the minion config. Defaults to &quot;True&quot;. This setting prevent=
s potential<br>
+# problems when automatic minion id resolution changes, which can cause th=
e<br>
+# minion to lose connection with the master. To turn off minion id caching=
,<br>
+# set this config to ``False``.<br>
+#minion_id_caching: True<br>
+<br>
=C2=A0# Append a domain to a hostname in the event that it does not exist.=
=C2=A0 This is<br>
=C2=A0# useful for systems where socket.getfqdn() does not actually result =
in a<br>
=C2=A0# FQDN (for instance, Solaris).<br>
@@ -103,6 +129,13 @@<br>
=C2=A0# This data may contain sensitive data and should be protected accord=
ingly.<br>
=C2=A0#cachedir: /var/cache/salt/minion<br>
<br>
+# Append minion_id to these directories.=C2=A0 Helps with<br>
+# multiple proxies and minions running on the same machine.<br>
+# Allowed elements in the list: pki_dir, cachedir, extension_modules<br>
+# Normally not needed unless running several proxies and/or minions on the=
 same machine<br>
+# Defaults to [&#39;cachedir&#39;] for proxies, [] (empty list) for regula=
r minions<br>
+#append_minionid_config_dirs:<br>
+<br>
=C2=A0# Verify and set permissions on configuration directories at startup.=
<br>
=C2=A0#verify_env: True<br>
<br>
@@ -171,6 +204,20 @@<br>
=C2=A0# authenticate.<br>
=C2=A0#auth_tries: 7<br>
<br>
+# The number of attempts to connect to a master before giving up.<br>
+# Set this to -1 for unlimited attempts. This allows for a master to have<=
br>
+# downtime and the minion to reconnect to it later when it comes back up.<=
br>
+# In &#39;failover&#39; mode, it is the number of attempts for each set of=
 masters.<br>
+# In this mode, it will cycle through the list of masters for each attempt=
.<br>
+#<br>
+# This is different than auth_tries because auth_tries attempts to<br>
+# retry auth attempts with a single master. auth_tries is under the<br>
+# assumption that you can connect to the master but not gain<br>
+# authorization from it. master_tries will still cycle through all<br>
+# the masters in a given try, so it is appropriate if you expect<br>
+# occasional downtime from the master(s).<br>
+#master_tries: 1<br>
+<br>
=C2=A0# If authentication fails due to SaltReqTimeoutError during a ping_in=
terval,<br>
=C2=A0# cause sub minion process to restart.<br>
=C2=A0#auth_safemode: False<br>
@@ -249,10 +296,17 @@<br>
=C2=A0#<br>
=C2=A0#<br>
=C2=A0# The loop_interval sets how long in seconds the minion will wait bet=
ween<br>
-# evaluating the scheduler and running cleanup tasks. This defaults to a<b=
r>
-# sane 60 seconds, but if the minion scheduler needs to be evaluated more<=
br>
-# often lower this value<br>
-#loop_interval: 60<br>
+# evaluating the scheduler and running cleanup tasks.=C2=A0 This defaults =
to 1<br>
+# second on the minion scheduler.<br>
+#loop_interval: 1<br>
+<br>
+# Some installations choose to start all job returns in a cache or a retur=
ner<br>
+# and forgo sending the results back to a master. In this workflow, jobs<b=
r>
+# are most often executed with --async from the Salt CLI and then results<=
br>
+# are evaluated by examining job caches on the minions or any configured r=
eturners.<br>
+# WARNING: Setting this to False will **disable** returns back to the mast=
er.<br>
+#pub_ret: True<br>
+<br>
<br>
=C2=A0# The grains can be merged, instead of overridden, using this option.=
<br>
=C2=A0# This allows custom grains to defined different subvalues of a dicti=
onary<br>
@@ -286,6 +340,26 @@<br>
=C2=A0# is not enabled.<br>
=C2=A0# grains_cache_expiration: 300<br>
<br>
+# Determines whether or not the salt minion should run scheduled mine upda=
tes.<br>
+# Defaults to &quot;True&quot;. Set to &quot;False&quot; to disable the sc=
heduled mine updates<br>
+# (this essentially just does not add the mine update function to the mini=
on&#39;s<br>
+# scheduler).<br>
+#mine_enabled: True<br>
+<br>
+# Determines whether or not scheduled mine updates should be accompanied b=
y a job<br>
+# return for the job cache. Defaults to &quot;False&quot;. Set to &quot;Tr=
ue&quot; to include job<br>
+# returns in the job cache for mine updates.<br>
+#mine_return_job: False<br>
+<br>
+# Example functions that can be run via the mine facility<br>
+# NO mine functions are established by default.<br>
+# Note these can be defined in the minion&#39;s pillar as well.<br>
+#mine_functions:<br>
+#=C2=A0 test.ping: []<br>
+#=C2=A0 network.ip_addrs:<br>
+#=C2=A0 =C2=A0 interface: eth0<br>
+#=C2=A0 =C2=A0 cidr: &#39;<a href=3D"http://10.0.0.0/8" rel=3D"noreferrer"=
 target=3D"_blank">10.0.0.0/8</a>&#39;<br>
+<br>
=C2=A0# Windows platforms lack posix IPC and must rely on slower TCP based =
inter-<br>
=C2=A0# process communications. Set ipc_mode to &#39;tcp&#39; on such syste=
ms<br>
=C2=A0#ipc_mode: ipc<br>
@@ -319,16 +393,33 @@<br>
=C2=A0#include:<br>
=C2=A0#=C2=A0 - /etc/salt/extra_config<br>
=C2=A0#=C2=A0 - /etc/roles/webserver<br>
+<br>
+# The syndic minion can verify that it is talking to the correct master vi=
a the<br>
+# key fingerprint of the higher-level master with the &quot;syndic_finger&=
quot; config.<br>
+#syndic_finger: &#39;&#39;<br>
=C2=A0#<br>
=C2=A0#<br>
=C2=A0#<br>
=C2=A0#####=C2=A0 =C2=A0Minion module management=C2=A0 =C2=A0 =C2=A0#####<b=
r>
=C2=A0##############################<wbr>############<br>
=C2=A0# Disable specific modules. This allows the admin to limit the level =
of<br>
-# access the master has to the minion.<br>
-#disable_modules: [cmd,test]<br>
+# access the master has to the minion.=C2=A0 The default here is the empty=
 list,<br>
+# below is an example of how this needs to be formatted in the config file=
<br>
+#disable_modules:<br>
+#=C2=A0 - cmdmod<br>
+#=C2=A0 - test<br>
=C2=A0#disable_returners: []<br>
-#<br>
+<br>
+# This is the reverse of disable_modules.=C2=A0 The default, like disable_=
modules, is the empty list,<br>
+# but if this option is set to *anything* then *only* those modules will l=
oad.<br>
+# Note that this is a very large hammer and it can be quite difficult to k=
eep the minion working<br>
+# the way you think it should since Salt uses many modules internally itse=
lf.=C2=A0 At a bare minimum<br>
+# you need the following enabled or else the minion won&#39;t start.<br>
+#whitelist_modules:<br>
+#=C2=A0 - cmdmod<br>
+#=C2=A0 - test<br>
+#=C2=A0 - config<br>
+<br>
=C2=A0# Modules can be loaded from arbitrary paths. This enables the easy d=
eployment<br>
=C2=A0# of third party modules. Modules for returners and minions can be lo=
aded.<br>
=C2=A0# Specify a list of extra directories to search for minion modules an=
d<br>
@@ -389,6 +480,15 @@<br>
=C2=A0# environments is to isolate via the top file.<br>
=C2=A0#environment: None<br>
=C2=A0#<br>
+# Isolates the pillar environment on the minion side. This functions the s=
ame<br>
+# as the environment setting, but for pillar instead of states.<br>
+#pillarenv: None<br>
+#<br>
+# Set this option to &#39;True&#39; to force a &#39;KeyError&#39; to be ra=
ised whenever an<br>
+# attempt to retrieve a named value from pillar fails. When this option is=
 set<br>
+# to &#39;False&#39;, the failed attempt returns an empty string. Default =
is &#39;False&#39;.<br>
+#pillar_raise_on_missing: False<br>
+#<br>
=C2=A0# If using the local file directory, then the state top file name nee=
ds to be<br>
=C2=A0# defined, by default this is top.sls.<br>
=C2=A0#state_top: top.sls<br>
@@ -448,6 +548,18 @@<br>
=C2=A0#=C2=A0 base:<br>
=C2=A0#=C2=A0 =C2=A0 - /srv/salt<br>
<br>
+# Uncomment the line below if you do not want the file_server to follow<br=
>
+# symlinks when walking the filesystem tree. This is set to True<br>
+# by default. Currently this only applies to the default roots<br>
+# fileserver_backend.<br>
+#fileserver_followsymlinks: False<br>
+#<br>
+# Uncomment the line below if you do not want symlinks to be<br>
+# treated as the files they are pointing to. By default this is set to<br>
+# False. By uncommenting the line below, any detected symlink while listin=
g<br>
+# files on the Master will not be returned to the Minion.<br>
+#fileserver_ignoresymlinks: True<br>
+#<br>
=C2=A0# By default, the Salt fileserver recurses fully into all defined env=
ironments<br>
=C2=A0# to attempt to find files. To limit this behavior so that the filese=
rver only<br>
=C2=A0# traverses directories with SLS files and special Salt directories l=
ike _modules,<br>
@@ -456,13 +568,19 @@<br>
=C2=A0# is False.<br>
=C2=A0#fileserver_limit_traversal: False<br>
<br>
-# The hash_type is the hash to use when discovering the hash of a file in<=
br>
+# The hash_type is the hash to use when discovering the hash of a file on<=
br>
=C2=A0# the local fileserver. The default is md5, but sha1, sha224, sha256,=
 sha384<br>
=C2=A0# and sha512 are also supported.<br>
=C2=A0#<br>
+# WARNING: While md5 and sha1 are also supported, do not use it due to the=
 high chance<br>
+# of possible collisions and thus security breach.<br>
+#<br>
+# WARNING: While md5 is also supported, do not use it due to the high chan=
ce<br>
+# of possible collisions and thus security breach.<br>
+#<br>
=C2=A0# Warning: Prior to changing this value, the minion should be stopped=
 and all<br>
=C2=A0# Salt caches should be cleared.<br>
-#hash_type: md5<br>
+#hash_type: sha256<br>
<br>
=C2=A0# The Salt pillar is searched for locally if file_client is set to lo=
cal. If<br>
=C2=A0# this is the case, and pillar data is defined, then the pillar_roots=
 need to<br>
@@ -470,6 +588,10 @@<br>
=C2=A0#pillar_roots:<br>
=C2=A0#=C2=A0 base:<br>
=C2=A0#=C2=A0 =C2=A0 - /srv/pillar<br>
+<br>
+# Set a hard-limit on the size of the files that can be pushed to the mast=
er.<br>
+# It will be interpreted as megabytes. Default: 100<br>
+#file_recv_max_size: 100<br>
=C2=A0#<br>
=C2=A0#<br>
=C2=A0######=C2=A0 =C2=A0 =C2=A0 =C2=A0 Security settings=C2=A0 =C2=A0 =C2=
=A0 =C2=A0#####<br>
@@ -508,7 +630,7 @@<br>
<br>
=C2=A0# Fingerprint of the master public key to validate the identity of yo=
ur Salt master<br>
=C2=A0# before the initial key exchange. The master fingerprint can be foun=
d by running<br>
-# &quot;salt-key -F master&quot; on the Salt master.<br>
+# &quot;salt-key -f master.pub&quot; on the Salt master.<br>
=C2=A0#master_finger: &#39;&#39;<br>
<br>
<br>
@@ -548,7 +670,7 @@<br>
=C2=A0# Default: &#39;warning&#39;<br>
=C2=A0#log_level_logfile:<br>
<br>
-# The date and time format used in log messages. Allowed date/time formati=
ng<br>
+# The date and time format used in log messages. Allowed date/time formatt=
ing<br>
=C2=A0# can be seen here: <a href=3D"http://docs.python.org/library/time.ht=
ml#time.strftime" rel=3D"noreferrer" target=3D"_blank">http://docs.python.o=
rg/<wbr>library/time.html#time.<wbr>strftime</a><br>
=C2=A0#log_datefmt: &#39;%H:%M:%S&#39;<br>
=C2=A0#log_datefmt_logfile: &#39;%Y-%m-%d %H:%M:%S&#39;<br>
@@ -570,7 +692,7 @@<br>
=C2=A0#log_fmt_console: &#39;%(colorlevel)s %(colormsg)s&#39;<br>
=C2=A0#log_fmt_console: &#39;[%(levelname)-8s] %(message)s&#39;<br>
=C2=A0#<br>
-#log_fmt_logfile: &#39;%(asctime)s,%(msecs)03.0f [%(name)-17s][%(levelname=
)-8s] %(message)s&#39;<br>
+#log_fmt_logfile: &#39;%(asctime)s,%(msecs)03d [%(name)-17s][%(levelname)-=
8s] %(message)s&#39;<br>
<br>
=C2=A0# This can be used to control logging levels more specificically.=C2=
=A0 This<br>
=C2=A0# example sets the main salt library at the &#39;warning&#39; level, =
but sets<br>
diff --git a/meta-openstack/recipes-<wbr>support/salt/files/salt-<wbr>commo=
n.logrotate b/meta-openstack/recipes-<wbr>support/salt/files/salt-<wbr>comm=
on.logrotate<br>
index dcfd268..3cd0023 100644<br>
--- a/meta-openstack/recipes-<wbr>support/salt/files/salt-<wbr>common.logro=
tate<br>
+++ b/meta-openstack/recipes-<wbr>support/salt/files/salt-<wbr>common.logro=
tate<br>
@@ -1,7 +1,20 @@<br>
-/var/log/salt/master<br>
-/var/log/salt/minion<br>
-/var/log/salt/*.log<br>
-{<br>
+/var/log/salt/master {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0weekly<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0missingok<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rotate 7<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0compress<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0notifempty<br>
+}<br>
+<br>
+/var/log/salt/minion {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0weekly<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0missingok<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rotate 7<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0compress<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0notifempty<br>
+}<br>
+<br>
+/var/log/salt/key {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 weekly<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 missingok<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rotate 7<br>
diff --git a/meta-openstack/recipes-<wbr>support/salt/<a href=3D"http://sal=
t_2016.3.0.bb" rel=3D"noreferrer" target=3D"_blank">salt_2016.3.0.bb</a> b/=
meta-openstack/recipes-<wbr>support/salt/<a href=3D"http://salt_2016.11.0.b=
b" rel=3D"noreferrer" target=3D"_blank">salt_2016.11.0.bb</a><br>
similarity index 98%<br>
rename from meta-openstack/recipes-<wbr>support/salt/<a href=3D"http://salt=
_2016.3.0.bb" rel=3D"noreferrer" target=3D"_blank">salt_2016.3.0.bb</a><br>
rename to meta-openstack/recipes-<wbr>support/salt/<a href=3D"http://salt_2=
016.11.0.bb" rel=3D"noreferrer" target=3D"_blank">salt_2016.11.0.bb</a><br>
index 7024f42..ba1def7 100644<br>
--- a/meta-openstack/recipes-<wbr>support/salt/<a href=3D"http://salt_2016.=
3.0.bb" rel=3D"noreferrer" target=3D"_blank">salt_2016.3.0.bb</a><br>
+++ b/meta-openstack/recipes-<wbr>support/salt/<a href=3D"http://salt_2016.=
11.0.bb" rel=3D"noreferrer" target=3D"_blank">salt_2016.11.0.bb</a><br>
@@ -28,8 +28,8 @@ SRC_URI =3D &quot;<a href=3D"https://files.pythonhosted.o=
rg/packages/source/s/${SRCNAME}/${SRCNAME" rel=3D"noreferrer" target=3D"_bl=
ank">https://files.pythonhosted.<wbr>org/packages/source/s/${<wbr>SRCNAME}/=
${SRCNAME</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://roster \<br>
=C2=A0&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>8ed82cfb3f9b1764a035edbdacf0fe<wbr>a9&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>e316dd103b7faeaa97820197e4d0d7<wbr>d3585=
19f0ca2a6dcb1d9b718eea801<wbr>ed30&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>eced07a652cc6a31870fc098d5325a<wbr>9c&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>b516285926ee95cedc64ecddab05d1<wbr>4422b=
7c8819c9f6d046a431c41d608<wbr>e6bc&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--001a114884b27598790543fab399--
