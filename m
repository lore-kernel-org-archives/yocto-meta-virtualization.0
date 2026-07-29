Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C0FC54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 21:49:43 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22549.1785361776577129661
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 Jul 2026 14:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XOp0NFAX;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3811f512167so1395811a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Jul 2026 14:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785361776; x=1785966576; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xXbkudGPMsouRu4qnduq4HGjS8GxU1geb+cildi8YQs=;
        b=XOp0NFAX9Dh2TEUNrnsbBIYhYRiq4okejOPOBmTTGJg/MEBrGsNkJTTfk225B6o2vn
         smNVnYCOk8me8TED6Qua+BC/SI8IZNjwWxnR5JwPD1H4u0WG5fBhw7AZ1ZsCk6Pwrb+Y
         twOOq2dSVAoD+m910vgO0b2kSTFdUgrb/3qAVZ5BC4c3MN9jeOhJgM7JPpVKOhCpnitm
         wDyOM1QRqagn4wa1WBEkhOaW/oW6yVc/72R+O+p8dEh25xtMWzgaqDoVv9WYXZwX6ryn
         0D+pC2yVlJ8GHKt5x9/E+m/4au5s7rf+fl3iT0cvf5jauPexwumQHegBt3Pr2O7VaDNn
         0Iog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785361776; x=1785966576;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xXbkudGPMsouRu4qnduq4HGjS8GxU1geb+cildi8YQs=;
        b=LLgA32WE880eyNOFCU9bwGbbrkEUPU2lGoaY2l0H5t8qVseZaUoa7/YFz8xDPkStpF
         dA42hIUm9Tb8+iQv7cTUIU/vS08BFKQAw4zWVWUI0zaCSOS9VmLf9Z4HIjPv/cOj7Mtr
         HuSdHWG/ISAWdGDRp+j27d0UbG7iMv6kcc9dID2rqBgsSKNsJ/+C9hBbmant9j5esiMs
         Fc6cgdwsgkY4xMP5lYVv3lWXie1B6XkacUe0V2dN9CcFq9popFpTL6PSNHD2V+8VoDH6
         rSRgnrp0oXPxei/Mv4izCN25GDR/oBxjhhtfc3n7MEN84o81ti/4rdfz1FTvafsJ+E62
         etCQ==
X-Forwarded-Encrypted: i=1; AHgh+RpzeD2L+oRbD+IcflvXNapQh8RTnhgm0wnaFFgNPMleIYUDAkSRwbRUXEGH3DsGCV29t3dJ0XYxpCIN4T+o9HyKLLXo@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyLkWshw73hZcxHMphPLzLp8KpxSR1/1gYoGa3gwWo9jh4lbvLe
	y5hoQAjKzvHosQOGxL5OB24M5QEA04fCJsHDmyrNDN9auBl01NERPFMZ
X-Gm-Gg: AR+sD12rudv1NQEth9sfjh6EhHhs3y1cXKgKi+INYfltmrLTsHxfRfnSjOIt/UR110A
	Mc1+3D2Q+A2Dm9xv4bLjRpNH3dGsueZPr+oaskJHKmqhH7jrSR4F6f0kj1lp+K5MI5X+PFzMiRc
	XizL6UZwRwZS4SpdewNivBlhFaq/LCrIOz6IAmVwUROQzijF1vNr6Mt6qv2yuL9fD5uFL43PWX9
	bsZtY+z2NvixYsrvlja4Ja82fGSL4y4eaecrxYUO33Nd9z9sYpdnkgz6NyxjP4r/cpnm/xTivMr
	OTjFIqKEw0juA9NQgEcWfuRcADGzZGMs1f3wGX+TvMAmriiZTeqbCG9kys/vAAOyTUOFKlzjfoY
	nbw2RgYY5TMT9dcAA/3P0teCdwLJ6IqKIB8qndD77Lf1vNu1Ut0qTR8UXXdWek7W/kKdDyh4njY
	e1QYX9yZXWHJ5+ZvXRJb2l2P53ajfhPPTdKgfji+Gw8HIgS717bOevENYQDT3yDX1yQHfcYL1wx
	0yx9DfcFWUsMppai3/IicOfwwLQJSCvnau+xArPNCg=
X-Received: by 2002:a17:90b:28cc:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-38f9bd62f12mr7589a91.9.1785361775881;
        Wed, 29 Jul 2026 14:49:35 -0700 (PDT)
Received: from chiron.local (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9b4662dfsm24863a91.6.2026.07.29.14.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 14:49:35 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
Date: Wed, 29 Jul 2026 14:49:33 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: ticotimo@gmail.com, meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH v2 00/13] Container Improvements
Message-ID: <a44c7d6yoras4hwsc2lzajmpevjjbsbwys2szfa5xaxivijcnh@jmgqlg7x4qp6>
References: <cover.1783356922.git.tim.orling@konsulko.com>
 <6a5e8a9d.ec7609bc.1985ef.8845@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a5e8a9d.ec7609bc.1985ef.8845@mx.google.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Jul 2026 21:49:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10018

On Mon, Jul 20, 2026 at 01:52:45PM -0700, Bruce Ashfield wrote:
> Hi Tim,
> 
> Thanks for the substantial rework. Reviewed the whole series against the
> v1 comments, and the two new pieces you factored out (container-volatile-fixup
> and container-dev-mode) look great. Series has been applied on master.
> 
> Here's my summary, just so we can have it archived and use it as a reference
> later if something breaks:
> 
> v1 items — status
> -----------------
> 
> Addressed:
> 
>   * EXTRA_USERS_PARAMS uses += now (was = in v1)
>   * PYEOF single-quoted heredoc has the "bitbake pre-expansion" comment
>   * NONROOT_USER bare-identifier requirement documented
>   * fix_oci_home_perms has the index.json guard + OCI_IMAGE_TAR_OUTPUT
>     gate + bbfatal if the layout ever changes
>   * IMAGE_INSTALL is no longer duplicated against OCI_LAYERS packages
>     across the image recipes (image-oci auto-derivation on master
>     handles it)
>   * rootfs_fixup_var_volatile is factored into
>     container-volatile-fixup.bbclass and app-container-python inherits
>     it (was missing in v1)
>   * container-dev-mode.bbclass cleans up the '-dev' boilerplate that
>     each recipe previously repeated
>   * app-container-valkey's persistence paths (/data, /var/lib/valkey,
>     /var/log/valkey, /run/valkey) are in NONROOT_OWNED_DIRS
>   * The valkey security-caveats item is moot in v2 — the
>     container-entrypoint.sh design supersedes the always-on
>     protected-mode override I had asked to be flagged in DESCRIPTION
> 
> I did notice a few things on the way through, but it was more efficient
> if I just did them myself.

Agreed.

> 
> All three are behavior-neutral cleanups:
> 
> 1. app-container-valkey: drop redundant OCI_IMAGE_RUNTIME_UID
> 
>    The recipe carries a verbatim copy of the same
>      OCI_IMAGE_RUNTIME_UID = "${@bb.utils.contains('PACKAGECONFIG',
>                                 'dev', '0', '${NONROOT_UID}', d)}"
>    line that container-dev-mode.bbclass now supplies. Leftover from v1.
> 
> 2. app-container-mosquitto: fix PACKAGECONFIG 'dev' comment
> 
>    The block above PACKAGECONFIG was copied from app-container-python
>    and mentions python3-pip / site-packages /
>    pn-app-container-python — none of which apply. Rewrote it per-recipe.
>    nginx and curl in the same series already have the correct wording.
> 
> 3. container-nonroot-user.bbclass: document + assert inherit order
> 
>    oci_nonroot_inject_user() is a do_image_oci prefunc that reads
>    OCI_LAYER_*_ROOTFS. Those vars are populated by image-oci's OWN
>    do_image_oci prefunc (oci_multilayer_install_packages), and prefunc
>    execution follows inherit order. If a future recipe inherits
>    container-nonroot-user before image-oci, injection runs against
>    empty per-layer state, no layer ships /etc/passwd, and the only
>    signal is a bb.warn that reviewers can miss. Added a header comment
>    spelling out the requirement + an anonymous-python guard that
>    raises bb.fatal at parse time. All five in-tree consumers already
>    inherit in the right order, so this catches a future mistake rather
>    than fixing a current one.
> 
> Also — the cover letter says "verify '-dev' mode switches from root
> user to mosquitto user", but the recipe doesn't set
> NONROOT_USER = "mosquitto" (unlike nginx which does set it to "nginx").
> So either the cover letter is aspirational or something is happening
> implicitly that I'm missing. Any changes we can do on top of the
> series. I've put it on master-next for visibility.

I addressed this in [1] but let me copy that content here for posterity.

"""
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
"""

> 
> Bruce
> 

[1] https://lore.kernel.org/yocto-meta-virtualization/178309247930.29524.9527654462555578401.b4-reply@b4/

