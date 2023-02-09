Return-Path: <simonkbaby@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B277EC636D3
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 19:02:39 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.25840.1675969349577582669
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Feb 2023 11:02:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OCYE49uj;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: simonkbaby@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id f15-20020a17090ac28f00b00230a32f0c9eso3269154pjt.4
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 09 Feb 2023 11:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0Y5V1G/3vFf9ZqRO4Igb2hnrFSeNBxY8S/SCft9NfqA=;
        b=OCYE49ujPSjilIkFmGL0EomCq6gL5f+hOfHqzQYWmC+7fxPqoIKl0cNfYXxsHEKz7J
         Gkx1s/3GlDFqNBPMGyu5dKquHV5gA5OufXKFg+uAVavJ9IRXv9PYqbI1S4in3VuQaOlQ
         NYkuj8cZngf8FSgYDYCp6PO4DM+nCdvW5U2q15aQjE3C2m5ikCBxH58tcQKGkQkJPWPo
         ZjtECqszrfFuS9o1uaU3JpCtMg9Vqx+FrnxVBj4VJ8ASLGwEU9WFh0upwt3voip63uaH
         G2QqIpz/lQPrm6hj0H4IBlPaAbdKY3TudHd0GDyLamPeUZIt69MofXU4selSGGENv+mg
         2/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Y5V1G/3vFf9ZqRO4Igb2hnrFSeNBxY8S/SCft9NfqA=;
        b=H8bfRhK+IqoAs3KdVdHXoooqPxDmmh3ZPYLCrwLguhKw4TudvuBuq1dIiaNXMIE78D
         VD1+OicifQ+vMAGyRHDabQYGFSsHfqWLwCxK06nyqSBXc1shUUidhkchXuXI8rndFYHG
         qi3mx0UqD63I3AYlExuwKZ44dvEWZjQJMtV9n9jXkIFlQkqBsW+euT8cGjWWDApweWyf
         fSISQZHSObLTSyMznAKhH+9YbqeUsKWwEYQrH3Quk4CGtgLLcbwBrBeOpM4oKkpW2bvU
         /G4x2iGA6aeVprTx0etctT+4vlFT1FBGtUWGb0FUSOiapgP91yI9DP6Rv6RLdogwiw2Z
         TArA==
X-Gm-Message-State: AO0yUKWFY3VwJsQgk1olAHV+1JFCmqdHF/MoHMyu1ZZEs/sTnyYV9eHa
	XT8sL2c+a6qIJnn+i3hZyfAMlKUwUNbnoHPEW+exgMAbGEc=
X-Google-Smtp-Source: AK7set8bWCh55tHo/PaHYp1i3kQAbnCmuH+BV1WJENIxXh4Kct7oBOxbdiQzkeJ2nbKozciZsuAvbwapmobQv0L7hb0=
X-Received: by 2002:a17:902:eb44:b0:194:794d:38c2 with SMTP id
 i4-20020a170902eb4400b00194794d38c2mr2833698pli.1.1675969348450; Thu, 09 Feb
 2023 11:02:28 -0800 (PST)
MIME-Version: 1.0
From: SIMON BABY <simonkbaby@gmail.com>
Date: Thu, 9 Feb 2023 11:02:17 -0800
Message-ID: <CAEFUPH1Yj9ZmOHRfuaHHcUmFPC+kvxb0ebM5pjFS7Dhr4iuaMA@mail.gmail.com>
Subject: query on container demo
To: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000ab42e805f44905b1"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 09 Feb 2023 19:02:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7849

--000000000000ab42e805f44905b1
Content-Type: text/plain; charset="UTF-8"

I was testing the meta-virtualization/recipes-demo/images/ app-container. I
was able to build the container. But I am not sure where the image is
created  and how we run the image using docker commands. I also see the
.yaml files. Can you please help?

On the target I can see /usr/bin/flask-app.



bitbake app-container


The generated build foles are below.



build/tmp/work/armv8a-poky-linux/helloworld-flask$ ls

0.1-r0

/build/tmp/work/armv8a-poky-linux/helloworld-flask$ cd 0.1-r0/

build/tmp/work/armv8a-poky-linux/helloworld-flask/0.1-r0$ ls -ll

total 84

-rw-r--r--  1 tdydev tdydev    65 Feb  7 11:58 configure.sstate

drwxr-xr-x  3 tdydev tdydev  4096 Feb  7 12:10 deploy-debs

drwxr-xr-x  2 tdydev tdydev  4096 Feb  7 11:38 deploy-source-date-epoch

-rwxrwxr-x  1 tdydev tdydev   518 Feb  2 14:24 flask-app

-rw-r--r--  1 tdydev tdydev   511 Feb  7 11:58 flask-app-service.yaml

-rw-r--r--  1 tdydev tdydev   178 Feb  7 11:58 flask-app.yaml

drwxr-xr-x  2 tdydev tdydev  4096 Feb  7 11:35 helloworld-flask-0.1

drwxr-xr-x  4 tdydev tdydev  4096 Feb  7 11:58 image

drwxr-xr-x  3 tdydev tdydev  4096 Feb  7 11:38 license-destdir

drwxr-xr-x  4 tdydev tdydev  4096 Apr  5  2011 package

drwxr-xr-x 10 tdydev tdydev  4096 Feb  7 12:10 packages-split

drwxr-xr-x  7 tdydev tdydev  4096 Apr  5  2011 pkgdata

drwxr-xr-x  7 tdydev tdydev  4096 Feb  7 11:58 pkgdata-pdata-input

drwxr-xr-x  7 tdydev tdydev  4096 Feb  7 11:58 pkgdata-sysroot

drwxrwxr-x  2 tdydev tdydev  4096 Feb  7 12:10 pseudo

drwxr-xr-x  5 tdydev tdydev  4096 Feb  7 12:10 recipe-sysroot

drwxr-xr-x  8 tdydev tdydev  4096 Feb  7 12:10 recipe-sysroot-native

drwxr-xr-x  2 tdydev tdydev  4096 Feb  7 11:35 source-date-epoch

drwxr-xr-x  2 tdydev tdydev 12288


Regards

Simon

--000000000000ab42e805f44905b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;=
font-family:Calibri,sans-serif">I was testing the meta-virtualization/recip=
es-demo/images/ app-container. I was able to build the container. But I am =
not sure where the image is created =C2=A0and how we run the image using do=
cker commands. I also see the .yaml files. Can you please help?<u></u><u></=
u></p><p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family=
:Calibri,sans-serif">On the target I can see /usr/bin/flask-app.=C2=A0<u></=
u><u></u></p><p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font=
-family:Calibri,sans-serif"><u></u>=C2=A0<u></u></p><p class=3D"MsoNormal" =
style=3D"margin:0in;font-size:11pt;font-family:Calibri,sans-serif">bitbake =
app-container<u></u><u></u></p><p class=3D"MsoNormal" style=3D"margin:0in;f=
ont-size:11pt;font-family:Calibri,sans-serif"><br></p><p class=3D"MsoNormal=
" style=3D"margin:0in;font-size:11pt;font-family:Calibri,sans-serif">The ge=
nerated=C2=A0build foles are below.</p><p class=3D"MsoNormal" style=3D"marg=
in:0in;font-size:11pt;font-family:Calibri,sans-serif"><u></u>=C2=A0<u></u><=
/p><p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Ca=
libri,sans-serif">build/tmp/work/armv8a-poky-linux/helloworld-flask$ ls<u><=
/u><u></u></p><p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;fon=
t-family:Calibri,sans-serif">0.1-r0<u></u><u></u></p><p class=3D"MsoNormal"=
 style=3D"margin:0in;font-size:11pt;font-family:Calibri,sans-serif">/build/=
tmp/work/armv8a-poky-linux/helloworld-flask$ cd 0.1-r0/<u></u><u></u></p><p=
 class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calibri=
,sans-serif">build/tmp/work/armv8a-poky-linux/helloworld-flask/0.1-r0$ ls -=
ll<u></u><u></u></p><p class=3D"MsoNormal" style=3D"margin:0in;font-size:11=
pt;font-family:Calibri,sans-serif">total 84<u></u><u></u></p><p class=3D"Ms=
oNormal" style=3D"margin:0in;font-size:11pt;font-family:Calibri,sans-serif"=
>-rw-r--r--=C2=A0 1 tdydev tdydev=C2=A0=C2=A0=C2=A0 65 Feb=C2=A0 7 11:58 co=
nfigure.sstate<u></u><u></u></p><p class=3D"MsoNormal" style=3D"margin:0in;=
font-size:11pt;font-family:Calibri,sans-serif">drwxr-xr-x=C2=A0 3 tdydev td=
ydev=C2=A0 4096 Feb=C2=A0 7 12:10 deploy-debs<u></u><u></u></p><p class=3D"=
MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calibri,sans-seri=
f">drwxr-xr-x=C2=A0 2 tdydev tdydev=C2=A0 4096 Feb=C2=A0 7 11:38 deploy-sou=
rce-date-epoch<u></u><u></u></p><p class=3D"MsoNormal" style=3D"margin:0in;=
font-size:11pt;font-family:Calibri,sans-serif">-rwxrwxr-x=C2=A0 1 tdydev td=
ydev=C2=A0=C2=A0 518 Feb=C2=A0 2 14:24 flask-app<u></u><u></u></p><p class=
=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calibri,sans-=
serif">-rw-r--r--=C2=A0 1 tdydev tdydev=C2=A0=C2=A0 511 Feb=C2=A0 7 11:58 f=
lask-app-service.yaml<u></u><u></u></p><p class=3D"MsoNormal" style=3D"marg=
in:0in;font-size:11pt;font-family:Calibri,sans-serif">-rw-r--r--=C2=A0 1 td=
ydev tdydev=C2=A0=C2=A0 178 Feb=C2=A0 7 11:58 flask-app.yaml<u></u><u></u><=
/p><p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Ca=
libri,sans-serif">drwxr-xr-x=C2=A0 2 tdydev tdydev=C2=A0 4096 Feb=C2=A0 7 1=
1:35 helloworld-flask-0.1<u></u><u></u></p><p class=3D"MsoNormal" style=3D"=
margin:0in;font-size:11pt;font-family:Calibri,sans-serif">drwxr-xr-x=C2=A0 =
4 tdydev tdydev=C2=A0 4096 Feb=C2=A0 7 11:58 image<u></u><u></u></p><p clas=
s=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calibri,sans=
-serif">drwxr-xr-x=C2=A0 3 tdydev tdydev=C2=A0 4096 Feb=C2=A0 7 11:38 licen=
se-destdir<u></u><u></u></p><p class=3D"MsoNormal" style=3D"margin:0in;font=
-size:11pt;font-family:Calibri,sans-serif">drwxr-xr-x=C2=A0 4 tdydev tdydev=
=C2=A0 4096 Apr=C2=A0 5=C2=A0 2011 package<u></u><u></u></p><p class=3D"Mso=
Normal" style=3D"margin:0in;font-size:11pt;font-family:Calibri,sans-serif">=
drwxr-xr-x 10 tdydev tdydev=C2=A0 4096 Feb=C2=A0 7 12:10 packages-split<u><=
/u><u></u></p><p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;fon=
t-family:Calibri,sans-serif">drwxr-xr-x=C2=A0 7 tdydev tdydev=C2=A0 4096 Ap=
r=C2=A0 5=C2=A0 2011 pkgdata<u></u><u></u></p><p class=3D"MsoNormal" style=
=3D"margin:0in;font-size:11pt;font-family:Calibri,sans-serif">drwxr-xr-x=C2=
=A0 7 tdydev tdydev=C2=A0 4096 Feb=C2=A0 7 11:58 pkgdata-pdata-input<u></u>=
<u></u></p><p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-f=
amily:Calibri,sans-serif">drwxr-xr-x=C2=A0 7 tdydev tdydev=C2=A0 4096 Feb=
=C2=A0 7 11:58 pkgdata-sysroot<u></u><u></u></p><p class=3D"MsoNormal" styl=
e=3D"margin:0in;font-size:11pt;font-family:Calibri,sans-serif">drwxrwxr-x=
=C2=A0 2 tdydev tdydev=C2=A0 4096 Feb=C2=A0 7 12:10 pseudo<u></u><u></u></p=
><p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Cali=
bri,sans-serif">drwxr-xr-x=C2=A0 5 tdydev tdydev=C2=A0 4096 Feb=C2=A0 7 12:=
10 recipe-sysroot<u></u><u></u></p><p class=3D"MsoNormal" style=3D"margin:0=
in;font-size:11pt;font-family:Calibri,sans-serif">drwxr-xr-x=C2=A0 8 tdydev=
 tdydev=C2=A0 4096 Feb=C2=A0 7 12:10 recipe-sysroot-native<u></u><u></u></p=
><p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Cali=
bri,sans-serif">drwxr-xr-x=C2=A0 2 tdydev tdydev=C2=A0 4096 Feb=C2=A0 7 11:=
35 source-date-epoch<u></u><u></u></p><p class=3D"MsoNormal" style=3D"margi=
n:0in;font-size:11pt;font-family:Calibri,sans-serif">drwxr-xr-x=C2=A0 2 tdy=
dev tdydev 12288=C2=A0</p><p class=3D"MsoNormal" style=3D"margin:0in;font-s=
ize:11pt;font-family:Calibri,sans-serif"><br></p><p class=3D"MsoNormal" sty=
le=3D"margin:0in;font-size:11pt;font-family:Calibri,sans-serif">Regards</p>=
<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">Simon</p></div>

--000000000000ab42e805f44905b1--

