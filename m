Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D10E64AB6
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 14:42:25 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.21361.1733236936435954779
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Dec 2024 06:42:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BEDtlU+e;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-215853ed047so28011915ad.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Dec 2024 06:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733236936; x=1733841736; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zcr3bSxvpVVWAaZb6Oz+KyekQCpMQPGAh8asBv4fJXI=;
        b=BEDtlU+e4rwd4f9wfu5b4CYGw62cT25CHbMHzfm2xzSmDtAziqroYFaPAkLsisXDrO
         YtPFofhtELLzuf8bWpP7gPJeuhUbfeQ4Y95+1dVwuaJ2x+DIwU2vlacbcLK9T8Rx92ov
         mL1X9nyy7gnhNi+XnUvYJs+PNf0wWrUDh7dBrwGkUQTKPnSSX7cYSbeX1n0cy+8Y5a1v
         VidsB99+Pox7373o918GxwlKOH/7SHocPdWKQSWOffWAayTx5wttzg09Y+4UGkVGQiCo
         YSbfWszHf49YX0bBop+WhptgFHKI9wfSJtzIgrk4eCtCM0OrHbd6iGWNBf5glAMKb+BV
         2QZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733236936; x=1733841736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zcr3bSxvpVVWAaZb6Oz+KyekQCpMQPGAh8asBv4fJXI=;
        b=RxcX3zVLg7MTKnbmirokM08NTzA9p3GGk5I00l+oNDlgsqYcxYfVW+TOxP/1wG1aJu
         fPEoBOVWMwISYrAlY43XVJqrbjSvNVjvlmYLyhI/M6YmPBcS5nKAkWBPsgrg43L2cNUx
         lUqIkCCwVDEfAxhl3Afq0HzEd/U7XskQQE4zGSTc01cxjadHO95EeUe5S3aw3AgqtBOV
         doyNqi8Z8neKHlt4igIgc9wBT95AUtOBU2U5yKGbQGeteERhOXCSOMOXUEjTCLebIs6t
         hPKxkQIzORJZxpUjN+zLGjR1yHhX8xPZ7NA7xO4p4KHnpa8jleTcOnMw9gOXzUO7O+Lq
         qHAQ==
X-Gm-Message-State: AOJu0Yx2M3VlaLdiFN5sQRJ6pSjoNL1Ek4hG45TGSc79hiFxIiIIj2vx
	WNA3N58QAoip3bnMiv3nAaVv62vLckdYoGFr2veW6s76m3LZSU9dUh/JbSFQoLLCgvLlrxmuPdf
	SBHzyXr6mL9BvSi3B+TW44w/gqSg=
X-Gm-Gg: ASbGnct/EqiQS+2LiIM3QbMhZqVQJEL6IceRGJUHH6/GYRDxIdxQERGPn9LglttTIn0
	yi3JBR90sPvr5E6R7VWzaoCxcLwq8C2+P
X-Google-Smtp-Source: AGHT+IEpXJ07c5N9BcPrOPZtfZ6eP0MzOKIyyoX6z9/siqwBCInJmPdust3xyPa6oQkH0bg1Ua/bM6hCz72eWp0dJU4=
X-Received: by 2002:a17:902:f64d:b0:212:5786:7bb6 with SMTP id
 d9443c01a7336-215bcfc4712mr36836225ad.3.1733236935623; Tue, 03 Dec 2024
 06:42:15 -0800 (PST)
MIME-Version: 1.0
References: <20241203124748.3731353-1-vanusuri@mvista.com>
In-Reply-To: <20241203124748.3731353-1-vanusuri@mvista.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Dec 2024 09:42:04 -0500
Message-ID: <CADkTA4P51-mVRXU3phWSucNc2A6YrodgOgcFZAg_CeR7G34YDw@mail.gmail.com>
Subject: Re: [meta-virtualization][m-c-s][master][PATCH] libvirt: Add missing
 "_" to bbappend
To: vanusuri@mvista.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000dc0d9806285eabd6"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Dec 2024 14:42:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9036

--000000000000dc0d9806285eabd6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There's no difference to those bbappends in my experience.

The % is not a glob, but a wildcard that says "match until the end of the
recipe name".

Is there some sort of other libvirt recipe that this is matching by mistake
?

Bruce

On Tue, Dec 3, 2024 at 7:48=E2=80=AFAM Vijay Anusuri via lists.yoctoproject=
.org
<vanusuri=3Dmvista.com@lists.yoctoproject.org> wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../libvirt/{libvirt%.bbappend =3D> libvirt_%.bbappend}             | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-openstack/recipes-extended/libvirt/{libvirt%.bbappend =3D>
> libvirt_%.bbappend} (100%)
>
> diff --git a/meta-openstack/recipes-extended/libvirt/libvirt%.bbappend
> b/meta-openstack/recipes-extended/libvirt/libvirt_%.bbappend
> similarity index 100%
> rename from meta-openstack/recipes-extended/libvirt/libvirt%.bbappend
> rename to meta-openstack/recipes-extended/libvirt/libvirt_%.bbappend
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9035):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9035
> Mute This Topic: https://lists.yoctoproject.org/mt/109899092/1050810
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

--000000000000dc0d9806285eabd6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defa=
ult" style=3D"font-size:small">There&#39;s no difference to those bbappends=
 in my experience.</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">The % =
is not a glob, but a wildcard that says &quot;match until the end of the re=
cipe name&quot;.</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Is there=
 some sort of other libvirt recipe that this is matching by mistake ?</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 3, 2024=
 at 7:48=E2=80=AFAM Vijay Anusuri via <a href=3D"http://lists.yoctoproject.=
org" target=3D"_blank">lists.yoctoproject.org</a> &lt;vanusuri=3D<a href=3D=
"mailto:mvista.com@lists.yoctoproject.org" target=3D"_blank">mvista.com@lis=
ts.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvist=
a.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../libvirt/{libvirt%.bbappend =3D&gt; libvirt_%.bbappend}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A01 file changed, 0 insertions(+), 0 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-extended/libvirt/{libvirt%.bbappend =3D=
&gt; libvirt_%.bbappend} (100%)<br>
<br>
diff --git a/meta-openstack/recipes-extended/libvirt/libvirt%.bbappend b/me=
ta-openstack/recipes-extended/libvirt/libvirt_%.bbappend<br>
similarity index 100%<br>
rename from meta-openstack/recipes-extended/libvirt/libvirt%.bbappend<br>
rename to meta-openstack/recipes-extended/libvirt/libvirt_%.bbappend<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9035): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9035" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9035</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/109899092/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/109899092/1050810</a><br>
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

--000000000000dc0d9806285eabd6--

