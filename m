Return-Path: <mans.zigher@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F183CC433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 14:31:01 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.9615.1643985061446065742
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 06:31:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aj0IJlm1;
 spf=pass (domain: gmail.com, ip: 209.85.167.177,
 mailfrom: mans.zigher@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id m9so8622866oia.12
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 06:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8LbUtnkYmc+YJS+QTEXBmAH7f2cHea9+dpJsAFJAnJs=;
        b=aj0IJlm1zYJRqB4w/JM/lqQCBf/FDa1pG8+9rZZhpi83tk8p4Y8tycN4zuDkx9TymG
         6bp0suuq42Zf5KJYPKl9mctIQAHiPygoA0xDeBxm3VpQKIavDqJqLpadR0dzlAANRa2o
         /DTFcVYc8A4EehowKsNbLqzL0wgymRH0KMp85g595U9RDWXQyIEqafL4M/7+VK8qFb2M
         sJdCgwFWosLBs+HV9bf7K1iVznH1BCOyLRR2gG7KZLbMGdQC5vEwOgQrBcDa+KzxNaiP
         3g4c9OpKRCjP+hgEcRSgTq491oDkdfqeFMx/i1F1fV21T6d6WIM70A6H0kdkl6hx9phi
         K56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8LbUtnkYmc+YJS+QTEXBmAH7f2cHea9+dpJsAFJAnJs=;
        b=d5nevnRaxodmDT5NmM02IFHsxrF1lxEgsrF2L3OCpqVo3fyCkRTnVLiOh6JrOOEmTW
         XTpUDccPP7kW4imo0VOTxsr3S2AX56kXvhWX0f7PlVK3OqmwvT3kho9/6xLL9ETUmEN6
         7dTIAZeBGbzz1KMU0YEDITndapQIqhbn3uPWeq1sNz7M4wrD7bX6Z6ucSSUHwN/N+JEX
         CbPV5jYFeu7DArAUa+i5a0apk0TCeYghHPt6w24zmEUIe+XWoyfmfnD9aTubaMezDkhH
         BxZcv+SxcePq/jL0sUwaaBua76CFK7cD7Ytbo2TvVJMJjAys+4ECFYy7ju3yE9uVe7qs
         1Ifg==
X-Gm-Message-State: AOAM530z5HLmlhYIjq2CYhOkjsYPUsTpe52StoxO/ynb96VPkRMPJoig
	LHUWI/tvP2RIToa93zG2aM6xEy0XtmY1EaV72Gg=
X-Google-Smtp-Source: 
 ABdhPJwviDEY4xwey0ZwMPRcoU3Yalk4yUDRDYvmCyIGnZ7nZNN9d5kOakuJJtr1O0mEpKRfI0SBaAJ7xq4gCvONvxw=
X-Received: by 2002:aca:5e55:: with SMTP id s82mr1341910oib.109.1643985060609;
 Fri, 04 Feb 2022 06:31:00 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAEhQi8=RL8Ngx3jH_qaPGQwpJ=vR8LD0D9vaT11-LN4dCcT-OA@mail.gmail.com>
 <CADkTA4PdJ5u7Mwm1sB9pceGXDhZQfm6gpBm5VEr7ggRnqH44+g@mail.gmail.com>
In-Reply-To: 
 <CADkTA4PdJ5u7Mwm1sB9pceGXDhZQfm6gpBm5VEr7ggRnqH44+g@mail.gmail.com>
From: =?UTF-8?B?TcOlbnM=?= <mans.zigher@gmail.com>
Date: Fri, 4 Feb 2022 15:30:49 +0100
Message-ID: 
 <CAEhQi8mJcecVMa0xozbsP1DcxV1LwkN25x6GdEgApKMQvW9WNA@mail.gmail.com>
Subject: Re: [meta-virtualization] Docker and GPLv3
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Feb 2022 14:31:01 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7045

Hi,

Thanks for your reply. The customer is currently using Thud. You
confirm our current findings so thanks. We are looking into removing
lxc and will then see what else is needed to see if we can skip the
GPLv3 packages. We will look into the GPLv3 license again but with our
current understanding our customer cannot comply with GPLv3 so we have
to avoid it at all cost.

BR
M=C3=A5ns Zigher

Den fre 4 feb. 2022 kl 15:15 skrev Bruce Ashfield <bruce.ashfield@gmail.com=
>:
>
> On Fri, Feb 4, 2022 at 3:53 AM Mans Zigher <mans.zigher@gmail.com> wrote:
> >
> > Hi,
> >
> > A client of mine wants to have docker on it's product and they are
> > having secure boot enabled which prevents us from having any GPLv3
> > licensed code on the target. We have successfully managed to add
> > docker to the target but we noticed that several packages have also
> > been added that is GPLv3
> >
> > bash, gmp, gzip, libidn, libunistring, nettle, rsync, tar, wget
>
> Those shouldn't be coming directly from the docker dependencies, but of
> course packages that it depends on, may pull other dependencies, etc.
>
> What branch are you using ?
>
> If you look at docker.inc in the layer, it has our known dependencies:
>
> DEPENDS =3D " \
>     go-cli \
>     go-pty \
>     go-context \
>     go-mux \
>     go-patricia \
>     go-logrus \
>     go-fsnotify \
>     go-dbus \
>     go-capability \
>     go-systemd \
>     btrfs-tools \
>     sqlite3 \
>     go-distribution \
>     compose-file \
>     go-connections \
>     notary \
>     grpc-go \
>     libtool-native \
>     libtool \
>     "
>
> DEPENDS:append:class-target =3D " lvm2"
> RDEPENDS:${PN} =3D "util-linux util-linux-unshare iptables \
>                   ${@bb.utils.contains('DISTRO_FEATURES', 'aufs',
> 'aufs-util', '', d)} \
>                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> '', 'cgroup-lite', d)} \
>                   bridge-utils \
>                   ca-certificates \
>                  "
> RDEPENDS:${PN} +=3D "virtual-containerd virtual-runc"
>
>
> >
> > 1. Does docker have a strict dependency to GPLv3 code?
>
> There may be ways to avoid some GPLv3 dependencies, but it isn't
> something that we've actively explored or tested. So it would be
> an effort that needs experimentation.
>
> > 2. For some reason that I don't understand, docker seems to pull in
> > LXC which in turn will pull in many of the packages. Is Docker using
> > LXC? I thought docker was replacing LXC doing the same thing as LXC.
> > 3. Do you have any suggestions on how to have container support and
> > not pull in GPLv3 code? Is Docker moby an alternative?
>
> It depends on how you are installing docker to your image. In the latest
> branches, it doesn't have a dependency on lxc. There are some package
> groups and kernel configurations that are shared, but you don't have to
> install using those packagegroups if they are pulling in elements that
> you don't want or need.
>
> Bruce
>
> >
> > BR
> > M=C3=A5ns Zigher
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7040): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/7040
> > Mute This Topic: https://lists.yoctoproject.org/mt/88903092/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub=
 [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

