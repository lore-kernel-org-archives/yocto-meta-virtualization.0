Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2690BD116F1
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 02:48:41 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9321.1764643717737452588
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 18:48:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Zp4QoKga;
 spf=pass (domain: mvista.com, ip: 209.85.208.41, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-640a3317b89so7726265a12.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 01 Dec 2025 18:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1764643716; x=1765248516; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pm/ht0nASXhIc/iU8E4bJ59Ysu+NQW/2ASYXaLMQhLI=;
        b=Zp4QoKga5D6E59bwU71OzKlIlaoDObhgGMpiNymcCw3szlw2YKjZ4arY43NBlRqxqB
         mFG+hSs4pA7lvXeBnFkpNwxaO4BC8aXTqjrV03R4eWhDtPALOfVojzToz7xPpsZadi4N
         MdzvGDQr2QOLEICwI74qPD8B5TV5uAyD0VYA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764643716; x=1765248516;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pm/ht0nASXhIc/iU8E4bJ59Ysu+NQW/2ASYXaLMQhLI=;
        b=OQWjKJcSdAYhLNTKrXl5n4gGs1gUv7QDjoEKwCroTsS/i6vPMy835P+gpl3WPs1dYk
         0JVjgs7/ock+r8GjCn96D+Ntt+fpln1lSpgwfJ8fUf14gcfioy62jGDXr9cJoAGRiL2B
         jeYzAkAfqgRNCKvdq2YNxa9ntZNBQbcxp2rhHAXQa4v1Akujfe2f40c8toQeIPXpsT5Z
         mlIwSCxliPS7BvbnL6WUC0P6GJl/P+9AE7v6YBL601+Z8hjR+6Dkj8WRpRAm5GO7OgoT
         w/4hj1pE5WCXQOcnGoNY3QWJOdRJU1glBbDGPYK4Hon19aLWSx+mpCvTx2sdMBNEh53b
         5APA==
X-Gm-Message-State: AOJu0Yw4QazfZyKjMEHgFFgMB7qBfwjMf6z7jvmk+xE6WBKu1D8R9u4g
	2MlzqsonCyziCWitcOIVSzHXpVF366OOL5RAQCMNSwMtWZLCmJYPzl+4qM8p+CwuK7gxHbqqz5O
	LpEml5ie+XXXlk2hIRyQtwVaUxG2P9FngTCJ/crvXew==
X-Gm-Gg: ASbGncudt1acFTW8lVaF+4vYUZdq99GAfLoDL0oGDHIGevUhwOKD21q4xq6+Sm9WF6U
	ZPyfQAuwwy1oKD8oiKeJ/admvkQuTTDGfo7/lPmeax5Nw6e8e0f46enPjIDUUdMm84x1iVX5B0q
	UpFkxWa0zogErqYzy9AX76AHbUAODKqQzZUQCzo3zs9E7FXD8lw5CFQ0jS1VLt2rCmV49De5XTe
	ImS7M9ChagwLh2o5J+BB1AodwADgVkhosXC0r5xAuFBSgRnupgTFqpov5atwUvzGvlKvs5MrOe2
	zbATMQlq1m3OBLFclDeTH8xrfQ==
X-Google-Smtp-Source: AGHT+IHNO4jgY5ovD/rFqmIKxxL7I+qN1WKToT4ryeZE1+yOCzNVqYdufD6WR2Ip5ZFCp9hIyn9agqWvtLObo6WB9QQ=
X-Received: by 2002:a05:6402:1449:b0:643:4e9c:d164 with SMTP id
 4fb4d7f45d1cf-645eb23f957mr23754859a12.2.1764643715951; Mon, 01 Dec 2025
 18:48:35 -0800 (PST)
MIME-Version: 1.0
References: <20251110113049.120549-1-vanusuri@mvista.com> <20251110113049.120549-2-vanusuri@mvista.com>
 <aS482uMvjz7PCB2Y@gmail.com>
In-Reply-To: <aS482uMvjz7PCB2Y@gmail.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Tue, 2 Dec 2025 08:18:24 +0530
X-Gm-Features: AWmQ_bkIgCHDwgO9uvmmfC4fmEWABHn0gyOec0keYlos7oBKtYX-9p3_ptm9-kI
Message-ID: <CANQUz19+66fM5nGVWzBR134c_VADBG5OKs_+fRXakY4bY0VpkQ@mail.gmail.com>
Subject: Re: [meta-virtualization][kirkstone][PATCH 2/2] containerd-opencontainers:
 fix CVE-2025-64329
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000d83da10644ef21be"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 02 Dec 2025 02:48:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9466

--000000000000d83da10644ef21be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

Patch 1/2 (containerd-opencontainers: fix CVE-2024-25621) appears to have
already been merged.

Patch 1/2 :
https://git.yoctoproject.org/meta-virtualization/commit/?h=3Dkirkstone&id=
=3D9f4afbb21a91eab9917a25811f1d2ba7d223e071
Patch 2/2 :
https://git.yoctoproject.org/meta-virtualization/commit/?h=3Dkirkstone&id=
=3D4da521b4440f57b10ba70091ee0e31b1085e665e

Since the patches were merged, I wanted to confirm with you before
resending them.
If you would still like me to resend the patches, I can do so.

Thanks & Regards,
Vijay

On Tue, Dec 2, 2025 at 6:41=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gmail=
.com>
wrote:

> This patch says 2/2, but I can't find patch 1/2. What was the
> subject of 1/2 ? Or rather than just telling me the subject, if
> you resend it, that would be great.
>
> Bruce
>
> In message: [meta-virtualization][kirkstone][PATCH 2/2]
> containerd-opencontainers: fix CVE-2025-64329
> on 10/11/2025 Vijay Anusuri via lists.yoctoproject.org wrote:
>
> > From: Vijay Anusuri <vanusuri@mvista.com>
> >
> > Upstream-Status: Backport from
> https://github.com/containerd/containerd/commit/c575d1b5f4011f33b32f71ace=
75367a92b08c750
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  .../CVE-2025-64329.patch                      | 80 +++++++++++++++++++
> >  .../containerd-opencontainers_git.bb          |  1 +
> >  2 files changed, 81 insertions(+)
> >  create mode 100644
> recipes-containers/containerd/containerd-opencontainers/CVE-2025-64329.pa=
tch
> >
> > diff --git
> a/recipes-containers/containerd/containerd-opencontainers/CVE-2025-64329.=
patch
> b/recipes-containers/containerd/containerd-opencontainers/CVE-2025-64329.=
patch
> > new file mode 100644
> > index 00000000..a3cc5e85
> > --- /dev/null
> > +++
> b/recipes-containers/containerd/containerd-opencontainers/CVE-2025-64329.=
patch
> > @@ -0,0 +1,80 @@
> > +From c575d1b5f4011f33b32f71ace75367a92b08c750 Mon Sep 17 00:00:00 2001
> > +From: wheat2018 <1151937289@qq.com>
> > +Date: Tue, 13 Aug 2024 15:56:31 +0800
> > +Subject: [PATCH] fix goroutine leak of container Attach
> > +
> > +The monitor goroutine (runs (*ContainerIO).Attach.func1) of Attach wil=
l
> > +never finish if it attaches to a container without any stdout or stder=
r
> > +output. Wait for http context cancel and break the pipe actively to
> > +address the issue.
> > +
> > +Signed-off-by: wheat2018 <1151937289@qq.com>
> > +Signed-off-by: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
> > +(cherry picked from commit a0d0f0ef68935338d2c710db164fa7820f692530)
> > +Signed-off-by: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
> > +
> > +Excluded pkg/cri/sbserver/container_attach.go changes as the file not
> > +present in our current vrsion 1.6.19
> > +
> > +Upstream-Status: Backport [
> https://github.com/containerd/containerd/commit/c575d1b5f4011f33b32f71ace=
75367a92b08c750
> ]
> > +CVE: CVE-2025-64329
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + pkg/cri/io/container_io.go         | 14 +++++++++++---
> > + pkg/cri/server/container_attach.go |  2 +-
> > + 2 files changed, 12 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/pkg/cri/io/container_io.go b/pkg/cri/io/container_io.go
> > +index 70bc8b789..e1584100f 100644
> > +--- a/pkg/cri/io/container_io.go
> > ++++ b/pkg/cri/io/container_io.go
> > +@@ -17,6 +17,7 @@
> > + package io
> > +
> > + import (
> > ++    "context"
> > +     "errors"
> > +     "io"
> > +     "strings"
> > +@@ -134,7 +135,7 @@ func (c *ContainerIO) Pipe() {
> > +
> > + // Attach attaches container stdio.
> > + // TODO(random-liu): Use pools.Copy in docker to reduce memory usage?
> > +-func (c *ContainerIO) Attach(opts AttachOptions) {
> > ++func (c *ContainerIO) Attach(ctx context.Context, opts AttachOptions)=
 {
> > +     var wg sync.WaitGroup
> > +     key :=3D util.GenerateID()
> > +     stdinKey :=3D streamKey(c.id, "attach-"+key, Stdin)
> > +@@ -175,8 +176,15 @@ func (c *ContainerIO) Attach(opts AttachOptions) =
{
> > +     }
> > +
> > +     attachStream :=3D func(key string, close <-chan struct{}) {
> > +-            <-close
> > +-            logrus.Infof("Attach stream %q closed", key)
> > ++            select {
> > ++            case <-close:
> > ++                    logrus.Infof("Attach stream %q closed", key)
> > ++            case <-ctx.Done():
> > ++                    logrus.Infof("Attach client of %q cancelled", key=
)
> > ++                    // Avoid writeGroup heap up
> > ++                    c.stdoutGroup.Remove(key)
> > ++                    c.stderrGroup.Remove(key)
> > ++            }
> > +             // Make sure stdin gets closed.
> > +             if stdinStreamRC !=3D nil {
> > +                     stdinStreamRC.Close()
> > +diff --git a/pkg/cri/server/container_attach.go
> b/pkg/cri/server/container_attach.go
> > +index a95215051..3625229f9 100644
> > +--- a/pkg/cri/server/container_attach.go
> > ++++ b/pkg/cri/server/container_attach.go
> > +@@ -79,6 +79,6 @@ func (c *criService) attachContainer(ctx
> context.Context, id string, stdin io.Re
> > +             },
> > +     }
> > +     // TODO(random-liu): Figure out whether we need to support
> historical output.
> > +-    cntr.IO.Attach(opts)
> > ++    cntr.IO.Attach(ctx, opts)
> > +     return nil
> > + }
> > +--
> > +2.25.1
> > +
> > diff --git a/recipes-containers/containerd/
> containerd-opencontainers_git.bb b/recipes-containers/containerd/
> containerd-opencontainers_git.bb
> > index 264d37a6..05683d26 100644
> > --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> > +++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
> > @@ -11,6 +11,7 @@ SRC_URI =3D "git://
> github.com/containerd/containerd;branch=3Drelease/1.6;protocol=3Dht
> >             file://0001-build-don-t-use-gcflags-to-define-trimpath.patc=
h
> \
> >             file://CVE-2024-40635.patch \
> >             file://CVE-2024-25621.patch \
> > +           file://CVE-2025-64329.patch \
> >            "
> >
> >  # Apache-2.0 for containerd
> > --
> > 2.25.1
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#9437):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9437
> > Mute This Topic: https://lists.yoctoproject.org/mt/116217320/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--000000000000d83da10644ef21be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Hi Bruce,<br><br></div>Patch 1/2 (cont=
ainerd-opencontainers: fix CVE-2024-25621) appears to have already been mer=
ged.<br><br></div></div>Patch 1/2 : <a href=3D"https://git.yoctoproject.org=
/meta-virtualization/commit/?h=3Dkirkstone&amp;id=3D9f4afbb21a91eab9917a258=
11f1d2ba7d223e071">https://git.yoctoproject.org/meta-virtualization/commit/=
?h=3Dkirkstone&amp;id=3D9f4afbb21a91eab9917a25811f1d2ba7d223e071</a></div><=
div>Patch 2/2 : <a href=3D"https://git.yoctoproject.org/meta-virtualization=
/commit/?h=3Dkirkstone&amp;id=3D4da521b4440f57b10ba70091ee0e31b1085e665e">h=
ttps://git.yoctoproject.org/meta-virtualization/commit/?h=3Dkirkstone&amp;i=
d=3D4da521b4440f57b10ba70091ee0e31b1085e665e</a></div><div><br></div><div>S=
ince the patches were merged, I wanted to confirm with you before resending=
 them.<br>
If you would still like me to resend the patches, I can do so.<br><br></div=
><div>Thanks &amp; Regards,<br></div><div>Vijay</div></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, Dec 2, 2025 at 6:41=E2=80=AFAM Bruce Ashfield &lt;<a href=3D"mail=
to:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">This patch says 2/2, b=
ut I can&#39;t find patch 1/2. What was the<br>
subject of 1/2 ? Or rather than just telling me the subject, if<br>
you resend it, that would be great.<br>
<br>
Bruce<br>
<br>
In message: [meta-virtualization][kirkstone][PATCH 2/2] containerd-opencont=
ainers: fix CVE-2025-64329<br>
on 10/11/2025 Vijay Anusuri via <a href=3D"http://lists.yoctoproject.org" r=
el=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> wrote:<br>
<br>
&gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=
=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; <br>
&gt; Upstream-Status: Backport from <a href=3D"https://github.com/container=
d/containerd/commit/c575d1b5f4011f33b32f71ace75367a92b08c750" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/containerd/containerd/commit/c57=
5d1b5f4011f33b32f71ace75367a92b08c750</a><br>
&gt; <br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../CVE-2025-64329.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 80 +++++++++++++++++++<br>
&gt;=C2=A0 .../<a href=3D"http://containerd-opencontainers_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">containerd-opencontainers_git.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 81 insertions(+)<br>
&gt;=C2=A0 create mode 100644 recipes-containers/containerd/containerd-open=
containers/CVE-2025-64329.patch<br>
&gt; <br>
&gt; diff --git a/recipes-containers/containerd/containerd-opencontainers/C=
VE-2025-64329.patch b/recipes-containers/containerd/containerd-opencontaine=
rs/CVE-2025-64329.patch<br>
&gt; new file mode 100644<br>
&gt; index 00000000..a3cc5e85<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-containers/containerd/containerd-opencontainers/CVE-2025=
-64329.patch<br>
&gt; @@ -0,0 +1,80 @@<br>
&gt; +From c575d1b5f4011f33b32f71ace75367a92b08c750 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: wheat2018 &lt;<a href=3D"mailto:1151937289@qq.com" target=3D"_b=
lank">1151937289@qq.com</a>&gt;<br>
&gt; +Date: Tue, 13 Aug 2024 15:56:31 +0800<br>
&gt; +Subject: [PATCH] fix goroutine leak of container Attach<br>
&gt; +<br>
&gt; +The monitor goroutine (runs (*ContainerIO).Attach.func1) of Attach wi=
ll<br>
&gt; +never finish if it attaches to a container without any stdout or stde=
rr<br>
&gt; +output. Wait for http context cancel and break the pipe actively to<b=
r>
&gt; +address the issue.<br>
&gt; +<br>
&gt; +Signed-off-by: wheat2018 &lt;<a href=3D"mailto:1151937289@qq.com" tar=
get=3D"_blank">1151937289@qq.com</a>&gt;<br>
&gt; +Signed-off-by: Akihiro Suda &lt;<a href=3D"mailto:akihiro.suda.cz@hco=
.ntt.co.jp" target=3D"_blank">akihiro.suda.cz@hco.ntt.co.jp</a>&gt;<br>
&gt; +(cherry picked from commit a0d0f0ef68935338d2c710db164fa7820f692530)<=
br>
&gt; +Signed-off-by: Akihiro Suda &lt;<a href=3D"mailto:akihiro.suda.cz@hco=
.ntt.co.jp" target=3D"_blank">akihiro.suda.cz@hco.ntt.co.jp</a>&gt;<br>
&gt; +<br>
&gt; +Excluded pkg/cri/sbserver/container_attach.go changes as the file not=
<br>
&gt; +present in our current vrsion 1.6.19<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/containerd/c=
ontainerd/commit/c575d1b5f4011f33b32f71ace75367a92b08c750" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/containerd/containerd/commit/c575d1=
b5f4011f33b32f71ace75367a92b08c750</a>]<br>
&gt; +CVE: CVE-2025-64329<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + pkg/cri/io/container_io.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 +++=
++++++++---<br>
&gt; + pkg/cri/server/container_attach.go |=C2=A0 2 +-<br>
&gt; + 2 files changed, 12 insertions(+), 4 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/pkg/cri/io/container_io.go b/pkg/cri/io/container_io.go<=
br>
&gt; +index 70bc8b789..e1584100f 100644<br>
&gt; +--- a/pkg/cri/io/container_io.go<br>
&gt; ++++ b/pkg/cri/io/container_io.go<br>
&gt; +@@ -17,6 +17,7 @@<br>
&gt; + package io<br>
&gt; + <br>
&gt; + import (<br>
&gt; ++=C2=A0 =C2=A0 &quot;context&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;errors&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;io&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;strings&quot;<br>
&gt; +@@ -134,7 +135,7 @@ func (c *ContainerIO) Pipe() {<br>
&gt; + <br>
&gt; + // Attach attaches container stdio.<br>
&gt; + // TODO(random-liu): Use pools.Copy in docker to reduce memory usage=
?<br>
&gt; +-func (c *ContainerIO) Attach(opts AttachOptions) {<br>
&gt; ++func (c *ContainerIO) Attach(ctx context.Context, opts AttachOptions=
) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0var wg sync.WaitGroup<br>
&gt; +=C2=A0 =C2=A0 =C2=A0key :=3D util.GenerateID()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0stdinKey :=3D streamKey(<a href=3D"http://c.id" r=
el=3D"noreferrer" target=3D"_blank">c.id</a>, &quot;attach-&quot;+key, Stdi=
n)<br>
&gt; +@@ -175,8 +176,15 @@ func (c *ContainerIO) Attach(opts AttachOptions)=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0attachStream :=3D func(key string, close &lt;-cha=
n struct{}) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;-close<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logrus.Infof(&quot;Attach =
stream %q closed&quot;, key)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 select {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &lt;-close:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 logrus.Infof(&quot;Attach stream %q closed&quot;, key)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &lt;-ctx.Done():<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 logrus.Infof(&quot;Attach client of %q cancelled&quot;, key)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // Avoid writeGroup heap up<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 c.stdoutGroup.Remove(key)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 c.stderrGroup.Remove(key)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Make sure stdin ge=
ts closed.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if stdinStreamRC !=3D=
 nil {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0stdinStreamRC.Close()<br>
&gt; +diff --git a/pkg/cri/server/container_attach.go b/pkg/cri/server/cont=
ainer_attach.go<br>
&gt; +index a95215051..3625229f9 100644<br>
&gt; +--- a/pkg/cri/server/container_attach.go<br>
&gt; ++++ b/pkg/cri/server/container_attach.go<br>
&gt; +@@ -79,6 +79,6 @@ func (c *criService) attachContainer(ctx context.Co=
ntext, id string, stdin io.Re<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// TODO(random-liu): Figure out whether we need t=
o support historical output.<br>
&gt; +-=C2=A0 =C2=A0 cntr.IO.Attach(opts)<br>
&gt; ++=C2=A0 =C2=A0 cntr.IO.Attach(ctx, opts)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return nil<br>
&gt; + }<br>
&gt; +-- <br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/recipes-containers/containerd/<a href=3D"http://container=
d-opencontainers_git.bb" rel=3D"noreferrer" target=3D"_blank">containerd-op=
encontainers_git.bb</a> b/recipes-containers/containerd/<a href=3D"http://c=
ontainerd-opencontainers_git.bb" rel=3D"noreferrer" target=3D"_blank">conta=
inerd-opencontainers_git.bb</a><br>
&gt; index 264d37a6..05683d26 100644<br>
&gt; --- a/recipes-containers/containerd/<a href=3D"http://containerd-openc=
ontainers_git.bb" rel=3D"noreferrer" target=3D"_blank">containerd-openconta=
iners_git.bb</a><br>
&gt; +++ b/recipes-containers/containerd/<a href=3D"http://containerd-openc=
ontainers_git.bb" rel=3D"noreferrer" target=3D"_blank">containerd-openconta=
iners_git.bb</a><br>
&gt; @@ -11,6 +11,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com=
/containerd/containerd;branch=3Drelease/1.6;protocol=3Dht" rel=3D"noreferre=
r" target=3D"_blank">github.com/containerd/containerd;branch=3Drelease/1.6;=
protocol=3Dht</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-build-don-t=
-use-gcflags-to-define-trimpath.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-40635.p=
atch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-25621.p=
atch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-64329.patch =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Apache-2.0 for containerd<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#9437): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/9437" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/9437</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/11621732=
0/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.=
org/mt/116217320/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000d83da10644ef21be--

