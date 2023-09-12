Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B31EE3F0C
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 18:33:03 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.2438.1694543578755686719
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Sep 2023 11:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Ajs/xmfg;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-d77ad095f13so5099293276.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Sep 2023 11:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694543578; x=1695148378; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNYeLzEf8LiLsZXgNbV//ydboJ5zxJJ3+LWDl3kBPAo=;
        b=Ajs/xmfgYdYX0XJBr/w8MXSMEWw7co+5yNamcpkXv1l6p/U5i5v/T4QvqIrnUQApaz
         bgvDadr0gS4OXR0Kg/t6KcWa/hglClNdkxfLHnCEaBRo4iBd27tu+PF4rxpYeR7WfaXE
         s9kpD548jP0Dumjyuvx1K3G5SnXe0mB4oQKtxEuR2yjVRxbLOs8L2lqQI7BFzdCHv6Py
         NdNm4qYwxJ+POnpm3jSlfJN5utTEZo9MOFuoH/dzhqTAIQ8g2coMFlvc1j8eVmHlgzLh
         UpYjrTr2B8td4Cfx0IWLmLd+LIwE4glRwwvMYVFQaqzM3S0xQ2SEEAxXszW7Tj9IiSzS
         65Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694543578; x=1695148378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNYeLzEf8LiLsZXgNbV//ydboJ5zxJJ3+LWDl3kBPAo=;
        b=g6wrqfnPAT9eTceI0QIOqGyaSXTzm+5wp1LftFJU+49qstbkG0ei+pkAhJ8qQxsDl8
         59l0uIA3y1asNNrG/+scSt0NZsopTooV6o7tBex4uPtil0JW0n7jxRVgcJpGVGWyvfYl
         Oq8WFGKT4f7q+65Cfctjk8cGsXZgALxl083kIkl8gfB83N2RjfRb7yWjopS+F2Yl2sQU
         YByETiGgQ5S6Wpp94005+4lrW0zLA8lGmIWw93HHaNM/V4gUvaJQExAQnVvOT+kzZLSe
         yXSJeiP/zhHmEtBxm5QflyvizEOSZ4V8krthPPlIcLLlRhSe8BwEjgO+KDoUxCsYl9+P
         o0zQ==
X-Gm-Message-State: AOJu0YyyLStF8FuOCcVJ+2YKoc64KBm/b87dhEDHdYQbFr2QpF4Rp6Qu
	0HcM0mGF4dE+KOj7K1hxadSGl+bPj1rI2yJ4pwc=
X-Google-Smtp-Source: AGHT+IG9YK1OAKaJNRYBS46Wp5hGVBDys0ISO+FXJddcpm5Qc1RE+vXpRIsUeZeHw0Kzd0pHumCyzjLietDpSxvKOYU=
X-Received: by 2002:a25:6b50:0:b0:d78:2cdc:4d2 with SMTP id
 o16-20020a256b50000000b00d782cdc04d2mr162012ybm.6.1694543577799; Tue, 12 Sep
 2023 11:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAAfyv34+oTQaT=9-QGkTdCFSJaC6CS=RB6SF=FQrOUssntoBSA@mail.gmail.com>
 <CAAfyv35VDffm9nLeYP4yb+pvdPBaS0jQ8_1bZ-KaUq28RBBJ1A@mail.gmail.com>
In-Reply-To: <CAAfyv35VDffm9nLeYP4yb+pvdPBaS0jQ8_1bZ-KaUq28RBBJ1A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 12 Sep 2023 14:32:48 -0400
Message-ID: <CADkTA4MVScs1TPQfM+35kxx3y0Jniz-q_neqy+ooSWwsjrzbow@mail.gmail.com>
Subject: Re: [meta-virtualization] nerdctl broken in kirkstone
To: Marek Belisko <marek.belisko@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Sep 2023 18:33:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8297

On Tue, Sep 12, 2023 at 3:26=E2=80=AFAM Marek Belisko <marek.belisko@gmail.=
com> wrote:
>
> Hi,
>
> Forwarding in proper mailing list.
>
> I'm trying to add nerdctl to an image using kirkstone release for meta-vi=
rtualization.
> I've added bbappend with following fix:
>
> SRC_URI =3D "git://github.com/containerd/nerdctl.git;name=3Dnerdcli;branc=
h=3Dmain;protocol=3Dhttps"
>
> (branch name in original recipe is master but main is required)

Right, we have a fix in new release for that:

commit cb5dfda6f6d862a575f029ee8ded0bc3db6bc766
Author: Guenther Meyer <g.meyer@signum-media.de>
Date:   Fri Nov 18 11:55:46 2022 +0100

    nerdctl: renamed upstream branch master to main

    Signed-off-by: Guenther Meyer <g.meyer@signum-media.de>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>

diff --git a/recipes-containers/nerdctl/nerdctl_git.bb
b/recipes-containers/nerdctl/nerdctl_git.bb
index 4a749b2..8fe5e7d 100644
--- a/recipes-containers/nerdctl/nerdctl_git.bb
+++ b/recipes-containers/nerdctl/nerdctl_git.bb
@@ -13,7 +13,7 @@ DEPENDS =3D " \
 SRCREV_FORMAT=3D"nerdcli_cgroups"
 SRCREV_nerdcli =3D "e084a2df4a8861eb5f0b0d32df0643ef24b81093"

-SRC_URI =3D "git://github.com/containerd/nerdctl.git;name=3Dnerdcli;branch=
=3Dmaster;protocol=3Dhttps"
+SRC_URI =3D "git://github.com/containerd/nerdctl.git;name=3Dnerdcli;branch=
=3Dmain;protocol=3Dhttps"

 include src_uri.inc

---------

it could be cherry-picked to kirkstone, there's just no proactive
cherry picking that
is done, and I typically wait for someone with a real issue on the branch t=
o ask
for it.

I can take this email as that request.

>
> but then anyways it fails with:
>
> rsync: [sender] change_dir "/data/projects/test/build/tmp/work/cortexa53-=
crypto-poky-linux/nerdctl/v0.18.0-r0/nerdctl-v0.18.0/src/import/vendor.fetc=
h/github.com/Masterminds/semver/v3" failed: No such file or directory (2)
> | rsync error: some files/attrs were not transferred (see previous errors=
) (code 23) at main.c(1327) [sender=3D3.2.5]
>
> And in ${BP} I cannot see any of those vendor stuff which should be prese=
nt. Is there some fix for that already pending or its known issue?

That would mean that one of the clones in the SRC_URI is now failing,
usually by something
that shouldn't have been changed in the upstream repository that was
change (a branch
deleted, directories removed, some other repo now clobbering the dir, etc).

It worked on release, so it was valid then.

If the hash or branch is bad, bitbake should have thrown an error or warnin=
g.

I just did a manual clone of that repository, and the result looked ok
for being able to
copy that directory into a fully constructed vendor/ tree.

We've changed the format of the src_uri and relocation files in newer
releases and
there's an improved script on master-next. If pointing that script at
the same major
release of nerdctl works, we could update the recipe to the more
reliable format,
as the actual nerdctl target executable would be unchanged.

Bruce

>
> Thanks and BR,
>
> marek
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8296): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8296
> Mute This Topic: https://lists.yoctoproject.org/mt/101310644/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

