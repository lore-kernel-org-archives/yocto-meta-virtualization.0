Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7425C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 19:41:58 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web08.1163.1646941317735318348
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 11:41:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CwWv6rlF;
 spf=pass (domain: gmail.com, ip: 209.85.160.176,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id s15so5534823qtk.10
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 11:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iqtWiJ/LRak6X+YZQOm3S8InjZOY6sNbP9Fzc6lT0Jw=;
        b=CwWv6rlF8DqAjysVjBRa6v4lX43jfcFCISF7eocxQw7ezkZZqGNIPQZyCkq2AqxOMI
         vAmlaP8Z1DXw2d0MmH+yDatFUTqUoVfUpaGNe6U1jhWMvlVB/M47nG1w+mgzJeXaMQA/
         VKZeZBjcyI6d8/2jid6zBfHLzApFHCtGbwPcj0SSjibci21kLOVADyKdzq/nHvq+5Hrn
         lLzG008xeviWUlQClNu6eFjWNUF8y9HvrpHPdj+cb1Fyzc4JYz7STxD8b/FQkV1xAyCB
         YLxMml3bno/8lwmnWqS3QLkXQuRMjC2a4PqsLjRY/MUuvXUzPrmpb60J5O5s+6eP7DE7
         8kFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iqtWiJ/LRak6X+YZQOm3S8InjZOY6sNbP9Fzc6lT0Jw=;
        b=Jk1DTVTyTNGTIL+F8I4LWEHYKZOevz0S75KbTtR8qBAnIbqVWeGJVyHqZoox/J84Sv
         rADeGqWs7cB7b5c8vgp7pAkBUcKJDsIhBD1EuKLttY1sN2MXGeUaYPtePYiJljTCH+SA
         57pPcNPVQCMwsKxTAqi0PTVPruNdFbsBEwHEFTNUWdVBPw0IZuEB3v/BwlZsoR54D+1P
         iSjGdhzA2A+iBK5Dgwd8GZugIhLOGCriqrto2E624WXAtCGIgYZT4G44yKa7vaRgLmF+
         f08CdN78I5pSlv7qjSSgXGe13kcmm2Yq2AD1+nFF54yBwVZdflcb2eWtCEfm2nu5g/Iz
         fj8w==
X-Gm-Message-State: AOAM5322ZOxqbQ4hOnfp1UcCyRvnXhGS+2wi8J5c+K/q1xX4cz2srTmU
	WcMMk27CbpNehzjRtB1F9HwvsQRUMc7RMA==
X-Google-Smtp-Source: 
 ABdhPJzjmeITv5qR0gfTfijHlZ0Ux3suTraSfxcrxoSDjlka0827GyS/vovQR45oaJrBqLk4tNMUjQ==
X-Received: by 2002:a05:622a:134d:b0:2df:e996:8814 with SMTP id
 w13-20020a05622a134d00b002dfe9968814mr5203545qtk.245.1646941316719;
        Thu, 10 Mar 2022 11:41:56 -0800 (PST)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 y11-20020ac85f4b000000b002de4b0a015asm3807110qta.5.2022.03.10.11.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 11:41:56 -0800 (PST)
Date: Thu, 10 Mar 2022 14:41:54 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Joe Slater <joe.slater@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org, randy.macleod@windriver.com
Subject: Re: [meta-virtualization] [meta-virt][PATCH 1/1] libvert: modify
 dependencies on lxc_protocol.h
Message-ID: <20220310194152.GA37392@gmail.com>
References: <20220310170304.4783-1-joe.slater@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310170304.4783-1-joe.slater@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Mar 2022 19:41:58 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7085

s/libvert/libvirt/

In message: [meta-virtualization] [meta-virt][PATCH 1/1] libvert: modify dependencies on lxc_protocol.h
on 10/03/2022 Joe Slater wrote:

> src/remote/meson.build does not create a dependency on
> the generated lxc_protocol.h for remote_daemon.c.  Restructure
> how this file is generated to allow the dependency.

Can you document the configuration (i.e. packageconfigs, etc) that
are causing this ? I'm not seeing the same thing, so something
different is going on.

> 
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../libvirt/libvirt/lxc_protocol.patch        | 104 ++++++++++++++++++
>  recipes-extended/libvirt/libvirt_7.2.0.bb     |   1 +
>  2 files changed, 105 insertions(+)
>  create mode 100644 recipes-extended/libvirt/libvirt/lxc_protocol.patch
> 
> diff --git a/recipes-extended/libvirt/libvirt/lxc_protocol.patch b/recipes-extended/libvirt/libvirt/lxc_protocol.patch
> new file mode 100644
> index 00000000..595c3fe4
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/lxc_protocol.patch
> @@ -0,0 +1,104 @@
> +From 38af66c1a9c4cdeb256eeaf563c6807757c370ce Mon Sep 17 00:00:00 2001
> +From: Joe Slater <joe.slater@windriver.com>
> +Date: Wed, 9 Mar 2022 23:17:33 +0000
> +Subject: [PATCH] working commit
> +
> +remote_daemon.c and others need the generated header lxc_protocol.h,
> +but do not have it as a dependency in meson.build.  This means that
> +builds will randomly (ok, very occasionally) fail.  Restructure how the
> +header is built so that remote_daemon can have it as a dependency.
> +
> +Upstream-Status: Pending

Is there a link to the upstream submission ? That way we can
follow along ?

Bruce

> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +
> +---
> + src/remote/meson.build | 48 ++++++++++++++++++++++++------------------
> + 1 file changed, 28 insertions(+), 20 deletions(-)
> +
> +diff --git a/src/remote/meson.build b/src/remote/meson.build
> +index 0a18826..31a30ee 100644
> +--- a/src/remote/meson.build
> ++++ b/src/remote/meson.build
> +@@ -1,27 +1,11 @@
> +-remote_driver_sources = [
> +-  'remote_driver.c',
> +-  'remote_sockets.c',
> +-]
> +-
> +-remote_driver_generated = []
> ++remote_xxx_generated = []
> + 
> + foreach name : [ 'remote', 'qemu', 'lxc' ]
> +-  client_bodies_h = '@0@_client_bodies.h'.format(name)
> +   protocol_c = '@0@_protocol.c'.format(name)
> +   protocol_h = '@0@_protocol.h'.format(name)
> +   protocol_x = '@0@_protocol.x'.format(name)
> + 
> +-  remote_driver_generated += custom_target(
> +-    client_bodies_h,
> +-    input: protocol_x,
> +-    output: client_bodies_h,
> +-    command: [
> +-      gendispatch_prog, '--mode=client', name, name.to_upper(), '@INPUT@',
> +-    ],
> +-    capture: true,
> +-  )
> +-
> +-  remote_driver_generated += custom_target(
> ++  remote_xxx_generated += custom_target(
> +     protocol_h,
> +     input: protocol_x,
> +     output: protocol_h,
> +@@ -30,7 +14,7 @@ foreach name : [ 'remote', 'qemu', 'lxc' ]
> +     ],
> +   )
> + 
> +-  remote_driver_generated += custom_target(
> ++  remote_xxx_generated += custom_target(
> +     protocol_c,
> +     input: protocol_x,
> +     output: protocol_c,
> +@@ -42,6 +26,30 @@ foreach name : [ 'remote', 'qemu', 'lxc' ]
> +   rpc_probe_files += files(protocol_x)
> + endforeach
> + 
> ++
> ++remote_driver_sources = [
> ++  'remote_driver.c',
> ++  'remote_sockets.c',
> ++]
> ++
> ++remote_driver_generated =remote_xxx_generated
> ++
> ++foreach name : [ 'remote', 'qemu', 'lxc' ]
> ++  client_bodies_h = '@0@_client_bodies.h'.format(name)
> ++  protocol_x = '@0@_protocol.x'.format(name)
> ++
> ++  remote_driver_generated += custom_target(
> ++    client_bodies_h,
> ++    input: protocol_x,
> ++    output: client_bodies_h,
> ++    command: [
> ++      gendispatch_prog, '--mode=client', name, name.to_upper(), '@INPUT@',
> ++    ],
> ++    capture: true,
> ++  )
> ++
> ++endforeach
> ++
> + remote_daemon_sources = files(
> +   'remote_daemon.c',
> +   'remote_daemon_config.c',
> +@@ -49,7 +57,7 @@ remote_daemon_sources = files(
> +   'remote_daemon_stream.c',
> + )
> + 
> +-remote_daemon_generated = []
> ++remote_daemon_generated = remote_xxx_generated
> + 
> + virt_ssh_helper_sources = files(
> +   'remote_sockets.c',
> +-- 
> +2.32.0
> +
> diff --git a/recipes-extended/libvirt/libvirt_7.2.0.bb b/recipes-extended/libvirt/libvirt_7.2.0.bb
> index 5ad7d59e..04c66eb5 100644
> --- a/recipes-extended/libvirt/libvirt_7.2.0.bb
> +++ b/recipes-extended/libvirt/libvirt_7.2.0.bb
> @@ -31,6 +31,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
>             file://0002-meson-Fix-compatibility-with-Meson-0.58.patch \
>             file://0001-security-fix-SELinux-label-generation-logic.patch \
>             file://0001-storage_driver-Unlock-object-on-ACL-fail-in-storageP.patch \
> +           file://lxc_protocol.patch \
>            "
>  
>  SRC_URI[libvirt.md5sum] = "92044b629216e44adce63224970a54a3"
> -- 
> 2.35.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7084): https://lists.yoctoproject.org/g/meta-virtualization/message/7084
> Mute This Topic: https://lists.yoctoproject.org/mt/89691200/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


