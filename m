Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592C7C54EBC
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 15:43:56 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web10.106900.1673365428495472263
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Jan 2023 07:43:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IH4rjRre;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id k4so12641584vsc.4
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Jan 2023 07:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2NlE1AIhM9QClFeteGZ1EwNKkIxo7an7NQYybhdETag=;
        b=IH4rjRrepXH94g90BKQGw33dY71vWG/RBbSmIch+TPy/W2acKMpoGGESe6kBq6Xatq
         kCh/CyUo6/eaSsmba8W/jFJEAllWzfN1DDbZzrSRq8//yNwjf1h0W3NEqPS5Z+jjsdw5
         wAfKX3wmwzdPGoyVorzSbLfdg+UKqno1ct5MPXFKGMW1AwnqH3dzDoXbiDnd4SgHFEtp
         o9YgM2SrB6iohaKaJAl0jdfAPcEAchwF4R+nnF6jJ3qbHEy2P8KgOvOuEKMD6pyMATuI
         R/uw4/QhkeVL9vabs3zZJ0rMK5wBfQ0p6nBsrnnvZAMexnVB5UJv+FzKdoRmcOBvDiYb
         Io0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NlE1AIhM9QClFeteGZ1EwNKkIxo7an7NQYybhdETag=;
        b=CW2QVpRg2GlmKb2csU5qO1s/uVOwhxRYNnlqZyOVLJYiRndYnhjgNRtRrLOdYuL4kO
         QHU1uU4lpBu7iacHumalODrWBGhYOw5iEKL66eoD0ygo8DfFL/O1RCCHSyKsizlwBpCb
         2SDHr6/fTDC8Sd1VrTIh6XBkwiW6P8brz2VOus6opW3WcWIAcPSuy/Q6+2Tt2+TluAWx
         SLSX05j98HrAwlFvV4fDT5o3/FJuDWdSk8l9LIn7x0tSzZ9adangGzA4EwgueiApZi6q
         v3OSEB6AzXKs5MUizI6u/4J4uUvgWIrW+d4Ibs3GxkoxXTMR87sDVGZpu5jDTp/bPG80
         c7+g==
X-Gm-Message-State: AFqh2kpaiGvTViuPd1YTsYR8C4RjgarsT+xOSuKgJMFCN0QTBP+iYIM5
	VioQFtoyqNptxUNMbGl3zv0QnWqZP4nDEb8A4zLixGqTjkd2V84h
X-Google-Smtp-Source: AMrXdXs0it/B8Rb9zg86Be027/TrkZHofD544uuph0m4F80VthQ6Ytwb7fcz2j9GeMq01Blf4u8FJHS+etPXSJoaB8E=
X-Received: by 2002:a05:6102:819:b0:3b0:af48:e6b2 with SMTP id
 g25-20020a056102081900b003b0af48e6b2mr8575876vsb.38.1673365427448; Tue, 10
 Jan 2023 07:43:47 -0800 (PST)
MIME-Version: 1.0
References: <20230110151432.3434073-1-jose.quaresma@foundries.io> <CADkTA4Oa0DppORwgKT8m4JUWzQ7bj7zFsRrrxcEkLQTdA5Q0iw@mail.gmail.com>
In-Reply-To: <CADkTA4Oa0DppORwgKT8m4JUWzQ7bj7zFsRrrxcEkLQTdA5Q0iw@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 10 Jan 2023 15:43:36 +0000
Message-ID: <CANPvuRnKMRh=BbeGFFvy9965C3up3gUXJ8M=BBKkq0iJpPGyUw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] skope: fix build with btrfs-progs 6.1
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000e1eee405f1eabf88"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Jan 2023 15:43:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7811

--000000000000e1eee405f1eabf88
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a, 10/01=
/2023
=C3=A0(s) 15:39:

> This is one of the breakages I warned about earlier, I have a version
> bump in master-next, and pending fix that I'm about to push.
>
> If those don't sort it out, I'll have a closer look at this.
>

I have tried on my side bumping to v1.10.0 as well but this patch is still
needed.

Thanks for looking at this.

Jose


> Bruce
>
> On Tue, Jan 10, 2023 at 10:15 AM Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >
> > | # github.com/containers/storage/drivers/btrfs
> > | vendor/github.com/containers/storage/drivers/btrfs/btrfs.go:387:11:
> args.lim.max_referenced undefined (type _Ctype_struct_btrfs_qgroup_limit
> has no field or method max_referenced)
> > | recipe skopeo-v1.8.0+gitAUTOINC+b95e081162-r0: task do_compile: Faile=
d
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  ...ound_field_rename_in_btrfs-progs_6_1.patch | 38 +++++++++++++++++++
> >  recipes-containers/skopeo/skopeo_git.bb       |  1 +
> >  2 files changed, 39 insertions(+)
> >  create mode 100644
> recipes-containers/skopeo/files/0002-fix_workaround_field_rename_in_btrfs=
-progs_6_1.patch
> >
> > diff --git
> a/recipes-containers/skopeo/files/0002-fix_workaround_field_rename_in_btr=
fs-progs_6_1.patch
> b/recipes-containers/skopeo/files/0002-fix_workaround_field_rename_in_btr=
fs-progs_6_1.patch
> > new file mode 100644
> > index 0000000..cd3c70f
> > --- /dev/null
> > +++
> b/recipes-containers/skopeo/files/0002-fix_workaround_field_rename_in_btr=
fs-progs_6_1.patch
> > @@ -0,0 +1,38 @@
> > +From 246ba3062e8b551026aef2708eee747014ce5c52 Mon Sep 17 00:00:00 2001
> > +From: Rui Chen <rui@chenrui.dev>
> > +Date: Wed, 28 Dec 2022 18:26:39 -0500
> > +Subject: [PATCH] fix: workaround field rename in btrfs-progs 6.1
> > +
> > +same as kdave/btrfs-progs@0345143
> > +
> > +Signed-off-by: Rui Chen <rui@chenrui.dev>
> > +
> > +Upstream-Status: Backport [
> https://github.com/containers/storage/commit/246ba3062e8b551026aef2708eee=
747014ce5c52
> ]
> > +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > +---
> > + drivers/btrfs/btrfs.go | 5 ++++-
> > + 1 file changed, 4 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/drivers/btrfs/btrfs.go b/drivers/btrfs/btrfs.go
> > +index e8b16b858e..3d9053297b 100644
> > +--- a/drivers/btrfs/btrfs.go
> > ++++ b/drivers/btrfs/btrfs.go
> > +@@ -6,6 +6,9 @@ package btrfs
> > + /*
> > + #include <stdlib.h>
> > + #include <dirent.h>
> > ++
> > ++// keep struct field name compatible with btrfs-progs < 6.1.
> > ++#define max_referenced max_rfer
> > + #include <btrfs/ioctl.h>
> > + #include <btrfs/ctree.h>
> > +
> > +@@ -382,7 +385,7 @@ func subvolLimitQgroup(path string, size uint64)
> error {
> > +       defer closeDir(dir)
> > +
> > +       var args C.struct_btrfs_ioctl_qgroup_limit_args
> > +-      args.lim.max_referenced =3D C.__u64(size)
> > ++      args.lim.max_rfer =3D C.__u64(size)
> > +       args.lim.flags =3D C.BTRFS_QGROUP_LIMIT_MAX_RFER
> > +       _, _, errno :=3D unix.Syscall(unix.SYS_IOCTL, getDirFd(dir),
> C.BTRFS_IOC_QGROUP_LIMIT,
> > +               uintptr(unsafe.Pointer(&args)))
> > diff --git a/recipes-containers/skopeo/skopeo_git.bb
> b/recipes-containers/skopeo/skopeo_git.bb
> > index a2fff2c..3eaddfd 100644
> > --- a/recipes-containers/skopeo/skopeo_git.bb
> > +++ b/recipes-containers/skopeo/skopeo_git.bb
> > @@ -24,6 +24,7 @@ SRC_URI =3D " \
> >      file://storage.conf \
> >      file://registries.conf \
> >      file://0001-makefile-add-GOBUILDFLAGS-to-go-build-call.patch \
> > +
> file://0002-fix_workaround_field_rename_in_btrfs-progs_6_1.patch;patchdir=
=3Dsrc/import/vendor/
> github.com/containers/storage \
> >  "
> >
> >  SRCREV =3D "b95e081162382f9a28f400bee10046ce72b957fe"
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7809):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7809
> > Mute This Topic: https://lists.yoctoproject.org/mt/96178786/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000e1eee405f1eabf88
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@g=
mail.com">bruce.ashfield@gmail.com</a>&gt; escreveu no dia ter=C3=A7a, 10/0=
1/2023 =C3=A0(s) 15:39:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">This is one of the breakages I warned about earlier, I have a versi=
on<br>
bump in master-next, and pending fix that I&#39;m about to push.<br>
<br>
If those don&#39;t sort it out, I&#39;ll have a closer look at this.<br></b=
lockquote><div><br></div><div>I have tried on my side bumping to v1.10.0 as=
 well but this patch is still needed.</div><div><br></div><div>Thanks for l=
ooking=C2=A0at this.<br><br></div><div>Jose<br><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Bruce<br>
<br>
On Tue, Jan 10, 2023 at 10:15 AM Jose Quaresma &lt;<a href=3D"mailto:quares=
ma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt; | # <a href=3D"http://github.com/containers/storage/drivers/btrfs" rel=
=3D"noreferrer" target=3D"_blank">github.com/containers/storage/drivers/btr=
fs</a><br>
&gt; | vendor/<a href=3D"http://github.com/containers/storage/drivers/btrfs=
/btrfs.go:387:11" rel=3D"noreferrer" target=3D"_blank">github.com/container=
s/storage/drivers/btrfs/btrfs.go:387:11</a>: args.lim.max_referenced undefi=
ned (type _Ctype_struct_btrfs_qgroup_limit has no field or method max_refer=
enced)<br>
&gt; | recipe skopeo-v1.8.0+gitAUTOINC+b95e081162-r0: task do_compile: Fail=
ed<br>
&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...ound_field_rename_in_btrfs-progs_6_1.patch | 38 +++++++++++++=
++++++<br>
&gt;=C2=A0 recipes-containers/skopeo/<a href=3D"http://skopeo_git.bb" rel=
=3D"noreferrer" target=3D"_blank">skopeo_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 39 insertions(+)<br>
&gt;=C2=A0 create mode 100644 recipes-containers/skopeo/files/0002-fix_work=
around_field_rename_in_btrfs-progs_6_1.patch<br>
&gt;<br>
&gt; diff --git a/recipes-containers/skopeo/files/0002-fix_workaround_field=
_rename_in_btrfs-progs_6_1.patch b/recipes-containers/skopeo/files/0002-fix=
_workaround_field_rename_in_btrfs-progs_6_1.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..cd3c70f<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-containers/skopeo/files/0002-fix_workaround_field_rename=
_in_btrfs-progs_6_1.patch<br>
&gt; @@ -0,0 +1,38 @@<br>
&gt; +From 246ba3062e8b551026aef2708eee747014ce5c52 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Rui Chen &lt;<a href=3D"mailto:rui@chenrui.dev" target=3D"_blan=
k">rui@chenrui.dev</a>&gt;<br>
&gt; +Date: Wed, 28 Dec 2022 18:26:39 -0500<br>
&gt; +Subject: [PATCH] fix: workaround field rename in btrfs-progs 6.1<br>
&gt; +<br>
&gt; +same as kdave/btrfs-progs@0345143<br>
&gt; +<br>
&gt; +Signed-off-by: Rui Chen &lt;<a href=3D"mailto:rui@chenrui.dev" target=
=3D"_blank">rui@chenrui.dev</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/containers/s=
torage/commit/246ba3062e8b551026aef2708eee747014ce5c52" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/containers/storage/commit/246ba3062e8b=
551026aef2708eee747014ce5c52</a>]<br>
&gt; +Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foun=
dries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; +---<br>
&gt; + drivers/btrfs/btrfs.go | 5 ++++-<br>
&gt; + 1 file changed, 4 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/drivers/btrfs/btrfs.go b/drivers/btrfs/btrfs.go<br>
&gt; +index e8b16b858e..3d9053297b 100644<br>
&gt; +--- a/drivers/btrfs/btrfs.go<br>
&gt; ++++ b/drivers/btrfs/btrfs.go<br>
&gt; +@@ -6,6 +6,9 @@ package btrfs<br>
&gt; + /*<br>
&gt; + #include &lt;stdlib.h&gt;<br>
&gt; + #include &lt;dirent.h&gt;<br>
&gt; ++<br>
&gt; ++// keep struct field name compatible with btrfs-progs &lt; 6.1.<br>
&gt; ++#define max_referenced max_rfer<br>
&gt; + #include &lt;btrfs/ioctl.h&gt;<br>
&gt; + #include &lt;btrfs/ctree.h&gt;<br>
&gt; +<br>
&gt; +@@ -382,7 +385,7 @@ func subvolLimitQgroup(path string, size uint64) =
error {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0defer closeDir(dir)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0var args C.struct_btrfs_ioctl_qgroup_limit=
_args<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 args.lim.max_referenced =3D C.__u64(size)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 args.lim.max_rfer =3D C.__u64(size)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0args.lim.flags =3D C.BTRFS_QGROUP_LIMIT_MA=
X_RFER<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_, _, errno :=3D unix.Syscall(unix.SYS_IOC=
TL, getDirFd(dir), C.BTRFS_IOC_QGROUP_LIMIT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr(unsafe=
.Pointer(&amp;args)))<br>
&gt; diff --git a/recipes-containers/skopeo/<a href=3D"http://skopeo_git.bb=
" rel=3D"noreferrer" target=3D"_blank">skopeo_git.bb</a> b/recipes-containe=
rs/skopeo/<a href=3D"http://skopeo_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">skopeo_git.bb</a><br>
&gt; index a2fff2c..3eaddfd 100644<br>
&gt; --- a/recipes-containers/skopeo/<a href=3D"http://skopeo_git.bb" rel=
=3D"noreferrer" target=3D"_blank">skopeo_git.bb</a><br>
&gt; +++ b/recipes-containers/skopeo/<a href=3D"http://skopeo_git.bb" rel=
=3D"noreferrer" target=3D"_blank">skopeo_git.bb</a><br>
&gt; @@ -24,6 +24,7 @@ SRC_URI =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://storage.conf \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://registries.conf \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0001-makefile-add-GOBUILDFLAGS-to-go-build-=
call.patch \<br>
&gt; +=C2=A0 =C2=A0 file://0002-fix_workaround_field_rename_in_btrfs-progs_=
6_1.patch;patchdir=3Dsrc/import/vendor/<a href=3D"http://github.com/contain=
ers/storage" rel=3D"noreferrer" target=3D"_blank">github.com/containers/sto=
rage</a> \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;b95e081162382f9a28f400bee10046ce72b957fe&quot;<=
br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#7809): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/7809" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/7809</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/96178786=
/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/mt/96178786/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000e1eee405f1eabf88--

