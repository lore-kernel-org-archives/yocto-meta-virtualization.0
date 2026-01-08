Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE283D185F3
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 13:21:41 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6170.1767878494711177201
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 08 Jan 2026 05:21:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ojhs4c/o;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-bcfd82f55ebso865233a12.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 05:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767878494; x=1768483294; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uzRJDYnsujYbI6ueY6jUcGaRsJ9k7wlJEfJ8qoYcqyU=;
        b=Ojhs4c/oicv8NJrTCT0/cVZgQX2Mbc7R7kfCJeY8ZxRPPSofQ46Po3g+C3Lv38AHjg
         g4MMFI7iuQLQ4AZuSZLvjEspps7Q+qM3UlZOFOt01Aq21ZGqXv1N16QbRUxmhmSfRq+f
         X6ugLZXmFDkOnrTgvwxBFNGLDFe6u4ydLmsrp9mcIC4H/1dejT75JenOWPDSdlRxcqAB
         1klBK0oH93tRo8KxnipOin6bIiuCyi+Njuq7ZpmLZkpuXoga9+IXlSA2rclTfuIk44fR
         niBUYCeqTqzF08qkpTMdrq8tOZv3owxoEm7/NYg+V77LEnRcVm4hbGD5caFzSZdt0e00
         SQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767878494; x=1768483294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzRJDYnsujYbI6ueY6jUcGaRsJ9k7wlJEfJ8qoYcqyU=;
        b=X8s804gbp8maGAVdiU2XXEzCNS3Klq1zZ2Dj3wtJ9QqouDqKc4jbXHWf4mJWx1242e
         g/BHZjbjic5p4WWxfBbz++SpV+N+3M1MihWbJxD2UDebxnpvaar0jQ65M1LMUR2mvMoh
         ZlUawDQqC1zxQk3UER026idkYqLO42a3glmooU1Ydtytt3qKs9d+5zqKqjoBkQqQwjlG
         YWsf7tWfFheahxeQXQ+e87iV41kjBuch6peew4C6vmHQar/Ug4JExJv0TUU57BbDb/0T
         mB3xBqtTJ0TRbS7B8PBVX9qnXX5rUgxtlB4kXcI0bwe2yJx5cveUGijyRECLwyELsq6l
         eKZA==
X-Gm-Message-State: AOJu0YxzdRnR6lmY3quoWRMs7CPLLB6CnOo2c1LgSKw2WlfNC2aDwTFx
	o3jUJX1SqZ3xjGrp4s9aioH9DFNbR6PIex49UuylSGlLiBS+ZhRx5elpuVuT78Yntb3XyPRhc3a
	vEzf4Y+QSOmYbgtTb1u130Ktc+TVh6oq+X9cSGr0=
X-Gm-Gg: AY/fxX4F0iPd8QxZzctzSHZvOQ9mTGqE+S2FR5pOHh58LAVQ/cBXrMkzoqTHwMceW4Y
	fj9Mzur+FNOmmJOwSJxhFatNJlJPD91SdU34APpXdVXIvZKcyj10Cr3/frHATwFE0IeSYMt4xjn
	CO2ATcSiD8ezTAvniOKqSin/f0w/+5kTHSSxT5GT8mVocYuXu7FSDgQdhUJtSHa76gWbwq9v3ST
	RB6y8s31CCYT69mdOIuHdtEsp3q4Pe+1bT0ejk7Rd7Z5TyyhjICyA0cKHXJ7UWbnc1D+dd9
X-Google-Smtp-Source: AGHT+IEFhksIO8LsrdwBGDabKjUX+wpPh4WJkO801oxjN/XQZ0mHR71AX/r2lOSSm4txH8cKrfr+4hmUJ/fTR7JNN1g=
X-Received: by 2002:a17:903:1ce:b0:296:547a:4bf2 with SMTP id
 d9443c01a7336-2a3edba6a48mr56428405ad.27.1767878493595; Thu, 08 Jan 2026
 05:21:33 -0800 (PST)
MIME-Version: 1.0
References: <20260108062628.3636344-1-changqing.li@windriver.com>
In-Reply-To: <20260108062628.3636344-1-changqing.li@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 8 Jan 2026 08:21:22 -0500
X-Gm-Features: AQt7F2qRaVDtEHag_dsEmX9w0JDUHcKQeMU6gYR5RBvO15rlWBu-U9XN8SQLF_U
Message-ID: <CADkTA4MB=AckiSmwRHJFjg_X2oYCCfRTEFydoWs2TNqDJK=7rw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 00/15] set go buildid to empty for
 improving reproducibility
To: changqing.li@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000009dee080647e049c5"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 13:21:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9547

--0000000000009dee080647e049c5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 1:26=E2=80=AFAM Changqing Li via lists.yoctoproject.=
org <
changqing.li=3Dwindriver.com@lists.yoctoproject.org> wrote:

> From: Changqing Li <changqing.li@windriver.com>
>
> These series of patches are mostly set buildid to empty for improving
> reproducibility, I also send a patch to oe-core with subject:
> [PATCH V3] go.bbclass: set buildid to empty string to improve
> reproducibility
>
> which add -buildid=3D in default GO_LDFLAGS, but since packages compiled
> with go may not use GO_LDFLAGS in go.bbclass, they can have their own
> Makefiles, define their own variables for passing ldflags, so change
> them one by one.
>

Rather than setting it to empty, I'd rather set it to a value that might
be useful to us.

Perhaps the git hash we are building ? or the checksum of another
set of files ?

Bruce



>
> podman also disable buildvcs
>
> Changqing Li (15):
>   docker-compose: set go buildid to empty for improving reproducibility
>   docker: set go buildid to empty for improving reproducibility
>   kubernetes: set go buildid to empty for improving reproducibility
>   nerdctl: set go buildid to empty for improving reproducibility
>   runc: set go buildid to empty for improving reproducibility
>   skopeo: set go buildid to empty for improving reproducibility
>   umoci: set go buildid to empty for improving reproducibility
>   cni: update GO_EXTRA_LDFLAGS
>   oci-image-tools: set go buildid to empty for improving reproducibility
>   docker-distribution: set go buildid to empty for improving
>     reproducibility
>   containerd: set go buildid to empty for improving reproducibility
>   cri-o: set go buildid to empty for improving reproducibility
>   cri-tools: set go buildid to empty for improving reproducibility
>   oci-runtime-tools: set go buildid to empty for improving
>     reproducibility
>   podman: improve reproducibility
>
>  .../containerd/containerd_git.bb              |  1 +
>  recipes-containers/cri-o/cri-o_git.bb         |  1 +
>  recipes-containers/cri-tools/cri-tools_git.bb |  2 +-
>  .../docker-compose/docker-compose_git.bb      |  4 +-
>  .../docker-distribution_git.bb                |  2 +
>  ...01-Makefile-remove-duplicate-ldflags.patch | 39 +++++++++++++++++++
>  recipes-containers/docker/docker.inc          |  2 +
>  .../kubernetes/kubernetes_git.bb              |  2 +-
>  recipes-containers/nerdctl/nerdctl_git.bb     |  1 +
>  .../0001-Makefile-add-EXTRA_LDFLAGS.patch     | 39 +++++++++++++++++++
>  .../oci-image-tools/oci-image-tools_git.bb    |  5 ++-
>  .../0001-Makefile-add-EXTRA_LDFLAGS.patch     | 33 ++++++++++++++++
>  .../oci-runtime-tools_git.bb                  |  2 +
>  recipes-containers/podman/podman_git.bb       |  4 +-
>  recipes-containers/runc/runc.inc              |  1 +
>  recipes-containers/skopeo/skopeo_git.bb       |  2 +-
>  recipes-containers/umoci/umoci_git.bb         |  4 +-
>  recipes-networking/cni/cni_git.bb             |  4 +-
>  18 files changed, 138 insertions(+), 10 deletions(-)
>  create mode 100644
> recipes-containers/docker-distribution/files/0001-Makefile-remove-duplica=
te-ldflags.patch
>  create mode 100644
> recipes-containers/oci-image-tools/files/0001-Makefile-add-EXTRA_LDFLAGS.=
patch
>  create mode 100644
> recipes-containers/oci-runtime-tools/files/0001-Makefile-add-EXTRA_LDFLAG=
S.patch
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9531):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9531
> Mute This Topic: https://lists.yoctoproject.org/mt/117148688/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000009dee080647e049c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 8, 2026 at 1:26=
=E2=80=AFAM Changqing Li via <a href=3D"http://lists.yoctoproject.org">list=
s.yoctoproject.org</a> &lt;<a href=3D"http://changqing.li">changqing.li</a>=
=3D<a href=3D"mailto:windriver.com@lists.yoctoproject.org">windriver.com@li=
sts.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">From: Changqing Li &lt;<a href=3D"mailto:changqing.li@w=
indriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
<br>
These series of patches are mostly set buildid to empty for improving<br>
reproducibility, I also send a patch to oe-core with subject: <br>
[PATCH V3] go.bbclass: set buildid to empty string to improve reproducibili=
ty<br>
<br>
which add -buildid=3D in default GO_LDFLAGS, but since packages compiled<br=
>
with go may not use GO_LDFLAGS in go.bbclass, they can have their own<br>
Makefiles, define their own variables for passing ldflags, so change<br>
them one by one.<br></blockquote><div><br></div><div><div class=3D"gmail_de=
fault" style=3D"font-size:small">Rather than setting it to empty, I&#39;d r=
ather set it to a value that might</div><div class=3D"gmail_default" style=
=3D"font-size:small">be useful to us.</div><div class=3D"gmail_default" sty=
le=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font=
-size:small">Perhaps the git hash we are building ? or the checksum of anot=
her</div><div class=3D"gmail_default" style=3D"font-size:small">set of file=
s ?</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
podman also disable buildvcs<br>
<br>
Changqing Li (15):<br>
=C2=A0 docker-compose: set go buildid to empty for improving reproducibilit=
y<br>
=C2=A0 docker: set go buildid to empty for improving reproducibility<br>
=C2=A0 kubernetes: set go buildid to empty for improving reproducibility<br=
>
=C2=A0 nerdctl: set go buildid to empty for improving reproducibility<br>
=C2=A0 runc: set go buildid to empty for improving reproducibility<br>
=C2=A0 skopeo: set go buildid to empty for improving reproducibility<br>
=C2=A0 umoci: set go buildid to empty for improving reproducibility<br>
=C2=A0 cni: update GO_EXTRA_LDFLAGS<br>
=C2=A0 oci-image-tools: set go buildid to empty for improving reproducibili=
ty<br>
=C2=A0 docker-distribution: set go buildid to empty for improving<br>
=C2=A0 =C2=A0 reproducibility<br>
=C2=A0 containerd: set go buildid to empty for improving reproducibility<br=
>
=C2=A0 cri-o: set go buildid to empty for improving reproducibility<br>
=C2=A0 cri-tools: set go buildid to empty for improving reproducibility<br>
=C2=A0 oci-runtime-tools: set go buildid to empty for improving<br>
=C2=A0 =C2=A0 reproducibility<br>
=C2=A0 podman: improve reproducibility<br>
<br>
=C2=A0.../containerd/<a href=3D"http://containerd_git.bb" rel=3D"noreferrer=
" target=3D"_blank">containerd_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0recipes-containers/cri-o/<a href=3D"http://cri-o_git.bb" rel=3D"noref=
errer" target=3D"_blank">cri-o_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 1 +<br>
=C2=A0recipes-containers/cri-tools/<a href=3D"http://cri-tools_git.bb" rel=
=3D"noreferrer" target=3D"_blank">cri-tools_git.bb</a> |=C2=A0 2 +-<br>
=C2=A0.../docker-compose/<a href=3D"http://docker-compose_git.bb" rel=3D"no=
referrer" target=3D"_blank">docker-compose_git.bb</a>=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 4 +-<br>
=C2=A0.../<a href=3D"http://docker-distribution_git.bb" rel=3D"noreferrer" =
target=3D"_blank">docker-distribution_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +<br>
=C2=A0...01-Makefile-remove-duplicate-ldflags.patch | 39 ++++++++++++++++++=
+<br>
=C2=A0recipes-containers/docker/docker.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 +<br>
=C2=A0.../kubernetes/<a href=3D"http://kubernetes_git.bb" rel=3D"noreferrer=
" target=3D"_blank">kubernetes_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0recipes-containers/nerdctl/<a href=3D"http://nerdctl_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">nerdctl_git.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
1 +<br>
=C2=A0.../0001-Makefile-add-EXTRA_LDFLAGS.patch=C2=A0 =C2=A0 =C2=A0| 39 +++=
++++++++++++++++<br>
=C2=A0.../oci-image-tools/<a href=3D"http://oci-image-tools_git.bb" rel=3D"=
noreferrer" target=3D"_blank">oci-image-tools_git.bb</a>=C2=A0 =C2=A0 |=C2=
=A0 5 ++-<br>
=C2=A0.../0001-Makefile-add-EXTRA_LDFLAGS.patch=C2=A0 =C2=A0 =C2=A0| 33 +++=
+++++++++++++<br>
=C2=A0.../<a href=3D"http://oci-runtime-tools_git.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">oci-runtime-tools_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +<br>
=C2=A0recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">podman_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 4 +-<br>
=C2=A0recipes-containers/runc/runc.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0recipes-containers/skopeo/<a href=3D"http://skopeo_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">skopeo_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 +-<br>
=C2=A0recipes-containers/umoci/<a href=3D"http://umoci_git.bb" rel=3D"noref=
errer" target=3D"_blank">umoci_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 4 +-<br>
=C2=A0recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"noreferre=
r" target=3D"_blank">cni_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 4 +-<br>
=C2=A018 files changed, 138 insertions(+), 10 deletions(-)<br>
=C2=A0create mode 100644 recipes-containers/docker-distribution/files/0001-=
Makefile-remove-duplicate-ldflags.patch<br>
=C2=A0create mode 100644 recipes-containers/oci-image-tools/files/0001-Make=
file-add-EXTRA_LDFLAGS.patch<br>
=C2=A0create mode 100644 recipes-containers/oci-runtime-tools/files/0001-Ma=
kefile-add-EXTRA_LDFLAGS.patch<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9531): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9531" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9531</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/117148688/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/117148688/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000009dee080647e049c5--

