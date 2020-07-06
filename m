Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web12.1831.1594067364001912840
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jul 2020 13:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r1ys9k0D;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id w34so10015799qte.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2020 13:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oAvTqaNJ/yrWofyVDaDjW2yhOHoWr9/i1hiikC4JcKs=;
        b=r1ys9k0DpkTV6ms1URIV38EjsDXpvUQrDkmcL9vUL33bYMXF+HOfGzbDQyLjJX4ojN
         6TuiLk6jYQM0l9iTKZBlbRVjHN6y6QLMaI6d3Bp/98dWen2fSBsHwkM29zo1p0SJE7Fm
         eoTTGXSThrXhHkG2tTpyiPOiCr91sGVLOttWoEVpSNMTRG1wEZBx3IjGt83JX0Bx04Hs
         9WHVViHS3YOQ6xZS3hsU1Nnd4N4hVeapYVhMKQJWGwvEY8YBLyL/1bnZL+FXTp+LI2/r
         hXsKhBJSAhpA20a3L2K6svVjO59YZ9iV/xktWKYbud/+0vgAdPnznznfbSucUBEfCNMn
         BDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oAvTqaNJ/yrWofyVDaDjW2yhOHoWr9/i1hiikC4JcKs=;
        b=EYWE159nc839c8i0B5D36Fip4LzdU+f6/1hflYpQSUKOfSUxWVXdvw5o6FzAZ595gW
         rDNWuXZJ+XdtGWPQLJnLQ9xIJkuUroR5ZUQKKvKxjvJJwRsmH8gue/P8B7aYs7VNXCId
         n+eCa3AoctqXRFTWVvdBAGz+mX/CqncjdZaa+ae/sFg7FbRacHmE4Z16KdEcSE0EJfss
         Qb66T3IbpEG9s845/DaOdRTyIO2EqqfsnXn1shvS1QDESs0vKhVEBL/cGcbOdvQew9AT
         8GY5asK+BGTasmWS38U/ZvdUDUTOHeiMaeoJGtE/Z3LHRmvUAn9gnaFITPqZTqftg/bd
         xrJg==
X-Gm-Message-State: AOAM533wlP2zKH09IlghjBlJvqGwRbOWrh5OnYvUqxfpeXNf7ILxI17q
	TLXR7Jnz1ku9MfxOj9ZVtFo=
X-Google-Smtp-Source: ABdhPJxWBWEvhCuC4VpFThC1J4c0blWOthbxY1IcK159HM4upCTpq+ve3fGpdLqEeaZw+vUYyPfqPQ==
X-Received: by 2002:aed:25d1:: with SMTP id y17mr50492934qtc.126.1594067362953;
        Mon, 06 Jul 2020 13:29:22 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id f54sm25524259qte.76.2020.07.06.13.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 13:29:22 -0700 (PDT)
Date: Mon, 6 Jul 2020 16:29:20 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: "jason.lau" <Haitao.Liu@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][master][dunfell][PATCH] ceph: fix CVE-2020-10736
Message-ID: <20200706202919.GB49840@gmail.com>
References: <1593768506-99771-1-git-send-email-haitao.liu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1593768506-99771-1-git-send-email-haitao.liu@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged to master and dunfell.x

Bruce

In message: [meta-virtualization][master][dunfell][PATCH] ceph: fix CVE-2020-10736
on 03/07/2020 jason.lau wrote:

> An authorization bypass vulnerability was found in Ceph versions 15.2.0 before 15.2.2,
> where the ceph-mon and ceph-mgr daemons do not properly restrict access, resulting in 
> gaining access to unauthorized resources. This flaw allows an authenticated client to 
> modify the configuration and possibly conduct further attacks.
> 
> Upstream patches:
> 
> [master] https://github.com/ceph/ceph/commit/c7e7009a690621aacd4ac2c70c6469f25d692868
> [v15.2.2] https://github.com/ceph/ceph/commit/f2cf2ce1bd9a86462510a7a12afa4e528b615df2
> 
> 
> CVE: CVE-2020-10736
> 
> Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
> ---
>  ...l-caps-for-pre-octopus-tell-commands.patch | 100 ++++++++++++++++++
>  ...-for-pre-octopus-client-tell-command.patch |  95 +++++++++++++++++
>  ...ReleaseNotes-note-about-security-fix.patch |  31 ++++++
>  recipes-extended/ceph/ceph_15.2.0.bb          |   3 +
>  4 files changed, 229 insertions(+)
>  create mode 100644 recipes-extended/ceph/ceph/0001-mgr-require-all-caps-for-pre-octopus-tell-commands.patch
>  create mode 100644 recipes-extended/ceph/ceph/0002-mon-enforce-caps-for-pre-octopus-client-tell-command.patch
>  create mode 100644 recipes-extended/ceph/ceph/0003-PendingReleaseNotes-note-about-security-fix.patch
> 
> diff --git a/recipes-extended/ceph/ceph/0001-mgr-require-all-caps-for-pre-octopus-tell-commands.patch b/recipes-extended/ceph/ceph/0001-mgr-require-all-caps-for-pre-octopus-tell-commands.patch
> new file mode 100644
> index 0000000..de191bf
> --- /dev/null
> +++ b/recipes-extended/ceph/ceph/0001-mgr-require-all-caps-for-pre-octopus-tell-commands.patch
> @@ -0,0 +1,100 @@
> +From de67c1dab5597c91538970421b25f6ec667af492 Mon Sep 17 00:00:00 2001
> +From: Josh Durgin <jdurgin@redhat.com>
> +Date: Mon, 4 May 2020 17:03:35 -0400
> +Subject: [PATCH 1/3] mgr: require all caps for pre-octopus tell commands
> +
> +This matches the requirements for admin socket commands
> +sent via tell elsewhere.
> +
> +Signed-off-by: Josh Durgin <jdurgin@redhat.com>
> +
> +Upstream-status: Backport
> +[https://github.com/ceph/ceph/commit/347003e13167c428187a5450517850f4d85e09ad]
> +
> +Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
> +---
> + src/mgr/DaemonServer.cc | 37 ++++++++++++++++++++++---------------
> + 1 file changed, 22 insertions(+), 15 deletions(-)
> +
> +diff --git a/src/mgr/DaemonServer.cc b/src/mgr/DaemonServer.cc
> +index becd428a..527326e3 100644
> +--- a/src/mgr/DaemonServer.cc
> ++++ b/src/mgr/DaemonServer.cc
> +@@ -808,20 +808,12 @@ public:
> + bool DaemonServer::handle_command(const ref_t<MCommand>& m)
> + {
> +   std::lock_guard l(lock);
> +-  // a blank fsid in MCommand signals a legacy client sending a "mon-mgr" CLI
> +-  // command.
> +-  if (m->fsid != uuid_d()) {
> +-    cct->get_admin_socket()->queue_tell_command(m);
> ++  auto cmdctx = std::make_shared<CommandContext>(m);
> ++  try {
> ++    return _handle_command(cmdctx);
> ++  } catch (const bad_cmd_get& e) {
> ++    cmdctx->reply(-EINVAL, e.what());
> +     return true;
> +-  } else {
> +-    // legacy client; send to CLI processing
> +-    auto cmdctx = std::make_shared<CommandContext>(m);
> +-    try {
> +-      return _handle_command(cmdctx);
> +-    } catch (const bad_cmd_get& e) {
> +-      cmdctx->reply(-EINVAL, e.what());
> +-      return true;
> +-    }
> +   }
> + }
> + 
> +@@ -853,8 +845,12 @@ bool DaemonServer::_handle_command(
> +   std::shared_ptr<CommandContext>& cmdctx)
> + {
> +   MessageRef m;
> ++  bool admin_socket_cmd = false;
> +   if (cmdctx->m_tell) {
> +     m = cmdctx->m_tell;
> ++    // a blank fsid in MCommand signals a legacy client sending a "mon-mgr" CLI
> ++    // command.
> ++    admin_socket_cmd = (cmdctx->m_tell->fsid != uuid_d());
> +   } else {
> +     m = cmdctx->m_mgr;
> +   }
> +@@ -888,7 +884,10 @@ bool DaemonServer::_handle_command(
> + 
> +   dout(10) << "decoded-size=" << cmdctx->cmdmap.size() << " prefix=" << prefix  << dendl;
> + 
> +-  if (prefix == "get_command_descriptions") {
> ++  // this is just for mgr commands - admin socket commands will fall
> ++  // through and use the admin socket version of
> ++  // get_command_descriptions
> ++  if (prefix == "get_command_descriptions" && !admin_socket_cmd) {
> +     dout(10) << "reading commands from python modules" << dendl;
> +     const auto py_commands = py_modules.get_commands();
> + 
> +@@ -925,7 +924,10 @@ bool DaemonServer::_handle_command(
> + 
> +   bool is_allowed = false;
> +   ModuleCommand py_command;
> +-  if (!mgr_cmd) {
> ++  if (admin_socket_cmd) {
> ++    // admin socket commands require all capabilities
> ++    is_allowed = session->caps.is_allow_all();
> ++  } else if (!mgr_cmd) {
> +     // Resolve the command to the name of the module that will
> +     // handle it (if the command exists)
> +     auto py_commands = py_modules.get_py_commands();
> +@@ -958,6 +960,11 @@ bool DaemonServer::_handle_command(
> +     << "entity='" << session->entity_name << "' "
> +     << "cmd=" << cmdctx->cmd << ": dispatch";
> + 
> ++  if (admin_socket_cmd) {
> ++    cct->get_admin_socket()->queue_tell_command(cmdctx->m_tell);
> ++    return true;
> ++  }
> ++
> +   // ----------------
> +   // service map commands
> +   if (prefix == "service dump") {
> +-- 
> +2.25.1
> +
> diff --git a/recipes-extended/ceph/ceph/0002-mon-enforce-caps-for-pre-octopus-client-tell-command.patch b/recipes-extended/ceph/ceph/0002-mon-enforce-caps-for-pre-octopus-client-tell-command.patch
> new file mode 100644
> index 0000000..79f2174
> --- /dev/null
> +++ b/recipes-extended/ceph/ceph/0002-mon-enforce-caps-for-pre-octopus-client-tell-command.patch
> @@ -0,0 +1,95 @@
> +From ddbac9b2779172876ebd2d26b68b04b02350a125 Mon Sep 17 00:00:00 2001
> +From: Josh Durgin <jdurgin@redhat.com>
> +Date: Thu, 23 Apr 2020 00:22:10 -0400
> +Subject: [PATCH 2/3] mon: enforce caps for pre-octopus client tell commands
> +
> +This affects only the commands whitelisted here - in particular
> +injectargs requires write access to the monitors.
> +
> +Signed-off-by: Josh Durgin <jdurgin@redhat.com>
> +
> +Upstream-status: Backport 
> +[https://github.com/ceph/ceph/commit/fc5e56b75a97c4652c87e9959aad1c4dec45010d]
> +
> +Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
> +---
> + src/mon/Monitor.cc | 56 +++++++++++++++++++++++-----------------------
> + 1 file changed, 28 insertions(+), 28 deletions(-)
> +
> +diff --git a/src/mon/Monitor.cc b/src/mon/Monitor.cc
> +index b7cb3eae..eecd2f68 100644
> +--- a/src/mon/Monitor.cc
> ++++ b/src/mon/Monitor.cc
> +@@ -3226,34 +3226,6 @@ void Monitor::handle_command(MonOpRequestRef op)
> +     return;
> +   }
> + 
> +-  // compat kludge for legacy clients trying to tell commands that are
> +-  // new.  see bottom of MonCommands.h.  we need to handle both (1)
> +-  // pre-octopus clients and (2) octopus clients with a mix of pre-octopus
> +-  // and octopus mons.
> +-  if ((!HAVE_FEATURE(m->get_connection()->get_features(), SERVER_OCTOPUS) ||
> +-       monmap->min_mon_release < ceph_release_t::octopus) &&
> +-      (prefix == "injectargs" ||
> +-       prefix == "smart" ||
> +-       prefix == "mon_status" ||
> +-       prefix == "heap")) {
> +-    if (m->get_connection()->get_messenger() == 0) {
> +-      // Prior to octopus, monitors might forward these messages
> +-      // around. that was broken at baseline, and if we try to process
> +-      // this message now, it will assert out when we try to send a
> +-      // message in reply from the asok/tell worker (see
> +-      // AnonConnection).  Just reply with an error.
> +-      dout(5) << __func__ << " failing forwarded command from a (presumably) "
> +-	      << "pre-octopus peer" << dendl;
> +-      reply_command(
> +-	op, -EBUSY,
> +-	"failing forwarded tell command in mixed-version mon cluster", 0);
> +-      return;
> +-    }
> +-    dout(5) << __func__ << " passing command to tell/asok" << dendl;
> +-    cct->get_admin_socket()->queue_tell_command(m);
> +-    return;
> +-  }
> +-
> +   string module;
> +   string err;
> + 
> +@@ -3368,6 +3340,34 @@ void Monitor::handle_command(MonOpRequestRef op)
> +       << "entity='" << session->entity_name << "' "
> +       << "cmd=" << m->cmd << ": dispatch";
> + 
> ++  // compat kludge for legacy clients trying to tell commands that are
> ++  // new.  see bottom of MonCommands.h.  we need to handle both (1)
> ++  // pre-octopus clients and (2) octopus clients with a mix of pre-octopus
> ++  // and octopus mons.
> ++  if ((!HAVE_FEATURE(m->get_connection()->get_features(), SERVER_OCTOPUS) ||
> ++       monmap->min_mon_release < ceph_release_t::octopus) &&
> ++      (prefix == "injectargs" ||
> ++       prefix == "smart" ||
> ++       prefix == "mon_status" ||
> ++       prefix == "heap")) {
> ++    if (m->get_connection()->get_messenger() == 0) {
> ++      // Prior to octopus, monitors might forward these messages
> ++      // around. that was broken at baseline, and if we try to process
> ++      // this message now, it will assert out when we try to send a
> ++      // message in reply from the asok/tell worker (see
> ++      // AnonConnection).  Just reply with an error.
> ++      dout(5) << __func__ << " failing forwarded command from a (presumably) "
> ++	      << "pre-octopus peer" << dendl;
> ++      reply_command(
> ++	op, -EBUSY,
> ++	"failing forwarded tell command in mixed-version mon cluster", 0);
> ++      return;
> ++    }
> ++    dout(5) << __func__ << " passing command to tell/asok" << dendl;
> ++    cct->get_admin_socket()->queue_tell_command(m);
> ++    return;
> ++  }
> ++
> +   if (mon_cmd->is_mgr()) {
> +     const auto& hdr = m->get_header();
> +     uint64_t size = hdr.front_len + hdr.middle_len + hdr.data_len;
> +-- 
> +2.25.1
> +
> diff --git a/recipes-extended/ceph/ceph/0003-PendingReleaseNotes-note-about-security-fix.patch b/recipes-extended/ceph/ceph/0003-PendingReleaseNotes-note-about-security-fix.patch
> new file mode 100644
> index 0000000..ed2a63e
> --- /dev/null
> +++ b/recipes-extended/ceph/ceph/0003-PendingReleaseNotes-note-about-security-fix.patch
> @@ -0,0 +1,31 @@
> +From 56800925651857821034ac9c8ec82d45635cc3b8 Mon Sep 17 00:00:00 2001
> +From: Josh Durgin <jdurgin@redhat.com>
> +Date: Wed, 13 May 2020 21:34:56 -0700
> +Subject: [PATCH 3/3] PendingReleaseNotes: note about security fix
> +
> +Signed-off-by: Josh Durgin <jdurgin@redhat.com>
> +
> +Upstream-status: Backport 
> +[https://github.com/ceph/ceph/commit/06f239fc35f35865d2cf92dda1ac8f4d5fe82bde]
> +
> +Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
> +---
> + PendingReleaseNotes | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/PendingReleaseNotes b/PendingReleaseNotes
> +index c9fd4c79..6e07ce6d 100644
> +--- a/PendingReleaseNotes
> ++++ b/PendingReleaseNotes
> +@@ -1,6 +1,8 @@
> + >=15.0.0
> + --------
> + 
> ++* CVE-2020-10736: Fixes an authorization bypass in monitor and manager daemons
> ++
> + * The RGW "num_rados_handles" has been removed.
> +   * If you were using a value of "num_rados_handles" greater than 1
> +     multiply your current "objecter_inflight_ops" and 
> +-- 
> +2.25.1
> +
> diff --git a/recipes-extended/ceph/ceph_15.2.0.bb b/recipes-extended/ceph/ceph_15.2.0.bb
> index e41aa2f..9423faa 100644
> --- a/recipes-extended/ceph/ceph_15.2.0.bb
> +++ b/recipes-extended/ceph/ceph_15.2.0.bb
> @@ -17,6 +17,9 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
>             file://0001-rgw-reject-unauthenticated-response-header-actions.patch \
>             file://0001-rgw-EPERM-to-ERR_INVALID_REQUEST.patch \
>             file://0001-rgw-reject-control-characters-in-response-header-act.patch \
> +           file://0001-mgr-require-all-caps-for-pre-octopus-tell-commands.patch \ 
> +           file://0002-mon-enforce-caps-for-pre-octopus-client-tell-command.patch \
> +           file://0003-PendingReleaseNotes-note-about-security-fix.patch \
>  "
>  
>  SRC_URI[md5sum] = "1f9af648b4c6d19975aab2583ab99710"
> -- 
> 2.25.1
> 

> 

