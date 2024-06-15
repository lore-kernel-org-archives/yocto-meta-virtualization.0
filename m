Return-Path: <rfried.dev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DABDC27C4F
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 14:14:22 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.13540.1718460861477793558
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 15 Jun 2024 07:14:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eiJwaw+x;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: rfried.dev@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6fd3d9f572fso44567a34.0
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 15 Jun 2024 07:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718460861; x=1719065661; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BwtZvb+ldeVsN5JYxZLVWiya3wIzNGa8T3fSwDz+Kc=;
        b=eiJwaw+xO/2C5OQ0ef1CCGkkyeG+GK5DgIEtaiAtNoJOpwrDw6/PvQXEYh/4mKgRuL
         V/TA2/d67jSbl3E8f67gGGgCql393mwIZ90Uc/GNAkXHaqaXayo5eVPlZ2ST2bhzdeML
         R1NlK8xLiCyFq/7O92LCqc8kYo3D7SS0LGl2nt9JVMTuFfw42dKVnHiUbUMXQ23Kl90v
         DQOLKC8M+UoapXpUJhr/MyuOCfqAliBqXAKFFBCXDfLEtrhQAWL6uK7KhYaeT8vWz070
         te9bOnfuGf+f6gRg2jHN6jMO15LnQd/Vsd6QDtajS8+wfX96XndTUQG5UzePQNCD+TDZ
         FwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718460861; x=1719065661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BwtZvb+ldeVsN5JYxZLVWiya3wIzNGa8T3fSwDz+Kc=;
        b=N9vn0ckPbBUxxvLcAJCKJnp16n9ui15juHTk9kWA6F5KOTa5YudZ72zikQNt7P2X2L
         8nfD9JPmddwXp/zzPEMCqFB5IQWacBwZllPV24EdXIn5nRz3GQw0GOKv9g887u8aCu+m
         bgATn8948qeZqBJgPu80x8c912/00p5z+QqmvIIBxahhSMB5mXR4S0qRyqZWS9iHnO7o
         JnidP3ukbJD8lCY0WXBg7fR03evxO9R66Y/dlsUvodwyIJk8BptkiIgzESmYQ7/IHPSO
         K1vilCDQGOnsE+IWQ9w3ldKObduGci5v/ZZQAvXU56CoXQCfJMUuPEs9Y5YnZnPTLgXE
         bj6A==
X-Gm-Message-State: AOJu0YyM3IXQsXb1Ub5dpntpnNhFX9b3Y4I7kJ2Xv7X/e0MgZFWyQyEm
	HvRsFqWxbXc70sE8OYF7/VBck2m2vLEOz+SIwwzYRH3rrqeByOr2uiy/fENbSQ029X8xVM65M71
	NWn/3ELEBGpvDfffTJhMsLyuwjPI=
X-Google-Smtp-Source: AGHT+IHDbAyhj5DHfFaaQ1UsdWl0ivTb6qzStLlQT1xqmXu9Pj/g/FajfHC3bZO0vLqw+BM46gX/UPKOFDzqhZez0Rc=
X-Received: by 2002:a05:6830:1da2:b0:6f9:6d34:b2b0 with SMTP id
 46e09a7af769-6fb939f1ff6mr6112994a34.27.1718460860274; Sat, 15 Jun 2024
 07:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAGi-RUK7ARiAVcS-in3m_E1EjCOzFvPb=k=WYBJZCWQB_fT7UQ@mail.gmail.com>
 <CADkTA4Me4M4qEeyvNWhHQ32m=9iuef4HRCSGTfNmst53KyW7MQ@mail.gmail.com>
 <CAGi-RUL5ac3U-fh_Q5V2KiwHf8p_0H2zDwCmiMJjj7dCpHRs8w@mail.gmail.com> <CADkTA4M6Cu6nXgZxwLzGTGTHGhQyNNpy8EANAZ=ymbdGHESK_w@mail.gmail.com>
In-Reply-To: <CADkTA4M6Cu6nXgZxwLzGTGTHGhQyNNpy8EANAZ=ymbdGHESK_w@mail.gmail.com>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Sat, 15 Jun 2024 17:14:09 +0300
Message-ID: <CAGi-RU+cbB=B9gXmk8YQ=MF1cGXOwNN_v-oZU0k0eYppPJvq9w@mail.gmail.com>
Subject: Re: [meta-virtualization] mickledore - packagegroup-kubernetes-node
 pulls k3s instead of k8s
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 15 Jun 2024 14:14:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8797

On Mon, Jun 10, 2024 at 10:56=E2=80=AFPM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> On Mon, Jun 10, 2024 at 12:22=E2=80=AFAM Ramon Fried <rfried.dev@gmail.co=
m> wrote:
> >
> > On Mon, Jun 10, 2024 at 6:01=E2=80=AFAM Bruce Ashfield <bruce.ashfield@=
gmail.com> wrote:
> > >
> > > On Sat, Jun 8, 2024 at 5:15=E2=80=AFPM Ramon Fried via lists.yoctopro=
ject.org
> > > <rfried.dev=3Dgmail.com@lists.yoctoproject.org> wrote:
> > > >
> > > > Hi.
> > > > On mickledore, when directly selecting kubernetes, only k8s is buil=
t.
> > > > I recently noticed the packagegroup-kubernetes-node and decided to =
use
> > > > that instead of kubernetes.
> > > > When Iuse that, we see k3s is also pulled and built.
> > > >
> > > > I masked the k3s.bb to understand the dependencies and it looks lik=
e that:
> > > >
> > > > Missing or unbuildable dependency chain was: ['k3s-server']
> > > > NOTE: Runtime target 'packagegroup-k8s-node' is unbuildable, removi=
ng...
> > > > Missing or unbuildable dependency chain was: ['packagegroup-k8s-nod=
e',
> > > > 'k3s-server']
> > > > NOTE: Runtime target 'packagegroup-core-boot' is unbuildable, remov=
ing...
> > > > Missing or unbuildable dependency chain was:
> > > > ['packagegroup-core-boot', 'packagegroup-k8s-node', 'k3s-server']
> > > > NOTE: Runtime target 'core-image-minimal' is unbuildable, removing.=
..
> > > > Missing or unbuildable dependency chain was: ['core-image-minimal',
> > > > 'packagegroup-core-boot', 'packagegroup-k8s-node', 'k3s-server']
> > > >
> > > > Is it intentional, or is there a problem here ?
> > > >
> > >
> > > It's more the way that packagegroups work.
> > >
> > > How are you building packagegroup-k8s-node ? is it from your own
> > > image (and rdepends) ? or is it from the command line on bitbake
> > > (which shouldn't work as it is only rprovided).
> > Building the complete image. The packagegroup was added to
> > MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS.
>
> As a follow up, are you seeing it built and installed, or just built ?
>
> I'm assuming that it is just being built, and that is due to the nature
> of the packagegroups, where everything that might be provided by
> the packagegroup is built, but obviously not installed.
>
> Since the packagegrooup has mainly been used for build coverage
> testing, with the rprovided packagegroups being used for installation
> and runtime testing.
>
> I wouldn't object to splitting the packagegroups up a bit more to
> avoid the extra building, but I just haven't had time to get around
> to doing it yet.
>
> Bruce
OK. understood. So what packages do I need to pick up manually in
order to enable only the kubernetes node ?
I'm selecting "kubernetes" but it seems that it pulls too much also
with selecting "kubernetes"
Thanks,
Ramon.
>
>
> Bruce
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

