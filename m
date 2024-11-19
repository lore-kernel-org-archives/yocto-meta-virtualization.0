Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1C4D60D0C
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 02:30:27 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.11813.1731983422524835318
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Nov 2024 18:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ms3TKel9;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-723db2798caso3949121b3a.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 18 Nov 2024 18:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731983422; x=1732588222; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EocQiIsrqpGahk+poKmPcwe+4QgmRzI2+7OelFG4fes=;
        b=Ms3TKel9iM8YK52obeu4I6ETyQtP/N0Pq3UYVHvre5A/I3nZYILfRUuglHL7SVE+4f
         c6b6tj1wGS82bAvJRidS4WzA+sXdLD0HiXlQNNNXSP+/cr1Ko8col7CzahBH/bmNL4En
         Mm/E6ISPvSbtH1Rpew0MKuL/J15waFH4jiUa+6aoDUOKM4vpwyLOGjyRCUKZtM0r9OFt
         r1kiXk0oSDUjD+zijY9x4XHSc9JoqJM/J9WmKi2xYvUSyZoIZ6BhLx7pbHC7uOENU7nv
         lTpSnTKjLcPw0lXkrGw+U+iBzZj930kffiBiTNANnipbNlpl/nHdKvPL+Dmq1UcE1Gvs
         fQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731983422; x=1732588222;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EocQiIsrqpGahk+poKmPcwe+4QgmRzI2+7OelFG4fes=;
        b=NdzSBly/l49cILp/Y9jJuf3n5prX8t03ERTyH2t2laMhLGbvwfqIefXSOsg83v6U7/
         3LAfrddtqt8VEUFCkX1EVn2PwMKsDK26uSsLJysYeCL316GEw7kbkxtMHtNkHNSlhZDX
         vIU+9jXHbowxTKm1vO+JKkVK0G391UJWMlVd2vyIGA869bG43eFuSrggXxnbtTatJKRF
         8sqK6LxlVK4m2l+gr94zfsVYU2Us5ZbZdVMTcL4ycSZ6axyCiEyw9e4bQI74mr6EXnT5
         36ZjZCt2Wa8aprbaZl44mx5JTBv6b/z5UWmP5Y58Ko1F3repC/c2WKVhsmB5N5NFR1SG
         pVdw==
X-Gm-Message-State: AOJu0YxzJpouBHmjaYCyRvwlvZyi1VFavMLUAav3VWOWda7Xnpi9FIbB
	CEkEQYBGZb2bM8c05hQr5h0NsX2GmoCBX1kg1fdFnPTWXg4heHL5Syko0vfx67hUEN/KxVT7WeY
	4C0HvYlfvyW0hdaJCGNQ71r0BaGM=
X-Google-Smtp-Source: AGHT+IEYQMugVaqiKt4dXL7TkXHLfeVfuMXYKhDr31AqKND/8rf6mbx7CfbR65LEfT4Og0ZDlia8HzvqmEV7Ahsr7Pc=
X-Received: by 2002:a17:90b:3c92:b0:2ea:5e0c:2843 with SMTP id
 98e67ed59e1d1-2ea5e1b7362mr9190655a91.8.1731983421776; Mon, 18 Nov 2024
 18:30:21 -0800 (PST)
MIME-Version: 1.0
References: <20241118223240.2479834-1-stanley.stanton@taitcommunications.com>
In-Reply-To: <20241118223240.2479834-1-stanley.stanton@taitcommunications.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 18 Nov 2024 21:30:10 -0500
Message-ID: <CADkTA4OTj3P=kKv+KWaez_ruac-7swiEEKiw1VqLZJFebDVbew@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] xen.inc: python 3.12: fix datetime
 deprecation warning
To: stanley.stanton@taitcommunications.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000009cab3a06273ad0a4"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Nov 2024 02:30:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8973

--0000000000009cab3a06273ad0a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2024 at 5:32=E2=80=AFPM Stanley Stanton via lists.yoctoproj=
ect.org
<stanley.stanton=3Dtaitcommunications.com@lists.yoctoproject.org> wrote:

> Datetime.UTC seems is a wrapper for datetime.timezone.utc,
> which is available on both python 3.10, and python 3.12 (Ubuntu 24.04)
> so, opt to use that instead.
>

No objection to the patch, but this commit log doesn't actually tell me
what the problem is, so I can't tell what this is fixing.

Bruce



>
> Signed-off-by: Stanley Stanton <stanley.stanton@taitcommunications.com>
> ---
>  recipes-extended/xen/xen.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index dcd281b5..63790f73 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -151,7 +151,7 @@ def get_build_time_vars(d):
>      source_date_epoch =3D d.getVar('SOURCE_DATE_EPOCH')
>      if source_date_epoch is not None:
>          import datetime
> -        utc_datetime =3D
> datetime.datetime.utcfromtimestamp(float(source_date_epoch))
> +        utc_datetime =3D
> datetime.datetime.fromtimestamp(float(source_date_epoch),
> datetime.timezone.utc)
>          return " XEN_BUILD_DATE=3D" + utc_datetime.strftime("%Y-%m-%d") =
+ \
>                 " XEN_BUILD_TIME=3D" + utc_datetime.strftime("%H:%M:%S")
>      return ""
> --
> 2.43.0
>
>
> --
>
> This communication is confidential. We only send and receive email on the
> basis of the terms set out at www.taitcommunications.com/email_disclaimer
> <http://www.taitcommunications.com/email_disclaimer>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8972):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8972
> Mute This Topic: https://lists.yoctoproject.org/mt/109654730/1050810
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

--0000000000009cab3a06273ad0a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Nov 18, 2024 at 5:32=E2=80=AFPM Stanley Sta=
nton via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</=
a> &lt;stanley.stanton=3D<a href=3D"mailto:taitcommunications.com@lists.yoc=
toproject.org">taitcommunications.com@lists.yoctoproject.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Datetime.UTC se=
ems is a wrapper for datetime.timezone.utc,<br>
which is available on both python 3.10, and python 3.12 (Ubuntu 24.04)<br>
so, opt to use that instead.<br></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">No objection to the patch, but=
 this commit log doesn&#39;t actually tell me what the problem is, so I can=
&#39;t tell what this is fixing.</div><div class=3D"gmail_default" style=3D=
"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
Signed-off-by: Stanley Stanton &lt;<a href=3D"mailto:stanley.stanton@taitco=
mmunications.com" target=3D"_blank">stanley.stanton@taitcommunications.com<=
/a>&gt;<br>
---<br>
=C2=A0recipes-extended/xen/xen.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index dcd281b5..63790f73 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -151,7 +151,7 @@ def get_build_time_vars(d):<br>
=C2=A0 =C2=A0 =C2=A0source_date_epoch =3D d.getVar(&#39;SOURCE_DATE_EPOCH&#=
39;)<br>
=C2=A0 =C2=A0 =C2=A0if source_date_epoch is not None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0import datetime<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 utc_datetime =3D datetime.datetime.utcfromtime=
stamp(float(source_date_epoch))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 utc_datetime =3D=C2=A0 datetime.datetime.fromt=
imestamp(float(source_date_epoch), datetime.timezone.utc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot; XEN_BUILD_DATE=3D&quot; + u=
tc_datetime.strftime(&quot;%Y-%m-%d&quot;) + \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; XEN_BUILD_TI=
ME=3D&quot; + utc_datetime.strftime(&quot;%H:%M:%S&quot;)<br>
=C2=A0 =C2=A0 =C2=A0return &quot;&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-- <br>
<br>
This communication is confidential. We only send and receive email on the<b=
r>
basis of the terms set out at <a href=3D"http://www.taitcommunications.com/=
email_disclaimer" rel=3D"noreferrer" target=3D"_blank">www.taitcommunicatio=
ns.com/email_disclaimer</a> <br>
&lt;<a href=3D"http://www.taitcommunications.com/email_disclaimer" rel=3D"n=
oreferrer" target=3D"_blank">http://www.taitcommunications.com/email_discla=
imer</a>&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8972): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8972" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8972</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/109654730/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/109654730/1050810</a><br>
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

--0000000000009cab3a06273ad0a4--

