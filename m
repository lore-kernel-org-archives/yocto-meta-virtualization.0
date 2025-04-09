Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FE1C36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 04:04:10 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.794.1744171444121297577
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 08 Apr 2025 21:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FwmmCkqT;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3018e2d042bso4278124a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Apr 2025 21:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744171443; x=1744776243; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BOTbm3fwXCO9CpNPPj+iFW5onLB6mMZ+2IoMjmnlI8w=;
        b=FwmmCkqT08s0jEcWhsR8RrCf9Ok1XEkKkAXEYewuYVPtfMG6cXJ3RxQ8fdQ0QVz3fN
         mAWcAx5U2WklDYvMa8CF0+bU1AhntkGlNt6Xew5U+DKnEoRaMyBXONTbANx4xzP54UZa
         D+2gCA29ujfpIAQGHBlbLF7LusGuGcgQdUPUjlFdua3+M8HfAXoeMPTaWsk2ahad+ySI
         xm0xXF0xlajSIg6baZoK457auN0eDpQr63DmWLiM9skaB43Gq8QwKxae7wAbYxMSDXpf
         LDYy9IG7MsvniQDPmRakDObqdVrVruueAlRvegD7ULyfTeJl+44YyN++uoRpgXGsGHIz
         ummQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744171443; x=1744776243;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BOTbm3fwXCO9CpNPPj+iFW5onLB6mMZ+2IoMjmnlI8w=;
        b=L8s2TnQUkwqBfOY6/JdfLoMDESGvb5tjCp53r58OvRKR4hhw1r8uj0Xl6F47R7jCT+
         3WK6SfMjRQPPmtB4n4NVaETaOdtBcrADt/9O65wULooLZIc9FOQNLHBPJhX12znWArV1
         /AdzFsWpt2HLwDjBF2xhzDPRlZtB6hd9nZeKD6gA1sh5eQQNTeyjd0V63AuhtxKQm13V
         hHNM2Hi+2jmaKBiK0avNWRTdhmdoAO78VD9+yTD71vHnhXXTL1zBghAalPjdeF7NDLuv
         6XmDwh2IqkgLmoCa8exnbE01f/cxWTVBSJkNJPnBTMHLl0Yjr1xn+HghRA6kl9oVTi4b
         iN+g==
X-Gm-Message-State: AOJu0YxsYUefUgPvlviQDIj8RuGxwLFKHoBfYMJF1M3CgIl/OxRz8ET9
	d9OvOhmUJ0ysvhMFbtHHzo6h8yEk7zNbcZllYIp0vJXC/bOYDE564GTgCzFfEzYewcMzFRfD0MW
	ZmkgVV1/4dst0U5SQaYKvCboZ2gI=
X-Gm-Gg: ASbGncso9JzYvcmNTiX0E1C3l1aUPgRgY3pKrG/MSNhqZMmOsXtAjaOI0To9plHWG5O
	42l6c5govobajmzVdXfh2oV0AENt6nhaJG42Z78xkFrEJD6Mo+xg1zppnihiwXt32Bt7d+x5ZPt
	qlXF6wmGe3M96ZYaLw2m/7LmqWHZtaGFroPjh/QA==
X-Google-Smtp-Source: AGHT+IGc6WRa/t6ALbRe2MMZoOQBX1f2RdbRZNAUGiAexocN5PNoLsDQuiRlroJKznfx+779CAUrVje0pstQGIT5ZPA=
X-Received: by 2002:a17:90b:58c4:b0:2fe:99cf:f579 with SMTP id
 98e67ed59e1d1-306dbb94dc0mr2370674a91.4.1744171443298; Tue, 08 Apr 2025
 21:04:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250403062511.3088323-1-pkj@axis.com> <CADkTA4O=zgxEz9cyTCLfpeMS743p8uim2k9CaKsvtKRb-7jiSA@mail.gmail.com>
 <DB5PR02MB102133C51219E19F33C0E8581EFAA2@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB102133C51219E19F33C0E8581EFAA2@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 9 Apr 2025 00:03:52 -0400
X-Gm-Features: ATxdqUGbBK3MOuQQiha7iEcVlKBMyHClCAh75qNFMaa3odDtDyPZEUCQSKdHoqk
Message-ID: <CADkTA4P-84MRb99X+DcWfCpFGWdPKDz3=Ue=m3G+_HwP=SRYQA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 1/2] diod: Remove the dependency on tcp-wrappers
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000004e28fb0632508f6e"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 09 Apr 2025 04:04:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9209

--0000000000004e28fb0632508f6e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 10:26=E2=80=AFAM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> What piqued my curiosity was that you added
> --with-systemdsystemunitdir=3D${systemd_unitdir}/system without removing
> the systemddir=3D${systemd_unitdir}/system as they looked very much like
> they were used for the same purpose. As for tcp-wrappers, I do not really
> remember. It may have been that I saw something while digging around the
> upstream commits related to the systemd changes. We have had them disable=
d
> via a bbappend in our builds for a long time, so it may also have been th=
at
> I just took the opportunity to check if our override was still needed,
> which it turned out it wasn=E2=80=99t. :)
>
>
>

Fair enough!

I'm just glad to hear that I wasn't missing anything obvious by not seeing
these myself.

They are now staged on master-next, and will appear in master in the next
day or so.

Bruce



> //Peter
>
>
>
> *From:* Bruce Ashfield <bruce.ashfield@gmail.com>
> *Sent:* den 4 april 2025 16:56
> *To:* Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> *Cc:* meta-virtualization@lists.yoctoproject.org
> *Subject:* Re: [meta-virtualization] [PATCH 1/2] diod: Remove the
> dependency on tcp-wrappers
>
>
>
> Thanks for the patches! I'll stage them shortly.
>
>
>
> I am curious how you managed to detect that the dependency and
>
> systemd parameter were no longer necessary. Since I'd add checks like
>
> that to my update steps at the M1/M3 points in the cycle.
>
>
>
> Bruce
>
>
>
> On Thu, Apr 3, 2025 at 2:25=E2=80=AFAM Peter Kjellerstedt via
> lists.yoctoproject.org <peter.kjellerstedt=3Daxis.com@lists.yoctoproject.=
org>
> wrote:
>
> Use of tcp-wrappers was removed from the diod repository in commit
> 59b221f7b5eb24a20fdd886fdd1f8ff9810bdb73.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  recipes-extended/diod/diod_1.0.24.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/diod/diod_1.0.24.bb b/recipes-extended/diod=
/
> diod_1.0.24.bb
> index 89e79df9..a33b9a66 100644
> --- a/recipes-extended/diod/diod_1.0.24.bb
> +++ b/recipes-extended/diod/diod_1.0.24.bb
> @@ -15,7 +15,7 @@ SRC_URI =3D "git://
> github.com/chaos/diod.git;protocol=3Dhttps;branch=3Dmaster \
>             file://diod.conf \
>             file://0001-build-Find-lua-with-pkg-config.patch \
>             "
> -DEPENDS =3D "libcap ncurses tcp-wrappers lua"
> +DEPENDS =3D "libcap ncurses lua"
>
>  EXTRA_OEMAKE +=3D "systemddir=3D${systemd_unitdir}/system"
>  EXTRA_OECONF =3D "--disable-auth \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9197):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9197
> Mute This Topic: https://lists.yoctoproject.org/mt/112061247/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
>
> --
>
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000004e28fb0632508f6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 7, 2025 at 10:26=
=E2=80=AFAM Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axi=
s.com">peter.kjellerstedt@axis.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div class=3D"msg-6476392137721210218">





<div lang=3D"SV" style=3D"overflow-wrap: break-word;">
<div class=3D"m_-6476392137721210218WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)">What piqued my curiosity was =
that you added
</span><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:Consolas;co=
lor:rgb(148,54,52)">--with-systemdsystemunitdir=3D${systemd_unitdir}/system=
</span><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:Calibri,san=
s-serif;color:rgb(148,54,52)">
 without removing the </span><span lang=3D"EN-US" style=3D"font-size:11pt;f=
ont-family:Consolas;color:rgb(148,54,52)">systemddir=3D${systemd_unitdir}/s=
ystem</span><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:Calibr=
i,sans-serif;color:rgb(148,54,52)">
 as they looked very much like they were used for the same purpose. As for =
</span>
<span lang=3D"EN-US" style=3D"font-size:11pt;font-family:Consolas;color:rgb=
(148,54,52)">tcp-wrappers</span><span lang=3D"EN-US" style=3D"font-size:11p=
t;font-family:Calibri,sans-serif;color:rgb(148,54,52)">, I do not really
 remember. It may have been that I saw something while digging around the u=
pstream commits related to the systemd changes. We have had them disabled v=
ia a bbappend in our builds for a long time, so it may also have been that =
I just took the opportunity to check
 if our override was still needed, which it turned out it wasn=E2=80=99t. :=
)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)"><u></u>=C2=A0</span></p></div=
></div></div></blockquote><div><br></div><div><div class=3D"gmail_default" =
style=3D"font-size:small">Fair enough!</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">I&#39;m just glad to hear that I wasn&#39;t missing anything =
obvious by not seeing these myself.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">They are now staged on master-next, and will appear in master in=
 the next day or so.</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruc=
e</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div class=3D"msg-6476392137721210218"><div lang=3D"SV" style=3D=
"overflow-wrap: break-word;"><div class=3D"m_-6476392137721210218WordSectio=
n1"><p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;fon=
t-family:Calibri,sans-serif;color:rgb(148,54,52)"><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)">//Peter<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)"><u></u>=C2=A0<u></u></span></=
p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-l=
eft:1.5pt solid blue;padding:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11pt;font=
-family:Calibri,sans-serif">From:</span></b><span lang=3D"EN-US" style=3D"f=
ont-size:11pt;font-family:Calibri,sans-serif"> Bruce Ashfield &lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail=
.com</a>&gt;
<br>
<b>Sent:</b> den 4 april 2025 16:56<br>
<b>To:</b> Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis=
.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" ta=
rget=3D"_blank">meta-virtualization@lists.yoctoproject.org</a><br>
<b>Subject:</b> Re: [meta-virtualization] [PATCH 1/2] diod: Remove the depe=
ndency on tcp-wrappers<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Thanks for the patches! I&#39;ll stage them shortly.=
<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I am curious how you managed to detect that the depe=
ndency and<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">systemd parameter were no longer necessary. Since I&=
#39;d add checks like<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">that to my update steps at the M1/M3 points in the c=
ycle.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Bruce<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Thu, Apr 3, 2025 at 2:25<span style=3D"font-famil=
y:Arial,sans-serif">=E2=80=AF</span>AM Peter Kjellerstedt via
<a href=3D"http://lists.yoctoproject.org" target=3D"_blank">lists.yoctoproj=
ect.org</a> &lt;peter.kjellerstedt=3D<a href=3D"mailto:axis.com@lists.yocto=
project.org" target=3D"_blank">axis.com@lists.yoctoproject.org</a>&gt; wrot=
e:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">Use of tcp-wrappers was=
 removed from the diod repository in commit<br>
59b221f7b5eb24a20fdd886fdd1f8ff9810bdb73.<br>
<br>
Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@=
axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/diod/<a href=3D"http://diod_1.0.24.bb" target=3D"_bl=
ank">diod_1.0.24.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/diod/<a href=3D"http://diod_1.0.24.bb" target=
=3D"_blank">diod_1.0.24.bb</a> b/recipes-extended/diod/<a href=3D"http://di=
od_1.0.24.bb" target=3D"_blank">diod_1.0.24.bb</a><br>
index 89e79df9..a33b9a66 100644<br>
--- a/recipes-extended/diod/<a href=3D"http://diod_1.0.24.bb" target=3D"_bl=
ank">diod_1.0.24.bb</a><br>
+++ b/recipes-extended/diod/<a href=3D"http://diod_1.0.24.bb" target=3D"_bl=
ank">diod_1.0.24.bb</a><br>
@@ -15,7 +15,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/chao=
s/diod.git;protocol=3Dhttps;branch=3Dmaster" target=3D"_blank">github.com/c=
haos/diod.git;protocol=3Dhttps;branch=3Dmaster</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a>file://diod.conf</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a>file://0001-build-Find-lua-wit=
h-pkg-config.patch</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-DEPENDS =3D &quot;libcap ncurses tcp-wrappers lua&quot;<br>
+DEPENDS =3D &quot;libcap ncurses lua&quot;<br>
<br>
=C2=A0EXTRA_OEMAKE +=3D &quot;systemddir=3D${systemd_unitdir}/system&quot;<=
br>
=C2=A0EXTRA_OECONF =3D &quot;--disable-auth \<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9197): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9197" target=3D"_blank">
https://lists.yoctoproject.org/g/meta-virtualization/message/9197</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/112061247/105=
0810" target=3D"_blank">
https://lists.yoctoproject.org/mt/112061247/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">
meta-virtualization+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" target=3D"_blank">
https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a href=3D"=
mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com=
</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<u></u><u></u></p>
</blockquote>
</div>
<div>
<p class=3D"MsoNormal"><br clear=3D"all">
<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal"><span class=3D"m_-6476392137721210218gmailsignaturep=
refix">-- </span><u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">- Thou shalt not follow=
 the NULL pointer, for chaos and madness await thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<u></u><u></u></p>
</div>
</div>
</div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature">- Thou shalt not follow the NULL pointer, for chaos and madn=
ess await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, S=
tar Trek II<br><br></div></div>

--0000000000004e28fb0632508f6e--

