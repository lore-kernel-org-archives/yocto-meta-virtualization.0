Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web08.3793.1615520991719785441
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 11 Mar 2021 19:49:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JTwjFUtM;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id z190so23016331qka.9
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 11 Mar 2021 19:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bD+qwgWcF6vifxiRIlp3skUVuja9nhPMkO6frVRsziQ=;
        b=JTwjFUtMpaoX/LJtU9COQ9LFj6ytcwhWu2LF720N/ODBVT0ZL4kxHrUzZITcfhdXYJ
         HVCstFOFz/INLqOyH6sQU+p490EnNMI6F6KFPQ7TQZkW0T+kQGwPwacf6Y5Xr5HrI4Eq
         IstKe2ppCznxQ9y2CGZ58brj/9/RroPxM5/g9/haH44nuYKIkSHKlOiqSPD4GaVunRcE
         9bbqtXYWnYMdLJCBmT5xx4oM2hzRpSa27WkB4C9YFqW4DGlnYH4I8FhwVaAE5XZhxygZ
         YktcI2O6xWuiAwtiNThy7Quu6NSEcXEiTyD9KO36PbPd7BGNmqmWF0HhOlOQ39vedrSU
         8PTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bD+qwgWcF6vifxiRIlp3skUVuja9nhPMkO6frVRsziQ=;
        b=nhY3HXW4LeVWRMQbE7CKBHUDM/Xk9JqfmM+U7fjK5dUIogeIdOCZHhyr1c1+2XmrKQ
         WeHMPDxFCKVL1LHUP/4IaFHOwSkiA3VdC34qWp23wrlx6UPMTZ084dT7e7dchJpSkOsf
         +f7v0v1dMIXgP3IYzGx9mysabIx/s63Z5A9+vaoz07fe+w2XKOw516dt0igjK+zeQpFT
         /odObxsnWVMtlMb1+pon5M9P+g4Q5517ZeQOyadc1L8eBLhHiPtXRpLcp83i+JLj/h/W
         RQwCd8SVUCEJReU6x/WFV2WUdJwpRzyvfyy1ESesKcWLwh0M88gmtkM521YRkHIAKXTc
         V+zg==
X-Gm-Message-State: AOAM533Y8LeBnh14oj73JvS6mC4qi5pynAytm1v//f328MFOwEvsCKAD
	JYcCL7hOrP/xPbj/wWgFDLk=
X-Google-Smtp-Source: ABdhPJw71pOA4MMRoXc674XQGxcl+iTl1QsvSXq2rQIpqR58jVospPvQiSZ1HCeeY1UjKjmSihmVBQ==
X-Received: by 2002:a37:a647:: with SMTP id p68mr10793640qke.189.1615520990648;
        Thu, 11 Mar 2021 19:49:50 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id v145sm3717243qka.27.2021.03.11.19.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 19:49:50 -0800 (PST)
Date: Thu, 11 Mar 2021 22:49:48 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: qiang.zhang@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] openvswitch: uprev from 2.13 to 2.15
Message-ID: <20210312034947.GA12488@gmail.com>
References: <20210311085050.8132-1-qiang.zhang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20210311085050.8132-1-qiang.zhang@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization] [PATCH] openvswitch: uprev from 2.13 to 2.15
on 11/03/2021 qiang.zhang@windriver.com wrote:

> From: Zqiang <qiang.zhang@windriver.com>
> 
> - OVSDB:
>      * Changed format in which ovsdb transactions are stored in database files.
>        Now each transaction contains diff of data instead of the whole new
>        value of a column.
>        New ovsdb-server process will be able to read old database format, but
>        old processes will *fail* to read database created by the new one.
>        For cluster and active-backup service models follow upgrade instructions
>        in 'Upgrading from version 2.14 and earlier to 2.15 and later' section
>        of ovsdb(7).
>      * New unixctl command 'ovsdb-server/get-db-storage-status' to show the
>        status of the storage that's backing a database.
>      * New unixctl command 'ovsdb-server/memory-trim-on-compaction on|off'.
>        If turned on, ovsdb-server will try to reclaim all the unused memory
>        after every DB compaction back to OS.  Disabled by default.
>      * Maximum backlog on RAFT connections limited to 500 messages or 4GB.
>        Once threshold reached, connection is dropped (and re-established).
>        Use the 'cluster/set-backlog-threshold' command to change limits.
> - DPDK:
>      * Removed support for vhost-user dequeue zero-copy.
>      * Add support for DPDK 20.11.
> - Userspace datapath:
>      * Add the 'pmd' option to "ovs-appctl dpctl/dump-flows", which
>        restricts a flow dump to a single PMD thread if set.
>      * New 'options:dpdk-vf-mac' field for DPDK interface of VF ports,
>        that allows configuring the MAC address of a VF representor.
>      * Add generic IP protocol support to conntrack. With this change, all
>        none UDP, TCP, and ICMP traffic will be treated as general L3
>        traffic, i.e. using 3 tupples.
>      * Add parameters 'pmd-auto-lb-load-threshold' and
>        'pmd-auto-lb-improvement-threshold' to configure PMD auto load balance
>         behaviour.
> - The environment variable OVS_UNBOUND_CONF, if set, is now used
>      as the DNS resolver's (unbound) configuration file.
> - Linux datapath:
>      * Support for kernel versions up to 5.8.x.
> - Terminology:
>      * The terms "master" and "slave" have been replaced by "primary" and
>        "secondary", respectively, for OpenFlow connection roles.
>      * The term "slave" has been replaced by "member", for bonds, LACP, and
>        OpenFlow bundle actions.
> - Support for GitHub Actions based continuous integration builds has been
>      added.
> - Bareudp Tunnel
>      * Bareudp device support is present in linux kernel from version 5.7
>      * Kernel bareudp device is not backported to ovs tree.
>      * Userspace datapath support is not added
> - ovs-dpctl and 'ovs-appctl dpctl/':
>      * New commands '{add,mod,del}-flows' where added, which allow adding,
>        deleting, or modifying flows based on information read from a file.
> - IPsec:
>      * Add option '--no-cleanup' to allow ovs-monitor-ipsec to stop without
>        tearing down IPsec tunnels.
>      * Add option '--no-restart-ike-daemon' to allow ovs-monitor-ipsec to start
>        without restarting ipsec daemon.
> - Building the Linux kernel module from the OVS source tree is deprecated
>      * Support for the Linux kernel is capped at version 5.8
>      * Only bug fixes for the Linux OOT kernel module will be accepted.
>      * The Linux kernel module will be fully removed from the OVS source tree
>        in OVS branch 2.18
> 
> fix some do_patch error about local patch.

This didn't apply cleanly to my tree, but I resolved the conflicts
and everything passed my local testing.

So this is now merged.

Bruce

> 
> Signed-off-by: Zqiang <qiang.zhang@windriver.com>
> ---
>  ...tead-of-var-run-for-in-systemd-units.patch | 16 ++++++----
>  .../systemd-create-runtime-dirs.patch         | 23 +++++++-------
>  .../systemd-update-tool-paths.patch           | 31 ++++++++++---------
>  .../openvswitch/openvswitch_git.bb            |  7 ++---
>  4 files changed, 42 insertions(+), 35 deletions(-)
> 
> diff --git a/recipes-networking/openvswitch/files/0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch b/recipes-networking/openvswitch/files/0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch
> index 244a216d..f7ec3fa0 100644
> --- a/recipes-networking/openvswitch/files/0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch
> +++ b/recipes-networking/openvswitch/files/0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch
> @@ -1,6 +1,6 @@
> -From ea98129777784b0e750a20078f01093dbdbe7b9b Mon Sep 17 00:00:00 2001
> +From ae55fa8168b4b9692ad757c54255a89f935c587e Mon Sep 17 00:00:00 2001
>  From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Tue, 20 Oct 2020 14:14:06 +0800
> +Date: Thu, 11 Mar 2021 11:35:24 +0800
>  Subject: [PATCH] ovs: use /run instead of /var/run for in systemd units
>  
>  Upstream-Status: Pending
> @@ -78,10 +78,10 @@ index f88b57cae..82748bf2d 100644
>   EnvironmentFile=-/etc/sysconfig/openvswitch
>   EnvironmentFile=-/run/openvswitch.useropts
>  diff --git a/rhel/usr_lib_systemd_system_ovsdb-server.service b/rhel/usr_lib_systemd_system_ovsdb-server.service
> -index 69b0bf61a..5f83f281f 100644
> +index 74e5acb7f..39698f238 100644
>  --- a/rhel/usr_lib_systemd_system_ovsdb-server.service
>  +++ b/rhel/usr_lib_systemd_system_ovsdb-server.service
> -@@ -7,12 +7,12 @@ PartOf=openvswitch.service
> +@@ -7,7 +7,7 @@ PartOf=openvswitch.service
>   
>   [Service]
>   Type=forking
> @@ -90,13 +90,17 @@ index 69b0bf61a..5f83f281f 100644
>   Restart=on-failure
>   EnvironmentFile=/etc/openvswitch/default.conf
>   EnvironmentFile=-/etc/sysconfig/openvswitch
> +@@ -17,8 +17,8 @@ EnvironmentFile=-/run/openvswitch.useropts
> + # remove openvswitch.useropts first to reload a fresh
> + # OVS_USER_ID from default.conf or sysconfig.
> + ExecStartPre=/bin/rm -f /run/openvswitch.useropts
>  -ExecStartPre=-/bin/mkdir /var/run/openvswitch /var/log/openvswitch
>  -ExecStartPre=-/bin/chown ${OVS_USER_ID} /var/run/openvswitch /var/log/openvswitch
>  +ExecStartPre=-/bin/mkdir /run/openvswitch /var/log/openvswitch
>  +ExecStartPre=-/bin/chown ${OVS_USER_ID} /run/openvswitch /var/log/openvswitch
> - ExecStartPre=/bin/sh -c 'rm -f /run/openvswitch.useropts; /bin/echo "OVS_USER_ID=${OVS_USER_ID}" > /run/openvswitch.useropts'
> + ExecStartPre=/bin/sh -c '/bin/echo "OVS_USER_ID=${OVS_USER_ID}" > /run/openvswitch.useropts'
>   ExecStartPre=/bin/sh -c 'if [ "$${OVS_USER_ID/:*/}" != "root" ]; then /bin/echo "OVS_USER_OPT=--ovs-user=${OVS_USER_ID}" >> /run/openvswitch.useropts; fi'
> - EnvironmentFile=-/run/openvswitch.useropts
> + ExecStart=/usr/share/openvswitch/scripts/ovs-ctl \
>  -- 
>  2.17.1
>  
> diff --git a/recipes-networking/openvswitch/openvswitch-git/systemd-create-runtime-dirs.patch b/recipes-networking/openvswitch/openvswitch-git/systemd-create-runtime-dirs.patch
> index 0438cf88..12b9e17a 100644
> --- a/recipes-networking/openvswitch/openvswitch-git/systemd-create-runtime-dirs.patch
> +++ b/recipes-networking/openvswitch/openvswitch-git/systemd-create-runtime-dirs.patch
> @@ -1,6 +1,6 @@
> -From 6876e0c155b7f83e1f8545446e2dd69c2b7989f2 Mon Sep 17 00:00:00 2001
> +From fc540d0dee7d1f801c781905735f0f4619aba511 Mon Sep 17 00:00:00 2001
>  From: Mark Asselstine <mark.asselstine@windriver.com>
> -Date: Tue, 4 Sep 2018 15:38:59 -0400
> +Date: Thu, 11 Mar 2021 11:26:58 +0800
>  Subject: [PATCH] systemd: create runtime dirs
>  
>  The recommendation would be to make use of "RuntimeDirectory=" and
> @@ -11,21 +11,22 @@ directories won't exist.
>  
>  Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>  ---
> - rhel/usr_lib_systemd_system_ovsdb-server.service | 1 +
> - 1 file changed, 1 insertion(+)
> + rhel/usr_lib_systemd_system_ovsdb-server.service | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
>  
>  diff --git a/rhel/usr_lib_systemd_system_ovsdb-server.service b/rhel/usr_lib_systemd_system_ovsdb-server.service
> -index aad557f..69b0bf6 100644
> +index 5002ddf10..74e5acb7f 100644
>  --- a/rhel/usr_lib_systemd_system_ovsdb-server.service
>  +++ b/rhel/usr_lib_systemd_system_ovsdb-server.service
> -@@ -11,6 +11,7 @@ PIDFile=/var/run/openvswitch/ovsdb-server.pid
> - Restart=on-failure
> - EnvironmentFile=/etc/openvswitch/default.conf
> - EnvironmentFile=-/etc/sysconfig/openvswitch
> +@@ -17,7 +17,7 @@ EnvironmentFile=-/run/openvswitch.useropts
> + # remove openvswitch.useropts first to reload a fresh
> + # OVS_USER_ID from default.conf or sysconfig.
> + ExecStartPre=/bin/rm -f /run/openvswitch.useropts
> +-
>  +ExecStartPre=-/bin/mkdir /var/run/openvswitch /var/log/openvswitch
>   ExecStartPre=-/bin/chown ${OVS_USER_ID} /var/run/openvswitch /var/log/openvswitch
> - ExecStartPre=/bin/sh -c 'rm -f /run/openvswitch.useropts; /bin/echo "OVS_USER_ID=${OVS_USER_ID}" > /run/openvswitch.useropts'
> + ExecStartPre=/bin/sh -c '/bin/echo "OVS_USER_ID=${OVS_USER_ID}" > /run/openvswitch.useropts'
>   ExecStartPre=/bin/sh -c 'if [ "$${OVS_USER_ID/:*/}" != "root" ]; then /bin/echo "OVS_USER_OPT=--ovs-user=${OVS_USER_ID}" >> /run/openvswitch.useropts; fi'
>  -- 
> -2.7.4
> +2.17.1
>  
> diff --git a/recipes-networking/openvswitch/openvswitch-git/systemd-update-tool-paths.patch b/recipes-networking/openvswitch/openvswitch-git/systemd-update-tool-paths.patch
> index aae44fe7..be6fa5d9 100644
> --- a/recipes-networking/openvswitch/openvswitch-git/systemd-update-tool-paths.patch
> +++ b/recipes-networking/openvswitch/openvswitch-git/systemd-update-tool-paths.patch
> @@ -1,6 +1,6 @@
> -From efd6b8f03ef7278d2477833f84bb8488bd0c346d Mon Sep 17 00:00:00 2001
> +From a79bf6caf915d2a00a52a73033b1c903f2df894f Mon Sep 17 00:00:00 2001
>  From: Mark Asselstine <mark.asselstine@windriver.com>
> -Date: Tue, 29 May 2018 18:57:46 +0000
> +Date: Wed, 10 Mar 2021 11:17:37 +0800
>  Subject: [PATCH 1/2] systemd: update tool paths
>  
>  We are using the rhel files but we install our tools in a slightly
> @@ -9,11 +9,11 @@ different path, update accordingly.
>  Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>  ---
>   rhel/usr_lib_systemd_system_ovs-vswitchd.service.in | 4 ++--
> - rhel/usr_lib_systemd_system_ovsdb-server.service    | 6 +++---
> - 2 files changed, 5 insertions(+), 5 deletions(-)
> + rhel/usr_lib_systemd_system_ovsdb-server.service    | 8 ++++----
> + 2 files changed, 6 insertions(+), 6 deletions(-)
>  
>  diff --git a/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in b/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in
> -index ff43dae..f88b57c 100644
> +index ff43dae96..f88b57cae 100644
>  --- a/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in
>  +++ b/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in
>  @@ -17,8 +17,8 @@ EnvironmentFile=-/etc/sysconfig/openvswitch
> @@ -28,22 +28,25 @@ index ff43dae..f88b57c 100644
>   ExecStart=/usr/share/openvswitch/scripts/ovs-ctl \
>             --no-ovsdb-server --no-monitor --system-id=random \
>  diff --git a/rhel/usr_lib_systemd_system_ovsdb-server.service b/rhel/usr_lib_systemd_system_ovsdb-server.service
> -index 4c170c0..aad557f 100644
> +index 98338b9df..5002ddf10 100644
>  --- a/rhel/usr_lib_systemd_system_ovsdb-server.service
>  +++ b/rhel/usr_lib_systemd_system_ovsdb-server.service
> -@@ -11,9 +11,9 @@ PIDFile=/var/run/openvswitch/ovsdb-server.pid
> - Restart=on-failure
> - EnvironmentFile=/etc/openvswitch/default.conf
> - EnvironmentFile=-/etc/sysconfig/openvswitch
> +@@ -16,11 +16,11 @@ EnvironmentFile=-/run/openvswitch.useropts
> + # Environment is reloaded for each Exec*, make sure to
> + # remove openvswitch.useropts first to reload a fresh
> + # OVS_USER_ID from default.conf or sysconfig.
> +-ExecStartPre=/usr/bin/rm -f /run/openvswitch.useropts
> ++ExecStartPre=/bin/rm -f /run/openvswitch.useropts
> +
>  -ExecStartPre=-/usr/bin/chown ${OVS_USER_ID} /var/run/openvswitch /var/log/openvswitch
> --ExecStartPre=/bin/sh -c 'rm -f /run/openvswitch.useropts; /usr/bin/echo "OVS_USER_ID=${OVS_USER_ID}" > /run/openvswitch.useropts'
> +-ExecStartPre=/bin/sh -c '/usr/bin/echo "OVS_USER_ID=${OVS_USER_ID}" > /run/openvswitch.useropts'
>  -ExecStartPre=/bin/sh -c 'if [ "$${OVS_USER_ID/:*/}" != "root" ]; then /usr/bin/echo "OVS_USER_OPT=--ovs-user=${OVS_USER_ID}" >> /run/openvswitch.useropts; fi'
>  +ExecStartPre=-/bin/chown ${OVS_USER_ID} /var/run/openvswitch /var/log/openvswitch
> -+ExecStartPre=/bin/sh -c 'rm -f /run/openvswitch.useropts; /bin/echo "OVS_USER_ID=${OVS_USER_ID}" > /run/openvswitch.useropts'
> ++ExecStartPre=/bin/sh -c '/bin/echo "OVS_USER_ID=${OVS_USER_ID}" > /run/openvswitch.useropts'
>  +ExecStartPre=/bin/sh -c 'if [ "$${OVS_USER_ID/:*/}" != "root" ]; then /bin/echo "OVS_USER_OPT=--ovs-user=${OVS_USER_ID}" >> /run/openvswitch.useropts; fi'
> - EnvironmentFile=-/run/openvswitch.useropts
>   ExecStart=/usr/share/openvswitch/scripts/ovs-ctl \
>             --no-ovs-vswitchd --no-monitor --system-id=random \
> +           ${OVS_USER_OPT} \
>  -- 
> -2.7.4
> +2.17.1
>  
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index fa1ec4dc..99c4070e 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -14,21 +14,20 @@ RDEPENDS_${PN}-ptest += "\
>  	"
>  
>  S = "${WORKDIR}/git"
> -PV = "2.13+${SRCPV}"
> +PV = "2.15+${SRCPV}"
>  
>  FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
>  
> -SRCREV = "71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3"
> +SRCREV = "8dc1733eaea866dce033b3c44853e1b09bf59fc7"
>  SRC_URI = "file://openvswitch-switch \
>             file://openvswitch-switch-setup \
>             file://openvswitch-testcontroller \
>             file://openvswitch-testcontroller-setup \
> -           git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.13 \
> +           git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.15 \
>             file://openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch \
>             file://run-ptest \
>             file://disable_m4_check.patch \
>             file://kernel_module.patch \
> -           file://python-switch-remaining-scripts-to-use-python3.patch \
>             file://systemd-update-tool-paths.patch \
>             file://systemd-create-runtime-dirs.patch \
>             file://0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch \
> -- 
> 2.29.2
> 
