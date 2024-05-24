Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62AD0C25B7A
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 05:30:28 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.9198.1716528620026655121
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 May 2024 22:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A+N1t9kf;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2bf5e177ebdso372764a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 23 May 2024 22:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716528619; x=1717133419; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncbKp98KOc41nNf4FgVzbe1eo0F/BvQbme9k0sjvavE=;
        b=A+N1t9kfeWGQ6ty0YaBaX2ofOFlr+dOZdfG2e/ctg6zLjdEL3lVmLoT7Mgw+4/L8vO
         gigY821zRk+RIhR5hEzyjKI4eJKlUKFHXEvAcL3Vu5MLSEXohW61Mh9OMsDpC3lqVV9f
         h7crnMAq/lAjIT5GkaTrLFwXgkjGD2jZg/JSu8JsGIs8MD6Hpt2O1FZGBoV14mhY4yJx
         3jPoTjo0eavfgaLsN/7WPUvUF56RLxjQwIgFMyQHljtzzruwJ5N1tEZD6mbx+z/UW9F/
         aCN+yBBkIFNOyq3V/enSk+znj+QckQm4YJgIzf6gkDHcOtriMzmEJUZVU1mu4PQTCsxz
         tSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716528619; x=1717133419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncbKp98KOc41nNf4FgVzbe1eo0F/BvQbme9k0sjvavE=;
        b=l13Ubwgv5TH/sd7BOelUVkHP2wX/rFtncdBTMJkXVKxy5B/cJzres1Tq5ROrpw+CRM
         JWRTpBwdVPXH5u+kRIvgTVSmhGII9pULZ17hu2kyhVCqHa18oGBo8oxHJA12q4SqXreH
         0T/YOffmhMttNavM177adazlQra63NCpX89RFRFJzFsQpCk+uymmcWIol5zIEIVcVkw8
         oQkwg7qi7TcU6FXCtYVtR7drML15bwEr6dd3pJ2SZumfrmY+cqnnqcGK1dsmHZzhrvnM
         GvEvVmKvRgI+cIAxDqYd9uSGxQS+C7VbUzA6pYFkr6ruBxeiDN5JXNqBT9q3HGFSleQo
         aqpg==
X-Forwarded-Encrypted: i=1; AJvYcCX4whoNc9go8mRfVgKt47vkGeWqEHoXEuDw9kE6m/x9liB2SU9uGwqvcMzu8Nq1D0o/I8vjAcx3maE8AhHBQgsmL2uCoyS/paFzuVmzpsEhGncRZ2SomyM5r/E=
X-Gm-Message-State: AOJu0YxXU5ZEbS+zbzB450+7lxwYyjuvdhtyDH5J/fwvXxG3TCiWoYj8
	oWP2SfqTtmojR5yAhiWUiE+AGCtg2sMApt6DuHetScJmYjOONlhPFYPEW0ywYeT301FbeDIKoSk
	FsBZfs5ACpG06IFbKsKBWUfXx2sI=
X-Google-Smtp-Source: AGHT+IHLgopmnivbZxhfjECDcBlUzph3Ggq6qr5TBm7wOYB+cGfvvBcDRIY20sBgIQv+D2K6SupU0Wb9hyFogGGn2AE=
X-Received: by 2002:a17:90a:bc83:b0:2bd:d877:cf7a with SMTP id
 98e67ed59e1d1-2bf5ed202eamr1450119a91.14.1716528619045; Thu, 23 May 2024
 22:30:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAFMvBt2+s5a9BCnkYgmXvL9P83JDgkg5hg41q936JuEXHy568g@mail.gmail.com>
 <CA+chaQdXNXd_B3YiKXnvt0eV-i24hS1g7Jm6zW0buqN9n_3sZQ@mail.gmail.com>
 <CAFMvBt1p7DHLfeiNPA=F5__kkSyW9Z8Ouhkhpg9Kptnt=R-PQA@mail.gmail.com>
 <CA+chaQd=BcD17hyZg5VDCSajtQ56aG=YJeRmGr3s+tsRsRkS9g@mail.gmail.com>
 <CADkTA4P5u3NVBO-3itqOE931ik68caKdR-2kXgdseADr9v=9GQ@mail.gmail.com>
 <CA+chaQc94P6-yfmJRhM4Mi5gK9MVkq3MFGw4Z_Nvns_U78TdAw@mail.gmail.com>
 <CAFMvBt2Rk1BBVWnqJaLmmVtbi2Dpb_cMQvnY6FVjMfbXdhEh6Q@mail.gmail.com> <CA+chaQd+ZSZQxXeSSu=Hcgy81Yd+tb7Ag5NA-e6emR5nyzioeA@mail.gmail.com>
In-Reply-To: <CA+chaQd+ZSZQxXeSSu=Hcgy81Yd+tb7Ag5NA-e6emR5nyzioeA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 24 May 2024 01:30:07 -0400
Message-ID: <CADkTA4OrEvCK=y73KxK0sZwJHj_BNtdN-yJ=txfLeLyHpAQtaw@mail.gmail.com>
Subject: Re: [meta-virtualization] breakages in go recipes
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "Theodore A. Roth" <troth@openavr.org>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 05:30:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8745

Hi all,

I'm back from my travels and have already fixed a bunch of the issues.

I'll push my WIP changes to master-next by end of day Friday, and then
I suggest we jump off those changes.

The ones on master-next are based on what I was doing before I headed
out for vacation.

I'm mainly sorting out some remaining issues on the more complex
recipes (cni, etc) and I'll be good to share the progress.

Bruce

On Thu, May 23, 2024 at 4:10=E2=80=AFPM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> Hi Theodore,
>
> yes, I'm fighting similar issues in our layers today as well.
>
> I've integrated your change and checked that runc builds now.
>
> Here are the public logs for all the meta-virtualzation issues
> http://errors.yoctoproject.org/Errors/Build/184253/
> I'll update the WIP changes with these and send what I have after
> checking at least buildhistory-diff.
>
>
> On Thu, May 23, 2024 at 8:23=E2=80=AFPM Theodore A. Roth <troth@openavr.o=
rg> wrote:
> >
> >
> > On Thu, May 23, 2024 at 2:34=E2=80=AFAM Martin Jansa <martin.jansa@gmai=
l.com> wrote:
> >>
> >> FWIW: My world build with oe-core
> >> master:094273bd7d1768e14fbdcd2f239bee14c630a625 (so before the main
> >> UNPACKDIR changes) finished with these failures from
> >> meta-virtualization:
> >>
> >> ERROR: Task (meta-virtualization/recipes-containers/cri-tools/cri-tool=
s_git.bb:do_patch)
> >> failed with exit code '1'
> >> ERROR: Task (meta-virtualization/recipes-containers/docker-compose/doc=
ker-compose_git.bb:do_populate_lic)
> >> failed with exit code '1'
> >> ERROR: Task (meta-virtualization/recipes-containers/docker/docker-moby=
_git.bb:do_patch)
> >> failed with exit code '1'
> >> ERROR: Task (meta-virtualization/recipes-containers/nerdctl/nerdctl_gi=
t.bb:do_patch)
> >> failed with exit code '1'
> >> ERROR: Task (meta-virtualization/recipes-containers/runc/runc-opencont=
ainers_git.bb:do_patch)
> >> failed with exit code '1'
> >> ERROR: Task (meta-virtualization/recipes-devtools/go/go-md2man_git.bb:=
do_compile)
> >> failed with exit code '1'
> >> ERROR: Task (meta-virtualization/recipes-devtools/go/go-md2man_git.bb:=
do_populate_lic)
> >> failed with exit code '1'
> >> ERROR: Task (meta-virtualization/recipes-devtools/yq/yq_git.bb:do_comp=
ile)
> >> failed with exit code '1'
> >> ERROR: Task (meta-virtualization/recipes-devtools/yq/yq_git.bb:do_popu=
late_lic)
> >> failed with exit code '1'
> >> ERROR: Task (meta-virtualization/recipes-networking/cni/cni_git.bb:do_=
compile)
> >> failed with exit code '1'
> >> ERROR: Task (meta-virtualization/recipes-networking/cni/cni_git.bb:do_=
populate_lic)
> >> failed with exit code '1'
> >> ERROR: Task (meta-virtualization/recipes-networking/netns/netns_git.bb=
:do_patch)
> >> failed with exit code '1'
> >>
> >> the UNPACKDIR changes will probably cause few more issues, I've
> >> already noticed one with linux-yocto_virtualization.inc and added
> >> temporary work around here:
> >> https://github.com/shr-project/meta-virtualization/commits/jansa/maste=
r/
> >>
> >> will send what I have later today as a RFC (as I cannot even build
> >> whole image yet) unless Theodore gets to it sooner.
> >
> >
> > Martin:
> >
> > Spent most of the day fighting with UNPACKDIR breakages outside of meta=
-virtualization.
> > Finally got to the point where I could build your WIP changes. Found so=
me issues with the
> > runc recipes and have pushed fixes here:
> >
> > https://github.com/troth/meta-virtualization/commit/f604f1fb39fad9f4967=
00be59333edcdc3e7a633
> >
> > I'm still waiting for a full build to complete, so I have not completel=
y verified the rest of your changes.
> >
> > Ted Roth



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

