Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB2C2EEB56E
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 20:08:10 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web11.3454.1694203685249376522
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 08 Sep 2023 13:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Xv6zBZVa;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-792726d3aeeso88304939f.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Sep 2023 13:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694203684; x=1694808484; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAP7bC99JrR4g6UWAy0avIaIwxct54N3qWLJmENz2d8=;
        b=Xv6zBZVa5dWaM9Mit/lEsdMhNGJK5CH4tqY2nLiMFUbcNl9ipgAymrE7/9Hi/EYreb
         qJhGyUAgoWW8pvASAG7n0MwFOCrgMEGfaCKxo5Z9x9HxyLHYvGyPR0OYU5+WSIkZ5cBC
         fwEnG+DKusLGNWMVHpyyQCV+fQ76XA9nqKzAuZyz5dh0U1YAjuMwl3KGQ29l7ZS3KgFe
         faJ7UYQpiINPy3wVE6faLZ7T3HAgQ33+hjWG9k0xexM1PbmYxgmSmrXydbauGeLEKSc/
         acUYXVTSNkOz5K7Zg84AMbJh8av2yRT+OrR8ikOlYfm0f5CbM2UClEVaCCjJxzAUtwxT
         Kq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694203684; x=1694808484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lAP7bC99JrR4g6UWAy0avIaIwxct54N3qWLJmENz2d8=;
        b=rDF6dmta6Buny8cVLyuuiPwcVEuR7QmLWUXwpG4HVDJfl1RB0v/bj/jF+yNz4HYpzx
         U/3k1nKgC7M4WKze8ZaN+ivZeCMS/BCtJI2YkwP3heXv9mhlcPSJlqkv52bACVGMWUOi
         mevJbKqV0rXBi/DVg6PEaL3YBTu86yZ52DbTFG8AYx5HoY/IxdIjf0jo22P/aUmMr3GH
         Tz64dqNHtcLDxwoht4e1S+GYxNK8VAaGjdAbaRLVp0rPDju9hoOYEnnMF7aWNi3cV+Z4
         IrZ/O8CTQ/Ktz/J4LEvXp0Han+16YSprQDm5XE5Gy+54rL8zgLTZuzCMGfnudKja43Nr
         fb0g==
X-Gm-Message-State: AOJu0YwbfCbInr68kJL38BfPvMya04Q5Fv7JxQYXiuVZMr2J7ZFPXI6a
	IMIKbm9Cva/blCs91uvyOLwwv4mRhOflM2+hVJ0A8aPA85w=
X-Google-Smtp-Source: AGHT+IFuf0bB6LMmfMI04a3rhMmzkvKXUE5rOGlwee60NCecwauzK5HhaoJ/0ddje2x99prG9o4PWBDe0n3WyQzRPn4=
X-Received: by 2002:a05:6602:2776:b0:787:822:30f1 with SMTP id
 l22-20020a056602277600b00787082230f1mr3774076ioe.1.1694203684497; Fri, 08 Sep
 2023 13:08:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230908024243.222363-1-leimaohui@fujitsu.com>
In-Reply-To: <20230908024243.222363-1-leimaohui@fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 8 Sep 2023 16:07:53 -0400
Message-ID: <CADkTA4MN+Pqiqd9ffYab98UYj6=o-8a2JrHXOfNKFJL=jV0cmg@mail.gmail.com>
Subject: Re: [meta-virtualization] [meta-cloud-services][PATCH]
 open-iscsi-user: Fix do_package error after usrmerge was enabled.
To: leimaohui <leimaohui@fujitsu.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Sep 2023 20:08:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8290

merged!

Bruce

On Thu, Sep 7, 2023 at 10:42=E2=80=AFPM leimaohui <leimaohui@fujitsu.com> w=
rote:
>
> From: Lei Maohui <leimaohui@fujitsu.com>
>
> ERROR: open-iscsi-user-2.1.7-r1 do_package: QA Issue: open-iscsi-user: Fi=
les/directories were installed but not shipped in any package:
>   /lib
>   /sbin/iscsiuio
>   /sbin/brcm_iscsiuio
>   /lib/systemd
>   /lib/systemd/system-generators
>   /lib/systemd/system
>   /lib/systemd/system-generators/ibft-rule-generator
>   /lib/systemd/system/iscsi-init.service
>   /lib/systemd/system/iscsi.service
>   /lib/systemd/system/iscsid.service
>   /lib/systemd/system/iscsid.socket
>   /lib/systemd/system/iscsiuio.socket
>   /lib/systemd/system/iscsiuio.service
> Please set FILES such that these items are packaged. Alternatively if the=
y are unneeded, avoid installing them or delete them within do_install.
> open-iscsi-user: 13 installed and not shipped files. [installed-vs-shippe=
d]
>
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>  .../open-iscsi/open-iscsi-user_2.1.7.bb                | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-us=
er_2.1.7.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-use=
r_2.1.7.bb
> index 8cedff4..1f84508 100644
> --- a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.=
7.bb
> +++ b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.=
7.bb
> @@ -44,12 +44,6 @@ FILES:${PN} +=3D " \
>      ${systemd_unitdir}/system-generators/ibft-rule-generator \
>  "
>
> -do_install:append() {
> -    rm -rf ${D}${systemd_unitdir}/
> -
> -    install -d ${D}${systemd_unitdir}/system
> -    install -d ${D}${systemd_unitdir}/system-generators
> -    install -m 0644 ${S}/etc/systemd/*.service ${D}${systemd_unitdir}/sy=
stem/
> -    install -m 0644 ${S}/etc/systemd/*.socket ${D}${systemd_unitdir}/sys=
tem/
> -    install -m 0644 ${S}/etc/systemd/ibft-rule-generator ${D}${systemd_u=
nitdir}/system-generators/
> +do_install() {
> +    oe_runmake install DESTDIR=3D${D} prefix=3D${exec_prefix} LIBDIR=3D$=
{libdir} sbindir=3D${sbindir} SBINDIR=3D${sbindir} systemddir=3D${systemd_u=
nitdir}
>  }
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8286): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8286
> Mute This Topic: https://lists.yoctoproject.org/mt/101230101/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

