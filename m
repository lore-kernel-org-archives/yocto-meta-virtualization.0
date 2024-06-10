Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A6EC27C55
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 19:56:13 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.29133.1718049365183970040
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 Jun 2024 12:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bKUK1fG3;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70109d34a16so4512333b3a.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Jun 2024 12:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718049364; x=1718654164; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HIvZTKXSTI8wu+Z5ecIvGgtsHeh5KXAocvhsxS7xq6U=;
        b=bKUK1fG38Oc7OZ72qHsQkDylUZ7x1gD1lZ+J3aWpnpC3M3W44hC9rVQHNQqOy1XhJI
         cgkbVfUQG+Aa4WyQf9TaLSzRhcHbwebrJNoTqs+rVC58Al5VZWbiHbobaweYSEBIMOc8
         ntIoaorvYL0d8nSEEmvChpcG4fiqC7MNvYOsuQlgu973PuKCl2h7xTzoX85Z1uiEaZJL
         uvgtSLmxgnd1QBV7OLEnkopTo7WICR6lJlurLsKMOwYs4+/2j0P7U3yNyBA0CAuzte9q
         0ANr3axB3PVidfY76K3fnSx+7Dh7sf1OByGqwH7ULqMvhr2LdKK+3fwk/ZuG9D5rVCxP
         cGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718049364; x=1718654164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HIvZTKXSTI8wu+Z5ecIvGgtsHeh5KXAocvhsxS7xq6U=;
        b=gzeIT9J3iZFXY8wD20z4JHzE+zUkdNfIu8+6Sei7k1vqcy9A0nYJ3sx/Dr1GDSupLo
         wkuboU1wuOMFpVrqioaVOYUcb6LpEFRPgDGFx06v3hSYqAhH8lo3cN97IB5QDU/Apm1f
         +UVwwZE0TNjrcpsQr3VXUP6GSLBmD+yOGQGoY6Lox6ZpVOzbDtq3Z2SjwR94SIyhetP9
         bsW8q4fnTrlqPr/tYDYawp7zgDCUPzJffxH9Tw6PbUzcQcF4oKEtg47A1AE0xq9fwYRu
         zUFPtNqfzpuFNxUkc2p8yaJ5yL+i1/lMMo2U1SPUe/W+VYS+WL5Kf7vSGvRyDO/vBB2u
         /kZA==
X-Gm-Message-State: AOJu0Ywj5KYckFCH3XcJBAMzoEbClXjo5Lb2A6qpGj+QhjCSX80XV3Zt
	24mQccg9SuPXXEijN/pqdgN30N7QAzS3v+E+JigAZD6OWCAaQltnSW6V0NfgmwyZ+p1aElM7JRG
	UTiUth9FUjPER9HUcRxHjpZErjX8=
X-Google-Smtp-Source: AGHT+IFloeobUxAeRxE2AWSulxHSIaun1bM3RZ6CEmqQDBjKaA/qLN5sjw9kCmZ0jL/0aj7GWCxzq8M609vNJGn3G8k=
X-Received: by 2002:a17:90a:5312:b0:2bd:f4cb:bd87 with SMTP id
 98e67ed59e1d1-2c2bcad5b27mr10383400a91.14.1718049364258; Mon, 10 Jun 2024
 12:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAGi-RUK7ARiAVcS-in3m_E1EjCOzFvPb=k=WYBJZCWQB_fT7UQ@mail.gmail.com>
 <CADkTA4Me4M4qEeyvNWhHQ32m=9iuef4HRCSGTfNmst53KyW7MQ@mail.gmail.com> <CAGi-RUL5ac3U-fh_Q5V2KiwHf8p_0H2zDwCmiMJjj7dCpHRs8w@mail.gmail.com>
In-Reply-To: <CAGi-RUL5ac3U-fh_Q5V2KiwHf8p_0H2zDwCmiMJjj7dCpHRs8w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 10 Jun 2024 15:55:52 -0400
Message-ID: <CADkTA4M6Cu6nXgZxwLzGTGTHGhQyNNpy8EANAZ=ymbdGHESK_w@mail.gmail.com>
Subject: Re: [meta-virtualization] mickledore - packagegroup-kubernetes-node
 pulls k3s instead of k8s
To: Ramon Fried <rfried.dev@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Jun 2024 19:56:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8795

On Mon, Jun 10, 2024 at 12:22=E2=80=AFAM Ramon Fried <rfried.dev@gmail.com>=
 wrote:
>
> On Mon, Jun 10, 2024 at 6:01=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gm=
ail.com> wrote:
> >
> > On Sat, Jun 8, 2024 at 5:15=E2=80=AFPM Ramon Fried via lists.yoctoproje=
ct.org
> > <rfried.dev=3Dgmail.com@lists.yoctoproject.org> wrote:
> > >
> > > Hi.
> > > On mickledore, when directly selecting kubernetes, only k8s is built.
> > > I recently noticed the packagegroup-kubernetes-node and decided to us=
e
> > > that instead of kubernetes.
> > > When Iuse that, we see k3s is also pulled and built.
> > >
> > > I masked the k3s.bb to understand the dependencies and it looks like =
that:
> > >
> > > Missing or unbuildable dependency chain was: ['k3s-server']
> > > NOTE: Runtime target 'packagegroup-k8s-node' is unbuildable, removing=
...
> > > Missing or unbuildable dependency chain was: ['packagegroup-k8s-node'=
,
> > > 'k3s-server']
> > > NOTE: Runtime target 'packagegroup-core-boot' is unbuildable, removin=
g...
> > > Missing or unbuildable dependency chain was:
> > > ['packagegroup-core-boot', 'packagegroup-k8s-node', 'k3s-server']
> > > NOTE: Runtime target 'core-image-minimal' is unbuildable, removing...
> > > Missing or unbuildable dependency chain was: ['core-image-minimal',
> > > 'packagegroup-core-boot', 'packagegroup-k8s-node', 'k3s-server']
> > >
> > > Is it intentional, or is there a problem here ?
> > >
> >
> > It's more the way that packagegroups work.
> >
> > How are you building packagegroup-k8s-node ? is it from your own
> > image (and rdepends) ? or is it from the command line on bitbake
> > (which shouldn't work as it is only rprovided).
> Building the complete image. The packagegroup was added to
> MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS.

As a follow up, are you seeing it built and installed, or just built ?

I'm assuming that it is just being built, and that is due to the nature
of the packagegroups, where everything that might be provided by
the packagegroup is built, but obviously not installed.

Since the packagegrooup has mainly been used for build coverage
testing, with the rprovided packagegroups being used for installation
and runtime testing.

I wouldn't object to splitting the packagegroups up a bit more to
avoid the extra building, but I just haven't had time to get around
to doing it yet.

Bruce


Bruce


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

