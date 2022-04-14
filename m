Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B9FC54EC4
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web08.7547.1649906020846221823
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Apr 2022 20:13:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FbpaJYrZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id u15so7512832ejf.11
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Apr 2022 20:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x3QRZKpfrfSACQW3pl4UwaLMgSnMlv7sivXevhU6nAk=;
        b=FbpaJYrZqYwOqqxTDQd5MvdBFY3gzFOxz/Bzhjgoo/hq4A2cW9+1KGkNBAVFwgmOyI
         K3odCjhtj6Xv9kd+6Wux+zwz9R8v8OugnU5fHis3PsIOMLmmDTCVarzJYOOd8za64E68
         8qhyjWlywc9xtwphFS0KbRfOfzvvkJvPoHRSx9qYbYEdsLh84ycXTYEPeFiXZXT+7Yz/
         qkvW06meBCRamArI7Wkz/caODcCRoZTz8ibr2i0HUm9g7UPNQp+rF/9rLyb+yiWz3azg
         1sn96kJ1v95ZwSMu78x7WD0rNKh9bxq8mdAY9+PuiIlKkQgViJNGH0dNr3XjTDxURM7M
         bQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x3QRZKpfrfSACQW3pl4UwaLMgSnMlv7sivXevhU6nAk=;
        b=suwepbvHP3lhXI9Ri3kii79UGZKSMycagdBMuuwnXb1ObtSabinf6hhVc9kscyPzy8
         GEZj8ORrAaOGFEompSsy4T+bwMjw9ayZTFV+ibe8aR61j2zxfkTELzUoy23Al63XhPrn
         tEyubV1TsLtxYu+duCJrqfvmkPhOGZd5XTledh1IIoe2Vq2EMQyUpzQJx9cnvZXfC2a+
         OT7jfw1rkYVDsvPxf1wH7Z0RhkjNd4SblctDQna7HD2eGy+wWIiphIrHf79YAAyrHeIR
         dkq1RujCyE8q6wrNgSGOOauvFwnsPNEmaEwxYnHo3Z3qClaAmZdDsnXPIgvkcFKy+Bvz
         trrA==
X-Gm-Message-State: AOAM532Wh9tihFBystOECZ2DjfNYkcDr0uD4ma43LwEZkfl+E/gQn0m+
	tZ4X4F5SFS0BdGac/7CgTV0XEAd/rB2tN0LvMqM=
X-Google-Smtp-Source: 
 ABdhPJzuKgnBgRhRnw/f8m9+HKIWlaPP9BNResu+1ULE6vkeAdbxiTDF2mXD7OFxNGxKe09PtI/1WjdLa6yddwkheaI=
X-Received: by 2002:a17:907:3f04:b0:6e8:4b0e:438d with SMTP id
 hq4-20020a1709073f0400b006e84b0e438dmr580520ejc.391.1649906019112; Wed, 13
 Apr 2022 20:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220408084420.102085-1-michal.orzel@arm.com>
In-Reply-To: <20220408084420.102085-1-michal.orzel@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 13 Apr 2022 23:13:28 -0400
Message-ID: 
 <CADkTA4MxDwunJex7NnjFpLs2k0sUo354XUysH0PeYww+gYxA_A@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 0/3] xen: Update recipes for xen and
 xen-tools
To: Michal Orzel <michal.orzel@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Christopher Clark <christopher.w.clark@gmail.com>,
 Doug Goldstein <cardoe@gentoo.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7168

On Fri, Apr 8, 2022 at 4:44 AM Michal Orzel <michal.orzel@arm.com> wrote:
>
> Before the next Yocto release, Xen recipes need to be updated.
> This patch series:
> - updates 4.15 recipes
> - introduces 4.16 recipes
> - removes 4.14 recipes

FYI: I'm not ignoring these, and I will make sure they get into the
upcoming release branch and are in place for the LTS release. I'm just
waiting until Christopher gets a chance to review and see if these
match up with what he was thinking about for versions.

Bruce

>
> Michal Orzel (3):
>   xen: Bump SRCREV of 4.15 recipes to 4.15.2
>   xen: Add recipes for stable Xen 4.16 release and update master
>   xen: Remove 4.14 recipes and related patches
>
>  .../include/meta-virt-default-versions.inc    |   4 +-
>  ...-stand-alone-set-of-headers-Xen-4.14.patch | 178 ------------------
>  ...ython-pygrub-pass-DISTUTILS-xen-4.14.patch |  66 -------
>  ...d-firmware-as-ffreestanding-Xen-4.14.patch |  83 --------
>  recipes-extended/xen/xen-tools_4.14.bb        |  21 ---
>  recipes-extended/xen/xen-tools_4.15.bb        |   4 +-
>  recipes-extended/xen/xen-tools_4.16.bb        |  19 ++
>  recipes-extended/xen/xen-tools_git.bb         |   6 +-
>  recipes-extended/xen/xen_4.15.bb              |   4 +-
>  .../xen/{xen_4.14.bb => xen_4.16.bb}          |   6 +-
>  recipes-extended/xen/xen_git.bb               |   6 +-
>  11 files changed, 34 insertions(+), 363 deletions(-)
>  delete mode 100644 recipes-extended/xen/files/0001-firmware-provide-a-stand-alone-set-of-headers-Xen-4.14.patch
>  delete mode 100644 recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch
>  delete mode 100644 recipes-extended/xen/files/0001-tools-firmware-Build-firmware-as-ffreestanding-Xen-4.14.patch
>  delete mode 100644 recipes-extended/xen/xen-tools_4.14.bb
>  create mode 100644 recipes-extended/xen/xen-tools_4.16.bb
>  rename recipes-extended/xen/{xen_4.14.bb => xen_4.16.bb} (79%)
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7130): https://lists.yoctoproject.org/g/meta-virtualization/message/7130
> Mute This Topic: https://lists.yoctoproject.org/mt/90331599/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

