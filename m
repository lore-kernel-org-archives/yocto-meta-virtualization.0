Return-Path: <mans.zigher@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99ABC433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 07:36:38 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web12.19555.1644219397503462485
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 06 Feb 2022 23:36:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BpkHkWVO;
 spf=pass (domain: gmail.com, ip: 209.85.222.50,
 mailfrom: mans.zigher@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id e17so21296765uad.9
        for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 06 Feb 2022 23:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E6rtJBzwWWG7IoYohVbHrwvelRrPoag5dHKeS+e+fVw=;
        b=BpkHkWVOoF0EoniXkG54/yB3ENzhOt+HBUVY7HLrkUXHOKqBWR6i4hUMk2URxxOt2Q
         7Hc0DuFRwj9/C7WDMwae2Zyf253pNoTcsZzV8nwwXgKXLjdmnofhubh3b81my71ehmwg
         Ib/TZWjz6o/SMOkKWDy3cVstV9ZzIOZImThoAtpFJ/OO67B5aVmEJeYTkQjyaC9jREr/
         nX7NBbmJfWdOzZPpfVd7HyLzzszERtOfTBC1k/d0zClD16aYeAHLglOOsLa/vMm5YdAD
         iK/+BAtwAQYJ/aLSZ40MS4fLX7BSp2fVu6R/zDRzNVthdUPYddjtiQRThTeFoTDZ6CZ3
         euFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E6rtJBzwWWG7IoYohVbHrwvelRrPoag5dHKeS+e+fVw=;
        b=UnBAkiThK8zAVgzsB79fhXT+DkjvmIFdgt/X9VLgNbxZqCwGEDjrHR9ISng9KmAhGb
         gF13OBV/cogDsqlj/UYeg4G9VsKvSzc5qaA2ZHV1MZZOdECn2ky/gGPpZauZgs2PWYwp
         sObv2J6zXU/eCRUlm9+D73/UUi8s07NafyaVmRRQscyhHkyd3FbEit869tquXEhRNNcQ
         bmC6dGZdPxcagasC8nYdQsSsXlXCf9hbJ0YPtdIhx9kW183ehlMncTByNYc8JUC4g7dk
         Hou5JlscKZEJr4R1gfZWstg9Ctgra1JYcdUD4QrFwfJop3Nng1UxFgOqixizKzSXDvKd
         0R1A==
X-Gm-Message-State: AOAM532YoUIKMHQlcwuh3FUOce8RPoAhH7zFBYv53v1/dBmgSS2F6Qq9
	VdplN6BKAn+QkChz6yHILIhwI7sY4ja8hOiZPvs=
X-Google-Smtp-Source: 
 ABdhPJyD7nYKJOgJRao/vahe0vFEla+VCxvHu3wWv2z3wyefqITt8+Zym6CvIWsoDfy9c+6k8aZzz8DFCjeUNkdufJ8=
X-Received: by 2002:a67:d98e:: with SMTP id u14mr4228442vsj.2.1644219396436;
 Sun, 06 Feb 2022 23:36:36 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAEhQi8=RL8Ngx3jH_qaPGQwpJ=vR8LD0D9vaT11-LN4dCcT-OA@mail.gmail.com>
 <CADkTA4PdJ5u7Mwm1sB9pceGXDhZQfm6gpBm5VEr7ggRnqH44+g@mail.gmail.com>
 <CAEhQi8mJcecVMa0xozbsP1DcxV1LwkN25x6GdEgApKMQvW9WNA@mail.gmail.com>
 <7a9d1bd3-730c-e84e-1f49-0860ea34eb95@axis.com> <Yf1GPEF8l+//89/D@korppu>
In-Reply-To: <Yf1GPEF8l+//89/D@korppu>
From: =?UTF-8?B?TcOlbnM=?= <mans.zigher@gmail.com>
Date: Mon, 7 Feb 2022 08:36:25 +0100
Message-ID: 
 <CAEhQi8mviZLsS3jsGTyYVME4RSPctKRya1czPzbhiE+it+i5Ug@mail.gmail.com>
Subject: Re: [meta-virtualization] Docker and GPLv3
To: Mikko Rapeli <mikko.rapeli@bmw.de>
Cc: joakim.roubert@axis.com, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 07 Feb 2022 07:36:38 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7053

Thank you all for your answers

BR

Den fre 4 feb. 2022 kl 16:29 skrev Mikko Rapeli <mikko.rapeli@bmw.de>:
>
> Hi,
>
> On Fri, Feb 04, 2022 at 04:03:52PM +0100, Joakim Roubert wrote:
> > On 2022-02-04 15:30, Mans Zigher wrote:
> > >
> > > with our current understanding our customer cannot comply with GPLv3
> > > so we have to avoid it at all cost.
> >
> > I think this is a situation where
> >
> > https://layers.openembedded.org/layerindex/branch/master/layer/meta-gplv2/
> >
> > might come in handy, together with something like
> >
> > PREFERRED_VERSION_bash ?= "3.2.%"
> >
> > in the local.conf (or similar suitable configuration place).
>
> While this would work, I can't recommend using meta-gplv2 as it contains unmaintained
> SW versions.
>
> Just configure the build to avoid GPLv3 via distro config, e.g.
>
> INCOMPATIBLE_LICENSE_append += " GPLv3 GPLv3+ LGPLv3 LGPLv3+"
>
> and configure SW components to build without GPLv3 dependencies.
> lxc for examples compiles just fine without rsync and bash.
>
> Additionally a lot of GPLv3 recipes can be enabled to build but be forbidden
> images images, e.g. in distro config:
>
> WHITELIST_GPL-3.0 += "bash"
> PACKAGE_EXCLUDE += "bash-ptest bash-dbg bash-staticdev bash-dev bash-doc bash-locale bashbug bash"
>
> Some refactoring of SW architecture may be needed to remove any dependencies to GPLv3
> licensed SW. For development and testing GPLv3 components can often be used.
>
> Cheers,
>
> -Mikko
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7048): https://lists.yoctoproject.org/g/meta-virtualization/message/7048
> Mute This Topic: https://lists.yoctoproject.org/mt/88903092/3617459
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [mans.zigher@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

