Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C238EDEC53
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 13:46:06 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.12299.1694612763697019624
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Sep 2023 06:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=AB+a+5RB;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-34e25ad38cbso22218095ab.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Sep 2023 06:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694612763; x=1695217563; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbKtdwyj9gvXdOgHrjiHm7ZxuBlvyZp8OrAm9xhoKMk=;
        b=AB+a+5RB93fMA5BRcDQzV4J59FvRk2orj5O6PsTOOnPSc3pXx6xbNKtifu1INQidKv
         +OG0LlJ4wj8NJH9vfd34kwVgOL4t+PiYIro6ptJO2dn24cfTS1rqZoZvhkxlZCmMpBRc
         vnXOitypLTc8EALSdiABME6Yh/7KO6UboMlQQpHAPr+nhNnHVaWhGzdhLBCwu752l5Ck
         ldUOs4TRYrUK3G1jgMmU5CW4fuDXWHFkyNB+gE3YDUFyiUgApDY3OQkbFPvW5SIpn3ke
         JBJuYv8TbAD6mOjHKCWIa31D7Hc16Q5R5hnGTz43tcXTBgk+JwyuJR89bmnvssr44Yd6
         d9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694612763; x=1695217563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SbKtdwyj9gvXdOgHrjiHm7ZxuBlvyZp8OrAm9xhoKMk=;
        b=GprAudLFZZZqNJiDZaVROId318a4vdHIvnwoUE2xtk7Lc6HnbjWPRs++e4ch/UtcxJ
         0+s8t2ramVqkNJto4sWuGaebCzDScTMzTc00F4JuEQBNpXAP4e7G00lsTUJdblToNCiX
         LG67laGpg3nurh7hOpisxTWfGPloGQnlkcr3/gjI6GTbFcA6yHwX3EJli4ntPyilmSID
         Wc0B4VP4QGDfLr1Dnd4+ttkundq5yilhAekqREz/DZAU0TILtfKfyJgYyTddi8os81cd
         BbaXLPVAW1tbyAL1yKGdUwITC2rZddIhDUsTMSUf017A8kNFsL3DMNBSIezg4dc7eRBM
         zxqw==
X-Gm-Message-State: AOJu0Yx4ogFL3oYkUqYBNzdxirpxtqaPzOOercSTUN6ZmTkEEpR2bOfB
	ksK0qhQQyL+S36cAp5d65s5fvtk7HOK0z8QwEXc=
X-Google-Smtp-Source: AGHT+IGpmsJ5FVVwbbOVORRyInCmas31StfTP34w/8+SxhnCYxrWbEF0L93JWdguH4HeQUGEi1l0EeHW/X9ahy0FdoE=
X-Received: by 2002:a05:6e02:1aa7:b0:348:c041:abd7 with SMTP id
 l7-20020a056e021aa700b00348c041abd7mr2913731ilv.13.1694612762757; Wed, 13 Sep
 2023 06:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAAfyv34+oTQaT=9-QGkTdCFSJaC6CS=RB6SF=FQrOUssntoBSA@mail.gmail.com>
 <CAAfyv35VDffm9nLeYP4yb+pvdPBaS0jQ8_1bZ-KaUq28RBBJ1A@mail.gmail.com> <17843A682EC729DC.10919@lists.yoctoproject.org>
In-Reply-To: <17843A682EC729DC.10919@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 13 Sep 2023 09:45:51 -0400
Message-ID: <CADkTA4MFixZWj64GcwB0E+OKkSVySBC8m96+64qLvHcc212P4A@mail.gmail.com>
Subject: Re: [meta-virtualization] nerdctl broken in kirkstone
To: bruce.ashfield@gmail.com
Cc: Marek Belisko <marek.belisko@gmail.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Sep 2023 13:46:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8301

On Tue, Sep 12, 2023 at 2:32=E2=80=AFPM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Tue, Sep 12, 2023 at 3:26=E2=80=AFAM Marek Belisko <marek.belisko@gmai=
l.com> wrote:
> >
> > Hi,
> >
> > Forwarding in proper mailing list.
> >
> > I'm trying to add nerdctl to an image using kirkstone release for meta-=
virtualization.
> > I've added bbappend with following fix:
> >
> > SRC_URI =3D "git://github.com/containerd/nerdctl.git;name=3Dnerdcli;bra=
nch=3Dmain;protocol=3Dhttps"
> >
> > (branch name in original recipe is master but main is required)
>
> Right, we have a fix in new release for that:
>
> commit cb5dfda6f6d862a575f029ee8ded0bc3db6bc766
> Author: Guenther Meyer <g.meyer@signum-media.de>
> Date:   Fri Nov 18 11:55:46 2022 +0100
>
>     nerdctl: renamed upstream branch master to main
>
>     Signed-off-by: Guenther Meyer <g.meyer@signum-media.de>
>     Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> diff --git a/recipes-containers/nerdctl/nerdctl_git.bb
> b/recipes-containers/nerdctl/nerdctl_git.bb
> index 4a749b2..8fe5e7d 100644
> --- a/recipes-containers/nerdctl/nerdctl_git.bb
> +++ b/recipes-containers/nerdctl/nerdctl_git.bb
> @@ -13,7 +13,7 @@ DEPENDS =3D " \
>  SRCREV_FORMAT=3D"nerdcli_cgroups"
>  SRCREV_nerdcli =3D "e084a2df4a8861eb5f0b0d32df0643ef24b81093"
>
> -SRC_URI =3D "git://github.com/containerd/nerdctl.git;name=3Dnerdcli;bran=
ch=3Dmaster;protocol=3Dhttps"
> +SRC_URI =3D "git://github.com/containerd/nerdctl.git;name=3Dnerdcli;bran=
ch=3Dmain;protocol=3Dhttps"
>
>  include src_uri.inc
>
> ---------
>
> it could be cherry-picked to kirkstone, there's just no proactive
> cherry picking that
> is done, and I typically wait for someone with a real issue on the branch=
 to ask
> for it.
>
> I can take this email as that request.
>
> >
> > but then anyways it fails with:
> >
> > rsync: [sender] change_dir "/data/projects/test/build/tmp/work/cortexa5=
3-crypto-poky-linux/nerdctl/v0.18.0-r0/nerdctl-v0.18.0/src/import/vendor.fe=
tch/github.com/Masterminds/semver/v3" failed: No such file or directory (2)
> > | rsync error: some files/attrs were not transferred (see previous erro=
rs) (code 23) at main.c(1327) [sender=3D3.2.5]
> >
> > And in ${BP} I cannot see any of those vendor stuff which should be pre=
sent. Is there some fix for that already pending or its known issue?
>
> That would mean that one of the clones in the SRC_URI is now failing,
> usually by something
> that shouldn't have been changed in the upstream repository that was
> change (a branch
> deleted, directories removed, some other repo now clobbering the dir, etc=
).
>
> It worked on release, so it was valid then.
>
> If the hash or branch is bad, bitbake should have thrown an error or warn=
ing.
>
> I just did a manual clone of that repository, and the result looked ok
> for being able to
> copy that directory into a fully constructed vendor/ tree.
>
> We've changed the format of the src_uri and relocation files in newer
> releases and
> there's an improved script on master-next. If pointing that script at
> the same major
> release of nerdctl works, we could update the recipe to the more
> reliable format,
> as the actual nerdctl target executable would be unchanged.
>

I  just pushed two commits to kirkstone that fixed the nerdctl build
in my fresh clone. Both were backports from master.

I didn't see the same issue with the vendor fetches, so I'm not
sure what is happening with your build on that front.

Bruce

> Bruce
>
> >
> > Thanks and BR,
> >
> > marek
> >
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
> View/Reply Online (#8297): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8297
> Mute This Topic: https://lists.yoctoproject.org/mt/101310644/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/leave/6=
693017/1050810/978058475/xyzzy [bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

