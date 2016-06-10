Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A7EA7E00D86; Fri, 10 Jun 2016 09:32:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, WEIRD_PORT autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.48 listed in list.dnswl.org]
	*  0.0 WEIRD_PORT URI: Uses non-standard port number for HTTP
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EEEC7E00CE6
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Jun 2016 09:32:15 -0700 (PDT)
Received: by mail-oi0-f48.google.com with SMTP id k23so120426284oih.0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Jun 2016 09:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aI7TkF7TvsgCGEMHg9Uo8QrOXRQwuGnlJAqE7cgJ6pI=;
	b=PiifF4ECaDoJZQ5OB+rXZ5VNGySRa4/QThA3uDTKKENbVzvaG1PUkQb8cEhovCe7uW
	5EXHLogQ6x1BUeFQQGPbw4OeUPlmWSbELnMDS6KK6gGMtpTkwWOoiupk8y2hbgABM/ld
	pIfChpN9o7Niyrty0ROLmaRS72gAiwMwU7FXb5l+TbA0Lwb4ng/Q9w5dMU8ULyP96obR
	y8AiFo2wA+u1fzT1TV5KZHSCtktL4K/oEt/hHgihsYOEA13uJJXyxz6I/vktoW4sEVhc
	V+GXdm7Zfg/1HrvMHwsK+darhUVW5m56StndUFliJzfIDL6NVE5sc5a2gdZlIBm0v7zU
	uU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aI7TkF7TvsgCGEMHg9Uo8QrOXRQwuGnlJAqE7cgJ6pI=;
	b=L6ZNQkS0wwRuxO1Jsxkqmdnaz5XNRSXe83ISOzil+UwlYRZyWKKnw5ON3ckOBuSfoX
	yhxAGgaLWi57FfjWhzNuco3PXpMLK0VStft8jWEXDsc+0+myhTqdJjwdULGrQT2cK0Uk
	YRpLsV+CybJl+XO/grE+I1FthpJQG84TEWfhV4v8fqsv4oKeQf0HXSNa0ckSCla9hM2s
	0RjBG1K5YbtFO85hdTGO65dV+2r43T0+V5l/qwIqneX2ow+F8UCgTbBTbFb76v3BvkDA
	QA/DmZAVqdfSH5IkdH7uQDiDYyQN32ZLOD+WuY/C7BJZuHIun4nXFCKvatgUy7spDTRO
	nh0Q==
X-Gm-Message-State: ALyK8tJxERbj40dHswARxYitzcwrZ4nRX5DWxOFcMCAxG/Jr7ddbpmPHvOfw1v1BaPd1bmKq9xhl1hxyhPsOEQ==
X-Received: by 10.157.3.134 with SMTP id f6mr1657127otf.144.1465576334649;
	Fri, 10 Jun 2016 09:32:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.33.117 with HTTP; Fri, 10 Jun 2016 09:32:13 -0700 (PDT)
In-Reply-To: <575AE283.9010802@ni.com>
References: <1465505964-21008-1-git-send-email-alejandro.delcastillo@ni.com>
	<575AE283.9010802@ni.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <CADkTA4M+oTKhj6Hy3BHB_Zp1TEHhLQe2eBBGjN-uOcJbPVov2Q@mail.gmail.com>
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>
X-Mailman-Approved-At: Fri, 23 Dec 2016 16:01:39 -0800
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] salt: upgrade to 2016.3
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
Date: Fri, 10 Jun 2016 16:32:24 -0000
X-Original-Date: Fri, 10 Jun 2016 12:32:13 -0400
X-List-Received-Date: Fri, 10 Jun 2016 16:32:24 -0000
Content-Type: multipart/alternative; boundary=94eb2c056214d1717c0534ef14fc

--94eb2c056214d1717c0534ef14fc
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 10, 2016 at 11:53 AM, Alejandro del Castillo <
alejandro.delcastillo@ni.com> wrote:

> Just realized that pypi still have predictable URL's (without hashes):
>
>
> https://bitbucket.org/pypa/pypi/issues/438/backwards-compatible-un-hashed-package
>
> Will send a v2 shortly.
>

Gmail is driving me nuts with the threading of this series.


Does this second patch replace the first, or is it in addition to the first
patch ? I have
one from 19 hours ago, one from 32 minutes ago, all being threaded
together. So I
can't tell if this send (and your v2) replace the one from 19 hours ago, or
are in addition
to it.

Bruce


>
> On 06/09/2016 03:59 PM, Alejandro del Castillo wrote:
> > * Update conffiles
> > * Add PKGCONFIG options for zeromq and TCP transports.
> >
> > Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> > ---
> >  meta-openstack/recipes-support/salt/files/cloud    |   7 +-
> >  meta-openstack/recipes-support/salt/files/master   | 541
> ++++++++++++++++-----
> >  meta-openstack/recipes-support/salt/files/minion   | 366 ++++++++++----
> >  meta-openstack/recipes-support/salt/files/roster   |   1 +
> >  .../salt/{salt_2015.8.0.bb => salt_2016.3.0.bb}    |  22 +-
> >  5 files changed, 718 insertions(+), 219 deletions(-)
> >  rename meta-openstack/recipes-support/salt/{salt_2015.8.0.bb =>
> salt_2016.3.0.bb} (88%)
> >
> > diff --git a/meta-openstack/recipes-support/salt/files/cloud
> b/meta-openstack/recipes-support/salt/files/cloud
> > index 2ea54f1..5bd28df 100644
> > --- a/meta-openstack/recipes-support/salt/files/cloud
> > +++ b/meta-openstack/recipes-support/salt/files/cloud
> > @@ -1,4 +1,4 @@
> > -# This file should normally be installed at: /etc/salt/cloud
> > +# This file should normally be installed at: /etc/salt/cloud
> >
> >
> >  ##########################################
> > @@ -28,6 +28,9 @@
> >  # The level of messages to send to the console.
> >  # One of 'garbage', 'trace', 'debug', info', 'warning', 'error',
> 'critical'.
> >  #
> > +# The following log levels are considered INSECURE and may log
> sensitive data:
> > +# ['garbage', 'trace', 'debug']
> > +#
> >  # Default: 'info'
> >  #
> >  #log_level: info
> > @@ -65,7 +68,9 @@
> >  # the coloring of the messages, these color formatters also include
> padding as
> >  # well.  Color LogRecord attributes are only available for console
> logging.
> >  #
> > +#log_fmt_console: '%(colorlevel)s %(colormsg)s'
> >  #log_fmt_console: '[%(levelname)-8s] %(message)s'
> > +#
> >  #log_fmt_logfile: '%(asctime)s,%(msecs)03.0f
> [%(name)-17s][%(levelname)-8s] %(message)s'
> >
> >
> > diff --git a/meta-openstack/recipes-support/salt/files/master
> b/meta-openstack/recipes-support/salt/files/master
> > index 8129a4f..821f5fc 100644
> > --- a/meta-openstack/recipes-support/salt/files/master
> > +++ b/meta-openstack/recipes-support/salt/files/master
> > @@ -1,125 +1,235 @@
> >  ##### Primary configuration settings #####
> >  ##########################################
> > -# This configuration file is used to manage the behavior of the Salt
> Master
> > -# Values that are commented out but have no space after the comment are
> > -# defaults that need not be set in the config. If there is a space
> after the
> > -# comment that the value is presented as an example and is not the
> default.
> > +# This configuration file is used to manage the behavior of the Salt
> Master.
> > +# Values that are commented out but have an empty line after the
> comment are
> > +# defaults that do not need to be set in the config. If there is no
> blank line
> > +# after the comment then the value is presented as an example and is
> not the
> > +# default.
> >
> >  # Per default, the master will automatically include all config files
> >  # from master.d/*.conf (master.d is a directory in the same directory
> > -# as the main master config file)
> > +# as the main master config file).
> >  #default_include: master.d/*.conf
> >
> > -# The address of the interface to bind to
> > +# The address of the interface to bind to:
> >  #interface: 0.0.0.0
> >
> >  # Whether the master should listen for IPv6 connections. If this is set
> to True,
> > -# the interface option must be adjusted too (for example: "interface:
> '::'")
> > +# the interface option must be adjusted, too. (For example: "interface:
> '::'")
> >  #ipv6: False
> >
> > -# The tcp port used by the publisher
> > +# The tcp port used by the publisher:
> >  #publish_port: 4505
> >
> > -# The user to run the salt-master as. Salt will update all permissions
> to
> > -# allow the specified user to run the master. If the modified files
> cause
> > -# conflicts set verify_env to False.
> > +# The user under which the salt master will run. Salt will update all
> > +# permissions to allow the specified user to run the master. The
> exception is
> > +# the job cache, which must be deleted if this user is changed. If the
> > +# modified files cause conflicts, set verify_env to False.
> >  #user: root
> >
> > -# Max open files
> > -# Each minion connecting to the master uses AT LEAST one file
> descriptor, the
> > -# master subscription connection. If enough minions connect you might
> start
> > -# seeing on the console(and then salt-master crashes):
> > -#   Too many open files (tcp_listener.cpp:335)
> > -#   Aborted (core dumped)
> > -#
> > -# By default this value will be the one of `ulimit -Hn`, ie, the hard
> limit for
> > -# max open files.
> > -#
> > -# If you wish to set a different value than the default one, uncomment
> and
> > -# configure this setting. Remember that this value CANNOT be higher
> than the
> > -# hard limit. Raising the hard limit depends on your OS and/or
> distribution,
> > -# a good way to find the limit is to search the internet for(for
> example):
> > -#   raise max open files hard limit debian
> > -#
> > -#max_open_files: 100000
> > -
> > -# The number of worker threads to start, these threads are used to
> manage
> > -# return calls made from minions to the master, if the master seems to
> be
> > -# running slowly, increase the number of threads
> > -#worker_threads: 5
> > -
> >  # The port used by the communication interface. The ret (return) port
> is the
> > -# interface used for the file server, authentication, job returnes, etc.
> > +# interface used for the file server, authentication, job returns, etc.
> >  #ret_port: 4506
> >
> > -# Specify the location of the daemon process ID file
> > +# Specify the location of the daemon process ID file:
> >  #pidfile: /var/run/salt-master.pid
> >
> >  # The root directory prepended to these options: pki_dir, cachedir,
> > -# sock_dir, log_file, autosign_file, extension_modules, key_logfile,
> pidfile.
> > +# sock_dir, log_file, autosign_file, autoreject_file, extension_modules,
> > +# key_logfile, pidfile:
> >  #root_dir: /
> >
> > -# Directory used to store public key data
> > +# Directory used to store public key data:
> >  #pki_dir: /etc/salt/pki/master
> >
> > -# Directory to store job and cache data
> > +# Directory to store job and cache data:
> > +# This directory may contain sensitive data and should be protected
> accordingly.
> > +#
> >  #cachedir: /var/cache/salt/master
> >
> > -# Verify and set permissions on configuration directories at startup
> > +# Directory for custom modules. This directory can contain
> subdirectories for
> > +# each of Salt's module types such as "runners", "output", "wheel",
> "modules",
> > +# "states", "returners", etc.
> > +#extension_modules: <no default>
> > +
> > +# Directory for custom modules. This directory can contain
> subdirectories for
> > +# each of Salt's module types such as "runners", "output", "wheel",
> "modules",
> > +# "states", "returners", etc.
> > +# Like 'extension_modules' but can take an array of paths
> > +#module_dirs: <no default>
> > +#   - /var/cache/salt/minion/extmods
> > +
> > +# Verify and set permissions on configuration directories at startup:
> >  #verify_env: True
> >
> > -# Set the number of hours to keep old job information in the job cache
> > +# Set the number of hours to keep old job information in the job cache:
> >  #keep_jobs: 24
> >
> > -# Set the default timeout for the salt command and api, the default is 5
> > -# seconds
> > +# Set the default timeout for the salt command and api. The default is 5
> > +# seconds.
> >  #timeout: 5
> >
> > -# The loop_interval option controls the seconds for the master's
> maintinance
> > +# The loop_interval option controls the seconds for the master's
> maintenance
> >  # process check cycle. This process updates file server backends,
> cleans the
> >  # job cache and executes the scheduler.
> >  #loop_interval: 60
> >
> > -# Set the default outputter used by the salt command. The default is
> "nested"
> > +# Set the default outputter used by the salt command. The default is
> "nested".
> >  #output: nested
> >
> > -# By default output is colored, to disable colored output set the color
> value
> > -# to False
> > +# Return minions that timeout when running commands like test.ping
> > +#show_timeout: True
> > +
> > +# By default, output is colored. To disable colored output, set the
> color value
> > +# to False.
> >  #color: True
> >
> > -# Set the directory used to hold unix sockets
> > +# Do not strip off the colored output from nested results and state
> outputs
> > +# (true by default).
> > +# strip_colors: False
> > +
> > +# Set the directory used to hold unix sockets:
> >  #sock_dir: /var/run/salt/master
> >
> >  # The master can take a while to start up when lspci and/or dmidecode
> is used
> >  # to populate the grains for the master. Enable if you want to see GPU
> hardware
> >  # data for your master.
> > -#
> >  # enable_gpu_grains: False
> >
> > -# The master maintains a job cache, while this is a great addition it
> can be
> > +# The master maintains a job cache. While this is a great addition, it
> can be
> >  # a burden on the master for larger deployments (over 5000 minions).
> >  # Disabling the job cache will make previously executed jobs
> unavailable to
> >  # the jobs system and is not generally recommended.
> > -#
> >  #job_cache: True
> >
> >  # Cache minion grains and pillar data in the cachedir.
> >  #minion_data_cache: True
> >
> > +# Store all returns in the given returner.
> > +# Setting this option requires that any returner-specific configuration
> also
> > +# be set. See various returners in salt/returners for details on
> required
> > +# configuration values. (See also, event_return_queue below.)
> > +#
> > +#event_return: mysql
> > +
> > +# On busy systems, enabling event_returns can cause a considerable load
> on
> > +# the storage system for returners. Events can be queued on the master
> and
> > +# stored in a batched fashion using a single transaction for multiple
> events.
> > +# By default, events are not queued.
> > +#event_return_queue: 0
> > +
> > +# Only events returns matching tags in a whitelist
> > +# event_return_whitelist:
> > +#   - salt/master/a_tag
> > +#   - salt/master/another_tag
> > +
> > +# Store all event returns _except_ the tags in a blacklist
> > +# event_return_blacklist:
> > +#   - salt/master/not_this_tag
> > +#   - salt/master/or_this_one
> > +
> > +# Passing very large events can cause the minion to consume large
> amounts of
> > +# memory. This value tunes the maximum size of a message allowed onto
> the
> > +# master event bus. The value is expressed in bytes.
> > +#max_event_size: 1048576
> > +
> > +# By default, the master AES key rotates every 24 hours. The next
> command
> > +# following a key rotation will trigger a key refresh from the minion
> which may
> > +# result in minions which do not respond to the first command after a
> key refresh.
> > +#
> > +# To tell the master to ping all minions immediately after an AES key
> refresh, set
> > +# ping_on_rotate to True. This should mitigate the issue where a minion
> does not
> > +# appear to initially respond after a key is rotated.
> > +#
> > +# Note that ping_on_rotate may cause high load on the master
> immediately after
> > +# the key rotation event as minions reconnect. Consider this carefully
> if this
> > +# salt master is managing a large number of minions.
> > +#
> > +# If disabled, it is recommended to handle this event by listening for
> the
> > +# 'aes_key_rotate' event with the 'key' tag and acting appropriately.
> > +# ping_on_rotate: False
> > +
> > +# By default, the master deletes its cache of minion data when the key
> for that
> > +# minion is removed. To preserve the cache after key deletion, set
> > +# 'preserve_minion_cache' to True.
> > +#
> > +# WARNING: This may have security implications if compromised minions
> auth with
> > +# a previous deleted minion ID.
> > +#preserve_minion_cache: False
> > +
> > +# If max_minions is used in large installations, the master might
> experience
> > +# high-load situations because of having to check the number of
> connected
> > +# minions for every authentication. This cache provides the minion-ids
> of
> > +# all connected minions to all MWorker-processes and greatly improves
> the
> > +# performance of max_minions.
> > +# con_cache: False
> > +
> >  # The master can include configuration from other files. To enable this,
> >  # pass a list of paths to this option. The paths can be either relative
> or
> >  # absolute; if relative, they are considered to be relative to the
> directory
> >  # the main master configuration file lives in (this file). Paths can
> make use
> >  # of shell-style globbing. If no files are matched by a path passed to
> this
> > -# option then the master will log a warning message.
> > -#
> > +# option, then the master will log a warning message.
> >  #
> >  # Include a config file from some other path:
> > -#include: /etc/salt/extra_config
> > +# include: /etc/salt/extra_config
> >  #
> >  # Include config from several files and directories:
> > -#include:
> > -#  - /etc/salt/extra_config
> > +# include:
> > +#   - /etc/salt/extra_config
> > +
> > +
> > +#####  Large-scale tuning settings   #####
> > +##########################################
> > +# Max open files
> > +#
> > +# Each minion connecting to the master uses AT LEAST one file
> descriptor, the
> > +# master subscription connection. If enough minions connect you might
> start
> > +# seeing on the console (and then salt-master crashes):
> > +#   Too many open files (tcp_listener.cpp:335)
> > +#   Aborted (core dumped)
> > +#
> > +# By default this value will be the one of `ulimit -Hn`, ie, the hard
> limit for
> > +# max open files.
> > +#
> > +# If you wish to set a different value than the default one, uncomment
> and
> > +# configure this setting. Remember that this value CANNOT be higher
> than the
> > +# hard limit. Raising the hard limit depends on your OS and/or
> distribution,
> > +# a good way to find the limit is to search the internet. For example:
> > +#   raise max open files hard limit debian
> > +#
> > +#max_open_files: 100000
> > +
> > +# The number of worker threads to start. These threads are used to
> manage
> > +# return calls made from minions to the master. If the master seems to
> be
> > +# running slowly, increase the number of threads. This setting can not
> be
> > +# set lower than 3.
> > +#worker_threads: 5
> > +
> > +# Set the ZeroMQ high water marks
> > +# http://api.zeromq.org/3-2:zmq-setsockopt
> > +
> > +# The publisher interface ZeroMQPubServerChannel
> > +#pub_hwm: 1000
> > +
> > +# These two ZMQ HWM settings, salt_event_pub_hwm and
> event_publisher_pub_hwm
> > +# are significant for masters with thousands of minions.  When these are
> > +# insufficiently high it will manifest in random responses missing in
> the CLI
> > +# and even missing from the job cache.  Masters that have fast CPUs and
> many
> > +# cores with appropriate worker_threads will not need these set as high.
> > +
> > +# On deployment with 8,000 minions, 2.4GHz CPUs, 24 cores, 32GiB memory
> has
> > +# these settings:
> > +#
> > +#   salt_event_pub_hwm: 128000
> > +#   event_publisher_pub_hwm: 64000
> > +
> > +# ZMQ high-water-mark for SaltEvent pub socket
> > +#salt_event_pub_hwm: 20000
> > +
> > +# ZMQ high-water-mark for EventPublisher pub socket
> > +#event_publisher_pub_hwm: 10000
> > +
> >
> >
> >  #####        Security settings       #####
> > @@ -134,53 +244,68 @@
> >  # public keys from the minions. Note that this is insecure.
> >  #auto_accept: False
> >
> > -# If the autosign_file is specified only incoming keys specified in
> > -# the autosign_file will be automatically accepted. This is insecure.
> > -# Regular expressions as well as globing lines are supported.
> > +# Time in minutes that a incoming public key with a matching name found
> in
> > +# pki_dir/minion_autosign/keyid is automatically accepted. Expired
> autosign keys
> > +# are removed when the master checks the minion_autosign directory.
> > +# 0 equals no timeout
> > +# autosign_timeout: 120
> > +
> > +# If the autosign_file is specified, incoming keys specified in the
> > +# autosign_file will be automatically accepted. This is insecure.
> Regular
> > +# expressions as well as globing lines are supported.
> >  #autosign_file: /etc/salt/autosign.conf
> >
> > -# Enable permissive access to the salt keys.  This allows you to run the
> > +# Works like autosign_file, but instead allows you to specify minion
> IDs for
> > +# which keys will automatically be rejected. Will override both
> membership in
> > +# the autosign_file and the auto_accept setting.
> > +#autoreject_file: /etc/salt/autoreject.conf
> > +
> > +# Enable permissive access to the salt keys. This allows you to run the
> >  # master or minion as root, but have a non-root group be given access to
> > -# your pki_dir.  To make the access explicit, root must belong to the
> group
> > -# you've given access to.  This is potentially quite insecure.
> > -# If an autosign_file is specified, enabling permissive_pki_access will
> allow group access
> > -# to that specific file.
> > +# your pki_dir. To make the access explicit, root must belong to the
> group
> > +# you've given access to. This is potentially quite insecure. If an
> autosign_file
> > +# is specified, enabling permissive_pki_access will allow group access
> to that
> > +# specific file.
> >  #permissive_pki_access: False
> >
> >  # Allow users on the master access to execute specific commands on
> minions.
> >  # This setting should be treated with care since it opens up execution
> >  # capabilities to non root users. By default this capability is
> completely
> >  # disabled.
> > -#
> > -#client_acl:
> > +#pulisher_acl:
> >  #  larry:
> >  #    - test.ping
> >  #    - network.*
> >  #
> > -
> >  # Blacklist any of the following users or modules
> >  #
> >  # This example would blacklist all non sudo users, including root from
> >  # running any commands. It would also blacklist any use of the "cmd"
> > -# module.
> > -# This is completely disabled by default.
> > +# module. This is completely disabled by default.
> >  #
> > -#client_acl_blacklist:
> > +#publisher_acl_blacklist:
> >  #  users:
> >  #    - root
> >  #    - '^(?!sudo_).*$'   #  all non sudo users
> >  #  modules:
> >  #    - cmd
> > +#
> > +# WARNING: client_acl and client_acl_blacklist options are deprecated
> and will
> > +# be removed in the future releases. Use publisher_acl and
> > +# publisher_acl_blacklist instead.
> > +
> > +# Enforce publisher_acl & publisher_acl_blacklist when users have sudo
> > +# access to the salt command.
> > +#
> > +#sudo_acl: False
> >
> >  # The external auth system uses the Salt auth modules to authenticate
> and
> >  # validate users to access areas of the Salt system.
> > -#
> >  #external_auth:
> >  #  pam:
> >  #    fred:
> >  #      - test.*
> >  #
> > -
> >  # Time (in seconds) for a newly generated token to live. Default: 12
> hours
> >  #token_expire: 43200
> >
> > @@ -188,6 +313,10 @@
> >  # security purposes.
> >  #file_recv: False
> >
> > +# Set a hard-limit on the size of the files that can be pushed to the
> master.
> > +# It will be interpreted as megabytes. Default: 100
> > +#file_recv_max_size: 100
> > +
> >  # Signature verification on messages published from the master.
> >  # This causes the master to cryptographically sign all messages
> published to its event
> >  # bus, and minions then verify that signature before acting on the
> message.
> > @@ -199,20 +328,30 @@
> >  # no signature, it will still be accepted, and a warning message will
> be logged.
> >  # Conversely, if sign_pub_messages is False, but a minion receives a
> signed
> >  # message it will be accepted, the signature will not be checked, and a
> warning message
> > -# will be logged.  This behavior will go away in Salt 0.17.6 (or
> Hydrogen RC1, whichever
> > -# comes first) and these two situations will cause minion to throw an
> exception and
> > -# drop the message.
> > -#
> > +# will be logged. This behavior went away in Salt 2014.1.0 and these
> two situations
> > +# will cause minion to throw an exception and drop the message.
> >  # sign_pub_messages: False
> >
> > +#####     Salt-SSH Configuration     #####
> > +##########################################
> > +
> > +# Pass in an alternative location for the salt-ssh roster file
> > +#roster_file: /etc/salt/roster
> > +
> > +# Pass in minion option overrides that will be inserted into the SHIM
> for
> > +# salt-ssh calls. The local minion config is not used for salt-ssh. Can
> be
> > +# overridden on a per-minion basis in the roster (`minion_opts`)
> > +#ssh_minion_opts:
> > +#  gpg_keydir: /root/gpg
> > +
> >  #####    Master Module Management    #####
> >  ##########################################
> > -# Manage how master side modules are loaded
> > +# Manage how master side modules are loaded.
> >
> > -# Add any additional locations to look for master runners
> > +# Add any additional locations to look for master runners:
> >  #runner_dirs: []
> >
> > -# Enable Cython for master side modules
> > +# Enable Cython for master side modules:
> >  #cython_enable: False
> >
> >
> > @@ -226,6 +365,7 @@
> >  # The master_tops option replaces the external_nodes option by creating
> >  # a plugable system for the generation of external top data. The
> external_nodes
> >  # option is deprecated by the master_tops option.
> > +#
> >  # To gain the capabilities of the classic external_nodes system, use the
> >  # following configuration:
> >  # master_tops:
> > @@ -242,6 +382,19 @@
> >  # The renderer to use on the minions to render the state data
> >  #renderer: yaml_jinja
> >
> > +# The Jinja renderer can strip extra carriage returns and whitespace
> > +# See http://jinja.pocoo.org/docs/api/#high-level-api
> > +#
> > +# If this is set to True the first newline after a Jinja block is
> removed
> > +# (block, not variable tag!). Defaults to False, corresponds to the
> Jinja
> > +# environment init variable "trim_blocks".
> > +#jinja_trim_blocks: False
> > +#
> > +# If this is set to True leading spaces and tabs are stripped from the
> start
> > +# of a line to a block. Defaults to False, corresponds to the Jinja
> > +# environment init variable "lstrip_blocks".
> > +#jinja_lstrip_blocks: False
> > +
> >  # The failhard option tells the minions to stop immediately after the
> first
> >  # failure detected in the state execution, defaults to False
> >  #failhard: False
> > @@ -256,8 +409,22 @@
> >  # output for each changed state if set to 'full', but if set to 'terse'
> >  # the output will be shortened to a single line.  If set to 'mixed',
> the output
> >  # will be terse unless a state failed, in which case that output will
> be full.
> > +# If set to 'changes', the output will be full unless the state didn't
> change.
> >  #state_output: full
> >
> > +# Automatically aggregate all states that have support for
> mod_aggregate by
> > +# setting to 'True'. Or pass a list of state module names to
> automatically
> > +# aggregate just those types.
> > +#
> > +# state_aggregate:
> > +#   - pkg
> > +#
> > +#state_aggregate: False
> > +
> > +# Send progress events as each function in a state run completes
> execution
> > +# by setting to 'True'. Progress events are in the format
> > +# 'salt/job/<JID>/prog/<MID>/<RUN NUM>'.
> > +#state_events: False
> >
> >  #####      File Server settings      #####
> >  ##########################################
> > @@ -279,14 +446,34 @@
> >  #   prod:
> >  #     - /srv/salt/prod/services
> >  #     - /srv/salt/prod/states
> > -
> > +#
> >  #file_roots:
> >  #  base:
> >  #    - /srv/salt
> > +#
> > +
> > +# When using multiple environments, each with their own top file, the
> > +# default behaviour is an unordered merge. To prevent top files from
> > +# being merged together and instead to only use the top file from the
> > +# requested environment, set this value to 'same'.
> > +#top_file_merging_strategy: merge
> > +
> > +# To specify the order in which environments are merged, set the
> ordering
> > +# in the env_order option. Given a conflict, the last matching value
> will
> > +# win.
> > +#env_order: ['base', 'dev', 'prod']
> > +
> > +# If top_file_merging_strategy is set to 'same' and an environment does
> not
> > +# contain a top file, the top file in the environment specified by
> default_top
> > +# will be used instead.
> > +#default_top: base
> >
> >  # The hash_type is the hash to use when discovering the hash of a file
> on
> >  # the master server. The default is md5, but sha1, sha224, sha256,
> sha384
> >  # and sha512 are also supported.
> > +#
> > +# Prior to changing this value, the master should be stopped and all
> Salt
> > +# caches should be cleared.
> >  #hash_type: md5
> >
> >  # The buffer size in the file server can be adjusted here:
> > @@ -298,7 +485,6 @@
> >  # For example, if you manage your custom modules and states in
> subversion
> >  # and don't want all the '.svn' folders and content synced to your
> minions,
> >  # you could set this to '/\.svn($|/)'. By default nothing is ignored.
> > -#
> >  #file_ignore_regex:
> >  #  - '/\.svn($|/)'
> >  #  - '/\.git($|/)'
> > @@ -307,58 +493,83 @@
> >  # path before syncing the modules and states to the minions. This is
> similar
> >  # to file_ignore_regex above, but works on globs instead of regex. By
> default
> >  # nothing is ignored.
> > -#
> >  # file_ignore_glob:
> >  #  - '*.pyc'
> >  #  - '*/somefolder/*.bak'
> >  #  - '*.swp'
> >
> >  # File Server Backend
> > +#
> >  # Salt supports a modular fileserver backend system, this system allows
> >  # the salt master to link directly to third party systems to gather and
> >  # manage the files available to minions. Multiple backends can be
> >  # configured and will be searched for the requested file in the order
> in which
> >  # they are defined here. The default setting only enables the standard
> backend
> >  # "roots" which uses the "file_roots" option.
> > -#
> >  #fileserver_backend:
> >  #  - roots
> >  #
> >  # To use multiple backends list them in the order they are searched:
> > -#
> >  #fileserver_backend:
> >  #  - git
> >  #  - roots
> >  #
> > +# Uncomment the line below if you do not want the file_server to follow
> > +# symlinks when walking the filesystem tree. This is set to True
> > +# by default. Currently this only applies to the default roots
> > +# fileserver_backend.
> > +#fileserver_followsymlinks: False
> > +#
> > +# Uncomment the line below if you do not want symlinks to be
> > +# treated as the files they are pointing to. By default this is set to
> > +# False. By uncommenting the line below, any detected symlink while
> listing
> > +# files on the Master will not be returned to the Minion.
> > +#fileserver_ignoresymlinks: True
> > +#
> >  # By default, the Salt fileserver recurses fully into all defined
> environments
> >  # to attempt to find files. To limit this behavior so that the
> fileserver only
> >  # traverses directories with SLS files and special Salt directories
> like _modules,
> >  # enable the option below. This might be useful for installations where
> a file root
> >  # has a very large number of files and performance is impacted. Default
> is False.
> > -#
> >  # fileserver_limit_traversal: False
> >  #
> > -# Git fileserver backend configuration
> > +# The fileserver can fire events off every time the fileserver is
> updated,
> > +# these are disabled by default, but can be easily turned on by setting
> this
> > +# flag to True
> > +#fileserver_events: False
> > +
> > +# Git File Server Backend Configuration
> > +#
> > +# Gitfs can be provided by one of two python modules: GitPython or
> pygit2. If
> > +# using pygit2, both libgit2 and git must also be installed.
> > +#gitfs_provider: gitpython
> > +#
> >  # When using the git fileserver backend at least one git remote needs
> to be
> >  # defined. The user running the salt master will need read access to
> the repo.
> >  #
> > -#gitfs_remotes:
> > -#  - git://github.com/saltstack/salt-states.git
> > -#  - file:///var/git/saltmaster
> > -#
> >  # The repos will be searched in order to find the file requested by a
> client
> >  # and the first repo to have the file will return it.
> >  # When using the git backend branches and tags are translated into salt
> >  # environments.
> >  # Note:  file:// repos will be treated as a remote, so refs you want
> used must
> >  # exist in that repo as *local* refs.
> > +#gitfs_remotes:
> > +#  - git://github.com/saltstack/salt-states.git
> > +#  - file:///var/git/saltmaster
> > +#
> > +# The gitfs_ssl_verify option specifies whether to ignore ssl
> certificate
> > +# errors when contacting the gitfs backend. You might want to set this
> to
> > +# false if you're using a git backend that uses a self-signed
> certificate but
> > +# keep in mind that setting this flag to anything other than the
> default of True
> > +# is a security concern, you may want to try using the ssh transport.
> > +#gitfs_ssl_verify: True
> >  #
> >  # The gitfs_root option gives the ability to serve files from a
> subdirectory
> >  # within the repository. The path is defined relative to the root of the
> >  # repository and defaults to the repository root.
> >  #gitfs_root: somefolder/otherfolder
> > -
> > -
> > +#
> > +#
> >  #####         Pillar settings        #####
> >  ##########################################
> >  # Salt Pillars allow for the building of global data that can be made
> selectively
> > @@ -366,28 +577,59 @@
> >  # Pillar is laid out in the same fashion as the file server, with
> environments,
> >  # a top file and sls files. However, pillar data does not need to be in
> the
> >  # highstate format, and is generally just key/value pairs.
> > -
> >  #pillar_roots:
> >  #  base:
> >  #    - /srv/pillar
> > -
> > +#
> >  #ext_pillar:
> >  #  - hiera: /etc/hiera.yaml
> >  #  - cmd_yaml: cat /etc/salt/yaml
> >
> > +# The ext_pillar_first option allows for external pillar sources to
> populate
> > +# before file system pillar. This allows for targeting file system
> pillar from
> > +# ext_pillar.
> > +#ext_pillar_first: False
> > +
> > +# The pillar_gitfs_ssl_verify option specifies whether to ignore ssl
> certificate
> > +# errors when contacting the pillar gitfs backend. You might want to
> set this to
> > +# false if you're using a git backend that uses a self-signed
> certificate but
> > +# keep in mind that setting this flag to anything other than the
> default of True
> > +# is a security concern, you may want to try using the ssh transport.
> > +#pillar_gitfs_ssl_verify: True
> > +
> >  # The pillar_opts option adds the master configuration file data to a
> dict in
> >  # the pillar called "master". This is used to set simple configurations
> in the
> >  # master config file that can then be used on minions.
> > -#pillar_opts: True
> > +#pillar_opts: False
> > +
> > +# The pillar_safe_render_error option prevents the master from passing
> pillar
> > +# render errors to the minion. This is set on by default because the
> error could
> > +# contain templating data which would give that minion information it
> shouldn't
> > +# have, like a password! When set true the error message will only show:
> > +#   Rendering SLS 'my.sls' failed. Please see master log for details.
> > +#pillar_safe_render_error: True
> > +
> > +# The pillar_source_merging_strategy option allows you to configure
> merging strategy
> > +# between different sources. It accepts four values: recurse,
> aggregate, overwrite,
> > +# or smart. Recurse will merge recursively mapping of data. Aggregate
> instructs
> > +# aggregation of elements between sources that use the #!yamlex
> renderer. Overwrite
> > +# will verwrite elements according the order in which they are
> processed. This is
> > +# behavior of the 2014.1 branch and earlier. Smart guesses the best
> strategy based
> > +# on the "renderer" setting and is the default value.
> > +#pillar_source_merging_strategy: smart
> > +
> > +# Recursively merge lists by aggregating them instead of replacing them.
> > +#pillar_merge_lists: False
> >
> >
> >  #####          Syndic settings       #####
> >  ##########################################
> >  # The Salt syndic is used to pass commands through a master from a
> higher
> > -# master. Using the syndic is simple, if this is a master that will have
> > -# syndic servers(s) below it set the "order_masters" setting to True,
> if this
> > -# is a master that will be running a syndic daemon for passthrough the
> > -# "syndic_master" setting needs to be set to the location of the master
> server
> > +# master. Using the syndic is simple. If this is a master that will have
> > +# syndic servers(s) below it, then set the "order_masters" setting to
> True.
> > +#
> > +# If this is a master that will be running a syndic daemon for
> passthrough, then
> > +# the "syndic_master" setting needs to be set to the location of the
> master server
> >  # to receive commands from.
> >
> >  # Set the order_masters setting to True if this master will command
> lower
> > @@ -398,15 +640,16 @@
> >  # this master where to receive commands from.
> >  #syndic_master: masterofmaster
> >
> > -# This is the 'ret_port' of the MasterOfMaster
> > +# This is the 'ret_port' of the MasterOfMaster:
> >  #syndic_master_port: 4506
> >
> > -# PID file of the syndic daemon
> > +# PID file of the syndic daemon:
> >  #syndic_pidfile: /var/run/salt-syndic.pid
> >
> > -# LOG file of the syndic daemon
> > +# LOG file of the syndic daemon:
> >  #syndic_log_file: syndic.log
> >
> > +
> >  #####      Peer Publish settings     #####
> >  ##########################################
> >  # Salt minions can send commands to other minions, but only if the
> minion is
> > @@ -418,14 +661,12 @@
> >  # of regular expressions to match functions. The following will allow
> the
> >  # minion authenticated as foo.example.com to execute functions from
> the test
> >  # and pkg modules.
> > -#
> >  #peer:
> >  #  foo.example.com:
> >  #    - test.*
> >  #    - pkg.*
> >  #
> >  # This will allow all minions to execute all commands:
> > -#
> >  #peer:
> >  #  .*:
> >  #    - .*
> > @@ -440,16 +681,34 @@
> >  #
> >  # All peer runner support is turned off by default and must be enabled
> before
> >  # using. This will enable all peer runners for all minions:
> > -#
> >  #peer_run:
> >  #  .*:
> >  #    - .*
> >  #
> >  # To enable just the manage.up runner for the minion foo.example.com:
> > -#
> >  #peer_run:
> >  #  foo.example.com:
> >  #    - manage.up
> > +#
> > +#
> > +#####         Mine settings     #####
> > +#####################################
> > +# Restrict mine.get access from minions. By default any minion has a
> full access
> > +# to get all mine data from master cache. In acl definion below, only
> pcre matches
> > +# are allowed.
> > +# mine_get:
> > +#   .*:
> > +#     - .*
> > +#
> > +# The example below enables minion foo.example.com to get
> 'network.interfaces' mine
> > +# data only, minions web* to get all network.* and disk.* mine data and
> all other
> > +# minions won't get any mine data.
> > +# mine_get:
> > +#   foo.example.com:
> > +#     - network.interfaces
> > +#   web.*:
> > +#     - network.*
> > +#     - disk.*
> >
> >
> >  #####         Logging settings       #####
> > @@ -468,10 +727,15 @@
> >
> >  # The level of messages to send to the console.
> >  # One of 'garbage', 'trace', 'debug', info', 'warning', 'error',
> 'critical'.
> > +#
> > +# The following log levels are considered INSECURE and may log
> sensitive data:
> > +# ['garbage', 'trace', 'debug']
> > +#
> >  #log_level: warning
> >
> >  # The level of messages to send to the log file.
> >  # One of 'garbage', 'trace', 'debug', info', 'warning', 'error',
> 'critical'.
> > +# If using 'log_granular_levels' this must be set to the highest
> desired level.
> >  #log_level_logfile: warning
> >
> >  # The date and time format used in log messages. Allowed date/time
> formating
> > @@ -481,24 +745,37 @@
> >
> >  # The format of the console logging messages. Allowed formatting
> options can
> >  # be seen here:
> http://docs.python.org/library/logging.html#logrecord-attributes
> > +#
> > +# Console log colors are specified by these additional formatters:
> > +#
> > +# %(colorlevel)s
> > +# %(colorname)s
> > +# %(colorprocess)s
> > +# %(colormsg)s
> > +#
> > +# Since it is desirable to include the surrounding brackets, '[' and
> ']', in
> > +# the coloring of the messages, these color formatters also include
> padding as
> > +# well.  Color LogRecord attributes are only available for console
> logging.
> > +#
> > +#log_fmt_console: '%(colorlevel)s %(colormsg)s'
> >  #log_fmt_console: '[%(levelname)-8s] %(message)s'
> > +#
> >  #log_fmt_logfile: '%(asctime)s,%(msecs)03.0f
> [%(name)-17s][%(levelname)-8s] %(message)s'
> >
> >  # This can be used to control logging levels more specificically.  This
> >  # example sets the main salt library at the 'warning' level, but sets
> >  # 'salt.modules' to log at the 'debug' level:
> >  #   log_granular_levels:
> > -#     'salt': 'warning',
> > +#     'salt': 'warning'
> >  #     'salt.modules': 'debug'
> >  #
> >  #log_granular_levels: {}
> >
> >
> > -#####         Node Groups           #####
> > +#####         Node Groups           ######
> >  ##########################################
> > -# Node groups allow for logical groupings of minion nodes.
> > -# A group consists of a group name and a compound target.
> > -#
> > +# Node groups allow for logical groupings of minion nodes. A group
> consists of a group
> > +# name and a compound target.
> >  #nodegroups:
> >  #  group1: 'L@foo.domain.com,bar.domain.com,baz.domain.com and bl*.
> domain.com'
> >  #  group2: 'G@os:Debian and foo.domain.com'
> > @@ -507,19 +784,43 @@
> >  #####     Range Cluster settings     #####
> >  ##########################################
> >  # The range server (and optional port) that serves your cluster
> information
> > -#
> https://github.com/grierj/range/wiki/Introduction-to-Range-with-YAML-files
> > +#
> https://github.com/ytoolshed/range/wiki/%22yamlfile%22-module-file-spec
> >  #
> >  #range_server: range:80
> >
> >
> > -#####     Windows Software Repo settings #####
> > -##############################################
> > -# Location of the repo on the master
> > -#win_repo: '/srv/salt/win/repo'
> > +#####  Windows Software Repo settings #####
> > +###########################################
> > +# Location of the repo on the master:
> > +#winrepo_dir_ng: '/srv/salt/win/repo-ng'
> > +#
> > +# List of git repositories to include with the local repo:
> > +#winrepo_remotes_ng:
> > +#  - 'https://github.com/saltstack/salt-winrepo-ng.git'
> >
> > -# Location of the master's repo cache file
> > -#win_repo_mastercachefile: '/srv/salt/win/repo/winrepo.p'
> >
> > -# List of git repositories to include with the local repo
> > -#win_gitrepos:
> > +#####  Windows Software Repo settings - Pre 2015.8 #####
> > +########################################################
> > +# Legacy repo settings for pre-2015.8 Windows minions.
> > +#
> > +# Location of the repo on the master:
> > +#winrepo_dir: '/srv/salt/win/repo'
> > +#
> > +# Location of the master's repo cache file:
> > +#winrepo_mastercachefile: '/srv/salt/win/repo/winrepo.p'
> > +#
> > +# List of git repositories to include with the local repo:
> > +#winrepo_remotes:
> >  #  - 'https://github.com/saltstack/salt-winrepo.git'
> > +
> > +
> > +#####      Returner settings          ######
> > +############################################
> > +# Which returner(s) will be used for minion's result:
> > +#return: mysql
> > +
> > +
> > +######    Miscellaneous  settings     ######
> > +############################################
> > +# Default match type for filtering events tags: startswith, endswith,
> find, regex, fnmatch
> > +#event_match_type: startswith
> > diff --git a/meta-openstack/recipes-support/salt/files/minion
> b/meta-openstack/recipes-support/salt/files/minion
> > index 8fdde14..bd97c43 100644
> > --- a/meta-openstack/recipes-support/salt/files/minion
> > +++ b/meta-openstack/recipes-support/salt/files/minion
> > @@ -1,16 +1,52 @@
> >  ##### Primary configuration settings #####
> >  ##########################################
> > +# This configuration file is used to manage the behavior of the Salt
> Minion.
> > +# With the exception of the location of the Salt Master Server, values
> that are
> > +# commented out but have an empty line after the comment are defaults
> that need
> > +# not be set in the config. If there is no blank line after the
> comment, the
> > +# value is presented as an example and is not the default.
> >
> >  # Per default the minion will automatically include all config files
> >  # from minion.d/*.conf (minion.d is a directory in the same directory
> >  # as the main minion config file).
> >  #default_include: minion.d/*.conf
> >
> > -# Set the location of the salt master server, if the master server
> cannot be
> > +# Set the location of the salt master server. If the master server
> cannot be
> >  # resolved, then the minion will fail to start.
> >  #master: salt
> >
> > -# Set whether the minion should connect to the master via IPv6
> > +# Set http proxy information for the minion when doing requests
> > +#proxy_host:
> > +#proxy_port:
> > +#proxy_username:
> > +#proxy_password:
> > +
> > +# If multiple masters are specified in the 'master' setting, the
> default behavior
> > +# is to always try to connect to them in the order they are listed. If
> random_master is
> > +# set to True, the order will be randomized instead. This can be
> helpful in distributing
> > +# the load of many minions executing salt-call requests, for example,
> from a cron job.
> > +# If only one master is listed, this setting is ignored and a warning
> will be logged.
> > +# NOTE: If master_type is set to failover, use master_shuffle instead.
> > +#random_master: False
> > +
> > +# Use if master_type is set to failover.
> > +#master_shuffle: False
> > +
> > +# Minions can connect to multiple masters simultaneously (all masters
> > +# are "hot"), or can be configured to failover if a master becomes
> > +# unavailable.  Multiple hot masters are configured by setting this
> > +# value to "str".  Failover masters can be requested by setting
> > +# to "failover".  MAKE SURE TO SET master_alive_interval if you are
> > +# using failover.
> > +# master_type: str
> > +
> > +# Poll interval in seconds for checking if the master is still there.
> Only
> > +# respected if master_type above is "failover". To disable the interval
> entirely,
> > +# set the value to -1. (This may be necessary on machines which have
> high numbers
> > +# of TCP connections, such as load balancers.)
> > +# master_alive_interval: 30
> > +
> > +# Set whether the minion should connect to the master via IPv6:
> >  #ipv6: False
> >
> >  # Set the number of seconds to wait before attempting to resolve
> > @@ -18,13 +54,19 @@
> >  # Set to zero if the minion should shutdown and not retry.
> >  # retry_dns: 30
> >
> > -# Set the port used by the master reply and authentication server
> > +# Set the port used by the master reply and authentication server.
> >  #master_port: 4506
> >
> > -# The user to run salt
> > +# The user to run salt.
> >  #user: root
> >
> > -# Specify the location of the daemon process ID file
> > +# Setting sudo_user will cause salt to run all execution modules under
> an sudo
> > +# to the user given in sudo_user.  The user under which the salt minion
> process
> > +# itself runs will still be that provided in the user config above, but
> all
> > +# execution modules run by the minion will be rerouted through sudo.
> > +#sudo_user: saltdev
> > +
> > +# Specify the location of the daemon process ID file.
> >  #pidfile: /var/run/salt-minion.pid
> >
> >  # The root directory prepended to these options: pki_dir, cachedir,
> log_file,
> > @@ -48,7 +90,7 @@
> >
> >  # Custom static grains for this minion can be specified here and used
> in SLS
> >  # files just like all other grains. This example sets 4 custom grains,
> with
> > -# the 'roles' grain having two values that can be matched against:
> > +# the 'roles' grain having two values that can be matched against.
> >  #grains:
> >  #  roles:
> >  #    - webserver
> > @@ -56,36 +98,40 @@
> >  #  deployment: datacenter4
> >  #  cabinet: 13
> >  #  cab_u: 14-15
> > -
> > -# Where cache data goes
> > +#
> > +# Where cache data goes.
> > +# This data may contain sensitive data and should be protected
> accordingly.
> >  #cachedir: /var/cache/salt/minion
> >
> > -# Verify and set permissions on configuration directories at startup
> > +# Verify and set permissions on configuration directories at startup.
> >  #verify_env: True
> >
> >  # The minion can locally cache the return data from jobs sent to it,
> this
> >  # can be a good way to keep track of jobs the minion has executed
> > -# (on the minion side). By default this feature is disabled, to enable
> > -# set cache_jobs to True
> > +# (on the minion side). By default this feature is disabled, to enable,
> set
> > +# cache_jobs to True.
> >  #cache_jobs: False
> >
> > -# set the directory used to hold unix sockets
> > +# Set the directory used to hold unix sockets.
> >  #sock_dir: /var/run/salt/minion
> >
> >  # Set the default outputter used by the salt-call command. The default
> is
> > -# "nested"
> > +# "nested".
> >  #output: nested
> >  #
> > -# By default output is colored, to disable colored output set the color
> value
> > -# to False
> > +# By default output is colored. To disable colored output, set the
> color value
> > +# to False.
> >  #color: True
> >
> > +# Do not strip off the colored output from nested results and state
> outputs
> > +# (true by default).
> > +# strip_colors: False
> > +
> >  # Backup files that are replaced by file.managed and file.recurse under
> >  # 'cachedir'/file_backups relative to their original location and
> appended
> >  # with a timestamp. The only valid setting is "minion". Disabled by
> default.
> >  #
> >  # Alternatively this can be specified for each file in state files:
> > -#
> >  # /etc/ssh/sshd_config:
> >  #   file.managed:
> >  #     - source: salt://ssh/sshd_config
> > @@ -103,27 +149,55 @@
> >  # set to zero, the time between reconnection attempts will stay
> constant.
> >  #acceptance_wait_time_max: 0
> >
> > +# If the master rejects the minion's public key, retry instead of
> exiting.
> > +# Rejected keys will be handled the same as waiting on acceptance.
> > +#rejected_retry: False
> > +
> >  # When the master key changes, the minion will try to re-auth itself to
> receive
> >  # the new master key. In larger environments this can cause a SYN flood
> on the
> >  # master because all minions try to re-auth immediately. To prevent
> this and
> >  # have a minion wait for a random amount of time, use this optional
> parameter.
> > -# The wait-time will be a random number of seconds between
> > -# 0 and the defined value.
> > +# The wait-time will be a random number of seconds between 0 and the
> defined value.
> >  #random_reauth_delay: 60
> >
> > +# When waiting for a master to accept the minion's public key, salt will
> > +# continuously attempt to reconnect until successful. This is the
> timeout value,
> > +# in seconds, for each individual attempt. After this timeout expires,
> the minion
> > +# will wait for acceptance_wait_time seconds before trying again.
> Unless your master
> > +# is under unusually heavy load, this should be left at the default.
> > +#auth_timeout: 60
> > +
> > +# Number of consecutive SaltReqTimeoutError that are acceptable when
> trying to
> > +# authenticate.
> > +#auth_tries: 7
> > +
> > +# If authentication fails due to SaltReqTimeoutError during a
> ping_interval,
> > +# cause sub minion process to restart.
> > +#auth_safemode: False
> > +
> > +# Ping Master to ensure connection is alive (minutes).
> > +#ping_interval: 0
> > +
> > +# To auto recover minions if master changes IP address (DDNS)
> > +#    auth_tries: 10
> > +#    auth_safemode: False
> > +#    ping_interval: 90
> > +#
> > +# Minions won't know master is missing until a ping fails. After the
> ping fail,
> > +# the minion will attempt authentication and likely fails out and cause
> a restart.
> > +# When the minion restarts it will resolve the masters IP and attempt
> to reconnect.
> >
> > -# If you don't have any problems with syn-floods, dont bother with the
> > +# If you don't have any problems with syn-floods, don't bother with the
> >  # three recon_* settings described below, just leave the defaults!
> >  #
> >  # The ZeroMQ pull-socket that binds to the masters publishing interface
> tries
> >  # to reconnect immediately, if the socket is disconnected (for example
> if
> >  # the master processes are restarted). In large setups this will have
> all
> >  # minions reconnect immediately which might flood the master (the
> ZeroMQ-default
> > -# is usually a 100ms delay). To prevent this, these three recon_*
> settings
> > +# is usually a 100ms delay). To prevent this, these three recon_*
> settings
> >  # can be used.
> > -#
> > -# recon_default: the interval in milliseconds that the socket should
> wait before
> > -#                trying to reconnect to the master (100ms = 1 second)
> > +# recon_default: the interval in milliseconds that the socket should
> wait before
> > +#                trying to reconnect to the master (1000ms = 1 second)
> >  #
> >  # recon_max: the maximum time a socket should wait. each interval the
> time to wait
> >  #            is calculated by doubling the previous time. if recon_max
> is reached,
> > @@ -136,29 +210,26 @@
> >  #            reconnect 5: value from previous interval * 2
> >  #            reconnect x: if value >= recon_max, it starts again with
> recon_default
> >  #
> > -# recon_randomize: generate a random wait time on minion start. The
> wait time will
> > -#                  be a random value between recon_default and
> recon_default +
> > -#                  recon_max. Having all minions reconnect with the
> same recon_default
> > -#                  and recon_max value kind of defeats the purpose of
> being able to
> > -#                  change these settings. If all minions have the same
> values and your
> > -#                  setup is quite large (several thousand minions),
> they will still
> > -#                  flood the master. The desired behaviour is to have
> timeframe within
> > -#                  all minions try to reconnect.
> > -
> > -# Example on how to use these settings:
> > -# The goal: have all minions reconnect within a 60 second timeframe on
> a disconnect
> > -#
> > -# The settings:
> > -#recon_default: 1000
> > -#recon_max: 59000
> > -#recon_randomize: True
> > +# recon_randomize: generate a random wait time on minion start. The
> wait time will
> > +#                  be a random value between recon_default and
> recon_default +
> > +#                  recon_max. Having all minions reconnect with the
> same recon_default
> > +#                  and recon_max value kind of defeats the purpose of
> being able to
> > +#                  change these settings. If all minions have the same
> values and your
> > +#                  setup is quite large (several thousand minions),
> they will still
> > +#                  flood the master. The desired behavior is to have
> timeframe within
> > +#                  all minions try to reconnect.
> > +#
> > +# Example on how to use these settings. The goal: have all minions
> reconnect within a
> > +# 60 second timeframe on a disconnect.
> > +# recon_default: 1000
> > +# recon_max: 59000
> > +# recon_randomize: True
> >  #
> >  # Each minion will have a randomized reconnect value between
> 'recon_default'
> >  # and 'recon_default + recon_max', which in this example means between
> 1000ms
> > -# 60000ms (or between 1 and 60 seconds). The generated random-value
> will be
> > -# doubled after each attempt to reconnect. Lets say the generated random
> > -# value is 11 seconds (or 11000ms).
> > -#
> > +# 60000ms (or between 1 and 60 seconds). The generated random-value
> will be
> > +# doubled after each attempt to reconnect. Lets say the generated random
> > +# value is 11 seconds (or 11000ms).
> >  # reconnect 1: wait 11 seconds
> >  # reconnect 2: wait 22 seconds
> >  # reconnect 3: wait 33 seconds
> > @@ -172,29 +243,68 @@
> >  #
> >  # In a setup with ~6000 thousand hosts these settings would average the
> reconnects
> >  # to about 100 per second and all hosts would be reconnected within 60
> seconds.
> > -#recon_default: 100
> > -#recon_max: 5000
> > -#recon_randomize: False
> > -
> > +# recon_default: 100
> > +# recon_max: 5000
> > +# recon_randomize: False
> > +#
> > +#
> >  # The loop_interval sets how long in seconds the minion will wait
> between
> >  # evaluating the scheduler and running cleanup tasks. This defaults to a
> >  # sane 60 seconds, but if the minion scheduler needs to be evaluated
> more
> >  # often lower this value
> >  #loop_interval: 60
> >
> > -# When healing, a dns_check is run. This is to make sure that the
> originally
> > -# resolved dns has not changed. If this is something that does not
> happen in
> > -# your environment, set this value to False.
> > -#dns_check: True
> > +# The grains can be merged, instead of overridden, using this option.
> > +# This allows custom grains to defined different subvalues of a
> dictionary
> > +# grain. By default this feature is disabled, to enable set
> grains_deep_merge
> > +# to ``True``.
> > +#grains_deep_merge: False
> > +
> > +# The grains_refresh_every setting allows for a minion to periodically
> check
> > +# its grains to see if they have changed and, if so, to inform the
> master
> > +# of the new grains. This operation is moderately expensive, therefore
> > +# care should be taken not to set this value too low.
> > +#
> > +# Note: This value is expressed in __minutes__!
> > +#
> > +# A value of 10 minutes is a reasonable default.
> > +#
> > +# If the value is set to zero, this check is disabled.
> > +#grains_refresh_every: 1
> > +
> > +# Cache grains on the minion. Default is False.
> > +#grains_cache: False
> > +
> > +# Cache rendered pillar data on the minion. Default is False.
> > +# This may cause 'cachedir'/pillar to contain sensitive data that
> should be
> > +# protected accordingly.
> > +#minion_pillar_cache: False
> > +
> > +# Grains cache expiration, in seconds. If the cache file is older than
> this
> > +# number of seconds then the grains cache will be dumped and fully
> re-populated
> > +# with fresh data. Defaults to 5 minutes. Will have no effect if
> 'grains_cache'
> > +# is not enabled.
> > +# grains_cache_expiration: 300
> >
> >  # Windows platforms lack posix IPC and must rely on slower TCP based
> inter-
> >  # process communications. Set ipc_mode to 'tcp' on such systems
> >  #ipc_mode: ipc
> > -#
> > +
> >  # Overwrite the default tcp ports used by the minion when in tcp mode
> >  #tcp_pub_port: 4510
> >  #tcp_pull_port: 4511
> >
> > +# Passing very large events can cause the minion to consume large
> amounts of
> > +# memory. This value tunes the maximum size of a message allowed onto
> the
> > +# minion event bus. The value is expressed in bytes.
> > +#max_event_size: 1048576
> > +
> > +# To detect failed master(s) and fire events on connect/disconnect, set
> > +# master_alive_interval to the number of seconds to poll the masters for
> > +# connection events.
> > +#
> > +#master_alive_interval: 30
> > +
> >  # The minion can include configuration from other files. To enable this,
> >  # pass a list of paths to this option. The paths can be either relative
> or
> >  # absolute; if relative, they are considered to be relative to the
> directory
> > @@ -202,7 +312,6 @@
> >  # of shell-style globbing. If no files are matched by a path passed to
> this
> >  # option then the minion will log a warning message.
> >  #
> > -#
> >  # Include a config file from some other path:
> >  # include: /etc/salt/extra_config
> >  #
> > @@ -210,11 +319,13 @@
> >  #include:
> >  #  - /etc/salt/extra_config
> >  #  - /etc/roles/webserver
> > -
> > +#
> > +#
> > +#
> >  #####   Minion module management     #####
> >  ##########################################
> >  # Disable specific modules. This allows the admin to limit the level of
> > -# access the master has to the minion
> > +# access the master has to the minion.
> >  #disable_modules: [cmd,test]
> >  #disable_returners: []
> >  #
> > @@ -226,18 +337,22 @@
> >  #returner_dirs: []
> >  #states_dirs: []
> >  #render_dirs: []
> > +#utils_dirs: []
> >  #
> >  # A module provider can be statically overwritten or extended for the
> minion
> >  # via the providers option, in this case the default module will be
> >  # overwritten by the specified module. In this example the pkg module
> will
> >  # be provided by the yumpkg5 module instead of the system default.
> > -#
> >  #providers:
> >  #  pkg: yumpkg5
> >  #
> >  # Enable Cython modules searching and loading. (Default: False)
> >  #cython_enable: False
> >  #
> > +# Specify a max size (in bytes) for modules on import. This feature is
> currently
> > +# only supported on *nix operating systems and requires psutil.
> > +# modules_max_memory: -1
> > +
> >
> >  #####    State Management Settings    #####
> >  ###########################################
> > @@ -256,21 +371,19 @@
> >  #renderer: yaml_jinja
> >  #
> >  # The failhard option tells the minions to stop immediately after the
> first
> > -# failure detected in the state execution, defaults to False
> > +# failure detected in the state execution. Defaults to False.
> >  #failhard: False
> >  #
> > -# autoload_dynamic_modules Turns on automatic loading of modules found
> in the
> > -# environments on the master. This is turned on by default, to turn of
> > -# autoloading modules when states run set this value to False
> > +# Reload the modules prior to a highstate run.
> >  #autoload_dynamic_modules: True
> >  #
> >  # clean_dynamic_modules keeps the dynamic modules on the minion in sync
> with
> >  # the dynamic modules on the master, this means that if a dynamic
> module is
> > -# not on the master it will be deleted from the minion. By default this
> is
> > -# enabled and can be disabled by changing this value to False
> > +# not on the master it will be deleted from the minion. By default,
> this is
> > +# enabled and can be disabled by changing this value to False.
> >  #clean_dynamic_modules: True
> >  #
> > -# Normally the minion is not isolated to any single environment on the
> master
> > +# Normally, the minion is not isolated to any single environment on the
> master
> >  # when running states, but the environment can be isolated on the
> minion side
> >  # by statically setting it. Remember that the recommended way to manage
> >  # environments is to isolate via the top file.
> > @@ -286,14 +399,23 @@
> >  # 'top' -- Read top_file option and execute based on that file on the
> Master
> >  #startup_states: ''
> >  #
> > -# list of states to run when the minion starts up if startup_states is
> 'sls'
> > +# List of states to run when the minion starts up if startup_states is
> 'sls':
> >  #sls_list:
> >  #  - edit.vim
> >  #  - hyper
> >  #
> > -# top file to execute if startup_states is 'top'
> > +# Top file to execute if startup_states is 'top':
> >  #top_file: ''
> >
> > +# Automatically aggregate all states that have support for
> mod_aggregate by
> > +# setting to True. Or pass a list of state module names to automatically
> > +# aggregate just those types.
> > +#
> > +# state_aggregate:
> > +#   - pkg
> > +#
> > +#state_aggregate: False
> > +
> >  #####     File Directory Settings    #####
> >  ##########################################
> >  # The Salt Minion can redirect all file server operations to a local
> directory,
> > @@ -303,7 +425,8 @@
> >
> >  # Set the file client. The client defaults to looking on the master
> server for
> >  # files, but can be directed to look at the local file directory setting
> > -# defined below by setting it to local.
> > +# defined below by setting it to "local". Setting a local file_client
> runs the
> > +# minion in masterless mode.
> >  #file_client: remote
> >
> >  # The file directory works on environments passed to the minion, each
> environment
> > @@ -329,15 +452,16 @@
> >  # to attempt to find files. To limit this behavior so that the
> fileserver only
> >  # traverses directories with SLS files and special Salt directories
> like _modules,
> >  # enable the option below. This might be useful for installations where
> a file root
> > -# has a very large number of files and performance is negatively
> impacted.
> > -#
> > -# Default is False.
> > -#
> > -# fileserver_limit_traversal: False
> > +# has a very large number of files and performance is negatively
> impacted. Default
> > +# is False.
> > +#fileserver_limit_traversal: False
> >
> >  # The hash_type is the hash to use when discovering the hash of a file
> in
> >  # the local fileserver. The default is md5, but sha1, sha224, sha256,
> sha384
> >  # and sha512 are also supported.
> > +#
> > +# Warning: Prior to changing this value, the minion should be stopped
> and all
> > +# Salt caches should be cleared.
> >  #hash_type: md5
> >
> >  # The Salt pillar is searched for locally if file_client is set to
> local. If
> > @@ -346,7 +470,8 @@
> >  #pillar_roots:
> >  #  base:
> >  #    - /srv/pillar
> > -
> > +#
> > +#
> >  ######        Security settings       #####
> >  ###########################################
> >  # Enable "open mode", this mode still maintains encryption, but turns
> off
> > @@ -366,23 +491,34 @@
> >  # The state_verbose setting can be set to True or False, when set to
> False
> >  # all data that has a result of True and no changes will be suppressed.
> >  #state_verbose: True
> > -#
> > +
> >  # The state_output setting changes if the output is the full multi line
> >  # output for each changed state if set to 'full', but if set to 'terse'
> >  # the output will be shortened to a single line.
> >  #state_output: full
> > -#
> > -# Fingerprint of the master public key to double verify the master is
> valid,
> > -# the master fingerprint can be found by running "salt-key -F master"
> on the
> > -# salt master.
> > +
> > +# The state_output_diff setting changes whether or not the output from
> > +# successful states is returned. Useful when even the terse output of
> these
> > +# states is cluttering the logs. Set it to True to ignore them.
> > +#state_output_diff: False
> > +
> > +# The state_output_profile setting changes whether profile information
> > +# will be shown for each state run.
> > +#state_output_profile: True
> > +
> > +# Fingerprint of the master public key to validate the identity of your
> Salt master
> > +# before the initial key exchange. The master fingerprint can be found
> by running
> > +# "salt-key -F master" on the Salt master.
> >  #master_finger: ''
> >
> > +
> >  ######         Thread settings        #####
> >  ###########################################
> >  # Disable multiprocessing support, by default when a minion receives a
> >  # publication a new process is spawned and the command is executed
> therein.
> >  #multiprocessing: True
> >
> > +
> >  #####         Logging settings       #####
> >  ##########################################
> >  # The location of the minion log file
> > @@ -396,14 +532,19 @@
> >  #
> >  #log_file: /var/log/salt/minion
> >  #key_logfile: /var/log/salt/key
> > -#
> > +
> >  # The level of messages to send to the console.
> >  # One of 'garbage', 'trace', 'debug', info', 'warning', 'error',
> 'critical'.
> > +#
> > +# The following log levels are considered INSECURE and may log
> sensitive data:
> > +# ['garbage', 'trace', 'debug']
> > +#
> >  # Default: 'warning'
> >  #log_level: warning
> > -#
> > +
> >  # The level of messages to send to the log file.
> >  # One of 'garbage', 'trace', 'debug', info', 'warning', 'error',
> 'critical'.
> > +# If using 'log_granular_levels' this must be set to the highest
> desired level.
> >  # Default: 'warning'
> >  #log_level_logfile:
> >
> > @@ -411,21 +552,54 @@
> >  # can be seen here:
> http://docs.python.org/library/time.html#time.strftime
> >  #log_datefmt: '%H:%M:%S'
> >  #log_datefmt_logfile: '%Y-%m-%d %H:%M:%S'
> > -#
> > +
> >  # The format of the console logging messages. Allowed formatting
> options can
> >  # be seen here:
> http://docs.python.org/library/logging.html#logrecord-attributes
> > +#
> > +# Console log colors are specified by these additional formatters:
> > +#
> > +# %(colorlevel)s
> > +# %(colorname)s
> > +# %(colorprocess)s
> > +# %(colormsg)s
> > +#
> > +# Since it is desirable to include the surrounding brackets, '[' and
> ']', in
> > +# the coloring of the messages, these color formatters also include
> padding as
> > +# well.  Color LogRecord attributes are only available for console
> logging.
> > +#
> > +#log_fmt_console: '%(colorlevel)s %(colormsg)s'
> >  #log_fmt_console: '[%(levelname)-8s] %(message)s'
> > -#log_fmt_logfile: '%(asctime)s,%(msecs)03.0f
> [%(name)-17s][%(levelname)-8s] %(message)s'
> >  #
> > +#log_fmt_logfile: '%(asctime)s,%(msecs)03.0f
> [%(name)-17s][%(levelname)-8s] %(message)s'
> > +
> >  # This can be used to control logging levels more specificically.  This
> >  # example sets the main salt library at the 'warning' level, but sets
> >  # 'salt.modules' to log at the 'debug' level:
> >  #   log_granular_levels:
> > -#     'salt': 'warning',
> > +#     'salt': 'warning'
> >  #     'salt.modules': 'debug'
> >  #
> >  #log_granular_levels: {}
> >
> > +# To diagnose issues with minions disconnecting or missing returns,
> ZeroMQ
> > +# supports the use of monitor sockets to log connection events. This
> > +# feature requires ZeroMQ 4.0 or higher.
> > +#
> > +# To enable ZeroMQ monitor sockets, set 'zmq_monitor' to 'True' and log
> at a
> > +# debug level or higher.
> > +#
> > +# A sample log event is as follows:
> > +#
> > +# [DEBUG   ] ZeroMQ event: {'endpoint': 'tcp://127.0.0.1:4505',
> 'event': 512,
> > +# 'value': 27, 'description': 'EVENT_DISCONNECTED'}
> > +#
> > +# All events logged will include the string 'ZeroMQ event'. A
> connection event
> > +# should be logged as the minion starts up and initially connects to the
> > +# master. If not, check for debug log level and that the necessary
> version of
> > +# ZeroMQ is installed.
> > +#
> > +#zmq_monitor: False
> > +
> >  ######      Module configuration      #####
> >  ###########################################
> >  # Salt allows for modules to be passed arbitrary configuration data,
> any data
> > @@ -445,8 +619,8 @@
> >  #
> >  # A dict for the test module:
> >  #test.baz: {spam: sausage, cheese: bread}
> > -
> > -
> > +#
> > +#
> >  ######      Update settings          ######
> >  ###########################################
> >  # Using the features in Esky, a salt minion can both run as a frozen
> app and
> > @@ -468,27 +642,39 @@
> >  # the risk that it could tear down the connection the master and minion
> >  # without informing either party that their connection has been taken
> away.
> >  # Enabling TCP Keepalives prevents this from happening.
> > -#
> > +
> >  # Overall state of TCP Keepalives, enable (1 or True), disable (0 or
> False)
> >  # or leave to the OS defaults (-1), on Linux, typically disabled.
> Default True, enabled.
> >  #tcp_keepalive: True
> > -#
> > +
> >  # How long before the first keepalive should be sent in seconds.
> Default 300
> >  # to send the first keepalive after 5 minutes, OS default (-1) is
> typically 7200 seconds
> >  # on Linux see /proc/sys/net/ipv4/tcp_keepalive_time.
> >  #tcp_keepalive_idle: 300
> > -#
> > +
> >  # How many lost probes are needed to consider the connection lost.
> Default -1
> >  # to use OS defaults, typically 9 on Linux, see
> /proc/sys/net/ipv4/tcp_keepalive_probes.
> >  #tcp_keepalive_cnt: -1
> > -#
> > +
> >  # How often, in seconds, to send keepalives after the first one.
> Default -1 to
> >  # use OS defaults, typically 75 seconds on Linux, see
> >  # /proc/sys/net/ipv4/tcp_keepalive_intvl.
> >  #tcp_keepalive_intvl: -1
> >
> >
> > -######      Windows Software settings ######
> > +######   Windows Software settings    ######
> >  ############################################
> > -# Location of the repository cache file on the master
> > +# Location of the repository cache file on the master:
> >  #win_repo_cachefile: 'salt://win/repo/winrepo.p'
> > +
> > +
> > +######      Returner  settings        ######
> > +############################################
> > +# Which returner(s) will be used for minion's result:
> > +#return: mysql
> > +
> > +
> > +######    Miscellaneous  settings     ######
> > +############################################
> > +# Default match type for filtering events tags: startswith, endswith,
> find, regex, fnmatch
> > +#event_match_type: startswith
> > diff --git a/meta-openstack/recipes-support/salt/files/roster
> b/meta-openstack/recipes-support/salt/files/roster
> > index 3eac2fa..e5a8318 100644
> > --- a/meta-openstack/recipes-support/salt/files/roster
> > +++ b/meta-openstack/recipes-support/salt/files/roster
> > @@ -6,3 +6,4 @@
> >  #  sudo: True         # Whether to sudo to root, not enabled by default
> >  #web2:
> >  #  host: 192.168.42.2
> > +
> > diff --git a/meta-openstack/recipes-support/salt/salt_2015.8.0.bb
> b/meta-openstack/recipes-support/salt/salt_2016.3.0.bb
> > similarity index 88%
> > rename from meta-openstack/recipes-support/salt/salt_2015.8.0.bb
> > rename to meta-openstack/recipes-support/salt/salt_2016.3.0.bb
> > index b22b827..c5620c6 100644
> > --- a/meta-openstack/recipes-support/salt/salt_2015.8.0.bb
> > +++ b/meta-openstack/recipes-support/salt/salt_2016.3.0.bb
> > @@ -1,18 +1,20 @@
> >  HOMEPAGE = "http://saltstack.com/"
> >  SECTION = "admin"
> >  LICENSE = "Apache-2.0"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=b59c9134761722281bb895f65cb15e9a"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=fb92f464675f6b5df90f540d60237915"
> >  DEPENDS = "\
> >             python-msgpack \
> >             python-pyyaml \
> >             python-jinja2 \
> >             python-markupsafe \
> > -           python-pyzmq \
> > -           python-pycrypto \
> >  "
> >
> > +PACKAGECONFIG ??= "zeromq"
> > +PACKAGECONFIG[zeromq] = ",,python-pyzmq python-pycrypto,"
> > +PACKAGECONFIG[tcp] = ",,python-pycrypto"
> > +
> >  SRCNAME = "salt"
> > -SRC_URI = "
> http://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz
> \
> > +SRC_URI = "
> http://pypi.python.org/packages/75/db/c072687e77ad616ba395cc8be50fff093fb71b7fc1f5c225f42eee130bf5/${SRCNAME}-${PV}.tar.gz
> \
> >             file://set_python_location_hashbang.patch \
> >             file://minion \
> >             file://salt-minion \
> > @@ -26,8 +28,8 @@ SRC_URI = "
> http://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.
> >             file://roster \
> >  "
> >
> > -SRC_URI[md5sum] = "a15842ef0582cca9d26143fe0a6180b7"
> > -SRC_URI[sha256sum] =
> "71e1cb2eb1d4b30f3247f5590c00a2089190b8f9a90c9330dc9a65fae517ec9b"
> > +SRC_URI[md5sum] = "8ed82cfb3f9b1764a035edbdacf0fea9"
> > +SRC_URI[sha256sum] =
> "e316dd103b7faeaa97820197e4d0d7d358519f0ca2a6dcb1d9b718eea801ed30"
> >
> >  S = "${WORKDIR}/${SRCNAME}-${PV}"
> >
> > @@ -77,7 +79,9 @@ Between the remote execution system, and state
> management Salt addresses the bac
> >
> >  SUMMARY_${PN}-minion = "client package for salt, the distributed remote
> execution system"
> >  DESCRIPTION_${PN}-minion = "${DESCRIPTION_COMMON} This particular
> package provides the worker agent for salt."
> > -RDEPENDS_${PN}-minion = "python (>=2.6), ${PN}-common (= ${EXTENDPKGV})
> python-pycrypto python-msgpack python-pyzmq (>= 13.1.0)"
> > +RDEPENDS_${PN}-minion = "python (>=2.6), ${PN}-common (= ${EXTENDPKGV})
> python-msgpack"
> > +RDEPENDS_${PN}-minion += "${@bb.utils.contains('PACKAGECONFIG',
> 'zeromq', 'python-pycrypto python-pyzmq (>= 13.1.0)', '',d)}"
> > +RDEPENDS_${PN}-minion += "${@bb.utils.contains('PACKAGECONFIG', 'tcp',
> 'python-pycrypto', '',d)}"
> >  RRECOMMENDS_${PN}-minion_append_x64 = "dmidecode"
> >  RSUGGESTS_${PN}-minion = "python-augeas"
> >  CONFFILES_${PN}-minion = "${sysconfdir}/${PN}/minion
> ${sysconfdir}/init.d/${PN}-minion"
> > @@ -118,7 +122,9 @@ INITSCRIPT_PARAMS_${PN}-api = "defaults"
> >
> >  SUMMARY_${PN}-master = "remote manager to administer servers via salt"
> >  DESCRIPTION_${PN}-master ="${DESCRIPTION_COMMON} This particular
> package provides the salt controller."
> > -RDEPENDS_${PN}-master = "python (>= 2.6) ${PN}-common (= ${EXTENDPKGV})
> python-pycrypto python-msgpack python-pyzmq (>= 13.1.0)"
> > +RDEPENDS_${PN}-master = "python (>= 2.6) ${PN}-common (= ${EXTENDPKGV})
> python-msgpack"
> > +RDEPENDS_${PN}-master += "${@bb.utils.contains('PACKAGECONFIG',
> 'zeromq', 'python-pycrypto python-pyzmq (>= 13.1.0)', '',d)}"
> > +RDEPENDS_${PN}-master += "${@bb.utils.contains('PACKAGECONFIG', 'tcp',
> 'python-pycrypto', '',d)}"
> >  CONFFILES_${PN}-master="${sysconfdir}/init.d/${PN}-master
> ${sysconfdir}/${PN}/master"
> >  RSUGGESTS_${PN}-master = "python-git"
> >  FILES_${PN}-master = "${bindir}/${PN} ${bindir}/${PN}-cp
> ${bindir}/${PN}-key ${bindir}/${PN}-master ${bindir}/${PN}-run
> ${bindir}/${PN}-unity ${bindir}/spm ${CONFFILES_${PN}-master}"
> >
>
> --
> Cheers,
>
> Alejandro
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c056214d1717c0534ef14fc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Jun 10, 2016 at 11:53 AM, Alejandro del Castillo <span dir=3D"l=
tr">&lt;<a href=3D"mailto:alejandro.delcastillo@ni.com" target=3D"_blank">a=
lejandro.delcastillo@ni.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">Just realized that pypi still have predictable URL&#39;s (without =
hashes):<br>
<br>
<a href=3D"https://bitbucket.org/pypa/pypi/issues/438/backwards-compatible-=
un-hashed-package" rel=3D"noreferrer" target=3D"_blank">https://bitbucket.o=
rg/pypa/pypi/issues/438/backwards-compatible-un-hashed-package</a><br>
<br>
Will send a v2 shortly.<br></blockquote><div><br></div><div>Gmail is drivin=
g me nuts with the threading of this series.<br><br><br></div><div>Does thi=
s second patch replace the first, or is it in addition to the first patch ?=
 I have<br></div><div>one from 19 hours ago, one from 32 minutes ago, all b=
eing threaded together. So I<br></div><div>can&#39;t tell if this send (and=
 your v2) replace the one from 19 hours ago, or are in addition<br></div><d=
iv>to it.<br><br></div><div>Bruce<br></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
<div><div class=3D"h5"><br>
On 06/09/2016 03:59 PM, Alejandro del Castillo wrote:<br>
&gt; * Update conffiles<br>
&gt; * Add PKGCONFIG options for zeromq and TCP transports.<br>
&gt;<br>
&gt; Signed-off-by: Alejandro del Castillo &lt;<a href=3D"mailto:alejandro.=
delcastillo@ni.com">alejandro.delcastillo@ni.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-openstack/recipes-support/salt/files/cloud=C2=A0 =C2=A0 |=
=C2=A0 =C2=A07 +-<br>
&gt;=C2=A0 meta-openstack/recipes-support/salt/files/master=C2=A0 =C2=A0| 5=
41 ++++++++++++++++-----<br>
&gt;=C2=A0 meta-openstack/recipes-support/salt/files/minion=C2=A0 =C2=A0| 3=
66 ++++++++++----<br>
&gt;=C2=A0 meta-openstack/recipes-support/salt/files/roster=C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 .../salt/{<a href=3D"http://salt_2015.8.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">salt_2015.8.0.bb</a> =3D&gt; <a href=3D"http://salt_2016=
.3.0.bb" rel=3D"noreferrer" target=3D"_blank">salt_2016.3.0.bb</a>}=C2=A0 =
=C2=A0 |=C2=A0 22 +-<br>
&gt;=C2=A0 5 files changed, 718 insertions(+), 219 deletions(-)<br>
&gt;=C2=A0 rename meta-openstack/recipes-support/salt/{<a href=3D"http://sa=
lt_2015.8.0.bb" rel=3D"noreferrer" target=3D"_blank">salt_2015.8.0.bb</a> =
=3D&gt; <a href=3D"http://salt_2016.3.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">salt_2016.3.0.bb</a>} (88%)<br>
&gt;<br>
&gt; diff --git a/meta-openstack/recipes-support/salt/files/cloud b/meta-op=
enstack/recipes-support/salt/files/cloud<br>
&gt; index 2ea54f1..5bd28df 100644<br>
&gt; --- a/meta-openstack/recipes-support/salt/files/cloud<br>
&gt; +++ b/meta-openstack/recipes-support/salt/files/cloud<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -# This file should normally be installed at: /etc/salt/cloud<br>
&gt; +# This file should normally be installed at: /etc/salt/cloud<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 ##########################################<br>
&gt; @@ -28,6 +28,9 @@<br>
&gt;=C2=A0 # The level of messages to send to the console.<br>
&gt;=C2=A0 # One of &#39;garbage&#39;, &#39;trace&#39;, &#39;debug&#39;, in=
fo&#39;, &#39;warning&#39;, &#39;error&#39;, &#39;critical&#39;.<br>
&gt;=C2=A0 #<br>
&gt; +# The following log levels are considered INSECURE and may log sensit=
ive data:<br>
&gt; +# [&#39;garbage&#39;, &#39;trace&#39;, &#39;debug&#39;]<br>
&gt; +#<br>
&gt;=C2=A0 # Default: &#39;info&#39;<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 #log_level: info<br>
&gt; @@ -65,7 +68,9 @@<br>
&gt;=C2=A0 # the coloring of the messages, these color formatters also incl=
ude padding as<br>
&gt;=C2=A0 # well.=C2=A0 Color LogRecord attributes are only available for =
console logging.<br>
&gt;=C2=A0 #<br>
&gt; +#log_fmt_console: &#39;%(colorlevel)s %(colormsg)s&#39;<br>
&gt;=C2=A0 #log_fmt_console: &#39;[%(levelname)-8s] %(message)s&#39;<br>
&gt; +#<br>
&gt;=C2=A0 #log_fmt_logfile: &#39;%(asctime)s,%(msecs)03.0f [%(name)-17s][%=
(levelname)-8s] %(message)s&#39;<br>
&gt;<br>
&gt;<br>
&gt; diff --git a/meta-openstack/recipes-support/salt/files/master b/meta-o=
penstack/recipes-support/salt/files/master<br>
&gt; index 8129a4f..821f5fc 100644<br>
&gt; --- a/meta-openstack/recipes-support/salt/files/master<br>
&gt; +++ b/meta-openstack/recipes-support/salt/files/master<br>
&gt; @@ -1,125 +1,235 @@<br>
&gt;=C2=A0 ##### Primary configuration settings #####<br>
&gt;=C2=A0 ##########################################<br>
&gt; -# This configuration file is used to manage the behavior of the Salt =
Master<br>
&gt; -# Values that are commented out but have no space after the comment a=
re<br>
&gt; -# defaults that need not be set in the config. If there is a space af=
ter the<br>
&gt; -# comment that the value is presented as an example and is not the de=
fault.<br>
&gt; +# This configuration file is used to manage the behavior of the Salt =
Master.<br>
&gt; +# Values that are commented out but have an empty line after the comm=
ent are<br>
&gt; +# defaults that do not need to be set in the config. If there is no b=
lank line<br>
&gt; +# after the comment then the value is presented as an example and is =
not the<br>
&gt; +# default.<br>
&gt;<br>
&gt;=C2=A0 # Per default, the master will automatically include all config =
files<br>
&gt;=C2=A0 # from master.d/*.conf (master.d is a directory in the same dire=
ctory<br>
&gt; -# as the main master config file)<br>
&gt; +# as the main master config file).<br>
&gt;=C2=A0 #default_include: master.d/*.conf<br>
&gt;<br>
&gt; -# The address of the interface to bind to<br>
&gt; +# The address of the interface to bind to:<br>
&gt;=C2=A0 #interface: 0.0.0.0<br>
&gt;<br>
&gt;=C2=A0 # Whether the master should listen for IPv6 connections. If this=
 is set to True,<br>
&gt; -# the interface option must be adjusted too (for example: &quot;inter=
face: &#39;::&#39;&quot;)<br>
&gt; +# the interface option must be adjusted, too. (For example: &quot;int=
erface: &#39;::&#39;&quot;)<br>
&gt;=C2=A0 #ipv6: False<br>
&gt;<br>
&gt; -# The tcp port used by the publisher<br>
&gt; +# The tcp port used by the publisher:<br>
&gt;=C2=A0 #publish_port: 4505<br>
&gt;<br>
&gt; -# The user to run the salt-master as. Salt will update all permission=
s to<br>
&gt; -# allow the specified user to run the master. If the modified files c=
ause<br>
&gt; -# conflicts set verify_env to False.<br>
&gt; +# The user under which the salt master will run. Salt will update all=
<br>
&gt; +# permissions to allow the specified user to run the master. The exce=
ption is<br>
&gt; +# the job cache, which must be deleted if this user is changed. If th=
e<br>
&gt; +# modified files cause conflicts, set verify_env to False.<br>
&gt;=C2=A0 #user: root<br>
&gt;<br>
&gt; -# Max open files<br>
&gt; -# Each minion connecting to the master uses AT LEAST one file descrip=
tor, the<br>
&gt; -# master subscription connection. If enough minions connect you might=
 start<br>
&gt; -# seeing on the console(and then salt-master crashes):<br>
&gt; -#=C2=A0 =C2=A0Too many open files (tcp_listener.cpp:335)<br>
&gt; -#=C2=A0 =C2=A0Aborted (core dumped)<br>
&gt; -#<br>
&gt; -# By default this value will be the one of `ulimit -Hn`, ie, the hard=
 limit for<br>
&gt; -# max open files.<br>
&gt; -#<br>
&gt; -# If you wish to set a different value than the default one, uncommen=
t and<br>
&gt; -# configure this setting. Remember that this value CANNOT be higher t=
han the<br>
&gt; -# hard limit. Raising the hard limit depends on your OS and/or distri=
bution,<br>
&gt; -# a good way to find the limit is to search the internet for(for exam=
ple):<br>
&gt; -#=C2=A0 =C2=A0raise max open files hard limit debian<br>
&gt; -#<br>
&gt; -#max_open_files: 100000<br>
&gt; -<br>
&gt; -# The number of worker threads to start, these threads are used to ma=
nage<br>
&gt; -# return calls made from minions to the master, if the master seems t=
o be<br>
&gt; -# running slowly, increase the number of threads<br>
&gt; -#worker_threads: 5<br>
&gt; -<br>
&gt;=C2=A0 # The port used by the communication interface. The ret (return)=
 port is the<br>
&gt; -# interface used for the file server, authentication, job returnes, e=
tc.<br>
&gt; +# interface used for the file server, authentication, job returns, et=
c.<br>
&gt;=C2=A0 #ret_port: 4506<br>
&gt;<br>
&gt; -# Specify the location of the daemon process ID file<br>
&gt; +# Specify the location of the daemon process ID file:<br>
&gt;=C2=A0 #pidfile: /var/run/salt-master.pid<br>
&gt;<br>
&gt;=C2=A0 # The root directory prepended to these options: pki_dir, cached=
ir,<br>
&gt; -# sock_dir, log_file, autosign_file, extension_modules, key_logfile, =
pidfile.<br>
&gt; +# sock_dir, log_file, autosign_file, autoreject_file, extension_modul=
es,<br>
&gt; +# key_logfile, pidfile:<br>
&gt;=C2=A0 #root_dir: /<br>
&gt;<br>
&gt; -# Directory used to store public key data<br>
&gt; +# Directory used to store public key data:<br>
&gt;=C2=A0 #pki_dir: /etc/salt/pki/master<br>
&gt;<br>
&gt; -# Directory to store job and cache data<br>
&gt; +# Directory to store job and cache data:<br>
&gt; +# This directory may contain sensitive data and should be protected a=
ccordingly.<br>
&gt; +#<br>
&gt;=C2=A0 #cachedir: /var/cache/salt/master<br>
&gt;<br>
&gt; -# Verify and set permissions on configuration directories at startup<=
br>
&gt; +# Directory for custom modules. This directory can contain subdirecto=
ries for<br>
&gt; +# each of Salt&#39;s module types such as &quot;runners&quot;, &quot;=
output&quot;, &quot;wheel&quot;, &quot;modules&quot;,<br>
&gt; +# &quot;states&quot;, &quot;returners&quot;, etc.<br>
&gt; +#extension_modules: &lt;no default&gt;<br>
&gt; +<br>
&gt; +# Directory for custom modules. This directory can contain subdirecto=
ries for<br>
&gt; +# each of Salt&#39;s module types such as &quot;runners&quot;, &quot;=
output&quot;, &quot;wheel&quot;, &quot;modules&quot;,<br>
&gt; +# &quot;states&quot;, &quot;returners&quot;, etc.<br>
&gt; +# Like &#39;extension_modules&#39; but can take an array of paths<br>
&gt; +#module_dirs: &lt;no default&gt;<br>
&gt; +#=C2=A0 =C2=A0- /var/cache/salt/minion/extmods<br>
&gt; +<br>
&gt; +# Verify and set permissions on configuration directories at startup:=
<br>
&gt;=C2=A0 #verify_env: True<br>
&gt;<br>
&gt; -# Set the number of hours to keep old job information in the job cach=
e<br>
&gt; +# Set the number of hours to keep old job information in the job cach=
e:<br>
&gt;=C2=A0 #keep_jobs: 24<br>
&gt;<br>
&gt; -# Set the default timeout for the salt command and api, the default i=
s 5<br>
&gt; -# seconds<br>
&gt; +# Set the default timeout for the salt command and api. The default i=
s 5<br>
&gt; +# seconds.<br>
&gt;=C2=A0 #timeout: 5<br>
&gt;<br>
&gt; -# The loop_interval option controls the seconds for the master&#39;s =
maintinance<br>
&gt; +# The loop_interval option controls the seconds for the master&#39;s =
maintenance<br>
&gt;=C2=A0 # process check cycle. This process updates file server backends=
, cleans the<br>
&gt;=C2=A0 # job cache and executes the scheduler.<br>
&gt;=C2=A0 #loop_interval: 60<br>
&gt;<br>
&gt; -# Set the default outputter used by the salt command. The default is =
&quot;nested&quot;<br>
&gt; +# Set the default outputter used by the salt command. The default is =
&quot;nested&quot;.<br>
&gt;=C2=A0 #output: nested<br>
&gt;<br>
&gt; -# By default output is colored, to disable colored output set the col=
or value<br>
&gt; -# to False<br>
&gt; +# Return minions that timeout when running commands like test.ping<br=
>
&gt; +#show_timeout: True<br>
&gt; +<br>
&gt; +# By default, output is colored. To disable colored output, set the c=
olor value<br>
&gt; +# to False.<br>
&gt;=C2=A0 #color: True<br>
&gt;<br>
&gt; -# Set the directory used to hold unix sockets<br>
&gt; +# Do not strip off the colored output from nested results and state o=
utputs<br>
&gt; +# (true by default).<br>
&gt; +# strip_colors: False<br>
&gt; +<br>
&gt; +# Set the directory used to hold unix sockets:<br>
&gt;=C2=A0 #sock_dir: /var/run/salt/master<br>
&gt;<br>
&gt;=C2=A0 # The master can take a while to start up when lspci and/or dmid=
ecode is used<br>
&gt;=C2=A0 # to populate the grains for the master. Enable if you want to s=
ee GPU hardware<br>
&gt;=C2=A0 # data for your master.<br>
&gt; -#<br>
&gt;=C2=A0 # enable_gpu_grains: False<br>
&gt;<br>
&gt; -# The master maintains a job cache, while this is a great addition it=
 can be<br>
&gt; +# The master maintains a job cache. While this is a great addition, i=
t can be<br>
&gt;=C2=A0 # a burden on the master for larger deployments (over 5000 minio=
ns).<br>
&gt;=C2=A0 # Disabling the job cache will make previously executed jobs una=
vailable to<br>
&gt;=C2=A0 # the jobs system and is not generally recommended.<br>
&gt; -#<br>
&gt;=C2=A0 #job_cache: True<br>
&gt;<br>
&gt;=C2=A0 # Cache minion grains and pillar data in the cachedir.<br>
&gt;=C2=A0 #minion_data_cache: True<br>
&gt;<br>
&gt; +# Store all returns in the given returner.<br>
&gt; +# Setting this option requires that any returner-specific configurati=
on also<br>
&gt; +# be set. See various returners in salt/returners for details on requ=
ired<br>
&gt; +# configuration values. (See also, event_return_queue below.)<br>
&gt; +#<br>
&gt; +#event_return: mysql<br>
&gt; +<br>
&gt; +# On busy systems, enabling event_returns can cause a considerable lo=
ad on<br>
&gt; +# the storage system for returners. Events can be queued on the maste=
r and<br>
&gt; +# stored in a batched fashion using a single transaction for multiple=
 events.<br>
&gt; +# By default, events are not queued.<br>
&gt; +#event_return_queue: 0<br>
&gt; +<br>
&gt; +# Only events returns matching tags in a whitelist<br>
&gt; +# event_return_whitelist:<br>
&gt; +#=C2=A0 =C2=A0- salt/master/a_tag<br>
&gt; +#=C2=A0 =C2=A0- salt/master/another_tag<br>
&gt; +<br>
&gt; +# Store all event returns _except_ the tags in a blacklist<br>
&gt; +# event_return_blacklist:<br>
&gt; +#=C2=A0 =C2=A0- salt/master/not_this_tag<br>
&gt; +#=C2=A0 =C2=A0- salt/master/or_this_one<br>
&gt; +<br>
&gt; +# Passing very large events can cause the minion to consume large amo=
unts of<br>
&gt; +# memory. This value tunes the maximum size of a message allowed onto=
 the<br>
&gt; +# master event bus. The value is expressed in bytes.<br>
&gt; +#max_event_size: 1048576<br>
&gt; +<br>
&gt; +# By default, the master AES key rotates every 24 hours. The next com=
mand<br>
&gt; +# following a key rotation will trigger a key refresh from the minion=
 which may<br>
&gt; +# result in minions which do not respond to the first command after a=
 key refresh.<br>
&gt; +#<br>
&gt; +# To tell the master to ping all minions immediately after an AES key=
 refresh, set<br>
&gt; +# ping_on_rotate to True. This should mitigate the issue where a mini=
on does not<br>
&gt; +# appear to initially respond after a key is rotated.<br>
&gt; +#<br>
&gt; +# Note that ping_on_rotate may cause high load on the master immediat=
ely after<br>
&gt; +# the key rotation event as minions reconnect. Consider this carefull=
y if this<br>
&gt; +# salt master is managing a large number of minions.<br>
&gt; +#<br>
&gt; +# If disabled, it is recommended to handle this event by listening fo=
r the<br>
&gt; +# &#39;aes_key_rotate&#39; event with the &#39;key&#39; tag and actin=
g appropriately.<br>
&gt; +# ping_on_rotate: False<br>
&gt; +<br>
&gt; +# By default, the master deletes its cache of minion data when the ke=
y for that<br>
&gt; +# minion is removed. To preserve the cache after key deletion, set<br=
>
&gt; +# &#39;preserve_minion_cache&#39; to True.<br>
&gt; +#<br>
&gt; +# WARNING: This may have security implications if compromised minions=
 auth with<br>
&gt; +# a previous deleted minion ID.<br>
&gt; +#preserve_minion_cache: False<br>
&gt; +<br>
&gt; +# If max_minions is used in large installations, the master might exp=
erience<br>
&gt; +# high-load situations because of having to check the number of conne=
cted<br>
&gt; +# minions for every authentication. This cache provides the minion-id=
s of<br>
&gt; +# all connected minions to all MWorker-processes and greatly improves=
 the<br>
&gt; +# performance of max_minions.<br>
&gt; +# con_cache: False<br>
&gt; +<br>
&gt;=C2=A0 # The master can include configuration from other files. To enab=
le this,<br>
&gt;=C2=A0 # pass a list of paths to this option. The paths can be either r=
elative or<br>
&gt;=C2=A0 # absolute; if relative, they are considered to be relative to t=
he directory<br>
&gt;=C2=A0 # the main master configuration file lives in (this file). Paths=
 can make use<br>
&gt;=C2=A0 # of shell-style globbing. If no files are matched by a path pas=
sed to this<br>
&gt; -# option then the master will log a warning message.<br>
&gt; -#<br>
&gt; +# option, then the master will log a warning message.<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # Include a config file from some other path:<br>
&gt; -#include: /etc/salt/extra_config<br>
&gt; +# include: /etc/salt/extra_config<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # Include config from several files and directories:<br>
&gt; -#include:<br>
&gt; -#=C2=A0 - /etc/salt/extra_config<br>
&gt; +# include:<br>
&gt; +#=C2=A0 =C2=A0- /etc/salt/extra_config<br>
&gt; +<br>
&gt; +<br>
&gt; +#####=C2=A0 Large-scale tuning settings=C2=A0 =C2=A0#####<br>
&gt; +##########################################<br>
&gt; +# Max open files<br>
&gt; +#<br>
&gt; +# Each minion connecting to the master uses AT LEAST one file descrip=
tor, the<br>
&gt; +# master subscription connection. If enough minions connect you might=
 start<br>
&gt; +# seeing on the console (and then salt-master crashes):<br>
&gt; +#=C2=A0 =C2=A0Too many open files (tcp_listener.cpp:335)<br>
&gt; +#=C2=A0 =C2=A0Aborted (core dumped)<br>
&gt; +#<br>
&gt; +# By default this value will be the one of `ulimit -Hn`, ie, the hard=
 limit for<br>
&gt; +# max open files.<br>
&gt; +#<br>
&gt; +# If you wish to set a different value than the default one, uncommen=
t and<br>
&gt; +# configure this setting. Remember that this value CANNOT be higher t=
han the<br>
&gt; +# hard limit. Raising the hard limit depends on your OS and/or distri=
bution,<br>
&gt; +# a good way to find the limit is to search the internet. For example=
:<br>
&gt; +#=C2=A0 =C2=A0raise max open files hard limit debian<br>
&gt; +#<br>
&gt; +#max_open_files: 100000<br>
&gt; +<br>
&gt; +# The number of worker threads to start. These threads are used to ma=
nage<br>
&gt; +# return calls made from minions to the master. If the master seems t=
o be<br>
&gt; +# running slowly, increase the number of threads. This setting can no=
t be<br>
&gt; +# set lower than 3.<br>
&gt; +#worker_threads: 5<br>
&gt; +<br>
&gt; +# Set the ZeroMQ high water marks<br>
&gt; +# <a href=3D"http://api.zeromq.org/3-2:zmq-setsockopt" rel=3D"norefer=
rer" target=3D"_blank">http://api.zeromq.org/3-2:zmq-setsockopt</a><br>
&gt; +<br>
&gt; +# The publisher interface ZeroMQPubServerChannel<br>
&gt; +#pub_hwm: 1000<br>
&gt; +<br>
&gt; +# These two ZMQ HWM settings, salt_event_pub_hwm and event_publisher_=
pub_hwm<br>
&gt; +# are significant for masters with thousands of minions.=C2=A0 When t=
hese are<br>
&gt; +# insufficiently high it will manifest in random responses missing in=
 the CLI<br>
&gt; +# and even missing from the job cache.=C2=A0 Masters that have fast C=
PUs and many<br>
&gt; +# cores with appropriate worker_threads will not need these set as hi=
gh.<br>
&gt; +<br>
&gt; +# On deployment with 8,000 minions, 2.4GHz CPUs, 24 cores, 32GiB memo=
ry has<br>
&gt; +# these settings:<br>
&gt; +#<br>
&gt; +#=C2=A0 =C2=A0salt_event_pub_hwm: 128000<br>
&gt; +#=C2=A0 =C2=A0event_publisher_pub_hwm: 64000<br>
&gt; +<br>
&gt; +# ZMQ high-water-mark for SaltEvent pub socket<br>
&gt; +#salt_event_pub_hwm: 20000<br>
&gt; +<br>
&gt; +# ZMQ high-water-mark for EventPublisher pub socket<br>
&gt; +#event_publisher_pub_hwm: 10000<br>
&gt; +<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 #####=C2=A0 =C2=A0 =C2=A0 =C2=A0 Security settings=C2=A0 =C2=A0 =
=C2=A0 =C2=A0#####<br>
&gt; @@ -134,53 +244,68 @@<br>
&gt;=C2=A0 # public keys from the minions. Note that this is insecure.<br>
&gt;=C2=A0 #auto_accept: False<br>
&gt;<br>
&gt; -# If the autosign_file is specified only incoming keys specified in<b=
r>
&gt; -# the autosign_file will be automatically accepted. This is insecure.=
<br>
&gt; -# Regular expressions as well as globing lines are supported.<br>
&gt; +# Time in minutes that a incoming public key with a matching name fou=
nd in<br>
&gt; +# pki_dir/minion_autosign/keyid is automatically accepted. Expired au=
tosign keys<br>
&gt; +# are removed when the master checks the minion_autosign directory.<b=
r>
&gt; +# 0 equals no timeout<br>
&gt; +# autosign_timeout: 120<br>
&gt; +<br>
&gt; +# If the autosign_file is specified, incoming keys specified in the<b=
r>
&gt; +# autosign_file will be automatically accepted. This is insecure.=C2=
=A0 Regular<br>
&gt; +# expressions as well as globing lines are supported.<br>
&gt;=C2=A0 #autosign_file: /etc/salt/autosign.conf<br>
&gt;<br>
&gt; -# Enable permissive access to the salt keys.=C2=A0 This allows you to=
 run the<br>
&gt; +# Works like autosign_file, but instead allows you to specify minion =
IDs for<br>
&gt; +# which keys will automatically be rejected. Will override both membe=
rship in<br>
&gt; +# the autosign_file and the auto_accept setting.<br>
&gt; +#autoreject_file: /etc/salt/autoreject.conf<br>
&gt; +<br>
&gt; +# Enable permissive access to the salt keys. This allows you to run t=
he<br>
&gt;=C2=A0 # master or minion as root, but have a non-root group be given a=
ccess to<br>
&gt; -# your pki_dir.=C2=A0 To make the access explicit, root must belong t=
o the group<br>
&gt; -# you&#39;ve given access to.=C2=A0 This is potentially quite insecur=
e.<br>
&gt; -# If an autosign_file is specified, enabling permissive_pki_access wi=
ll allow group access<br>
&gt; -# to that specific file.<br>
&gt; +# your pki_dir. To make the access explicit, root must belong to the =
group<br>
&gt; +# you&#39;ve given access to. This is potentially quite insecure. If =
an autosign_file<br>
&gt; +# is specified, enabling permissive_pki_access will allow group acces=
s to that<br>
&gt; +# specific file.<br>
&gt;=C2=A0 #permissive_pki_access: False<br>
&gt;<br>
&gt;=C2=A0 # Allow users on the master access to execute specific commands =
on minions.<br>
&gt;=C2=A0 # This setting should be treated with care since it opens up exe=
cution<br>
&gt;=C2=A0 # capabilities to non root users. By default this capability is =
completely<br>
&gt;=C2=A0 # disabled.<br>
&gt; -#<br>
&gt; -#client_acl:<br>
&gt; +#pulisher_acl:<br>
&gt;=C2=A0 #=C2=A0 larry:<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 - test.ping<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 - network.*<br>
&gt;=C2=A0 #<br>
&gt; -<br>
&gt;=C2=A0 # Blacklist any of the following users or modules<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # This example would blacklist all non sudo users, including roo=
t from<br>
&gt;=C2=A0 # running any commands. It would also blacklist any use of the &=
quot;cmd&quot;<br>
&gt; -# module.<br>
&gt; -# This is completely disabled by default.<br>
&gt; +# module. This is completely disabled by default.<br>
&gt;=C2=A0 #<br>
&gt; -#client_acl_blacklist:<br>
&gt; +#publisher_acl_blacklist:<br>
&gt;=C2=A0 #=C2=A0 users:<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 - root<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 - &#39;^(?!sudo_).*$&#39;=C2=A0 =C2=A0#=C2=A0 all=
 non sudo users<br>
&gt;=C2=A0 #=C2=A0 modules:<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 - cmd<br>
&gt; +#<br>
&gt; +# WARNING: client_acl and client_acl_blacklist options are deprecated=
 and will<br>
&gt; +# be removed in the future releases. Use publisher_acl and<br>
&gt; +# publisher_acl_blacklist instead.<br>
&gt; +<br>
&gt; +# Enforce publisher_acl &amp; publisher_acl_blacklist when users have=
 sudo<br>
&gt; +# access to the salt command.<br>
&gt; +#<br>
&gt; +#sudo_acl: False<br>
&gt;<br>
&gt;=C2=A0 # The external auth system uses the Salt auth modules to authent=
icate and<br>
&gt;=C2=A0 # validate users to access areas of the Salt system.<br>
&gt; -#<br>
&gt;=C2=A0 #external_auth:<br>
&gt;=C2=A0 #=C2=A0 pam:<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 fred:<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 - test.*<br>
&gt;=C2=A0 #<br>
&gt; -<br>
&gt;=C2=A0 # Time (in seconds) for a newly generated token to live. Default=
: 12 hours<br>
&gt;=C2=A0 #token_expire: 43200<br>
&gt;<br>
&gt; @@ -188,6 +313,10 @@<br>
&gt;=C2=A0 # security purposes.<br>
&gt;=C2=A0 #file_recv: False<br>
&gt;<br>
&gt; +# Set a hard-limit on the size of the files that can be pushed to the=
 master.<br>
&gt; +# It will be interpreted as megabytes. Default: 100<br>
&gt; +#file_recv_max_size: 100<br>
&gt; +<br>
&gt;=C2=A0 # Signature verification on messages published from the master.<=
br>
&gt;=C2=A0 # This causes the master to cryptographically sign all messages =
published to its event<br>
&gt;=C2=A0 # bus, and minions then verify that signature before acting on t=
he message.<br>
&gt; @@ -199,20 +328,30 @@<br>
&gt;=C2=A0 # no signature, it will still be accepted, and a warning message=
 will be logged.<br>
&gt;=C2=A0 # Conversely, if sign_pub_messages is False, but a minion receiv=
es a signed<br>
&gt;=C2=A0 # message it will be accepted, the signature will not be checked=
, and a warning message<br>
&gt; -# will be logged.=C2=A0 This behavior will go away in Salt 0.17.6 (or=
 Hydrogen RC1, whichever<br>
&gt; -# comes first) and these two situations will cause minion to throw an=
 exception and<br>
&gt; -# drop the message.<br>
&gt; -#<br>
&gt; +# will be logged. This behavior went away in Salt 2014.1.0 and these =
two situations<br>
&gt; +# will cause minion to throw an exception and drop the message.<br>
&gt;=C2=A0 # sign_pub_messages: False<br>
&gt;<br>
&gt; +#####=C2=A0 =C2=A0 =C2=A0Salt-SSH Configuration=C2=A0 =C2=A0 =C2=A0##=
###<br>
&gt; +##########################################<br>
&gt; +<br>
&gt; +# Pass in an alternative location for the salt-ssh roster file<br>
&gt; +#roster_file: /etc/salt/roster<br>
&gt; +<br>
&gt; +# Pass in minion option overrides that will be inserted into the SHIM=
 for<br>
&gt; +# salt-ssh calls. The local minion config is not used for salt-ssh. C=
an be<br>
&gt; +# overridden on a per-minion basis in the roster (`minion_opts`)<br>
&gt; +#ssh_minion_opts:<br>
&gt; +#=C2=A0 gpg_keydir: /root/gpg<br>
&gt; +<br>
&gt;=C2=A0 #####=C2=A0 =C2=A0 Master Module Management=C2=A0 =C2=A0 #####<b=
r>
&gt;=C2=A0 ##########################################<br>
&gt; -# Manage how master side modules are loaded<br>
&gt; +# Manage how master side modules are loaded.<br>
&gt;<br>
&gt; -# Add any additional locations to look for master runners<br>
&gt; +# Add any additional locations to look for master runners:<br>
&gt;=C2=A0 #runner_dirs: []<br>
&gt;<br>
&gt; -# Enable Cython for master side modules<br>
&gt; +# Enable Cython for master side modules:<br>
&gt;=C2=A0 #cython_enable: False<br>
&gt;<br>
&gt;<br>
&gt; @@ -226,6 +365,7 @@<br>
&gt;=C2=A0 # The master_tops option replaces the external_nodes option by c=
reating<br>
&gt;=C2=A0 # a plugable system for the generation of external top data. The=
 external_nodes<br>
&gt;=C2=A0 # option is deprecated by the master_tops option.<br>
&gt; +#<br>
&gt;=C2=A0 # To gain the capabilities of the classic external_nodes system,=
 use the<br>
&gt;=C2=A0 # following configuration:<br>
&gt;=C2=A0 # master_tops:<br>
&gt; @@ -242,6 +382,19 @@<br>
&gt;=C2=A0 # The renderer to use on the minions to render the state data<br=
>
&gt;=C2=A0 #renderer: yaml_jinja<br>
&gt;<br>
&gt; +# The Jinja renderer can strip extra carriage returns and whitespace<=
br>
&gt; +# See <a href=3D"http://jinja.pocoo.org/docs/api/#high-level-api" rel=
=3D"noreferrer" target=3D"_blank">http://jinja.pocoo.org/docs/api/#high-lev=
el-api</a><br>
&gt; +#<br>
&gt; +# If this is set to True the first newline after a Jinja block is rem=
oved<br>
&gt; +# (block, not variable tag!). Defaults to False, corresponds to the J=
inja<br>
&gt; +# environment init variable &quot;trim_blocks&quot;.<br>
&gt; +#jinja_trim_blocks: False<br>
&gt; +#<br>
&gt; +# If this is set to True leading spaces and tabs are stripped from th=
e start<br>
&gt; +# of a line to a block. Defaults to False, corresponds to the Jinja<b=
r>
&gt; +# environment init variable &quot;lstrip_blocks&quot;.<br>
&gt; +#jinja_lstrip_blocks: False<br>
&gt; +<br>
&gt;=C2=A0 # The failhard option tells the minions to stop immediately afte=
r the first<br>
&gt;=C2=A0 # failure detected in the state execution, defaults to False<br>
&gt;=C2=A0 #failhard: False<br>
&gt; @@ -256,8 +409,22 @@<br>
&gt;=C2=A0 # output for each changed state if set to &#39;full&#39;, but if=
 set to &#39;terse&#39;<br>
&gt;=C2=A0 # the output will be shortened to a single line.=C2=A0 If set to=
 &#39;mixed&#39;, the output<br>
&gt;=C2=A0 # will be terse unless a state failed, in which case that output=
 will be full.<br>
&gt; +# If set to &#39;changes&#39;, the output will be full unless the sta=
te didn&#39;t change.<br>
&gt;=C2=A0 #state_output: full<br>
&gt;<br>
&gt; +# Automatically aggregate all states that have support for mod_aggreg=
ate by<br>
&gt; +# setting to &#39;True&#39;. Or pass a list of state module names to =
automatically<br>
&gt; +# aggregate just those types.<br>
&gt; +#<br>
&gt; +# state_aggregate:<br>
&gt; +#=C2=A0 =C2=A0- pkg<br>
&gt; +#<br>
&gt; +#state_aggregate: False<br>
&gt; +<br>
&gt; +# Send progress events as each function in a state run completes exec=
ution<br>
&gt; +# by setting to &#39;True&#39;. Progress events are in the format<br>
&gt; +# &#39;salt/job/&lt;JID&gt;/prog/&lt;MID&gt;/&lt;RUN NUM&gt;&#39;.<br=
>
&gt; +#state_events: False<br>
&gt;<br>
&gt;=C2=A0 #####=C2=A0 =C2=A0 =C2=A0 File Server settings=C2=A0 =C2=A0 =C2=
=A0 #####<br>
&gt;=C2=A0 ##########################################<br>
&gt; @@ -279,14 +446,34 @@<br>
&gt;=C2=A0 #=C2=A0 =C2=A0prod:<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0- /srv/salt/prod/services<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0- /srv/salt/prod/states<br>
&gt; -<br>
&gt; +#<br>
&gt;=C2=A0 #file_roots:<br>
&gt;=C2=A0 #=C2=A0 base:<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 - /srv/salt<br>
&gt; +#<br>
&gt; +<br>
&gt; +# When using multiple environments, each with their own top file, the=
<br>
&gt; +# default behaviour is an unordered merge. To prevent top files from<=
br>
&gt; +# being merged together and instead to only use the top file from the=
<br>
&gt; +# requested environment, set this value to &#39;same&#39;.<br>
&gt; +#top_file_merging_strategy: merge<br>
&gt; +<br>
&gt; +# To specify the order in which environments are merged, set the orde=
ring<br>
&gt; +# in the env_order option. Given a conflict, the last matching value =
will<br>
&gt; +# win.<br>
&gt; +#env_order: [&#39;base&#39;, &#39;dev&#39;, &#39;prod&#39;]<br>
&gt; +<br>
&gt; +# If top_file_merging_strategy is set to &#39;same&#39; and an enviro=
nment does not<br>
&gt; +# contain a top file, the top file in the environment specified by de=
fault_top<br>
&gt; +# will be used instead.<br>
&gt; +#default_top: base<br>
&gt;<br>
&gt;=C2=A0 # The hash_type is the hash to use when discovering the hash of =
a file on<br>
&gt;=C2=A0 # the master server. The default is md5, but sha1, sha224, sha25=
6, sha384<br>
&gt;=C2=A0 # and sha512 are also supported.<br>
&gt; +#<br>
&gt; +# Prior to changing this value, the master should be stopped and all =
Salt<br>
&gt; +# caches should be cleared.<br>
&gt;=C2=A0 #hash_type: md5<br>
&gt;<br>
&gt;=C2=A0 # The buffer size in the file server can be adjusted here:<br>
&gt; @@ -298,7 +485,6 @@<br>
&gt;=C2=A0 # For example, if you manage your custom modules and states in s=
ubversion<br>
&gt;=C2=A0 # and don&#39;t want all the &#39;.svn&#39; folders and content =
synced to your minions,<br>
&gt;=C2=A0 # you could set this to &#39;/\.svn($|/)&#39;. By default nothin=
g is ignored.<br>
&gt; -#<br>
&gt;=C2=A0 #file_ignore_regex:<br>
&gt;=C2=A0 #=C2=A0 - &#39;/\.svn($|/)&#39;<br>
&gt;=C2=A0 #=C2=A0 - &#39;/\.git($|/)&#39;<br>
&gt; @@ -307,58 +493,83 @@<br>
&gt;=C2=A0 # path before syncing the modules and states to the minions. Thi=
s is similar<br>
&gt;=C2=A0 # to file_ignore_regex above, but works on globs instead of rege=
x. By default<br>
&gt;=C2=A0 # nothing is ignored.<br>
&gt; -#<br>
&gt;=C2=A0 # file_ignore_glob:<br>
&gt;=C2=A0 #=C2=A0 - &#39;*.pyc&#39;<br>
&gt;=C2=A0 #=C2=A0 - &#39;*/somefolder/*.bak&#39;<br>
&gt;=C2=A0 #=C2=A0 - &#39;*.swp&#39;<br>
&gt;<br>
&gt;=C2=A0 # File Server Backend<br>
&gt; +#<br>
&gt;=C2=A0 # Salt supports a modular fileserver backend system, this system=
 allows<br>
&gt;=C2=A0 # the salt master to link directly to third party systems to gat=
her and<br>
&gt;=C2=A0 # manage the files available to minions. Multiple backends can b=
e<br>
&gt;=C2=A0 # configured and will be searched for the requested file in the =
order in which<br>
&gt;=C2=A0 # they are defined here. The default setting only enables the st=
andard backend<br>
&gt;=C2=A0 # &quot;roots&quot; which uses the &quot;file_roots&quot; option=
.<br>
&gt; -#<br>
&gt;=C2=A0 #fileserver_backend:<br>
&gt;=C2=A0 #=C2=A0 - roots<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # To use multiple backends list them in the order they are searc=
hed:<br>
&gt; -#<br>
&gt;=C2=A0 #fileserver_backend:<br>
&gt;=C2=A0 #=C2=A0 - git<br>
&gt;=C2=A0 #=C2=A0 - roots<br>
&gt;=C2=A0 #<br>
&gt; +# Uncomment the line below if you do not want the file_server to foll=
ow<br>
&gt; +# symlinks when walking the filesystem tree. This is set to True<br>
&gt; +# by default. Currently this only applies to the default roots<br>
&gt; +# fileserver_backend.<br>
&gt; +#fileserver_followsymlinks: False<br>
&gt; +#<br>
&gt; +# Uncomment the line below if you do not want symlinks to be<br>
&gt; +# treated as the files they are pointing to. By default this is set t=
o<br>
&gt; +# False. By uncommenting the line below, any detected symlink while l=
isting<br>
&gt; +# files on the Master will not be returned to the Minion.<br>
&gt; +#fileserver_ignoresymlinks: True<br>
&gt; +#<br>
&gt;=C2=A0 # By default, the Salt fileserver recurses fully into all define=
d environments<br>
&gt;=C2=A0 # to attempt to find files. To limit this behavior so that the f=
ileserver only<br>
&gt;=C2=A0 # traverses directories with SLS files and special Salt director=
ies like _modules,<br>
&gt;=C2=A0 # enable the option below. This might be useful for installation=
s where a file root<br>
&gt;=C2=A0 # has a very large number of files and performance is impacted. =
Default is False.<br>
&gt; -#<br>
&gt;=C2=A0 # fileserver_limit_traversal: False<br>
&gt;=C2=A0 #<br>
&gt; -# Git fileserver backend configuration<br>
&gt; +# The fileserver can fire events off every time the fileserver is upd=
ated,<br>
&gt; +# these are disabled by default, but can be easily turned on by setti=
ng this<br>
&gt; +# flag to True<br>
&gt; +#fileserver_events: False<br>
&gt; +<br>
&gt; +# Git File Server Backend Configuration<br>
&gt; +#<br>
&gt; +# Gitfs can be provided by one of two python modules: GitPython or py=
git2. If<br>
&gt; +# using pygit2, both libgit2 and git must also be installed.<br>
&gt; +#gitfs_provider: gitpython<br>
&gt; +#<br>
&gt;=C2=A0 # When using the git fileserver backend at least one git remote =
needs to be<br>
&gt;=C2=A0 # defined. The user running the salt master will need read acces=
s to the repo.<br>
&gt;=C2=A0 #<br>
&gt; -#gitfs_remotes:<br>
&gt; -#=C2=A0 - git://<a href=3D"http://github.com/saltstack/salt-states.gi=
t" rel=3D"noreferrer" target=3D"_blank">github.com/saltstack/salt-states.gi=
t</a><br>
&gt; -#=C2=A0 - file:///var/git/saltmaster<br>
&gt; -#<br>
&gt;=C2=A0 # The repos will be searched in order to find the file requested=
 by a client<br>
&gt;=C2=A0 # and the first repo to have the file will return it.<br>
&gt;=C2=A0 # When using the git backend branches and tags are translated in=
to salt<br>
&gt;=C2=A0 # environments.<br>
&gt;=C2=A0 # Note:=C2=A0 file:// repos will be treated as a remote, so refs=
 you want used must<br>
&gt;=C2=A0 # exist in that repo as *local* refs.<br>
&gt; +#gitfs_remotes:<br>
&gt; +#=C2=A0 - git://<a href=3D"http://github.com/saltstack/salt-states.gi=
t" rel=3D"noreferrer" target=3D"_blank">github.com/saltstack/salt-states.gi=
t</a><br>
&gt; +#=C2=A0 - file:///var/git/saltmaster<br>
&gt; +#<br>
&gt; +# The gitfs_ssl_verify option specifies whether to ignore ssl certifi=
cate<br>
&gt; +# errors when contacting the gitfs backend. You might want to set thi=
s to<br>
&gt; +# false if you&#39;re using a git backend that uses a self-signed cer=
tificate but<br>
&gt; +# keep in mind that setting this flag to anything other than the defa=
ult of True<br>
&gt; +# is a security concern, you may want to try using the ssh transport.=
<br>
&gt; +#gitfs_ssl_verify: True<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # The gitfs_root option gives the ability to serve files from a =
subdirectory<br>
&gt;=C2=A0 # within the repository. The path is defined relative to the roo=
t of the<br>
&gt;=C2=A0 # repository and defaults to the repository root.<br>
&gt;=C2=A0 #gitfs_root: somefolder/otherfolder<br>
&gt; -<br>
&gt; -<br>
&gt; +#<br>
&gt; +#<br>
&gt;=C2=A0 #####=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Pillar settings=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 #####<br>
&gt;=C2=A0 ##########################################<br>
&gt;=C2=A0 # Salt Pillars allow for the building of global data that can be=
 made selectively<br>
&gt; @@ -366,28 +577,59 @@<br>
&gt;=C2=A0 # Pillar is laid out in the same fashion as the file server, wit=
h environments,<br>
&gt;=C2=A0 # a top file and sls files. However, pillar data does not need t=
o be in the<br>
&gt;=C2=A0 # highstate format, and is generally just key/value pairs.<br>
&gt; -<br>
&gt;=C2=A0 #pillar_roots:<br>
&gt;=C2=A0 #=C2=A0 base:<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 - /srv/pillar<br>
&gt; -<br>
&gt; +#<br>
&gt;=C2=A0 #ext_pillar:<br>
&gt;=C2=A0 #=C2=A0 - hiera: /etc/hiera.yaml<br>
&gt;=C2=A0 #=C2=A0 - cmd_yaml: cat /etc/salt/yaml<br>
&gt;<br>
&gt; +# The ext_pillar_first option allows for external pillar sources to p=
opulate<br>
&gt; +# before file system pillar. This allows for targeting file system pi=
llar from<br>
&gt; +# ext_pillar.<br>
&gt; +#ext_pillar_first: False<br>
&gt; +<br>
&gt; +# The pillar_gitfs_ssl_verify option specifies whether to ignore ssl =
certificate<br>
&gt; +# errors when contacting the pillar gitfs backend. You might want to =
set this to<br>
&gt; +# false if you&#39;re using a git backend that uses a self-signed cer=
tificate but<br>
&gt; +# keep in mind that setting this flag to anything other than the defa=
ult of True<br>
&gt; +# is a security concern, you may want to try using the ssh transport.=
<br>
&gt; +#pillar_gitfs_ssl_verify: True<br>
&gt; +<br>
&gt;=C2=A0 # The pillar_opts option adds the master configuration file data=
 to a dict in<br>
&gt;=C2=A0 # the pillar called &quot;master&quot;. This is used to set simp=
le configurations in the<br>
&gt;=C2=A0 # master config file that can then be used on minions.<br>
&gt; -#pillar_opts: True<br>
&gt; +#pillar_opts: False<br>
&gt; +<br>
&gt; +# The pillar_safe_render_error option prevents the master from passin=
g pillar<br>
&gt; +# render errors to the minion. This is set on by default because the =
error could<br>
&gt; +# contain templating data which would give that minion information it=
 shouldn&#39;t<br>
&gt; +# have, like a password! When set true the error message will only sh=
ow:<br>
&gt; +#=C2=A0 =C2=A0Rendering SLS &#39;my.sls&#39; failed. Please see maste=
r log for details.<br>
&gt; +#pillar_safe_render_error: True<br>
&gt; +<br>
&gt; +# The pillar_source_merging_strategy option allows you to configure m=
erging strategy<br>
&gt; +# between different sources. It accepts four values: recurse, aggrega=
te, overwrite,<br>
&gt; +# or smart. Recurse will merge recursively mapping of data. Aggregate=
 instructs<br>
&gt; +# aggregation of elements between sources that use the #!yamlex rende=
rer. Overwrite<br>
&gt; +# will verwrite elements according the order in which they are proces=
sed. This is<br>
&gt; +# behavior of the 2014.1 branch and earlier. Smart guesses the best s=
trategy based<br>
&gt; +# on the &quot;renderer&quot; setting and is the default value.<br>
&gt; +#pillar_source_merging_strategy: smart<br>
&gt; +<br>
&gt; +# Recursively merge lists by aggregating them instead of replacing th=
em.<br>
&gt; +#pillar_merge_lists: False<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 #####=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Syndic settings=C2=A0 =
=C2=A0 =C2=A0 =C2=A0#####<br>
&gt;=C2=A0 ##########################################<br>
&gt;=C2=A0 # The Salt syndic is used to pass commands through a master from=
 a higher<br>
&gt; -# master. Using the syndic is simple, if this is a master that will h=
ave<br>
&gt; -# syndic servers(s) below it set the &quot;order_masters&quot; settin=
g to True, if this<br>
&gt; -# is a master that will be running a syndic daemon for passthrough th=
e<br>
&gt; -# &quot;syndic_master&quot; setting needs to be set to the location o=
f the master server<br>
&gt; +# master. Using the syndic is simple. If this is a master that will h=
ave<br>
&gt; +# syndic servers(s) below it, then set the &quot;order_masters&quot; =
setting to True.<br>
&gt; +#<br>
&gt; +# If this is a master that will be running a syndic daemon for passth=
rough, then<br>
&gt; +# the &quot;syndic_master&quot; setting needs to be set to the locati=
on of the master server<br>
&gt;=C2=A0 # to receive commands from.<br>
&gt;<br>
&gt;=C2=A0 # Set the order_masters setting to True if this master will comm=
and lower<br>
&gt; @@ -398,15 +640,16 @@<br>
&gt;=C2=A0 # this master where to receive commands from.<br>
&gt;=C2=A0 #syndic_master: masterofmaster<br>
&gt;<br>
&gt; -# This is the &#39;ret_port&#39; of the MasterOfMaster<br>
&gt; +# This is the &#39;ret_port&#39; of the MasterOfMaster:<br>
&gt;=C2=A0 #syndic_master_port: 4506<br>
&gt;<br>
&gt; -# PID file of the syndic daemon<br>
&gt; +# PID file of the syndic daemon:<br>
&gt;=C2=A0 #syndic_pidfile: /var/run/salt-syndic.pid<br>
&gt;<br>
&gt; -# LOG file of the syndic daemon<br>
&gt; +# LOG file of the syndic daemon:<br>
&gt;=C2=A0 #syndic_log_file: syndic.log<br>
&gt;<br>
&gt; +<br>
&gt;=C2=A0 #####=C2=A0 =C2=A0 =C2=A0 Peer Publish settings=C2=A0 =C2=A0 =C2=
=A0#####<br>
&gt;=C2=A0 ##########################################<br>
&gt;=C2=A0 # Salt minions can send commands to other minions, but only if t=
he minion is<br>
&gt; @@ -418,14 +661,12 @@<br>
&gt;=C2=A0 # of regular expressions to match functions. The following will =
allow the<br>
&gt;=C2=A0 # minion authenticated as <a href=3D"http://foo.example.com" rel=
=3D"noreferrer" target=3D"_blank">foo.example.com</a> to execute functions =
from the test<br>
&gt;=C2=A0 # and pkg modules.<br>
&gt; -#<br>
&gt;=C2=A0 #peer:<br>
&gt;=C2=A0 #=C2=A0 <a href=3D"http://foo.example.com" rel=3D"noreferrer" ta=
rget=3D"_blank">foo.example.com</a>:<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 - test.*<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 - pkg.*<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # This will allow all minions to execute all commands:<br>
&gt; -#<br>
&gt;=C2=A0 #peer:<br>
&gt;=C2=A0 #=C2=A0 .*:<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 - .*<br>
&gt; @@ -440,16 +681,34 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # All peer runner support is turned off by default and must be e=
nabled before<br>
&gt;=C2=A0 # using. This will enable all peer runners for all minions:<br>
&gt; -#<br>
&gt;=C2=A0 #peer_run:<br>
&gt;=C2=A0 #=C2=A0 .*:<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 - .*<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # To enable just the manage.up runner for the minion <a href=3D"=
http://foo.example.com" rel=3D"noreferrer" target=3D"_blank">foo.example.co=
m</a>:<br>
&gt; -#<br>
&gt;=C2=A0 #peer_run:<br>
&gt;=C2=A0 #=C2=A0 <a href=3D"http://foo.example.com" rel=3D"noreferrer" ta=
rget=3D"_blank">foo.example.com</a>:<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 - manage.up<br>
&gt; +#<br>
&gt; +#<br>
&gt; +#####=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mine settings=C2=A0 =C2=A0 =C2=
=A0#####<br>
&gt; +#####################################<br>
&gt; +# Restrict mine.get access from minions. By default any minion has a =
full access<br>
&gt; +# to get all mine data from master cache. In acl definion below, only=
 pcre matches<br>
&gt; +# are allowed.<br>
&gt; +# mine_get:<br>
&gt; +#=C2=A0 =C2=A0.*:<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0- .*<br>
&gt; +#<br>
&gt; +# The example below enables minion <a href=3D"http://foo.example.com"=
 rel=3D"noreferrer" target=3D"_blank">foo.example.com</a> to get &#39;netwo=
rk.interfaces&#39; mine<br>
&gt; +# data only, minions web* to get all network.* and disk.* mine data a=
nd all other<br>
&gt; +# minions won&#39;t get any mine data.<br>
&gt; +# mine_get:<br>
&gt; +#=C2=A0 =C2=A0<a href=3D"http://foo.example.com" rel=3D"noreferrer" t=
arget=3D"_blank">foo.example.com</a>:<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0- network.interfaces<br>
&gt; +#=C2=A0 =C2=A0web.*:<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0- network.*<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0- disk.*<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 #####=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Logging settings=C2=A0 =
=C2=A0 =C2=A0 =C2=A0#####<br>
&gt; @@ -468,10 +727,15 @@<br>
&gt;<br>
&gt;=C2=A0 # The level of messages to send to the console.<br>
&gt;=C2=A0 # One of &#39;garbage&#39;, &#39;trace&#39;, &#39;debug&#39;, in=
fo&#39;, &#39;warning&#39;, &#39;error&#39;, &#39;critical&#39;.<br>
&gt; +#<br>
&gt; +# The following log levels are considered INSECURE and may log sensit=
ive data:<br>
&gt; +# [&#39;garbage&#39;, &#39;trace&#39;, &#39;debug&#39;]<br>
&gt; +#<br>
&gt;=C2=A0 #log_level: warning<br>
&gt;<br>
&gt;=C2=A0 # The level of messages to send to the log file.<br>
&gt;=C2=A0 # One of &#39;garbage&#39;, &#39;trace&#39;, &#39;debug&#39;, in=
fo&#39;, &#39;warning&#39;, &#39;error&#39;, &#39;critical&#39;.<br>
&gt; +# If using &#39;log_granular_levels&#39; this must be set to the high=
est desired level.<br>
&gt;=C2=A0 #log_level_logfile: warning<br>
&gt;<br>
&gt;=C2=A0 # The date and time format used in log messages. Allowed date/ti=
me formating<br>
&gt; @@ -481,24 +745,37 @@<br>
&gt;<br>
&gt;=C2=A0 # The format of the console logging messages. Allowed formatting=
 options can<br>
&gt;=C2=A0 # be seen here: <a href=3D"http://docs.python.org/library/loggin=
g.html#logrecord-attributes" rel=3D"noreferrer" target=3D"_blank">http://do=
cs.python.org/library/logging.html#logrecord-attributes</a><br>
&gt; +#<br>
&gt; +# Console log colors are specified by these additional formatters:<br=
>
&gt; +#<br>
&gt; +# %(colorlevel)s<br>
&gt; +# %(colorname)s<br>
&gt; +# %(colorprocess)s<br>
&gt; +# %(colormsg)s<br>
&gt; +#<br>
&gt; +# Since it is desirable to include the surrounding brackets, &#39;[&#=
39; and &#39;]&#39;, in<br>
&gt; +# the coloring of the messages, these color formatters also include p=
adding as<br>
&gt; +# well.=C2=A0 Color LogRecord attributes are only available for conso=
le logging.<br>
&gt; +#<br>
&gt; +#log_fmt_console: &#39;%(colorlevel)s %(colormsg)s&#39;<br>
&gt;=C2=A0 #log_fmt_console: &#39;[%(levelname)-8s] %(message)s&#39;<br>
&gt; +#<br>
&gt;=C2=A0 #log_fmt_logfile: &#39;%(asctime)s,%(msecs)03.0f [%(name)-17s][%=
(levelname)-8s] %(message)s&#39;<br>
&gt;<br>
&gt;=C2=A0 # This can be used to control logging levels more specificically=
.=C2=A0 This<br>
&gt;=C2=A0 # example sets the main salt library at the &#39;warning&#39; le=
vel, but sets<br>
&gt;=C2=A0 # &#39;salt.modules&#39; to log at the &#39;debug&#39; level:<br=
>
&gt;=C2=A0 #=C2=A0 =C2=A0log_granular_levels:<br>
&gt; -#=C2=A0 =C2=A0 =C2=A0&#39;salt&#39;: &#39;warning&#39;,<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0&#39;salt&#39;: &#39;warning&#39;<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0&#39;salt.modules&#39;: &#39;debug&#39;<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 #log_granular_levels: {}<br>
&gt;<br>
&gt;<br>
&gt; -#####=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Node Groups=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0#####<br>
&gt; +#####=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Node Groups=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0######<br>
&gt;=C2=A0 ##########################################<br>
&gt; -# Node groups allow for logical groupings of minion nodes.<br>
&gt; -# A group consists of a group name and a compound target.<br>
&gt; -#<br>
&gt; +# Node groups allow for logical groupings of minion nodes. A group co=
nsists of a group<br>
&gt; +# name and a compound target.<br>
&gt;=C2=A0 #nodegroups:<br>
&gt;=C2=A0 #=C2=A0 group1: &#39;<a href=3D"mailto:L@foo.domain.com">L@foo.d=
omain.com</a>,<a href=3D"http://bar.domain.com" rel=3D"noreferrer" target=
=3D"_blank">bar.domain.com</a>,<a href=3D"http://baz.domain.com" rel=3D"nor=
eferrer" target=3D"_blank">baz.domain.com</a> and bl*.<a href=3D"http://dom=
ain.com" rel=3D"noreferrer" target=3D"_blank">domain.com</a>&#39;<br>
&gt;=C2=A0 #=C2=A0 group2: &#39;G@os:Debian and <a href=3D"http://foo.domai=
n.com" rel=3D"noreferrer" target=3D"_blank">foo.domain.com</a>&#39;<br>
&gt; @@ -507,19 +784,43 @@<br>
&gt;=C2=A0 #####=C2=A0 =C2=A0 =C2=A0Range Cluster settings=C2=A0 =C2=A0 =C2=
=A0#####<br>
&gt;=C2=A0 ##########################################<br>
&gt;=C2=A0 # The range server (and optional port) that serves your cluster =
information<br>
&gt; -# <a href=3D"https://github.com/grierj/range/wiki/Introduction-to-Ran=
ge-with-YAML-files" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/grierj/range/wiki/Introduction-to-Range-with-YAML-files</a><br>
&gt; +# <a href=3D"https://github.com/ytoolshed/range/wiki/%22yamlfile%22-m=
odule-file-spec" rel=3D"noreferrer" target=3D"_blank">https://github.com/yt=
oolshed/range/wiki/%22yamlfile%22-module-file-spec</a><br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 #range_server: range:80<br>
&gt;<br>
&gt;<br>
&gt; -#####=C2=A0 =C2=A0 =C2=A0Windows Software Repo settings #####<br>
&gt; -##############################################<br>
&gt; -# Location of the repo on the master<br>
&gt; -#win_repo: &#39;/srv/salt/win/repo&#39;<br>
&gt; +#####=C2=A0 Windows Software Repo settings #####<br>
&gt; +###########################################<br>
&gt; +# Location of the repo on the master:<br>
&gt; +#winrepo_dir_ng: &#39;/srv/salt/win/repo-ng&#39;<br>
&gt; +#<br>
&gt; +# List of git repositories to include with the local repo:<br>
&gt; +#winrepo_remotes_ng:<br>
&gt; +#=C2=A0 - &#39;<a href=3D"https://github.com/saltstack/salt-winrepo-n=
g.git" rel=3D"noreferrer" target=3D"_blank">https://github.com/saltstack/sa=
lt-winrepo-ng.git</a>&#39;<br>
&gt;<br>
&gt; -# Location of the master&#39;s repo cache file<br>
&gt; -#win_repo_mastercachefile: &#39;/srv/salt/win/repo/winrepo.p&#39;<br>
&gt;<br>
&gt; -# List of git repositories to include with the local repo<br>
&gt; -#win_gitrepos:<br>
&gt; +#####=C2=A0 Windows Software Repo settings - Pre 2015.8 #####<br>
&gt; +########################################################<br>
&gt; +# Legacy repo settings for pre-2015.8 Windows minions.<br>
&gt; +#<br>
&gt; +# Location of the repo on the master:<br>
&gt; +#winrepo_dir: &#39;/srv/salt/win/repo&#39;<br>
&gt; +#<br>
&gt; +# Location of the master&#39;s repo cache file:<br>
&gt; +#winrepo_mastercachefile: &#39;/srv/salt/win/repo/winrepo.p&#39;<br>
&gt; +#<br>
&gt; +# List of git repositories to include with the local repo:<br>
&gt; +#winrepo_remotes:<br>
&gt;=C2=A0 #=C2=A0 - &#39;<a href=3D"https://github.com/saltstack/salt-winr=
epo.git" rel=3D"noreferrer" target=3D"_blank">https://github.com/saltstack/=
salt-winrepo.git</a>&#39;<br>
&gt; +<br>
&gt; +<br>
&gt; +#####=C2=A0 =C2=A0 =C2=A0 Returner settings=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ######<br>
&gt; +############################################<br>
&gt; +# Which returner(s) will be used for minion&#39;s result:<br>
&gt; +#return: mysql<br>
&gt; +<br>
&gt; +<br>
&gt; +######=C2=A0 =C2=A0 Miscellaneous=C2=A0 settings=C2=A0 =C2=A0 =C2=A0#=
#####<br>
&gt; +############################################<br>
&gt; +# Default match type for filtering events tags: startswith, endswith,=
 find, regex, fnmatch<br>
&gt; +#event_match_type: startswith<br>
&gt; diff --git a/meta-openstack/recipes-support/salt/files/minion b/meta-o=
penstack/recipes-support/salt/files/minion<br>
&gt; index 8fdde14..bd97c43 100644<br>
&gt; --- a/meta-openstack/recipes-support/salt/files/minion<br>
&gt; +++ b/meta-openstack/recipes-support/salt/files/minion<br>
&gt; @@ -1,16 +1,52 @@<br>
&gt;=C2=A0 ##### Primary configuration settings #####<br>
&gt;=C2=A0 ##########################################<br>
&gt; +# This configuration file is used to manage the behavior of the Salt =
Minion.<br>
&gt; +# With the exception of the location of the Salt Master Server, value=
s that are<br>
&gt; +# commented out but have an empty line after the comment are defaults=
 that need<br>
&gt; +# not be set in the config. If there is no blank line after the comme=
nt, the<br>
&gt; +# value is presented as an example and is not the default.<br>
&gt;<br>
&gt;=C2=A0 # Per default the minion will automatically include all config f=
iles<br>
&gt;=C2=A0 # from minion.d/*.conf (minion.d is a directory in the same dire=
ctory<br>
&gt;=C2=A0 # as the main minion config file).<br>
&gt;=C2=A0 #default_include: minion.d/*.conf<br>
&gt;<br>
&gt; -# Set the location of the salt master server, if the master server ca=
nnot be<br>
&gt; +# Set the location of the salt master server. If the master server ca=
nnot be<br>
&gt;=C2=A0 # resolved, then the minion will fail to start.<br>
&gt;=C2=A0 #master: salt<br>
&gt;<br>
&gt; -# Set whether the minion should connect to the master via IPv6<br>
&gt; +# Set http proxy information for the minion when doing requests<br>
&gt; +#proxy_host:<br>
&gt; +#proxy_port:<br>
&gt; +#proxy_username:<br>
&gt; +#proxy_password:<br>
&gt; +<br>
&gt; +# If multiple masters are specified in the &#39;master&#39; setting, =
the default behavior<br>
&gt; +# is to always try to connect to them in the order they are listed. I=
f random_master is<br>
&gt; +# set to True, the order will be randomized instead. This can be help=
ful in distributing<br>
&gt; +# the load of many minions executing salt-call requests, for example,=
 from a cron job.<br>
&gt; +# If only one master is listed, this setting is ignored and a warning=
 will be logged.<br>
&gt; +# NOTE: If master_type is set to failover, use master_shuffle instead=
.<br>
&gt; +#random_master: False<br>
&gt; +<br>
&gt; +# Use if master_type is set to failover.<br>
&gt; +#master_shuffle: False<br>
&gt; +<br>
&gt; +# Minions can connect to multiple masters simultaneously (all masters=
<br>
&gt; +# are &quot;hot&quot;), or can be configured to failover if a master =
becomes<br>
&gt; +# unavailable.=C2=A0 Multiple hot masters are configured by setting t=
his<br>
&gt; +# value to &quot;str&quot;.=C2=A0 Failover masters can be requested b=
y setting<br>
&gt; +# to &quot;failover&quot;.=C2=A0 MAKE SURE TO SET master_alive_interv=
al if you are<br>
&gt; +# using failover.<br>
&gt; +# master_type: str<br>
&gt; +<br>
&gt; +# Poll interval in seconds for checking if the master is still there.=
=C2=A0 Only<br>
&gt; +# respected if master_type above is &quot;failover&quot;. To disable =
the interval entirely,<br>
&gt; +# set the value to -1. (This may be necessary on machines which have =
high numbers<br>
&gt; +# of TCP connections, such as load balancers.)<br>
&gt; +# master_alive_interval: 30<br>
&gt; +<br>
&gt; +# Set whether the minion should connect to the master via IPv6:<br>
&gt;=C2=A0 #ipv6: False<br>
&gt;<br>
&gt;=C2=A0 # Set the number of seconds to wait before attempting to resolve=
<br>
&gt; @@ -18,13 +54,19 @@<br>
&gt;=C2=A0 # Set to zero if the minion should shutdown and not retry.<br>
&gt;=C2=A0 # retry_dns: 30<br>
&gt;<br>
&gt; -# Set the port used by the master reply and authentication server<br>
&gt; +# Set the port used by the master reply and authentication server.<br=
>
&gt;=C2=A0 #master_port: 4506<br>
&gt;<br>
&gt; -# The user to run salt<br>
&gt; +# The user to run salt.<br>
&gt;=C2=A0 #user: root<br>
&gt;<br>
&gt; -# Specify the location of the daemon process ID file<br>
&gt; +# Setting sudo_user will cause salt to run all execution modules unde=
r an sudo<br>
&gt; +# to the user given in sudo_user.=C2=A0 The user under which the salt=
 minion process<br>
&gt; +# itself runs will still be that provided in the user config above, b=
ut all<br>
&gt; +# execution modules run by the minion will be rerouted through sudo.<=
br>
&gt; +#sudo_user: saltdev<br>
&gt; +<br>
&gt; +# Specify the location of the daemon process ID file.<br>
&gt;=C2=A0 #pidfile: /var/run/salt-minion.pid<br>
&gt;<br>
&gt;=C2=A0 # The root directory prepended to these options: pki_dir, cached=
ir, log_file,<br>
&gt; @@ -48,7 +90,7 @@<br>
&gt;<br>
&gt;=C2=A0 # Custom static grains for this minion can be specified here and=
 used in SLS<br>
&gt;=C2=A0 # files just like all other grains. This example sets 4 custom g=
rains, with<br>
&gt; -# the &#39;roles&#39; grain having two values that can be matched aga=
inst:<br>
&gt; +# the &#39;roles&#39; grain having two values that can be matched aga=
inst.<br>
&gt;=C2=A0 #grains:<br>
&gt;=C2=A0 #=C2=A0 roles:<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 - webserver<br>
&gt; @@ -56,36 +98,40 @@<br>
&gt;=C2=A0 #=C2=A0 deployment: datacenter4<br>
&gt;=C2=A0 #=C2=A0 cabinet: 13<br>
&gt;=C2=A0 #=C2=A0 cab_u: 14-15<br>
&gt; -<br>
&gt; -# Where cache data goes<br>
&gt; +#<br>
&gt; +# Where cache data goes.<br>
&gt; +# This data may contain sensitive data and should be protected accord=
ingly.<br>
&gt;=C2=A0 #cachedir: /var/cache/salt/minion<br>
&gt;<br>
&gt; -# Verify and set permissions on configuration directories at startup<=
br>
&gt; +# Verify and set permissions on configuration directories at startup.=
<br>
&gt;=C2=A0 #verify_env: True<br>
&gt;<br>
&gt;=C2=A0 # The minion can locally cache the return data from jobs sent to=
 it, this<br>
&gt;=C2=A0 # can be a good way to keep track of jobs the minion has execute=
d<br>
&gt; -# (on the minion side). By default this feature is disabled, to enabl=
e<br>
&gt; -# set cache_jobs to True<br>
&gt; +# (on the minion side). By default this feature is disabled, to enabl=
e, set<br>
&gt; +# cache_jobs to True.<br>
&gt;=C2=A0 #cache_jobs: False<br>
&gt;<br>
&gt; -# set the directory used to hold unix sockets<br>
&gt; +# Set the directory used to hold unix sockets.<br>
&gt;=C2=A0 #sock_dir: /var/run/salt/minion<br>
&gt;<br>
&gt;=C2=A0 # Set the default outputter used by the salt-call command. The d=
efault is<br>
&gt; -# &quot;nested&quot;<br>
&gt; +# &quot;nested&quot;.<br>
&gt;=C2=A0 #output: nested<br>
&gt;=C2=A0 #<br>
&gt; -# By default output is colored, to disable colored output set the col=
or value<br>
&gt; -# to False<br>
&gt; +# By default output is colored. To disable colored output, set the co=
lor value<br>
&gt; +# to False.<br>
&gt;=C2=A0 #color: True<br>
&gt;<br>
&gt; +# Do not strip off the colored output from nested results and state o=
utputs<br>
&gt; +# (true by default).<br>
&gt; +# strip_colors: False<br>
&gt; +<br>
&gt;=C2=A0 # Backup files that are replaced by file.managed and file.recurs=
e under<br>
&gt;=C2=A0 # &#39;cachedir&#39;/file_backups relative to their original loc=
ation and appended<br>
&gt;=C2=A0 # with a timestamp. The only valid setting is &quot;minion&quot;=
. Disabled by default.<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # Alternatively this can be specified for each file in state fil=
es:<br>
&gt; -#<br>
&gt;=C2=A0 # /etc/ssh/sshd_config:<br>
&gt;=C2=A0 #=C2=A0 =C2=A0file.managed:<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0- source: salt://ssh/sshd_config<br>
&gt; @@ -103,27 +149,55 @@<br>
&gt;=C2=A0 # set to zero, the time between reconnection attempts will stay =
constant.<br>
&gt;=C2=A0 #acceptance_wait_time_max: 0<br>
&gt;<br>
&gt; +# If the master rejects the minion&#39;s public key, retry instead of=
 exiting.<br>
&gt; +# Rejected keys will be handled the same as waiting on acceptance.<br=
>
&gt; +#rejected_retry: False<br>
&gt; +<br>
&gt;=C2=A0 # When the master key changes, the minion will try to re-auth it=
self to receive<br>
&gt;=C2=A0 # the new master key. In larger environments this can cause a SY=
N flood on the<br>
&gt;=C2=A0 # master because all minions try to re-auth immediately. To prev=
ent this and<br>
&gt;=C2=A0 # have a minion wait for a random amount of time, use this optio=
nal parameter.<br>
&gt; -# The wait-time will be a random number of seconds between<br>
&gt; -# 0 and the defined value.<br>
&gt; +# The wait-time will be a random number of seconds between 0 and the =
defined value.<br>
&gt;=C2=A0 #random_reauth_delay: 60<br>
&gt;<br>
&gt; +# When waiting for a master to accept the minion&#39;s public key, sa=
lt will<br>
&gt; +# continuously attempt to reconnect until successful. This is the tim=
eout value,<br>
&gt; +# in seconds, for each individual attempt. After this timeout expires=
, the minion<br>
&gt; +# will wait for acceptance_wait_time seconds before trying again. Unl=
ess your master<br>
&gt; +# is under unusually heavy load, this should be left at the default.<=
br>
&gt; +#auth_timeout: 60<br>
&gt; +<br>
&gt; +# Number of consecutive SaltReqTimeoutError that are acceptable when =
trying to<br>
&gt; +# authenticate.<br>
&gt; +#auth_tries: 7<br>
&gt; +<br>
&gt; +# If authentication fails due to SaltReqTimeoutError during a ping_in=
terval,<br>
&gt; +# cause sub minion process to restart.<br>
&gt; +#auth_safemode: False<br>
&gt; +<br>
&gt; +# Ping Master to ensure connection is alive (minutes).<br>
&gt; +#ping_interval: 0<br>
&gt; +<br>
&gt; +# To auto recover minions if master changes IP address (DDNS)<br>
&gt; +#=C2=A0 =C2=A0 auth_tries: 10<br>
&gt; +#=C2=A0 =C2=A0 auth_safemode: False<br>
&gt; +#=C2=A0 =C2=A0 ping_interval: 90<br>
&gt; +#<br>
&gt; +# Minions won&#39;t know master is missing until a ping fails. After =
the ping fail,<br>
&gt; +# the minion will attempt authentication and likely fails out and cau=
se a restart.<br>
&gt; +# When the minion restarts it will resolve the masters IP and attempt=
 to reconnect.<br>
&gt;<br>
&gt; -# If you don&#39;t have any problems with syn-floods, dont bother wit=
h the<br>
&gt; +# If you don&#39;t have any problems with syn-floods, don&#39;t bothe=
r with the<br>
&gt;=C2=A0 # three recon_* settings described below, just leave the default=
s!<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # The ZeroMQ pull-socket that binds to the masters publishing in=
terface tries<br>
&gt;=C2=A0 # to reconnect immediately, if the socket is disconnected (for e=
xample if<br>
&gt;=C2=A0 # the master processes are restarted). In large setups this will=
 have all<br>
&gt;=C2=A0 # minions reconnect immediately which might flood the master (th=
e ZeroMQ-default<br>
&gt; -# is usually a 100ms delay). To prevent this, these three recon_* set=
tings<br>
&gt; +# is usually a 100ms delay). To prevent this, these three recon_* set=
tings<br>
&gt;=C2=A0 # can be used.<br>
&gt; -#<br>
&gt; -# recon_default: the interval in milliseconds that the socket should =
wait before<br>
&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trying to re=
connect to the master (100ms =3D 1 second)<br>
&gt; +# recon_default: the interval in milliseconds that the socket should =
wait before<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trying to re=
connect to the master (1000ms =3D 1 second)<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # recon_max: the maximum time a socket should wait. each interva=
l the time to wait<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is calculated by doub=
ling the previous time. if recon_max is reached,<br>
&gt; @@ -136,29 +210,26 @@<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reconnect 5: value fr=
om previous interval * 2<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reconnect x: if value=
 &gt;=3D recon_max, it starts again with recon_default<br>
&gt;=C2=A0 #<br>
&gt; -# recon_randomize: generate a random wait time on minion start. The w=
ait time will<br>
&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 be a =
random value between recon_default and recon_default +<br>
&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recon=
_max. Having all minions reconnect with the same recon_default<br>
&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and r=
econ_max value kind of defeats the purpose of being able to<br>
&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chang=
e these settings. If all minions have the same values and your<br>
&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 setup=
 is quite large (several thousand minions), they will still<br>
&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flood=
 the master. The desired behaviour is to have timeframe within<br>
&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 all m=
inions try to reconnect.<br>
&gt; -<br>
&gt; -# Example on how to use these settings:<br>
&gt; -# The goal: have all minions reconnect within a 60 second timeframe o=
n a disconnect<br>
&gt; -#<br>
&gt; -# The settings:<br>
&gt; -#recon_default: 1000<br>
&gt; -#recon_max: 59000<br>
&gt; -#recon_randomize: True<br>
&gt; +# recon_randomize: generate a random wait time on minion start. The w=
ait time will<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 be a =
random value between recon_default and recon_default +<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recon=
_max. Having all minions reconnect with the same recon_default<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and r=
econ_max value kind of defeats the purpose of being able to<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chang=
e these settings. If all minions have the same values and your<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 setup=
 is quite large (several thousand minions), they will still<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flood=
 the master. The desired behavior is to have timeframe within<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 all m=
inions try to reconnect.<br>
&gt; +#<br>
&gt; +# Example on how to use these settings. The goal: have all minions re=
connect within a<br>
&gt; +# 60 second timeframe on a disconnect.<br>
&gt; +# recon_default: 1000<br>
&gt; +# recon_max: 59000<br>
&gt; +# recon_randomize: True<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # Each minion will have a randomized reconnect value between &#3=
9;recon_default&#39;<br>
&gt;=C2=A0 # and &#39;recon_default + recon_max&#39;, which in this example=
 means between 1000ms<br>
&gt; -# 60000ms (or between 1 and 60 seconds). The generated random-value w=
ill be<br>
&gt; -# doubled after each attempt to reconnect. Lets say the generated ran=
dom<br>
&gt; -# value is 11 seconds (or 11000ms).<br>
&gt; -#<br>
&gt; +# 60000ms (or between 1 and 60 seconds). The generated random-value w=
ill be<br>
&gt; +# doubled after each attempt to reconnect. Lets say the generated ran=
dom<br>
&gt; +# value is 11 seconds (or 11000ms).<br>
&gt;=C2=A0 # reconnect 1: wait 11 seconds<br>
&gt;=C2=A0 # reconnect 2: wait 22 seconds<br>
&gt;=C2=A0 # reconnect 3: wait 33 seconds<br>
&gt; @@ -172,29 +243,68 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # In a setup with ~6000 thousand hosts these settings would aver=
age the reconnects<br>
&gt;=C2=A0 # to about 100 per second and all hosts would be reconnected wit=
hin 60 seconds.<br>
&gt; -#recon_default: 100<br>
&gt; -#recon_max: 5000<br>
&gt; -#recon_randomize: False<br>
&gt; -<br>
&gt; +# recon_default: 100<br>
&gt; +# recon_max: 5000<br>
&gt; +# recon_randomize: False<br>
&gt; +#<br>
&gt; +#<br>
&gt;=C2=A0 # The loop_interval sets how long in seconds the minion will wai=
t between<br>
&gt;=C2=A0 # evaluating the scheduler and running cleanup tasks. This defau=
lts to a<br>
&gt;=C2=A0 # sane 60 seconds, but if the minion scheduler needs to be evalu=
ated more<br>
&gt;=C2=A0 # often lower this value<br>
&gt;=C2=A0 #loop_interval: 60<br>
&gt;<br>
&gt; -# When healing, a dns_check is run. This is to make sure that the ori=
ginally<br>
&gt; -# resolved dns has not changed. If this is something that does not ha=
ppen in<br>
&gt; -# your environment, set this value to False.<br>
&gt; -#dns_check: True<br>
&gt; +# The grains can be merged, instead of overridden, using this option.=
<br>
&gt; +# This allows custom grains to defined different subvalues of a dicti=
onary<br>
&gt; +# grain. By default this feature is disabled, to enable set grains_de=
ep_merge<br>
&gt; +# to ``True``.<br>
&gt; +#grains_deep_merge: False<br>
&gt; +<br>
&gt; +# The grains_refresh_every setting allows for a minion to periodicall=
y check<br>
&gt; +# its grains to see if they have changed and, if so, to inform the ma=
ster<br>
&gt; +# of the new grains. This operation is moderately expensive, therefor=
e<br>
&gt; +# care should be taken not to set this value too low.<br>
&gt; +#<br>
&gt; +# Note: This value is expressed in __minutes__!<br>
&gt; +#<br>
&gt; +# A value of 10 minutes is a reasonable default.<br>
&gt; +#<br>
&gt; +# If the value is set to zero, this check is disabled.<br>
&gt; +#grains_refresh_every: 1<br>
&gt; +<br>
&gt; +# Cache grains on the minion. Default is False.<br>
&gt; +#grains_cache: False<br>
&gt; +<br>
&gt; +# Cache rendered pillar data on the minion. Default is False.<br>
&gt; +# This may cause &#39;cachedir&#39;/pillar to contain sensitive data =
that should be<br>
&gt; +# protected accordingly.<br>
&gt; +#minion_pillar_cache: False<br>
&gt; +<br>
&gt; +# Grains cache expiration, in seconds. If the cache file is older tha=
n this<br>
&gt; +# number of seconds then the grains cache will be dumped and fully re=
-populated<br>
&gt; +# with fresh data. Defaults to 5 minutes. Will have no effect if &#39=
;grains_cache&#39;<br>
&gt; +# is not enabled.<br>
&gt; +# grains_cache_expiration: 300<br>
&gt;<br>
&gt;=C2=A0 # Windows platforms lack posix IPC and must rely on slower TCP b=
ased inter-<br>
&gt;=C2=A0 # process communications. Set ipc_mode to &#39;tcp&#39; on such =
systems<br>
&gt;=C2=A0 #ipc_mode: ipc<br>
&gt; -#<br>
&gt; +<br>
&gt;=C2=A0 # Overwrite the default tcp ports used by the minion when in tcp=
 mode<br>
&gt;=C2=A0 #tcp_pub_port: 4510<br>
&gt;=C2=A0 #tcp_pull_port: 4511<br>
&gt;<br>
&gt; +# Passing very large events can cause the minion to consume large amo=
unts of<br>
&gt; +# memory. This value tunes the maximum size of a message allowed onto=
 the<br>
&gt; +# minion event bus. The value is expressed in bytes.<br>
&gt; +#max_event_size: 1048576<br>
&gt; +<br>
&gt; +# To detect failed master(s) and fire events on connect/disconnect, s=
et<br>
&gt; +# master_alive_interval to the number of seconds to poll the masters =
for<br>
&gt; +# connection events.<br>
&gt; +#<br>
&gt; +#master_alive_interval: 30<br>
&gt; +<br>
&gt;=C2=A0 # The minion can include configuration from other files. To enab=
le this,<br>
&gt;=C2=A0 # pass a list of paths to this option. The paths can be either r=
elative or<br>
&gt;=C2=A0 # absolute; if relative, they are considered to be relative to t=
he directory<br>
&gt; @@ -202,7 +312,6 @@<br>
&gt;=C2=A0 # of shell-style globbing. If no files are matched by a path pas=
sed to this<br>
&gt;=C2=A0 # option then the minion will log a warning message.<br>
&gt;=C2=A0 #<br>
&gt; -#<br>
&gt;=C2=A0 # Include a config file from some other path:<br>
&gt;=C2=A0 # include: /etc/salt/extra_config<br>
&gt;=C2=A0 #<br>
&gt; @@ -210,11 +319,13 @@<br>
&gt;=C2=A0 #include:<br>
&gt;=C2=A0 #=C2=A0 - /etc/salt/extra_config<br>
&gt;=C2=A0 #=C2=A0 - /etc/roles/webserver<br>
&gt; -<br>
&gt; +#<br>
&gt; +#<br>
&gt; +#<br>
&gt;=C2=A0 #####=C2=A0 =C2=A0Minion module management=C2=A0 =C2=A0 =C2=A0##=
###<br>
&gt;=C2=A0 ##########################################<br>
&gt;=C2=A0 # Disable specific modules. This allows the admin to limit the l=
evel of<br>
&gt; -# access the master has to the minion<br>
&gt; +# access the master has to the minion.<br>
&gt;=C2=A0 #disable_modules: [cmd,test]<br>
&gt;=C2=A0 #disable_returners: []<br>
&gt;=C2=A0 #<br>
&gt; @@ -226,18 +337,22 @@<br>
&gt;=C2=A0 #returner_dirs: []<br>
&gt;=C2=A0 #states_dirs: []<br>
&gt;=C2=A0 #render_dirs: []<br>
&gt; +#utils_dirs: []<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # A module provider can be statically overwritten or extended fo=
r the minion<br>
&gt;=C2=A0 # via the providers option, in this case the default module will=
 be<br>
&gt;=C2=A0 # overwritten by the specified module. In this example the pkg m=
odule will<br>
&gt;=C2=A0 # be provided by the yumpkg5 module instead of the system defaul=
t.<br>
&gt; -#<br>
&gt;=C2=A0 #providers:<br>
&gt;=C2=A0 #=C2=A0 pkg: yumpkg5<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # Enable Cython modules searching and loading. (Default: False)<=
br>
&gt;=C2=A0 #cython_enable: False<br>
&gt;=C2=A0 #<br>
&gt; +# Specify a max size (in bytes) for modules on import. This feature i=
s currently<br>
&gt; +# only supported on *nix operating systems and requires psutil.<br>
&gt; +# modules_max_memory: -1<br>
&gt; +<br>
&gt;<br>
&gt;=C2=A0 #####=C2=A0 =C2=A0 State Management Settings=C2=A0 =C2=A0 #####<=
br>
&gt;=C2=A0 ###########################################<br>
&gt; @@ -256,21 +371,19 @@<br>
&gt;=C2=A0 #renderer: yaml_jinja<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # The failhard option tells the minions to stop immediately afte=
r the first<br>
&gt; -# failure detected in the state execution, defaults to False<br>
&gt; +# failure detected in the state execution. Defaults to False.<br>
&gt;=C2=A0 #failhard: False<br>
&gt;=C2=A0 #<br>
&gt; -# autoload_dynamic_modules Turns on automatic loading of modules foun=
d in the<br>
&gt; -# environments on the master. This is turned on by default, to turn o=
f<br>
&gt; -# autoloading modules when states run set this value to False<br>
&gt; +# Reload the modules prior to a highstate run.<br>
&gt;=C2=A0 #autoload_dynamic_modules: True<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # clean_dynamic_modules keeps the dynamic modules on the minion =
in sync with<br>
&gt;=C2=A0 # the dynamic modules on the master, this means that if a dynami=
c module is<br>
&gt; -# not on the master it will be deleted from the minion. By default th=
is is<br>
&gt; -# enabled and can be disabled by changing this value to False<br>
&gt; +# not on the master it will be deleted from the minion. By default, t=
his is<br>
&gt; +# enabled and can be disabled by changing this value to False.<br>
&gt;=C2=A0 #clean_dynamic_modules: True<br>
&gt;=C2=A0 #<br>
&gt; -# Normally the minion is not isolated to any single environment on th=
e master<br>
&gt; +# Normally, the minion is not isolated to any single environment on t=
he master<br>
&gt;=C2=A0 # when running states, but the environment can be isolated on th=
e minion side<br>
&gt;=C2=A0 # by statically setting it. Remember that the recommended way to=
 manage<br>
&gt;=C2=A0 # environments is to isolate via the top file.<br>
&gt; @@ -286,14 +399,23 @@<br>
&gt;=C2=A0 # &#39;top&#39; -- Read top_file option and execute based on tha=
t file on the Master<br>
&gt;=C2=A0 #startup_states: &#39;&#39;<br>
&gt;=C2=A0 #<br>
&gt; -# list of states to run when the minion starts up if startup_states i=
s &#39;sls&#39;<br>
&gt; +# List of states to run when the minion starts up if startup_states i=
s &#39;sls&#39;:<br>
&gt;=C2=A0 #sls_list:<br>
&gt;=C2=A0 #=C2=A0 - edit.vim<br>
&gt;=C2=A0 #=C2=A0 - hyper<br>
&gt;=C2=A0 #<br>
&gt; -# top file to execute if startup_states is &#39;top&#39;<br>
&gt; +# Top file to execute if startup_states is &#39;top&#39;:<br>
&gt;=C2=A0 #top_file: &#39;&#39;<br>
&gt;<br>
&gt; +# Automatically aggregate all states that have support for mod_aggreg=
ate by<br>
&gt; +# setting to True. Or pass a list of state module names to automatica=
lly<br>
&gt; +# aggregate just those types.<br>
&gt; +#<br>
&gt; +# state_aggregate:<br>
&gt; +#=C2=A0 =C2=A0- pkg<br>
&gt; +#<br>
&gt; +#state_aggregate: False<br>
&gt; +<br>
&gt;=C2=A0 #####=C2=A0 =C2=A0 =C2=A0File Directory Settings=C2=A0 =C2=A0 ##=
###<br>
&gt;=C2=A0 ##########################################<br>
&gt;=C2=A0 # The Salt Minion can redirect all file server operations to a l=
ocal directory,<br>
&gt; @@ -303,7 +425,8 @@<br>
&gt;<br>
&gt;=C2=A0 # Set the file client. The client defaults to looking on the mas=
ter server for<br>
&gt;=C2=A0 # files, but can be directed to look at the local file directory=
 setting<br>
&gt; -# defined below by setting it to local.<br>
&gt; +# defined below by setting it to &quot;local&quot;. Setting a local f=
ile_client runs the<br>
&gt; +# minion in masterless mode.<br>
&gt;=C2=A0 #file_client: remote<br>
&gt;<br>
&gt;=C2=A0 # The file directory works on environments passed to the minion,=
 each environment<br>
&gt; @@ -329,15 +452,16 @@<br>
&gt;=C2=A0 # to attempt to find files. To limit this behavior so that the f=
ileserver only<br>
&gt;=C2=A0 # traverses directories with SLS files and special Salt director=
ies like _modules,<br>
&gt;=C2=A0 # enable the option below. This might be useful for installation=
s where a file root<br>
&gt; -# has a very large number of files and performance is negatively impa=
cted.<br>
&gt; -#<br>
&gt; -# Default is False.<br>
&gt; -#<br>
&gt; -# fileserver_limit_traversal: False<br>
&gt; +# has a very large number of files and performance is negatively impa=
cted. Default<br>
&gt; +# is False.<br>
&gt; +#fileserver_limit_traversal: False<br>
&gt;<br>
&gt;=C2=A0 # The hash_type is the hash to use when discovering the hash of =
a file in<br>
&gt;=C2=A0 # the local fileserver. The default is md5, but sha1, sha224, sh=
a256, sha384<br>
&gt;=C2=A0 # and sha512 are also supported.<br>
&gt; +#<br>
&gt; +# Warning: Prior to changing this value, the minion should be stopped=
 and all<br>
&gt; +# Salt caches should be cleared.<br>
&gt;=C2=A0 #hash_type: md5<br>
&gt;<br>
&gt;=C2=A0 # The Salt pillar is searched for locally if file_client is set =
to local. If<br>
&gt; @@ -346,7 +470,8 @@<br>
&gt;=C2=A0 #pillar_roots:<br>
&gt;=C2=A0 #=C2=A0 base:<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 - /srv/pillar<br>
&gt; -<br>
&gt; +#<br>
&gt; +#<br>
&gt;=C2=A0 ######=C2=A0 =C2=A0 =C2=A0 =C2=A0 Security settings=C2=A0 =C2=A0=
 =C2=A0 =C2=A0#####<br>
&gt;=C2=A0 ###########################################<br>
&gt;=C2=A0 # Enable &quot;open mode&quot;, this mode still maintains encryp=
tion, but turns off<br>
&gt; @@ -366,23 +491,34 @@<br>
&gt;=C2=A0 # The state_verbose setting can be set to True or False, when se=
t to False<br>
&gt;=C2=A0 # all data that has a result of True and no changes will be supp=
ressed.<br>
&gt;=C2=A0 #state_verbose: True<br>
&gt; -#<br>
&gt; +<br>
&gt;=C2=A0 # The state_output setting changes if the output is the full mul=
ti line<br>
&gt;=C2=A0 # output for each changed state if set to &#39;full&#39;, but if=
 set to &#39;terse&#39;<br>
&gt;=C2=A0 # the output will be shortened to a single line.<br>
&gt;=C2=A0 #state_output: full<br>
&gt; -#<br>
&gt; -# Fingerprint of the master public key to double verify the master is=
 valid,<br>
&gt; -# the master fingerprint can be found by running &quot;salt-key -F ma=
ster&quot; on the<br>
&gt; -# salt master.<br>
&gt; +<br>
&gt; +# The state_output_diff setting changes whether or not the output fro=
m<br>
&gt; +# successful states is returned. Useful when even the terse output of=
 these<br>
&gt; +# states is cluttering the logs. Set it to True to ignore them.<br>
&gt; +#state_output_diff: False<br>
&gt; +<br>
&gt; +# The state_output_profile setting changes whether profile informatio=
n<br>
&gt; +# will be shown for each state run.<br>
&gt; +#state_output_profile: True<br>
&gt; +<br>
&gt; +# Fingerprint of the master public key to validate the identity of yo=
ur Salt master<br>
&gt; +# before the initial key exchange. The master fingerprint can be foun=
d by running<br>
&gt; +# &quot;salt-key -F master&quot; on the Salt master.<br>
&gt;=C2=A0 #master_finger: &#39;&#39;<br>
&gt;<br>
&gt; +<br>
&gt;=C2=A0 ######=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thread settings=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 #####<br>
&gt;=C2=A0 ###########################################<br>
&gt;=C2=A0 # Disable multiprocessing support, by default when a minion rece=
ives a<br>
&gt;=C2=A0 # publication a new process is spawned and the command is execut=
ed therein.<br>
&gt;=C2=A0 #multiprocessing: True<br>
&gt;<br>
&gt; +<br>
&gt;=C2=A0 #####=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Logging settings=C2=A0 =
=C2=A0 =C2=A0 =C2=A0#####<br>
&gt;=C2=A0 ##########################################<br>
&gt;=C2=A0 # The location of the minion log file<br>
&gt; @@ -396,14 +532,19 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 #log_file: /var/log/salt/minion<br>
&gt;=C2=A0 #key_logfile: /var/log/salt/key<br>
&gt; -#<br>
&gt; +<br>
&gt;=C2=A0 # The level of messages to send to the console.<br>
&gt;=C2=A0 # One of &#39;garbage&#39;, &#39;trace&#39;, &#39;debug&#39;, in=
fo&#39;, &#39;warning&#39;, &#39;error&#39;, &#39;critical&#39;.<br>
&gt; +#<br>
&gt; +# The following log levels are considered INSECURE and may log sensit=
ive data:<br>
&gt; +# [&#39;garbage&#39;, &#39;trace&#39;, &#39;debug&#39;]<br>
&gt; +#<br>
&gt;=C2=A0 # Default: &#39;warning&#39;<br>
&gt;=C2=A0 #log_level: warning<br>
&gt; -#<br>
&gt; +<br>
&gt;=C2=A0 # The level of messages to send to the log file.<br>
&gt;=C2=A0 # One of &#39;garbage&#39;, &#39;trace&#39;, &#39;debug&#39;, in=
fo&#39;, &#39;warning&#39;, &#39;error&#39;, &#39;critical&#39;.<br>
&gt; +# If using &#39;log_granular_levels&#39; this must be set to the high=
est desired level.<br>
&gt;=C2=A0 # Default: &#39;warning&#39;<br>
&gt;=C2=A0 #log_level_logfile:<br>
&gt;<br>
&gt; @@ -411,21 +552,54 @@<br>
&gt;=C2=A0 # can be seen here: <a href=3D"http://docs.python.org/library/ti=
me.html#time.strftime" rel=3D"noreferrer" target=3D"_blank">http://docs.pyt=
hon.org/library/time.html#time.strftime</a><br>
&gt;=C2=A0 #log_datefmt: &#39;%H:%M:%S&#39;<br>
&gt;=C2=A0 #log_datefmt_logfile: &#39;%Y-%m-%d %H:%M:%S&#39;<br>
&gt; -#<br>
&gt; +<br>
&gt;=C2=A0 # The format of the console logging messages. Allowed formatting=
 options can<br>
&gt;=C2=A0 # be seen here: <a href=3D"http://docs.python.org/library/loggin=
g.html#logrecord-attributes" rel=3D"noreferrer" target=3D"_blank">http://do=
cs.python.org/library/logging.html#logrecord-attributes</a><br>
&gt; +#<br>
&gt; +# Console log colors are specified by these additional formatters:<br=
>
&gt; +#<br>
&gt; +# %(colorlevel)s<br>
&gt; +# %(colorname)s<br>
&gt; +# %(colorprocess)s<br>
&gt; +# %(colormsg)s<br>
&gt; +#<br>
&gt; +# Since it is desirable to include the surrounding brackets, &#39;[&#=
39; and &#39;]&#39;, in<br>
&gt; +# the coloring of the messages, these color formatters also include p=
adding as<br>
&gt; +# well.=C2=A0 Color LogRecord attributes are only available for conso=
le logging.<br>
&gt; +#<br>
&gt; +#log_fmt_console: &#39;%(colorlevel)s %(colormsg)s&#39;<br>
&gt;=C2=A0 #log_fmt_console: &#39;[%(levelname)-8s] %(message)s&#39;<br>
&gt; -#log_fmt_logfile: &#39;%(asctime)s,%(msecs)03.0f [%(name)-17s][%(leve=
lname)-8s] %(message)s&#39;<br>
&gt;=C2=A0 #<br>
&gt; +#log_fmt_logfile: &#39;%(asctime)s,%(msecs)03.0f [%(name)-17s][%(leve=
lname)-8s] %(message)s&#39;<br>
&gt; +<br>
&gt;=C2=A0 # This can be used to control logging levels more specificically=
.=C2=A0 This<br>
&gt;=C2=A0 # example sets the main salt library at the &#39;warning&#39; le=
vel, but sets<br>
&gt;=C2=A0 # &#39;salt.modules&#39; to log at the &#39;debug&#39; level:<br=
>
&gt;=C2=A0 #=C2=A0 =C2=A0log_granular_levels:<br>
&gt; -#=C2=A0 =C2=A0 =C2=A0&#39;salt&#39;: &#39;warning&#39;,<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0&#39;salt&#39;: &#39;warning&#39;<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0&#39;salt.modules&#39;: &#39;debug&#39;<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 #log_granular_levels: {}<br>
&gt;<br>
&gt; +# To diagnose issues with minions disconnecting or missing returns, Z=
eroMQ<br>
&gt; +# supports the use of monitor sockets to log connection events. This<=
br>
&gt; +# feature requires ZeroMQ 4.0 or higher.<br>
&gt; +#<br>
&gt; +# To enable ZeroMQ monitor sockets, set &#39;zmq_monitor&#39; to &#39=
;True&#39; and log at a<br>
&gt; +# debug level or higher.<br>
&gt; +#<br>
&gt; +# A sample log event is as follows:<br>
&gt; +#<br>
&gt; +# [DEBUG=C2=A0 =C2=A0] ZeroMQ event: {&#39;endpoint&#39;: &#39;tcp://=
<a href=3D"http://127.0.0.1:4505" rel=3D"noreferrer" target=3D"_blank">127.=
0.0.1:4505</a>&#39;, &#39;event&#39;: 512,<br>
&gt; +# &#39;value&#39;: 27, &#39;description&#39;: &#39;EVENT_DISCONNECTED=
&#39;}<br>
&gt; +#<br>
&gt; +# All events logged will include the string &#39;ZeroMQ event&#39;. A=
 connection event<br>
&gt; +# should be logged as the minion starts up and initially connects to =
the<br>
&gt; +# master. If not, check for debug log level and that the necessary ve=
rsion of<br>
&gt; +# ZeroMQ is installed.<br>
&gt; +#<br>
&gt; +#zmq_monitor: False<br>
&gt; +<br>
&gt;=C2=A0 ######=C2=A0 =C2=A0 =C2=A0 Module configuration=C2=A0 =C2=A0 =C2=
=A0 #####<br>
&gt;=C2=A0 ###########################################<br>
&gt;=C2=A0 # Salt allows for modules to be passed arbitrary configuration d=
ata, any data<br>
&gt; @@ -445,8 +619,8 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # A dict for the test module:<br>
&gt;=C2=A0 #test.baz: {spam: sausage, cheese: bread}<br>
&gt; -<br>
&gt; -<br>
&gt; +#<br>
&gt; +#<br>
&gt;=C2=A0 ######=C2=A0 =C2=A0 =C2=A0 Update settings=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ######<br>
&gt;=C2=A0 ###########################################<br>
&gt;=C2=A0 # Using the features in Esky, a salt minion can both run as a fr=
ozen app and<br>
&gt; @@ -468,27 +642,39 @@<br>
&gt;=C2=A0 # the risk that it could tear down the connection the master and=
 minion<br>
&gt;=C2=A0 # without informing either party that their connection has been =
taken away.<br>
&gt;=C2=A0 # Enabling TCP Keepalives prevents this from happening.<br>
&gt; -#<br>
&gt; +<br>
&gt;=C2=A0 # Overall state of TCP Keepalives, enable (1 or True), disable (=
0 or False)<br>
&gt;=C2=A0 # or leave to the OS defaults (-1), on Linux, typically disabled=
. Default True, enabled.<br>
&gt;=C2=A0 #tcp_keepalive: True<br>
&gt; -#<br>
&gt; +<br>
&gt;=C2=A0 # How long before the first keepalive should be sent in seconds.=
 Default 300<br>
&gt;=C2=A0 # to send the first keepalive after 5 minutes, OS default (-1) i=
s typically 7200 seconds<br>
&gt;=C2=A0 # on Linux see /proc/sys/net/ipv4/tcp_keepalive_time.<br>
&gt;=C2=A0 #tcp_keepalive_idle: 300<br>
&gt; -#<br>
&gt; +<br>
&gt;=C2=A0 # How many lost probes are needed to consider the connection los=
t. Default -1<br>
&gt;=C2=A0 # to use OS defaults, typically 9 on Linux, see /proc/sys/net/ip=
v4/tcp_keepalive_probes.<br>
&gt;=C2=A0 #tcp_keepalive_cnt: -1<br>
&gt; -#<br>
&gt; +<br>
&gt;=C2=A0 # How often, in seconds, to send keepalives after the first one.=
 Default -1 to<br>
&gt;=C2=A0 # use OS defaults, typically 75 seconds on Linux, see<br>
&gt;=C2=A0 # /proc/sys/net/ipv4/tcp_keepalive_intvl.<br>
&gt;=C2=A0 #tcp_keepalive_intvl: -1<br>
&gt;<br>
&gt;<br>
&gt; -######=C2=A0 =C2=A0 =C2=A0 Windows Software settings ######<br>
&gt; +######=C2=A0 =C2=A0Windows Software settings=C2=A0 =C2=A0 ######<br>
&gt;=C2=A0 ############################################<br>
&gt; -# Location of the repository cache file on the master<br>
&gt; +# Location of the repository cache file on the master:<br>
&gt;=C2=A0 #win_repo_cachefile: &#39;salt://win/repo/winrepo.p&#39;<br>
&gt; +<br>
&gt; +<br>
&gt; +######=C2=A0 =C2=A0 =C2=A0 Returner=C2=A0 settings=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ######<br>
&gt; +############################################<br>
&gt; +# Which returner(s) will be used for minion&#39;s result:<br>
&gt; +#return: mysql<br>
&gt; +<br>
&gt; +<br>
&gt; +######=C2=A0 =C2=A0 Miscellaneous=C2=A0 settings=C2=A0 =C2=A0 =C2=A0#=
#####<br>
&gt; +############################################<br>
&gt; +# Default match type for filtering events tags: startswith, endswith,=
 find, regex, fnmatch<br>
&gt; +#event_match_type: startswith<br>
&gt; diff --git a/meta-openstack/recipes-support/salt/files/roster b/meta-o=
penstack/recipes-support/salt/files/roster<br>
&gt; index 3eac2fa..e5a8318 100644<br>
&gt; --- a/meta-openstack/recipes-support/salt/files/roster<br>
&gt; +++ b/meta-openstack/recipes-support/salt/files/roster<br>
&gt; @@ -6,3 +6,4 @@<br>
&gt;=C2=A0 #=C2=A0 sudo: True=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Whether to=
 sudo to root, not enabled by default<br>
&gt;=C2=A0 #web2:<br>
&gt;=C2=A0 #=C2=A0 host: 192.168.42.2<br>
&gt; +<br>
&gt; diff --git a/meta-openstack/recipes-support/salt/<a href=3D"http://sal=
t_2015.8.0.bb" rel=3D"noreferrer" target=3D"_blank">salt_2015.8.0.bb</a> b/=
meta-openstack/recipes-support/salt/<a href=3D"http://salt_2016.3.0.bb" rel=
=3D"noreferrer" target=3D"_blank">salt_2016.3.0.bb</a><br>
&gt; similarity index 88%<br>
&gt; rename from meta-openstack/recipes-support/salt/<a href=3D"http://salt=
_2015.8.0.bb" rel=3D"noreferrer" target=3D"_blank">salt_2015.8.0.bb</a><br>
&gt; rename to meta-openstack/recipes-support/salt/<a href=3D"http://salt_2=
016.3.0.bb" rel=3D"noreferrer" target=3D"_blank">salt_2016.3.0.bb</a><br>
&gt; index b22b827..c5620c6 100644<br>
&gt; --- a/meta-openstack/recipes-support/salt/<a href=3D"http://salt_2015.=
8.0.bb" rel=3D"noreferrer" target=3D"_blank">salt_2015.8.0.bb</a><br>
&gt; +++ b/meta-openstack/recipes-support/salt/<a href=3D"http://salt_2016.=
3.0.bb" rel=3D"noreferrer" target=3D"_blank">salt_2016.3.0.bb</a><br>
&gt; @@ -1,18 +1,20 @@<br>
&gt;=C2=A0 HOMEPAGE =3D &quot;<a href=3D"http://saltstack.com/" rel=3D"nore=
ferrer" target=3D"_blank">http://saltstack.com/</a>&quot;<br>
&gt;=C2=A0 SECTION =3D &quot;admin&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Db59c9134761722281bb89=
5f65cb15e9a&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dfb92f464675f6b5df90f5=
40d60237915&quot;<br>
&gt;=C2=A0 DEPENDS =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python-msgpack \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python-pyyaml \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python-jinja2 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python-markupsafe \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python-pyzmq \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python-pycrypto \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; +PACKAGECONFIG ??=3D &quot;zeromq&quot;<br>
&gt; +PACKAGECONFIG[zeromq] =3D &quot;,,python-pyzmq python-pycrypto,&quot;=
<br>
&gt; +PACKAGECONFIG[tcp] =3D &quot;,,python-pycrypto&quot;<br>
&gt; +<br>
&gt;=C2=A0 SRCNAME =3D &quot;salt&quot;<br>
&gt; -SRC_URI =3D &quot;<a href=3D"http://pypi.python.org/packages/source/s=
/${SRCNAME}/${SRCNAME}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">h=
ttp://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz<=
/a> \<br>
&gt; +SRC_URI =3D &quot;<a href=3D"http://pypi.python.org/packages/75/db/c0=
72687e77ad616ba395cc8be50fff093fb71b7fc1f5c225f42eee130bf5/${SRCNAME}-${PV}=
.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://pypi.python.org/packag=
es/75/db/c072687e77ad616ba395cc8be50fff093fb71b7fc1f5c225f42eee130bf5/${SRC=
NAME}-${PV}.tar.gz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://set_python_locat=
ion_hashbang.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://minion \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://salt-minion \<br=
>
&gt; @@ -26,8 +28,8 @@ SRC_URI =3D &quot;<a href=3D"http://pypi.python.org/=
packages/source/s/${SRCNAME}/${SRCNAME}-${PV}" rel=3D"noreferrer" target=3D=
"_blank">http://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${P=
V}</a>.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://roster \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;a15842ef0582cca9d26143fe0a6180b7&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;71e1cb2eb1d4b30f3247f5590c00a2089190b8f9=
a90c9330dc9a65fae517ec9b&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;8ed82cfb3f9b1764a035edbdacf0fea9&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;e316dd103b7faeaa97820197e4d0d7d358519f0c=
a2a6dcb1d9b718eea801ed30&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
&gt;<br>
&gt; @@ -77,7 +79,9 @@ Between the remote execution system, and state manag=
ement Salt addresses the bac<br>
&gt;<br>
&gt;=C2=A0 SUMMARY_${PN}-minion =3D &quot;client package for salt, the dist=
ributed remote execution system&quot;<br>
&gt;=C2=A0 DESCRIPTION_${PN}-minion =3D &quot;${DESCRIPTION_COMMON} This pa=
rticular package provides the worker agent for salt.&quot;<br>
&gt; -RDEPENDS_${PN}-minion =3D &quot;python (&gt;=3D2.6), ${PN}-common (=
=3D ${EXTENDPKGV}) python-pycrypto python-msgpack python-pyzmq (&gt;=3D 13.=
1.0)&quot;<br>
&gt; +RDEPENDS_${PN}-minion =3D &quot;python (&gt;=3D2.6), ${PN}-common (=
=3D ${EXTENDPKGV}) python-msgpack&quot;<br>
&gt; +RDEPENDS_${PN}-minion +=3D &quot;${@bb.utils.contains(&#39;PACKAGECON=
FIG&#39;, &#39;zeromq&#39;, &#39;python-pycrypto python-pyzmq (&gt;=3D 13.1=
.0)&#39;, &#39;&#39;,d)}&quot;<br>
&gt; +RDEPENDS_${PN}-minion +=3D &quot;${@bb.utils.contains(&#39;PACKAGECON=
FIG&#39;, &#39;tcp&#39;, &#39;python-pycrypto&#39;, &#39;&#39;,d)}&quot;<br=
>
&gt;=C2=A0 RRECOMMENDS_${PN}-minion_append_x64 =3D &quot;dmidecode&quot;<br=
>
&gt;=C2=A0 RSUGGESTS_${PN}-minion =3D &quot;python-augeas&quot;<br>
&gt;=C2=A0 CONFFILES_${PN}-minion =3D &quot;${sysconfdir}/${PN}/minion ${sy=
sconfdir}/init.d/${PN}-minion&quot;<br>
&gt; @@ -118,7 +122,9 @@ INITSCRIPT_PARAMS_${PN}-api =3D &quot;defaults&quo=
t;<br>
&gt;<br>
&gt;=C2=A0 SUMMARY_${PN}-master =3D &quot;remote manager to administer serv=
ers via salt&quot;<br>
&gt;=C2=A0 DESCRIPTION_${PN}-master =3D&quot;${DESCRIPTION_COMMON} This par=
ticular package provides the salt controller.&quot;<br>
&gt; -RDEPENDS_${PN}-master =3D &quot;python (&gt;=3D 2.6) ${PN}-common (=
=3D ${EXTENDPKGV}) python-pycrypto python-msgpack python-pyzmq (&gt;=3D 13.=
1.0)&quot;<br>
&gt; +RDEPENDS_${PN}-master =3D &quot;python (&gt;=3D 2.6) ${PN}-common (=
=3D ${EXTENDPKGV}) python-msgpack&quot;<br>
&gt; +RDEPENDS_${PN}-master +=3D &quot;${@bb.utils.contains(&#39;PACKAGECON=
FIG&#39;, &#39;zeromq&#39;, &#39;python-pycrypto python-pyzmq (&gt;=3D 13.1=
.0)&#39;, &#39;&#39;,d)}&quot;<br>
&gt; +RDEPENDS_${PN}-master +=3D &quot;${@bb.utils.contains(&#39;PACKAGECON=
FIG&#39;, &#39;tcp&#39;, &#39;python-pycrypto&#39;, &#39;&#39;,d)}&quot;<br=
>
&gt;=C2=A0 CONFFILES_${PN}-master=3D&quot;${sysconfdir}/init.d/${PN}-master=
=C2=A0 ${sysconfdir}/${PN}/master&quot;<br>
&gt;=C2=A0 RSUGGESTS_${PN}-master =3D &quot;python-git&quot;<br>
&gt;=C2=A0 FILES_${PN}-master =3D &quot;${bindir}/${PN} ${bindir}/${PN}-cp =
${bindir}/${PN}-key ${bindir}/${PN}-master ${bindir}/${PN}-run ${bindir}/${=
PN}-unity ${bindir}/spm ${CONFFILES_${PN}-master}&quot;<br>
&gt;<br>
<br>
--<br>
</div></div>Cheers,<br>
<br>
Alejandro<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--94eb2c056214d1717c0534ef14fc--
