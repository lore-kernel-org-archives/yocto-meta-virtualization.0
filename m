Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web12.8511.1613485693231915944
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 16 Feb 2021 06:28:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DD6E1qsd;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id n13so10256171ejx.12
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Feb 2021 06:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lHZLeyeMnQWcFiJzI3ceJYJzH/NqQHCfCKIGd4N7bBs=;
        b=DD6E1qsdqWci+lAXy/42JN2dwq+wU978N0xhJAkXdiqLHfFjiWjJRMKdUiQ1gvdz3J
         fMaJyzVuZyz54iWP/mYragIIoIrlufYime4fzv6HyNYL7PjuG3ZdC7Z6iXKMJ0G+X548
         +JyxA59B2ylY8eRrcuIdEFV7IAZzQvh4POaaZuXrYlmw+gqk/JdXayZ9+bDs0LfJ0euJ
         dJVnPFmijbKB0dQ/jCDI5Uy4nuA5EtBN/T+kyedJrCJ+nQpoGFvWQMoy+1+2Uw/XrLQv
         9rMjCInk10TJsVJRU8ewbgzhWjsAbuKMpIJ9B0PbtYKd6E02wFQxtcQJnrCruQSQ2hJP
         /ryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lHZLeyeMnQWcFiJzI3ceJYJzH/NqQHCfCKIGd4N7bBs=;
        b=oyTBYJ7T/MLEE50YkexbBm2Hc359Ej3ZjsMFXBp/H323kMeW1po/iIDQs+obWpNqP+
         n/KuG+FZFG7moo5rABKp8H1Gp6WVZpqrmWZVX+31LQ0cLm9ydv0et60PI00V9dnfsKUo
         PEnd5otfCdwEIDDLijCpvtS5qbFYwXPdERRXY3C5k9fju+VLc3pZbVX6uH61sElyHE6Z
         xmxfx481E0DkDv8sQ6kzXVCAYqlsC+DUk4pu97z/ME2RhMCwZh8BGDN9i+FutVD2DVbE
         KC3X+D4+QHwDSmrMPJP46Lp5NgpJB7RAhKpyRAWNQ+E49WvqF/5hEMscUy+lRDVNodjK
         183Q==
X-Gm-Message-State: AOAM530uPOzgYjMjQJwk8dVjRJsSZw+4PmDEbZnwAc+T1fEyLeWhP36P
	PiPO75hv7lF9EV7h5qUtCgMiVQnFLIwSNJFbzlc=
X-Google-Smtp-Source: ABdhPJwKDUltUm6n3YEWv8J+qwBw1wnJp28LpOL+fJVZq5UgKCREQ4ZYg99uXOexXdmos3ty57+jDckwkRFUelkXAEI=
X-Received: by 2002:a17:906:2697:: with SMTP id t23mr21001000ejc.357.1613485691735;
 Tue, 16 Feb 2021 06:28:11 -0800 (PST)
MIME-Version: 1.0
References: <20210214111226.74201-1-Martin.Jansa@gmail.com>
In-Reply-To: <20210214111226.74201-1-Martin.Jansa@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 16 Feb 2021 09:28:00 -0500
Message-ID: <CADkTA4O-+x6gqAaGvBDAZArOC6hmSe1Yya5Gg-rPbTqSw_Ebeg@mail.gmail.com>
Subject: Re: [meta-virtualization][gatesgarth][PATCH] libvirt-python: inherit python3targetconfig
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000081921c05bb74e97d"

--00000000000081921c05bb74e97d
Content-Type: text/plain; charset="UTF-8"

I was watching/waiting on this as well.

Cherry picked to gatesgarth and I noticed that Steve had queued the changes
for dunfell as well. I'll checked later to see if they are in place.

Bruce

On Sun, Feb 14, 2021 at 6:12 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:

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
> index 7b87d5e..bcd7657 100644
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

--00000000000081921c05bb74e97d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">I was watching/waiting on this as well.</div><div class=3D"gm=
ail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">Cherry picked to gatesgarth and I noticed that=
 Steve had queued the changes for dunfell as well. I&#39;ll checked later t=
o see if they are in place.</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Bruce</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Feb 14, 2021 at 6:12 AM Martin Jansa &lt;<a href=
=3D"mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">* otherwise libvi=
rt build will incorrectly use host&#39;s gcc and fail with:<br>
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
index 7b87d5e..bcd7657 100644<br>
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
 - Gandalf, Star Trek II<br><br></div></div>

--00000000000081921c05bb74e97d--
