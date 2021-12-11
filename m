Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFBA6C433F5
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 15:15:53 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web12.22592.1639235752511176088
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 11 Dec 2021 07:15:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GiLwr7eE;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id t5so38300721edd.0
        for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 11 Dec 2021 07:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zaN2xgk8FsYfyR0H2WEsx5FsooxvBYb0vyEosjxv+Vs=;
        b=GiLwr7eEl182W2arm7gI8oWGChILyJV5G7Em+mjQbE1y/9+0njac8fouIE0I4yHU3H
         +GX+KCWJrnMJPtS2SGgavhyX39lQpBkRjmwmYA3UA2bVNz6+zDdocdORsIhtGO+k3inl
         g6UpMzi/gQmyd2NDA1Y704Bsrg6Lh24Ws5XblfRT3a5BSbYKHdKFQSaRjUDZdSDK+0dw
         NZrJ3LaUVYU548wRYgdArWJw/4B+iGUzA65svrWTQlSk5+GvTGp0jdPtuDKpS80ML0kh
         fSaoOirRA48QuFRz/SJoDnk3ci93nTBx03JOk/46ktP2OtI2/2/UQ/8BoWsfQxOVWzfV
         nqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zaN2xgk8FsYfyR0H2WEsx5FsooxvBYb0vyEosjxv+Vs=;
        b=0XVZsKalavJpCYNw9TV/Q06EmJj5j4TYdJMkRQ5mVsX3FRAR6sUwTOGObdHIeJLob+
         Ple30eIlbSTgKG8fX9nGTmUG1GDyHXlgOj/KuXZREZ7vp2uMGXS39w2V/bqQWfJBaqkU
         yaTnFD07WI0C80DViMVkY/yiz8KWDc3MJhrwZFQOB4sA0NXpF1KsaLSJ9dmTGMlGuFGt
         pgPjhEymDTdtKdi7g/eAPNwZcnGTK299e3kPqQyQrcHz5mvU+i6KijeCXae/1GTRR9DF
         KPPnL1oMKmldgm0SjPhub7CP5H0ZfOU+pnsOpwEsY8WYwMvNcNlUf/DikYt7xpR20GX/
         0l5A==
X-Gm-Message-State: AOAM5306DHc90YyrA5cgPAuySekx6fYklRMu5zJvbn/dwFQOYGDMWtsw
	m4k0vpaxwZZjSki5OH0Ib6r5k3v0pnX2WxiLsig=
X-Google-Smtp-Source: 
 ABdhPJw4ThntbLplHExL81Jh22jfTn2yPO4ZgZ29TWVt2BQnSXIX7dYjaYAh1NcNFaQyt/zX5xpj1ui5hzsk+ra5NQ0=
X-Received: by 2002:aa7:ce1a:: with SMTP id
 d26mr47216701edv.189.1639235750933;
 Sat, 11 Dec 2021 07:15:50 -0800 (PST)
MIME-Version: 1.0
References: <bLBX.1639234591413978357.GvLu@lists.yoctoproject.org>
In-Reply-To: <bLBX.1639234591413978357.GvLu@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 11 Dec 2021 10:15:39 -0500
Message-ID: 
 <CADkTA4N+jBcJ-z8-GucD3HciUdUApkPqh=MTJ38+npg-jTWGDg@mail.gmail.com>
Subject: Re: [meta-virtualization] Failed build because of lxc-2.0.8
To: thitgahamtonghop@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 11 Dec 2021 15:15:53 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/6977

On Sat, Dec 11, 2021 at 9:56 AM <thitgahamtonghop@gmail.com> wrote:
>
> I have successfully build a yocto image with branch rocko.
>
> After that, I have cloned the layer meta-virtualization branch rocko and the build has error as bellow. I have checked the lxc-2.0.8.bb file and it is up-to-date to the rocko branch, what could be the problem? And how can I fix this error?

usermerge wasn't tested with lxc in the rocko release, so it is
installing parts of the package where usermerge is supposed to
overlay/manage things.

But at this point Rocko is way out of support, so you'd need to
reproduce it on a newer release before anyone can really help.

Bruce

>
> ERROR: lxc-2.0.8-r0 do_package_qa: QA Issue: lxc-setup package is not obeying usrmerge distro feature. /lib should be relocated to /usr. [usrmerge]
> ERROR: lxc-2.0.8-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.
> ERROR: lxc-2.0.8-r0 do_package_qa: Function failed: do_package_qa
>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6976): https://lists.yoctoproject.org/g/meta-virtualization/message/6976
> Mute This Topic: https://lists.yoctoproject.org/mt/87659124/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

