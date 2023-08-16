Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA2B9EB64DD
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 04:04:46 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.153933.1692158682500046351
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 15 Aug 2023 21:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Q9I+xo62;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-790976d86a1so209785239f.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 15 Aug 2023 21:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692158681; x=1692763481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgAYeSgHIPN/04EoDiDcSrk8RGAxvIJI+ZuNwYVS/Z4=;
        b=Q9I+xo62H4o5YTWK/eVjViO/NeTOTeW5a7qlrc0S6TsXIgZoPCBkxPRWR75KFkquZK
         6Ot+OoRSbIforeCAcUpwKnQhjrKP9+2HvwWhK8rp1PZfgRbqUy8YLMIteG+iTgs/Ovsd
         2JhNF5J8p3i+LVBlB+SFa3LqTViw9JP5DXhzbFFpHEwEc52MqjSOvJtP9Uka2MPKRFBC
         fjORFbmhRCq9c+3/g//3soqEnJcoKUPwJp4X5anJ9AYXrpdw6hG9I9XJ+1YcEi9xIXVM
         z0iT1eVFytIddW9UVjzfzDq0csFwL/XOh/s8XnXePMuOBHsu3N/SBOZqG3+kGOGXfH5n
         pdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692158681; x=1692763481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wgAYeSgHIPN/04EoDiDcSrk8RGAxvIJI+ZuNwYVS/Z4=;
        b=cUZDqAcLoCbAjWBorTWe/1ebJZqZ+nIs3/YL2dvUoes9jqi1plJ9LT323NXOAuVQg/
         vOzh5fTTDTqTZ9VZVwI8hcKtGP/3HhJuHCoo7zrpl6ULZgT4pn6DDR+B65gXZYcZ/3Py
         llw1U35bU8yCXnG9i0WDdLkcblwWjkIC+KSvGNAKPSxyVS7LoeKtUmgJFKBQRiSrLSx8
         v0jZ8HVZP1Q1cSw8/nk+MR3tIcAoNX53OEitdnFcBh4cgVcgd/yczJPPXoPtGqdzFO+0
         9yex+gGzl29ydC0lqEl1OALBc3dQ1adjyKY3OZjZOTvhB8OlQwsL9c4wRhKSoK4l2Hi/
         9ojw==
X-Gm-Message-State: AOJu0Yy2HDRcYahIWQF0nwKYFHsSxCR/N0bzjuO17jldZQKR/BBOgRy9
	5mVG3OTFvogXNje3A0AIiOZtWcYk7VbiotLKMps=
X-Google-Smtp-Source: AGHT+IFz7xhLKaPPzzZdFtMzLPLgmsEI9vOqTICjz3v9l2wgykCMUkJS2TtTRxSjIXEM8yXEqPpKOi8mYIN2+FRnMr8=
X-Received: by 2002:a5e:8b4a:0:b0:787:1555:efca with SMTP id
 z10-20020a5e8b4a000000b007871555efcamr696693iom.5.1692158681452; Tue, 15 Aug
 2023 21:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230814151356.1001953-1-Martin.Jansa@gmail.com>
 <177B48E707B1FD85.12117@lists.yoctoproject.org> <CA+chaQei9w4MDNhZPojhKXf=Tx-DTt2PE0UapJ3eis5eciTnDw@mail.gmail.com>
 <CA+chaQcKaxcvOF6Y6p8D-B80NwCEqZVuh6QvpA-9Rm=TUiFTMQ@mail.gmail.com>
 <BL1PR11MB600117F27F20E29B53648DEEAD14A@BL1PR11MB6001.namprd11.prod.outlook.com>
 <CA+chaQcuBONPMTDZMvtow23T_ZeoeKuqotHXXOV=muj1Hifa+w@mail.gmail.com>
In-Reply-To: <CA+chaQcuBONPMTDZMvtow23T_ZeoeKuqotHXXOV=muj1Hifa+w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 16 Aug 2023 00:04:30 -0400
Message-ID: <CADkTA4P9Ge+uzpdgAjmy2r0obAwE-hCq8F5_OBObAoVWCQHkew@mail.gmail.com>
Subject: Re: [meta-virtualization] [kirkstone][RFC][PATCHv2] docker: update to
 v20.10.25 + 58 commits to fix compatibility with go currently in kirkstone
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: fib@cisco.com, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Aug 2023 04:04:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8194

On Tue, Aug 15, 2023 at 5:14=E2=80=AFPM Martin Jansa <Martin.Jansa@gmail.co=
m> wrote:
>
> Hmm, I was testing docker-moby, not docker-ce, but I don't see why it wou=
ld be happening. Will try docker-ce tomorrow.
>

docker-ce carries some patches for integration with downstream layers
that have some patches for extended functionality required for
container OS namespace manipulations.

I merged the patch without testing it against -ce myself, so I
wouldn't worry about spending too much time on it, I can do the
refreshes.

Bruce

> On Tue, Aug 15, 2023 at 11:06=E2=80=AFPM Ruslan Babayev (fib) via lists.y=
octoproject.org <fib=3Dcisco.com@lists.yoctoproject.org> wrote:
>>
>> Hi Martin,
>>
>>
>>
>> Build fails with:
>>
>>
>>
>> ERROR: docker-ce-20.10.25-ce+git3056208812eb5e792fa99736c9167d1e10f4ab49=
-r0 do_patch: Applying patch '0001-Revert-go-updates-from-1.19.12-to-1.18.7=
.patch' on target directory '<REDACTED>/tmp/work/core2-64-poky-linux/docker=
-ce/20.10.25-ce+git3056208812eb5e792fa99736c9167d1e10f4ab49-r0/git/src/impo=
rt'
>>
>> CmdError('quilt --quiltrc <REDACTED>/tmp/work/core2-64-poky-linux/docker=
-ce/20.10.25-ce+git3056208812eb5e792fa99736c9167d1e10f4ab49-r0/recipe-sysro=
ot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-Revert-go-upda=
tes-from-1.19.12-to-1.18.7.patch
>>
>> patching file Dockerfile
>>
>> Hunk #1 FAILED at 3.
>>
>> Hunk #2 FAILED at 267.
>>
>> Hunk #3 FAILED at 316.
>>
>> 3 out of 3 hunks FAILED -- rejects in file Dockerfile
>>
>> patching file Dockerfile.e2e
>>
>> Hunk #1 FAILED at 1.
>>
>> 1 out of 1 hunk FAILED -- rejects in file Dockerfile.e2e
>>
>> patching file Dockerfile.simple
>>
>> Hunk #1 FAILED at 5.
>>
>> 1 out of 1 hunk FAILED -- rejects in file Dockerfile.simple
>>
>> patching file Dockerfile.windows
>>
>> Hunk #1 FAILED at 165.
>>
>> 1 out of 1 hunk FAILED -- rejects in file Dockerfile.windows
>>
>> patching file hack/dockerfile/install/gotestsum.installer
>>
>> Hunk #1 FAILED at 1.
>>
>> 1 out of 1 hunk FAILED -- rejects in file hack/dockerfile/install/gotest=
sum.installer
>>
>> Patch 0001-Revert-go-updates-from-1.19.12-to-1.18.7.patch can be reverse=
-applied
>>
>>
>>
>> stderr: ')
>>
>> ERROR: Logfile of failure stored in: <REDACTED>/tmp/work/core2-64-poky-l=
inux/docker-ce/20.10.25-ce+git3056208812eb5e792fa99736c9167d1e10f4ab49-r0/t=
emp/log.do_patch.622820
>>
>> ERROR: Task <REDACTED>/meta-virtualization/recipes-containers/docker/doc=
ker-ce_git.bb:do_patch) failed with exit code '1'
>>
>>
>>
>>
>>
>> From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@li=
sts.yoctoproject.org> On Behalf Of Martin Jansa
>> Sent: Monday, August 14, 2023 12:03 PM
>> To: Martin.Jansa@gmail.com
>> Cc: meta-virtualization@lists.yoctoproject.org
>> Subject: Re: [meta-virtualization] [kirkstone][RFC][PATCHv2] docker: upd=
ate to v20.10.25 + 58 commits to fix compatibility with go currently in kir=
kstone
>>
>>
>>
>> On Mon, Aug 14, 2023 at 9:00=E2=80=AFPM Martin Jansa <martin.jansa@gmail=
.com> wrote:
>>
>>
>>
>>
>>
>> On Mon, Aug 14, 2023 at 5:17=E2=80=AFPM Martin Jansa via lists.yoctoproj=
ect.org <Martin.Jansa=3Dgmail.com@lists.yoctoproject.org> wrote:
>>
>> RFC, because I've only build tested this in kirkstone, waiting for whole=
 image to build to test it in runtime
>>
>>
>>
>> Passed minimal sanity check on rpi4-64:
>>
>>
>>
>> my fat fingers didn't pass copy&pasting test, here 2nd try:
>>
>>
>>
>> root@rpi4:~# systemctl start docker.service
>> root@rpi4:~# docker run -it --rm ubuntu
>> Unable to find image 'ubuntu:latest' locally
>> latest: Pulling from library/ubuntu
>> 5af00eab9784: Pull complete
>> Digest: sha256:0bced47fffa3361afa981854fcabcd4577cd43cebbb808cea2b1f33a3=
dd7f508
>> Status: Downloaded newer image for ubuntu:latest
>> root@92414c21da3d:/#
>>
>> root@92414c21da3d:/# cat /etc/lsb-release
>> DISTRIB_ID=3DUbuntu
>> DISTRIB_RELEASE=3D22.04
>> DISTRIB_CODENAME=3Djammy
>> DISTRIB_DESCRIPTION=3D"Ubuntu 22.04.2 LTS"
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8193): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8193
> Mute This Topic: https://lists.yoctoproject.org/mt/100738603/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

