Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 806F8C77B73
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 22:41:33 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.19737.1685227286632294033
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 27 May 2023 15:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=N2Qvna3W;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-970056276acso313670566b.2
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 27 May 2023 15:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685227285; x=1687819285;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uh0fGm+qSndHB3NAM0qUDrzd3fRnVTvsbn6wnGSaPUQ=;
        b=N2Qvna3WB31BnXtMaE7NhSKj+NaoxK6HuQexOS7oT+CXiVD8YhnQ5YJq4bA2UMWnvM
         TJgM0ZqszwcIJqCwEhGoZNIulQP9y0P84zcqqmtdwajnjTLHy4bShRLD2QcFDfT59Aio
         bgUbkVYy3OU1aeXgokV/+WGqy3Uq7gs984WHBgOQoga9zWOHeYsQiUjfZ9p512PYHFC7
         06mQ9n//4Ie6zgS/rXOitdQ/ocmhhbVm8YeUkSVbOGQnhj44KANykoAQCY6qKPf6fbPG
         8y6CNaHqOuMU0psG1NDizARbt/LQE81G3XOz4k7hIERfJ0CImFkvUOjh3duTb1VuivZE
         gEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685227285; x=1687819285;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uh0fGm+qSndHB3NAM0qUDrzd3fRnVTvsbn6wnGSaPUQ=;
        b=kUh2QWq4cytIBxsOIeZxHyaTJKNN1CUMZry0vQjPA2gvVPKHIVfBJRcZScRFOUjbnf
         xhUK+hQPC/9pGaIVz5EAckYNu4LCBL4s5+q6sKYMnXQjG/niMZJgknDXS3X0OWOE349H
         LwM0FDGPPcSg11qzd8kS6ySWr5qQ/EiXi1tnKcCugo/6xpP+3OyWJUEYcHqfNM7K9j0M
         wPkT8c8seIXUwWONySxKh7xnQqkBEHjLDSo8odatUUrDID8vcv18g4gX04zADjrCKlFu
         +eFHi4E90K0o4q0UeZmMvbQDZvOtwNbTvKlp311M51kPTMfP8IBetMSCWD1gti3pUZ9S
         bQVw==
X-Gm-Message-State: AC+VfDw50suWZ/iJNeqwCFkWPiOlvpv5UbJAfzPZUzkrkJSCzrIAqDHV
	by63kDtoTO5T9xwDeproj2H8Aj8qWlBOieoy5mk=
X-Google-Smtp-Source: ACHHUZ7iy6IzpGuZjLgfMbsIGge1LcXwFxLcOuABJmpDo9AwNFB5p95pd7fhPZl7gJctRe151ScjKLKDDve23G0ynZc=
X-Received: by 2002:a17:907:3f22:b0:973:f72f:dfac with SMTP id
 hq34-20020a1709073f2200b00973f72fdfacmr93646ejc.67.1685227284847; Sat, 27 May
 2023 15:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230527204753.1385743-1-christopher.w.clark@gmail.com> <17631B1A1D77A842.14832@lists.yoctoproject.org>
In-Reply-To: <17631B1A1D77A842.14832@lists.yoctoproject.org>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Sat, 27 May 2023 15:41:12 -0700
Message-ID: <CACMJ4GZSFDc9xrW9P1BuQ5JmeppFaKVh+Wkf_RD-7aFf22oWjg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/3] xen, xen-tools: Update 4.17
 revision for gcc 13 compatibility
To: christopher.w.clark@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org, bruce.ashfield@gmail.com, 
	Bertrand.Marquis@arm.com
Content-Type: multipart/alternative; boundary="000000000000ade63805fcb48df3"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 27 May 2023 22:41:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8083

--000000000000ade63805fcb48df3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 27, 2023 at 1:48=E2=80=AFPM Christopher Clark via lists.yoctopr=
oject.org
<christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:

> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> ---
> Compile tested for qemux86-64 and raspberrypi4-64;
> posted to fix the build with the new gcc.
>

Hmm, might be something that will need looking at with this series as a
first test with runqemu hasn't booted either the xen-image-minimal or
xtf-image successfully for qemux86-64 target.

Christopher


>
>  recipes-extended/xen/xen-tools_4.17.bb | 4 ++--
>  recipes-extended/xen/xen_4.17.bb       | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-extended/xen/xen-tools_4.17.bb
> b/recipes-extended/xen/xen-tools_4.17.bb
> index 8d9effa..b58d759 100644
> --- a/recipes-extended/xen/xen-tools_4.17.bb
> +++ b/recipes-extended/xen/xen-tools_4.17.bb
> @@ -1,5 +1,5 @@
> -# xen 4.17.0 release sha
> -SRCREV ?=3D "e4a5fb9227889bec99ab212b839680f4d5b51e60"
> +# stable-4.17 status on 5/26/2023
> +SRCREV ?=3D "47eb94123035a2987dd1e328e9adec6db36e7fb3"
>
>  XEN_REL ?=3D "4.17"
>  XEN_BRANCH ?=3D "stable-${XEN_REL}"
> diff --git a/recipes-extended/xen/xen_4.17.bb b/recipes-extended/xen/
> xen_4.17.bb
> index fca9979..9da1b19 100644
> --- a/recipes-extended/xen/xen_4.17.bb
> +++ b/recipes-extended/xen/xen_4.17.bb
> @@ -1,5 +1,5 @@
> -# xen 4.17.0 release sha
> -SRCREV ?=3D "e4a5fb9227889bec99ab212b839680f4d5b51e60"
> +# stable-4.17 status on 5/26/2023
> +SRCREV ?=3D "47eb94123035a2987dd1e328e9adec6db36e7fb3"
>
>  XEN_REL ?=3D "4.17"
>  XEN_BRANCH ?=3D "stable-${XEN_REL}"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8081):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8081
> Mute This Topic: https://lists.yoctoproject.org/mt/99173447/3619037
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> christopher.w.clark@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ade63805fcb48df3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, May 27, 2023 at 1:48=E2=80=AFPM C=
hristopher Clark via <a href=3D"http://lists.yoctoproject.org">lists.yoctop=
roject.org</a> &lt;christopher.w.clark=3D<a href=3D"mailto:gmail.com@lists.=
yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div>=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Signed-off-by: Christopher Clark &lt;<a href=3D"mailto:christopher.w.clar=
k@gmail.com" target=3D"_blank">christopher.w.clark@gmail.com</a>&gt;<br>
---<br>
Compile tested for qemux86-64 and raspberrypi4-64;<br>
posted to fix the build with the new gcc.<br></blockquote><div><br></div><d=
iv>Hmm, might be something that will need looking at with this series as a =
first test with runqemu hasn&#39;t booted either the xen-image-minimal or x=
tf-image successfully for qemux86-64 target.</div><div><br></div><div>Chris=
topher</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen-tools_4.17.bb" rel=3D"nore=
ferrer" target=3D"_blank">xen-tools_4.17.bb</a> | 4 ++--<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen_4.17.bb" rel=3D"noreferrer=
" target=3D"_blank">xen_4.17.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A02 files changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/recipes-extended/xen/<a href=3D"http://xen-tools_4.17.bb" rel=
=3D"noreferrer" target=3D"_blank">xen-tools_4.17.bb</a> b/recipes-extended/=
xen/<a href=3D"http://xen-tools_4.17.bb" rel=3D"noreferrer" target=3D"_blan=
k">xen-tools_4.17.bb</a><br>
index 8d9effa..b58d759 100644<br>
--- a/recipes-extended/xen/<a href=3D"http://xen-tools_4.17.bb" rel=3D"nore=
ferrer" target=3D"_blank">xen-tools_4.17.bb</a><br>
+++ b/recipes-extended/xen/<a href=3D"http://xen-tools_4.17.bb" rel=3D"nore=
ferrer" target=3D"_blank">xen-tools_4.17.bb</a><br>
@@ -1,5 +1,5 @@<br>
-# xen 4.17.0 release sha<br>
-SRCREV ?=3D &quot;e4a5fb9227889bec99ab212b839680f4d5b51e60&quot;<br>
+# stable-4.17 status on 5/26/2023<br>
+SRCREV ?=3D &quot;47eb94123035a2987dd1e328e9adec6db36e7fb3&quot;<br>
<br>
=C2=A0XEN_REL ?=3D &quot;4.17&quot;<br>
=C2=A0XEN_BRANCH ?=3D &quot;stable-${XEN_REL}&quot;<br>
diff --git a/recipes-extended/xen/<a href=3D"http://xen_4.17.bb" rel=3D"nor=
eferrer" target=3D"_blank">xen_4.17.bb</a> b/recipes-extended/xen/<a href=
=3D"http://xen_4.17.bb" rel=3D"noreferrer" target=3D"_blank">xen_4.17.bb</a=
><br>
index fca9979..9da1b19 100644<br>
--- a/recipes-extended/xen/<a href=3D"http://xen_4.17.bb" rel=3D"noreferrer=
" target=3D"_blank">xen_4.17.bb</a><br>
+++ b/recipes-extended/xen/<a href=3D"http://xen_4.17.bb" rel=3D"noreferrer=
" target=3D"_blank">xen_4.17.bb</a><br>
@@ -1,5 +1,5 @@<br>
-# xen 4.17.0 release sha<br>
-SRCREV ?=3D &quot;e4a5fb9227889bec99ab212b839680f4d5b51e60&quot;<br>
+# stable-4.17 status on 5/26/2023<br>
+SRCREV ?=3D &quot;47eb94123035a2987dd1e328e9adec6db36e7fb3&quot;<br>
<br>
=C2=A0XEN_REL ?=3D &quot;4.17&quot;<br>
=C2=A0XEN_BRANCH ?=3D &quot;stable-${XEN_REL}&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8081): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8081" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8081</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/99173447/3619=
037" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/99173447/3619037</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:christopher.w.clark@gm=
ail.com" target=3D"_blank">christopher.w.clark@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000ade63805fcb48df3--

