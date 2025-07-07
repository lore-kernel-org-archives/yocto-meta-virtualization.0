Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2367AC8303C
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 15:44:06 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.371.1751903042475791994
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Jul 2025 08:44:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iSoQgG4w;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-234bfe37cccso36862245ad.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 07 Jul 2025 08:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751903042; x=1752507842; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i9nPyuwBD4OWeSqHRPV9sWI0vEMhgF/T4SSliXaRflk=;
        b=iSoQgG4wy1/yJr1EDaOsdF6kSfTD/57cvAdqYxcWYlSJJYtUJOH/7iMYjX/XA5Lml7
         T4af1f/KSya1H3imNtGZClQzlfgQK1HjMyss+Bkq1cfyJd8e5tHS1kSf5C6H+sUqUmrU
         U2wQgGfYdTX+5WkKsbIuxrFb3Gm1psx0aL40CDI54H0M0KMLFcEwz1fjwXB4B1sYLyvF
         /aabHZ339Okiggxh6Y+Q0o0qVHTZlQGhGdW6GdpqrnM7uBqOm6AHpWDo7K/r2firc2KP
         AHWyD9Sgj3G49MeGkk33fnuyEo7PQQWe2nqoBzN8zgBpMtaCrMkuIJR3ggerk6U+q6Ps
         Dlcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751903042; x=1752507842;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i9nPyuwBD4OWeSqHRPV9sWI0vEMhgF/T4SSliXaRflk=;
        b=bworl4gGkoqn/fWNEnc3TL+03kkxYqx0Apq2CRBZ2KY7D5Yi0sdEUHUqdXpgm2x/cp
         h2obUpwcRuCoDvdda7u0KnYEALt1uvNMzR12ce2lNa3yCX19kF4VTDo93JA9oqKXeKdL
         wq39Jt8a4vWT73RihGc67kOlwnmUmz4NAvoHZrxNtYldBDFwHwrv3RCDbWHsPdBgkEV6
         1EAIRD9PASeETWDrB0400rGTpXPwO5qptWb0BfKvlUxEpkZa/p+M248o+nYXE14RNSkD
         +PG55Jl8bVIvc2eI3nMeCQ5SIXb5Ax1JIkYOsTrP/P7CPSppShkO3AVYhh1BYpxZHb7D
         CMFA==
X-Gm-Message-State: AOJu0YydG+Fs53umor7cjBHPQKEKBmjIIxYNqg5NKji5RmL64aw4zDQg
	JwQb/OmTFexlllfKhq2YPvXZ+PzHNZkppJ2gJM8va0xyhcNduvpLCsnBRjGzawgOAtfNxsyOwtf
	4JGKhprKDpsYYc7gSnJCB7Md/BCH5Iuhm2esXZ8w=
X-Gm-Gg: ASbGncvRXl/r2YKvDr5LC/RaYiJme+k2IsW2ISkEOtlqTQAnkOB2/JIhZZfgoaq2BXs
	4MtiKby1QsDZmBWxBhJVN3xt47G/R/NzVEVzpfntjJdDeKNoHHty7xDOclp+5oc95yu3pMdn6Ko
	sn0AweenI1Y3Aq1Qs4YnsRq71CtqhQpT1IG9cqKPi25d82
X-Google-Smtp-Source: AGHT+IFvVcD/R1rOeShDTknBpev5PtgwLNWn9+Z5cx7SFPwNJEANUpvyY7lMotoJivjAln60pavoGDRH5qMzj02KFCc=
X-Received: by 2002:a17:903:230e:b0:235:f3df:bc26 with SMTP id
 d9443c01a7336-23c90f37736mr133873975ad.3.1751903041234; Mon, 07 Jul 2025
 08:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <TYRP286MB599506783F107D6DA11D2F1FDB42A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <TYRP286MB599506783F107D6DA11D2F1FDB42A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 7 Jul 2025 11:43:49 -0400
X-Gm-Features: Ac12FXygzPtd0X7GtI1x84BnuJ3hMKCXWDTudLPp3K-J48ZvoJKuoQVMhuahxUw
Message-ID: <CADkTA4OA2L+=XaC1=-78oDO=t50SR=KHbH_sHF9GXGAdqF_suw@mail.gmail.com>
Subject: Re: [master-next][PATCH] containerd: fix remote branch
To: Ken Kurematsu <k.kurematsu@nskint.co.jp>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	Masahiro Mizutani <m.mizutani@nskint.co.jp>, Yoshitaka Ikeda <ikeda@nskint.co.jp>
Content-Type: multipart/alternative; boundary="000000000000742c6e063958b6b4"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 07 Jul 2025 15:44:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9296

--000000000000742c6e063958b6b4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fun fact: BB_GIT_SHALLOW masks branch check issues.

I had fixed this locally on my final testing (when I disabled it) and just
squashed and fixed the containerd uprev now.

master-next will be pushed to master at some point today.

Bruce

On Fri, Jul 4, 2025 at 12:19=E2=80=AFAM Ken Kurematsu <k.kurematsu@nskint.c=
o.jp>
wrote:

> SRCREV(41bb88c7ed2a56dda8a2f67dcce35c106919ae55) is the revision of
> release/2.1, so we will fix it.
>
> Fixes: 6059618d ("containerd: update to v2.1.3")
> Signed-off-by: Ken Kurematsu <k.kurematsu@nskint.co.jp>
> ---
>  recipes-containers/containerd/containerd_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/containerd/containerd_git.bb
> b/recipes-containers/containerd/containerd_git.bb
> index 44f6b7ae..b1723547 100644
> --- a/recipes-containers/containerd/containerd_git.bb
> +++ b/recipes-containers/containerd/containerd_git.bb
> @@ -6,7 +6,7 @@ DESCRIPTION =3D "containerd is a daemon to control runC,
> built for performance and
>
>
>  SRCREV =3D "41bb88c7ed2a56dda8a2f67dcce35c106919ae55"
> -SRC_URI =3D "git://
> github.com/containerd/containerd;branch=3Drelease/2.0;protocol=3Dhttps;de=
stsuffix=3Dgit/src/github.com/containerd/containerd/v2
> \
> +SRC_URI =3D "git://
> github.com/containerd/containerd;branch=3Drelease/2.1;protocol=3Dhttps;de=
stsuffix=3Dgit/src/github.com/containerd/containerd/v2
> \
>
> file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch \
>             file://0001-build-don-t-use-gcflags-to-define-trimpath.patch =
\
>             file://cni-containerd-net.conflist \
> --
> 2.34.1
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000742c6e063958b6b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Fun=
 fact: BB_GIT_SHALLOW masks branch check issues.=C2=A0<br><br>I had fixed t=
his locally on my final testing (when I disabled it) and just squashed and =
fixed the containerd uprev now.</div><div class=3D"gmail_default" style=3D"=
font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">master-next will be pushed to master at some point today.</div><div =
class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"g=
mail_default" style=3D"font-size:small">Bruce</div></div><br><div class=3D"=
gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Fri, Jul 4, 2025 at 12:19=E2=80=AFAM Ken Kurematsu &lt;<a href=3D"mailto:k=
.kurematsu@nskint.co.jp">k.kurematsu@nskint.co.jp</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">SRCREV(41bb88c7ed2a56dda8a=
2f67dcce35c106919ae55) is the revision of release/2.1, so we will fix it.<b=
r>
<br>
Fixes: 6059618d (&quot;containerd: update to v2.1.3&quot;)<br>
Signed-off-by: Ken Kurematsu &lt;<a href=3D"mailto:k.kurematsu@nskint.co.jp=
" target=3D"_blank">k.kurematsu@nskint.co.jp</a>&gt;<br>
---<br>
=C2=A0recipes-containers/containerd/<a href=3D"http://containerd_git.bb" re=
l=3D"noreferrer" target=3D"_blank">containerd_git.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/containerd/<a href=3D"http://containerd_git=
.bb" rel=3D"noreferrer" target=3D"_blank">containerd_git.bb</a> b/recipes-c=
ontainers/containerd/<a href=3D"http://containerd_git.bb" rel=3D"noreferrer=
" target=3D"_blank">containerd_git.bb</a><br>
index 44f6b7ae..b1723547 100644<br>
--- a/recipes-containers/containerd/<a href=3D"http://containerd_git.bb" re=
l=3D"noreferrer" target=3D"_blank">containerd_git.bb</a><br>
+++ b/recipes-containers/containerd/<a href=3D"http://containerd_git.bb" re=
l=3D"noreferrer" target=3D"_blank">containerd_git.bb</a><br>
@@ -6,7 +6,7 @@ DESCRIPTION =3D &quot;containerd is a daemon to control run=
C, built for performance and<br>
<br>
<br>
=C2=A0SRCREV =3D &quot;41bb88c7ed2a56dda8a2f67dcce35c106919ae55&quot;<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/containerd/containerd=
;branch=3Drelease/2.0;protocol=3Dhttps;destsuffix=3Dgit/src/github.com/cont=
ainerd/containerd/v2" rel=3D"noreferrer" target=3D"_blank">github.com/conta=
inerd/containerd;branch=3Drelease/2.0;protocol=3Dhttps;destsuffix=3Dgit/src=
/github.com/containerd/containerd/v2</a> \<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/containerd/containerd=
;branch=3Drelease/2.1;protocol=3Dhttps;destsuffix=3Dgit/src/github.com/cont=
ainerd/containerd/v2" rel=3D"noreferrer" target=3D"_blank">github.com/conta=
inerd/containerd;branch=3Drelease/2.1;protocol=3Dhttps;destsuffix=3Dgit/src=
/github.com/containerd/containerd/v2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Makefile-allow-GO_BUI=
LD_FLAGS-to-be-externally-speci.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-build-don-t-use-gcfla=
gs-to-define-trimpath.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://cni-containerd-net.conflis=
t \<br>
-- <br>
2.34.1<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div>

--000000000000742c6e063958b6b4--

