Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web11.3522.1596853403438269870
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 19:23:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qbM7wbY9;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id q4so2532313edv.13
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 07 Aug 2020 19:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b8WWFgcFQMToxdMi/8njURBgI+LISuDfT4Rzg1adtMk=;
        b=qbM7wbY9I5jgo4g++cEFOGDavlDIzPhsc5pF3aM4qKtIlIsBakSGQQcaACLiJNQ0iA
         OPiwcuq50ON0JqZfBWyDuhUPSmz91YBTEW4h5u8XU9rQBZbgf1qVGGTX7p05AYkzuHU3
         fgHatVYbd6SADVQRirbFzCzClu4/FEkCr/T2j3UiddB6mVYneJblVPPIlxPhNu/a0V6P
         CxFUP+Fvr0Li//CNdsNzgNxLWbOGXau+0A4bAobhi0z1gWKTuQCVbtSFaR2ObP8luoh4
         25G7JIXYEZ6OaZGTCClFwKI0PXQeO9WLC+DH/qUXR6zk2ZJNLt/rml7Oipa812jSzT3M
         Gr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b8WWFgcFQMToxdMi/8njURBgI+LISuDfT4Rzg1adtMk=;
        b=mmR9kgJJlh5XS2yZYmeyNJ+zMg/omRCmzLaQcicn3ti93GRqF2iwOEl6l9Cc9uSJHk
         426FAaP7u357YyTLhW68DaY3JjPpkM95CFzF9YYTphrvXlV2d+2LPgimBNXo7902zciA
         /LNkBx/2nE0hSHV7V5bL0zMq50KFo5iqTyvPPsN5GtAm5hNQrQr+Gda67eGD5Iz6eb9u
         be11+g1uF+000AhFlBWKwTq0SDNNs8CeIAvu99LPPhc/16um1h9V69cY/KY1Fj4lrJNI
         Ru/g5nBJuYeGNcNIrHBMXDcbU7p0+OFVrZEoLKLi23hiOurJGbVY62K+wx3veQ3BYju3
         aK1A==
X-Gm-Message-State: AOAM531mNBDaThw/d0qGNGCLjZzUXcOEXnO5tDmrynX0Ix020neHe8cz
	Qk32fEW5yVuVMdwdFzAa9Bn+8Q4I8vPUSaUaOSXylDiBUZE=
X-Google-Smtp-Source: ABdhPJyUZmZ7vuA/GxGLj36Kys19utKep4cJBwyqdVovzon8Hcyu2NMJBheta6ucEwNBH8l7XxuR+LI/51oF+I4zDKg=
X-Received: by 2002:a50:ec90:: with SMTP id e16mr11927470edr.234.1596853401897;
 Fri, 07 Aug 2020 19:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200805174403.14687-1-joe.slater@windriver.com>
In-Reply-To: <20200805174403.14687-1-joe.slater@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 7 Aug 2020 22:23:10 -0400
Message-ID: <CADkTA4OwAvG6A4YQmK9rCBxUBU1M91sfDap9SNBj=4P8m_h_aw@mail.gmail.com>
Subject: Re: [meta-virtualization] [meta-virt][PATCH 1/1] lxc: check for busybox in run-ptest
To: Joe Slater <joe.slater@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000c7515605ac5467b3"

--000000000000c7515605ac5467b3
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 5, 2020 at 1:44 PM Joe Slater <joe.slater@windriver.com> wrote:

> Lots of tests require busybox, so we look for it when
> run-ptest starts.  We also sort logs depending on
> success or failure.
>

But why don't the ptest packages just have busybox as a rdepends ?

The logging changes look ok, but these are better split into two patches.

Cheers,

Bruce



>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  recipes-containers/lxc/files/run-ptest | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-containers/lxc/files/run-ptest
> b/recipes-containers/lxc/files/run-ptest
> index 3f3a75f..948b893 100644
> --- a/recipes-containers/lxc/files/run-ptest
> +++ b/recipes-containers/lxc/files/run-ptest
> @@ -18,16 +18,24 @@ failed=0
>  skipped=0
>
>  # Create logs dir and clear old logs if any
> -mkdir logs 2> /dev/null
> -rm -f logs/*
> +rm -rf logs
> +mkdir -p logs/pass
>
>  echo "### Starting LXC ptest ###"
>
> +if ! which busybox &> /dev/null
> +then
> +    echo "busybox must be installed and on PATH"
> +    echo "### LXC ptest complete ###"
> +    echo "FAIL: lxc ptest configuration"
> +fi
> +
>  for test in ./tests/*
>  do
>      if [[ ! $blacklist = *$(basename $test)*  ]]
>      then
> -       $test >logs/$(basename $test).log 2>&1
> +        lfile="logs/$(basename $test).log"
> +       $test > $lfile 2>&1
>      else
>         echo "SKIPPED: $(basename $test)"
>         skipped=$((skipped+1))
> @@ -38,6 +46,7 @@ do
>      then
>         echo "PASS: $(basename $test)"
>         passed=$((passed+1))
> +        mv $lfile logs/pass
>      else
>         echo "FAIL: $(basename $test)"
>         failed=$((failed+1))
> --
> 2.7.4
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000c7515605ac5467b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Aug 5, 2020 at 1:44 PM Joe Slater &lt;<a hr=
ef=3D"mailto:joe.slater@windriver.com">joe.slater@windriver.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Lots of test=
s require busybox, so we look for it when<br>
run-ptest starts.=C2=A0 We also sort logs depending on<br>
success or failure.<br></blockquote><div><br></div><div><div class=3D"gmai=
l_default" style=3D"font-size:small">But why don&#39;t the ptest packages j=
ust have busybox as a rdepends ?=C2=A0</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">The logging changes look ok, but these are better split into =
two patches.</div><div class=3D"gmail_default" style=3D"font-size:small"><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small">Cheers,</div=
><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=
=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Joe Slater &lt;<a href=3D"mailto:joe.slater@windriver.com" =
target=3D"_blank">joe.slater@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/lxc/files/run-ptest | 15 ++++++++++++---<br>
=C2=A01 file changed, 12 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/recipes-containers/lxc/files/run-ptest b/recipes-containers/l=
xc/files/run-ptest<br>
index 3f3a75f..948b893 100644<br>
--- a/recipes-containers/lxc/files/run-ptest<br>
+++ b/recipes-containers/lxc/files/run-ptest<br>
@@ -18,16 +18,24 @@ failed=3D0<br>
=C2=A0skipped=3D0<br>
<br>
=C2=A0# Create logs dir and clear old logs if any<br>
-mkdir logs 2&gt; /dev/null<br>
-rm -f logs/*<br>
+rm -rf logs<br>
+mkdir -p logs/pass<br>
<br>
=C2=A0echo &quot;### Starting LXC ptest ###&quot;<br>
<br>
+if ! which busybox &amp;&gt; /dev/null<br>
+then<br>
+=C2=A0 =C2=A0 echo &quot;busybox must be installed and on PATH&quot;<br>
+=C2=A0 =C2=A0 echo &quot;### LXC ptest complete ###&quot;<br>
+=C2=A0 =C2=A0 echo &quot;FAIL: lxc ptest configuration&quot;<br>
+fi<br>
+<br>
=C2=A0for test in ./tests/*<br>
=C2=A0do<br>
=C2=A0 =C2=A0 =C2=A0if [[ ! $blacklist =3D *$(basename $test)*=C2=A0 ]]<br=
>
=C2=A0 =C2=A0 =C2=A0then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$test &gt;logs/$(basename $test).log 2&gt;&amp=
;1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 lfile=3D&quot;logs/$(basename $test).log&quot=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$test &gt; $lfile 2&gt;&amp;1<br>
=C2=A0 =C2=A0 =C2=A0else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;SKIPPED: $(basename $test)&quot;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 skipped=3D$((skipped+1))<br>
@@ -38,6 +46,7 @@ do<br>
=C2=A0 =C2=A0 =C2=A0then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;PASS: $(basename $test)&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 passed=3D$((passed+1))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mv $lfile logs/pass<br>
=C2=A0 =C2=A0 =C2=A0else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;FAIL: $(basename $test)&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 failed=3D$((failed+1))<br>
-- <br>
2.7.4<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div></div>

--000000000000c7515605ac5467b3--
