Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83776C54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 17:29:53 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.33681.1748280586103188260
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 May 2025 10:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B2mVymU3;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b26ee6be1ecso1275773a12.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 May 2025 10:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748280585; x=1748885385; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hP+ma3q6juI3gg4ernZ7bUNWcpfAfzQOQSw7ju/TJPo=;
        b=B2mVymU3JWRlcos1VvSHToJmSZyNVXE8gXk4pxac/GT0rnCoJci7whmUWPL1TbDsgY
         /TYf9z5TilAu4KMluXGUO1l9B4Nyhwv4C2CzDn31kaKGR+D4JChw1lkHdOtAXguzPenJ
         AeRioIknkhDpJAsjr63jHyiN5kLm/R9bUjSHXmD88PXY+9t/21u9Z2ms5tLC8a5FBw5g
         +ToGQxzahT8FZ0HQTnI+OZ4oFHqhBvYfMYpw7GMp53beDm961UdPEydN8xjyETTfrShc
         PFupKFT0HlBXg42eNbTpOCh1WUHX4EzVl+amCv6x0whrtZwfjdaux4sjgA4dXqOcdSqq
         sgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748280585; x=1748885385;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hP+ma3q6juI3gg4ernZ7bUNWcpfAfzQOQSw7ju/TJPo=;
        b=QVPnDWbiJfMMhHCtSUcz6vGgtmtcMbR/vR0dLZSW+kKmNifcYXynblLTjNF3l9RzVu
         j2e+nabdXB/Ys29c/z8t0cqWOAMbGL5kwHXuiI+sVRMrnllxOReKKSBQJ3bGnKyzxOqY
         ktZt0kHi+e/RgyzR87kgKXNyNLiT/GjHUNhsJD8pyrQljA4TDa3zcCi1PVakuq0WpKIG
         ue+YRZ5lG5Dk401yHw0jzUVrjbWtp6DxIcTBP59W9zbRu2XOe2mEY0/KZLpTOjGxhdC2
         rvR4Jbh3Bolr9iK1J92iIprHAbzBpRH5arkiluxqFZt9hkeLxLksJpqZOJAyaIoGhjzP
         E+9A==
X-Gm-Message-State: AOJu0YyNesrXHcB5g1CG5FTQapIenhKPnu0XakHtiCM0M401Ha0gL6g4
	CxTMbLYJFBr1JwS92b3308Ex9HGNzxi2QG11+vgrv0/zlG7ojWuWn0ALMbwaFw8Usi4puGME26v
	GzKlmuoo8vL5eGVPyrXhaMQlBPLEbTc0=
X-Gm-Gg: ASbGncuxCgIvR5qgx2C7DhdOO817GWtKfDNQbBYtwpbxJ0F40JFB5MrWQ9+7bTDBc6Z
	lfpBZgPPbd7AnlAMBX0OxUacKxAZaMkwRTrgKRUdN0PseZPZ+X8FDaBUUKxkjYVCRBp5IAtUxMp
	L4QdIEUN816eENiOUijb2V1oBvgZEQdEpNXfs=
X-Google-Smtp-Source: AGHT+IEaMmyZLYTMw7fQoEcQN4j1b5UzBHFfbjgLySWfN0LoABRN6qyj5saR61vuANKubE72NE3Ci3LgZv/wuktuTJE=
X-Received: by 2002:a17:90b:1d51:b0:2ff:702f:7172 with SMTP id
 98e67ed59e1d1-31110d97665mr17254283a91.33.1748280585308; Mon, 26 May 2025
 10:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <CADkTA4OFj6L70KHB3meGRxJ_6kd2B+W=du5mtEynhHFdnXxGmQ@mail.gmail.com>
 <15379.1748243419319118604@lists.yoctoproject.org>
In-Reply-To: <15379.1748243419319118604@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 26 May 2025 13:29:34 -0400
X-Gm-Features: AX0GCFuYTeYKv4AlRwbCKtP-8cKkUjSz-0TySlHL2jeN8NDgK9n4DVZBmv8rcXM
Message-ID: <CADkTA4NXQXXZrg=iBAF=_kJa9F=6WNK3TGGgPbyBX5FsdpN=SQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] cni: make ca-certificates rrecommends
To: patrick.vogelaar@belden.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000414f8406360d4b98"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 26 May 2025 17:29:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9259

--000000000000414f8406360d4b98
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 3:10=E2=80=AFAM Patrick Vogelaar via B4 Relay via
lists.yoctoproject.org <patrick.vogelaar=3Dbelden.com@lists.yoctoproject.or=
g>
wrote:

> On Thu, May 22, 2025 at 11:59 PM, Bruce Ashfield wrote:
>
>
>
> On Thu, May 22, 2025 at 4:19=E2=80=AFPM Patrick Vogelaar via B4 Relay via
> lists.yoctoproject.org <patrick.vogelaar=3Dbelden.com@lists.yoctoproject.=
org>
> wrote:
>
>> Moving ca-certificates from RDEPENDS to RRECOMMENDS allows using cni
>> without
>> installing all the certificates.
>
>
> Hmmm. This was done on purpose as kubernetes images using cni won't
> Come up with the certificates.
>
>
> Shouldn't this be then a dependency of kubernetes?
>
Nope. In this configuration, it is definitely cni that needs the
certificates in the tests that were failing for me, not k8s, so the
dependency belongs here.

>
>
> So if this changes, those sorts of images will indirectly break.
>
>
> This was the reason why I added it as RRECOMMENDS, because it will still
> be added but can be removed by adding. PACKAGE_EXCLUDE=3D"ca-certificates=
"
>
> Rreccommends are just that .. recommends, they are off in all  the images
I build and test (as an example), so to move it to this, we'd have to show
that all of the various combinations still function with rreccomends
disabled.


>
> If this was a configurable option for the recipe (packageconfig), then
> It would be acceptable and consuming distros could modify the
> Depends if they don't want the certificates to be installed.
>
>
> Should I add it as packageconfig or as dependency of kubernetes?
>
Packageconfig, as I explained above.

Patrick
>
>
>
> Bruce
>
>
>> Signed-off-by: Patrick Vogelaar <patrick.vogelaar@belden.com>
>> ---
>>  recipes-networking/cni/cni_git.bb | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/
>> cni_git.bb
>> index e6d71aa2..bd67cd0d 100644
>> --- a/recipes-networking/cni/cni_git.bb
>> +++ b/recipes-networking/cni/cni_git.bb
>> @@ -109,5 +109,4 @@ INSANE_SKIP:${PN} +=3D "ldflags already-stripped"
>>
>>  deltask compile_ptest_base
>>
>> -RDEPENDS:${PN} +=3D " ca-certificates"
>> -RRECOMMENDS:${PN} +=3D "iptables iproute2"
>> +RRECOMMENDS:${PN} +=3D "ca-certificates iptables iproute2"
>> --
>> 2.34.1
>>
>>
>> **********************************************************************
>> DISCLAIMER:
>> Privileged and/or Confidential information may be contained in this
>> message. If you are not the addressee of this message, you may not copy,
>> use or deliver this message to anyone. In such event, you should destroy
>> the message and kindly notify the sender by reply e-mail. It is understo=
od
>> that opinions or conclusions that do not relate to the official business=
 of
>> the company are neither given nor endorsed by the company. Thank You.
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
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9258):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9258
> Mute This Topic: https://lists.yoctoproject.org/mt/113254268/1050810
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

--000000000000414f8406360d4b98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 26, 2025 at 3:10=
=E2=80=AFAM Patrick Vogelaar via B4 Relay via <a href=3D"http://lists.yocto=
project.org">lists.yoctoproject.org</a> &lt;patrick.vogelaar=3D<a href=3D"m=
ailto:belden.com@lists.yoctoproject.org">belden.com@lists.yoctoproject.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div>On Thu, May 22, 2025 at 11:59 PM, Bruce Ashfield wrote:</div>
<div>
<blockquote>
<div dir=3D"ltr">
<div dir=3D"ltr">
<div style=3D"font-size:small">=C2=A0</div>
</div>
<br>
<div class=3D"gmail_quote">
<div class=3D"gmail_attr" dir=3D"ltr">On Thu, May 22, 2025 at 4:19=E2=80=AF=
PM Patrick Vogelaar via B4 Relay via <a href=3D"http://lists.yoctoproject.o=
rg" target=3D"_blank">lists.yoctoproject.org</a> &lt;patrick.vogelaar=3D<a =
href=3D"mailto:belden.com@lists.yoctoproject.org" target=3D"_blank">belden.=
com@lists.yoctoproject.org</a>&gt; wrote:</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Moving ca-certificates fr=
om RDEPENDS to RRECOMMENDS allows using cni without<br>installing all the c=
ertificates.<span class=3D"gmail_default" style=3D"font-size:small"></span>=
</blockquote>
<div>=C2=A0</div>
<div style=3D"font-size:small">Hmmm. This was done on purpose as kubernetes=
 images using cni won&#39;t</div>
<div style=3D"font-size:small">Come up with the certificates.</div>
<div style=3D"font-size:small">=C2=A0</div>
</div>
</div>
</blockquote>
Shouldn&#39;t this be then a dependency of kubernetes?<span class=3D"gmail_=
default" style=3D"font-size:small"></span></div></blockquote><div><span cla=
ss=3D"gmail_default" style=3D"font-size:small"></span></div><div class=3D"g=
mail_default" style=3D"font-size:small"></div><div class=3D"gmail_default" =
style=3D"font-size:small">Nope. In this configuration, it is definitely cni=
 that needs the certificates in the tests that were failing for me, not k8s=
, so the dependency belongs here.</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div>
<blockquote>
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div style=3D"font-size:small">=C2=A0</div>
<div style=3D"font-size:small">=C2=A0</div>
<div style=3D"font-size:small">So if this changes, those sorts of images wi=
ll indirectly break.</div>
<div style=3D"font-size:small">=C2=A0</div>
</div>
</div>
</blockquote>
This was the reason why I added it as RRECOMMENDS, because it will still be=
 added but can be removed by adding. PACKAGE_EXCLUDE=3D&quot;ca-certificate=
s&quot;<br>
<blockquote>
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<span class=3D"gmail_default" style=3D"font-size:small"></span></div></div>=
</blockquote></div></blockquote><div><span class=3D"gmail_default" style=3D=
"font-size:small">Rreccommends are just that .. recommends, they are off in=
 all=C2=A0 the images I build and test (as an example), so to move it to th=
is, we&#39;d have to show that all of the various combinations still functi=
on with rreccomends disabled.</span></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div><blockquote><div dir=3D"ltr"><div cl=
ass=3D"gmail_quote">
<div style=3D"font-size:small">=C2=A0</div>
<div style=3D"font-size:small">If this was a configurable option for the re=
cipe (packageconfig), then</div>
<div style=3D"font-size:small">It would be acceptable and consuming distros=
 could modify the</div>
<div style=3D"font-size:small">Depends if they don&#39;t want the certifica=
tes to be installed.</div>
<div style=3D"font-size:small">=C2=A0</div>
</div>
</div>
</blockquote>
Should I add it as packageconfig or as dependency of kubernetes?<br><span c=
lass=3D"gmail_default" style=3D"font-size:small"></span></div></blockquote>=
<div><span class=3D"gmail_default" style=3D"font-size:small"></span></div><=
div class=3D"gmail_default" style=3D"font-size:small">Packageconfig, as I e=
xplained above.</div><div class=3D"gmail_default" style=3D"font-size:small"=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>Patrick</=
div>
<div>
<blockquote>
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div style=3D"font-size:small">=C2=A0</div>
<div style=3D"font-size:small">=C2=A0</div>
<div style=3D"font-size:small">Bruce</div>
<div style=3D"font-size:small">=C2=A0</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Patrick Vo=
gelaar &lt;<a href=3D"mailto:patrick.vogelaar@belden.com" rel=3D"noopener" =
target=3D"_blank">patrick.vogelaar@belden.com</a>&gt;<br>---<br>=C2=A0recip=
es-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"noopener noreferrer"=
 target=3D"_blank">cni_git.bb</a> | 3 +--<br>=C2=A01 file changed, 1 insert=
ion(+), 2 deletions(-)<br><br>diff --git a/recipes-networking/cni/<a href=
=3D"http://cni_git.bb" rel=3D"noopener noreferrer" target=3D"_blank">cni_gi=
t.bb</a> b/recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"noop=
ener noreferrer" target=3D"_blank">cni_git.bb</a><br>index e6d71aa2..bd67cd=
0d 100644<br>--- a/recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=
=3D"noopener noreferrer" target=3D"_blank">cni_git.bb</a><br>+++ b/recipes-=
networking/cni/<a href=3D"http://cni_git.bb" rel=3D"noopener noreferrer" ta=
rget=3D"_blank">cni_git.bb</a><br>@@ -109,5 +109,4 @@ INSANE_SKIP:${PN} +=
=3D &quot;ldflags already-stripped&quot;<br><br>=C2=A0deltask compile_ptest=
_base<br><br>-RDEPENDS:${PN} +=3D &quot; ca-certificates&quot;<br>-RRECOMME=
NDS:${PN} +=3D &quot;iptables iproute2&quot;<br>+RRECOMMENDS:${PN} +=3D &qu=
ot;ca-certificates iptables iproute2&quot;<br>-- <br>2.34.1<br><br><br>****=
******************************************************************<br>DISCL=
AIMER:<br>Privileged and/or Confidential information may be contained in th=
is message. If you are not the addressee of this message, you may not copy,=
 use or deliver this message to anyone. In such event, you should destroy t=
he message and kindly notify the sender by reply e-mail. It is understood t=
hat opinions or conclusions that do not relate to the official business of =
the company are neither given nor endorsed by the company. Thank You.</bloc=
kquote>
</div>
<div>=C2=A0</div>
<div>=C2=A0</div>
<span class=3D"gmail_signature_prefix">-- </span><br>
<div class=3D"gmail_signature" dir=3D"ltr">- Thou shalt not follow the NULL=
 pointer, for chaos and madness await thee at its end<br>- &quot;Use the fo=
rce Harry&quot; - Gandalf, Star Trek II<br><br></div>
</div>
</blockquote>
</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9258): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9258" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9258</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/113254268/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/113254268/1050810</a><br>
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

--000000000000414f8406360d4b98--

