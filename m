Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF3ABC0015E
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 19:47:14 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.22649.1690919228591437350
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Aug 2023 12:47:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Ng/iVpEe;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5661eb57452so3733135eaf.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Aug 2023 12:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690919228; x=1691524028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drdTgKZa3bI46sYA9YQELiyb5u+opEcN/FID5cxqgps=;
        b=Ng/iVpEeRsLkbxtR7OpbAf+CBvwzdxDirRKRYNwojmjjs3rdbYPdiGMtu8OL548THX
         1qPj7ocRTurhFzRWmMTaNVyKNqpeEXrm6qDWCg2b6pg7MuF+bOzLJC22nNrqauUcNCgu
         yoxmzYakUDvSgm5bJbWfTFjooR88PxIYCXsSjYkDevRBxYwnr87VIXTPKDrBrgiox4UB
         wL/GSvXHOeYGLIXEt9VfFpUEegz59hStS7AbZ8wB1u7EFl71PyTjuUJsTIv7E5Goi8G3
         AIX9j4oWwunwGC8f2YVcPmOjn+VBWUkoCTYOcGCU9aBeemFXmpU0noMiD77gBm8EUS2e
         n4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690919228; x=1691524028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drdTgKZa3bI46sYA9YQELiyb5u+opEcN/FID5cxqgps=;
        b=j0qboyavDKvRatX9P33Er4jnoRiXakXkEq25cNM4wXacgSQwhssO+bJLoqio//tMne
         dwOmZJVknqOwOINlcOlJWSlSzFDozWToiiAw5RtoX1eyBAiH2UtL3VqXij5zO0jdCsEL
         wN1DqC/lNzD+3B8KqO6M29qxuw2JG8cJIkiO5NNTQc8mtY2dm/ZB0GpfkGDxkpB181DT
         MRaI0W59t+7inoGo1fX5hd77hV5tVB/Uncb1yxBLBjRyoVVwgNebve9+CxSh/cRILPXB
         634SyMsFJBYEISLWp5YM1Z1yv0Wnc25r+uniEvmu8YdEX8votCj8ZLnQiWNNaefhXF+7
         tulA==
X-Gm-Message-State: ABy/qLaGyBqUC2vIqEPmLwTJ0dbRrXmG5sTtN63oUadc1S6uu21KPdCE
	56qFmaX4Ut+yR7S9zEJQ2KIeBE6LkNjUwWGimV0=
X-Google-Smtp-Source: APBJJlHa7B1v6h4e/dNWhWl7zM4xF/KOMHfw7Ab20DwlTAkZwaHeDwmJ+du5YnjIF97FSS+RPRtl7eHEb6oIuls1XIw=
X-Received: by 2002:a05:6870:6127:b0:1b0:189c:87a0 with SMTP id
 s39-20020a056870612700b001b0189c87a0mr15979603oae.41.1690919227736; Tue, 01
 Aug 2023 12:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230801003406.605140-1-raj.khem@gmail.com> <ZMlSQxGZrSb4PU0Q@gmail.com>
In-Reply-To: <ZMlSQxGZrSb4PU0Q@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Aug 2023 12:46:41 -0700
Message-ID: <CAMKF1sonF_3AtH6qdY9rvxaJuNJGdFZsotM7wDNr8m__PC26XA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] xen: Fix build with gas/2.41
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Aug 2023 19:47:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8163

On Tue, Aug 1, 2023 at 11:43=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
>
> merged.

Thanks, I will send a followup to get the v2 of patch, since most
likely that will get merged upstream.

>
> Bruce
>
> In message: [meta-virtualization][PATCH] xen: Fix build with gas/2.41
> on 31/07/2023 Khem Raj wrote:
>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > ---
> >  ...g-solaris-syntax-for-.section-direct.patch | 62 +++++++++++++++++++
> >  recipes-extended/xen/xen_4.17.bb              |  4 ++
> >  2 files changed, 66 insertions(+)
> >  create mode 100644 recipes-extended/xen/files/0001-arm32-Avoid-using-s=
olaris-syntax-for-.section-direct.patch
> >
> > diff --git a/recipes-extended/xen/files/0001-arm32-Avoid-using-solaris-=
syntax-for-.section-direct.patch b/recipes-extended/xen/files/0001-arm32-Av=
oid-using-solaris-syntax-for-.section-direct.patch
> > new file mode 100644
> > index 0000000..c73bb27
> > --- /dev/null
> > +++ b/recipes-extended/xen/files/0001-arm32-Avoid-using-solaris-syntax-=
for-.section-direct.patch
> > @@ -0,0 +1,62 @@
> > +From 9add6f9aced42a76f6a2c124754bef6fde56fa05 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +To: xen-devel@lists.xenproject.org
> > +Cc: Stefano Stabellini <sstabellini@kernel.org>
> > +Cc: Julien Grall <julien@xen.org>
> > +Cc: Bertrand Marquis <bertrand.marquis@arm.com>
> > +Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> > +Date: Mon, 31 Jul 2023 17:01:32 -0700
> > +Subject: [PATCH] arm32: Avoid using solaris syntax for .section direct=
ive
> > +
> > +Assembler from binutils 2.41 rejects this syntax
> > +
> > +.section "name"[, flags...]
> > +
> > +where flags could be #alloc, #write, #execstr
> > +Switch to using ELF syntax
> > +
> > +.section name[, "flags"[, @type]]
> > +
> > +[1] https://ftp.gnu.org/old-gnu/Manuals/gas-2.9.1/html_chapter/as_7.ht=
ml#SEC119
> > +
> > +Upstream-Status: Submitted [by email to xen-devel@lists.xenproject.org=
 and maintainers]
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + xen/arch/arm/arm32/proc-v7.S | 6 +++---
> > + 1 file changed, 3 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/xen/arch/arm/arm32/proc-v7.S b/xen/arch/arm/arm32/proc-v7=
.S
> > +index c90a31d80f..6d3d19b873 100644
> > +--- a/xen/arch/arm/arm32/proc-v7.S
> > ++++ b/xen/arch/arm/arm32/proc-v7.S
> > +@@ -29,7 +29,7 @@ brahma15mp_init:
> > +         mcr   CP32(r0, ACTLR)
> > +         mov   pc, lr
> > +
> > +-        .section ".proc.info", #alloc
> > ++        .section .proc.info, "a"
> > +         .type __v7_ca15mp_proc_info, #object
> > + __v7_ca15mp_proc_info:
> > +         .long 0x410FC0F0             /* Cortex-A15 */
> > +@@ -38,7 +38,7 @@ __v7_ca15mp_proc_info:
> > +         .long caxx_processor
> > +         .size __v7_ca15mp_proc_info, . - __v7_ca15mp_proc_info
> > +
> > +-        .section ".proc.info", #alloc
> > ++        .section .proc.info, "a"
> > +         .type __v7_ca7mp_proc_info, #object
> > + __v7_ca7mp_proc_info:
> > +         .long 0x410FC070             /* Cortex-A7 */
> > +@@ -47,7 +47,7 @@ __v7_ca7mp_proc_info:
> > +         .long caxx_processor
> > +         .size __v7_ca7mp_proc_info, . - __v7_ca7mp_proc_info
> > +
> > +-        .section ".proc.info", #alloc
> > ++        .section .proc.info, "a"
> > +         .type __v7_brahma15mp_proc_info, #object
> > + __v7_brahma15mp_proc_info:
> > +         .long 0x420F00F0             /* Broadcom Brahma-B15 */
> > +--
> > +2.41.0
> > +
> > diff --git a/recipes-extended/xen/xen_4.17.bb b/recipes-extended/xen/xe=
n_4.17.bb
> > index 9da1b19..bd8f55b 100644
> > --- a/recipes-extended/xen/xen_4.17.bb
> > +++ b/recipes-extended/xen/xen_4.17.bb
> > @@ -7,6 +7,7 @@ XEN_BRANCH ?=3D "stable-${XEN_REL}"
> >  SRC_URI =3D " \
> >      git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
> >      file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-lo=
cation.patch \
> > +    file://0001-arm32-Avoid-using-solaris-syntax-for-.section-direct.p=
atch \
> >      "
> >
> >  LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3Dd1a1e216f80b6d8da95fec897d=
0dbec9"
> > @@ -17,3 +18,6 @@ S =3D "${WORKDIR}/git"
> >
> >  require xen.inc
> >  require xen-hypervisor.inc
> > +
> > +TOOLCHAIN =3D "gcc"
> > +LDFLAGS:remove =3D "-fuse-ld=3Dlld"
> > --
> > 2.41.0
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8154): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/8154
> > Mute This Topic: https://lists.yoctoproject.org/mt/100474396/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub=
 [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

