Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web11.17728.1599078698819768166
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Sep 2020 13:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZLC2jxDX;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id d26so607490ejr.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Sep 2020 13:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f3uqD5jIfV32fpb2eMJJh7npyOwmSXkE5dSB5ZC4T6Q=;
        b=ZLC2jxDXkXuwdDYrEXcc2iZiRGQ7vEAUdlNDslX3Cau75hxnYjeMpYJfGEYi3Cafn8
         8m2dRMdoVm/L6OYyQcnMD6B1suofdzqEMa9c6QYbkihL2cpInaKMXy6qjSdl0nHhAdxt
         OYfX5+dm7tZ7bJtq2QL+I5l8/ZLRbBH1A7ZSgqwoGCbosgvbcFmlMstKtJNvChC3XeXp
         ZtoOCLKMSt6LD5RdJsJZCCybgaCVxENFVKljP0bn1B0Oi1NWxaLSPHa3zF0vr0WtUJ/x
         s7M5SkseSNs3zkyc15/697sa6Y1K7kho++uru0cHIS4fd2Pg5jDy6GBJq+H1ej68eAiL
         GkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f3uqD5jIfV32fpb2eMJJh7npyOwmSXkE5dSB5ZC4T6Q=;
        b=M/axyPfZ6AVmEgyvAbwTH1kB3ab0Ahp8BSFLLGBIvEIKDDIRrczo5MhVNrND2h/G0B
         ir40b1nB53LKgf2g97X4VRZ99mEGpxWbe5BmqQJNzp5lzYmscnaHD6bMxcdLNMGJicNL
         W05/+mjkoMQ5/8HMQyz9yFQ64wEiJker0uwtHK2Y78ax+Af3PremxAsQtUl2EYAxPD6e
         EGVVeDjwSOnaDVQ3x6Xxg2HAlpL4k/d6tWEBiNhuWlrGJSUl9GcBI8/hzJS4VTOOzPEP
         9T+9g5rvTaLJLB4Pn+TJPARwMNv5EPzMRluVvYbYMFVWCM8fXF6qhT7qnKAGddQTEsc2
         8ahA==
X-Gm-Message-State: AOAM532uO3BhA5KWMQc/CaU8SWk7IJ4maDu9651iyGoIaF1xBhpquZei
	jE/yqTInDmqV/eZsekS9ULKQ0dg4BRRHJjUrshI=
X-Google-Smtp-Source: ABdhPJwxLO3A+URJr8Na6+ayUHvg94lv2o4TdBiG1MmMM3IMK6lvjoTCWV2uc9AXcyaikgi9CPvdzhmAaNQRgjtnLxA=
X-Received: by 2002:a17:906:19c7:: with SMTP id h7mr1771982ejd.517.1599078697263;
 Wed, 02 Sep 2020 13:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200901062947.6835-1-Qi.Chen@windriver.com>
In-Reply-To: <20200901062947.6835-1-Qi.Chen@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 2 Sep 2020 16:29:43 -0400
Message-ID: <CADkTA4Ps421g67VOco8VwOBg3e4Tv-tvLm6sc+9iERDp3jAoiw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] nagios-core: fix build failure for gcc-10
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000b7e4ff05ae5a8583"

--000000000000b7e4ff05ae5a8583
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Sep 1, 2020 at 2:29 AM Chen Qi <Qi.Chen@windriver.com> wrote:

> gcc-10 uses '-fno-common' by default, which results in build
> error complaining multiple definition.
>
> Use '-fcommon' to fix this problem.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-extended/nagios/nagios-core_4.4.3.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/recipes-extended/nagios/nagios-core_4.4.3.bb
> b/recipes-extended/nagios/nagios-core_4.4.3.bb
> index 7a86653..c78259e 100644
> --- a/recipes-extended/nagios/nagios-core_4.4.3.bb
> +++ b/recipes-extended/nagios/nagios-core_4.4.3.bb
> @@ -62,6 +62,9 @@ EXTRA_OECONF += "ac_cv_header_ltdl_h=no"
>  # Prevent nagios from suffering host contamination if host has /bin/perl
>  EXTRA_OECONF += "ac_cv_path_PERL=${bindir}/perl"
>
> +# Fix build failure for gcc-10
> +CFLAGS_append = " -fcommon"
> +
>  # Set to "1" to allow nagios-core post-init to modify Apache configuration
>  NAGIOS_MODIFY_APACHE ??= "1"
>
> --
> 2.21.0
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000b7e4ff05ae5a8583
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Se=
p 1, 2020 at 2:29 AM Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Q=
i.Chen@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">gcc-10 uses &#39;-fno-common&#39; by default, which res=
ults in build<br>
error complaining multiple definition.<br>
<br>
Use &#39;-fcommon&#39; to fix this problem.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/nagios/<a href=3D"http://nagios-core_4.4.3.bb" rel=
=3D"noreferrer" target=3D"_blank">nagios-core_4.4.3.bb</a> | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/recipes-extended/nagios/<a href=3D"http://nagios-core_4.4.3.b=
b" rel=3D"noreferrer" target=3D"_blank">nagios-core_4.4.3.bb</a> b/recipes-=
extended/nagios/<a href=3D"http://nagios-core_4.4.3.bb" rel=3D"noreferrer" =
target=3D"_blank">nagios-core_4.4.3.bb</a><br>
index 7a86653..c78259e 100644<br>
--- a/recipes-extended/nagios/<a href=3D"http://nagios-core_4.4.3.bb" rel=
=3D"noreferrer" target=3D"_blank">nagios-core_4.4.3.bb</a><br>
+++ b/recipes-extended/nagios/<a href=3D"http://nagios-core_4.4.3.bb" rel=
=3D"noreferrer" target=3D"_blank">nagios-core_4.4.3.bb</a><br>
@@ -62,6 +62,9 @@ EXTRA_OECONF +=3D &quot;ac_cv_header_ltdl_h=3Dno&quot;<b=
r>
=C2=A0# Prevent nagios from suffering host contamination if host has /bin/=
perl<br>
=C2=A0EXTRA_OECONF +=3D &quot;ac_cv_path_PERL=3D${bindir}/perl&quot;<br>
<br>
+# Fix build failure for gcc-10<br>
+CFLAGS_append =3D &quot; -fcommon&quot;<br>
+<br>
=C2=A0# Set to &quot;1&quot; to allow nagios-core post-init to modify Apac=
he configuration<br>
=C2=A0NAGIOS_MODIFY_APACHE ??=3D &quot;1&quot;<br>
<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div>

--000000000000b7e4ff05ae5a8583--
