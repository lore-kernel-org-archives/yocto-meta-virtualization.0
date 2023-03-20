Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E8CAC6FD1D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 12:54:14 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.12974.1679316847671134736
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Mar 2023 05:54:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nImMVawN;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id t129so5339011iof.12;
        Mon, 20 Mar 2023 05:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679316847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DhTqi9w7G4MZuOhaAwq0Rsh2AbMFh4gQ+oOBUhj8xHY=;
        b=nImMVawNN1KW37rQslkmkaxmqTAznzWZwy62Gful3onBS76JXQYl/kj9MQ/fLtRjzF
         L7NRzuXtCpTdqMiy8u5jx/ixKPdChkbu2wUBF+ys+IkRpJ7MTXO7OVgB6f1jsTKIb3wD
         czrD5jhZNrga1BcbZM8XiEHDrf1//P2szf9Q1aN37tbucmEoSct1BN1HOVju6kOOBvN6
         7nO9aobccdKgDvkqO5E4QODT3If4TzD+HwpToefCiRNbpbzlcRXwLqxxpG+nbz5nk1m9
         czSIJE2tHewGdpqLPWSrfU285HkvnFdL+5B1AGeENU025A6P+08njzIbdrsS4A61gRnI
         aDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679316847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DhTqi9w7G4MZuOhaAwq0Rsh2AbMFh4gQ+oOBUhj8xHY=;
        b=SwRdsrxVPLOvYe8rhCJioITcrrRhUpKp1jj9Y7DpS3rn3nyfOtC1MstRlXTaJLN09m
         TTjbSTh4bUMZTNZOjOjcMFLEStcLkJ2cUNRcoI0Asi62qXznXGBI3rLNpbXYGEFkpYrY
         1rNa+XxL8SPlsVb4fHKEWIcxE9cZ2EJUgcT3ZzEQtAfxZBVq+5SLklZwl1/Bszps7zSz
         qYPq3Ud9fSn+BaXb8C+sdctvZUJTOB6vJcLRvgX/ngpaIAjyyBT6WZXjJ/ysGRwwl8t0
         c8gRaCEUu88nReUF+38fPQ6Tyji+SJ8OXIfduQiEHkWl4bYWg51RNQAtfwOc23WVYeA2
         xM2A==
X-Gm-Message-State: AO0yUKUWWtCLYPOJja8Znr2yGzqKnfyviKMIqCYdQVvbVMHiidX2GECC
	tU8CNp6xIG9HtsHVMEo/wdESVFPr0cY3BzpJJBU=
X-Google-Smtp-Source: AK7set9w9kfMNfYuIoGXYDTeDyS/AQLhRk1zS+2AmJnZ6AmMlpV+I7IJyxHMzPjN/T1d+tizphX5Y73ooHh5ASl1iwY=
X-Received: by 2002:a02:630b:0:b0:406:29c8:2d7c with SMTP id
 j11-20020a02630b000000b0040629c82d7cmr3030625jac.5.1679316846889; Mon, 20 Mar
 2023 05:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230319193935521023ce@mail.local>
In-Reply-To: <20230319193935521023ce@mail.local>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 20 Mar 2023 08:53:56 -0400
Message-ID: <CADkTA4OAbVah3LznUndnLW+WrnWe9uDuoWtxSmXaZ5b7uF1y8Q@mail.gmail.com>
Subject: Re: meta-virt fails check-layer-nightly
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: meta-virtualization@lists.yoctoproject.org, swat@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Mar 2023 12:54:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7949

On Sun, Mar 19, 2023 at 3:39=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hi Bruce,
>
> check-layer-nightly is failing for meta-virt:
>
> ERROR: Nothing RPROVIDES '${VIRTUAL-RUNTIME_container_networking}' (but /=
home/pokybuild/yocto-worker/check-layer-nightly/build/meta-virtualization/r=
ecipes-containers/podman/podman_git.bb RDEPENDS on or otherwise requires it=
)
>

Aha. These recipes need the defaults that are supplied when the
virtualization distro feature is specified.

What is the exact command the nightly check is running ? I can't locate it =
here.

I'll add a skip recipe on the users of those namespaces if
virtualization isn't  enabled and/or set a basic default.

Bruce

>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

