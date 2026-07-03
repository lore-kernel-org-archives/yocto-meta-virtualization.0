Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6EC4C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 15:28:06 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.94838.1783092482363794914
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 08:28:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EclGWScJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84592b55832so430377b3a.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Jul 2026 08:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783092482; x=1783697282; darn=lists.yoctoproject.org;
        h=message-id:date:references:in-reply-to:cc:to:subject
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sixn3gCuDOexu6M+Nnlgc6RAKM4U1EVTvbIefudOL08=;
        b=EclGWScJWNspoayzF4KHUorXXQgAPYsP0kwf/wJ7Yb7P6vhO7FYrV6AhHbTAoC9yyw
         Be5fLx3yNe+7Qq0oEpF5FApGXLkDTR/KPtcmts7SOChK3KdFlHTORg7scwQw0x28YBWH
         2LDRAyodOyVMQdGmWswppXvvvOgvlssBSRgZs4U10ST16G0coUURYEjO6glkpbrGe2XP
         iVyXX1zkUuDAXHOclMZIK5h1VdiVd/PbNVsL823McXy6QQQKDmWxT5A0kdrEPC80/LKW
         GUWsmefDSYOcK3IpJ+t7WDaXQWZ9cMSUg1h2hnNBNehtkgFBlxIGAvBLN+C3Ep7PWraI
         U4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783092482; x=1783697282;
        h=message-id:date:references:in-reply-to:cc:to:subject
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sixn3gCuDOexu6M+Nnlgc6RAKM4U1EVTvbIefudOL08=;
        b=ay08/u9rqcCzs/8ceEZAsNmbtFto2/oC1f9Z3+NVrtH/bcD9DujdO4mnYpymvHZY0g
         TTXXhVqu1w6lkS1jsvU8X1VW3TLg0yAcqOGBzDhRdx0flI8dWh5x/LOr5vTNegQ6LYAu
         6XU0Wue7yWeMqUCUhiv0f8Dz9hqjs0EmYcJiQq5aQSq7ME+NvlyZ3M/9DkVEvCHRI/17
         5FZKM5iA9VLBljQOZi7eZgy8pqNhACn3SGnCFLwyIKnKBmzjc/YFB7kDdCHIp4bK/lc4
         9SspTCwCw+00vyMPDO1vfiknAtrt8tv/2uSMkSksmSrCoeP1i6JCUXRnOlSBNmN00Tpd
         tP8A==
X-Forwarded-Encrypted: i=1; AHgh+RoKyKCOWzSYm42q2V6rJUx3CgGYXsY6IQxxFqatkdGvmpPVfSV2Z0pYKslUrYSQ3LW/17HfDeO0b0/DeJ16hCRf6JZ4@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yy8+zozM7iPSAYiATkcDnny0IUYjh+XgUJlVOC1VTYGhJ5Fuo3b
	4lkR4RgBQ07Jazo5dtlerd5ihajcFziuTO93RxxoUI8cvN5l/RbKq8yj
X-Gm-Gg: AfdE7ckgnXQ9MNxrQXTsD9C6JY4mbrKAFrMoF0Qs30mK4uwcPadrfj6MXrFOsAtZ13M
	Lj20EoOSBTNndweuoM+j4537V1SlmpkML0ZFfhi3NKihMBS1fWR0KEpwvfR4A+gKQA9EYrRNMEZ
	SrUbtwEln+ql7EOsyejssX52HrNRu8LQnWlfjkgq17C6OZbuvV9vNYoVO1YAMlA/+A9f5B4bQsW
	Y99FR2rIlzIYJv6nvr++tXCm5e4SSIgAiXUU9sETvn1i5s2TSdfKXp3xuDvjaD7zZL2/wwEwzT7
	O6cqRABIxT2stalVRORRfdgZ8Q10Ej+eMTIabxCEh0rJ2rCGZSz79kC0DmI18LoI04qUBt2T+mX
	ixwQVB9JFbToqFOpitOeXbtHxMwG1ZJ+wV3ivevs9ccJa8DX8nhhP6wXJL0h/pzAymGqTKe48zZ
	tgtsJuxO4ZXJYAruIva7oZQFl78OJLKLeUl2oWZdHOnt9AHH2ZLrhT14cD
X-Received: by 2002:a05:6a00:2386:b0:845:344f:ef1a with SMTP id d2e1a72fcca58-847f6dc8cd3mr24667b3a.15.1783092481597;
        Fri, 03 Jul 2026 08:28:01 -0700 (PDT)
Received: from macbookpro.home.local ([69.9.132.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7a935sm4256b3a.47.2026.07.03.08.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:28:00 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [meta-virtualization][PATCH 3/7] recipes-containers/images:
 add app-container-mosquitto
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: ticotimo@gmail.com, meta-virtualization@lists.yoctoproject.org
In-Reply-To: <6a2c4aa7.5059f1c4.36e2b7.af06@mx.google.com>
References: <cover.1780104071.git.tim.orling@konsulko.com>
 <8e68815affff4412c88b8a1139d6f916074bb3d1.1780104071.git.tim.orling@konsulko.com>
 <6a2c4aa7.5059f1c4.36e2b7.af06@mx.google.com>
Date: Fri, 03 Jul 2026 08:27:59 -0700
Message-Id: <178309247930.29524.9527654462555578401.b4-reply@b4>
X-Mailer: b4 0.16-dev
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Jul 2026 15:28:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9919

On 2026-06-12 11:06:31-07:00, Bruce Ashfield wrote:
> Hi Tim,
> 
> A few comments — most are series-level patterns that show up here for
> the first time. I won't repeat them later to not waste our time
> 
> On Fri, May 29, 2026 at 18:31 -0700, Tim Orling wrote:
> 
> > Add OCI container image recipe for the Eclipse Mosquitto MQTT broker.
> > The image uses multi-layer mode with separate base and mosquitto layers,
> > exposes standard MQTT (1883) and WebSocket (9001) ports, and launches
> > mosquitto with its default config file as the entrypoint.
> >
> > Inherit container-nonroot-user to run as 'nonroot' with UID 65532.
> 
> 
> 
> > +OCI_LAYERS = "\
> > +    base:packages:base-files+base-passwd+netbase \
> > +    mosquitto:packages:mosquitto \
> > +"
> 
> [...]
> 
> > +IMAGE_INSTALL = " \
> > +    base-files \
> > +    base-passwd \
> > +    netbase \
> > +    mosquitto \
> > +"
> 
> Same point as 2/7 — image-oci.bbclass now folds packages: layers into
> IMAGE_INSTALL automatically (I pushed to master-next). When you respin,
> this block can go.

Removed redundant IMAGE_INSTALL in v2.

> 
> > +# Workaround /var/volatile for now
> > +ROOTFS_POSTPROCESS_COMMAND += "rootfs_fixup_var_volatile ; "
> > +rootfs_fixup_var_volatile () {
> > +    install -m 1777 -d ${IMAGE_ROOTFS}/${localstatedir}/volatile/tmp
> > +    install -m 755 -d ${IMAGE_ROOTFS}/${localstatedir}/volatile/log
> > +}
> 
> This same function appears in 3/7 (mosquitto), 4/7 (valkey), 5/7
> (nginx), and 7/7 (curl) — four near-identical copies. Worth factoring
> into a small helper bbclass (e.g. container-volatile-fixup.bbclass) that
> each recipe can inherit, or rolling it into container-nonroot-user.bbclass
> since every recipe that uses the fixup also inherits the nonroot class.
> Not blocking — but it's a smell that's easy to silence in v2.

Added container-volatile-fixup.bbclass in v2.

> 
> > +OCI_IMAGE_ENTRYPOINT = "${sbindir}/mosquitto"
> > +OCI_IMAGE_ENTRYPOINT_ARGS = "-c '${sysconfdir}/mosquitto/mosquitto.conf'"
> 
> Two questions about running mosquitto as our nonroot (uid 65532):
> 
> 1. The mosquitto package usually creates a 'mosquitto' system user
>    (low uid, varies by build) and ships a default config that
>    references paths under /var/lib/mosquitto/ and /var/log/mosquitto/
>    owned by that user. As nonroot we won't be the package's expected
>    user. Does mosquitto -c on the stock config actually start cleanly
>    for you, or did you need to tweak the conf?
> 
>    I assume it runs fie, since you've been testing it for a while

It turns out that in v1 we were not really running as the 'nonroot' user,
because of image-oci and container-nonroot-user both setting OCI_IMAGE_RUNTIME_UID
with ?= (which means the order of inheritance influenced the behavior). Part of
v2 changes image-oci to OCI_IMAGE_RUNTIME_UID ??= so container-nonroot-user can
'override' it (while still being a 'soft' ?= assignment).

It runs fine in both 'production' (default) and '-dev' flavors.

$ docker run --rm -it registry.yocto.io/library/mosquitto:2

1783090865: Info: running mosquitto as user: nonroot.
1783090865: mosquitto version 2.1.2 starting
1783090865: Config loaded from /etc/mosquitto/mosquitto.conf.
1783090865: Bridge support available.
1783090865: Persistence support available.
1783090865: TLS support available.
1783090865: TLS-PSK support available.
1783090865: Websockets support available.
1783090865: Starting in local only mode. Connections will only be possible from clients running on this machine.
1783090865: Create a configuration file which defines a listener to allow remote access.
1783090865: For more details see https://mosquitto.org/documentation/authentication-methods/
1783090865: Opening ipv4 listen socket on port 1883.
1783090865: Opening ipv6 listen socket on port 1883.
1783090865: mosquitto version 2.1.2 running

$ docker run --rm -it registry.yocto.io/library/mosquitto:2-dev

1783090933: Info: running mosquitto as user: mosquitto.
1783090933: mosquitto version 2.1.2 starting
1783090933: Config loaded from /etc/mosquitto/mosquitto.conf.
1783090933: Bridge support available.
1783090933: Persistence support available.
1783090933: TLS support available.
1783090933: TLS-PSK support available.
1783090933: Websockets support available.
1783090933: Starting in local only mode. Connections will only be possible from clients running on this machine.
1783090933: Create a configuration file which defines a listener to allow remote access.
1783090933: For more details see https://mosquitto.org/documentation/authentication-methods/
1783090933: Opening ipv4 listen socket on port 1883.
1783090933: Opening ipv6 listen socket on port 1883.
1783090933: mosquitto version 2.1.2 running

For '-dev' mode, the container starts as 'root' and setuids to 'mosquitto' user.

One of the other things I noticed in testing is that the 'nonroot' UID 65532
was never making it into /etc/passwd, because the base-passwd package is what
was providing /etc/passwd and the useradd/extrausers mechanism installs in
IMAGE_ROOTFS, which was not being brought into the container layers. This has
also been fixed in v2 of container-nonroot-user.bbclass.

The mosquitto.conf that is built by the recipe has all lines commented out.
In practice, end users will almost always want to provide their own mosquitto.conf.
For instance, they will probably want to require a password and access control (ACL).

Many real-world uses on target will probably want a multi-container approach, putting a
reverse proxy like nginx in front of mosquitto or running with docker-compose.

> 
> 2. If persistence is enabled in the stock mosquitto.conf (persistence
>    true; persistence_location /var/lib/mosquitto/), we need a
>    writable /var/lib/mosquitto for our nonroot user — same flavour of
>    gap the rootfs_fixup_var_volatile workaround addresses, just for
>    a different path. If you've already validated that persistence is
>    off in the stock conf (or that mosquitto degrades gracefully when
>    the persistence dir isn't writable), a one-line comment in the
>    recipe explaining the trade-off would save the next person from
>    re-deriving it.

The as-shipped mosquitto.conf has all lines commented out, so persistence is not enabled.

> 
> Bruce



