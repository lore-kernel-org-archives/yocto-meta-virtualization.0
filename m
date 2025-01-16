Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05012E77188
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 03:51:58 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.40804.1736999514481089766
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Jan 2025 19:51:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z6thdRSf;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2efe25558ddso695908a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jan 2025 19:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736999514; x=1737604314; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ng4WaOa8YGtBoXCTdiPWrTLp/SLyL52mqqM4E4+BMQ0=;
        b=Z6thdRSfXznYSpTB/xWeJ/M6thjbHTXoYbKQVkH6dDcnJO51o3PKtTTjkGl4pVKIzW
         HFoAnEDB8dS/C0PUuN4zd3fjRSJkhiSCLO1tdeBFUvXXqMPYkAyjXoLbUHK6sQiY2uW2
         4cxl2hucUE5atd+1yJ/vF1fkQSEdVlp0uXxDzGBMbeuCx31jlEciYz4wqBxRzxnP8rxz
         eFYPE0WesisnoFcm7FXscUvFs5ge2VgSYlrAEsnDC9uk8Ua+NT7w2nOG5RLiqPCW6wwA
         ACKB5fKvfuek/MukCRdocJcAvLyrKYbQxFvKp3ki3EWfSEt+QfqJMFAuybuJrADNcC7G
         pp7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736999514; x=1737604314;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ng4WaOa8YGtBoXCTdiPWrTLp/SLyL52mqqM4E4+BMQ0=;
        b=An1OpTkWwSqu/o7ly1oIqWfk9eZSgHFiT5uRJWd4Ll9z8N8cL+hN3stUtvD06AaZdx
         YXtJiJi4YBHsK6X31PrANuVbEf/Lq8xrg5CDmo6lepq9TRGgckIii8hQd1vwYglw16mf
         ha9BQA1Tn/Dgi+CsBc1pxw4T2Aj1Sbu1rw1WzGCSLM43myYrS+zXckbswDrWIhN5Q1jF
         FTNBcpFNh168NugW05jdFKNLzU2SnPlk4fRsh4bnXkMf++sZqPGVv/9aMZKl4Qg4e9Yx
         gsNUvCQr4Ez+nzRl3q7+DHHynRx6skbcybYhLKkmhqY9MIjN3vKbNvN5hvFGlfWwq31B
         t2vg==
X-Gm-Message-State: AOJu0Yx53+sTKnoJCAZrE7vRlDsnEzqUnqa2IrAPSVTm2/HaPt9L3KZN
	fSPib08p+f4rn6JAdH/MifsTjaA7Z7Kp4DChjp31zC8r7Mf1qBxdJ6WmdBRw0nMfCgiVBlylbf3
	ETK4HRDjYuk2OPCHsRyWfhxuubeg=
X-Gm-Gg: ASbGncsLouTkwRmcSwY/akmSqjGO1Ho4T5bpF/slCT+Fd0hnm2fr8Yv3408y1nVnE0U
	bcPd8sOs4YxZKQue0FACSVszppGcbGEm18XAsE0k=
X-Google-Smtp-Source: AGHT+IG9FnDg8yhUfhoKj/Nh2pCWr7TOpeSZwZF/3H9Eue2boJ0q3ZNkR1kIjg9sjUmg93CYfAlETKr6E2MA/2jiht0=
X-Received: by 2002:a17:90b:534b:b0:2ee:9d57:243 with SMTP id
 98e67ed59e1d1-2f548e9a473mr41419680a91.1.1736999513597; Wed, 15 Jan 2025
 19:51:53 -0800 (PST)
MIME-Version: 1.0
References: <20250115054639.1079705-1-Qi.Chen@windriver.com>
 <CADkTA4M7sk2+H3_MzYAMbO6RANpO0vCdnO7RXN9KaW734=6xhA@mail.gmail.com> <SJ0PR11MB5613176F571BFF4E8087CA18ED1A2@SJ0PR11MB5613.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB5613176F571BFF4E8087CA18ED1A2@SJ0PR11MB5613.namprd11.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 15 Jan 2025 22:51:42 -0500
X-Gm-Features: AbW1kvYbQxRk4VzmvQ1c-LluZYmtfutcWUrjWDUbFsbEPoNftrMxRYUYXBWk2mg
Message-ID: <CADkTA4OrO4FPw7b+96e25TDH1FoG_23n2O-DCe67t5GX9BS12w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/4] buildah: update to 1.37.5
To: "Chen, Qi" <Qi.Chen@windriver.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000fbb394062bcab68e"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Jan 2025 03:51:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9091

--000000000000fbb394062bcab68e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 9:28=E2=80=AFPM Chen, Qi <Qi.Chen@windriver.com> wr=
ote:

> Hi Bruce,
>
>
>
> Is there some place/branch I can check to see if some recipes are being
> upgraded?
>
> I checked master-next before I started, but it didn=E2=80=99t give me suc=
h
> information.
>

They are currently on my local branch, as I'm running into issues with OE
core go being too old as well as some runtime issues.

With any luck, I'll have something working and pushed by the end of the
week.

I've mentioned it on the list before, I do package upgrades twice a cycle.
Once at the M2 OE core release window and another time between M3 and M4 of
the release. Generally speaking, I go through al the recipes and update
them at that point.

In between those points, I'm stabilizing or doing feature work, so I'm
typically not doing (or taking) recipe updates.

I'll put that information in the README as well.

Bruce



>
> Regards,
>
> Qi
>
>
>
> *From:* Bruce Ashfield <bruce.ashfield@gmail.com>
> *Sent:* Wednesday, January 15, 2025 9:59 PM
> *To:* Chen, Qi <Qi.Chen@windriver.com>
> *Cc:* meta-virtualization@lists.yoctoproject.org
> *Subject:* Re: [meta-virtualization][PATCH 1/4] buildah: update to 1.37.5
>
>
>
> I already have queued updates for packages.
>
>
>
> Just some testing issues are holding up the push.
>
>
>
> Also, the SRCREV format doesn't break anything, so I'l leave it as is.
>
>
>
> Bruce
>
>
>
> On Wed, Jan 15, 2025 at 12:47=E2=80=AFAM Chen Qi via lists.yoctoproject.o=
rg
> <https://urldefense.com/v3/__http:/lists.yoctoproject.org__;!!AjveYdw8EvQ=
!fM6eGYErCbP1B63tNuJvOA76Kb-WoSo8IEYXhxfveP7H9RmnFceQ8VCHKFjog1Zk9RaEX10Uts=
o9YgaAhetxoWqU-Q$>
> <Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Fix the SRCREV as there's no need to use SRCREV_FORMAT.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/buildah/buildah_git.bb
> <https://urldefense.com/v3/__http:/buildah_git.bb__;!!AjveYdw8EvQ!fM6eGYE=
rCbP1B63tNuJvOA76Kb-WoSo8IEYXhxfveP7H9RmnFceQ8VCHKFjog1Zk9RaEX10Utso9YgaAhe=
tHNxHyAw$>
> | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-containers/buildah/buildah_git.bb
> <https://urldefense.com/v3/__http:/buildah_git.bb__;!!AjveYdw8EvQ!fM6eGYE=
rCbP1B63tNuJvOA76Kb-WoSo8IEYXhxfveP7H9RmnFceQ8VCHKFjog1Zk9RaEX10Utso9YgaAhe=
tHNxHyAw$>
> b/recipes-containers/buildah/buildah_git.bb
> <https://urldefense.com/v3/__http:/buildah_git.bb__;!!AjveYdw8EvQ!fM6eGYE=
rCbP1B63tNuJvOA76Kb-WoSo8IEYXhxfveP7H9RmnFceQ8VCHKFjog1Zk9RaEX10Utso9YgaAhe=
tHNxHyAw$>
> index 7ad2fd95..1f9805d6 100644
> --- a/recipes-containers/buildah/buildah_git.bb
> <https://urldefense.com/v3/__http:/buildah_git.bb__;!!AjveYdw8EvQ!fM6eGYE=
rCbP1B63tNuJvOA76Kb-WoSo8IEYXhxfveP7H9RmnFceQ8VCHKFjog1Zk9RaEX10Utso9YgaAhe=
tHNxHyAw$>
> +++ b/recipes-containers/buildah/buildah_git.bb
> <https://urldefense.com/v3/__http:/buildah_git.bb__;!!AjveYdw8EvQ!fM6eGYE=
rCbP1B63tNuJvOA76Kb-WoSo8IEYXhxfveP7H9RmnFceQ8VCHKFjog1Zk9RaEX10Utso9YgaAhe=
tHNxHyAw$>
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://src/
> github.com/containers/buildah/LICENSE;md5=3De3fc50a
> <https://urldefense.com/v3/__http:/github.com/containers/buildah/LICENSE;=
md5=3De3fc50a__;!!AjveYdw8EvQ!fM6eGYErCbP1B63tNuJvOA76Kb-WoSo8IEYXhxfveP7H9=
RmnFceQ8VCHKFjog1Zk9RaEX10Utso9YgaAhetp4e-NTw$>
>
>  S =3D "${WORKDIR}/git"
>
> -BUILDAH_VERSION =3D "1.37.1"
> +BUILDAH_VERSION =3D "1.37.5"
>
>  PV =3D "${BUILDAH_VERSION}"
>
> @@ -27,9 +27,7 @@ GO_INSTALL =3D "${GO_IMPORT}"
>  GO_WORKDIR =3D "${GO_INSTALL}"
>  GOBUILDFLAGS +=3D "-mod vendor"
>
> -SRCREV_FORMAT =3D "buildah_storage"
> -SRCREV_buildah =3D "0117c423e94b1051d5e34a16f3f1db8fb63509c7"
> -SRCREV_storage =3D "246ba3062e8b551026aef2708eee747014ce5c52"
> +SRCREV =3D "5fd40b989860984a00f6fc1539ff53caceca1325"
>
>  SRC_URI =3D " \
>      git://
> github.com/containers/buildah;branch=3Drelease-1.37;name=3Dbuildah;protoc=
ol=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX}
> <https://urldefense.com/v3/__http:/github.com/containers/buildah;branch=
=3Drelease-1.37;name=3Dbuildah;protocol=3Dhttps;destsuffix=3D$*7BGO_SRCURI_=
DESTSUFFIX*7D__;JSU!!AjveYdw8EvQ!fM6eGYErCbP1B63tNuJvOA76Kb-WoSo8IEYXhxfveP=
7H9RmnFceQ8VCHKFjog1Zk9RaEX10Utso9YgaAhevZjVC8sw$>
> \
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9081):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9081
> <https://urldefense.com/v3/__https:/lists.yoctoproject.org/g/meta-virtual=
ization/message/9081__;!!AjveYdw8EvQ!fM6eGYErCbP1B63tNuJvOA76Kb-WoSo8IEYXhx=
fveP7H9RmnFceQ8VCHKFjog1Zk9RaEX10Utso9YgaAheuTDS52KA$>
> Mute This Topic: https://lists.yoctoproject.org/mt/110623150/1050810
> <https://urldefense.com/v3/__https:/lists.yoctoproject.org/mt/110623150/1=
050810__;!!AjveYdw8EvQ!fM6eGYErCbP1B63tNuJvOA76Kb-WoSo8IEYXhxfveP7H9RmnFceQ=
8VCHKFjog1Zk9RaEX10Utso9YgaAheuGPzuWxg$>
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> <https://urldefense.com/v3/__https:/lists.yoctoproject.org/g/meta-virtual=
ization/unsub__;!!AjveYdw8EvQ!fM6eGYErCbP1B63tNuJvOA76Kb-WoSo8IEYXhxfveP7H9=
RmnFceQ8VCHKFjog1Zk9RaEX10Utso9YgaAhetvIRvOyQ$>
> [bruce.ashfield@gmail.com]
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

--000000000000fbb394062bcab68e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 15, 2025 at 9:28=
=E2=80=AFPM Chen, Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@w=
indriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div class=3D"msg-1640628545329408510">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_-1640628545329408510WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Hi Bruce,<u></u><u></=
u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Is there some place/b=
ranch I can check to see if some recipes are being upgraded?<u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">I checked master-next=
 before I started, but it didn=E2=80=99t give me such information.</span></=
p></div></div></div></blockquote><div><br></div><div><div class=3D"gmail_de=
fault" style=3D"font-size:small">They are currently on my local branch, as =
I&#39;m running into issues with OE core go being too old as well as some r=
untime issues.</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">With any l=
uck, I&#39;ll have something working and pushed by the end of the week.</di=
v><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">I&#39;ve mentioned it on the=
 list before, I do package upgrades twice a cycle. Once at the M2 OE core r=
elease window and another time between M3 and M4 of the release. Generally =
speaking, I go through al the=C2=A0recipes and update them at that point.=
=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">In between those p=
oints, I&#39;m stabilizing=C2=A0or doing feature work, so I&#39;m typically=
 not doing (or taking) recipe updates.</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">I&#39;ll put that information in the README as well.</div><di=
v class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D=
"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg-1640=
628545329408510"><div lang=3D"EN-US" style=3D"overflow-wrap: break-word;"><=
div class=3D"m_-1640628545329408510WordSection1"><p class=3D"MsoNormal"><sp=
an style=3D"font-size:11pt"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Regards,<u></u><u></u=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Qi<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:Calibri=
,sans-serif">From:</span></b><span style=3D"font-size:11pt;font-family:Cali=
bri,sans-serif"> Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.=
com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;
<br>
<b>Sent:</b> Wednesday, January 15, 2025 9:59 PM<br>
<b>To:</b> Chen, Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"=
_blank">Qi.Chen@windriver.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" ta=
rget=3D"_blank">meta-virtualization@lists.yoctoproject.org</a><br>
<b>Subject:</b> Re: [meta-virtualization][PATCH 1/4] buildah: update to 1.3=
7.5<u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">I already have queued=C2=A0updates for packages.<u><=
/u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Just some testing issues are holding up the push.<u>=
</u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Also, the SRCREV format doesn&#39;t break anything, =
so I&#39;l leave=C2=A0it as is.<u></u><u></u></p>
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
<p class=3D"MsoNormal">On Wed, Jan 15, 2025 at 12:47<span style=3D"font-fam=
ily:&quot;Times New Roman&quot;,serif">=E2=80=AF</span>AM Chen Qi via
<a href=3D"https://urldefense.com/v3/__http:/lists.yoctoproject.org__;!!Ajv=
eYdw8EvQ!fM6eGYErCbP1B63tNuJvOA76Kb-WoSo8IEYXhxfveP7H9RmnFceQ8VCHKFjog1Zk9R=
aEX10Utso9YgaAhetxoWqU-Q$" target=3D"_blank">
lists.yoctoproject.org</a> &lt;Qi.Chen=3D<a href=3D"mailto:windriver.com@li=
sts.yoctoproject.org" target=3D"_blank">windriver.com@lists.yoctoproject.or=
g</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin:5pt 0i=
n 5pt 4.8pt">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">From: Chen Qi &lt;<a hr=
ef=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com=
</a>&gt;<br>
<br>
Fix the SRCREV as there&#39;s no need to use SRCREV_FORMAT.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/buildah/<a href=3D"https://urldefense.com/v3/__htt=
p:/buildah_git.bb__;!!AjveYdw8EvQ!fM6eGYErCbP1B63tNuJvOA76Kb-WoSo8IEYXhxfve=
P7H9RmnFceQ8VCHKFjog1Zk9RaEX10Utso9YgaAhetHNxHyAw$" target=3D"_blank">build=
ah_git.bb</a> | 6 ++----<br>
=C2=A01 file changed, 2 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/recipes-containers/buildah/<a href=3D"https://urldefense.com/v=
3/__http:/buildah_git.bb__;!!AjveYdw8EvQ!fM6eGYErCbP1B63tNuJvOA76Kb-WoSo8IE=
YXhxfveP7H9RmnFceQ8VCHKFjog1Zk9RaEX10Utso9YgaAhetHNxHyAw$" target=3D"_blank=
">buildah_git.bb</a> b/recipes-containers/buildah/<a href=3D"https://urldef=
ense.com/v3/__http:/buildah_git.bb__;!!AjveYdw8EvQ!fM6eGYErCbP1B63tNuJvOA76=
Kb-WoSo8IEYXhxfveP7H9RmnFceQ8VCHKFjog1Zk9RaEX10Utso9YgaAhetHNxHyAw$" target=
=3D"_blank">buildah_git.bb</a><br>
index 7ad2fd95..1f9805d6 100644<br>
--- a/recipes-containers/buildah/<a href=3D"https://urldefense.com/v3/__htt=
p:/buildah_git.bb__;!!AjveYdw8EvQ!fM6eGYErCbP1B63tNuJvOA76Kb-WoSo8IEYXhxfve=
P7H9RmnFceQ8VCHKFjog1Zk9RaEX10Utso9YgaAhetHNxHyAw$" target=3D"_blank">build=
ah_git.bb</a><br>
+++ b/recipes-containers/buildah/<a href=3D"https://urldefense.com/v3/__htt=
p:/buildah_git.bb__;!!AjveYdw8EvQ!fM6eGYErCbP1B63tNuJvOA76Kb-WoSo8IEYXhxfve=
P7H9RmnFceQ8VCHKFjog1Zk9RaEX10Utso9YgaAhetHNxHyAw$" target=3D"_blank">build=
ah_git.bb</a><br>
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D &quot;file://src/<a href=3D"https://ur=
ldefense.com/v3/__http:/github.com/containers/buildah/LICENSE;md5=3De3fc50a=
__;!!AjveYdw8EvQ!fM6eGYErCbP1B63tNuJvOA76Kb-WoSo8IEYXhxfveP7H9RmnFceQ8VCHKF=
jog1Zk9RaEX10Utso9YgaAhetp4e-NTw$" target=3D"_blank">github.com/containers/=
buildah/LICENSE;md5=3De3fc50a</a><br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-BUILDAH_VERSION =3D &quot;1.37.1&quot;<br>
+BUILDAH_VERSION =3D &quot;1.37.5&quot;<br>
<br>
=C2=A0PV =3D &quot;${BUILDAH_VERSION}&quot;<br>
<br>
@@ -27,9 +27,7 @@ GO_INSTALL =3D &quot;${GO_IMPORT}&quot;<br>
=C2=A0GO_WORKDIR =3D &quot;${GO_INSTALL}&quot;<br>
=C2=A0GOBUILDFLAGS +=3D &quot;-mod vendor&quot;<br>
<br>
-SRCREV_FORMAT =3D &quot;buildah_storage&quot;<br>
-SRCREV_buildah =3D &quot;0117c423e94b1051d5e34a16f3f1db8fb63509c7&quot;<br=
>
-SRCREV_storage =3D &quot;246ba3062e8b551026aef2708eee747014ce5c52&quot;<br=
>
+SRCREV =3D &quot;5fd40b989860984a00f6fc1539ff53caceca1325&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"https://urldefense.com/v3/__http:/gith=
ub.com/containers/buildah;branch=3Drelease-1.37;name=3Dbuildah;protocol=3Dh=
ttps;destsuffix=3D$*7BGO_SRCURI_DESTSUFFIX*7D__;JSU!!AjveYdw8EvQ!fM6eGYErCb=
P1B63tNuJvOA76Kb-WoSo8IEYXhxfveP7H9RmnFceQ8VCHKFjog1Zk9RaEX10Utso9YgaAhevZj=
VC8sw$" target=3D"_blank">github.com/containers/buildah;branch=3Drelease-1.=
37;name=3Dbuildah;protocol=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX}</a>
 \<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9081): <a href=3D"https://urldefense.com/v3/__https:/li=
sts.yoctoproject.org/g/meta-virtualization/message/9081__;!!AjveYdw8EvQ!fM6=
eGYErCbP1B63tNuJvOA76Kb-WoSo8IEYXhxfveP7H9RmnFceQ8VCHKFjog1Zk9RaEX10Utso9Yg=
aAheuTDS52KA$" target=3D"_blank">
https://lists.yoctoproject.org/g/meta-virtualization/message/9081</a><br>
Mute This Topic: <a href=3D"https://urldefense.com/v3/__https:/lists.yoctop=
roject.org/mt/110623150/1050810__;!!AjveYdw8EvQ!fM6eGYErCbP1B63tNuJvOA76Kb-=
WoSo8IEYXhxfveP7H9RmnFceQ8VCHKFjog1Zk9RaEX10Utso9YgaAheuGPzuWxg$" target=3D=
"_blank">
https://lists.yoctoproject.org/mt/110623150/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">
meta-virtualization+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/lists.yoctoproje=
ct.org/g/meta-virtualization/unsub__;!!AjveYdw8EvQ!fM6eGYErCbP1B63tNuJvOA76=
Kb-WoSo8IEYXhxfveP7H9RmnFceQ8VCHKFjog1Zk9RaEX10Utso9YgaAhetvIRvOyQ$" target=
=3D"_blank">
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
<p class=3D"MsoNormal"><span class=3D"m_-1640628545329408510gmailsignaturep=
refix">-- </span><u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">- Thou shalt not follow=
 the NULL pointer, for chaos and madness await thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<u></u><u></u></p>
</div>
</div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature">- Thou shalt not follow the NULL pointer, for chaos and madn=
ess await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, S=
tar Trek II<br><br></div></div>

--000000000000fbb394062bcab68e--

