Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEAC1E77188
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 03:59:37 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.40905.1736999969099835718
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Jan 2025 19:59:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SjTS79H9;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ee989553c1so912139a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jan 2025 19:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736999968; x=1737604768; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZkWfriRne6oNoh2OU4GH6n/x/eIGg8/nn9BIIO51CU=;
        b=SjTS79H9uTimJAw9rY8480cL8l2No07fKzTsCQ/Z2nGPhOVlf9GSNPPpAYMOJWPUgR
         7cRnj4JIqhoKGw8NB+N+ZZRI/t2AmpSjL6oHTYeIhzyKrflOVQ5i8irhQC2UC6tA1LGs
         UAywsokfUQRyod+T8F9LzSSkfnJekxLAKGqumgIugqoUIZSXk2NC59FpUjmU50SKl0Ub
         0U9zie0M31gMbHHQbHjBgMPhVGxgkzdbfs5s/61cocW/HC287rKTpZtiiIZV+k/Tfi5y
         Xfim9Wa2SIYOQI4+CClt57cmdBYx02yDT9gDhUol1ujAWx1kUvboU/Vg4yCjmGjH4Opx
         ZXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736999968; x=1737604768;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ZkWfriRne6oNoh2OU4GH6n/x/eIGg8/nn9BIIO51CU=;
        b=LsoiBtIXJwYATxDy3Aie+Q0izCgRhdaN08XTd7sL/6J1bcV45QEQvf5WudUIsX0oga
         1XAYyeCcBPt3xX1vb02SkVx0B+GiBQKcQ51rEyZxB24KLYrOilyO2fz+LVNp4CNce3gT
         YS89sTgE6Vd3U87fPqESKAnBh2Eo0FaucA4hVW8nzwEXSPiXYIyZ/JUI5wpbIOdoDhoW
         NM+Lhoys+uewqmeSem2r3Op+9QWCtnYZKpXzn8iWMqz2R7bPv4+m5EftNt2UFSGGQkky
         rEGKUO/KZnUK7iv0noM10OqYLYz1ekJ+rRPTZgRJe8q9H4NwSaa+CNVUbodKMwOldpnG
         xgDA==
X-Gm-Message-State: AOJu0YwWdAhNTFgRzQSwa9Y8l7YRfNAZfb2RTeFR1szM5knVI2gDB8y7
	AhsYXGlvSlYRa4xl7wWknL54vC1mPBLjMrTkgFnIBXT613a3Hd8fhCcTSgx7UVrnGlJ7R31lD3B
	FHzyZqmlSHpSDQ8+196DdrCcqzxE=
X-Gm-Gg: ASbGncshjmBlUwB5FnhdiWuQbgG65whDI3U3ibXor8xEXbU2RqnJrT/9Ph9WU2o7afc
	jWzJNoVfeNBryLnW7n2VAd71XCwhM5Q7EkFhTINA=
X-Google-Smtp-Source: AGHT+IHzAcpgFD3BJFelrZRo8tLjG2g/PJjkGR+poL6WljBaunJCg3Z200qtUcTxqALrpM3m9OWkhUJyxF5+ZwuUUxo=
X-Received: by 2002:a17:90b:514d:b0:2ee:d024:e4fc with SMTP id
 98e67ed59e1d1-2f5490dd195mr49994401a91.33.1736999968277; Wed, 15 Jan 2025
 19:59:28 -0800 (PST)
MIME-Version: 1.0
References: <20250115054639.1079705-1-Qi.Chen@windriver.com>
 <CADkTA4M7sk2+H3_MzYAMbO6RANpO0vCdnO7RXN9KaW734=6xhA@mail.gmail.com>
 <SJ0PR11MB5613176F571BFF4E8087CA18ED1A2@SJ0PR11MB5613.namprd11.prod.outlook.com>
 <CADkTA4OrO4FPw7b+96e25TDH1FoG_23n2O-DCe67t5GX9BS12w@mail.gmail.com> <SJ0PR11MB5613F411FB4E85B568045CCCED1A2@SJ0PR11MB5613.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB5613F411FB4E85B568045CCCED1A2@SJ0PR11MB5613.namprd11.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 15 Jan 2025 22:59:16 -0500
X-Gm-Features: AbW1kvbyveUxjt_IBD0oWJTptaEJAfxj19M662EP1YkjhUqHncdOMXeD6chF2TI
Message-ID: <CADkTA4P_G1rVJ+zyn2j7XGQ2R8AzkUnSdVOhs9bEAqMHs91+vw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/4] buildah: update to 1.37.5
To: "Chen, Qi" <Qi.Chen@windriver.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000015909a062bcad255"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Jan 2025 03:59:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9093

--00000000000015909a062bcad255
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Also, on further thought.

We can clean up the SRCREV for this recipe, I did some digging and there's
no reason I see the need to specify multiple in the future.

Once I push the package updates, I'd be ok with a patch that contains just
the SRCREV_FORMAT changes.

Bruce

On Wed, Jan 15, 2025 at 10:57=E2=80=AFPM Chen, Qi <Qi.Chen@windriver.com> w=
rote:

> Got it! Thanks a lot.
>
>
>
> Regards,
>
> Qi
>
>
>
> *From:* Bruce Ashfield <bruce.ashfield@gmail.com>
> *Sent:* Thursday, January 16, 2025 11:52 AM
> *To:* Chen, Qi <Qi.Chen@windriver.com>
> *Cc:* meta-virtualization@lists.yoctoproject.org
> *Subject:* Re: [meta-virtualization][PATCH 1/4] buildah: update to 1.37.5
>
>
>
>
>
>
>
> On Wed, Jan 15, 2025 at 9:28=E2=80=AFPM Chen, Qi <Qi.Chen@windriver.com> =
wrote:
>
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
>
>
> They are currently on my local branch, as I'm running into issues with OE
> core go being too old as well as some runtime issues.
>
>
>
> With any luck, I'll have something working and pushed by the end of the
> week.
>
>
>
> I've mentioned it on the list before, I do package upgrades twice a cycle=
.
> Once at the M2 OE core release window and another time between M3 and M4 =
of
> the release. Generally speaking, I go through al the recipes and update
> them at that point.
>
>
>
> In between those points, I'm stabilizing or doing feature work, so I'm
> typically not doing (or taking) recipe updates.
>
>
>
> I'll put that information in the README as well.
>
>
>
> Bruce
>
>
>
>
>
>
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

--00000000000015909a062bcad255
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Also, on further thought.</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">We can clean up the SRCREV for this recipe, I did some diggi=
ng and there&#39;s no reason I see the need to specify=C2=A0multiple in the=
 future.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">Once I push the =
package updates, I&#39;d be ok with a patch that contains just the SRCREV_F=
ORMAT changes.</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div=
></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr=
" class=3D"gmail_attr">On Wed, Jan 15, 2025 at 10:57=E2=80=AFPM Chen, Qi &l=
t;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=
=3D"msg-8504641960454268398">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_-8504641960454268398WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Got it! Thanks a lot.=
<u></u><u></u></span></p>
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
<b>Sent:</b> Thursday, January 16, 2025 11:52 AM<br>
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
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Wed, Jan 15, 2025 at 9:28<span style=3D"font-fami=
ly:&quot;Times New Roman&quot;,serif">=E2=80=AF</span>PM Chen, Qi &lt;<a hr=
ef=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com=
</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Hi Bruce,</span><u></=
u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0</span><u></u><=
u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Is there some place/b=
ranch I can check to see if some recipes are being upgraded?</span><u></u><=
u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">I checked master-next=
 before I started, but it didn=E2=80=99t give me such information.</span><u=
></u><u></u></p>
</div>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">They are currently on my local branch, as I&#39;m ru=
nning into issues with OE core go being too old as well as some runtime iss=
ues.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">With any luck, I&#39;ll have something working and p=
ushed by the end of the week.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I&#39;ve mentioned it on the list before, I do packa=
ge upgrades twice a cycle. Once at the M2 OE core release window and anothe=
r time between M3 and M4 of the release. Generally speaking, I go through a=
l the=C2=A0recipes and update them at that
 point.=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">In between those points, I&#39;m stabilizing=C2=A0or=
 doing feature work, so I&#39;m typically not doing (or taking) recipe upda=
tes.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I&#39;ll put that information in the README as well.=
<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Bruce<u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0</span><u></u><=
u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Regards,</span><u></u=
><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Qi</span><u></u><u></=
u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0</span><u></u><=
u></u></p>
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
rget=3D"_blank">
meta-virtualization@lists.yoctoproject.org</a><br>
<b>Subject:</b> Re: [meta-virtualization][PATCH 1/4] buildah: update to 1.3=
7.5</span><u></u><u></u></p>
</div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal">I already have queued=C2=A0updates for packages.<u><=
/u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Just some testing issues are holding up the push.<u>=
</u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Also, the SRCREV format doesn&#39;t break anything, =
so I&#39;l leave=C2=A0it as is.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Bruce<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
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
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><span class=3D"m_-8504641960454268398m-1640628545329=
408510gmailsignatureprefix">--
</span><u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">- Thou shalt not follow=
 the NULL pointer, for chaos and madness await thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<u></u><u></u></p>
</div>
</div>
</div>
</div>
</blockquote>
</div>
<div>
<p class=3D"MsoNormal"><br clear=3D"all">
<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal"><span class=3D"m_-8504641960454268398gmailsignaturep=
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

--00000000000015909a062bcad255--

