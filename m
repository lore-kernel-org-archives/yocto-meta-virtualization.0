Return-Path: <ierturk@ieee.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F7DC04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 21:34:33 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.25289.1658957665046981612
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Jul 2022 14:34:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ieee.org header.s=google header.b=UjDpRCoA;
 spf=pass (domain: ieee.org, ip: 209.85.218.42, mailfrom: ierturk@ieee.org)
Received: by mail-ej1-f42.google.com with SMTP id tk8so33718487ejc.7
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Jul 2022 14:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
         :references;
        bh=WjEjQpAMLTBCkDcmW5Q6wDlIrSzRd06KTcEmD8IhjvI=;
        b=UjDpRCoAGYx1rsOf29QsC38kzjN6i1KlpO0TN2n4BX9nzSKtSc2i/4O+TqTl0fujxO
         rDhzHrxlyp2tFXTNAuS0BLOahycMU/xbIxMg6Y80E4wwWsNpLVk99sHE09vQcJ+YC8tr
         mzHav/WZr3daYEPjxSMv+ByXZpdzrS26afKVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:mime-version:subject:date
         :in-reply-to:cc:to:references;
        bh=WjEjQpAMLTBCkDcmW5Q6wDlIrSzRd06KTcEmD8IhjvI=;
        b=gQ5rAm4d7I1CGnPnzxoq12trx6PDnekS17RIb7Yt+jCPpEnVh/Ly0MVqDl93+VP+v6
         qiRB3nrr3c7FbbwD3HErHX6yLzY7k0CYJYvigzsB9n8EPpXP+hj6fj8gF5UZwq0lJ4/6
         IF8jAgzI7SBfqZR4EuUjuQQMZHvBuDh+rpMFlSiRmX0bkPFkIMEZDv2tgpzNC8hIHbcC
         +mOMpWmoXToEALOK5YhtnRtRUM68Z2BWd4+Pz1+Nod/SxQeTtqiujj6/wm5mAOnkB3wD
         T2sx5lPtYnjvgEI295Jhu/YCyMwzPrjiFeXfgWOkdqnV0FxzEaL/mdghpx4QxyduxOAj
         6fag==
X-Gm-Message-State: AJIora/n1sKNR3demNTqGBH7t0vpNwqjKa4ZG+ZmzK0cGa8OyG08NkhX
	GehwbIM1/P0fIWuN4pchzFtxNi9IM7s8bQ==
X-Google-Smtp-Source: 
 AGRyM1sbnZYF7w88OWrxgu22kRkMtCk2ibvjpK54CunUCrRevx4R6XHUZjxjVrIVpdiKuQblVsM19g==
X-Received: by 2002:a17:907:3e9a:b0:72b:44d4:4482 with SMTP id
 hs26-20020a1709073e9a00b0072b44d44482mr19317985ejc.34.1658957663329;
        Wed, 27 Jul 2022 14:34:23 -0700 (PDT)
Received: from [192.168.1.21] ([92.44.144.181])
        by smtp.gmail.com with ESMTPSA id
 l10-20020a1709060cca00b0072b2ef2757csm8043362ejh.180.2022.07.27.14.34.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Jul 2022 14:34:22 -0700 (PDT)
From: Ibrahim Erturk <ierturk@ieee.org>
Message-Id: <68F0A22B-8CE4-47A3-A6DF-B19C0D80220A@ieee.org>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_2D98BF04-85B8-4907-8FEE-0144EC0B2992"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [meta-virtualization] Docker Compose issue regarding the
 deprecation of Python3 distutils on Kirkstone
Date: Thu, 28 Jul 2022 00:34:20 +0300
In-Reply-To: 
 <CADkTA4MrnrWbWfJNFNdSqDcXOfN=VS11SGy_zrS2+z0Da4p4+w@mail.gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <BF86DE9A-16AF-4423-95B0-3FFF3ED5A9CD@ieee.org>
 <49660EA1-CD22-40DB-98C7-C43F38A72CCA@ieee.org>
 <CADkTA4MrnrWbWfJNFNdSqDcXOfN=VS11SGy_zrS2+z0Da4p4+w@mail.gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 27 Jul 2022 21:34:33 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7480


--Apple-Mail=_2D98BF04-85B8-4907-8FEE-0144EC0B2992
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


On 27 Jul 2022, at 21:19, Bruce Ashfield <bruce.ashfield@gmail.com> =
wrote:
>=20
> On Wed, Jul 27, 2022 at 3:24 AM Ibrahim Erturk via
> lists.yoctoproject.org <http://lists.yoctoproject.org/> =
<ierturk=3Dieee.org@lists.yoctoproject.org =
<mailto:ierturk=3Dieee.org@lists.yoctoproject.org>>
> wrote:
>>=20
>> Hello,
>>=20
>> I added the following line into local.conf to get the packages docker =
and docker-compose on Rapberry Pi (meta-raspberrypi) with the branch =
kirkstone.
>>=20
>> # Virtualization
>> DISTRO_FEATURES:append =3D " virtualization"
>> IMAGE_INSTALL:append =3D " docker-ce"
>> IMAGE_INSTALL:append =3D " python3-docker-compose=E2=80=9D
>> # IMAGE_INSTALL:append =3D " python3-distutils"
>>=20
>> However, due to python3-distutils deprecated as of Python3.10, I got =
the following error.
>>=20
>> raspberrypi3:~$ docker-compose
>> Traceback (most recent call last):
>> File "/usr/bin/docker-compose", line 5, in <module>
>>   from compose.cli.main import main
>> File "/usr/lib/python3.10/site-packages/compose/cli/main.py", line 9, =
in <module>
>>   from distutils.spawn import find_executable
>> ModuleNotFoundError: No module named =E2=80=98distutils=E2=80=99
>>=20
>> Is there any workaround regarding this issue or am I missing some =
configuration?
>=20
> I'm not sure I'm following.
>=20
> docker-compose has been on the same version for quite some time (mid
> 2021) on pypi (the source repo does have newer versions, so we could
> consider switching to source vs pypi).
>=20
> and yes, that version is still using distutils. So either you need to
> install the depreciated module, or do an uprev to a newer version
> using the github repo.
>=20
> Bruce
>=20
>>=20
>> Thanks in advance.
>>=20
>> Regards,
>> Ibrahim ERTURK
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#7476): =
https://lists.yoctoproject.org/g/meta-virtualization/message/7476 =
<https://lists.yoctoproject.org/g/meta-virtualization/message/7476>
>> Mute This Topic: https://lists.yoctoproject.org/mt/92644827/1050810 =
<https://lists.yoctoproject.org/mt/92644827/1050810>
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org =
<mailto:meta-virtualization+owner@lists.yoctoproject.org>
>> Unsubscribe: =
https://lists.yoctoproject.org/g/meta-virtualization/unsub =
<https://lists.yoctoproject.org/g/meta-virtualization/unsub> =
[bruce.ashfield@gmail.com <mailto:bruce.ashfield@gmail.com>]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20
>=20
>=20
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

Hi Bruce,

Thanks for the reply. I explicitly added the deprecated python package =
python3-distutils as follow, and it seem that compose works properly

IMAGE_INSTALL:append =3D " python3-distutils"

Ibrahim=

--Apple-Mail=_2D98BF04-85B8-4907-8FEE-0144EC0B2992
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div>On 27 Jul 2022, at 21:19, Bruce Ashfield &lt;<a =
href=3D"mailto:bruce.ashfield@gmail.com" =
class=3D"">bruce.ashfield@gmail.com</a>&gt; wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D""><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">On Wed, Jul 27, 2022 at 3:24 AM =
Ibrahim Erturk via</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><a =
href=3D"http://lists.yoctoproject.org/" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" =
class=3D"">lists.yoctoproject.org</a><span style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D""><span =
class=3D"Apple-converted-space">&nbsp;</span>&lt;</span><a =
href=3D"mailto:ierturk=3Dieee.org@lists.yoctoproject.org" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">ierturk=3Dieee.org@lists.yoctoproject.org</a><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">&gt;</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">wrote:</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
class=3D"">Hello,<br class=3D""><br class=3D"">I added the following =
line into local.conf to get the packages docker and docker-compose on =
Rapberry Pi (meta-raspberrypi) with the branch kirkstone.<br =
class=3D""><br class=3D""># Virtualization<br =
class=3D"">DISTRO_FEATURES:append =3D " virtualization"<br =
class=3D"">IMAGE_INSTALL:append =3D " docker-ce"<br =
class=3D"">IMAGE_INSTALL:append =3D " python3-docker-compose=E2=80=9D<br =
class=3D""># IMAGE_INSTALL:append =3D " python3-distutils"<br =
class=3D""><br class=3D"">However, due to python3-distutils deprecated =
as of Python3.10, I got the following error.<br class=3D""><br =
class=3D"">raspberrypi3:~$ docker-compose<br class=3D"">Traceback (most =
recent call last):<br class=3D"">File "/usr/bin/docker-compose", line 5, =
in &lt;module&gt;<br class=3D"">&nbsp;&nbsp;from compose.cli.main import =
main<br class=3D"">File =
"/usr/lib/python3.10/site-packages/compose/cli/main.py", line 9, in =
&lt;module&gt;<br class=3D"">&nbsp;&nbsp;from distutils.spawn import =
find_executable<br class=3D"">ModuleNotFoundError: No module named =
=E2=80=98distutils=E2=80=99<br class=3D""><br class=3D"">Is there any =
workaround regarding this issue or am I missing some configuration?<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">I'm not sure I'm following.</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">docker-compose has been on the same version for quite some =
time (mid</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">2021) on pypi =
(the source repo does have newer versions, so we could</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">consider switching to source vs =
pypi).</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">and yes, that =
version is still using distutils. So either you need to</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">install the depreciated module, =
or do an uprev to a newer version</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">using the github repo.</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Bruce</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br class=3D"">Thanks in advance.<br =
class=3D""><br class=3D"">Regards,<br class=3D"">Ibrahim ERTURK<br =
class=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br =
class=3D"">Links: You receive all messages sent to this group.<br =
class=3D"">View/Reply Online (#7476):<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"https://lists.yoctoproject.org/g/meta-virtualization/message/7476"=
 =
class=3D"">https://lists.yoctoproject.org/g/meta-virtualization/message/74=
76</a><br class=3D"">Mute This Topic:<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"https://lists.yoctoproject.org/mt/92644827/1050810" =
class=3D"">https://lists.yoctoproject.org/mt/92644827/1050810</a><br =
class=3D"">Group Owner:<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"mailto:meta-virtualization+owner@lists.yoctoproject.org" =
class=3D"">meta-virtualization+owner@lists.yoctoproject.org</a><br =
class=3D"">Unsubscribe:<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"https://lists.yoctoproject.org/g/meta-virtualization/unsub" =
class=3D"">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a><=
span class=3D"Apple-converted-space">&nbsp;</span>[<a =
href=3D"mailto:bruce.ashfield@gmail.com" =
class=3D"">bruce.ashfield@gmail.com</a>]<br =
class=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br class=3D""><br=
 class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">--<span class=3D"Apple-converted-space">&nbsp;</span></span><br=
 style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">- Thou shalt not follow the NULL =
pointer, for chaos and madness await</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">thee at its end</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">- "Use the force Harry" - Gandalf, Star Trek =
II</span></div></blockquote></div><br class=3D""><div class=3D"">Hi =
Bruce,</div><div class=3D""><br class=3D""></div><div class=3D""><div =
class=3D"">Thanks for the reply. I explicitly added the deprecated =
python package python3-distutils as follow, and it seem that compose =
works properly</div><div class=3D""><br class=3D""></div><div =
class=3D"">IMAGE_INSTALL:append =3D " python3-distutils"</div><div =
class=3D""><br class=3D""></div><div =
class=3D"">Ibrahim</div></div></body></html>=

--Apple-Mail=_2D98BF04-85B8-4907-8FEE-0144EC0B2992--

