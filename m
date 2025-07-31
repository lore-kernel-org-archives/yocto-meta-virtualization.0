Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6123EC87FCC
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 17:42:22 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.68461.1753983733175340952
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 31 Jul 2025 10:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bzAEIvfY;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-31f325c1bc1so1264792a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Jul 2025 10:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753983732; x=1754588532; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KFpj1YbZI6E5IThfxg9ugk1Z8D1d71+t0o1NqkL6ie4=;
        b=bzAEIvfYgHPqQmNWSNwGnlaF5N15Gf+3BkH402sORKWz85GW4UbKSFRaGYC1poOr7W
         I7h+AnaLTFvwMFnVEOhtFmXzSMvZcRCtIFcR75hl5/DnXBPkYDbp4QraOx9AAYlX/yfp
         gDyUm5sDFWhB+2oFUmqIHNH72vp/yKVc7PqEv3QOkjNC8y8ACrGRVQZEOJ/SD6O8K65v
         M/mn3/m5Bp90YQTE2iu0PbXUxyj/ST0yI6nQJHwkVk/eLgzDnFzo4n7YoUApzYpYt8r3
         nS+WZVKAtP2zncvxw5wT9nizI/TafvWunF/daIhcHX9y8mEJnFX9pX8+VQB6vbwVpZYd
         heTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753983732; x=1754588532;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KFpj1YbZI6E5IThfxg9ugk1Z8D1d71+t0o1NqkL6ie4=;
        b=XG5IgeaZR4OXGQTXh0bfZkau1utSrs67KIPllIa+D1oN1+IfpocAZH+gPRwWRpPgOo
         d+mVKvwT8sFULOHYJElz8q77hZB0OHDydnOnlGjHSTrmDg67olT6e1oBtoavZsdkFUyt
         Z871SiXrO3wCD15o3uU4IpA9W6wptJ2E0GMXjNBvlkpsTz1WzcqR1xVVl5A/GE3TgymA
         SJ26LVx1bbTgs3s5wlGC1iqkErGPSCSohqWnenUfvipSBAbiko3WN4V+B0qUzatPiN8L
         YQFcEAVYWUNuA0y0O+UdN31VJzo/cJx3jjn8pg+S2YC3o108uH6qZoYE97iuo09cgIhR
         Dynw==
X-Gm-Message-State: AOJu0Yz4ALCdlMHAKTtJ6CQzpUL/zNx729MD0ltrE4E/r3HKIk5YEHV+
	nn8WD1JLYFJMT6sRpehSZnP3voqb56+08pAj/bgdojUttxKaUb16899FQzPxNkGi6vR/EgOCN/h
	tQFBAc89a1dCnzFGBJ/kRYZKWtRaHjfA=
X-Gm-Gg: ASbGnctA3Wy9V/98KP/OMWaIBmmehO60vJZeQy0FZsCBy0yiEeVcX0II1AgBwgOOOVa
	vSWisD612OKcNLkIpvit8M/rkJcpPoJEYx4zNIRluhVOU/W84M43xuLyes7Usk5yakeLr7AsXlq
	4WgEhdvroLbs8DtcfD0iUzGMHmINCca+lII8SHY8+/ulaS8l/yAcU+YRQoUHPGLcZ7n0RV6ZD+u
	Bqf0+E=
X-Google-Smtp-Source: AGHT+IHlg1XEfzQZZeH40bFbkQwzdYSetemNRrlNEM4VGm0o0BWuBCLGFagQlLjRVfqekiG/li1sgkzEbFhnSRrQQSU=
X-Received: by 2002:a17:90b:3f8c:b0:31e:f3b7:49c6 with SMTP id
 98e67ed59e1d1-31f5ddec334mr11974807a91.15.1753983732226; Thu, 31 Jul 2025
 10:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <aH2oBWMowUl8f7+U@gmail.com> <20250721101900.759952-1-sudumbha@cisco.com>
In-Reply-To: <20250721101900.759952-1-sudumbha@cisco.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 31 Jul 2025 13:41:57 -0400
X-Gm-Features: Ac12FXyGA2ihY1gkFqsTLTk9Lf2T3aqdvZsJ4F2oBpNoYMgC5GnTKkglozMs1fM
Message-ID: <CADkTA4NJGGOKRDuVmOGdGkLVE4iN+CaYu=Zb8y9AGP734anO=g@mail.gmail.com>
Subject: Re: [meta-virtualization] [scarthgap] [PATCH] docker-moby 25.0.3: fix CVE-2024-36623
To: sudumbha@cisco.com
Cc: meta-virtualization@lists.yoctoproject.org, xe-linux-external@cisco.com, 
	vchavda@cisco.com
Content-Type: multipart/alternative; boundary="0000000000004d201a063b3d2954"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Jul 2025 17:42:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9334

--0000000000004d201a063b3d2954
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the slow reply, I've been working on package uprevs for the M3
builds and am just getting to this now.

How are you sending this patch ? It is still failing patch detection by git
am , so I can't apply it to the tree.

Bruce

On Mon, Jul 21, 2025 at 6:19=E2=80=AFAM Sudhir Dumbhare -X (sudumbha - E IN=
FOCHIPS
PRIVATE LIMITED at Cisco) via lists.yoctoproject.org <sudumbha=3D
cisco.com@lists.yoctoproject.org> wrote:

> Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2024-36623
> Type: Security Fix
> CVE: CVE-2024-36623
> Score: 8.1
> Patch: https://github.com/moby/moby/commit/8e3bcf197488
>
> Analysis:
> - Moby through v25.0.3 has a race condition vulnerability in the
>   streamformatter package. It can trigger multiple concurrent write
>   operations resulting in data corruption. [1]
> - The fix adds a mutex to prevent concurrent writes and protect
>   against data corruption. [2]
>
> Reference:
> [1] https://nvd.nist.gov/vuln/detail/CVE-2024-36623
> [2] https://github.com/moby/moby/commit/8e3bcf197488
>
> Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> ---
>  recipes-containers/docker/docker-moby_git.bb  |  1 +
>  .../docker/files/CVE-2024-36623.patch         | 47 +++++++++++++++++++
>  2 files changed, 48 insertions(+)
>  create mode 100644 recipes-containers/docker/files/CVE-2024-36623.patch
>
> diff --git a/recipes-containers/docker/docker-moby_git.bb
> b/recipes-containers/docker/docker-moby_git.bb
> index aa239f68..d40e3e17 100644
> --- a/recipes-containers/docker/docker-moby_git.bb
> +++ b/recipes-containers/docker/docker-moby_git.bb
> @@ -60,6 +60,7 @@ SRC_URI =3D "\
>          file://CVE-2024-36621.patch;patchdir=3Dsrc/import \
>          file://CVE-2024-29018_p1.patch;patchdir=3Dsrc/import \
>          file://CVE-2024-29018_p2.patch;patchdir=3Dsrc/import \
> +        file://CVE-2024-36623.patch;patchdir=3Dsrc/import \
>         "
>
>  DOCKER_COMMIT =3D "${SRCREV_moby}"
> diff --git a/recipes-containers/docker/files/CVE-2024-36623.patch
> b/recipes-containers/docker/files/CVE-2024-36623.patch
> new file mode 100644
> index 00000000..28553c3e
> --- /dev/null
> +++ b/recipes-containers/docker/files/CVE-2024-36623.patch
> @@ -0,0 +1,47 @@
> +commit 5becb76fa5a5cb9de135b82017dbc7da7d345614
> +Author: Pawe=C5=82 Gronowski <pawel.gronowski@docker.com>
> +Date:   Thu Feb 22 18:01:40 2024 +0100
> +
> +    pkg/streamformatter: Make `progressOutput` concurrency safe
> +
> +    Sync access to the underlying `io.Writer` with a mutex.
> +
> +    Upstream-Status: Backport [
> https://github.com/moby/moby/commit/8e3bcf197488]
> +    CVE: CVE-2024-36623
> +
> +    Signed-off-by: Pawe=C5=82 Gronowski <pawel.gronowski@docker.com>
> +    (cherry picked from commit 5689dabfb357b673abdb4391eef426f297d7d1bb)
> +    Signed-off-by: Albin Kerouanton <albinker@gmail.com>
> +    (cherry picked from commit 8e3bcf19748838b30e34d612832d1dc9d90363b8)
> +    Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> +
> +diff --git a/pkg/streamformatter/streamformatter.go
> b/pkg/streamformatter/streamformatter.go
> +index b0456e580d..098df6b523 100644
> +--- a/pkg/streamformatter/streamformatter.go
> ++++ b/pkg/streamformatter/streamformatter.go
> +@@ -5,6 +5,7 @@ import (
> +       "encoding/json"
> +       "fmt"
> +       "io"
> ++      "sync"
> +
> +       "github.com/docker/docker/pkg/jsonmessage"
> +       "github.com/docker/docker/pkg/progress"
> +@@ -109,6 +110,7 @@ type progressOutput struct {
> +       sf       formatProgress
> +       out      io.Writer
> +       newLines bool
> ++      mu       sync.Mutex
> + }
> +
> + // WriteProgress formats progress information from a ProgressReader.
> +@@ -120,6 +122,9 @@ func (out *progressOutput) WriteProgress(prog
> progress.Progress) error {
> +               jsonProgress :=3D jsonmessage.JSONProgress{Current:
> prog.Current, Total: prog.Total, HideCounts: prog.HideCounts, Units:
> prog.Units}
> +               formatted =3D out.sf.formatProgress(prog.ID, prog.Action,
> &jsonProgress, prog.Aux)
> +       }
> ++
> ++      out.mu.Lock()
> ++      defer out.mu.Unlock()
> +       _, err :=3D out.out.Write(formatted)
> +       if err !=3D nil {
> +               return err
> --
> 2.23.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9327):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9327
> Mute This Topic: https://lists.yoctoproject.org/mt/114208293/1050810
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

--0000000000004d201a063b3d2954
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Sor=
ry for the slow reply, I&#39;ve been working on package uprevs for the M3 b=
uilds and am just getting to this now.</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">How are you sending this patch ? It is still failing patch de=
tection by git am , so I can&#39;t apply it to the tree.</div><div class=3D=
"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_def=
ault" style=3D"font-size:small">Bruce</div></div><br><div class=3D"gmail_qu=
ote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Ju=
l 21, 2025 at 6:19=E2=80=AFAM Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PR=
IVATE LIMITED at Cisco) via <a href=3D"http://lists.yoctoproject.org">lists=
.yoctoproject.org</a> &lt;sudumbha=3D<a href=3D"mailto:cisco.com@lists.yoct=
oproject.org">cisco.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Bug Details: <a href=3D"https=
://nvd.nist.gov/vuln/detail/CVE-2024-36623" rel=3D"noreferrer" target=3D"_b=
lank">https://nvd.nist.gov/vuln/detail/CVE-2024-36623</a><br>
Type: Security Fix<br>
CVE: CVE-2024-36623<br>
Score: 8.1<br>
Patch: <a href=3D"https://github.com/moby/moby/commit/8e3bcf197488" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/moby/moby/commit/8e3bcf197=
488</a><br>
<br>
Analysis:<br>
- Moby through v25.0.3 has a race condition vulnerability in the<br>
=C2=A0 streamformatter package. It can trigger multiple concurrent write<br=
>
=C2=A0 operations resulting in data corruption. [1]<br>
- The fix adds a mutex to prevent concurrent writes and protect<br>
=C2=A0 against data corruption. [2]<br>
<br>
Reference:<br>
[1] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2024-36623" rel=3D"nore=
ferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2024-36623</=
a><br>
[2] <a href=3D"https://github.com/moby/moby/commit/8e3bcf197488" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/moby/moby/commit/8e3bcf197488=
</a><br>
<br>
Signed-off-by: Sudhir Dumbhare &lt;<a href=3D"mailto:sudumbha@cisco.com" ta=
rget=3D"_blank">sudumbha@cisco.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/docker/<a href=3D"http://docker-moby_git.bb" rel=
=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a>=C2=A0 |=C2=A0 1 +<=
br>
=C2=A0.../docker/files/CVE-2024-36623.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 47 +++++++++++++++++++<br>
=C2=A02 files changed, 48 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/docker/files/CVE-2024-36623.pat=
ch<br>
<br>
diff --git a/recipes-containers/docker/<a href=3D"http://docker-moby_git.bb=
" rel=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a> b/recipes-con=
tainers/docker/<a href=3D"http://docker-moby_git.bb" rel=3D"noreferrer" tar=
get=3D"_blank">docker-moby_git.bb</a><br>
index aa239f68..d40e3e17 100644<br>
--- a/recipes-containers/docker/<a href=3D"http://docker-moby_git.bb" rel=
=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a><br>
+++ b/recipes-containers/docker/<a href=3D"http://docker-moby_git.bb" rel=
=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a><br>
@@ -60,6 +60,7 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-36621.patch;patchdir=3Dsr=
c/import \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-29018_p1.patch;patchdir=
=3Dsrc/import \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-29018_p2.patch;patchdir=
=3Dsrc/import \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2024-36623.patch;patchdir=3Dsrc/imp=
ort \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0DOCKER_COMMIT =3D &quot;${SRCREV_moby}&quot;<br>
diff --git a/recipes-containers/docker/files/CVE-2024-36623.patch b/recipes=
-containers/docker/files/CVE-2024-36623.patch<br>
new file mode 100644<br>
index 00000000..28553c3e<br>
--- /dev/null<br>
+++ b/recipes-containers/docker/files/CVE-2024-36623.patch<br>
@@ -0,0 +1,47 @@<br>
+commit 5becb76fa5a5cb9de135b82017dbc7da7d345614<br>
+Author: Pawe=C5=82 Gronowski &lt;<a href=3D"mailto:pawel.gronowski@docker.=
com" target=3D"_blank">pawel.gronowski@docker.com</a>&gt;<br>
+Date:=C2=A0 =C2=A0Thu Feb 22 18:01:40 2024 +0100<br>
+<br>
+=C2=A0 =C2=A0 pkg/streamformatter: Make `progressOutput` concurrency safe<=
br>
+<br>
+=C2=A0 =C2=A0 Sync access to the underlying `io.Writer` with a mutex.<br>
+<br>
+=C2=A0 =C2=A0 Upstream-Status: Backport [<a href=3D"https://github.com/mob=
y/moby/commit/8e3bcf197488" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/moby/moby/commit/8e3bcf197488</a>]<br>
+=C2=A0 =C2=A0 CVE: CVE-2024-36623<br>
+<br>
+=C2=A0 =C2=A0 Signed-off-by: Pawe=C5=82 Gronowski &lt;<a href=3D"mailto:pa=
wel.gronowski@docker.com" target=3D"_blank">pawel.gronowski@docker.com</a>&=
gt;<br>
+=C2=A0 =C2=A0 (cherry picked from commit 5689dabfb357b673abdb4391eef426f29=
7d7d1bb)<br>
+=C2=A0 =C2=A0 Signed-off-by: Albin Kerouanton &lt;<a href=3D"mailto:albink=
er@gmail.com" target=3D"_blank">albinker@gmail.com</a>&gt;<br>
+=C2=A0 =C2=A0 (cherry picked from commit 8e3bcf19748838b30e34d612832d1dc9d=
90363b8)<br>
+=C2=A0 =C2=A0 Signed-off-by: Sudhir Dumbhare &lt;<a href=3D"mailto:sudumbh=
a@cisco.com" target=3D"_blank">sudumbha@cisco.com</a>&gt;<br>
+<br>
+diff --git a/pkg/streamformatter/streamformatter.go b/pkg/streamformatter/=
streamformatter.go<br>
+index b0456e580d..098df6b523 100644<br>
+--- a/pkg/streamformatter/streamformatter.go<br>
++++ b/pkg/streamformatter/streamformatter.go<br>
+@@ -5,6 +5,7 @@ import (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;encoding/json&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;fmt&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;io&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;sync&quot;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"http://github.com/docker/docke=
r/pkg/jsonmessage" rel=3D"noreferrer" target=3D"_blank">github.com/docker/d=
ocker/pkg/jsonmessage</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"http://github.com/docker/docke=
r/pkg/progress" rel=3D"noreferrer" target=3D"_blank">github.com/docker/dock=
er/pkg/progress</a>&quot;<br>
+@@ -109,6 +110,7 @@ type progressOutput struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sf=C2=A0 =C2=A0 =C2=A0 =C2=A0formatProgress<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0out=C2=A0 =C2=A0 =C2=A0 io.Writer<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0newLines bool<br>
++=C2=A0 =C2=A0 =C2=A0 mu=C2=A0 =C2=A0 =C2=A0 =C2=A0sync.Mutex<br>
+ }<br>
+ <br>
+ // WriteProgress formats progress information from a ProgressReader.<br>
+@@ -120,6 +122,9 @@ func (out *progressOutput) WriteProgress(prog progress=
.Progress) error {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jsonProgress :=3D j=
sonmessage.JSONProgress{Current: prog.Current, Total: prog.Total, HideCount=
s: prog.HideCounts, Units: prog.Units}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0formatted =3D out.s=
f.formatProgress(prog.ID, prog.Action, &amp;jsonProgress, prog.Aux)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 out.mu.Lock()<br>
++=C2=A0 =C2=A0 =C2=A0 defer out.mu.Unlock()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_, err :=3D out.out.Write(formatted)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err<br>
-- <br>
2.23.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9327): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9327" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9327</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/114208293/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/114208293/1050810</a><br>
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
rek II<br><br></div>

--0000000000004d201a063b3d2954--

