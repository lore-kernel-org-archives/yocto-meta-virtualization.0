Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC47C77B7C
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 13:19:26 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.49284.1683206361745057525
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 04 May 2023 06:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=l29HM8qL;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-30771c68a9eso43624f8f.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 04 May 2023 06:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683206360; x=1685798360;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xTJ5+3in3bPX2zxHu7Nq6Kf0WeMp1q/jONa3x15+9oE=;
        b=l29HM8qLVpgSjEqtWMfuweJPtEu7zKUim9fG7FWvQ4/1+DPLJ5c38fY/7c0xYM1CvJ
         UItKeF8nPhk77M61BE7YbiQlxB32wDzAX0MMe2I31cVm0q2aFR9lMxpaqxD+m9yaKuj9
         Pt9wvftlGPlS2pLzO6Z6AutaIHFKGBkJB37W6AH4PL7zTFneukrHkv4TFxKLoBZkUfZf
         uoM39+Ue1USrHFbvW3kTFVKCoeugbGGl8zwUoMdZCuKr5ifzhgGxpAOVlX2SvQBlCgke
         /Fa+5E5aHWCAtYNzxh5g17gtmhvdGVMJ2DLZos7qOdhcLBipiiVp3r8doWN45dXlqDr/
         6bzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683206360; x=1685798360;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xTJ5+3in3bPX2zxHu7Nq6Kf0WeMp1q/jONa3x15+9oE=;
        b=F0WImKG1t58QNSPOZAgqBNJf7OqPJVA9HEWdYRii7x9q+oVJ3KUipQb2OSWGGs7clF
         0UI2uSeZmamiu+luhOZKtTav+nWzHY0gn+dOP28VNPdxf9p8xs8YxaKNXNYAmYg8+21L
         48Y7JM7g7FGF4BBzXi2QAWhjqmsOStrT0j6/74Ww/fk66vww/CbvL9imcqQLPdoSAR67
         FfCgmGem1H2Xxs8TVJ3kd0I+zWaFL4eurH3Q0ITk2TXXN5ikpmdtVLg1ebPSwm7+/n3c
         pnmceC0HkPi9RJf3N09aC3zzg7updAE0KSXxrVZRoG5iCOsK7IdcjV3STMjjOQVR8I6+
         cMiw==
X-Gm-Message-State: AC+VfDycO3QcsuYz6q59HZSz0IORx65avonwdCAJ8WXib/5peqiY5Mhn
	vArZnkZg56H41XPGPPRUAg+fS4zhma7lJsuDeNM=
X-Google-Smtp-Source: ACHHUZ4ZAKSAytrS3J7vhjhAhaP98iSopa1pCog1tWZvIke9vjGgkpCrdSLbe28ulw4CGKaVXxyD4Ij/uCvlVJ1+lVE=
X-Received: by 2002:a5d:4a85:0:b0:2ef:bc0b:e70 with SMTP id
 o5-20020a5d4a85000000b002efbc0b0e70mr2830478wrq.54.1683206359976; Thu, 04 May
 2023 06:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230504072905.1065116-1-Martin.Jansa@gmail.com> <CADkTA4OHOjCefJpxcGYVkKGC8zgR60fNcfq_XTfuqdBmhHkhVw@mail.gmail.com>
In-Reply-To: <CADkTA4OHOjCefJpxcGYVkKGC8zgR60fNcfq_XTfuqdBmhHkhVw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 4 May 2023 15:19:06 +0200
Message-ID: <CA+chaQc=u++P8enLdGGcC4X93GLkOZWjMbrM9ft2c1F58Wg7BA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] k3s, kubernetes, nagios-nrpe: fix
 Upstream-Status formatting
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000002b8e3305fade0532"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 04 May 2023 13:19:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8045

--0000000000002b8e3305fade0532
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 4, 2023 at 2:54=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmail=
.com>
wrote:

> For my next presenter's gift, I want a regex that doesn't nitpick us
> on capitals and dashes ;)
>

I agree, but now when 99.9% of Upstream-Status have the right formatting
and there is a QA check to keep or improve the percentage, it might be a
step back to loosen the regexp.

Funny that I'm not seeing this, I haven't inhibited the check completely
> yet.
>

I've noticed because I was building kubernetes trying to figure out why in
some builds it fails with:
ERROR: QA Issue: File /usr/bin/kubelet in package lib32-kubelet doesn't
have GNU_HASH (didn't pass LDFLAGS?) [ldflags]
while in some other builds this isn't triggered.

Then I've noticed that since
'make generated_files GO=3D"go"
KUBE_BUILD_PLATFORMS=3D"${HOST_GOOS}/${BUILD_GOARCH}"' was commented out in=
:
https://git.yoctoproject.org/meta-virtualization/commit/?id=3D8fcd81741740b=
d4702db999923160155f26e1f25
a lot of *FLAGS* assignments in do_compile are now unnecessary as the later
just overwrites the BUILD_* values set before, but that doesn't seem to be
the root cause for missing GNU_HASH.

At this point I admit that I've blacklisted kubernetes in my DISTRO as I
don't normally build it and it was just showing up as failure in my bitbake
world builds (similarly as ceph and other fixes I've sent earlier).

And I do have patch-status-noncore in WARN_QA, but after noticing this,
I've used patchreview script from oe-core to quickly check all .patch files
in meta-virtualization - with small tweak from:
https://patchwork.yoctoproject.org/project/oe-core/patch/20230215172041.636=
292-3-Martin.Jansa@gmail.com/
to make it as strict as insane.bbclass QA check is.

Cheers,

But my jest / complaint notwithstanding, thanks for the patch, I'll
> queue it shortly.
>
> Bruce
>
> On Thu, May 4, 2023 at 3:29=E2=80=AFAM Martin Jansa <Martin.Jansa@gmail.c=
om>
> wrote:
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  .../k3s/k3s/0001-Finding-host-local-in-usr-libexec.patch        | 2 +-
> >  .../0001-hack-lib-golang.sh-use-CC-from-environment.patch       | 2 +-
> >  ...1-Should-fix-235-nasty_metachars-was-not-being-returne.patch | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git
> a/recipes-containers/k3s/k3s/0001-Finding-host-local-in-usr-libexec.patch
> b/recipes-containers/k3s/k3s/0001-Finding-host-local-in-usr-libexec.patch
> > index 524ac2c..12f9941 100644
> > ---
> a/recipes-containers/k3s/k3s/0001-Finding-host-local-in-usr-libexec.patch
> > +++
> b/recipes-containers/k3s/k3s/0001-Finding-host-local-in-usr-libexec.patch
> > @@ -3,7 +3,7 @@ From: Erik Jansson <erikja@axis.com>
> >  Date: Wed, 16 Oct 2019 15:07:48 +0200
> >  Subject: [PATCH] Finding host-local in /usr/libexec
> >
> > -Upstream-status: Inappropriate [embedded specific]
> > +Upstream-Status: Inappropriate [embedded specific]
> >  Signed-off-by: <erikja@axis.com>
> >  ---
> >   pkg/agent/config/config.go | 2 +-
> > diff --git
> a/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC=
-from-environment.patch
> b/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC=
-from-environment.patch
> > index c81bd1a..15e8ffa 100644
> > ---
> a/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC=
-from-environment.patch
> > +++
> b/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC=
-from-environment.patch
> > @@ -5,7 +5,7 @@ Subject: [PATCH 1/2] hack/lib/golang.sh: use CC from
> environment
> >
> >  Toolchain tupples differs, especially when using vendor provides ones.
> >
> > -Upstream-status: Inappropriate [embedded specific]
> > +Upstream-Status: Inappropriate [embedded specific]
> >  Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> >  ---
> >   hack/lib/golang.sh | 5 -----
> > diff --git
> a/recipes-extended/nagios/nagios-nrpe/0001-Should-fix-235-nasty_metachars=
-was-not-being-returne.patch
> b/recipes-extended/nagios/nagios-nrpe/0001-Should-fix-235-nasty_metachars=
-was-not-being-returne.patch
> > index 7a12e73..fb34c5c 100644
> > ---
> a/recipes-extended/nagios/nagios-nrpe/0001-Should-fix-235-nasty_metachars=
-was-not-being-returne.patch
> > +++
> b/recipes-extended/nagios/nagios-nrpe/0001-Should-fix-235-nasty_metachars=
-was-not-being-returne.patch
> > @@ -5,7 +5,7 @@ Subject: [PATCH] Should fix #235 (nasty_metachars was
> not being returned when
> >   specified in cfg file
> >
> >  CVE: CVE-2020-6581
> > -Upstream Status: Backport [4f7dd1199f1f3f72f9197e8565da339a4a2490b7]
> > +Upstream-Status: Backport [4f7dd1199f1f3f72f9197e8565da339a4a2490b7]
> >
> >  Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> >  ---
> > --
> > 2.40.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8043):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8043
> > Mute This Topic: https://lists.yoctoproject.org/mt/98679455/1050810
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

--0000000000002b8e3305fade0532
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, May 4, 2023 at 2:54=E2=80=AFPM Br=
uce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield=
@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">For my next presenter&#39;s gift, I wa=
nt a regex that doesn&#39;t nitpick us<br>
on capitals and dashes ;)<br></blockquote><div><br></div><div>I agree, but =
now when 99.9% of Upstream-Status have the right formatting and there is a =
QA check to keep or improve the percentage, it might be a step back to loos=
en the regexp.</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
Funny that I&#39;m not seeing this, I haven&#39;t inhibited the check compl=
etely yet.<br></blockquote><div><br></div><div>I&#39;ve noticed because I w=
as building=C2=A0kubernetes trying to figure out why in some builds it fail=
s with:</div><div>ERROR: QA Issue: File /usr/bin/kubelet in package lib32-k=
ubelet doesn&#39;t have GNU_HASH (didn&#39;t pass LDFLAGS?) [ldflags]<br></=
div><div>while in some other builds this isn&#39;t triggered.</div><div><br=
></div><div>Then I&#39;ve noticed that since</div><div>&#39;make generated_=
files GO=3D&quot;go&quot; KUBE_BUILD_PLATFORMS=3D&quot;${HOST_GOOS}/${BUILD=
_GOARCH}&quot;&#39; was commented out in:</div><div><a href=3D"https://git.=
yoctoproject.org/meta-virtualization/commit/?id=3D8fcd81741740bd4702db99992=
3160155f26e1f25">https://git.yoctoproject.org/meta-virtualization/commit/?i=
d=3D8fcd81741740bd4702db999923160155f26e1f25</a><br></div><div>a lot of *FL=
AGS* assignments in=C2=A0do_compile are now unnecessary as the later just o=
verwrites the BUILD_* values set before, but that doesn&#39;t seem to be th=
e root cause for missing=C2=A0GNU_HASH.<br></div><div><br></div><div>At thi=
s point I admit that I&#39;ve blacklisted kubernetes in my DISTRO as I don&=
#39;t normally build it and it was just showing up as failure in my bitbake=
 world builds (similarly as ceph and other fixes I&#39;ve sent earlier).</d=
iv><div><br></div><div>And I do have=C2=A0patch-status-noncore in WARN_QA, =
but after noticing this, I&#39;ve used patchreview script from oe-core to q=
uickly check all .patch files in meta-virtualization - with small tweak fro=
m:</div><div><a href=3D"https://patchwork.yoctoproject.org/project/oe-core/=
patch/20230215172041.636292-3-Martin.Jansa@gmail.com/">https://patchwork.yo=
ctoproject.org/project/oe-core/patch/20230215172041.636292-3-Martin.Jansa@g=
mail.com/</a><br></div><div>to make it as strict as insane.bbclass QA check=
 is.</div><div><br></div><div>Cheers,</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
But my jest / complaint notwithstanding, thanks for the patch, I&#39;ll<br>
queue it shortly.<br>
<br>
Bruce<br>
<br>
On Thu, May 4, 2023 at 3:29=E2=80=AFAM Martin Jansa &lt;<a href=3D"mailto:M=
artin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt; wro=
te:<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../k3s/k3s/0001-Finding-host-local-in-usr-libexec.patch=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 .../0001-hack-lib-golang.sh-use-CC-from-environment.patch=C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 ...1-Should-fix-235-nasty_metachars-was-not-being-returne.patch =
| 2 +-<br>
&gt;=C2=A0 3 files changed, 3 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/recipes-containers/k3s/k3s/0001-Finding-host-local-in-usr=
-libexec.patch b/recipes-containers/k3s/k3s/0001-Finding-host-local-in-usr-=
libexec.patch<br>
&gt; index 524ac2c..12f9941 100644<br>
&gt; --- a/recipes-containers/k3s/k3s/0001-Finding-host-local-in-usr-libexe=
c.patch<br>
&gt; +++ b/recipes-containers/k3s/k3s/0001-Finding-host-local-in-usr-libexe=
c.patch<br>
&gt; @@ -3,7 +3,7 @@ From: Erik Jansson &lt;<a href=3D"mailto:erikja@axis.c=
om" target=3D"_blank">erikja@axis.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 16 Oct 2019 15:07:48 +0200<br>
&gt;=C2=A0 Subject: [PATCH] Finding host-local in /usr/libexec<br>
&gt;<br>
&gt; -Upstream-status: Inappropriate [embedded specific]<br>
&gt; +Upstream-Status: Inappropriate [embedded specific]<br>
&gt;=C2=A0 Signed-off-by: &lt;<a href=3D"mailto:erikja@axis.com" target=3D"=
_blank">erikja@axis.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0pkg/agent/config/config.go | 2 +-<br>
&gt; diff --git a/recipes-containers/kubernetes/kubernetes/0001-hack-lib-go=
lang.sh-use-CC-from-environment.patch b/recipes-containers/kubernetes/kuber=
netes/0001-hack-lib-golang.sh-use-CC-from-environment.patch<br>
&gt; index c81bd1a..15e8ffa 100644<br>
&gt; --- a/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh=
-use-CC-from-environment.patch<br>
&gt; +++ b/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh=
-use-CC-from-environment.patch<br>
&gt; @@ -5,7 +5,7 @@ Subject: [PATCH 1/2] hack/lib/golang.sh: use CC from e=
nvironment<br>
&gt;<br>
&gt;=C2=A0 Toolchain tupples differs, especially when using vendor provides=
 ones.<br>
&gt;<br>
&gt; -Upstream-status: Inappropriate [embedded specific]<br>
&gt; +Upstream-Status: Inappropriate [embedded specific]<br>
&gt;=C2=A0 Signed-off-by: Koen Kooi &lt;<a href=3D"mailto:koen.kooi@linaro.=
org" target=3D"_blank">koen.kooi@linaro.org</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0hack/lib/golang.sh | 5 -----<br>
&gt; diff --git a/recipes-extended/nagios/nagios-nrpe/0001-Should-fix-235-n=
asty_metachars-was-not-being-returne.patch b/recipes-extended/nagios/nagios=
-nrpe/0001-Should-fix-235-nasty_metachars-was-not-being-returne.patch<br>
&gt; index 7a12e73..fb34c5c 100644<br>
&gt; --- a/recipes-extended/nagios/nagios-nrpe/0001-Should-fix-235-nasty_me=
tachars-was-not-being-returne.patch<br>
&gt; +++ b/recipes-extended/nagios/nagios-nrpe/0001-Should-fix-235-nasty_me=
tachars-was-not-being-returne.patch<br>
&gt; @@ -5,7 +5,7 @@ Subject: [PATCH] Should fix #235 (nasty_metachars was =
not being returned when<br>
&gt;=C2=A0 =C2=A0specified in cfg file<br>
&gt;<br>
&gt;=C2=A0 CVE: CVE-2020-6581<br>
&gt; -Upstream Status: Backport [4f7dd1199f1f3f72f9197e8565da339a4a2490b7]<=
br>
&gt; +Upstream-Status: Backport [4f7dd1199f1f3f72f9197e8565da339a4a2490b7]<=
br>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@win=
driver.com" target=3D"_blank">sakib.sajal@windriver.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt; --<br>
&gt; 2.40.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#8043): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/8043" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/8043</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/98679455=
/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/mt/98679455/1050810</a><br>
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
</blockquote></div></div>

--0000000000002b8e3305fade0532--

