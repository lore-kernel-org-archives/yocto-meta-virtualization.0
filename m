Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5849CC10DC3
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 20:36:24 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.80794.1701722181810569696
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 04 Dec 2023 12:36:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RKspFbTu;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7b060378c47so159144539f.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 04 Dec 2023 12:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701722181; x=1702326981; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNLBgaFYMf/RiVqoLvi5lenfsFcM2OKECcN1PR+Rvnc=;
        b=RKspFbTuZOEjkTHbCHcsrmmuTZYN3Yzyr1kGSh0UvKVIfQrTcvt3WuD4RSWE7wFW3/
         MrkFRx4fvfi1OJvRPDiZ73Fnr/urdmAIOtuOVVA9viQsd/TLqU3chav+Mwr6hgFWeKzJ
         H0vrsj3i9L8UIHccNpGzH3duRPW5hXJ/7myqzAOKkw0XtWS6TkBRO7aLX3gO0Yj0ilF6
         ++IabZH4qmm3QXKcjONrEw0iQfG1AU8Mgs+PTQX7Kx4bIi32+vShFOUGE6K45CgWk9Gk
         vMsOkts4IItiWhk2iu/uzleRM0APb3kKv96ktJIwbA6coBGXcFTTZqFSiSx+SEdBPy/1
         vz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701722181; x=1702326981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNLBgaFYMf/RiVqoLvi5lenfsFcM2OKECcN1PR+Rvnc=;
        b=peUtRiBXAK1idKAkukFjOzkoYfHkd95qF5CX32cSH6Z9pAY1ww6fnRr2uCyLYtNpSM
         fRb3tNKtATLC2GuD/kKQHlqLpKg3g3y/C5zWoy4swvNusZ4qGMPmxfXTixrBQheraNeb
         bRbByWs+dq5wCA2X+vH6s/TaZSjm2ENTryRT+V+JXrHOYv+ancKeN70XTeRDmZkirkbL
         9FWu4Cyd6xLn6zno3kBQpnCiq3QDVZWg5XMUxNH4wHYXYIcVC5GwmmzHbuO8CZRn383g
         5cFf07CBWtU4HriG3phsRxQxQ8MPTTQavBsF1sN7zi3EX3jD86TMhDVEwYyhqG9bx3QR
         uByA==
X-Gm-Message-State: AOJu0YwrOiG95xInf7/2QRnWh9rbB/3L+/mH+04UFea/gE9YmsaUXVm6
	uDE4yMnApuqZgS+I4v1DTjxb+7fCi/rPbxxlhGc=
X-Google-Smtp-Source: AGHT+IH9ECYvMAj6Pa0SMSK4ubK2onsT3nYTvmx/G3cDZlOEidxVnjUO+hAW57q6E2LniC5R8QbJEaeQuF7ylTd6XIg=
X-Received: by 2002:a6b:3116:0:b0:7b3:6791:f2a3 with SMTP id
 j22-20020a6b3116000000b007b36791f2a3mr4749298ioa.20.1701722180666; Mon, 04
 Dec 2023 12:36:20 -0800 (PST)
MIME-Version: 1.0
References: <20231127103811.319149-1-michal.orzel@amd.com> <CADkTA4P7xjs7Db+_j6NTde3j0gyKS0R5kGYm9O5pPp+Vu54mMA@mail.gmail.com>
 <7f42849e-6ea3-4530-9a73-f1bc1bcc61be@amd.com> <CACMJ4GYJdMYGgQSoTUzD7MLu+U11Xd4H2ccYjpJDg_y64W4HbQ@mail.gmail.com>
 <e4512578-4783-4ea2-943e-4187bda3184b@amd.com> <179BCAB522548B7D.22216@lists.yoctoproject.org>
 <CADkTA4OhvqXU432-x0J6n2bods+rDorC03fGY4Vjinxnca+UQA@mail.gmail.com> <CACMJ4GZAXXVpiaAXJZt_z6Ev1bw1AieG2_Qotgtx3RUpVm83Sw@mail.gmail.com>
In-Reply-To: <CACMJ4GZAXXVpiaAXJZt_z6Ev1bw1AieG2_Qotgtx3RUpVm83Sw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 4 Dec 2023 15:36:08 -0500
Message-ID: <CADkTA4PniZvWt_ZFZeDrs1ED+TdHu2DYypgoUVMEJWSJSui1UQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 0/2] xen: follow-up to recent recipes update
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Michal.Orzel@amd.com, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 04 Dec 2023 20:36:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8484

On Tue, Nov 28, 2023 at 12:45=E2=80=AFPM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> On Tue, Nov 28, 2023 at 5:49=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gm=
ail.com> wrote:
>>
>> On Tue, Nov 28, 2023 at 7:56=E2=80=AFAM Bruce Ashfield via
>> lists.yoctoproject.org
>> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>> >
>> > On Tue, Nov 28, 2023 at 3:42=E2=80=AFAM Orzel, Michal via
>> > lists.yoctoproject.org <Michal.Orzel=3Damd.com@lists.yoctoproject.org>
>> > wrote:
>> > >
>> > > On 28/11/2023 04:11, Christopher Clark wrote:
>> > > >
>> > > > On Mon, Nov 27, 2023 at 6:08=E2=80=AFAM Michal Orzel <michal.orzel=
@amd.com <mailto:michal.orzel@amd.com>> wrote:
>> > > >
>> > > >     On 27/11/2023 14:55, Bruce Ashfield wrote:
>> > > >     >
>> > > >     > On Mon, Nov 27, 2023 at 5:38=E2=80=AFAM Michal Orzel <michal=
.orzel@amd.com <mailto:michal.orzel@amd.com>> wrote:
>> > > >     >>
>> > > >     >> Some follow-up patches after a recent Xen recipes update.
>> > > >     >>
>> > > >     >> Open question:
>> > > >     >> Shouldn't we set 4.18 as a default version?
>> > > >     >
>> > > >     > Not yet (and definitely not for nanbield). Perhaps once it h=
as been under
>> > > >     > test for a few weeks. I did the updates to get them some ext=
ra soak time
>> > > >     > and make them available in both the upcoming release (nanbie=
ld) and
>> > > >     > master for those that want to use the latest, without making=
 it a default
>> > > >     > version jump so late in the cycle.
>> > > >     Ok.
>> > > >
>> > > > Thanks, Bruce.
>> > > >
>> > > >     > As for the changes in master, the 4.18 version on the _git r=
ecipes is
>> > > >     > intentional, as there's been no 4.19 tag that I can find and=
 I don't bump
>> > > >     > versions until I see that in the repo .. so for now, it is j=
ust the +git
>> > > >     > and +stable that is the difference between the 4.18 and _git=
 versions.
>> > > >     You won't see any 4.19 tag until the next release. The version=
 is advertised in
>> > > >     the main Makefile [1] and this is what user can see in the sys=
tem
>> > > >     (e.g. in the boot log, xl info, xen_version hypercall).
>> > > >     Bumping the XEN_REL of master recipes
>> > > >
>> > > > I think it could be helpful for the context of this thread to desc=
ribe them as the "git recipes" rather than using the term "master recipe", =
because the latter unfortunately seems to convey that they are somehow supe=
rior to the other, versioned, Xen recipes, when in practice they are not --=
 they are deliberately not the default version of Xen that is built since, =
as you note, they are defined:
>> > > >
>> > > >     to reflect the current development version
>> > > >
>> > > > of Xen. ie. The git recipes are present alongside the other recipe=
s that provide the stable release version(s) of Xen.
>> > > >
>> > > > As Michal has noted above, putting 4.19 for XEN_REL into the git r=
ecipe does look right from a Xen source tree perspective for that SRCREV, e=
ven though there is not a 4.19 Xen release, but the proposed commit message=
 should be updated to avoid the term "master recipe".
>> > > Sounds good to me.
>> > >
>> > > @Bruce, may I please ask you to take my patch modifying XEN_REL and =
do s/master/git in title on commit?
>> > > If not, I will push a v2 of this patch.
>> >
>> > Regardless of what I've done in the past, I'm still inclined to hold
>> > the line on the versioning until at least the first -rc is released.
>> >
>>
>> FWIW, I also don't change the version of the linux-yocto-dev kernels
>> until a valid
>> -rc1 is released, even though the "version' has moved on from the previo=
us
>> release.
>>
>> That being said, until I find a better option to keep the versions repor=
ted via
>> the runtime to match the package version, I can either bump the version =
or
>> hold / revert the _git recipe until the first release candidates are out=
.
>>
>> I'll go ahead and stage the change with the fixup, even if I don't like =
the
>> version management scheme :)
>
>
> Thanks for the extra info, Bruce. So there is still a way to meet your ve=
rsioning scheme and have the runtime version match the package version by c=
hanging the default Xen branch selector in the git recipe via the XEN_BRANC=
H variable to the latest stable branch, thus:
>

After some additional poking around, I do want the recipe to follow master,
since I should be keeping the 4.18 recipes up with the latest tip (I don't
typically wait for releases to bump SRCREVs) of the same branch.

Even though I don't like not having a -rc tag before bumping the version,
there's no way around it in this case.

I've tweaked the message and pushed this to master and nanbield.

Bruce


> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_g=
it.bb
> index 784e71ce..547a7943 100644
> --- a/recipes-extended/xen/xen_git.bb
> +++ b/recipes-extended/xen/xen_git.bb
> @@ -2,7 +2,7 @@
>  SRCREV ?=3D "f96e2f64576cdbb147391c7cb399d393385719a9"
>
>  XEN_REL ?=3D "4.18"
> -XEN_BRANCH ?=3D "master"
> +XEN_BRANCH ?=3D "stable-4.18"
>
>  SRC_URI =3D " \
>      git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
>
> and then anyone building a development version of Xen can update both the=
 XEN_BRANCH and XEN_REL variables to match the revision that they are choos=
ing to build.
> Does that look OK?
>
> Or another option is to use the XEN_REL value to select the default stabl=
e branch to use:
>
> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_g=
it.bb
> index 784e71ce..35e6b859 100644
> --- a/recipes-extended/xen/xen_git.bb
> +++ b/recipes-extended/xen/xen_git.bb
> @@ -2,7 +2,7 @@
>  SRCREV ?=3D "f96e2f64576cdbb147391c7cb399d393385719a9"
>
>  XEN_REL ?=3D "4.18"
> -XEN_BRANCH ?=3D "master"
> +XEN_BRANCH ?=3D "stable-${XEN_REL}"
>
>  SRC_URI =3D " \
>      git://xenbits.xen.org/xen.git;branch=3D${XEN_BRAN
>
> Christopher
>
>
>>
>>
>> Bruce
>>
>> > Bruce
>> >
>> > >
>> > > ~Michal
>> > >
>> > >
>> > >
>> >
>> >
>> > --
>> > - Thou shalt not follow the NULL pointer, for chaos and madness await
>> > thee at its end
>> > - "Use the force Harry" - Gandalf, Star Trek II
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#8479): https://lists.yoctoproject.org/g/meta-virtu=
alization/message/8479
>> > Mute This Topic: https://lists.yoctoproject.org/mt/102826507/1050810
>> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/leav=
e/6693017/1050810/978058475/xyzzy [bruce.ashfield@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

