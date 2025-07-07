Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60170C8303C
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 16:38:46 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.1660.1751906323348175351
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Jul 2025 09:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HhBa1ocQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-749068b9b63so1964391b3a.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 07 Jul 2025 09:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751906323; x=1752511123; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S1DD377bMTI+cSFKgFA8eDSusMv4c0GzllfiW+xkiZ8=;
        b=HhBa1ocQkFSf0EKdM31oi8mlJJLTN0CFsUQAh+Iqgq5LdArIcm1o3UFNkouOh+uoUG
         RiwXY02cuZR3rVN72eVRdYaY/UEL0M78TEZ0nFEnwxKrPSJ3s3tREEAqOekPXbaWOmFn
         mHs7QaD4p6nR6/YFnTvWzjB4YWQYCQiSPP0/s4Sd85/ru7QMRR/mdyjDOlTIPdeczcaS
         u+6ze3YAQUdjGxfzZtZ8uI1LvLHkTfC9bBfHjAUSrnet8YIkQsYbDjRqRLHfVbLA5+n/
         9rhe7Nqms7ISxoFe903Bl2UrUEEU7YZFSAjNHTr1EE9vo4X8ceriIE72SqOtSjLmthZe
         Yn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751906323; x=1752511123;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1DD377bMTI+cSFKgFA8eDSusMv4c0GzllfiW+xkiZ8=;
        b=FSNAFf+Reyq0on1e1YLTUdowr/IoQGCw1yhfuNKp0xm5PD1YgUGokuk34IR9AtLCTl
         NM++grazJdQap/ZdikCeIMcgiwqb9N+Vw0Y8hXq70Oi27OdTfpJ0RzkSjMnpDKO0FjlB
         dD1hNnWUgfNOwRTBnUSPRWjfGO9Hvc5qvDFfVidq/tFgiqVgCR7dG5s35DSefmSDc6ZO
         4Nvf1LIsWdaZ+1a5d62fk7ujM6YbTlfEk/M8XVF5QlX51r913gidXDLQQtjt8nCL2XLw
         9kTBFtfgKqn08ySkMtGvp/LNrL7nAeaM75ZdPqSnD4vl9OEnbcxS7znEv1TDbErGOUBz
         OqBw==
X-Gm-Message-State: AOJu0YwwrroUdMLZq3FVBvSuDY8hXCamdV3sWzjApKHgSbZ34H9zT2pI
	Wkgu0QnhXbX4OsuGvvRQobOWlla25EAOyPjlDrIgX4rhe5HGmbuhHdEyf94NuKCrEuRXi6cE00o
	XioeBo5nbVIiEmPfFTXhn+skFdqNhDwE=
X-Gm-Gg: ASbGnctQgI7f/OSZ3HWBiyuXegOPbU0Djuk00O/sAYb6Ca1MJSrefaGLGrpSe/pYhA7
	ilmiT6T3jPjLKGu5tToUdhTg1tR5lMSjrIofNUVQu4RGmYz2/QZA77OUawaAk5MXlsRgNT3qJBs
	dvA0/L6igBK+KyN6m0PEsQCfLqOjitI9MiVEpLjEJsaBri
X-Google-Smtp-Source: AGHT+IEF2IBEkFwVxZLby1ifYqOLvxGixNkF9+0aOvIG2t9lwPWrJPfcYrRIE0JYZC6JSSF2PWZPvZSA6HEgSS4WoMM=
X-Received: by 2002:a05:6a00:ccf:b0:748:2b23:308c with SMTP id
 d2e1a72fcca58-74cf6fb8617mr10988976b3a.14.1751906322502; Mon, 07 Jul 2025
 09:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250704054725.139511-1-harish.h@windriver.com>
In-Reply-To: <20250704054725.139511-1-harish.h@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 7 Jul 2025 12:38:29 -0400
X-Gm-Features: Ac12FXxG41XIfi1HqDG4ESa6FzGaOQ1JHHmfSj-W_o1fVHZdM0bmnP7_aCdUHqo
Message-ID: <CADkTA4NVqDD49PxrPZCknVj-PfNdZZqdoiQcbAjFz5emQxAXNw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] skopeo.bb: remove GOBUILDFLAGS
 override in do_compile to fix textrel QA issue
To: Harish.H@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000085a830639597a2f"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 07 Jul 2025 16:38:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9297

--000000000000085a830639597a2f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 1:47=E2=80=AFAM H, Harish via lists.yoctoproject.org
<Harish.H=3Dwindriver.com@lists.yoctoproject.org> wrote:

> From: Harish H <harish.h@windriver.com>
>
> The skopeo recipe was explicitly exporting GOBUILDFLAGS=3D"-trimpath" in =
the
> do_compile task, overriding the default settings provided by go.bbclass.
>
> This override causes the resulting Go binary to include relocations in th=
e
> .text section, leading to the following QA error during do_package_qa:
>
>   QA Issue: skopeo: ELF binary /usr/sbin/skopeo has relocations in .text
> [textrel]
>
> Removing the GOBUILDFLAGS assignment in skopeo_git.bb allows the default
> behavior
> from go.bbclass to take effect, resolving the textrel issue and ensuring
> the binary passes QA checks.
>

I tend not to trust the go bbclases with setting the build flags. They've
broken my
builds as often as they've fixed things. That being said, I would take this
change
if I could see the issue (see below).

I'm also not seeing this same QA error .. otherwise no updates to skopeo
would
be merging.

Can you describe your configuration ? Is this against the latest
master-next ?
Do you have local tweaks to the QA tests ?

I can't merge this unless I can reproduce the issue.

Bruce




>
> Signed-off-by: Harish H <harish.h@windriver.com>
> ---
>  recipes-containers/skopeo/skopeo_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/skopeo/skopeo_git.bb
> b/recipes-containers/skopeo/skopeo_git.bb
> index 561ef103..165114ef 100644
> --- a/recipes-containers/skopeo/skopeo_git.bb
> +++ b/recipes-containers/skopeo/skopeo_git.bb
> @@ -61,7 +61,7 @@ do_compile() {
>         export CGO_LDFLAGS=3D"${TARGET_LDFLAGS}"
>
>         export GO111MODULE=3Doff
> -       export GOBUILDFLAGS=3D"-trimpath"
> +       #export GOBUILDFLAGS=3D"-trimpath"
>         export EXTRA_LDFLAGS=3D"-s -w"
>
>         oe_runmake bin/skopeo
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9295):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9295
> Mute This Topic: https://lists.yoctoproject.org/mt/113979362/1050810
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

--000000000000085a830639597a2f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 4, 2025 at 1:47=E2=80=
=AFAM H, Harish via <a href=3D"http://lists.yoctoproject.org" target=3D"_bl=
ank">lists.yoctoproject.org</a> &lt;Harish.H=3D<a href=3D"mailto:windriver.=
com@lists.yoctoproject.org" target=3D"_blank">windriver.com@lists.yoctoproj=
ect.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">From: Harish H &lt;<a href=3D"mailto:harish.h@windriver.com" target=
=3D"_blank">harish.h@windriver.com</a>&gt;<br>
<br>
The skopeo recipe was explicitly exporting GOBUILDFLAGS=3D&quot;-trimpath&q=
uot; in the<br>
do_compile task, overriding the default settings provided by go.bbclass.<br=
>
<br>
This override causes the resulting Go binary to include relocations in the<=
br>
.text section, leading to the following QA error during do_package_qa:<br>
<br>
=C2=A0 QA Issue: skopeo: ELF binary /usr/sbin/skopeo has relocations in .te=
xt [textrel]<br>
<br>
Removing the GOBUILDFLAGS assignment in <a href=3D"http://skopeo_git.bb" re=
l=3D"noreferrer" target=3D"_blank">skopeo_git.bb</a> allows the default beh=
avior<br>
from go.bbclass to take effect, resolving the textrel issue and ensuring<br=
>
the binary passes QA checks.<br></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">I tend not to trust the go bbc=
lases with setting the build flags. They&#39;ve broken my=C2=A0</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">builds=C2=A0as often as th=
ey&#39;ve fixed things. That being said, I would take this change</div><div=
 class=3D"gmail_default" style=3D"font-size:small">if I could see the issue=
 (see below).</div><br></div><div><div class=3D"gmail_default" style=3D"fon=
t-size:small">I&#39;m also not seeing this same QA error .. otherwise no up=
dates to skopeo would</div><div class=3D"gmail_default" style=3D"font-size:=
small">be merging.</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Can yo=
u describe your configuration ? Is this against the latest master-next ?</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">Do you have local=
 tweaks to the QA tests ?</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>I can&#39;t merge this unless I can reproduce the issue.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Bruce</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Harish H &lt;<a href=3D"mailto:harish.h@windriver.com" targe=
t=3D"_blank">harish.h@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/skopeo/<a href=3D"http://skopeo_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">skopeo_git.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/skopeo/<a href=3D"http://skopeo_git.bb" rel=
=3D"noreferrer" target=3D"_blank">skopeo_git.bb</a> b/recipes-containers/sk=
opeo/<a href=3D"http://skopeo_git.bb" rel=3D"noreferrer" target=3D"_blank">=
skopeo_git.bb</a><br>
index 561ef103..165114ef 100644<br>
--- a/recipes-containers/skopeo/<a href=3D"http://skopeo_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">skopeo_git.bb</a><br>
+++ b/recipes-containers/skopeo/<a href=3D"http://skopeo_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">skopeo_git.bb</a><br>
@@ -61,7 +61,7 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CGO_LDFLAGS=3D&quot;${TARGET_LDFLAGS}&qu=
ot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GO111MODULE=3Doff<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOBUILDFLAGS=3D&quot;-trimpath&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#export GOBUILDFLAGS=3D&quot;-trimpath&quot;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export EXTRA_LDFLAGS=3D&quot;-s -w&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake bin/skopeo<br>
-- <br>
2.40.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9295): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9295" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9295</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/113979362/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/113979362/1050810</a><br>
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
</div>

--000000000000085a830639597a2f--

