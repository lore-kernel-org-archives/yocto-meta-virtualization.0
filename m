Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C6DFC54EBC
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 15:46:16 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web10.106984.1673365570965401976
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Jan 2023 07:46:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a3fSP3A2;
 spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id m15so6610212ilq.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Jan 2023 07:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDL3eq4bH6quNu3jXNLIMtYY9MUd/Q3+MRJ5MnA9ENE=;
        b=a3fSP3A2uS1dYqN2XxF+77nV9oAyj2bL1MKB6zzgkf3bGYDSrPDC8QnUsTMGWMAeie
         OXDmWP09hxrvSVWx9J1980/oTOLp/amMial1OlqNQxbczhj26LcW1ESp8EU7CY5zshvx
         BSBQjWFZ69HB+HO7btYDpkiOdByCUOYM/mAnsJdWQvaHWnlqX5vj+/JZutKm8NVyU11M
         Nu6GVHtVhX3TzH5vm8QCCs2fp3WXn/0lVvios32W7654wyowraK8mdIepgC5U0s9brTn
         2RCL4cQQaJwGO1JYfZJSpV7Uy/6Dk2Hxj7+q/fKnKit8njC46FcThpx9+WHRxaiquKlx
         vjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lDL3eq4bH6quNu3jXNLIMtYY9MUd/Q3+MRJ5MnA9ENE=;
        b=SbeNvNow+23dEGAEwBShtJHOP3R1bALvDmkBo48Gh689IQ5Msop4/6mIeMZnzzqxxQ
         It0FKGx90YULxD35B9EdHfQXjmsGF54d7hyjJ9d7C88BM7F8q80BfJWQVD8DANychxSA
         kZPhFPiFUaCS0fAGMJFKH1S+yi6/wFEkIYC3gbTneDKRmpeQ1ctVCOcaOjE9R8ElT0Gm
         3RZJEhItwLpAQ2cyQj2uvEYp50dVdeQ+/DEsMR/GTyQ1w2rk9bGpTN6T8XtVAHm6ZFJk
         lHTrwcrmZe/qMgKEg6ntOU9+QZKe4neAuiPWfqBCaZmHu2ycNobZYXzB5Qo3TUBoGQ+o
         NLlw==
X-Gm-Message-State: AFqh2kqBxVBFHGrnXu9mGqtpk6jTN/v9mms9E0Ec0cBYi/HiV/nrEwz9
	eYBA5RX6GlyYdHyxbtrw7vFvBhapByiVR3ZG5VA=
X-Google-Smtp-Source: AMrXdXuki3osXaVIXZUVjHd48nnDgzg3HIDWWNzqeaSaj5ppJCYX925jsr9znldQRzWRdam/APvR7E5PfC4T88erbTY=
X-Received: by 2002:a05:6e02:1bc4:b0:30d:96b3:d545 with SMTP id
 x4-20020a056e021bc400b0030d96b3d545mr1792635ilv.276.1673365570283; Tue, 10
 Jan 2023 07:46:10 -0800 (PST)
MIME-Version: 1.0
References: <20230110151432.3434073-1-jose.quaresma@foundries.io>
 <CADkTA4Oa0DppORwgKT8m4JUWzQ7bj7zFsRrrxcEkLQTdA5Q0iw@mail.gmail.com> <CANPvuRnKMRh=BbeGFFvy9965C3up3gUXJ8M=BBKkq0iJpPGyUw@mail.gmail.com>
In-Reply-To: <CANPvuRnKMRh=BbeGFFvy9965C3up3gUXJ8M=BBKkq0iJpPGyUw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Jan 2023 10:45:59 -0500
Message-ID: <CADkTA4MzzmoqCd2iUk9Cnb-=tii_tad3KZJAYdJuPs=+grJk+w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] skope: fix build with btrfs-progs 6.1
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Jan 2023 15:46:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7812

On Tue, Jan 10, 2023 at 10:43 AM Jose Quaresma <quaresma.jose@gmail.com> wr=
ote:
>
>
> Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a, 10/=
01/2023 =C3=A0(s) 15:39:
>>
>> This is one of the breakages I warned about earlier, I have a version
>> bump in master-next, and pending fix that I'm about to push.
>>
>> If those don't sort it out, I'll have a closer look at this.
>
>
> I have tried on my side bumping to v1.10.0 as well but this patch is stil=
l needed.
>

Right, that's what I meant that I also have a similar storage patch
that I was testing.  It is broken across packages with btrfs go
interfaces, so I was attempting a single solution.

Bruce

> Thanks for looking at this.
>
> Jose
>
>>
>> Bruce
>>
>> On Tue, Jan 10, 2023 at 10:15 AM Jose Quaresma <quaresma.jose@gmail.com>=
 wrote:
>> >
>> > | # github.com/containers/storage/drivers/btrfs
>> > | vendor/github.com/containers/storage/drivers/btrfs/btrfs.go:387:11: =
args.lim.max_referenced undefined (type _Ctype_struct_btrfs_qgroup_limit ha=
s no field or method max_referenced)
>> > | recipe skopeo-v1.8.0+gitAUTOINC+b95e081162-r0: task do_compile: Fail=
ed
>> >
>> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>> > ---
>> >  ...ound_field_rename_in_btrfs-progs_6_1.patch | 38 ++++++++++++++++++=
+
>> >  recipes-containers/skopeo/skopeo_git.bb       |  1 +
>> >  2 files changed, 39 insertions(+)
>> >  create mode 100644 recipes-containers/skopeo/files/0002-fix_workaroun=
d_field_rename_in_btrfs-progs_6_1.patch
>> >
>> > diff --git a/recipes-containers/skopeo/files/0002-fix_workaround_field=
_rename_in_btrfs-progs_6_1.patch b/recipes-containers/skopeo/files/0002-fix=
_workaround_field_rename_in_btrfs-progs_6_1.patch
>> > new file mode 100644
>> > index 0000000..cd3c70f
>> > --- /dev/null
>> > +++ b/recipes-containers/skopeo/files/0002-fix_workaround_field_rename=
_in_btrfs-progs_6_1.patch
>> > @@ -0,0 +1,38 @@
>> > +From 246ba3062e8b551026aef2708eee747014ce5c52 Mon Sep 17 00:00:00 200=
1
>> > +From: Rui Chen <rui@chenrui.dev>
>> > +Date: Wed, 28 Dec 2022 18:26:39 -0500
>> > +Subject: [PATCH] fix: workaround field rename in btrfs-progs 6.1
>> > +
>> > +same as kdave/btrfs-progs@0345143
>> > +
>> > +Signed-off-by: Rui Chen <rui@chenrui.dev>
>> > +
>> > +Upstream-Status: Backport [https://github.com/containers/storage/comm=
it/246ba3062e8b551026aef2708eee747014ce5c52]
>> > +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>> > +---
>> > + drivers/btrfs/btrfs.go | 5 ++++-
>> > + 1 file changed, 4 insertions(+), 1 deletion(-)
>> > +
>> > +diff --git a/drivers/btrfs/btrfs.go b/drivers/btrfs/btrfs.go
>> > +index e8b16b858e..3d9053297b 100644
>> > +--- a/drivers/btrfs/btrfs.go
>> > ++++ b/drivers/btrfs/btrfs.go
>> > +@@ -6,6 +6,9 @@ package btrfs
>> > + /*
>> > + #include <stdlib.h>
>> > + #include <dirent.h>
>> > ++
>> > ++// keep struct field name compatible with btrfs-progs < 6.1.
>> > ++#define max_referenced max_rfer
>> > + #include <btrfs/ioctl.h>
>> > + #include <btrfs/ctree.h>
>> > +
>> > +@@ -382,7 +385,7 @@ func subvolLimitQgroup(path string, size uint64) =
error {
>> > +       defer closeDir(dir)
>> > +
>> > +       var args C.struct_btrfs_ioctl_qgroup_limit_args
>> > +-      args.lim.max_referenced =3D C.__u64(size)
>> > ++      args.lim.max_rfer =3D C.__u64(size)
>> > +       args.lim.flags =3D C.BTRFS_QGROUP_LIMIT_MAX_RFER
>> > +       _, _, errno :=3D unix.Syscall(unix.SYS_IOCTL, getDirFd(dir), C=
.BTRFS_IOC_QGROUP_LIMIT,
>> > +               uintptr(unsafe.Pointer(&args)))
>> > diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-contain=
ers/skopeo/skopeo_git.bb
>> > index a2fff2c..3eaddfd 100644
>> > --- a/recipes-containers/skopeo/skopeo_git.bb
>> > +++ b/recipes-containers/skopeo/skopeo_git.bb
>> > @@ -24,6 +24,7 @@ SRC_URI =3D " \
>> >      file://storage.conf \
>> >      file://registries.conf \
>> >      file://0001-makefile-add-GOBUILDFLAGS-to-go-build-call.patch \
>> > +    file://0002-fix_workaround_field_rename_in_btrfs-progs_6_1.patch;=
patchdir=3Dsrc/import/vendor/github.com/containers/storage \
>> >  "
>> >
>> >  SRCREV =3D "b95e081162382f9a28f400bee10046ce72b957fe"
>> > --
>> > 2.34.1
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#7809): https://lists.yoctoproject.org/g/meta-virtu=
alization/message/7809
>> > Mute This Topic: https://lists.yoctoproject.org/mt/96178786/1050810
>> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b [bruce.ashfield@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

