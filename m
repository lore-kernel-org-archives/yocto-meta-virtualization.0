Return-Path: <kev.ferber@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9DACF11EC
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 12:52:50 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.42411.1728564762956182611
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Oct 2024 05:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g3W+6Akt;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: kev.ferber@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6c3f12d3930so5644906d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Oct 2024 05:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728564762; x=1729169562; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1R3oI89xqmSfQKCg6EEWhujYY8yX49mpVaYIeHdB3ko=;
        b=g3W+6AktXBgQtVpzlr7P/26MHxvbY0VCiJMetln+t9ZLWqifXhEHUvXi1589RxeaU+
         l046+grTrnbKGimsyk+zXNShBZmsF/3O/J4UV7/Z+2fyytlaHgjEXrRDnKS9u0Qk4+v/
         yw97Lnh2aPfPZCa/Vy3qo1LWWRkQeVQomF1uWOVszYC4hqDWSvtoF5s/+Fx24RSxDtI1
         H56YtQyyu42IPeNmmyxxY8wCw9Bytx4dj5GRlmsJ2JVwoyhMLmGz5iMYC+nomvum2PFS
         Jc83Fpj8/is2gQ65P39kMwp2h+2OsD2rE0J3/9umNkfdZUPG4PdcOyP5MGgBRCGi7eCu
         ngSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728564762; x=1729169562;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1R3oI89xqmSfQKCg6EEWhujYY8yX49mpVaYIeHdB3ko=;
        b=TtMsxKrmS4LfMC1X8CtT22Wr38XzUP1YdabR9AZ0yYsnurM6LScfV41RE8V2LqVzG2
         cXRAdoSwEdP3Hl2gswoQXPVDQFIxZBBA76/KQOkJRU96oDWBAP94rSwyKzCqKHKXxigY
         ZOTfi4eATv5KEvDh/naIdt8P/UHICz4BZb27S4kQ25W40Y/dplGjo15vP3dqumlXeN/f
         xzia0HalbB9ydCrp1cf2dWsJhCfujEUtvvH4sZc1L3kXZeqWMb8RhDh1k1Q94Cvdn9O7
         skKwaMau8q8RLxpxxgj2PgSU5SmLymYZ2blYGiPO4v2Yu2l/lIXnnteiRuu8RewPv0k2
         dzVg==
X-Gm-Message-State: AOJu0YzDI9AeXxvzAsx/lC9UkmHcwitF919iAth7ZOCIeOiH88RmzTGG
	KJ63lmgWJNwkzPgrLy92RXwW8rgm2B5XkXRQfohj114xWJm3f40W5bv1yAP+kezo8jfFiMyGN2F
	CTKiSL96CQ9p3klAqN0mt6Ny9J3KF2Q==
X-Google-Smtp-Source: AGHT+IFliUZW64I6H5utkHOlv1Uv8cXPINh4UJHDdei/c7AASHwl5Lx+SiarltBcWrpjNMVGFbo7MEKlz0H1TNWFbPU=
X-Received: by 2002:a05:6214:5690:b0:6cb:e813:523a with SMTP id
 6a1803df08f44-6cbe81352d8mr20023406d6.4.1728564761702; Thu, 10 Oct 2024
 05:52:41 -0700 (PDT)
MIME-Version: 1.0
From: Kevin Ferber <kev.ferber@gmail.com>
Date: Thu, 10 Oct 2024 14:52:32 +0200
Message-ID: <CAERRtEuXxxZcjs0fGovUhF_dufQeco7dNM=zaU5aFJ9baoszog@mail.gmail.com>
Subject: Canonical LXD on Yocto
To: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000097ba6506241ed8d2"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Oct 2024 12:52:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8921

--00000000000097ba6506241ed8d2
Content-Type: text/plain; charset="UTF-8"

Hi all,

does anyone worked on a recipe for LXD.

We are in the process of moving from Ubuntu to Yocto Scarthgap because we
wanted to use the OTA functionality of RAUC.

Now we are faced with the challenge of successfully compiling LXD, I have
looked at an old unofficial layer (https://github.com/fcuringa/meta-lxd)
for reference, which of course no longer works with more recent LXD builds.

Best regards

Kevin

--00000000000097ba6506241ed8d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"border:0px=
;font-variant-numeric:inherit;font-variant-east-asian:inherit;font-variant-=
alternates:inherit;font-stretch:inherit;font-size:11pt;line-height:inherit;=
font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,=
sans-serif;font-size-adjust:inherit;font-kerning:inherit;font-feature-setti=
ngs:inherit;margin:0px;padding:0px;vertical-align:baseline;color:rgb(0,0,0)=
"><div style=3D"border:0px;font-variant-numeric:inherit;font-variant-east-a=
sian:inherit;font-variant-alternates:inherit;font-stretch:inherit;font-size=
:11pt;line-height:inherit;font-size-adjust:inherit;font-kerning:inherit;fon=
t-feature-settings:inherit;margin:0px;padding:0px;vertical-align:baseline">=
Hi all,</div><div style=3D"border:0px;font-variant-numeric:inherit;font-var=
iant-east-asian:inherit;font-variant-alternates:inherit;font-stretch:inheri=
t;font-size:11pt;line-height:inherit;font-size-adjust:inherit;font-kerning:=
inherit;font-feature-settings:inherit;margin:0px;padding:0px;vertical-align=
:baseline"><br></div><div style=3D"border:0px;font-variant-numeric:inherit;=
font-variant-east-asian:inherit;font-variant-alternates:inherit;font-stretc=
h:inherit;font-size:11pt;line-height:inherit;font-size-adjust:inherit;font-=
kerning:inherit;font-feature-settings:inherit;margin:0px;padding:0px;vertic=
al-align:baseline">does anyone worked on a recipe for LXD.</div><div style=
=3D"border:0px;font-variant-numeric:inherit;font-variant-east-asian:inherit=
;font-variant-alternates:inherit;font-stretch:inherit;font-size:11pt;line-h=
eight:inherit;font-size-adjust:inherit;font-kerning:inherit;font-feature-se=
ttings:inherit;margin:0px;padding:0px;vertical-align:baseline"><br></div><d=
iv style=3D"border:0px;font-variant-numeric:inherit;font-variant-east-asian=
:inherit;font-variant-alternates:inherit;font-stretch:inherit;font-size:11p=
t;line-height:inherit;font-size-adjust:inherit;font-kerning:inherit;font-fe=
ature-settings:inherit;margin:0px;padding:0px;vertical-align:baseline">We a=
re in the process of moving from Ubuntu to Yocto Scarthgap because we wante=
d to use the OTA functionality of RAUC.</div><div style=3D"border:0px;font-=
variant-numeric:inherit;font-variant-east-asian:inherit;font-variant-altern=
ates:inherit;font-stretch:inherit;font-size:11pt;line-height:inherit;font-s=
ize-adjust:inherit;font-kerning:inherit;font-feature-settings:inherit;margi=
n:0px;padding:0px;vertical-align:baseline"><br></div><div style=3D"border:0=
px;font-variant-numeric:inherit;font-variant-east-asian:inherit;font-varian=
t-alternates:inherit;font-stretch:inherit;font-size:11pt;line-height:inheri=
t;font-size-adjust:inherit;font-kerning:inherit;font-feature-settings:inher=
it;margin:0px;padding:0px;vertical-align:baseline">Now we are faced with th=
e challenge of successfully compiling LXD, I have looked at an old unoffici=
al layer (<a href=3D"https://github.com/fcuringa/meta-lxd">https://github.c=
om/fcuringa/meta-lxd</a>) for reference, which of course no longer works wi=
th more recent LXD builds.</div><div id=3D"gmail-Signature" class=3D"elemen=
tToProof" style=3D"border:0px;font-variant-numeric:inherit;font-variant-eas=
t-asian:inherit;font-variant-alternates:inherit;font-stretch:inherit;font-s=
ize:medium;line-height:inherit;font-size-adjust:inherit;font-kerning:inheri=
t;font-feature-settings:inherit;margin:0px;padding:0px;vertical-align:basel=
ine;color:inherit;background-color:inherit"><p>Best regards</p><p><span sty=
le=3D"border:0px;font:inherit;margin:0px;padding:0px;vertical-align:baselin=
e">Kevin</span></p><p>=C2=A0</p></div></div></div></div></div>

--00000000000097ba6506241ed8d2--

