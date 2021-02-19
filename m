Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.10331.1613749768194383499
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 19 Feb 2021 07:49:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pwBoM7P1;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id n1so10761238edv.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Feb 2021 07:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=La3qvaKaEnufgg4fklS36exUSy3uw7FsfeuvBsjWGMk=;
        b=pwBoM7P1JA3Zf628y9vmMA+ncjVZjDVxdLUoitVcdwG/3VcaYRlRQjsC51/O+bIl6n
         5yjiLmCDCEBo1Ax2QXHgis85mmmJoPLp4fwmqWJJpbi9WzTRwnHNbSr3DlP4gWWJq9PU
         xrCB9Ncn+VyCyXTxnUKlc/yAinpGe6bI746DOqifC8wBnAjR8rfHriPqhBTAdnBIRq6Z
         bh6cMTGtYINY4JorM7VyMUUzacD0ypY44kMzXhFOpULYodFN3H+zoqAfP2AGTj0Yqp2u
         IXr5WAgnEoDtelmX1stZN/UY7WQnd/faYo7R+ywIurC4rYA+ahzVlPeX3zOxQlr0d962
         pR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=La3qvaKaEnufgg4fklS36exUSy3uw7FsfeuvBsjWGMk=;
        b=c0+Po8nGzCg1Y85QaVAIyfwmzXaXsZuDqgZu2vJPRAZo9/AV/2Zc+N2FKThTrO7lNp
         Q1G/X5B6n6Th2mf2mitJFzdiZ0bAJSlDdx19hyk46KYgYO4y5IyvuIUvkNZ7R6CTreew
         XJyzL4xml4CeBDHkBsTOxVQ1zhzMpEoXV/ZL0ZxQjsDLCjm0IBA28WNqyRE7tkd8O/Et
         +Wf886wTnNWaXjL3eDqCigMWbh/TVPWqxk3ueU2HnjiwmUiZd1HnZF8u0enUwYcJ+PFC
         zI+wiLlLcAyPcBPBJah5KwzCHY+LAWVGvdZSKG0uYZ8ZKVXR+b2lN0/O9ED5d5F8OwHU
         omBQ==
X-Gm-Message-State: AOAM532tnAeeKYgyVBo0ppWNHlgaG9xcU5k6wnVtZNMibg+iU5htM67h
	WGPFhq7XY8+Si0bHBHgnNPzH5Y0ztVkBUv+ph3k=
X-Google-Smtp-Source: ABdhPJyP1n/BByp/1qndsF4Kyj+ltc6UDBT56n3zNbDckW9JqOFnJpU2GYTLQg8qY9r0TnEClK21KMfXUxBl74cSDHA=
X-Received: by 2002:a05:6402:26c9:: with SMTP id x9mr9888741edd.365.1613749766659;
 Fri, 19 Feb 2021 07:49:26 -0800 (PST)
MIME-Version: 1.0
References: <20210218215515.330689-1-Martin.Jansa@gmail.com>
In-Reply-To: <20210218215515.330689-1-Martin.Jansa@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 19 Feb 2021 10:49:15 -0500
Message-ID: <CADkTA4MGB4TDfs5xt+8eRirrFUPwJLzqBSLskYa-+yCS5YqwuA@mail.gmail.com>
Subject: Re: [meta-virtualization][dunfell][PATCH] libvirt-python: inherit python3targetconfig
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000009923bb05bbb265eb"

--0000000000009923bb05bbb265eb
Content-Type: text/plain; charset="UTF-8"

Cherry picked to dunfell.

Bruce

On Thu, Feb 18, 2021 at 4:55 PM Martin Jansa <Martin.Jansa@gmail.com> wrote:

> * otherwise libvirt build will incorrectly use host's gcc and fail with:
>   gcc: error: unrecognized command line option
> "-fmacro-prefix-map=/OE/libvirt/6.1.0-r0=/usr/src/debug/libvirt/6.1.0-r0"
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-extended/libvirt/libvirt-python.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/libvirt/libvirt-python.inc
> b/recipes-extended/libvirt/libvirt-python.inc
> index c5b0fbd..ad4d247 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -1,4 +1,4 @@
> -inherit python3native python3-dir
> +inherit python3native python3-dir python3targetconfig
>
>  export STAGING_INCDIR
>  export STAGING_LIBDIR
> --
> 2.27.0
>
>
> 
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000009923bb05bbb265eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Che=
rry picked to dunfell.</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Br=
uce</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Thu, Feb 18, 2021 at 4:55 PM Martin Jansa &lt;<a href=3D"mailto=
:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">* otherwise libvirt build wi=
ll incorrectly use host&#39;s gcc and fail with:<br>
=C2=A0 gcc: error: unrecognized command line option &quot;-fmacro-prefix-m=
ap=3D/OE/libvirt/6.1.0-r0=3D/usr/src/debug/libvirt/6.1.0-r0&quot;<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/libvirt/libvirt-python.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extende=
d/libvirt/libvirt-python.inc<br>
index c5b0fbd..ad4d247 100644<br>
--- a/recipes-extended/libvirt/libvirt-python.inc<br>
+++ b/recipes-extended/libvirt/libvirt-python.inc<br>
@@ -1,4 +1,4 @@<br>
-inherit python3native python3-dir<br>
+inherit python3native python3-dir python3targetconfig<br>
<br>
=C2=A0export STAGING_INCDIR<br>
=C2=A0export STAGING_LIBDIR<br>
-- <br>
2.27.0<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div>

--0000000000009923bb05bbb265eb--
