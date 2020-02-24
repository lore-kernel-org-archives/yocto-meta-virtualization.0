Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.83])
 by mx.groups.io with SMTP id smtpd.web11.2043.1582574766227587213
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 24 Feb 2020 12:06:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@opengear.com header.s=selector1 header.b=A1r/8rRs;
 spf=pass (domain: opengear.com, ip: 40.107.243.83, mailfrom: paulo.fagundes@opengear.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mj45HNycU0CgMsM6ydyuMlYWmc6+Vm8AYRA4dtQhv2iaZYjEoyANlAYPLOv5aE0FQ7S3Y7zTQfOQnPRFczhoRiHw1lvz26CGROcmLEFBkzo+nkEUlePi7v3dYSPa7wZkXU0KYgtBjfT8TStqfWAf01viaCgTXuS3g7MlbETUSeitc2RTsdCS6MPRwQJGF7jaSh4RH1VN5rF7p0OjpgzEZUo8CcWqHxbHyi1ZSeoIQoZsQt/SAIHj9ChxUcFisJnguQLLiHBuW7DDnBVfGTbKQYInorOaC3v9Ozei/0J0cqkm8e0ZVqaVaR1+dglcsp2JGQNVbejzMOhzJQegDPm2wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGltUOJRwJ4yCdaZRb2y46hwD4vcTL76SgnCRVF6qzw=;
 b=OTMleoZ+s7hAXPCLkRWMyIpCk//x912LB42Ohgd5/CCMyJz48ZuiTcFghsLi5Do2Y6jN3y7EWMarcYY5bEGp+BBnyaS54gcIyH/FaTy8C5gBXL4q+LgRmcumX79kB5fjFiUiA1vQJFDmF8Iuzd0u4ZI/zzjsABVQX5wo9EugXD/umQR+KizPdNZyDPmwM719sbrW2oBf+BjFLpd85tq308wcMTCqHQMAVvQ32YIE77Qpcq+B+maGsLwIdpHcZGjUVxSAFeYdWqRmbGLRsKx7tA16idwsxVCo3Y4VEfLCeZ82hlTedFEjKFwZmwiD2qhccpNUVO+k+dGWTdEEm0OzgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opengear.com; dmarc=pass action=none header.from=opengear.com;
 dkim=pass header.d=opengear.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGltUOJRwJ4yCdaZRb2y46hwD4vcTL76SgnCRVF6qzw=;
 b=A1r/8rRs6vvSepqLkQb8epjyjoGMIhibDdj1SJKVB0WWaue9FCkcNXeMv3tn4k1nTyUGatXYTzqsnD5dcPa/WkPbv98otCOwqYvjc27PCDV38lbTEkqzey/CnQrMVhoM2AkSlQhs0kBrLNjsApz8wl1YlpkfIbnRPncWGkQ80rg=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=paulo.fagundes@opengear.com; 
Received: from MW2PR1501MB2185.namprd15.prod.outlook.com
 (2603:10b6:302:12::32) by MW2PR1501MB2171.namprd15.prod.outlook.com
 (2603:10b6:302:13::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.31; Mon, 24 Feb
 2020 20:05:52 +0000
Received: from MW2PR1501MB2185.namprd15.prod.outlook.com
 ([fe80::e862:7c3d:11bc:8d9d]) by MW2PR1501MB2185.namprd15.prod.outlook.com
 ([fe80::e862:7c3d:11bc:8d9d%4]) with mapi id 15.20.2750.021; Mon, 24 Feb 2020
 20:05:52 +0000
From: "Fagundes, Paulo" <paulo.fagundes@opengear.com>
To: meta-virtualization@lists.yoctoproject.org
CC: Paulo Fagundes <paulo.fagundes@opengear.com>
Subject: [[meta-virtualization][m-c-s][PATCH]] salt: bump 2018.3 -> 3000
Date: Mon, 24 Feb 2020 13:07:05 -0700
Message-ID: <20200224200705.3445460-1-paulo.fagundes@opengear.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: BYAPR08CA0016.namprd08.prod.outlook.com
 (2603:10b6:a03:100::29) To MW2PR1501MB2185.namprd15.prod.outlook.com
 (2603:10b6:302:12::32)
Return-Path: paulo.fagundes@opengear.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from paulof.sandy.opengear.com (76.8.212.3) by BYAPR08CA0016.namprd08.prod.outlook.com (2603:10b6:a03:100::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.22 via Frontend Transport; Mon, 24 Feb 2020 20:05:51 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [76.8.212.3]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07e0ef53-bc91-4fb7-cf6f-08d7b964f2f8
X-MS-TrafficTypeDiagnostic: MW2PR1501MB2171:|MW2PR1501MB2171:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW2PR1501MB217176BB6F7AD60E698A3B21F0EC0@MW2PR1501MB2171.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 032334F434
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(4636009)(376002)(396003)(346002)(136003)(366004)(39840400004)(189003)(199004)(6916009)(107886003)(2906002)(956004)(66946007)(2616005)(66476007)(30864003)(66556008)(18074004)(6666004)(86362001)(8936002)(44832011)(8676002)(1076003)(66574012)(81156014)(36756003)(5660300002)(316002)(81166006)(478600001)(16526019)(966005)(7696005)(186003)(52116002)(26005)(6486002)(4326008)(579004)(559001);DIR:OUT;SFP:1101;SCL:1;SRVR:MW2PR1501MB2171;H:MW2PR1501MB2185.namprd15.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: opengear.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sPDHKyQ3HTsDPPdjdPQfCuJAN4FfBFGocn7GcRDeZ5XgY/r/T7uGp64/IlJdQnCUgO15I6vZp6PEeVIvaNcvTXUw8Gw7Az4NKjEQRwjQto4gU6vAqCdi+R4Ts4kCLS/kZVBPEcW120ZSMZ/DtZ1b03A9YmsJB0CSht3AJnFi+rmqNgih/W6ta4WhuvW/9UxWWf4JFtZ3IY3dDiu+gMfA5za5FTIS5Uaq1QmAu16h2wjXiv/2LjpUb8GsgyuF1gnSOQzZ6j4QMt1iA9dz7lr6/NqRmxBGAOpThYfBW+0C4Xq4FSZdAwGCGDW45hLg3IDqSQ6mL9Oml3aA2eyARDoLb9CSYZMu20SUnXW6mdbi58gH8BU1GBBiEpPqFG4JmGNq8Rxqe50Fq2cVm5A3UzM7X/JbnE9GIwFibsWZC5gs8eKAmxcLy7Lo4Myfd1//atakiRC3rbMVqGq4ccsWAGVYxMBVem4OdaMfGuQTueR5Gj+7Ojyt2lb7k542FSmNbQWSiXMUjLrnYqsKtYHOz/ZAJg==
X-MS-Exchange-AntiSpam-MessageData: 
	r3b4S6nW9joC3fj1ip2+5O89poBK78Ib0/7bBXqCp2PAdP8zU0oaX0Q69zJNrnJoG3BMfojEDST3ukZiJ7aveftDvO4/f1nOjavwAUdB/BfOc3Mre0a4aPWm7kiq2E2c7ShKGsuFAL86Fd3FeEEvjA==
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e0ef53-bc91-4fb7-cf6f-08d7b964f2f8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2020 20:05:52.3593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BBrvnVwtqzRHG90Y1zr1TLKnunPZN4aWCaEKzBAENU206Ib6GB70H57QdTuw79U6eVuOgfRv6y3PAfm9RuVtK3z23IzjnNOQaWwJ4mbENo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR1501MB2171
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Paulo Fagundes <paulo.fagundes@opengear.com>
---
 .../recipes-support/salt/files/cloud          |   99 --
 .../recipes-support/salt/files/master         | 1034 -----------------
 .../recipes-support/salt/files/minion         |  802 -------------
 .../recipes-support/salt/files/roster         |    9 -
 .../recipes-support/salt/files/salt-api       |  110 --
 .../salt/files/salt-common.bash_completion    |  332 ------
 .../salt/files/salt-common.logrotate          |   23 -
 .../recipes-support/salt/files/salt-master    |  111 --
 .../recipes-support/salt/files/salt-minion    |  111 --
 .../recipes-support/salt/files/salt-syndic    |  111 --
 .../salt/set_python_location_hashbang.patch   |  145 ++-
 .../salt/{salt_2018.3.0.bb =3D> salt_3000.bb}   |  105 +-
 12 files changed, 148 insertions(+), 2844 deletions(-)
 delete mode 100644 meta-openstack/recipes-support/salt/files/cloud
 delete mode 100644 meta-openstack/recipes-support/salt/files/master
 delete mode 100644 meta-openstack/recipes-support/salt/files/minion
 delete mode 100644 meta-openstack/recipes-support/salt/files/roster
 delete mode 100755 meta-openstack/recipes-support/salt/files/salt-api
 delete mode 100644 meta-openstack/recipes-support/salt/files/salt-common.b=
ash_completion
 delete mode 100644 meta-openstack/recipes-support/salt/files/salt-common.l=
ogrotate
 delete mode 100755 meta-openstack/recipes-support/salt/files/salt-master
 delete mode 100755 meta-openstack/recipes-support/salt/files/salt-minion
 delete mode 100755 meta-openstack/recipes-support/salt/files/salt-syndic
 rename meta-openstack/recipes-support/salt/{salt_2018.3.0.bb =3D> salt_300=
0.bb} (67%)

diff --git a/meta-openstack/recipes-support/salt/files/cloud b/meta-opensta=
ck/recipes-support/salt/files/cloud
deleted file mode 100644
index 921cc04..0000000
--- a/meta-openstack/recipes-support/salt/files/cloud
+++ /dev/null
@@ -1,99 +0,0 @@
-# This file should normally be installed at: /etc/salt/cloud
-
-
-##########################################
-#####          VM Defaults           #####
-##########################################
-
-# Set the size of minion keys to generate, defaults to 2048
-#
-#keysize: 2048
-
-
-# Set the default os being deployed. This sets which deployment script to
-# apply. This argument is optional.
-#
-#script: bootstrap-salt
-
-
-##########################################
-#####         Logging Settings       #####
-##########################################
-
-# The location of the master log file
-#
-#log_file: /var/log/salt/cloud
-
-
-# The level of messages to send to the console.
-# One of 'garbage', 'trace', 'debug', info', 'warning', 'error', 'critical=
'.
-#
-# The following log levels are considered INSECURE and may log sensitive d=
ata:
-# ['garbage', 'trace', 'debug']
-#
-# Default: 'info'
-#
-#log_level: info
-
-
-# The level of messages to send to the log file.
-# One of 'garbage', 'trace', 'debug', info', 'warning', 'error', 'critical=
'.
-#
-# Default: 'info'
-#
-#log_level_logfile: info
-
-
-# The date and time format used in log messages. Allowed date/time formatt=
ing
-# can be seen here:
-#
-#	http://docs.python.org/library/time.html#time.strftime
-#
-#log_datefmt: '%Y-%m-%d %H:%M:%S'
-
-
-# The format of the console logging messages. Allowed formatting options c=
an
-# be seen here:
-#
-#	http://docs.python.org/library/logging.html#logrecord-attributes
-#
-# Console log colors are specified by these additional formatters:
-#
-# %(colorlevel)s
-# %(colorname)s
-# %(colorprocess)s
-# %(colormsg)s
-#
-# Since it is desirable to include the surrounding brackets, '[' and ']', =
in
-# the coloring of the messages, these color formatters also include paddin=
g as
-# well.  Color LogRecord attributes are only available for console logging=
.
-#
-#log_fmt_console: '%(colorlevel)s %(colormsg)s'
-#log_fmt_console: '[%(levelname)-8s] %(message)s'
-#
-#log_fmt_logfile: '%(asctime)s,%(msecs)03d [%(name)-17s][%(levelname)-8s] =
%(message)s'
-
-
-# Logger levels can be used to tweak specific loggers logging levels.
-# For example, if you want to have the salt library at the 'warning' level=
,
-# but you still wish to have 'salt.modules' at the 'debug' level:
-#
-#   log_granular_levels:
-#     'salt': 'warning',
-#     'salt.modules': 'debug'
-#     'saltcloud': 'info'
-#
-#log_granular_levels: {}
-
-
-##########################################
-#####         Misc Defaults          #####
-##########################################
-
-# Whether or not to remove the accompanying SSH key from the known_hosts f=
ile
-# when an instance is destroyed.
-#
-# Default: 'False'
-#
-#delete_sshkeys: False
-
diff --git a/meta-openstack/recipes-support/salt/files/master b/meta-openst=
ack/recipes-support/salt/files/master
deleted file mode 100644
index 4ecb160..0000000
--- a/meta-openstack/recipes-support/salt/files/master
+++ /dev/null
@@ -1,1034 +0,0 @@
-##### Primary configuration settings #####
-##########################################
-# This configuration file is used to manage the behavior of the Salt Maste=
r.
-# Values that are commented out but have an empty line after the comment a=
re
-# defaults that do not need to be set in the config. If there is no blank =
line
-# after the comment then the value is presented as an example and is not t=
he
-# default.
-
-# Per default, the master will automatically include all config files
-# from master.d/*.conf (master.d is a directory in the same directory
-# as the main master config file).
-#default_include: master.d/*.conf
-
-# The address of the interface to bind to:
-#interface: 0.0.0.0
-
-# Whether the master should listen for IPv6 connections. If this is set to=
 True,
-# the interface option must be adjusted, too. (For example: "interface: ':=
:'")
-#ipv6: False
-
-# The tcp port used by the publisher:
-#publish_port: 4505
-
-# The user under which the salt master will run. Salt will update all
-# permissions to allow the specified user to run the master. The exception=
 is
-# the job cache, which must be deleted if this user is changed. If the
-# modified files cause conflicts, set verify_env to False.
-#user: root
-
-# The port used by the communication interface. The ret (return) port is t=
he
-# interface used for the file server, authentication, job returns, etc.
-#ret_port: 4506
-
-# Specify the location of the daemon process ID file:
-#pidfile: /var/run/salt-master.pid
-
-# The root directory prepended to these options: pki_dir, cachedir,
-# sock_dir, log_file, autosign_file, autoreject_file, extension_modules,
-# key_logfile, pidfile:
-#root_dir: /
-
-# The path to the master's configuration file.
-#conf_file: /etc/salt/master
-
-# Directory used to store public key data:
-#pki_dir: /etc/salt/pki/master
-
-# Key cache. Increases master speed for large numbers of accepted
-# keys. Available options: 'sched'. (Updates on a fixed schedule.)
-# Note that enabling this feature means that minions will not be
-# available to target for up to the length of the maintanence loop
-# which by default is 60s.
-#key_cache: ''
-
-# Directory to store job and cache data:
-# This directory may contain sensitive data and should be protected accord=
ingly.
-#
-#cachedir: /var/cache/salt/master
-
-# Directory for custom modules. This directory can contain subdirectories =
for
-# each of Salt's module types such as "runners", "output", "wheel", "modul=
es",
-# "states", "returners", etc.
-#extension_modules: <no default>
-
-# Directory for custom modules. This directory can contain subdirectories =
for
-# each of Salt's module types such as "runners", "output", "wheel", "modul=
es",
-# "states", "returners", "engines", etc.
-# Like 'extension_modules' but can take an array of paths
-#module_dirs: <no default>
-#   - /var/cache/salt/minion/extmods
-
-# Verify and set permissions on configuration directories at startup:
-#verify_env: True
-
-# Set the number of hours to keep old job information in the job cache:
-#keep_jobs: 24
-
-# The number of seconds to wait when the client is requesting information
-# about running jobs.
-#gather_job_timeout: 10
-
-# Set the default timeout for the salt command and api. The default is 5
-# seconds.
-#timeout: 5
-
-# The loop_interval option controls the seconds for the master's maintenan=
ce
-# process check cycle. This process updates file server backends, cleans t=
he
-# job cache and executes the scheduler.
-#loop_interval: 60
-
-# Set the default outputter used by the salt command. The default is "nest=
ed".
-#output: nested
-
-# Set the default output file used by the salt command. Default is to outp=
ut
-# to the CLI and not to a file. Functions the same way as the "--out-file"
-# CLI option, only sets this to a single file for all salt commands.
-#output_file: None
-
-# Return minions that timeout when running commands like test.ping
-#show_timeout: True
-
-# By default, output is colored. To disable colored output, set the color =
value
-# to False.
-#color: True
-
-# Do not strip off the colored output from nested results and state output=
s
-# (true by default).
-# strip_colors: False
-
-# To display a summary of the number of minions targeted, the number of
-# minions returned, and the number of minions that did not return, set the
-# cli_summary value to True. (False by default.)
-#
-#cli_summary: False
-
-# Set the directory used to hold unix sockets:
-#sock_dir: /var/run/salt/master
-
-# The master can take a while to start up when lspci and/or dmidecode is u=
sed
-# to populate the grains for the master. Enable if you want to see GPU har=
dware
-# data for your master.
-# enable_gpu_grains: False
-
-# The master maintains a job cache. While this is a great addition, it can=
 be
-# a burden on the master for larger deployments (over 5000 minions).
-# Disabling the job cache will make previously executed jobs unavailable t=
o
-# the jobs system and is not generally recommended.
-#job_cache: True
-
-# Cache minion grains and pillar data in the cachedir.
-#minion_data_cache: True
-
-# Store all returns in the given returner.
-# Setting this option requires that any returner-specific configuration al=
so
-# be set. See various returners in salt/returners for details on required
-# configuration values. (See also, event_return_queue below.)
-#
-#event_return: mysql
-
-# On busy systems, enabling event_returns can cause a considerable load on
-# the storage system for returners. Events can be queued on the master and
-# stored in a batched fashion using a single transaction for multiple even=
ts.
-# By default, events are not queued.
-#event_return_queue: 0
-
-# Only return events matching tags in a whitelist, supports glob matches.
-#event_return_whitelist:
-#  - salt/master/a_tag
-#  - salt/run/*/ret
-
-# Store all event returns **except** the tags in a blacklist, supports glo=
bs.
-#event_return_blacklist:
-#  - salt/master/not_this_tag
-#  - salt/wheel/*/ret
-
-# Passing very large events can cause the minion to consume large amounts =
of
-# memory. This value tunes the maximum size of a message allowed onto the
-# master event bus. The value is expressed in bytes.
-#max_event_size: 1048576
-
-# By default, the master AES key rotates every 24 hours. The next command
-# following a key rotation will trigger a key refresh from the minion whic=
h may
-# result in minions which do not respond to the first command after a key =
refresh.
-#
-# To tell the master to ping all minions immediately after an AES key refr=
esh, set
-# ping_on_rotate to True. This should mitigate the issue where a minion do=
es not
-# appear to initially respond after a key is rotated.
-#
-# Note that ping_on_rotate may cause high load on the master immediately a=
fter
-# the key rotation event as minions reconnect. Consider this carefully if =
this
-# salt master is managing a large number of minions.
-#
-# If disabled, it is recommended to handle this event by listening for the
-# 'aes_key_rotate' event with the 'key' tag and acting appropriately.
-# ping_on_rotate: False
-
-# By default, the master deletes its cache of minion data when the key for=
 that
-# minion is removed. To preserve the cache after key deletion, set
-# 'preserve_minion_cache' to True.
-#
-# WARNING: This may have security implications if compromised minions auth=
 with
-# a previous deleted minion ID.
-#preserve_minion_cache: False
-
-# If max_minions is used in large installations, the master might experien=
ce
-# high-load situations because of having to check the number of connected
-# minions for every authentication. This cache provides the minion-ids of
-# all connected minions to all MWorker-processes and greatly improves the
-# performance of max_minions.
-# con_cache: False
-
-# The master can include configuration from other files. To enable this,
-# pass a list of paths to this option. The paths can be either relative or
-# absolute; if relative, they are considered to be relative to the directo=
ry
-# the main master configuration file lives in (this file). Paths can make =
use
-# of shell-style globbing. If no files are matched by a path passed to thi=
s
-# option, then the master will log a warning message.
-#
-# Include a config file from some other path:
-# include: /etc/salt/extra_config
-#
-# Include config from several files and directories:
-# include:
-#   - /etc/salt/extra_config
-
-
-#####  Large-scale tuning settings   #####
-##########################################
-# Max open files
-#
-# Each minion connecting to the master uses AT LEAST one file descriptor, =
the
-# master subscription connection. If enough minions connect you might star=
t
-# seeing on the console (and then salt-master crashes):
-#   Too many open files (tcp_listener.cpp:335)
-#   Aborted (core dumped)
-#
-# By default this value will be the one of `ulimit -Hn`, ie, the hard limi=
t for
-# max open files.
-#
-# If you wish to set a different value than the default one, uncomment and
-# configure this setting. Remember that this value CANNOT be higher than t=
he
-# hard limit. Raising the hard limit depends on your OS and/or distributio=
n,
-# a good way to find the limit is to search the internet. For example:
-#   raise max open files hard limit debian
-#
-#max_open_files: 100000
-
-# The number of worker threads to start. These threads are used to manage
-# return calls made from minions to the master. If the master seems to be
-# running slowly, increase the number of threads. This setting can not be
-# set lower than 3.
-#worker_threads: 5
-
-# Set the ZeroMQ high water marks
-# http://api.zeromq.org/3-2:zmq-setsockopt
-
-# The publisher interface ZeroMQPubServerChannel
-#pub_hwm: 1000
-
-# These two ZMQ HWM settings, salt_event_pub_hwm and event_publisher_pub_h=
wm
-# are significant for masters with thousands of minions.  When these are
-# insufficiently high it will manifest in random responses missing in the =
CLI
-# and even missing from the job cache.  Masters that have fast CPUs and ma=
ny
-# cores with appropriate worker_threads will not need these set as high.
-
-# On deployment with 8,000 minions, 2.4GHz CPUs, 24 cores, 32GiB memory ha=
s
-# these settings:
-#
-#   salt_event_pub_hwm: 128000
-#   event_publisher_pub_hwm: 64000
-
-# ZMQ high-water-mark for SaltEvent pub socket
-#salt_event_pub_hwm: 20000
-
-# ZMQ high-water-mark for EventPublisher pub socket
-#event_publisher_pub_hwm: 10000
-
-# The master may allocate memory per-event and not
-# reclaim it.
-# To set a high-water mark for memory allocation, use
-# ipc_write_buffer to set a high-water mark for message
-# buffering.
-# Value: In bytes. Set to 'dynamic' to have Salt select
-# a value for you. Default is disabled.
-# ipc_write_buffer: 'dynamic'
-
-
-#####        Security settings       #####
-##########################################
-# Enable "open mode", this mode still maintains encryption, but turns off
-# authentication, this is only intended for highly secure environments or =
for
-# the situation where your keys end up in a bad state. If you run in open =
mode
-# you do so at your own risk!
-#open_mode: False
-
-# Enable auto_accept, this setting will automatically accept all incoming
-# public keys from the minions. Note that this is insecure.
-#auto_accept: False
-
-# Time in minutes that an incoming public key with a matching name found i=
n
-# pki_dir/minion_autosign/keyid is automatically accepted. Expired autosig=
n keys
-# are removed when the master checks the minion_autosign directory.
-# 0 equals no timeout
-# autosign_timeout: 120
-
-# If the autosign_file is specified, incoming keys specified in the
-# autosign_file will be automatically accepted. This is insecure.  Regular
-# expressions as well as globing lines are supported.
-#autosign_file: /etc/salt/autosign.conf
-
-# Works like autosign_file, but instead allows you to specify minion IDs f=
or
-# which keys will automatically be rejected. Will override both membership=
 in
-# the autosign_file and the auto_accept setting.
-#autoreject_file: /etc/salt/autoreject.conf
-
-# Enable permissive access to the salt keys. This allows you to run the
-# master or minion as root, but have a non-root group be given access to
-# your pki_dir. To make the access explicit, root must belong to the group
-# you've given access to. This is potentially quite insecure. If an autosi=
gn_file
-# is specified, enabling permissive_pki_access will allow group access to =
that
-# specific file.
-#permissive_pki_access: False
-
-# Allow users on the master access to execute specific commands on minions=
.
-# This setting should be treated with care since it opens up execution
-# capabilities to non root users. By default this capability is completely
-# disabled.
-#publisher_acl:
-#  larry:
-#    - test.ping
-#    - network.*
-#
-# Blacklist any of the following users or modules
-#
-# This example would blacklist all non sudo users, including root from
-# running any commands. It would also blacklist any use of the "cmd"
-# module. This is completely disabled by default.
-#
-#
-# Check the list of configured users in client ACL against users on the
-# system and throw errors if they do not exist.
-#client_acl_verify: True
-#
-#publisher_acl_blacklist:
-#  users:
-#    - root
-#    - '^(?!sudo_).*$'   #  all non sudo users
-#  modules:
-#    - cmd
-#
-# WARNING: client_acl and client_acl_blacklist options are deprecated and =
will
-# be removed in the future releases. Use publisher_acl and
-# publisher_acl_blacklist instead.
-
-# Enforce publisher_acl & publisher_acl_blacklist when users have sudo
-# access to the salt command.
-#
-#sudo_acl: False
-
-# The external auth system uses the Salt auth modules to authenticate and
-# validate users to access areas of the Salt system.
-#external_auth:
-#  pam:
-#    fred:
-#      - test.*
-#
-# Time (in seconds) for a newly generated token to live. Default: 12 hours
-#token_expire: 43200
-#
-# Allow eauth users to specify the expiry time of the tokens they generate=
.
-# A boolean applies to all users or a dictionary of whitelisted eauth back=
ends
-# and usernames may be given.
-# token_expire_user_override:
-#   pam:
-#     - fred
-#     - tom
-#   ldap:
-#     - gary
-#
-#token_expire_user_override: False
-
-# Allow minions to push files to the master. This is disabled by default, =
for
-# security purposes.
-#file_recv: False
-
-# Set a hard-limit on the size of the files that can be pushed to the mast=
er.
-# It will be interpreted as megabytes. Default: 100
-#file_recv_max_size: 100
-
-# Signature verification on messages published from the master.
-# This causes the master to cryptographically sign all messages published =
to its event
-# bus, and minions then verify that signature before acting on the message=
.
-#
-# This is False by default.
-#
-# Note that to facilitate interoperability with masters and minions that a=
re different
-# versions, if sign_pub_messages is True but a message is received by a mi=
nion with
-# no signature, it will still be accepted, and a warning message will be l=
ogged.
-# Conversely, if sign_pub_messages is False, but a minion receives a signe=
d
-# message it will be accepted, the signature will not be checked, and a wa=
rning message
-# will be logged. This behavior went away in Salt 2014.1.0 and these two s=
ituations
-# will cause minion to throw an exception and drop the message.
-# sign_pub_messages: False
-
-#####     Salt-SSH Configuration     #####
-##########################################
-
-# Pass in an alternative location for the salt-ssh roster file
-#roster_file: /etc/salt/roster
-
-# Pass in minion option overrides that will be inserted into the SHIM for
-# salt-ssh calls. The local minion config is not used for salt-ssh. Can be
-# overridden on a per-minion basis in the roster (`minion_opts`)
-#ssh_minion_opts:
-#  gpg_keydir: /root/gpg
-
-# Set this to True to default to using ~/.ssh/id_rsa for salt-ssh
-# authentication with minions
-#ssh_use_home_key: False
-
-#####    Master Module Management    #####
-##########################################
-# Manage how master side modules are loaded.
-
-# Add any additional locations to look for master runners:
-#runner_dirs: []
-
-# Enable Cython for master side modules:
-#cython_enable: False
-
-
-#####      State System settings     #####
-##########################################
-# The state system uses a "top" file to tell the minions what environment =
to
-# use and what modules to use. The state_top file is defined relative to t=
he
-# root of the base environment as defined in "File Server settings" below.
-#state_top: top.sls
-
-# The master_tops option replaces the external_nodes option by creating
-# a plugable system for the generation of external top data. The external_=
nodes
-# option is deprecated by the master_tops option.
-#
-# To gain the capabilities of the classic external_nodes system, use the
-# following configuration:
-# master_tops:
-#   ext_nodes: <Shell command which returns yaml>
-#
-#master_tops: {}
-
-# The external_nodes option allows Salt to gather data that would normally=
 be
-# placed in a top file. The external_nodes option is the executable that w=
ill
-# return the ENC data. Remember that Salt will look for external nodes AND=
 top
-# files and combine the results if both are enabled!
-#external_nodes: None
-
-# The renderer to use on the minions to render the state data
-#renderer: yaml_jinja
-
-# The Jinja renderer can strip extra carriage returns and whitespace
-# See http://jinja.pocoo.org/docs/api/#high-level-api
-#
-# If this is set to True the first newline after a Jinja block is removed
-# (block, not variable tag!). Defaults to False, corresponds to the Jinja
-# environment init variable "trim_blocks".
-#jinja_trim_blocks: False
-#
-# If this is set to True leading spaces and tabs are stripped from the sta=
rt
-# of a line to a block. Defaults to False, corresponds to the Jinja
-# environment init variable "lstrip_blocks".
-#jinja_lstrip_blocks: False
-
-# The failhard option tells the minions to stop immediately after the firs=
t
-# failure detected in the state execution, defaults to False
-#failhard: False
-
-# The state_verbose and state_output settings can be used to change the wa=
y
-# state system data is printed to the display. By default all data is prin=
ted.
-# The state_verbose setting can be set to True or False, when set to False
-# all data that has a result of True and no changes will be suppressed.
-#state_verbose: True
-
-# The state_output setting changes if the output is the full multi line
-# output for each changed state if set to 'full', but if set to 'terse'
-# the output will be shortened to a single line.  If set to 'mixed', the o=
utput
-# will be terse unless a state failed, in which case that output will be f=
ull.
-# If set to 'changes', the output will be full unless the state didn't cha=
nge.
-#state_output: full
-
-# Automatically aggregate all states that have support for mod_aggregate b=
y
-# setting to 'True'. Or pass a list of state module names to automatically
-# aggregate just those types.
-#
-# state_aggregate:
-#   - pkg
-#
-#state_aggregate: False
-
-# Send progress events as each function in a state run completes execution
-# by setting to 'True'. Progress events are in the format
-# 'salt/job/<JID>/prog/<MID>/<RUN NUM>'.
-#state_events: False
-
-#####      File Server settings      #####
-##########################################
-# Salt runs a lightweight file server written in zeromq to deliver files t=
o
-# minions. This file server is built into the master daemon and does not
-# require a dedicated port.
-
-# The file server works on environments passed to the master, each environ=
ment
-# can have multiple root directories, the subdirectories in the multiple f=
ile
-# roots cannot match, otherwise the downloaded files will not be able to b=
e
-# reliably ensured. A base environment is required to house the top file.
-# Example:
-# file_roots:
-#   base:
-#     - /srv/salt/
-#   dev:
-#     - /srv/salt/dev/services
-#     - /srv/salt/dev/states
-#   prod:
-#     - /srv/salt/prod/services
-#     - /srv/salt/prod/states
-#
-#file_roots:
-#  base:
-#    - /srv/salt
-#
-
-# When using multiple environments, each with their own top file, the
-# default behaviour is an unordered merge. To prevent top files from
-# being merged together and instead to only use the top file from the
-# requested environment, set this value to 'same'.
-#top_file_merging_strategy: merge
-
-# To specify the order in which environments are merged, set the ordering
-# in the env_order option. Given a conflict, the last matching value will
-# win.
-#env_order: ['base', 'dev', 'prod']
-
-# If top_file_merging_strategy is set to 'same' and an environment does no=
t
-# contain a top file, the top file in the environment specified by default=
_top
-# will be used instead.
-#default_top: base
-
-# The hash_type is the hash to use when discovering the hash of a file on
-# the master server. The default is md5 but sha1, sha224, sha256, sha384
-# and sha512 are also supported.
-#
-# WARNING: While md5 is also supported, do not use it due to the high chan=
ce
-# of possible collisions and thus security breach.
-#
-# Prior to changing this value, the master should be stopped and all Salt
-# caches should be cleared.
-#hash_type: sha256
-
-# The buffer size in the file server can be adjusted here:
-#file_buffer_size: 1048576
-
-# A regular expression (or a list of expressions) that will be matched
-# against the file path before syncing the modules and states to the minio=
ns.
-# This includes files affected by the file.recurse state.
-# For example, if you manage your custom modules and states in subversion
-# and don't want all the '.svn' folders and content synced to your minions=
,
-# you could set this to '/\.svn($|/)'. By default nothing is ignored.
-#file_ignore_regex:
-#  - '/\.svn($|/)'
-#  - '/\.git($|/)'
-
-# A file glob (or list of file globs) that will be matched against the fil=
e
-# path before syncing the modules and states to the minions. This is simil=
ar
-# to file_ignore_regex above, but works on globs instead of regex. By defa=
ult
-# nothing is ignored.
-# file_ignore_glob:
-#  - '*.pyc'
-#  - '*/somefolder/*.bak'
-#  - '*.swp'
-
-# File Server Backend
-#
-# Salt supports a modular fileserver backend system, this system allows
-# the salt master to link directly to third party systems to gather and
-# manage the files available to minions. Multiple backends can be
-# configured and will be searched for the requested file in the order in w=
hich
-# they are defined here. The default setting only enables the standard bac=
kend
-# "roots" which uses the "file_roots" option.
-#fileserver_backend:
-#  - roots
-#
-# To use multiple backends list them in the order they are searched:
-#fileserver_backend:
-#  - git
-#  - roots
-#
-# Uncomment the line below if you do not want the file_server to follow
-# symlinks when walking the filesystem tree. This is set to True
-# by default. Currently this only applies to the default roots
-# fileserver_backend.
-#fileserver_followsymlinks: False
-#
-# Uncomment the line below if you do not want symlinks to be
-# treated as the files they are pointing to. By default this is set to
-# False. By uncommenting the line below, any detected symlink while listin=
g
-# files on the Master will not be returned to the Minion.
-#fileserver_ignoresymlinks: True
-#
-# By default, the Salt fileserver recurses fully into all defined environm=
ents
-# to attempt to find files. To limit this behavior so that the fileserver =
only
-# traverses directories with SLS files and special Salt directories like _=
modules,
-# enable the option below. This might be useful for installations where a =
file root
-# has a very large number of files and performance is impacted. Default is=
 False.
-# fileserver_limit_traversal: False
-#
-# The fileserver can fire events off every time the fileserver is updated,
-# these are disabled by default, but can be easily turned on by setting th=
is
-# flag to True
-#fileserver_events: False
-
-# Git File Server Backend Configuration
-#
-# Optional parameter used to specify the provider to be used for gitfs. Mu=
st
-# be one of the following: pygit2, gitpython, or dulwich. If unset, then e=
ach
-# will be tried in that same order, and the first one with a compatible
-# version installed will be the provider that is used.
-#gitfs_provider: pygit2
-
-# Along with gitfs_password, is used to authenticate to HTTPS remotes.
-# gitfs_user: ''
-
-# Along with gitfs_user, is used to authenticate to HTTPS remotes.
-# This parameter is not required if the repository does not use authentica=
tion.
-#gitfs_password: ''
-
-# By default, Salt will not authenticate to an HTTP (non-HTTPS) remote.
-# This parameter enables authentication over HTTP. Enable this at your own=
 risk.
-#gitfs_insecure_auth: False
-
-# Along with gitfs_privkey (and optionally gitfs_passphrase), is used to
-# authenticate to SSH remotes. This parameter (or its per-remote counterpa=
rt)
-# is required for SSH remotes.
-#gitfs_pubkey: ''
-
-# Along with gitfs_pubkey (and optionally gitfs_passphrase), is used to
-# authenticate to SSH remotes. This parameter (or its per-remote counterpa=
rt)
-# is required for SSH remotes.
-#gitfs_privkey: ''
-
-# This parameter is optional, required only when the SSH key being used to
-# authenticate is protected by a passphrase.
-#gitfs_passphrase: ''
-
-# When using the git fileserver backend at least one git remote needs to b=
e
-# defined. The user running the salt master will need read access to the r=
epo.
-#
-# The repos will be searched in order to find the file requested by a clie=
nt
-# and the first repo to have the file will return it.
-# When using the git backend branches and tags are translated into salt
-# environments.
-# Note: file:// repos will be treated as a remote, so refs you want used m=
ust
-# exist in that repo as *local* refs.
-#gitfs_remotes:
-#  - git://github.com/saltstack/salt-states.git
-#  - file:///var/git/saltmaster
-#
-# The gitfs_ssl_verify option specifies whether to ignore ssl certificate
-# errors when contacting the gitfs backend. You might want to set this to
-# false if you're using a git backend that uses a self-signed certificate =
but
-# keep in mind that setting this flag to anything other than the default o=
f True
-# is a security concern, you may want to try using the ssh transport.
-#gitfs_ssl_verify: True
-#
-# The gitfs_root option gives the ability to serve files from a subdirecto=
ry
-# within the repository. The path is defined relative to the root of the
-# repository and defaults to the repository root.
-#gitfs_root: somefolder/otherfolder
-#
-#
-#####         Pillar settings        #####
-##########################################
-# Salt Pillars allow for the building of global data that can be made sele=
ctively
-# available to different minions based on minion grain filtering. The Salt
-# Pillar is laid out in the same fashion as the file server, with environm=
ents,
-# a top file and sls files. However, pillar data does not need to be in th=
e
-# highstate format, and is generally just key/value pairs.
-#pillar_roots:
-#  base:
-#    - /srv/pillar
-#
-#ext_pillar:
-#  - hiera: /etc/hiera.yaml
-#  - cmd_yaml: cat /etc/salt/yaml
-
-# The ext_pillar_first option allows for external pillar sources to popula=
te
-# before file system pillar. This allows for targeting file system pillar =
from
-# ext_pillar.
-#ext_pillar_first: False
-
-# The pillar_gitfs_ssl_verify option specifies whether to ignore ssl certi=
ficate
-# errors when contacting the pillar gitfs backend. You might want to set t=
his to
-# false if you're using a git backend that uses a self-signed certificate =
but
-# keep in mind that setting this flag to anything other than the default o=
f True
-# is a security concern, you may want to try using the ssh transport.
-#pillar_gitfs_ssl_verify: True
-
-# The pillar_opts option adds the master configuration file data to a dict=
 in
-# the pillar called "master". This is used to set simple configurations in=
 the
-# master config file that can then be used on minions.
-#pillar_opts: False
-
-# The pillar_safe_render_error option prevents the master from passing pil=
lar
-# render errors to the minion. This is set on by default because the error=
 could
-# contain templating data which would give that minion information it shou=
ldn't
-# have, like a password! When set true the error message will only show:
-#   Rendering SLS 'my.sls' failed. Please see master log for details.
-#pillar_safe_render_error: True
-
-# The pillar_source_merging_strategy option allows you to configure mergin=
g strategy
-# between different sources. It accepts five values: none, recurse, aggreg=
ate, overwrite,
-# or smart. None will not do any merging at all. Recurse will merge recurs=
ively mapping of data.
-# Aggregate instructs aggregation of elements between sources that use the=
 #!yamlex renderer. Overwrite
-# will overwrite elements according the order in which they are processed.=
 This is
-# behavior of the 2014.1 branch and earlier. Smart guesses the best strate=
gy based
-# on the "renderer" setting and is the default value.
-#pillar_source_merging_strategy: smart
-
-# Recursively merge lists by aggregating them instead of replacing them.
-#pillar_merge_lists: False
-
-# Set this option to 'True' to force a 'KeyError' to be raised whenever an
-# attempt to retrieve a named value from pillar fails. When this option is=
 set
-# to 'False', the failed attempt returns an empty string. Default is 'Fals=
e'.
-#pillar_raise_on_missing: False
-
-# Git External Pillar (git_pillar) Configuration Options
-#
-# Specify the provider to be used for git_pillar. Must be either pygit2 or
-# gitpython. If unset, then both will be tried in that same order, and the
-# first one with a compatible version installed will be the provider that
-# is used.
-#git_pillar_provider: pygit2
-
-# If the desired branch matches this value, and the environment is omitted
-# from the git_pillar configuration, then the environment for that git_pil=
lar
-# remote will be base.
-#git_pillar_base: master
-
-# If the branch is omitted from a git_pillar remote, then this branch will
-# be used instead
-#git_pillar_branch: master
-
-# Environment to use for git_pillar remotes. This is normally derived from
-# the branch/tag (or from a per-remote env parameter), but if set this wil=
l
-# override the process of deriving the env from the branch/tag name.
-#git_pillar_env: ''
-
-# Path relative to the root of the repository where the git_pillar top fil=
e
-# and SLS files are located.
-#git_pillar_root: ''
-
-# Specifies whether or not to ignore SSL certificate errors when contactin=
g
-# the remote repository.
-#git_pillar_ssl_verify: False
-
-# When set to False, if there is an update/checkout lock for a git_pillar
-# remote and the pid written to it is not running on the master, the lock
-# file will be automatically cleared and a new lock will be obtained.
-#git_pillar_global_lock: True
-
-# Git External Pillar Authentication Options
-#
-# Along with git_pillar_password, is used to authenticate to HTTPS remotes=
.
-#git_pillar_user: ''
-
-# Along with git_pillar_user, is used to authenticate to HTTPS remotes.
-# This parameter is not required if the repository does not use authentica=
tion.
-#git_pillar_password: ''
-
-# By default, Salt will not authenticate to an HTTP (non-HTTPS) remote.
-# This parameter enables authentication over HTTP.
-#git_pillar_insecure_auth: False
-
-# Along with git_pillar_privkey (and optionally git_pillar_passphrase),
-# is used to authenticate to SSH remotes.
-#git_pillar_pubkey: ''
-
-# Along with git_pillar_pubkey (and optionally git_pillar_passphrase),
-# is used to authenticate to SSH remotes.
-#git_pillar_privkey: ''
-
-# This parameter is optional, required only when the SSH key being used
-# to authenticate is protected by a passphrase.
-#git_pillar_passphrase: ''
-
-# A master can cache pillars locally to bypass the expense of having to re=
nder them
-# for each minion on every request. This feature should only be enabled in=
 cases
-# where pillar rendering time is known to be unsatisfactory and any attend=
ant security
-# concerns about storing pillars in a master cache have been addressed.
-#
-# When enabling this feature, be certain to read through the additional ``=
pillar_cache_*``
-# configuration options to fully understand the tunable parameters and the=
ir implications.
-#
-# Note: setting ``pillar_cache: True`` has no effect on targeting Minions =
with Pillars.
-# See https://docs.saltstack.com/en/latest/topics/targeting/pillar.html
-#pillar_cache: False
-
-# If and only if a master has set ``pillar_cache: True``, the cache TTL co=
ntrols the amount
-# of time, in seconds, before the cache is considered invalid by a master =
and a fresh
-# pillar is recompiled and stored.
-#pillar_cache_ttl: 3600
-
-# If and only if a master has set `pillar_cache: True`, one of several sto=
rage providers
-# can be utililzed.
-#
-# `disk`: The default storage backend. This caches rendered pillars to the=
 master cache.
-#         Rendered pillars are serialized and deserialized as msgpack stru=
ctures for speed.
-#         Note that pillars are stored UNENCRYPTED. Ensure that the master=
 cache
-#         has permissions set appropriately. (Same defaults are provided.)
-#
-# memory: [EXPERIMENTAL] An optional backend for pillar caches which uses =
a pure-Python
-#         in-memory data structure for maximal performance. There are seve=
ral caveats,
-#         however. First, because each master worker contains its own in-m=
emory cache,
-#         there is no guarantee of cache consistency between minion reques=
ts. This
-#         works best in situations where the pillar rarely if ever changes=
. Secondly,
-#         and perhaps more importantly, this means that unencrypted pillar=
s will
-#         be accessible to any process which can examine the memory of the=
 ``salt-master``!
-#         This may represent a substantial security risk.
-#
-#pillar_cache_backend: disk
-
-
-#####          Syndic settings       #####
-##########################################
-# The Salt syndic is used to pass commands through a master from a higher
-# master. Using the syndic is simple. If this is a master that will have
-# syndic servers(s) below it, then set the "order_masters" setting to True=
.
-#
-# If this is a master that will be running a syndic daemon for passthrough=
, then
-# the "syndic_master" setting needs to be set to the location of the maste=
r server
-# to receive commands from.
-
-# Set the order_masters setting to True if this master will command lower
-# masters' syndic interfaces.
-#order_masters: False
-
-# If this master will be running a salt syndic daemon, syndic_master tells
-# this master where to receive commands from.
-#syndic_master: masterofmaster
-
-# This is the 'ret_port' of the MasterOfMaster:
-#syndic_master_port: 4506
-
-# PID file of the syndic daemon:
-#syndic_pidfile: /var/run/salt-syndic.pid
-
-# LOG file of the syndic daemon:
-#syndic_log_file: syndic.log
-
-# The behaviour of the multi-syndic when connection to a master of masters=
 failed.
-# Can specify ``random`` (default) or ``ordered``. If set to ``random``, m=
asters
-# will be iterated in random order. If ``ordered`` is specified, the confi=
gured
-# order will be used.
-#syndic_failover: random
-
-
-#####      Peer Publish settings     #####
-##########################################
-# Salt minions can send commands to other minions, but only if the minion =
is
-# allowed to. By default "Peer Publication" is disabled, and when enabled =
it
-# is enabled for specific minions and specific commands. This allows secur=
e
-# compartmentalization of commands based on individual minions.
-
-# The configuration uses regular expressions to match minions and then a l=
ist
-# of regular expressions to match functions. The following will allow the
-# minion authenticated as foo.example.com to execute functions from the te=
st
-# and pkg modules.
-#peer:
-#  foo.example.com:
-#    - test.*
-#    - pkg.*
-#
-# This will allow all minions to execute all commands:
-#peer:
-#  .*:
-#    - .*
-#
-# This is not recommended, since it would allow anyone who gets root on an=
y
-# single minion to instantly have root on all of the minions!
-
-# Minions can also be allowed to execute runners from the salt master.
-# Since executing a runner from the minion could be considered a security =
risk,
-# it needs to be enabled. This setting functions just like the peer settin=
g
-# except that it opens up runners instead of module functions.
-#
-# All peer runner support is turned off by default and must be enabled bef=
ore
-# using. This will enable all peer runners for all minions:
-#peer_run:
-#  .*:
-#    - .*
-#
-# To enable just the manage.up runner for the minion foo.example.com:
-#peer_run:
-#  foo.example.com:
-#    - manage.up
-#
-#
-#####         Mine settings     #####
-#####################################
-# Restrict mine.get access from minions. By default any minion has a full =
access
-# to get all mine data from master cache. In acl definion below, only pcre=
 matches
-# are allowed.
-# mine_get:
-#   .*:
-#     - .*
-#
-# The example below enables minion foo.example.com to get 'network.interfa=
ces' mine
-# data only, minions web* to get all network.* and disk.* mine data and al=
l other
-# minions won't get any mine data.
-# mine_get:
-#   foo.example.com:
-#     - network.interfaces
-#   web.*:
-#     - network.*
-#     - disk.*
-
-
-#####         Logging settings       #####
-##########################################
-# The location of the master log file
-# The master log can be sent to a regular file, local path name, or networ=
k
-# location. Remote logging works best when configured to use rsyslogd(8) (=
e.g.:
-# ``file:///dev/log``), with rsyslogd(8) configured for network logging. T=
he URI
-# format is: <file|udp|tcp>://<host|socketpath>:<port-if-required>/<log-fa=
cility>
-#log_file: /var/log/salt/master
-#log_file: file:///dev/log
-#log_file: udp://loghost:10514
-
-#log_file: /var/log/salt/master
-#key_logfile: /var/log/salt/key
-
-# The level of messages to send to the console.
-# One of 'garbage', 'trace', 'debug', info', 'warning', 'error', 'critical=
'.
-#
-# The following log levels are considered INSECURE and may log sensitive d=
ata:
-# ['garbage', 'trace', 'debug']
-#
-#log_level: warning
-
-# The level of messages to send to the log file.
-# One of 'garbage', 'trace', 'debug', info', 'warning', 'error', 'critical=
'.
-# If using 'log_granular_levels' this must be set to the highest desired l=
evel.
-#log_level_logfile: warning
-
-# The date and time format used in log messages. Allowed date/time formatt=
ing
-# can be seen here: http://docs.python.org/library/time.html#time.strftime
-#log_datefmt: '%H:%M:%S'
-#log_datefmt_logfile: '%Y-%m-%d %H:%M:%S'
-
-# The format of the console logging messages. Allowed formatting options c=
an
-# be seen here: http://docs.python.org/library/logging.html#logrecord-attr=
ibutes
-#
-# Console log colors are specified by these additional formatters:
-#
-# %(colorlevel)s
-# %(colorname)s
-# %(colorprocess)s
-# %(colormsg)s
-#
-# Since it is desirable to include the surrounding brackets, '[' and ']', =
in
-# the coloring of the messages, these color formatters also include paddin=
g as
-# well.  Color LogRecord attributes are only available for console logging=
.
-#
-#log_fmt_console: '%(colorlevel)s %(colormsg)s'
-#log_fmt_console: '[%(levelname)-8s] %(message)s'
-#
-#log_fmt_logfile: '%(asctime)s,%(msecs)03d [%(name)-17s][%(levelname)-8s] =
%(message)s'
-
-# This can be used to control logging levels more specificically.  This
-# example sets the main salt library at the 'warning' level, but sets
-# 'salt.modules' to log at the 'debug' level:
-#   log_granular_levels:
-#     'salt': 'warning'
-#     'salt.modules': 'debug'
-#
-#log_granular_levels: {}
-
-
-#####         Node Groups           ######
-##########################################
-# Node groups allow for logical groupings of minion nodes. A group consist=
s of
-# a group name and a compound target. Nodgroups can reference other nodegr=
oups
-# with 'N@' classifier. Ensure that you do not have circular references.
-#
-#nodegroups:
-#  group1: 'L@foo.domain.com,bar.domain.com,baz.domain.com or bl*.domain.c=
om'
-#  group2: 'G@os:Debian and foo.domain.com'
-#  group3: 'G@os:Debian and N@group1'
-#  group4:
-#    - 'G@foo:bar'
-#    - 'or'
-#    - 'G@foo:baz'
-
-
-#####     Range Cluster settings     #####
-##########################################
-# The range server (and optional port) that serves your cluster informatio=
n
-# https://github.com/ytoolshed/range/wiki/%22yamlfile%22-module-file-spec
-#
-#range_server: range:80
-
-
-#####  Windows Software Repo settings #####
-###########################################
-# Location of the repo on the master:
-#winrepo_dir_ng: '/srv/salt/win/repo-ng'
-#
-# List of git repositories to include with the local repo:
-#winrepo_remotes_ng:
-#  - 'https://github.com/saltstack/salt-winrepo-ng.git'
-
-
-#####  Windows Software Repo settings - Pre 2015.8 #####
-########################################################
-# Legacy repo settings for pre-2015.8 Windows minions.
-#
-# Location of the repo on the master:
-#winrepo_dir: '/srv/salt/win/repo'
-#
-# Location of the master's repo cache file:
-#winrepo_mastercachefile: '/srv/salt/win/repo/winrepo.p'
-#
-# List of git repositories to include with the local repo:
-#winrepo_remotes:
-#  - 'https://github.com/saltstack/salt-winrepo.git'
-
-
-#####      Returner settings          ######
-############################################
-# Which returner(s) will be used for minion's result:
-#return: mysql
-
-
-######    Miscellaneous  settings     ######
-############################################
-# Default match type for filtering events tags: startswith, endswith, find=
, regex, fnmatch
-#event_match_type: startswith
-
-# Save runner returns to the job cache
-#runner_returns: True
-
-# Permanently include any available Python 3rd party modules into Salt Thi=
n
-# when they are generated for Salt-SSH or other purposes.
-# The modules should be named by the names they are actually imported insi=
de the Python.
-# The value of the parameters can be either one module or a comma separate=
d list of them.
-#thin_extra_mods: foo,bar
-
diff --git a/meta-openstack/recipes-support/salt/files/minion b/meta-openst=
ack/recipes-support/salt/files/minion
deleted file mode 100644
index ad7a374..0000000
--- a/meta-openstack/recipes-support/salt/files/minion
+++ /dev/null
@@ -1,802 +0,0 @@
-##### Primary configuration settings #####
-##########################################
-# This configuration file is used to manage the behavior of the Salt Minio=
n.
-# With the exception of the location of the Salt Master Server, values tha=
t are
-# commented out but have an empty line after the comment are defaults that=
 need
-# not be set in the config. If there is no blank line after the comment, t=
he
-# value is presented as an example and is not the default.
-
-# Per default the minion will automatically include all config files
-# from minion.d/*.conf (minion.d is a directory in the same directory
-# as the main minion config file).
-#default_include: minion.d/*.conf
-
-# Set the location of the salt master server. If the master server cannot =
be
-# resolved, then the minion will fail to start.
-#master: salt
-
-# Set http proxy information for the minion when doing requests
-#proxy_host:
-#proxy_port:
-#proxy_username:
-#proxy_password:
-
-# If multiple masters are specified in the 'master' setting, the default b=
ehavior
-# is to always try to connect to them in the order they are listed. If ran=
dom_master is
-# set to True, the order will be randomized instead. This can be helpful i=
n distributing
-# the load of many minions executing salt-call requests, for example, from=
 a cron job.
-# If only one master is listed, this setting is ignored and a warning will=
 be logged.
-# NOTE: If master_type is set to failover, use master_shuffle instead.
-#random_master: False
-
-# Use if master_type is set to failover.
-#master_shuffle: False
-
-# Minions can connect to multiple masters simultaneously (all masters
-# are "hot"), or can be configured to failover if a master becomes
-# unavailable.  Multiple hot masters are configured by setting this
-# value to "str".  Failover masters can be requested by setting
-# to "failover".  MAKE SURE TO SET master_alive_interval if you are
-# using failover.
-# Setting master_type to 'disable' let's you have a running minion (with e=
ngines and
-# beacons) without a master connection
-# master_type: str
-
-# Poll interval in seconds for checking if the master is still there.  Onl=
y
-# respected if master_type above is "failover". To disable the interval en=
tirely,
-# set the value to -1. (This may be necessary on machines which have high =
numbers
-# of TCP connections, such as load balancers.)
-# master_alive_interval: 30
-
-# If the minion is in multi-master mode and the master_type configuration =
option
-# is set to "failover", this setting can be set to "True" to force the min=
ion
-# to fail back to the first master in the list if the first master is back=
 online.
-#master_failback: False
-
-# If the minion is in multi-master mode, the "master_type" configuration i=
s set to
-# "failover", and the "master_failback" option is enabled, the master fail=
back
-# interval can be set to ping the top master with this interval, in second=
s.
-#master_failback_interval: 0
-
-# Set whether the minion should connect to the master via IPv6:
-#ipv6: False
-
-# Set the number of seconds to wait before attempting to resolve
-# the master hostname if name resolution fails. Defaults to 30 seconds.
-# Set to zero if the minion should shutdown and not retry.
-# retry_dns: 30
-
-# Set the port used by the master reply and authentication server.
-#master_port: 4506
-
-# The user to run salt.
-#user: root
-
-# The user to run salt remote execution commands as via sudo. If this opti=
on is
-# enabled then sudo will be used to change the active user executing the r=
emote
-# command. If enabled the user will need to be allowed access via the sudo=
ers
-# file for the user that the salt minion is configured to run as. The most
-# common option would be to use the root user. If this option is set the u=
ser
-# option should also be set to a non-root user. If migrating from a root m=
inion
-# to a non root minion the minion cache should be cleared and the minion p=
ki
-# directory will need to be changed to the ownership of the new user.
-#sudo_user: root
-
-# Specify the location of the daemon process ID file.
-#pidfile: /var/run/salt-minion.pid
-
-# The root directory prepended to these options: pki_dir, cachedir, log_fi=
le,
-# sock_dir, pidfile.
-#root_dir: /
-
-# The path to the minion's configuration file.
-#conf_file: /etc/salt/minion
-
-# The directory to store the pki information in
-#pki_dir: /etc/salt/pki/minion
-
-# Explicitly declare the id for this minion to use, if left commented the =
id
-# will be the hostname as returned by the python call: socket.getfqdn()
-# Since salt uses detached ids it is possible to run multiple minions on t=
he
-# same machine but with different ids, this can be useful for salt compute
-# clusters.
-#id:
-
-# Cache the minion id to a file when the minion's id is not statically def=
ined
-# in the minion config. Defaults to "True". This setting prevents potentia=
l
-# problems when automatic minion id resolution changes, which can cause th=
e
-# minion to lose connection with the master. To turn off minion id caching=
,
-# set this config to ``False``.
-#minion_id_caching: True
-
-# Append a domain to a hostname in the event that it does not exist.  This=
 is
-# useful for systems where socket.getfqdn() does not actually result in a
-# FQDN (for instance, Solaris).
-#append_domain:
-
-# Custom static grains for this minion can be specified here and used in S=
LS
-# files just like all other grains. This example sets 4 custom grains, wit=
h
-# the 'roles' grain having two values that can be matched against.
-#grains:
-#  roles:
-#    - webserver
-#    - memcache
-#  deployment: datacenter4
-#  cabinet: 13
-#  cab_u: 14-15
-#
-# Where cache data goes.
-# This data may contain sensitive data and should be protected accordingly=
.
-#cachedir: /var/cache/salt/minion
-
-# Append minion_id to these directories.  Helps with
-# multiple proxies and minions running on the same machine.
-# Allowed elements in the list: pki_dir, cachedir, extension_modules
-# Normally not needed unless running several proxies and/or minions on the=
 same machine
-# Defaults to ['cachedir'] for proxies, [] (empty list) for regular minion=
s
-#append_minionid_config_dirs:
-
-# Verify and set permissions on configuration directories at startup.
-#verify_env: True
-
-# The minion can locally cache the return data from jobs sent to it, this
-# can be a good way to keep track of jobs the minion has executed
-# (on the minion side). By default this feature is disabled, to enable, se=
t
-# cache_jobs to True.
-#cache_jobs: False
-
-# Set the directory used to hold unix sockets.
-#sock_dir: /var/run/salt/minion
-
-# Set the default outputter used by the salt-call command. The default is
-# "nested".
-#output: nested
-#
-# By default output is colored. To disable colored output, set the color v=
alue
-# to False.
-#color: True
-
-# Do not strip off the colored output from nested results and state output=
s
-# (true by default).
-# strip_colors: False
-
-# Backup files that are replaced by file.managed and file.recurse under
-# 'cachedir'/file_backups relative to their original location and appended
-# with a timestamp. The only valid setting is "minion". Disabled by defaul=
t.
-#
-# Alternatively this can be specified for each file in state files:
-# /etc/ssh/sshd_config:
-#   file.managed:
-#     - source: salt://ssh/sshd_config
-#     - backup: minion
-#
-#backup_mode: minion
-
-# When waiting for a master to accept the minion's public key, salt will
-# continuously attempt to reconnect until successful. This is the time, in
-# seconds, between those reconnection attempts.
-#acceptance_wait_time: 10
-
-# If this is nonzero, the time between reconnection attempts will increase=
 by
-# acceptance_wait_time seconds per iteration, up to this maximum. If this =
is
-# set to zero, the time between reconnection attempts will stay constant.
-#acceptance_wait_time_max: 0
-
-# If the master rejects the minion's public key, retry instead of exiting.
-# Rejected keys will be handled the same as waiting on acceptance.
-#rejected_retry: False
-
-# When the master key changes, the minion will try to re-auth itself to re=
ceive
-# the new master key. In larger environments this can cause a SYN flood on=
 the
-# master because all minions try to re-auth immediately. To prevent this a=
nd
-# have a minion wait for a random amount of time, use this optional parame=
ter.
-# The wait-time will be a random number of seconds between 0 and the defin=
ed value.
-#random_reauth_delay: 60
-
-# When waiting for a master to accept the minion's public key, salt will
-# continuously attempt to reconnect until successful. This is the timeout =
value,
-# in seconds, for each individual attempt. After this timeout expires, the=
 minion
-# will wait for acceptance_wait_time seconds before trying again. Unless y=
our master
-# is under unusually heavy load, this should be left at the default.
-#auth_timeout: 60
-
-# Number of consecutive SaltReqTimeoutError that are acceptable when tryin=
g to
-# authenticate.
-#auth_tries: 7
-
-# The number of attempts to connect to a master before giving up.
-# Set this to -1 for unlimited attempts. This allows for a master to have
-# downtime and the minion to reconnect to it later when it comes back up.
-# In 'failover' mode, it is the number of attempts for each set of masters=
.
-# In this mode, it will cycle through the list of masters for each attempt=
.
-#
-# This is different than auth_tries because auth_tries attempts to
-# retry auth attempts with a single master. auth_tries is under the
-# assumption that you can connect to the master but not gain
-# authorization from it. master_tries will still cycle through all
-# the masters in a given try, so it is appropriate if you expect
-# occasional downtime from the master(s).
-#master_tries: 1
-
-# If authentication fails due to SaltReqTimeoutError during a ping_interva=
l,
-# cause sub minion process to restart.
-#auth_safemode: False
-
-# Ping Master to ensure connection is alive (minutes).
-#ping_interval: 0
-
-# To auto recover minions if master changes IP address (DDNS)
-#    auth_tries: 10
-#    auth_safemode: False
-#    ping_interval: 90
-#
-# Minions won't know master is missing until a ping fails. After the ping =
fail,
-# the minion will attempt authentication and likely fails out and cause a =
restart.
-# When the minion restarts it will resolve the masters IP and attempt to r=
econnect.
-
-# If you don't have any problems with syn-floods, don't bother with the
-# three recon_* settings described below, just leave the defaults!
-#
-# The ZeroMQ pull-socket that binds to the masters publishing interface tr=
ies
-# to reconnect immediately, if the socket is disconnected (for example if
-# the master processes are restarted). In large setups this will have all
-# minions reconnect immediately which might flood the master (the ZeroMQ-d=
efault
-# is usually a 100ms delay). To prevent this, these three recon_* settings
-# can be used.
-# recon_default: the interval in milliseconds that the socket should wait =
before
-#                trying to reconnect to the master (1000ms =3D 1 second)
-#
-# recon_max: the maximum time a socket should wait. each interval the time=
 to wait
-#            is calculated by doubling the previous time. if recon_max is =
reached,
-#            it starts again at recon_default. Short example:
-#
-#            reconnect 1: the socket will wait 'recon_default' millisecond=
s
-#            reconnect 2: 'recon_default' * 2
-#            reconnect 3: ('recon_default' * 2) * 2
-#            reconnect 4: value from previous interval * 2
-#            reconnect 5: value from previous interval * 2
-#            reconnect x: if value >=3D recon_max, it starts again with re=
con_default
-#
-# recon_randomize: generate a random wait time on minion start. The wait t=
ime will
-#                  be a random value between recon_default and recon_defau=
lt +
-#                  recon_max. Having all minions reconnect with the same r=
econ_default
-#                  and recon_max value kind of defeats the purpose of bein=
g able to
-#                  change these settings. If all minions have the same val=
ues and your
-#                  setup is quite large (several thousand minions), they w=
ill still
-#                  flood the master. The desired behavior is to have timef=
rame within
-#                  all minions try to reconnect.
-#
-# Example on how to use these settings. The goal: have all minions reconne=
ct within a
-# 60 second timeframe on a disconnect.
-# recon_default: 1000
-# recon_max: 59000
-# recon_randomize: True
-#
-# Each minion will have a randomized reconnect value between 'recon_defaul=
t'
-# and 'recon_default + recon_max', which in this example means between 100=
0ms
-# 60000ms (or between 1 and 60 seconds). The generated random-value will b=
e
-# doubled after each attempt to reconnect. Lets say the generated random
-# value is 11 seconds (or 11000ms).
-# reconnect 1: wait 11 seconds
-# reconnect 2: wait 22 seconds
-# reconnect 3: wait 33 seconds
-# reconnect 4: wait 44 seconds
-# reconnect 5: wait 55 seconds
-# reconnect 6: wait time is bigger than 60 seconds (recon_default + recon_=
max)
-# reconnect 7: wait 11 seconds
-# reconnect 8: wait 22 seconds
-# reconnect 9: wait 33 seconds
-# reconnect x: etc.
-#
-# In a setup with ~6000 thousand hosts these settings would average the re=
connects
-# to about 100 per second and all hosts would be reconnected within 60 sec=
onds.
-# recon_default: 100
-# recon_max: 5000
-# recon_randomize: False
-#
-#
-# The loop_interval sets how long in seconds the minion will wait between
-# evaluating the scheduler and running cleanup tasks.  This defaults to 1
-# second on the minion scheduler.
-#loop_interval: 1
-
-# Some installations choose to start all job returns in a cache or a retur=
ner
-# and forgo sending the results back to a master. In this workflow, jobs
-# are most often executed with --async from the Salt CLI and then results
-# are evaluated by examining job caches on the minions or any configured r=
eturners.
-# WARNING: Setting this to False will **disable** returns back to the mast=
er.
-#pub_ret: True
-
-
-# The grains can be merged, instead of overridden, using this option.
-# This allows custom grains to defined different subvalues of a dictionary
-# grain. By default this feature is disabled, to enable set grains_deep_me=
rge
-# to ``True``.
-#grains_deep_merge: False
-
-# The grains_refresh_every setting allows for a minion to periodically che=
ck
-# its grains to see if they have changed and, if so, to inform the master
-# of the new grains. This operation is moderately expensive, therefore
-# care should be taken not to set this value too low.
-#
-# Note: This value is expressed in __minutes__!
-#
-# A value of 10 minutes is a reasonable default.
-#
-# If the value is set to zero, this check is disabled.
-#grains_refresh_every: 1
-
-# Cache grains on the minion. Default is False.
-#grains_cache: False
-
-# Cache rendered pillar data on the minion. Default is False.
-# This may cause 'cachedir'/pillar to contain sensitive data that should b=
e
-# protected accordingly.
-#minion_pillar_cache: False
-
-# Grains cache expiration, in seconds. If the cache file is older than thi=
s
-# number of seconds then the grains cache will be dumped and fully re-popu=
lated
-# with fresh data. Defaults to 5 minutes. Will have no effect if 'grains_c=
ache'
-# is not enabled.
-# grains_cache_expiration: 300
-
-# Determines whether or not the salt minion should run scheduled mine upda=
tes.
-# Defaults to "True". Set to "False" to disable the scheduled mine updates
-# (this essentially just does not add the mine update function to the mini=
on's
-# scheduler).
-#mine_enabled: True
-
-# Determines whether or not scheduled mine updates should be accompanied b=
y a job
-# return for the job cache. Defaults to "False". Set to "True" to include =
job
-# returns in the job cache for mine updates.
-#mine_return_job: False
-
-# Example functions that can be run via the mine facility
-# NO mine functions are established by default.
-# Note these can be defined in the minion's pillar as well.
-#mine_functions:
-#  test.ping: []
-#  network.ip_addrs:
-#    interface: eth0
-#    cidr: '10.0.0.0/8'
-
-# Windows platforms lack posix IPC and must rely on slower TCP based inter=
-
-# process communications. Set ipc_mode to 'tcp' on such systems
-#ipc_mode: ipc
-
-# Overwrite the default tcp ports used by the minion when in tcp mode
-#tcp_pub_port: 4510
-#tcp_pull_port: 4511
-
-# Passing very large events can cause the minion to consume large amounts =
of
-# memory. This value tunes the maximum size of a message allowed onto the
-# minion event bus. The value is expressed in bytes.
-#max_event_size: 1048576
-
-# To detect failed master(s) and fire events on connect/disconnect, set
-# master_alive_interval to the number of seconds to poll the masters for
-# connection events.
-#
-#master_alive_interval: 30
-
-# The minion can include configuration from other files. To enable this,
-# pass a list of paths to this option. The paths can be either relative or
-# absolute; if relative, they are considered to be relative to the directo=
ry
-# the main minion configuration file lives in (this file). Paths can make =
use
-# of shell-style globbing. If no files are matched by a path passed to thi=
s
-# option then the minion will log a warning message.
-#
-# Include a config file from some other path:
-# include: /etc/salt/extra_config
-#
-# Include config from several files and directories:
-#include:
-#  - /etc/salt/extra_config
-#  - /etc/roles/webserver
-
-# The syndic minion can verify that it is talking to the correct master vi=
a the
-# key fingerprint of the higher-level master with the "syndic_finger" conf=
ig.
-#syndic_finger: ''
-#
-#
-#
-#####   Minion module management     #####
-##########################################
-# Disable specific modules. This allows the admin to limit the level of
-# access the master has to the minion.  The default here is the empty list=
,
-# below is an example of how this needs to be formatted in the config file
-#disable_modules:
-#  - cmdmod
-#  - test
-#disable_returners: []
-
-# This is the reverse of disable_modules.  The default, like disable_modul=
es, is the empty list,
-# but if this option is set to *anything* then *only* those modules will l=
oad.
-# Note that this is a very large hammer and it can be quite difficult to k=
eep the minion working
-# the way you think it should since Salt uses many modules internally itse=
lf.  At a bare minimum
-# you need the following enabled or else the minion won't start.
-#whitelist_modules:
-#  - cmdmod
-#  - test
-#  - config
-
-# Modules can be loaded from arbitrary paths. This enables the easy deploy=
ment
-# of third party modules. Modules for returners and minions can be loaded.
-# Specify a list of extra directories to search for minion modules and
-# returners. These paths must be fully qualified!
-#module_dirs: []
-#returner_dirs: []
-#states_dirs: []
-#render_dirs: []
-#utils_dirs: []
-#
-# A module provider can be statically overwritten or extended for the mini=
on
-# via the providers option, in this case the default module will be
-# overwritten by the specified module. In this example the pkg module will
-# be provided by the yumpkg5 module instead of the system default.
-#providers:
-#  pkg: yumpkg5
-#
-# Enable Cython modules searching and loading. (Default: False)
-#cython_enable: False
-#
-# Specify a max size (in bytes) for modules on import. This feature is cur=
rently
-# only supported on *nix operating systems and requires psutil.
-# modules_max_memory: -1
-
-
-#####    State Management Settings    #####
-###########################################
-# The state management system executes all of the state templates on the m=
inion
-# to enable more granular control of system state management. The type of
-# template and serialization used for state management needs to be configu=
red
-# on the minion, the default renderer is yaml_jinja. This is a yaml file
-# rendered from a jinja template, the available options are:
-# yaml_jinja
-# yaml_mako
-# yaml_wempy
-# json_jinja
-# json_mako
-# json_wempy
-#
-#renderer: yaml_jinja
-#
-# The failhard option tells the minions to stop immediately after the firs=
t
-# failure detected in the state execution. Defaults to False.
-#failhard: False
-#
-# Reload the modules prior to a highstate run.
-#autoload_dynamic_modules: True
-#
-# clean_dynamic_modules keeps the dynamic modules on the minion in sync wi=
th
-# the dynamic modules on the master, this means that if a dynamic module i=
s
-# not on the master it will be deleted from the minion. By default, this i=
s
-# enabled and can be disabled by changing this value to False.
-#clean_dynamic_modules: True
-#
-# Normally, the minion is not isolated to any single environment on the ma=
ster
-# when running states, but the environment can be isolated on the minion s=
ide
-# by statically setting it. Remember that the recommended way to manage
-# environments is to isolate via the top file.
-#environment: None
-#
-# Isolates the pillar environment on the minion side. This functions the s=
ame
-# as the environment setting, but for pillar instead of states.
-#pillarenv: None
-#
-# Set this option to 'True' to force a 'KeyError' to be raised whenever an
-# attempt to retrieve a named value from pillar fails. When this option is=
 set
-# to 'False', the failed attempt returns an empty string. Default is 'Fals=
e'.
-#pillar_raise_on_missing: False
-#
-# If using the local file directory, then the state top file name needs to=
 be
-# defined, by default this is top.sls.
-#state_top: top.sls
-#
-# Run states when the minion daemon starts. To enable, set startup_states =
to:
-# 'highstate' -- Execute state.highstate
-# 'sls' -- Read in the sls_list option and execute the named sls files
-# 'top' -- Read top_file option and execute based on that file on the Mast=
er
-#startup_states: ''
-#
-# List of states to run when the minion starts up if startup_states is 'sl=
s':
-#sls_list:
-#  - edit.vim
-#  - hyper
-#
-# Top file to execute if startup_states is 'top':
-#top_file: ''
-
-# Automatically aggregate all states that have support for mod_aggregate b=
y
-# setting to True. Or pass a list of state module names to automatically
-# aggregate just those types.
-#
-# state_aggregate:
-#   - pkg
-#
-#state_aggregate: False
-
-#####     File Directory Settings    #####
-##########################################
-# The Salt Minion can redirect all file server operations to a local direc=
tory,
-# this allows for the same state tree that is on the master to be used if
-# copied completely onto the minion. This is a literal copy of the setting=
s on
-# the master but used to reference a local directory on the minion.
-
-# Set the file client. The client defaults to looking on the master server=
 for
-# files, but can be directed to look at the local file directory setting
-# defined below by setting it to "local". Setting a local file_client runs=
 the
-# minion in masterless mode.
-#file_client: remote
-
-# The file directory works on environments passed to the minion, each envi=
ronment
-# can have multiple root directories, the subdirectories in the multiple f=
ile
-# roots cannot match, otherwise the downloaded files will not be able to b=
e
-# reliably ensured. A base environment is required to house the top file.
-# Example:
-# file_roots:
-#   base:
-#     - /srv/salt/
-#   dev:
-#     - /srv/salt/dev/services
-#     - /srv/salt/dev/states
-#   prod:
-#     - /srv/salt/prod/services
-#     - /srv/salt/prod/states
-#
-#file_roots:
-#  base:
-#    - /srv/salt
-
-# Uncomment the line below if you do not want the file_server to follow
-# symlinks when walking the filesystem tree. This is set to True
-# by default. Currently this only applies to the default roots
-# fileserver_backend.
-#fileserver_followsymlinks: False
-#
-# Uncomment the line below if you do not want symlinks to be
-# treated as the files they are pointing to. By default this is set to
-# False. By uncommenting the line below, any detected symlink while listin=
g
-# files on the Master will not be returned to the Minion.
-#fileserver_ignoresymlinks: True
-#
-# By default, the Salt fileserver recurses fully into all defined environm=
ents
-# to attempt to find files. To limit this behavior so that the fileserver =
only
-# traverses directories with SLS files and special Salt directories like _=
modules,
-# enable the option below. This might be useful for installations where a =
file root
-# has a very large number of files and performance is negatively impacted.=
 Default
-# is False.
-#fileserver_limit_traversal: False
-
-# The hash_type is the hash to use when discovering the hash of a file on
-# the local fileserver. The default is md5, but sha1, sha224, sha256, sha3=
84
-# and sha512 are also supported.
-#
-# WARNING: While md5 and sha1 are also supported, do not use it due to the=
 high chance
-# of possible collisions and thus security breach.
-#
-# WARNING: While md5 is also supported, do not use it due to the high chan=
ce
-# of possible collisions and thus security breach.
-#
-# Warning: Prior to changing this value, the minion should be stopped and =
all
-# Salt caches should be cleared.
-#hash_type: sha256
-
-# The Salt pillar is searched for locally if file_client is set to local. =
If
-# this is the case, and pillar data is defined, then the pillar_roots need=
 to
-# also be configured on the minion:
-#pillar_roots:
-#  base:
-#    - /srv/pillar
-
-# Set a hard-limit on the size of the files that can be pushed to the mast=
er.
-# It will be interpreted as megabytes. Default: 100
-#file_recv_max_size: 100
-#
-#
-######        Security settings       #####
-###########################################
-# Enable "open mode", this mode still maintains encryption, but turns off
-# authentication, this is only intended for highly secure environments or =
for
-# the situation where your keys end up in a bad state. If you run in open =
mode
-# you do so at your own risk!
-#open_mode: False
-
-# Enable permissive access to the salt keys.  This allows you to run the
-# master or minion as root, but have a non-root group be given access to
-# your pki_dir.  To make the access explicit, root must belong to the grou=
p
-# you've given access to. This is potentially quite insecure.
-#permissive_pki_access: False
-
-# The state_verbose and state_output settings can be used to change the wa=
y
-# state system data is printed to the display. By default all data is prin=
ted.
-# The state_verbose setting can be set to True or False, when set to False
-# all data that has a result of True and no changes will be suppressed.
-#state_verbose: True
-
-# The state_output setting changes if the output is the full multi line
-# output for each changed state if set to 'full', but if set to 'terse'
-# the output will be shortened to a single line.
-#state_output: full
-
-# The state_output_diff setting changes whether or not the output from
-# successful states is returned. Useful when even the terse output of thes=
e
-# states is cluttering the logs. Set it to True to ignore them.
-#state_output_diff: False
-
-# The state_output_profile setting changes whether profile information
-# will be shown for each state run.
-#state_output_profile: True
-
-# Fingerprint of the master public key to validate the identity of your Sa=
lt master
-# before the initial key exchange. The master fingerprint can be found by =
running
-# "salt-key -f master.pub" on the Salt master.
-#master_finger: ''
-
-
-######         Thread settings        #####
-###########################################
-# Disable multiprocessing support, by default when a minion receives a
-# publication a new process is spawned and the command is executed therein=
.
-#multiprocessing: True
-
-
-#####         Logging settings       #####
-##########################################
-# The location of the minion log file
-# The minion log can be sent to a regular file, local path name, or networ=
k
-# location. Remote logging works best when configured to use rsyslogd(8) (=
e.g.:
-# ``file:///dev/log``), with rsyslogd(8) configured for network logging. T=
he URI
-# format is: <file|udp|tcp>://<host|socketpath>:<port-if-required>/<log-fa=
cility>
-#log_file: /var/log/salt/minion
-#log_file: file:///dev/log
-#log_file: udp://loghost:10514
-#
-#log_file: /var/log/salt/minion
-#key_logfile: /var/log/salt/key
-
-# The level of messages to send to the console.
-# One of 'garbage', 'trace', 'debug', info', 'warning', 'error', 'critical=
'.
-#
-# The following log levels are considered INSECURE and may log sensitive d=
ata:
-# ['garbage', 'trace', 'debug']
-#
-# Default: 'warning'
-#log_level: warning
-
-# The level of messages to send to the log file.
-# One of 'garbage', 'trace', 'debug', info', 'warning', 'error', 'critical=
'.
-# If using 'log_granular_levels' this must be set to the highest desired l=
evel.
-# Default: 'warning'
-#log_level_logfile:
-
-# The date and time format used in log messages. Allowed date/time formatt=
ing
-# can be seen here: http://docs.python.org/library/time.html#time.strftime
-#log_datefmt: '%H:%M:%S'
-#log_datefmt_logfile: '%Y-%m-%d %H:%M:%S'
-
-# The format of the console logging messages. Allowed formatting options c=
an
-# be seen here: http://docs.python.org/library/logging.html#logrecord-attr=
ibutes
-#
-# Console log colors are specified by these additional formatters:
-#
-# %(colorlevel)s
-# %(colorname)s
-# %(colorprocess)s
-# %(colormsg)s
-#
-# Since it is desirable to include the surrounding brackets, '[' and ']', =
in
-# the coloring of the messages, these color formatters also include paddin=
g as
-# well.  Color LogRecord attributes are only available for console logging=
.
-#
-#log_fmt_console: '%(colorlevel)s %(colormsg)s'
-#log_fmt_console: '[%(levelname)-8s] %(message)s'
-#
-#log_fmt_logfile: '%(asctime)s,%(msecs)03d [%(name)-17s][%(levelname)-8s] =
%(message)s'
-
-# This can be used to control logging levels more specificically.  This
-# example sets the main salt library at the 'warning' level, but sets
-# 'salt.modules' to log at the 'debug' level:
-#   log_granular_levels:
-#     'salt': 'warning'
-#     'salt.modules': 'debug'
-#
-#log_granular_levels: {}
-
-# To diagnose issues with minions disconnecting or missing returns, ZeroMQ
-# supports the use of monitor sockets to log connection events. This
-# feature requires ZeroMQ 4.0 or higher.
-#
-# To enable ZeroMQ monitor sockets, set 'zmq_monitor' to 'True' and log at=
 a
-# debug level or higher.
-#
-# A sample log event is as follows:
-#
-# [DEBUG   ] ZeroMQ event: {'endpoint': 'tcp://127.0.0.1:4505', 'event': 5=
12,
-# 'value': 27, 'description': 'EVENT_DISCONNECTED'}
-#
-# All events logged will include the string 'ZeroMQ event'. A connection e=
vent
-# should be logged as the minion starts up and initially connects to the
-# master. If not, check for debug log level and that the necessary version=
 of
-# ZeroMQ is installed.
-#
-#zmq_monitor: False
-
-######      Module configuration      #####
-###########################################
-# Salt allows for modules to be passed arbitrary configuration data, any d=
ata
-# passed here in valid yaml format will be passed on to the salt minion mo=
dules
-# for use. It is STRONGLY recommended that a naming convention be used in =
which
-# the module name is followed by a . and then the value. Also, all top lev=
el
-# data must be applied via the yaml dict construct, some examples:
-#
-# You can specify that all modules should run in test mode:
-#test: True
-#
-# A simple value for the test module:
-#test.foo: foo
-#
-# A list for the test module:
-#test.bar: [baz,quo]
-#
-# A dict for the test module:
-#test.baz: {spam: sausage, cheese: bread}
-#
-#
-######      Update settings          ######
-###########################################
-# Using the features in Esky, a salt minion can both run as a frozen app a=
nd
-# be updated on the fly. These options control how the update process
-# (saltutil.update()) behaves.
-#
-# The url for finding and downloading updates. Disabled by default.
-#update_url: False
-#
-# The list of services to restart after a successful update. Empty by defa=
ult.
-#update_restart_services: []
-
-
-######      Keepalive settings        ######
-############################################
-# ZeroMQ now includes support for configuring SO_KEEPALIVE if supported by
-# the OS. If connections between the minion and the master pass through
-# a state tracking device such as a firewall or VPN gateway, there is
-# the risk that it could tear down the connection the master and minion
-# without informing either party that their connection has been taken away=
.
-# Enabling TCP Keepalives prevents this from happening.
-
-# Overall state of TCP Keepalives, enable (1 or True), disable (0 or False=
)
-# or leave to the OS defaults (-1), on Linux, typically disabled. Default =
True, enabled.
-#tcp_keepalive: True
-
-# How long before the first keepalive should be sent in seconds. Default 3=
00
-# to send the first keepalive after 5 minutes, OS default (-1) is typicall=
y 7200 seconds
-# on Linux see /proc/sys/net/ipv4/tcp_keepalive_time.
-#tcp_keepalive_idle: 300
-
-# How many lost probes are needed to consider the connection lost. Default=
 -1
-# to use OS defaults, typically 9 on Linux, see /proc/sys/net/ipv4/tcp_kee=
palive_probes.
-#tcp_keepalive_cnt: -1
-
-# How often, in seconds, to send keepalives after the first one. Default -=
1 to
-# use OS defaults, typically 75 seconds on Linux, see
-# /proc/sys/net/ipv4/tcp_keepalive_intvl.
-#tcp_keepalive_intvl: -1
-
-
-######   Windows Software settings    ######
-############################################
-# Location of the repository cache file on the master:
-#win_repo_cachefile: 'salt://win/repo/winrepo.p'
-
-
-######      Returner  settings        ######
-############################################
-# Which returner(s) will be used for minion's result:
-#return: mysql
-
-
-######    Miscellaneous  settings     ######
-############################################
-# Default match type for filtering events tags: startswith, endswith, find=
, regex, fnmatch
-#event_match_type: startswith
diff --git a/meta-openstack/recipes-support/salt/files/roster b/meta-openst=
ack/recipes-support/salt/files/roster
deleted file mode 100644
index e5a8318..0000000
--- a/meta-openstack/recipes-support/salt/files/roster
+++ /dev/null
@@ -1,9 +0,0 @@
-# Sample salt-ssh config file
-#web1:
-#  host: 192.168.42.1 # The IP addr or DNS hostname
-#  user: fred         # Remote executions will be executed as user fred
-#  passwd: foobarbaz  # The password to use for login, if omitted, keys ar=
e used
-#  sudo: True         # Whether to sudo to root, not enabled by default
-#web2:
-#  host: 192.168.42.2
-
diff --git a/meta-openstack/recipes-support/salt/files/salt-api b/meta-open=
stack/recipes-support/salt/files/salt-api
deleted file mode 100755
index 4b45bd2..0000000
--- a/meta-openstack/recipes-support/salt/files/salt-api
+++ /dev/null
@@ -1,110 +0,0 @@
-#!/bin/sh
-### BEGIN INIT INFO
-# Provides:          salt-api
-# Required-Start:    $remote_fs $network
-# Required-Stop:     $remote_fs $network
-# Default-Start:     2 3 4 5
-# Default-Stop:      0 1 6
-# Short-Description: salt api control daemon
-# Description:       This is a daemon that exposes an external API
-### END INIT INFO
-
-# Author: Michael Prokop <mika@debian.org>
-
-PATH=3D/sbin:/usr/sbin:/bin:/usr/bin
-DESC=3D"salt api control daemon"
-NAME=3Dsalt-api
-DAEMON=3D/usr/bin/salt-api
-DAEMON_ARGS=3D"-d"
-PIDFILE=3D/var/run/$NAME.pid
-SCRIPTNAME=3D/etc/init.d/$NAME
-
-# Exit if the package is not installed
-[ -x "$DAEMON" ] || exit 0
-
-# Read configuration variable file if it is present
-[ -r /etc/default/$NAME ] && . /etc/default/$NAME
-
-# Source function library.
-. /etc/init.d/functions
-
-do_start() {
-    # Return
-    #   0 if daemon has been started
-    #   1 if daemon was already running
-    #   2 if daemon could not be started
-    pid=3D$(pidof -x $DAEMON)
-    if [ -n "$pid" ] ; then
-        return 1
-    fi
-
-    start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON --=
 $DAEMON_ARGS \
-            || return 2
-}
-
-do_stop() {
-    # Return
-    #   0 if daemon has been stopped
-    #   1 if daemon was already stopped
-    #   2 if daemon could not be stopped
-    #   other if a failure occ
-    start-stop-daemon --stop --retry=3DTERM/30/KILL/5 --quiet --pidfile $P=
IDFILE --name $NAME
-    RETVAL=3D$?
-    [ "$RETVAL" =3D 2 ] && return 2
-    rm -f $PIDFILE
-    return "$RETVAL"
-}
-
-case "$1" in
-    start)
-        [ "$VERBOSE" !=3D no ] && echo "Starting $DESC" "$NAME"
-        do_start
-        case "$?" in
-            0|1) [ "$VERBOSE" !=3D no ] && echo OK ;;
-              2) [ "$VERBOSE" !=3D no ] && echo FAILED ;;
-        esac
-        ;;
-    stop)
-        [ "$VERBOSE" !=3D no ] && echo "Stopping $DESC" "$NAME"
-        do_stop
-        case "$?" in
-            0|1) [ "$VERBOSE" !=3D no ] && echo OK ;;
-              2) [ "$VERBOSE" !=3D no ] && echo FAILED ;;
-        esac
-        ;;
-    status)
-        pid=3D`pidof -x $DAEMON`
-        if [ -n "$pid" ]; then
-            echo "$NAME (pid $pid) is running ..."
-        else
-            echo "$NAME is stopped"
-        fi
-	;;
-    #reload)
-        # not implemented
-        #;;
-    restart|force-reload)
-        echo "Restarting $DESC" "$NAME"
-        do_stop
-        case "$?" in
-          0|1)
-              do_start
-              case "$?" in
-                  0) echo OK ;;
-                  1) echo FAILED ;; # Old process is still running
-                  *) echo FAILED ;; # Failed to start
-              esac
-              ;;
-          *)
-              # Failed to stop
-              echo FAILED
-              ;;
-        esac
-        ;;
-    *)
-        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}"=
 >&2
-        exit 3
-        ;;
-esac
-
-exit 0
diff --git a/meta-openstack/recipes-support/salt/files/salt-common.bash_com=
pletion b/meta-openstack/recipes-support/salt/files/salt-common.bash_comple=
tion
deleted file mode 100644
index a457f4d..0000000
--- a/meta-openstack/recipes-support/salt/files/salt-common.bash_completion
+++ /dev/null
@@ -1,332 +0,0 @@
-# written by David Pravec
-#   - feel free to /msg alekibango on IRC if you want to talk about this f=
ile
-
-# TODO: check if --config|-c was used and use configured config file for q=
ueries
-# TODO: solve somehow completion for  salt -G pythonversion:[tab]
-#       (not sure what to do with lists)
-# TODO: --range[tab] --   how?
-# TODO: -E --exsel[tab] -- how?
-# TODO: --compound[tab] -- how?
-# TODO: use history to extract some words, esp. if ${cur} is empty
-# TODO: TEST EVERYTING a lot
-# TODO: cache results of some functions?  where? how long?
-# TODO: is it ok to use '--timeout 2' ?
-
-
-_salt_get_grains(){
-    if [ "$1" =3D 'local' ] ; then=20
-        salt-call --out=3Dtxt -- grains.ls | sed  's/^.*\[//' | tr -d ",']=
" |sed 's:\([a-z0-9]\) :\1\: :g'
-    else
-      salt '*' --timeout 2 --out=3Dtxt -- grains.ls | sed  's/^.*\[//' | t=
r -d ",']" |sed 's:\([a-z0-9]\) :\1\: :g'
-    fi
-}
-
-_salt_get_grain_values(){
-    if [ "$1" =3D 'local' ] ; then
-        salt-call --out=3Dtxt -- grains.item $1 |sed 's/^\S*:\s//' |grep -=
v '^\s*$'=20
-    else
-        salt '*' --timeout 2 --out=3Dtxt -- grains.item $1 |sed 's/^\S*:\s=
//' |grep -v '^\s*$'=20
-    fi
-}
-
-
-_salt(){
-    local cur prev opts _salt_grains _salt_coms pprev ppprev=20
-    COMPREPLY=3D()
-    cur=3D"${COMP_WORDS[COMP_CWORD]}"
-    prev=3D"${COMP_WORDS[COMP_CWORD-1]}"
-    if [ ${COMP_CWORD} -gt 2 ]; then
-	pprev=3D"${COMP_WORDS[COMP_CWORD-2]}"
-    fi
-    if [ ${COMP_CWORD} -gt 3 ]; then
-	ppprev=3D"${COMP_WORDS[COMP_CWORD-3]}"
-    fi
-
-    opts=3D"-h --help -d --doc --documentation --version --versions-report=
 -c \
-          --config-dir=3D -v --verbose -t --timeout=3D -s --static -b --ba=
tch=3D \
-          --batch-size=3D -E --pcre -L --list -G --grain --grain-pcre -N \
-          --nodegroup -R --range -C --compound -X --exsel -I --pillar \
-          --return=3D -a --auth=3D --eauth=3D --extended-auth=3D -T --make=
-token -S \
-          --ipcidr --out=3Dpprint --out=3Dyaml --out=3Doverstatestage --ou=
t=3Djson \
-          --out=3Draw --out=3Dhighstate --out=3Dkey --out=3Dtxt --no-color=
 --out-indent=3D "
-
-    if [[ "${cur}" =3D=3D -* ]] ; then
-        COMPREPLY=3D($(compgen -W "${opts}" -- ${cur}))
-        return 0
-    fi
-
-    # 2 special cases for filling up grain values
-    case "${pprev}" in
-    -G|--grain|--grain-pcre)
-    if [ "${cur}" =3D ":" ]; then
-        COMPREPLY=3D($(compgen -W "`_salt_get_grain_values ${prev}`"  ))=09
-        return 0
-    fi
-    ;;
-    esac=20
-    case "${ppprev}" in
-    -G|--grain|--grain-pcre)
-        if [ "${prev}" =3D ":" ]; then
-        COMPREPLY=3D( $(compgen -W "`_salt_get_grain_values ${pprev}`" -- =
${cur}) )
-        return 0
-        fi
-    ;;
-    esac =20
-=20
-    if [ "${cur}" =3D "=3D" ] && [[ "${prev}" =3D=3D --* ]]; then
-       cur=3D""=20
-    fi
-    if [ "${prev}" =3D "=3D" ] && [[ "${pprev}" =3D=3D --* ]]; then
-       prev=3D"${pprev}"
-    fi
-=20
-   case "${prev}" in
-=20
-     -c|--config)
-        COMPREPLY=3D($(compgen -f -- ${cur}))
-        return 0
-        ;;
-     salt)
-        COMPREPLY=3D($(compgen -W "\'*\' ${opts} `salt-key --no-color -l a=
cc`" -- ${cur}))
-        return 0
-        ;;
-     -E|--pcre)=20
-        COMPREPLY=3D($(compgen -W "`salt-key --no-color -l acc`" -- ${cur}=
))
-        return 0
-        ;;
-     -G|--grain|--grain-pcre)
-        COMPREPLY=3D($(compgen -W "$(_salt_get_grains)" -- ${cur}))=20
-        return 0
-	;;
-     -C|--compound)
-        COMPREPLY=3D() # TODO: finish this one? how?
-        return 0
-        ;;
-     -t|--timeout)
-        COMPREPLY=3D($( compgen -W "1 2 3 4 5 6 7 8 9 10 15 20 30 40 60 90=
 120 180" -- ${cur}))
-        return 0
-        ;;
-     -b|--batch|--batch-size)
-        COMPREPLY=3D($(compgen -W "1 2 3 4 5 6 7 8 9 10 15 20 30 40 50 60 =
70 80 90 100 120 150 200"))
-        return 0
-        ;;
-     -X|--exsel) # TODO: finish this one? how?
-        return 0
-        ;;
-     -N|--nodegroup) =20
-	    MASTER_CONFIG=3D'/etc/salt/master'
-        COMPREPLY=3D($(compgen -W "`awk -F ':'  'BEGIN {print_line =3D 0};=
  /^nodegroups/ {print_line =3D 1;getline } print_line && /^  */ {print $1}=
 /^[^ ]/ {print_line =3D 0}' <${MASTER_CONFIG}`" -- ${cur}))=20
-        return 0 =20
-     ;;
-    esac
-
-    _salt_coms=3D"$(salt '*' --timeout 2 --out=3Dtxt -- sys.list_functions=
 | sed 's/^.*\[//' | tr -d ",']" )"
-    all=3D"${opts} ${_salt_coms}"
-    COMPREPLY=3D( $(compgen -W "${all}" -- ${cur}) )
-
-  return 0
-}
-
-complete -F _salt salt
-
-
-_saltkey(){
-    local cur prev opts prev pprev
-    COMPREPLY=3D()
-    cur=3D"${COMP_WORDS[COMP_CWORD]}"
-    prev=3D"${COMP_WORDS[COMP_CWORD-1]}"
-    opts=3D"-c --config-dir=3D -h --help --version --versions-report -q --=
quiet \
-          -y --yes --gen-keys=3D --gen-keys-dir=3D --keysize=3D --key-logf=
ile=3D \
-          -l --list=3D -L --list-all -a --accept=3D -A --accept-all \=20
-          -r --reject=3D -R --reject-all -p --print=3D -P --print-all \=20
-          -d --delete=3D -D --delete-all -f --finger=3D -F --finger-all \
-          --out=3Dpprint --out=3Dyaml --out=3Doverstatestage --out=3Djson =
--out=3Draw \
-          --out=3Dhighstate --out=3Dkey --out=3Dtxt --no-color --out-inden=
t=3D "
-    if [ ${COMP_CWORD} -gt 2 ]; then
-        pprev=3D"${COMP_WORDS[COMP_CWORD-2]}"
-    fi
-    if [ ${COMP_CWORD} -gt 3 ]; then
-        ppprev=3D"${COMP_WORDS[COMP_CWORD-3]}"
-    fi
-    if [[ "${cur}" =3D=3D -* ]] ; then
-        COMPREPLY=3D($(compgen -W "${opts}" -- ${cur}))
-        return 0
-    fi
-
-    if [ "${cur}" =3D "=3D" ] && [[ "${prev}" =3D=3D --* ]]; then
-       cur=3D""=20
-    fi
-    if [ "${prev}" =3D "=3D" ] && [[ "${pprev}" =3D=3D --* ]]; then
-       prev=3D"${pprev}"
-    fi
-
-    case "${prev}" in=20
-     -a|--accept)
-        COMPREPLY=3D($(compgen -W "$(salt-key -l un --no-color; salt-key -=
l rej --no-color)" -- ${cur}))
-        return 0
-      ;;
-     -r|--reject)
-        COMPREPLY=3D($(compgen -W "$(salt-key -l acc --no-color)" -- ${cur=
}))
-        return 0
-        ;;
-     -d|--delete)
-        COMPREPLY=3D($(compgen -W "$(salt-key -l acc --no-color; salt-key =
-l un --no-color; salt-key -l rej --no-color)" -- ${cur}))
-        return 0
-        ;;
-     -c|--config)
-        COMPREPLY=3D($(compgen -f -- ${cur}))
-        return 0
-        ;;
-     --keysize)
-        COMPREPLY=3D($(compgen -W "2048 3072 4096 5120 6144" -- ${cur}))
-        return 0
-        ;;
-     --gen-keys)=20
-        return 0
-        ;;
-     --gen-keys-dir)
-        COMPREPLY=3D($(compgen -d -- ${cur}))
-        return 0
-        ;;
-     -p|--print)
-        COMPREPLY=3D($(compgen -W "$(salt-key -l acc --no-color; salt-key =
-l un --no-color; salt-key -l rej --no-color)" -- ${cur}))
-        return 0
-     ;;
-     -l|--list)
-        COMPREPLY=3D($(compgen -W "pre un acc accepted unaccepted rej reje=
cted all" -- ${cur}))
-        return 0
-     ;;
-     --accept-all)
-	return 0
-     ;;
-    esac
-    COMPREPLY=3D($(compgen -W "${opts} " -- ${cur}))
-    return 0
-}
-
-complete -F _saltkey salt-key
-
-_saltcall(){
-    local cur prev opts _salt_coms pprev ppprev
-    COMPREPLY=3D()
-    cur=3D"${COMP_WORDS[COMP_CWORD]}"
-    prev=3D"${COMP_WORDS[COMP_CWORD-1]}"
-    opts=3D"-h --help -d --doc --documentation --version --versions-report=
 \
-          -m --module-dirs=3D -g --grains --return=3D --local -c --config-=
dir=3D -l --log-level=3D \
-          --out=3Dpprint --out=3Dyaml --out=3Doverstatestage --out=3Djson =
--out=3Draw \
-          --out=3Dhighstate --out=3Dkey --out=3Dtxt --no-color --out-inden=
t=3D "
-    if [ ${COMP_CWORD} -gt 2 ]; then
-        pprev=3D"${COMP_WORDS[COMP_CWORD-2]}"
-    fi
-    if [ ${COMP_CWORD} -gt 3 ]; then
-        ppprev=3D"${COMP_WORDS[COMP_CWORD-3]}"
-    fi
-    if [[ "${cur}" =3D=3D -* ]] ; then
-        COMPREPLY=3D($(compgen -W "${opts}" -- ${cur}))
-        return 0
-    fi
-   =20
-    if [ "${cur}" =3D "=3D" ] && [[ ${prev} =3D=3D --* ]]; then
-       cur=3D""
-    fi
-    if [ "${prev}" =3D "=3D" ] && [[ ${pprev} =3D=3D --* ]]; then
-       prev=3D"${pprev}"
-    fi
-   =20
-    case ${prev} in
-        -m|--module-dirs)
-                COMPREPLY=3D( $(compgen -d ${cur} ))
-		return 0
- 	 	;;
-	-l|--log-level)
-		COMPREPLY=3D( $(compgen -W "info none garbage trace warning error debug"=
 -- ${cur}))
-		return 0
-		;;
-	-g|grains)
-                return 0
-		;;
-	salt-call)
-                COMPREPLY=3D($(compgen -W "${opts}" -- ${cur}))
-	        return 0
-		;;
-    esac
-
-    _salt_coms=3D"$(salt-call --out=3Dtxt -- sys.list_functions|sed 's/^.*=
\[//' | tr -d ",']"  )"
-    COMPREPLY=3D( $(compgen -W "${opts} ${_salt_coms}" -- ${cur} ))
-    return 0
-}
-
-complete -F _saltcall salt-call
-
-
-_saltcp(){
-    local cur prev opts target prefpart postpart helper filt pprev ppprev
-    COMPREPLY=3D()
-    cur=3D"${COMP_WORDS[COMP_CWORD]}"
-    prev=3D"${COMP_WORDS[COMP_CWORD-1]}"
-    opts=3D"-t --timeout=3D -s --static -b --batch=3D --batch-size=3D \
-          -h --help --version --versions-report -c --config-dir=3D \
-          -E --pcre -L --list -G --grain --grain-pcre -N --nodegroup \=20
-          -R --range -C --compound -X --exsel -I --pillar \
-          --out=3Dpprint --out=3Dyaml --out=3Doverstatestage --out=3Djson =
--out=3Draw \
-          --out=3Dhighstate --out=3Dkey --out=3Dtxt --no-color --out-inden=
t=3D "
-    if [[ "${cur}" =3D=3D -* ]] ; then
-        COMPREPLY=3D($(compgen -W "${opts}" -- ${cur}))
-        return 0
-    fi
-   =20
-    if [ "${cur}" =3D "=3D" ] && [[ "${prev}" =3D=3D --* ]]; then
-       cur=3D""=20
-    fi
-    if [ "${prev}" =3D "=3D" ] && [[ "${pprev}" =3D=3D --* ]]; then
-       prev=3D${pprev}
-    fi
-   =20
-    case ${prev} in
- 	salt-cp)
-	    COMPREPLY=3D($(compgen -W "${opts} `salt-key -l acc --no-color`" -- $=
{cur}))
-	    return 0
-	;;      =20
-        -t|--timeout)
-	    # those numbers are just a hint
-            COMPREPLY=3D($(compgen -W "2 3 4 8 10 15 20 25 30 40 60 90 120=
 180 240 300" -- ${cur} ))
-	    return 0
-        ;;
-	-E|--pcre)
-            COMPREPLY=3D($(compgen -W "`salt-key -l acc --no-color`" -- ${=
cur}))
-            return 0
-	;;
-	-L|--list)
-	    # IMPROVEMENTS ARE WELCOME
-	    prefpart=3D"${cur%,*},"
-	    postpart=3D${cur##*,}
-	    filt=3D"^\($(echo ${cur}| sed 's:,:\\|:g')\)$"
-            helper=3D($(salt-key -l acc --no-color | grep -v "${filt}" | s=
ed "s/^/${prefpart}/"))
-	    COMPREPLY=3D($(compgen -W "${helper[*]}" -- ${cur}))
-
-	    return 0
-	;;
-	-G|--grain|--grain-pcre)
-            COMPREPLY=3D($(compgen -W "$(_salt_get_grains)" -- ${cur}))=20
-            return 0
-	    ;;
-	    # FIXME
-	-R|--range)
-	    # FIXME ??
-	    return 0
-	;;
-	-C|--compound)
-	    # FIXME ??
-	    return 0
-	;;
-	-c|--config)
-	    COMPREPLY=3D($(compgen -f -- ${cur}))
-	    return 0
-	;;
-    esac
-  =20
-   # default is using opts:
-   COMPREPLY=3D( $(compgen -W "${opts}" -- ${cur}) )
-}
-
-complete -F _saltcp salt-cp
diff --git a/meta-openstack/recipes-support/salt/files/salt-common.logrotat=
e b/meta-openstack/recipes-support/salt/files/salt-common.logrotate
deleted file mode 100644
index 3cd0023..0000000
--- a/meta-openstack/recipes-support/salt/files/salt-common.logrotate
+++ /dev/null
@@ -1,23 +0,0 @@
-/var/log/salt/master {
-	weekly
-	missingok
-	rotate 7
-	compress
-	notifempty
-}
-
-/var/log/salt/minion {
-	weekly
-	missingok
-	rotate 7
-	compress
-	notifempty
-}
-
-/var/log/salt/key {
-	weekly
-	missingok
-	rotate 7
-	compress
-	notifempty
-}
diff --git a/meta-openstack/recipes-support/salt/files/salt-master b/meta-o=
penstack/recipes-support/salt/files/salt-master
deleted file mode 100755
index b534b36..0000000
--- a/meta-openstack/recipes-support/salt/files/salt-master
+++ /dev/null
@@ -1,111 +0,0 @@
-#!/bin/sh
-### BEGIN INIT INFO
-# Provides:          salt-master
-# Required-Start:    $remote_fs $network
-# Required-Stop:     $remote_fs $network
-# Default-Start:     2 3 4 5
-# Default-Stop:      0 1 6
-# Short-Description: salt master control daemon
-# Description:       This is a daemon that controls the salt minions
-### END INIT INFO
-
-# Author: Michael Prokop <mika@debian.org>
-
-PATH=3D/sbin:/usr/sbin:/bin:/usr/bin
-DESC=3D"salt master control daemon"
-NAME=3Dsalt-master
-DAEMON=3D/usr/bin/salt-master
-DAEMON_ARGS=3D"-d"
-PIDFILE=3D/var/run/$NAME.pid
-SCRIPTNAME=3D/etc/init.d/$NAME
-
-# Exit if the package is not installed
-[ -x "$DAEMON" ] || exit 0
-
-# Read configuration variable file if it is present
-[ -r /etc/default/$NAME ] && . /etc/default/$NAME
-
-# Source function library.
-. /etc/init.d/functions
-
-do_start() {
-    # Return
-    #   0 if daemon has been started
-    #   1 if daemon was already running
-    #   2 if daemon could not be started
-    pid=3D$(pidof -x  $DAEMON)
-    if [ -n "$pid" ] ; then
-        return 1
-    fi
-
-    start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON --=
 \
-            $DAEMON_ARGS \
-            || return 2
-}
-
-do_stop() {
-    # Return
-    #   0 if daemon has been stopped
-    #   1 if daemon was already stopped
-    #   2 if daemon could not be stopped
-    #   other if a failure occurred
-    start-stop-daemon --stop --quiet --retry=3DTERM/30/KILL/5 --pidfile $P=
IDFILE --name $NAME
-    RETVAL=3D"$?"
-    [ "$RETVAL" =3D 2 ] && return 2
-    rm -f $PIDFILE
-    return "$RETVAL"
-}
-
-case "$1" in
-    start)
-        [ "$VERBOSE" !=3D no ] && echo "Starting $DESC" "$NAME"
-        do_start
-        case "$?" in
-            0|1) [ "$VERBOSE" !=3D no ] && echo OK ;;
-              2) [ "$VERBOSE" !=3D no ] && echo FAILED ;;
-        esac
-        ;;
-    stop)
-        [ "$VERBOSE" !=3D no ] && echo "Stopping $DESC" "$NAME"
-        do_stop
-        case "$?" in
-            0|1) [ "$VERBOSE" !=3D no ] && echo OK ;;
-              2) [ "$VERBOSE" !=3D no ] && echo FAILED ;;
-        esac
-        ;;
-    status)
-        pid=3D`pidof -x $DAEMON`
-        if [ -n "$pid" ]; then
-	    echo "$NAME (pid $pid) is running ..."
-	else
-	    echo "$NAME is stopped"
-	fi
-        ;;
-    #reload)
-        # not implemented
-        #;;
-    restart|force-reload)
-        echo "Restarting $DESC" "$NAME"
-        do_stop
-        case "$?" in
-          0|1)
-              do_start
-              case "$?" in
-                  0) echo OK ;;
-                  1) echo FAILED ;; # Old process is still running
-                  *) echo FAILED ;; # Failed to start
-              esac
-              ;;
-          *)
-              # Failed to stop
-              echo FAILED
-              ;;
-        esac
-        ;;
-    *)
-        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}"=
 >&2
-        exit 3
-        ;;
-esac
-
-exit 0
diff --git a/meta-openstack/recipes-support/salt/files/salt-minion b/meta-o=
penstack/recipes-support/salt/files/salt-minion
deleted file mode 100755
index e062017..0000000
--- a/meta-openstack/recipes-support/salt/files/salt-minion
+++ /dev/null
@@ -1,111 +0,0 @@
-#!/bin/sh
-### BEGIN INIT INFO
-# Provides:          salt-minion
-# Required-Start:    $remote_fs $network
-# Required-Stop:     $remote_fs $network
-# Default-Start:     2 3 4 5
-# Default-Stop:      0 1 6
-# Short-Description: salt minion control daemon
-# Description:       This is a daemon that receives commands from a salt-m=
aster
-### END INIT INFO
-
-# Author: Michael Prokop <mika@debian.org>
-
-PATH=3D/sbin:/usr/sbin:/bin:/usr/bin
-DESC=3D"salt minion control daemon"
-NAME=3Dsalt-minion
-DAEMON=3D/usr/bin/salt-minion
-DAEMON_ARGS=3D"-d"
-PIDFILE=3D/var/run/$NAME.pid
-SCRIPTNAME=3D/etc/init.d/$NAME
-
-# Exit if the package is not installed
-[ -x "$DAEMON" ] || exit 0
-
-# Read configuration variable file if it is present
-[ -r /etc/default/$NAME ] && . /etc/default/$NAME
-
-# Source function library.
-. /etc/init.d/functions
-
-do_start() {
-    # Return
-    #   0 if daemon has been started
-    #   1 if daemon was already running
-    #   2 if daemon could not be started
-    pid=3D$(pidof -x $DAEMON)
-    if [ -n "$pid" ] ; then
-        return 1
-    fi
-
-    start-stop-daemon --start --quiet --background --pidfile $PIDFILE --ex=
ec $DAEMON -- \
-            $DAEMON_ARGS \
-            || return 2
-}
-
-do_stop() {
-    # Return
-    #   0 if daemon has been stopped
-    #   1 if daemon was already stopped
-    #   2 if daemon could not be stopped
-    #   other if a failure occurred
-    start-stop-daemon --stop --quiet --retry=3DTERM/30/KILL/5 --pidfile $P=
IDFILE --name $NAME
-    RETVAL=3D"$?"
-    [ "$RETVAL" =3D 2 ] && return 2
-    rm -f $PIDFILE
-    return "$RETVAL"
-}
-
-case "$1" in
-    start)
-        [ "$VERBOSE" !=3D no ] && echo "Starting $DESC" "$NAME"
-        do_start
-        case "$?" in
-            0|1) [ "$VERBOSE" !=3D no ] && echo OK ;;
-              2) [ "$VERBOSE" !=3D no ] && echo FAILED ;;
-        esac
-        ;;
-    stop)
-        [ "$VERBOSE" !=3D no ] && echo "Stopping $DESC" "$NAME"
-        do_stop
-        case "$?" in
-            0|1) [ "$VERBOSE" !=3D no ] && echo OK ;;
-              2) [ "$VERBOSE" !=3D no ] && echo FAILED ;;
-        esac
-        ;;
-    status)
-        pid=3D`pidof -x $DAEMON`
-	if [ -n "$pid" ]; then
-		echo "$NAME (pid $pid) is running ..."
-	else
-		echo "$NAME is stopped"
-	fi
-	;;
-    #reload)
-        # not implemented
-        #;;
-    restart|force-reload)
-        echo "Restarting $DESC" "$NAME"
-        do_stop
-        case "$?" in
-          0|1)
-              do_start
-              case "$?" in
-                  0) echo OK ;;
-                  1) echo FAILED ;; # Old process is still running
-                  *) echo FAILED ;; # Failed to start
-              esac
-              ;;
-          *)
-              # Failed to stop
-              echo FAILED
-              ;;
-        esac
-        ;;
-    *)
-        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}"=
 >&2
-        exit 3
-        ;;
-esac
-
-exit 0
diff --git a/meta-openstack/recipes-support/salt/files/salt-syndic b/meta-o=
penstack/recipes-support/salt/files/salt-syndic
deleted file mode 100755
index 6d5cdff..0000000
--- a/meta-openstack/recipes-support/salt/files/salt-syndic
+++ /dev/null
@@ -1,111 +0,0 @@
-#!/bin/sh
-### BEGIN INIT INFO
-# Provides:          salt-syndic
-# Required-Start:    $remote_fs $network
-# Required-Stop:     $remote_fs $network
-# Default-Start:     2 3 4 5
-# Default-Stop:      0 1 6
-# Short-Description: salt syndic control daemon
-# Description:       This is a daemon for the master of masters
-### END INIT INFO
-
-# Author: Michael Prokop <mika@debian.org>
-
-PATH=3D/sbin:/usr/sbin:/bin:/usr/bin
-DESC=3D"salt syndic control daemon"
-NAME=3Dsalt-syndic
-DAEMON=3D/usr/bin/salt-syndic
-DAEMON_ARGS=3D"-d"
-PIDFILE=3D/var/run/$NAME.pid
-SCRIPTNAME=3D/etc/init.d/$NAME
-
-# Exit if the package is not installed
-[ -x "$DAEMON" ] || exit 0
-
-# Read configuration variable file if it is present
-[ -r /etc/default/$NAME ] && . /etc/default/$NAME
-
-# Source function library.
-. /etc/init.d/functions
-
-do_start() {
-    # Return
-    #   0 if daemon has been started
-    #   1 if daemon was already running
-    #   2 if daemon could not be started
-    pid=3D$(pidof -x $DAEMON)
-    if [ -n "$pid" ] ; then
-        return 1
-    fi
-
-    start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON --=
 \
-            $DAEMON_ARGS \
-            || return 2
-}
-
-do_stop() {
-    # Return
-    #   0 if daemon has been stopped
-    #   1 if daemon was already stopped
-    #   2 if daemon could not be stopped
-    #   other if a failure occurred
-    start-stop-daemon --stop --quiet --retry=3DTERM/30/KILL/5 --pidfile $P=
IDFILE --name $NAME
-    RETVAL=3D"$?"
-    [ "$RETVAL" =3D 2 ] && return 2
-    rm -f $PIDFILE
-    return "$RETVAL"
-}
-
-case "$1" in
-    start)
-        [ "$VERBOSE" !=3D no ] && echo "Starting $DESC" "$NAME"
-        do_start
-        case "$?" in
-            0|1) [ "$VERBOSE" !=3D no ] && echo OK ;;
-              2) [ "$VERBOSE" !=3D no ] && echo FAILED ;;
-        esac
-        ;;
-    stop)
-        [ "$VERBOSE" !=3D no ] && echo "Stopping $DESC" "$NAME"
-        do_stop
-        case "$?" in
-            0|1) [ "$VERBOSE" !=3D no ] && echo OK ;;
-              2) [ "$VERBOSE" !=3D no ] && echo FAILED ;;
-        esac
-        ;;
-    status)
-        pid=3D`pidof -x $DAEMON`
-        if [ -n "$pid" ]; then
-	    echo "$NAME (pid $pid) is running ..."
-	else
-	    echo "$NAME is stopped"
-        fi
-	;;
-    #reload)
-        # not implemented
-        #;;
-    restart|force-reload)
-        echo "Restarting $DESC" "$NAME"
-        do_stop
-        case "$?" in
-          0|1)
-              do_start
-              case "$?" in
-                  0) echo OK ;;
-                  1) echo FAILED ;; # Old process is still running
-                  *) echo FAILED ;; # Failed to start
-              esac
-              ;;
-          *)
-              # Failed to stop
-              echo FAILED
-              ;;
-        esac
-        ;;
-    *)
-        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}"=
 >&2
-        exit 3
-        ;;
-esac
-
-exit 0
diff --git a/meta-openstack/recipes-support/salt/salt/set_python_location_h=
ashbang.patch b/meta-openstack/recipes-support/salt/salt/set_python_locatio=
n_hashbang.patch
index 2369d4c..76d6f41 100644
--- a/meta-openstack/recipes-support/salt/salt/set_python_location_hashbang=
.patch
+++ b/meta-openstack/recipes-support/salt/salt/set_python_location_hashbang=
.patch
@@ -6,102 +6,153 @@ Upstream-Status: Pending
 # processes that are generically named python. Changed shebang so
 # process names will be identifiable by the init scripts.
=20
-diff -Naur a/scripts/salt-api b/scripts/salt-api
---- a/scripts/salt-api	2015-04-08 16:48:01.912294278 -0500
-+++ b/scripts/salt-api	2015-04-08 16:49:03.336483297 -0500
+diff --git a/scripts/salt b/scripts/salt
+index 1a6d6b4d0c..0408ad07b2 100755
+--- a/scripts/salt
++++ b/scripts/salt
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
-+#!/usr/bin/python
++#!/usr/bin/env python3
+ '''
+ Publish commands to the salt system from the command line on the master.
+ '''
+diff --git a/scripts/salt-api b/scripts/salt-api
+index 6f028bacb6..7a51117822 100755
+--- a/scripts/salt-api
++++ b/scripts/salt-api
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
 =20
  # Import salt libs
  from salt.scripts import salt_api
-diff -Naur a/scripts/salt-call b/scripts/salt-call
---- a/scripts/salt-call	2015-04-08 16:48:01.912294278 -0500
-+++ b/scripts/salt-call	2015-04-08 16:49:11.360507977 -0500
+diff --git a/scripts/salt-call b/scripts/salt-call
+index 5b8a8f3935..9ddda9428d 100755
+--- a/scripts/salt-call
++++ b/scripts/salt-call
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
-+#!/usr/bin/python
++#!/usr/bin/env python3
  '''
  Directly call a salt command in the modules, does not require a running s=
alt
  minion to run.
-diff -Naur a/scripts/salt-cloud b/scripts/salt-cloud
---- a/scripts/salt-cloud	2015-04-08 16:48:01.912294278 -0500
-+++ b/scripts/salt-cloud	2015-04-08 16:49:20.612536436 -0500
+diff --git a/scripts/salt-cloud b/scripts/salt-cloud
+index e977b68179..01c593881c 100755
+--- a/scripts/salt-cloud
++++ b/scripts/salt-cloud
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
-+#!/usr/bin/python
++#!/usr/bin/env python3
  '''
  Publish commands to the salt system from the command line on the master.
  '''
-diff -Naur a/scripts/salt-cp b/scripts/salt-cp
---- a/scripts/salt-cp	2015-04-08 16:48:01.912294278 -0500
-+++ b/scripts/salt-cp	2015-04-08 16:49:30.132565723 -0500
+diff --git a/scripts/salt-cp b/scripts/salt-cp
+index 3da660d137..dcc3f11554 100755
+--- a/scripts/salt-cp
++++ b/scripts/salt-cp
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
-+#!/usr/bin/python
++#!/usr/bin/env python3
  '''
  Publish commands to the salt system from the command line on the master.
  '''
-diff -Naur a/scripts/salt-key b/scripts/salt-key
---- a/scripts/salt-key	2015-04-08 16:48:01.912294278 -0500
-+++ b/scripts/salt-key	2015-04-08 16:49:39.912595801 -0500
+diff --git a/scripts/salt-extend b/scripts/salt-extend
+index 5385a7b6a9..b01c584bb4 100755
+--- a/scripts/salt-extend
++++ b/scripts/salt-extend
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ '''
+ Quickstart for creating an/or extending the functionality of your SaltSta=
ck installation
+=20
+diff --git a/scripts/salt-key b/scripts/salt-key
+index cb26dfd5a6..596b202a3f 100755
+--- a/scripts/salt-key
++++ b/scripts/salt-key
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
-+#!/usr/bin/python
++#!/usr/bin/env python3
  '''
  Manage the authentication keys with salt-key
  '''
-diff -Naur a/scripts/salt-master b/scripts/salt-master
---- a/scripts/salt-master	2015-04-08 16:48:01.912294278 -0500
-+++ b/scripts/salt-master	2015-04-08 16:49:50.224627508 -0500
+diff --git a/scripts/salt-master b/scripts/salt-master
+index b4323bd532..52bb47dc47 100755
+--- a/scripts/salt-master
++++ b/scripts/salt-master
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
-+#!/usr/bin/python
++#!/usr/bin/env python3
  '''
  Start the salt-master
  '''
-diff -Naur a/scripts/salt-minion b/scripts/salt-minion
---- a/scripts/salt-minion	2015-04-08 16:48:01.912294278 -0500
-+++ b/scripts/salt-minion	2015-04-08 16:49:57.808650832 -0500
+diff --git a/scripts/salt-minion b/scripts/salt-minion
+index 74a9fa1d67..4a23ed9122 100755
+--- a/scripts/salt-minion
++++ b/scripts/salt-minion
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
-+#!/usr/bin/python
++#!/usr/bin/env python3
  '''
  This script is used to kick off a salt minion daemon
  '''
-diff -Naur a/scripts/salt-run b/scripts/salt-run
---- a/scripts/salt-run	2015-04-08 16:48:01.912294278 -0500
-+++ b/scripts/salt-run	2015-04-08 16:50:06.588677825 -0500
+diff --git a/scripts/salt-proxy b/scripts/salt-proxy
+index e921e6590b..443774ef85 100755
+--- a/scripts/salt-proxy
++++ b/scripts/salt-proxy
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
-+#!/usr/bin/python
++#!/usr/bin/env python3
+ # -*- coding: utf-8 -*-
+ '''
+ This script is used to kick off a salt proxy minion daemon
+diff --git a/scripts/salt-run b/scripts/salt-run
+index 2b2d86554c..cfef160ab0 100755
+--- a/scripts/salt-run
++++ b/scripts/salt-run
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
  '''
  Execute a salt convenience routine
  '''
-diff -Naur a/scripts/salt-ssh b/scripts/salt-ssh
---- a/scripts/salt-ssh	2015-04-08 16:48:01.912294278 -0500
-+++ b/scripts/salt-ssh	2015-04-08 16:50:13.680699631 -0500
+diff --git a/scripts/salt-ssh b/scripts/salt-ssh
+index 4f21baa5f4..77bb6ceb38 100755
+--- a/scripts/salt-ssh
++++ b/scripts/salt-ssh
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
-+#!/usr/bin/python
++#!/usr/bin/env python3
  '''
  Execute the salt ssh system
  '''
-diff -Naur a/scripts/salt-syndic b/scripts/salt-syndic
---- a/scripts/salt-syndic	2015-04-08 16:48:01.912294278 -0500
-+++ b/scripts/salt-syndic	2015-04-08 16:50:20.892721803 -0500
+diff --git a/scripts/salt-syndic b/scripts/salt-syndic
+index d6faf2df63..896bf5f3b0 100755
+--- a/scripts/salt-syndic
++++ b/scripts/salt-syndic
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
-+#!/usr/bin/python
++#!/usr/bin/env python3
  '''
  This script is used to kick off a salt syndic daemon
  '''
-diff -Naur a/scripts/salt-unity b/scripts/salt-unity
---- a/scripts/salt-unity	2015-04-08 16:48:01.912294278 -0500
-+++ b/scripts/salt-unity	2015-04-08 16:50:35.968768142 -0500
+diff --git a/scripts/salt-unity b/scripts/salt-unity
+index b0a2d31597..ff1fa9034c 100755
+--- a/scripts/salt-unity
++++ b/scripts/salt-unity
 @@ -1,4 +1,4 @@
--#!/usr/bin/env python2
-+#!/usr/bin/python2
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+=20
+ from salt.scripts import salt_unity
+=20
+diff --git a/scripts/spm b/scripts/spm
+index 027864ee11..4d9b648b5d 100755
+--- a/scripts/spm
++++ b/scripts/spm
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ '''
+ Publish commands to the salt system from the command line on the master.
 =20
- # Import python libs
- import sys
diff --git a/meta-openstack/recipes-support/salt/salt_2018.3.0.bb b/meta-op=
enstack/recipes-support/salt/salt_3000.bb
similarity index 67%
rename from meta-openstack/recipes-support/salt/salt_2018.3.0.bb
rename to meta-openstack/recipes-support/salt/salt_3000.bb
index fb75872..c2bc8da 100644
--- a/meta-openstack/recipes-support/salt/salt_2018.3.0.bb
+++ b/meta-openstack/recipes-support/salt/salt_3000.bb
@@ -1,12 +1,17 @@
 HOMEPAGE =3D "http://saltstack.com/"
 SECTION =3D "admin"
 LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfb92f464675f6b5df90f540d6023791=
5"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D89aea4e17d99a7cacdbeed46a0096b1=
0"
 DEPENDS =3D "\
            python3-msgpack \
            python3-pyyaml \
            python3-jinja2 \
            python3-markupsafe \
+           python3-dateutil \
+           python3-pycrypto \
+           python3-pytest-salt \
+           python3-pyzmq \
+           python3-requests \
 "
=20
 PACKAGECONFIG ??=3D "zeromq"
@@ -15,68 +20,63 @@ PACKAGECONFIG[tcp] =3D ",,python3-pycrypto"
=20
 SRC_URI =3D "https://files.pythonhosted.org/packages/source/s/${PN}/${PN}-=
${PV}.tar.gz \
            file://set_python_location_hashbang.patch \
-           file://minion \
-           file://salt-minion \
-           file://salt-common.bash_completion \
-           file://salt-common.logrotate \
-           file://salt-api \
-           file://salt-master \
-           file://master \
-           file://salt-syndic \
-           file://cloud \
-           file://roster \
 "
=20
-SRC_URI[md5sum] =3D "b6ec271b59554b9af7ff4005028434b5"
-SRC_URI[sha256sum] =3D "a0a45d22fdf6961542a419b7e09568a3118e2b019ffe7bab9d=
ee5aeb55b56b31"
+SRC_URI[md5sum] =3D "8084ef6f2a275b627ae364b9d562b4ff"
+SRC_URI[sha256sum] =3D "04fbc64933b375cbbefc9576bcc65167b74d5eec7f58e64d09=
6d67529ea66500"
+
+
+SYSTEMD_AUTO_ENABLE_${PN}-master =3D "disable"
+SYSTEMD_AUTO_ENABLE_${PN}-minion =3D "disable"
+SYSTEMD_AUTO_ENABLE_${PN}-api =3D "disable"
=20
 S =3D "${WORKDIR}/${PN}-${PV}"
=20
-inherit setuptools3 update-rc.d
+inherit setuptools3 systemd
=20
 # Avoid a QA Warning triggered by the test package including a file
 # with a .a extension
 INSANE_SKIP_${PN}-tests +=3D "staticdev"
=20
+RDEPENDS_${PN} +=3D "${PN}-api \
+                   ${PN}-common \
+                   ${PN}-master \
+                   ${PN}-minion \
+                   ${PN}-bash-completion \
+"
+
 # Note ${PN}-tests must be before ${PN}-common in the PACKAGES variable
 # in order for ${PN}-tests to own the correct FILES.
 PACKAGES +=3D "\
-           ${PN}-tests \
            ${PN}-api \
-           ${PN}-cloud \
            ${PN}-common \
            ${PN}-master \
            ${PN}-minion \
-           ${PN}-ssh \
+           ${PN}-cloud \
            ${PN}-syndic \
+           ${PN}-ssh \
            ${PN}-bash-completion \
+           ${PN}-zsh-completion \
 "
=20
 do_install_append() {
-        install -d ${D}${sysconfdir}/bash_completion.d/
-        install -m 0644 ${WORKDIR}/salt-common.bash_completion ${D}${sysco=
nfdir}/bash_completion.d/${PN}-common
-        install -d ${D}${sysconfdir}/logrotate.d/
-        install -m 0644 ${WORKDIR}/salt-common.logrotate ${D}${sysconfdir}=
/logrotate.d/${PN}-common
-        install -d ${D}${sysconfdir}/init.d/
-        install -m 0755 ${WORKDIR}/salt-minion ${D}${sysconfdir}/init.d/${=
PN}-minion
-        install -m 0755 ${WORKDIR}/salt-api ${D}${sysconfdir}/init.d/${PN}=
-api
-        install -m 0755 ${WORKDIR}/salt-master ${D}${sysconfdir}/init.d/${=
PN}-master
-        install -m 0755 ${WORKDIR}/salt-syndic ${D}${sysconfdir}/init.d/${=
PN}-syndic
-        install -d ${D}${sysconfdir}/${PN}/
-        install -m 0644 ${WORKDIR}/minion ${D}${sysconfdir}/${PN}/minion
-        install -m 0644 ${WORKDIR}/master ${D}${sysconfdir}/${PN}/master
-        install -m 0644 ${WORKDIR}/cloud ${D}${sysconfdir}/${PN}/cloud
-        install -m 0644 ${WORKDIR}/roster ${D}${sysconfdir}/${PN}/roster
-        install -d ${D}${sysconfdir}/${PN}/cloud.conf.d ${D}${sysconfdir}/=
${PN}/cloud.profiles.d ${D}${sysconfdir}/${PN}/cloud.providers.d
-
-        install -d ${D}${PYTHON_SITEPACKAGES_DIR}/${PN}-tests/
-        cp -r ${S}/tests/ ${D}${PYTHON_SITEPACKAGES_DIR}/${PN}-tests/
+        install -Dm644 ${S}/pkg/salt-common.logrotate ${D}${sysconfdir}/lo=
grotate.d/${PN}
+        install -Dm644 ${S}/pkg/salt.bash ${D}${datadir}/bash-completion/c=
ompletions/${PN}
+        install -Dm644 ${S}/pkg/zsh_completion.zsh ${D}${datadir}/zsh/site=
-functions/_${PN}
+
+        # default config
+        install -Dm644 ${S}/conf/minion ${D}${sysconfdir}/${PN}/minion
+        install -Dm644 ${S}/conf/minion ${D}${sysconfdir}/${PN}/master
+
+        # systemd services
+        for _svc in salt-master.service salt-syndic.service salt-minion.se=
rvice salt-api.service; do
+            install -Dm644 ${S}/pkg/$_svc "${D}${systemd_system_unitdir}/$=
_svc"
+        done
 }
=20
 ALLOW_EMPTY_${PN} =3D "1"
 FILES_${PN} =3D ""
-
-INITSCRIPT_PACKAGES =3D "${PN}-minion ${PN}-api ${PN}-master ${PN}-syndic"
+FILES_${PN} +=3D "${systemd_system_unitdir} ${systemd_system_unitdir}/* /e=
tc/salt/master.d /etc/salt/master.d/preseed_key.py"
=20
 DESCRIPTION_COMMON =3D "salt is a powerful remote execution manager that c=
an be used to administer servers in a\
  fast and efficient way. It allows commands to be executed across large gr=
oups of servers. This means systems\
@@ -93,20 +93,18 @@ RDEPENDS_${PN}-minion +=3D "${@bb.utils.contains('PACKA=
GECONFIG', 'zeromq', 'pytho
 RDEPENDS_${PN}-minion +=3D "${@bb.utils.contains('PACKAGECONFIG', 'tcp', '=
python3-pycrypto', '',d)}"
 RRECOMMENDS_${PN}-minion_append_x64 =3D "dmidecode"
 RSUGGESTS_${PN}-minion =3D "python3-augeas"
-CONFFILES_${PN}-minion =3D "${sysconfdir}/${PN}/minion ${sysconfdir}/init.=
d/${PN}-minion"
-FILES_${PN}-minion =3D "${bindir}/${PN}-minion ${sysconfdir}/${PN}/minion.=
d/ ${CONFFILES_${PN}-minion} ${bindir}/${PN}-proxy"
-INITSCRIPT_NAME_${PN}-minion =3D "${PN}-minion"
-INITSCRIPT_PARAMS_${PN}-minion =3D "defaults"
+CONFFILES_${PN}-minion =3D "${sysconfdir}/${PN}/minion"
+FILES_${PN}-minion =3D "${bindir}/${PN}-minion ${sysconfdir}/${PN}/minion.=
d/ ${CONFFILES_${PN}-minion} ${bindir}/${PN}-proxy ${systemd_system_unitdir=
}/salt-minion.service"
=20
 SUMMARY_${PN}-common =3D "shared libraries that salt requires for all pack=
ages"
 DESCRIPTION_${PN}-common =3D"${DESCRIPTION_COMMON} This particular package=
 provides shared libraries that \
 salt-master, salt-minion, and salt-syndic require to function."
-RDEPENDS_${PN}-common =3D "python3-dateutil python3-jinja2 python3-pyyaml =
python3-requests (>=3D 1.0.0) python3-tornado (>=3D 4.2.1)"
-RRECOMMENDS_${PN}-common =3D "lsb python3-futures"
+RDEPENDS_${PN}-common =3D "python3-dateutil python3-jinja2 python3-pyyaml =
python3-requests (>=3D 1.0.0)"
+RRECOMMENDS_${PN}-common =3D "lsb"
 RSUGGESTS_${PN}-common =3D "python3-mako python3-git"
 RCONFLICTS_${PN}-common =3D "python3-mako (< 0.7.0)"
-CONFFILES_${PN}-common=3D"${sysconfdir}/logrotate.d/${PN}-common"
-FILES_${PN}-common =3D "${bindir}/${PN}-call ${libdir}/python${PYTHON_BASE=
VERSION}/ ${CONFFILES_${PN}-common}"
+CONFFILES_${PN}-common=3D"${sysconfdir}/logrotate.d/${PN}"
+FILES_${PN}-common =3D "${bindir}/${PN}-call ${libdir}/python3.7/ ${CONFFI=
LES_${PN}-common}"
=20
 SUMMARY_${PN}-ssh =3D "remote manager to administer servers via salt"
 DESCRIPTION_${PN}-ssh =3D "${DESCRIPTION_COMMON} This particular package p=
rovides the salt ssh controller. It \
@@ -125,9 +123,8 @@ even a Websocket API. The Salt API system is used to ex=
pose the fundamental aspe
 RDEPENDS_${PN}-api =3D "${PN}-master"
 RSUGGESTS_${PN}-api =3D "python3-cherrypy"
 CONFFILES_${PN}-api =3D "${sysconfdir}/init.d/${PN}-api"
-FILES_${PN}-api =3D "${bindir}/${PN}-api ${CONFFILES_${PN}-api}"
-INITSCRIPT_NAME_${PN}-api =3D "${PN}-api"
-INITSCRIPT_PARAMS_${PN}-api =3D "defaults"
+FILES_${PN}-api =3D "${bindir}/${PN}-api ${CONFFILES_${PN}-api} ${systemd_=
system_unitdir}/${PN}-api.service"
+
=20
 SUMMARY_${PN}-master =3D "remote manager to administer servers via salt"
 DESCRIPTION_${PN}-master =3D"${DESCRIPTION_COMMON} This particular package=
 provides the salt controller."
@@ -136,18 +133,15 @@ RDEPENDS_${PN}-master +=3D "${@bb.utils.contains('PAC=
KAGECONFIG', 'zeromq', 'pytho
 RDEPENDS_${PN}-master +=3D "${@bb.utils.contains('PACKAGECONFIG', 'tcp', '=
python3-pycrypto', '',d)}"
 CONFFILES_${PN}-master=3D"${sysconfdir}/init.d/${PN}-master  ${sysconfdir}=
/${PN}/master"
 RSUGGESTS_${PN}-master =3D "python3-git"
-FILES_${PN}-master =3D "${bindir}/${PN} ${bindir}/${PN}-cp ${bindir}/${PN}=
-key ${bindir}/${PN}-master ${bindir}/${PN}-run ${bindir}/${PN}-unity ${bin=
dir}/spm ${CONFFILES_${PN}-master}"
-INITSCRIPT_NAME_${PN}-master =3D "${PN}-master"
-INITSCRIPT_PARAMS_${PN}-master =3D "defaults"
+FILES_${PN}-master =3D "${bindir}/${PN} ${bindir}/${PN}-cp ${bindir}/${PN}=
-key ${bindir}/${PN}-master ${bindir}/${PN}-run ${bindir}/${PN}-unity ${bin=
dir}/spm ${CONFFILES_${PN}-master} ${systemd_system_unitdir}/${PN}-master.s=
ervice"
+
=20
 SUMMARY_${PN}-syndic =3D "master-of-masters for salt, the distributed remo=
te execution system"
 DESCRIPTION_${PN}-syndic =3D "${DESCRIPTION_COMMON} This particular packag=
e provides the master of masters for \
 salt; it enables the management of multiple masters at a time."
 RDEPENDS_${PN}-syndic =3D "${PN}-master (=3D ${EXTENDPKGV})"
 CONFFILES_${PN}-syndic=3D"${sysconfdir}/init.d/${PN}-syndic"
-FILES_${PN}-syndic =3D "${bindir}/${PN}-syndic ${CONFFILES_${PN}-syndic}"
-INITSCRIPT_NAME_${PN}-syndic =3D "${PN}-syndic"
-INITSCRIPT_PARAMS_${PN}-syndic =3D "defaults"
+FILES_${PN}-syndic =3D "${bindir}/${PN}-syndic ${CONFFILES_${PN}-syndic} $=
{systemd_system_unitdir}/${PN}-syndic.service"
=20
 SUMMARY_${PN}-cloud =3D "public cloud VM management system"
 DESCRIPTION_${PN}-cloud =3D "provision virtual machines on various public =
clouds via a cleanly controlled profile and mapping system."
@@ -161,4 +155,5 @@ DESCRIPTION_${PN}-tests =3D"${DESCRIPTION_COMMON} This =
particular package provides
 RDEPENDS_${PN}-tests =3D "${PN}-common python3-pytest-salt python3-tests p=
ython3-image bash"
 FILES_${PN}-tests =3D "${PYTHON_SITEPACKAGES_DIR}/salt-tests/tests/"
=20
-FILES_${PN}-bash-completion =3D "${sysconfdir}/bash_completion.d/${PN}-com=
mon"
+FILES_${PN}-bash-completion =3D "${datadir}/bash-completion"
+FILES_${PN}-zsh-completion =3D "${datadir}/zsh/site-functions"
--=20
2.25.1

