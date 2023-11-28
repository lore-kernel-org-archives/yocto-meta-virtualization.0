Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 868E9C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 13:49:46 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web11.33077.1701179383305746826
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Nov 2023 05:49:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IHHMJ3Ya;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-35942cb9ef4so18487295ab.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Nov 2023 05:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701179382; x=1701784182; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvtuheQvnGx2w8proBYPpcp0MAxctAOeY15UypZa6yE=;
        b=IHHMJ3YaiaxYKg0NnBH2DpkMlGF4WDbaf8owY92pnlfky6RbzARX7YdmdWtgTl7IHg
         TntPYj8olM446DQ33nDsWsp86T1dqQOjwgU44a7mRo7Zmt0JcTyKXOWJfub2xTo6gjaQ
         OKJC997Gby5OYU3A7zs0BfizuK04+ucuu7YywF5fdkjC3IuxJSMggwoMeUJ428sDZrcP
         H5BwY8T04kryhzmyOPomnK51zT6EW8qYT3nJ63DH+ABo7W0QKOcFP1IEDKYhvt12WdT3
         IRDpqgUwXcM783wLcxeAvyinAiczUlBlz1DAdfTbVxPAw0Ygi1QeDcl6D6LK8aEkMv1A
         6OOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701179382; x=1701784182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gvtuheQvnGx2w8proBYPpcp0MAxctAOeY15UypZa6yE=;
        b=l6F9y7xn077hSrFaqG8M5qcvRHx9Sa+DEBOZ7DaVe8Sotfj/AUOQo+bPrmxCMbEmVm
         /n62mpyvxbDdTwz0OCpS3a81tNmVwzxEoRumFrb4C/OAzfBelT85a1zPX9DXYrvY5SK4
         ua1PvmBauYCJ2LFq2rzu3/iRZ71JHhmaliOx78IVnp7137Fz6mXCArjPAF7R5wjDYmxv
         HXJ4/CcwEOU7fxMAfiUc8lrFga4+O4j6FMJi79IOkaJ8Qr8I3D1XmC4Yws1PqnUrFlLE
         mtKartPpDW4eYOOAfyRQZtrhVGBy3qlPC0aAE+NgzOWCIOcp5QmeMi0YUS/4vz3pSOna
         wvcg==
X-Gm-Message-State: AOJu0YwCrN1lUyY8m1+SYeWDkHOyR+GPOCAPhex9Bb6uPOYuOlG73SHj
	dnICv1j8Olf16KmgfHU2X4T97M1YcAiqZVwxD0E=
X-Google-Smtp-Source: AGHT+IEqPxqn2evYtyQKB2SrQtqeMZlHxPk6Wv0hl2abYVdcL7TT7CnrxoBoKat0ZcnGNPcy931WJmhg4sdzlwkdV6Q=
X-Received: by 2002:a92:4b11:0:b0:35c:7aa7:8aff with SMTP id
 m17-20020a924b11000000b0035c7aa78affmr12987153ilg.31.1701179382456; Tue, 28
 Nov 2023 05:49:42 -0800 (PST)
MIME-Version: 1.0
References: <20231127103811.319149-1-michal.orzel@amd.com> <CADkTA4P7xjs7Db+_j6NTde3j0gyKS0R5kGYm9O5pPp+Vu54mMA@mail.gmail.com>
 <7f42849e-6ea3-4530-9a73-f1bc1bcc61be@amd.com> <CACMJ4GYJdMYGgQSoTUzD7MLu+U11Xd4H2ccYjpJDg_y64W4HbQ@mail.gmail.com>
 <e4512578-4783-4ea2-943e-4187bda3184b@amd.com> <179BCAB522548B7D.22216@lists.yoctoproject.org>
In-Reply-To: <179BCAB522548B7D.22216@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 28 Nov 2023 08:49:30 -0500
Message-ID: <CADkTA4OhvqXU432-x0J6n2bods+rDorC03fGY4Vjinxnca+UQA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 0/2] xen: follow-up to recent recipes update
To: bruce.ashfield@gmail.com
Cc: Michal.Orzel@amd.com, Christopher Clark <christopher.w.clark@gmail.com>, 
	meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Nov 2023 13:49:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8480

On Tue, Nov 28, 2023 at 7:56=E2=80=AFAM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Tue, Nov 28, 2023 at 3:42=E2=80=AFAM Orzel, Michal via
> lists.yoctoproject.org <Michal.Orzel=3Damd.com@lists.yoctoproject.org>
> wrote:
> >
> > Hello,
> >
> > On 28/11/2023 04:11, Christopher Clark wrote:
> > >
> > >
> > >
> > >
> > >
> > > On Mon, Nov 27, 2023 at 6:08=E2=80=AFAM Michal Orzel <michal.orzel@am=
d.com <mailto:michal.orzel@amd.com>> wrote:
> > >
> > >     Hi Bruce,
> > >
> > >     On 27/11/2023 14:55, Bruce Ashfield wrote:
> > >     >
> > >     >
> > >     > On Mon, Nov 27, 2023 at 5:38=E2=80=AFAM Michal Orzel <michal.or=
zel@amd.com <mailto:michal.orzel@amd.com>> wrote:
> > >     >>
> > >     >> Some follow-up patches after a recent Xen recipes update.
> > >     >>
> > >     >> Open question:
> > >     >> Shouldn't we set 4.18 as a default version?
> > >     >
> > >     > Not yet (and definitely not for nanbield). Perhaps once it has =
been under
> > >     > test for a few weeks. I did the updates to get them some extra =
soak time
> > >     > and make them available in both the upcoming release (nanbield)=
 and
> > >     > master for those that want to use the latest, without making it=
 a default
> > >     > version jump so late in the cycle.
> > >     Ok.
> > >
> > >
> > > Thanks, Bruce.
> > >
> > >
> > >
> > >     >
> > >     > As for the changes in master, the 4.18 version on the _git reci=
pes is
> > >     > intentional, as there's been no 4.19 tag that I can find and I =
don't bump
> > >     > versions until I see that in the repo .. so for now, it is just=
 the +git
> > >     > and +stable that is the difference between the 4.18 and _git ve=
rsions.
> > >     You won't see any 4.19 tag until the next release. The version is=
 advertised in
> > >     the main Makefile [1] and this is what user can see in the system
> > >     (e.g. in the boot log, xl info, xen_version hypercall).
> > >     Bumping the XEN_REL of master recipes
> > >
> > >
> > > I think it could be helpful for the context of this thread to describ=
e them as the "git recipes" rather than using the term "master recipe", bec=
ause the latter unfortunately seems to convey that they are somehow superio=
r to the other, versioned, Xen recipes, when in practice they are not -- th=
ey are deliberately not the default version of Xen that is built since, as =
you note, they are defined:
> > >
> > >
> > >     to reflect the current development version
> > >
> > >
> > > of Xen. ie. The git recipes are present alongside the other recipes t=
hat provide the stable release version(s) of Xen.
> > >
> > > As Michal has noted above, putting 4.19 for XEN_REL into the git reci=
pe does look right from a Xen source tree perspective for that SRCREV, even=
 though there is not a 4.19 Xen release, but the proposed commit message sh=
ould be updated to avoid the term "master recipe".
> > Sounds good to me.
> >
> > @Bruce, may I please ask you to take my patch modifying XEN_REL and do =
s/master/git in title on commit?
> > If not, I will push a v2 of this patch.
>
> Regardless of what I've done in the past, I'm still inclined to hold
> the line on the versioning until at least the first -rc is released.
>

FWIW, I also don't change the version of the linux-yocto-dev kernels
until a valid
-rc1 is released, even though the "version' has moved on from the previous
release.

That being said, until I find a better option to keep the versions reported=
 via
the runtime to match the package version, I can either bump the version or
hold / revert the _git recipe until the first release candidates are out.

I'll go ahead and stage the change with the fixup, even if I don't like the
version management scheme :)

Bruce

> Bruce
>
> >
> > ~Michal
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8479): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8479
> Mute This Topic: https://lists.yoctoproject.org/mt/102826507/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/leave/6=
693017/1050810/978058475/xyzzy [bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

