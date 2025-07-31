Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E800C87FCA
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 20:12:33 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.71881.1753992746062158926
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 31 Jul 2025 13:12:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XL7nm6qy;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23dc5bcf49eso19831885ad.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Jul 2025 13:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753992745; x=1754597545; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lf90kTsubOidJ3lT4b1yYlvMrT8vyYxOM42YLqg/N1c=;
        b=XL7nm6qyvycm9LCBolbV7iJbPXzHE0LjrFZa4XKxj9/j7K3uiyMpiGawKoWCmwmJ4N
         aBklxXqQGWnpyn4MMt/vOaUyKoHAcp8/J6ObpZgY3xg+yxVP9UT41NKXW90Cm8M5EomZ
         LJ0gUV+POoNUlg0v1hAJD1A3jIguKYiA32p2qP+WitTcZ4lL3n4hSdv6Ht5KRP55aUH4
         CDMxnum32tEeAmQlrCjPfhNtb4DK+4rkUcAWMjXqY3r0HiuVkPMvnsXeKbvLrYkbFwTX
         Um2XTo3zZNjY51ZdM9KGqfsNBhht4CCJYFh/5mYtOY46EpGKeHTwF581xBgk6JbKf7sA
         wUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753992745; x=1754597545;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lf90kTsubOidJ3lT4b1yYlvMrT8vyYxOM42YLqg/N1c=;
        b=PjaDiUh+2tLO0Vnf0NBDnx2IjtvqVyyDLQB3qTz2JMlDurMEeW4aaZHC4GO6PsgAbT
         DqN2ljyEVIOjXVX5gEFcyEoggaQ5XKnuoIBlDUBJIXfjYSNuvr1uZDi1d6tBZAZAgU+M
         6qWFOpB9Qc8lc8E5j90iKuaL0G7McxtZGzKDv31bcHMcFisQEdrbk/Q8PMBlaOP6b3fR
         jfjh72dNXXMiyvRa4H5ue86t2608yc4DjPBvrf9dwvEYbMNDZCLk9LWWweI8BOKI9//6
         cicFk/Dkv+hWmHMq/apTw0/c1F8OW2J707mv+SJmkPxLwBh+n/JxdX3Xb4rRKfZWyaGY
         RJZg==
X-Gm-Message-State: AOJu0Ywps7zIeA7m97/qPImgRkF3H3cchxKZe6WOOifepq4bmOVA4jOs
	8cWtxFq8NY8AlyMq5z2/Rzt3de4yw3pwU0/0ZVSTi5KT2PtN8Z9Fhjj9cNY6sJBvh3Q1HjpVTKx
	pflVzTL/ILNl51s0Cy2hqtk9zYxFnt0o=
X-Gm-Gg: ASbGncsibFg2Ml6RtlZKHoweHtvAfcmOiFYzjvbT92gHCtuxiYYmHNQBtczLmqAB8Dv
	6SGiz1OEgb/XR6yiE6R3uctg+W6t9U/CWnjw6eVi6DQ8vjCRGl5dYhWg/VeOS/hgwnTiWt28cf5
	nbrTKr/pKxCL3039DUJmI9HIO0sXEgbCbKnGZyvodLSlyvPfYSNXLAkMY0JpC7dZKKSGvG+Imfd
	NuzGHO4
X-Google-Smtp-Source: AGHT+IHIWUTv03nyw0coss6ISbFk3JdhUs5783UIx4C/ln2lqhsH+NfOwgQDz/x34TuOyStxbVyuHChxparaF+X1fxs=
X-Received: by 2002:a17:903:98f:b0:240:6d9b:59ff with SMTP id
 d9443c01a7336-24096ae7290mr115944295ad.33.1753992745137; Thu, 31 Jul 2025
 13:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <aH2oBWMowUl8f7+U@gmail.com> <20250721101900.759952-1-sudumbha@cisco.com>
 <CADkTA4NJGGOKRDuVmOGdGkLVE4iN+CaYu=Zb8y9AGP734anO=g@mail.gmail.com> <PH0PR11MB7496292BBD9BF5D6A0225078D127A@PH0PR11MB7496.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB7496292BBD9BF5D6A0225078D127A@PH0PR11MB7496.namprd11.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 31 Jul 2025 16:12:18 -0400
X-Gm-Features: Ac12FXxKUTqrY0Ruz8ymRjCmEkMhFfvXD3QjzBTR_33zGyRAfP6As7UrtHbjF9c
Message-ID: <CADkTA4OB4YTqY9_TZjX0YiHsXjaFezoKO1W5x7M1H_PeQ8hV-A@mail.gmail.com>
Subject: Re: [meta-virtualization] [scarthgap] [PATCH] docker-moby 25.0.3: fix CVE-2024-36623
To: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	"xe-linux-external(mailer list)" <xe-linux-external@cisco.com>, "Viral Chavda (vchavda)" <vchavda@cisco.com>
Content-Type: multipart/alternative; boundary="000000000000833b42063b3f4298"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Jul 2025 20:12:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9340

--000000000000833b42063b3f4298
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 3:43=E2=80=AFPM Sudhir Dumbhare -X (sudumbha - E IN=
FOCHIPS
PRIVATE LIMITED at Cisco) <sudumbha@cisco.com> wrote:

> A patch is generated using the command
>  $git format-patch -1 HEAD
>
> To confirm the patch applies correctly;
> verify with following sequence:
> -clone meta-virtualization
>   $git clone git://git.yoctoproject.org/meta-virtualization
> -switch to the scarthgap branch
>   $git checkout scarthgap
> -and apply the patch
>   $git am 0001-docker-moby-25.0.3-fix-CVE-2024-36623.patch
>
> Finally, sending the patch via git send-email.
> please check the patch verified with above sequence.
>

I assure you that everything you sent isn't applying, and I've been
doing this for several decades now :)

Something in your send path is rewriting the patches, in particular
the From field. Which makes it an invalid patch. When I edited
From: it is valid.

I've sent it before, but I can't track it down now .. there's an
OpenEmbedded wiki entry on how to fix the From field when
sending mail. I suggest searching that up.

But your patch also doesn't apply to the top of scarthgap (this is after I
edited it).

ruce-XPS-8940 [/home/bruc...ualization]> git am -s
~/incoming/0002-_meta-virtualization_scarthgap_PATCH_docker-moby_25.0.3_fix=
_CVE-2024-3.patch
Applying: docker-moby 25.0.3: fix CVE-2024-36623
.git/rebase-apply/patch:47: space before tab in indent.
        "encoding/json"
.git/rebase-apply/patch:48: space before tab in indent.
        "fmt"
.git/rebase-apply/patch:49: space before tab in indent.
        "io"
.git/rebase-apply/patch:51: trailing whitespace.

.git/rebase-apply/patch:52: space before tab in indent.
        "github.com/docker/docker/pkg/jsonmessage"
error: patch failed: recipes-containers/docker/docker-moby_git.bb:60
error: recipes-containers/docker/docker-moby_git.bb: patch does not apply
Patch failed at 0001 docker-moby 25.0.3: fix CVE-2024-36623
hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Bruce


>
> Thanks & Regards,
> Sudhir
>
> ------------------------------
> *From:* Bruce Ashfield <bruce.ashfield@gmail.com>
> *Sent:* 31 July 2025 23:11
> *To:* Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at
> Cisco) <sudumbha@cisco.com>
> *Cc:* meta-virtualization@lists.yoctoproject.org <
> meta-virtualization@lists.yoctoproject.org>; xe-linux-external(mailer
> list) <xe-linux-external@cisco.com>; Viral Chavda (vchavda) <
> vchavda@cisco.com>
> *Subject:* Re: [meta-virtualization] [scarthgap] [PATCH] docker-moby
> 25.0.3: fix CVE-2024-36623
>
> Sorry for the slow reply, I've been working on package uprevs for the M3
> builds and am just getting to this now.
>
> How are you sending this patch ? It is still failing patch detection by
> git am , so I can't apply it to the tree.
>
> Bruce
>
> On Mon, Jul 21, 2025 at 6:19=E2=80=AFAM Sudhir Dumbhare -X (sudumbha - E =
INFOCHIPS
> PRIVATE LIMITED at Cisco) via lists.yoctoproject.org <sudumbha=3D
> cisco.com@lists.yoctoproject.org> wrote:
>
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
>  b/recipes-containers/docker/docker-moby_git.bb
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
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000833b42063b3f4298
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 31, 2025 at 3:43=
=E2=80=AFPM Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at C=
isco) &lt;<a href=3D"mailto:sudumbha@cisco.com">sudumbha@cisco.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div clas=
s=3D"msg-7423979697761052816">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
A patch is generated using the command</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
=C2=A0$git format-patch -1 HEAD</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
To confirm the patch applies correctly;</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
verify with following sequence:</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
-clone meta-virtualization</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
=C2=A0 $git clone git://<a href=3D"http://git.yoctoproject.org/meta-virtual=
ization" target=3D"_blank">git.yoctoproject.org/meta-virtualization</a></di=
v>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
-switch to the scarthgap branch</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
=C2=A0 $git checkout scarthgap</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
-and apply the patch</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
=C2=A0 $git am 0001-docker-moby-25.0.3-fix-CVE-2024-36623.patch</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
Finally, sending the patch via git send-email.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;color:rgb(0,0,0)">
<span style=3D"font-size:11pt">please check the patch verified with above s=
equence.</span><span style=3D"font-size:12pt">=C2=A0=C2=A0</span></div></di=
v></div></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">I assure you that everything you sent isn&#39;t applyi=
ng, and I&#39;ve been</div><div class=3D"gmail_default" style=3D"font-size:=
small">doing this for several decades=C2=A0now :)</div><div class=3D"gmail_=
default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">Something in your send path is rewriting the patch=
es, in particular</div><div class=3D"gmail_default" style=3D"font-size:smal=
l">the From field. Which makes it an invalid patch. When I edited</div><div=
 class=3D"gmail_default" style=3D"font-size:small">From: it is valid.</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">I&#39;ve sent it before, but I=
 can&#39;t track it down now .. there&#39;s an</div><div class=3D"gmail_def=
ault" style=3D"font-size:small">OpenEmbedded wiki entry on how to fix the F=
rom field when</div><div class=3D"gmail_default" style=3D"font-size:small">=
sending mail. I suggest searching that up.</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">But your patch also doesn&#39;t apply to the top of scart=
hgap (this is after I edited it).<br><br>ruce-XPS-8940 [/home/bruc...ualiza=
tion]&gt; git am -s ~/incoming/0002-_meta-virtualization_scarthgap_PATCH_do=
cker-moby_25.0.3_fix_CVE-2024-3.patch<br>Applying: docker-moby 25.0.3: fix =
CVE-2024-36623<br>.git/rebase-apply/patch:47: space before tab in indent.<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;encoding/json&quot;<br>.git/rebase-appl=
y/patch:48: space before tab in indent.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;fmt&quot;<br>.git/rebase-apply/patch:49: space before tab in indent.<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;<br>.git/rebase-apply/patch:51: t=
railing whitespace.<br>=C2=A0<br>.git/rebase-apply/patch:52: space before t=
ab in indent.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"http://github=
.com/docker/docker/pkg/jsonmessage">github.com/docker/docker/pkg/jsonmessag=
e</a>&quot;<br>error: patch failed: recipes-containers/docker/<a href=3D"ht=
tp://docker-moby_git.bb:60">docker-moby_git.bb:60</a><br>error: recipes-con=
tainers/docker/<a href=3D"http://docker-moby_git.bb">docker-moby_git.bb</a>=
: patch does not apply<br>Patch failed at 0001 docker-moby 25.0.3: fix CVE-=
2024-36623<br>hint: Use &#39;git am --show-current-patch=3Ddiff&#39; to see=
 the failed patch<br>When you have resolved this problem, run &quot;git am =
--continue&quot;.<br>If you prefer to skip this patch, run &quot;git am --s=
kip&quot; instead.<br>To restore the original branch and stop patching, run=
 &quot;git am --abort&quot;.<br></div></div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div class=3D"msg-7423979697761052816"><div dir=3D"ltr">
<div id=3D"m_-7423979697761052816appendonsend"></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
Thanks &amp; Regards,</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
Sudhir</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-7423979697761052816divRplyFwdMsg">
<div style=3D"direction:ltr;font-family:Calibri,sans-serif;font-size:11pt;c=
olor:rgb(0,0,0)">
<b>From:</b>=C2=A0Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail=
.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
<b>Sent:</b>=C2=A031 July 2025 23:11<br>
<b>To:</b>=C2=A0Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED =
at Cisco) &lt;<a href=3D"mailto:sudumbha@cisco.com" target=3D"_blank">sudum=
bha@cisco.com</a>&gt;<br>
<b>Cc:</b>=C2=A0<a href=3D"mailto:meta-virtualization@lists.yoctoproject.or=
g" target=3D"_blank">meta-virtualization@lists.yoctoproject.org</a> &lt;<a =
href=3D"mailto:meta-virtualization@lists.yoctoproject.org" target=3D"_blank=
">meta-virtualization@lists.yoctoproject.org</a>&gt;; xe-linux-external(mai=
ler list) &lt;<a href=3D"mailto:xe-linux-external@cisco.com" target=3D"_bla=
nk">xe-linux-external@cisco.com</a>&gt;; Viral Chavda (vchavda) &lt;<a href=
=3D"mailto:vchavda@cisco.com" target=3D"_blank">vchavda@cisco.com</a>&gt;</=
div>
<div style=3D"direction:ltr;font-family:Calibri,sans-serif;font-size:11pt;c=
olor:rgb(0,0,0)">
<b>Subject:</b>=C2=A0Re: [meta-virtualization] [scarthgap] [PATCH] docker-m=
oby 25.0.3: fix CVE-2024-36623</div>
<div style=3D"direction:ltr">=C2=A0</div>
</div>
<div style=3D"direction:ltr;font-size:9.75pt">Sorry for the slow reply, I&#=
39;ve been working on package uprevs for the M3 builds and am just getting =
to this now.</div>
<div style=3D"direction:ltr;font-size:9.75pt"><br>
</div>
<div style=3D"direction:ltr;font-size:9.75pt">How are you sending this patc=
h ? It is still failing patch detection by git am , so I can&#39;t apply it=
 to the tree.</div>
<div style=3D"direction:ltr;font-size:9.75pt"><br>
</div>
<div style=3D"direction:ltr;font-size:9.75pt">Bruce</div>
<div><br>
</div>
<div style=3D"direction:ltr">On Mon, Jul 21, 2025 at 6:19=E2=80=AFAM Sudhir=
 Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco) via
<a id=3D"m_-7423979697761052816OWA386b4902-367b-2498-b38b-291464253c91" hre=
f=3D"http://lists.yoctoproject.org" target=3D"_blank">
lists.yoctoproject.org</a>=C2=A0&lt;sudumbha=3D<a id=3D"m_-7423979697761052=
816OWA6056e1f3-3b4e-53f6-39c8-9563bc488c49" href=3D"mailto:cisco.com@lists.=
yoctoproject.org" target=3D"_blank">cisco.com@lists.yoctoproject.org</a>&gt=
; wrote:</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left:=
1px solid rgb(204,204,204)">
<div>Bug Details: <a id=3D"m_-7423979697761052816OWA2de86e17-86e3-be65-58e9=
-15885f4255ec" href=3D"https://nvd.nist.gov/vuln/detail/CVE-2024-36623" tar=
get=3D"_blank">
https://nvd.nist.gov/vuln/detail/CVE-2024-36623</a><br>
Type: Security Fix<br>
CVE: CVE-2024-36623<br>
Score: 8.1<br>
Patch: <a id=3D"m_-7423979697761052816OWA93956029-bc2b-87e8-caf2-2c07be4982=
4a" href=3D"https://github.com/moby/moby/commit/8e3bcf197488" target=3D"_bl=
ank">
https://github.com/moby/moby/commit/8e3bcf197488</a><br>
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
[1] <a id=3D"m_-7423979697761052816OWAe2203d8b-f56d-e0e0-1e80-360d88d531b1"=
 href=3D"https://nvd.nist.gov/vuln/detail/CVE-2024-36623" target=3D"_blank"=
>
https://nvd.nist.gov/vuln/detail/CVE-2024-36623</a><br>
[2] <a id=3D"m_-7423979697761052816OWA1300e066-5825-a269-afdf-00944b3a4138"=
 href=3D"https://github.com/moby/moby/commit/8e3bcf197488" target=3D"_blank=
">
https://github.com/moby/moby/commit/8e3bcf197488</a><br>
<br>
Signed-off-by: Sudhir Dumbhare &lt;<a id=3D"m_-7423979697761052816OWA306a30=
70-7aeb-ce0e-12c2-c3d438266430" href=3D"mailto:sudumbha@cisco.com" target=
=3D"_blank">sudumbha@cisco.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/docker/<a id=3D"m_-7423979697761052816OWA77a7f97d-=
6c29-4349-1271-78391bd89401" href=3D"http://docker-moby_git.bb" target=3D"_=
blank">docker-moby_git.bb</a>=C2=A0 |=C2=A0 1 +<br>
=C2=A0.../docker/files/CVE-2024-36623.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 47 +++++++++++++++++++<br>
=C2=A02 files changed, 48 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/docker/files/CVE-2024-36623.pat=
ch<br>
<br>
diff --git a/recipes-containers/docker/<a id=3D"m_-7423979697761052816OWA31=
2a6c4c-7248-142c-3121-53a8b5fa3cb5" href=3D"http://docker-moby_git.bb" targ=
et=3D"_blank">docker-moby_git.bb</a>=C2=A0b/recipes-containers/docker/<a id=
=3D"m_-7423979697761052816OWA318d47b5-a260-b71e-a0ad-9718d98693fa" href=3D"=
http://docker-moby_git.bb" target=3D"_blank">docker-moby_git.bb</a><br>
index aa239f68..d40e3e17 100644<br>
--- a/recipes-containers/docker/<a id=3D"m_-7423979697761052816OWA8df5d559-=
f5f7-9c2d-0486-d46215296deb" href=3D"http://docker-moby_git.bb" target=3D"_=
blank">docker-moby_git.bb</a><br>
+++ b/recipes-containers/docker/<a id=3D"m_-7423979697761052816OWAd0c91c58-=
d28e-fd44-b021-c05408a2b894" href=3D"http://docker-moby_git.bb" target=3D"_=
blank">docker-moby_git.bb</a><br>
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
+Author: Pawe=C5=82 Gronowski &lt;<a id=3D"m_-7423979697761052816OWA9806053=
7-c997-a6ee-92ae-c6691ad53d5b" href=3D"mailto:pawel.gronowski@docker.com" t=
arget=3D"_blank">pawel.gronowski@docker.com</a>&gt;<br>
+Date:=C2=A0 =C2=A0Thu Feb 22 18:01:40 2024 +0100<br>
+<br>
+=C2=A0 =C2=A0 pkg/streamformatter: Make `progressOutput` concurrency safe<=
br>
+<br>
+=C2=A0 =C2=A0 Sync access to the underlying `io.Writer` with a mutex.<br>
+<br>
+=C2=A0 =C2=A0 Upstream-Status: Backport [<a id=3D"m_-7423979697761052816OW=
A397c4e74-76b6-2a8a-744d-3009ec4696fd" href=3D"https://github.com/moby/moby=
/commit/8e3bcf197488" target=3D"_blank">https://github.com/moby/moby/commit=
/8e3bcf197488</a>]<br>
+=C2=A0 =C2=A0 CVE: CVE-2024-36623<br>
+<br>
+=C2=A0 =C2=A0 Signed-off-by: Pawe=C5=82 Gronowski &lt;<a id=3D"m_-74239796=
97761052816OWAf64663c4-0a52-9399-2bf9-bc22e835b576" href=3D"mailto:pawel.gr=
onowski@docker.com" target=3D"_blank">pawel.gronowski@docker.com</a>&gt;<br=
>
+=C2=A0 =C2=A0 (cherry picked from commit 5689dabfb357b673abdb4391eef426f29=
7d7d1bb)<br>
+=C2=A0 =C2=A0 Signed-off-by: Albin Kerouanton &lt;<a id=3D"m_-742397969776=
1052816OWAcf3e8a6d-e745-4b8f-88db-b64fcb315afb" href=3D"mailto:albinker@gma=
il.com" target=3D"_blank">albinker@gmail.com</a>&gt;<br>
+=C2=A0 =C2=A0 (cherry picked from commit 8e3bcf19748838b30e34d612832d1dc9d=
90363b8)<br>
+=C2=A0 =C2=A0 Signed-off-by: Sudhir Dumbhare &lt;<a id=3D"m_-7423979697761=
052816OWAd006e09b-5fce-b0c8-89f4-7aa4ea33b411" href=3D"mailto:sudumbha@cisc=
o.com" target=3D"_blank">sudumbha@cisco.com</a>&gt;<br>
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
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<a id=3D"m_-7423979697761052816OWA6040a73=
1-0013-3544-bf96-38008b7e6800" href=3D"http://github.com/docker/docker/pkg/=
jsonmessage" target=3D"_blank">github.com/docker/docker/pkg/jsonmessage</a>=
&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<a id=3D"m_-7423979697761052816OWA66aba0c=
0-df1b-65f1-8501-5ea12fe1cafa" href=3D"http://github.com/docker/docker/pkg/=
progress" target=3D"_blank">github.com/docker/docker/pkg/progress</a>&quot;=
<br>
+@@ -109,6 +110,7 @@ type progressOutput struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sf=C2=A0 =C2=A0 =C2=A0 =C2=A0formatProgress<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0out=C2=A0 =C2=A0 =C2=A0 io.Writer<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0newLines bool<br>
++=C2=A0 =C2=A0 =C2=A0 mu=C2=A0 =C2=A0 =C2=A0 =C2=A0sync.Mutex<br>
+ }<br>
+<br>
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
--<br>
2.23.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9327): <a id=3D"m_-7423979697761052816OWA6b99cdfe-40e9-=
2693-531f-e11e23c9822c" href=3D"https://lists.yoctoproject.org/g/meta-virtu=
alization/message/9327" target=3D"_blank">
https://lists.yoctoproject.org/g/meta-virtualization/message/9327</a><br>
Mute This Topic: <a id=3D"m_-7423979697761052816OWAb3c9afad-a114-1f9a-a877-=
ac374cd301d3" href=3D"https://lists.yoctoproject.org/mt/114208293/1050810" =
target=3D"_blank">
https://lists.yoctoproject.org/mt/114208293/1050810</a><br>
Group Owner: <a id=3D"m_-7423979697761052816OWA3d610785-35a0-f011-4bb5-b44c=
27acee28" href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproject.org=
" target=3D"_blank">
meta-virtualization+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a id=3D"m_-7423979697761052816OWAa251989e-ff1f-8d87-9338-6de9=
27b32e3d" href=3D"https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b" target=3D"_blank">
https://lists.yoctoproject.org/g/meta-virtualization/unsub</a>=C2=A0[<a id=
=3D"m_-7423979697761052816OWA605f7416-bfc3-118d-c6f1-2c4c5b913223" href=3D"=
mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com=
</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div>
</blockquote>
<div><br>
</div>
<div><br>
</div>
<div>--</div>
<div style=3D"direction:ltr">- Thou shalt not follow the NULL pointer, for =
chaos and madness await thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
</div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature">- Thou shalt not follow the NULL pointer, for chaos and madn=
ess await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, S=
tar Trek II<br><br></div></div>

--000000000000833b42063b3f4298--

