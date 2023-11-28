Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44122C07CA9
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 12:56:06 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web10.31796.1701176163417365212
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Nov 2023 04:56:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PFZ/Whpu;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7b3b78e6729so53487139f.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Nov 2023 04:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701176162; x=1701780962; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrUdtBu4fYoHzdKKWItb/4VmK6WnY1reGvfWD97lINA=;
        b=PFZ/Whpuiyr+jEZSmoR8vrVYLXKLZingxkUwRHC6k+2ncbjcWg33BqrHiDMrbYT0aB
         v6r4oTxB606Pp7CHjYzYYMi4YIix8qB3Ada8ckzpsG5GVVgIrJptGZzP5utXO9XewZJP
         X2PdjmnDymxYOEXBU4ira379+rfkULiaVrtwMZJpte3RQb/WVfQGdw4dMHU0QNmCeaOC
         o91jrCoFt5K37IUtmAQMr3KcUVqyTRH+AvY3HI8HVbq1lbUqzMGqa2eVPk4Sk0Qh2a/s
         MlBYTpAlV1so+1rLbJSqSQtoJR9IainEUoCNyYZ6vP+b8euT1zKx0IjP6ReTR8OAZJMt
         yzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701176162; x=1701780962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TrUdtBu4fYoHzdKKWItb/4VmK6WnY1reGvfWD97lINA=;
        b=LhnxGCpB95Lbyo257eSZlUILdavSLWd37EQywVb2njVwlAGMnhNLVMvUOv4N05ob9A
         r1JBCszWx3TXjP50ZN/Xv+7EvT2AzjjjYDfzJ8pkKv2ys+JUHrr1rPYsOixMoKA7COil
         YufA/KrwLsuYrROfOmmzkxgalarQHZ1BOdEGDpv4F7rFOmPb3BH/O50fckv63Xg0Gxd2
         Sh8RyaA8pzlHk7LNcSpVJ3oa/W9E8rBHLR9uJ0sV5CDycxmz5uZx1KuGWz7a5hvgyl4T
         1wfNax+rJ541QZ6NBZzRgfwpUk2wzPgsudr4uaYYEfPOhTMw3vEEAowZgwq0w1XbWHtY
         EInw==
X-Gm-Message-State: AOJu0YwVs9if2zRLhovxL/U2hcUDd84uB5Emud69LH2qHpt/MZsiqD5B
	eLYsV1pgRSPwVchSP5k7LcvbxNppE0T2TRvPM3Q=
X-Google-Smtp-Source: AGHT+IH6gO31K/lsexIcN7p2Q8OKW4YR+j5o4GMtnlBpPsvA8soygac7C+w01Dab5h58FWHF1M9ehmqo4+U9YBhadco=
X-Received: by 2002:a5e:8614:0:b0:7b3:84f4:f003 with SMTP id
 z20-20020a5e8614000000b007b384f4f003mr11450152ioj.19.1701176162330; Tue, 28
 Nov 2023 04:56:02 -0800 (PST)
MIME-Version: 1.0
References: <20231127103811.319149-1-michal.orzel@amd.com> <CADkTA4P7xjs7Db+_j6NTde3j0gyKS0R5kGYm9O5pPp+Vu54mMA@mail.gmail.com>
 <7f42849e-6ea3-4530-9a73-f1bc1bcc61be@amd.com> <CACMJ4GYJdMYGgQSoTUzD7MLu+U11Xd4H2ccYjpJDg_y64W4HbQ@mail.gmail.com>
 <e4512578-4783-4ea2-943e-4187bda3184b@amd.com>
In-Reply-To: <e4512578-4783-4ea2-943e-4187bda3184b@amd.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 28 Nov 2023 07:55:50 -0500
Message-ID: <CADkTA4MymaYA4V_dLcJWRK+gS_6yOHVPiGvzU43X=-uiVhghTw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 0/2] xen: follow-up to recent recipes update
To: Michal.Orzel@amd.com
Cc: Christopher Clark <christopher.w.clark@gmail.com>, 
	meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Nov 2023 12:56:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8479

On Tue, Nov 28, 2023 at 3:42=E2=80=AFAM Orzel, Michal via
lists.yoctoproject.org <Michal.Orzel=3Damd.com@lists.yoctoproject.org>
wrote:
>
> Hello,
>
> On 28/11/2023 04:11, Christopher Clark wrote:
> >
> >
> >
> >
> >
> > On Mon, Nov 27, 2023 at 6:08=E2=80=AFAM Michal Orzel <michal.orzel@amd.=
com <mailto:michal.orzel@amd.com>> wrote:
> >
> >     Hi Bruce,
> >
> >     On 27/11/2023 14:55, Bruce Ashfield wrote:
> >     >
> >     >
> >     > On Mon, Nov 27, 2023 at 5:38=E2=80=AFAM Michal Orzel <michal.orze=
l@amd.com <mailto:michal.orzel@amd.com>> wrote:
> >     >>
> >     >> Some follow-up patches after a recent Xen recipes update.
> >     >>
> >     >> Open question:
> >     >> Shouldn't we set 4.18 as a default version?
> >     >
> >     > Not yet (and definitely not for nanbield). Perhaps once it has be=
en under
> >     > test for a few weeks. I did the updates to get them some extra so=
ak time
> >     > and make them available in both the upcoming release (nanbield) a=
nd
> >     > master for those that want to use the latest, without making it a=
 default
> >     > version jump so late in the cycle.
> >     Ok.
> >
> >
> > Thanks, Bruce.
> >
> >
> >
> >     >
> >     > As for the changes in master, the 4.18 version on the _git recipe=
s is
> >     > intentional, as there's been no 4.19 tag that I can find and I do=
n't bump
> >     > versions until I see that in the repo .. so for now, it is just t=
he +git
> >     > and +stable that is the difference between the 4.18 and _git vers=
ions.
> >     You won't see any 4.19 tag until the next release. The version is a=
dvertised in
> >     the main Makefile [1] and this is what user can see in the system
> >     (e.g. in the boot log, xl info, xen_version hypercall).
> >     Bumping the XEN_REL of master recipes
> >
> >
> > I think it could be helpful for the context of this thread to describe =
them as the "git recipes" rather than using the term "master recipe", becau=
se the latter unfortunately seems to convey that they are somehow superior =
to the other, versioned, Xen recipes, when in practice they are not -- they=
 are deliberately not the default version of Xen that is built since, as yo=
u note, they are defined:
> >
> >
> >     to reflect the current development version
> >
> >
> > of Xen. ie. The git recipes are present alongside the other recipes tha=
t provide the stable release version(s) of Xen.
> >
> > As Michal has noted above, putting 4.19 for XEN_REL into the git recipe=
 does look right from a Xen source tree perspective for that SRCREV, even t=
hough there is not a 4.19 Xen release, but the proposed commit message shou=
ld be updated to avoid the term "master recipe".
> Sounds good to me.
>
> @Bruce, may I please ask you to take my patch modifying XEN_REL and do s/=
master/git in title on commit?
> If not, I will push a v2 of this patch.

Regardless of what I've done in the past, I'm still inclined to hold
the line on the versioning until at least the first -rc is released.

Bruce

>
> ~Michal
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8476): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8476
> Mute This Topic: https://lists.yoctoproject.org/mt/102826507/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

