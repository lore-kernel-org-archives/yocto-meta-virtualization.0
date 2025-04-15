Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8A7C369B2
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 02:46:00 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.11543.1744685150826200592
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Apr 2025 19:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VeDTdCtI;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb3so4837564a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Apr 2025 19:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744685150; x=1745289950; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kURlfkEwkfXPCGEoQYQ0GXXPF95ptRSVxUKPQPa6Ioc=;
        b=VeDTdCtI2z0LmOx2Tm/3sm15q/ujiGGbYlfYOrUBDwHxfN/hnrJwK5g2BXyCyY8izi
         hzHI4idF+WsaI71XaRtdYmg4acmdc+0J6kmsAK+u/rQS2BxCjA9f530jiQvLF0jilM8k
         bmBlkyZmHXwackN6JjXU2e/+aDpwn9pUJoGUMHx5CAIJ+wc1Goxj2Tt2sRDUgVWdnP4X
         RPabS6y/AHQs50VWX4l9azVUGl81wyrGy37rTe/bTBsxB01Z45s5V/TOZhwRtGuo+SUn
         2mrDSlQRUqCgup15qkwgH/pIeghR14gi+Bxq6go8hBAf871vHo3m++Cmxo+shMyt2YQP
         eXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744685150; x=1745289950;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kURlfkEwkfXPCGEoQYQ0GXXPF95ptRSVxUKPQPa6Ioc=;
        b=M10hSyhbVN9PJgNsOfGz6ddCcw3EPfyYiXHIy3AThoMkClx9aoOlkO20YQabfLYomW
         MfB+8iMacfMhBdEMcx4zEqZHl6NRmIBONA6CVU/Jym8ekyg6ecr/D6zOp5vYMnU3WXB6
         Yo9usMTtVx9u1i3nP0Xruj+NLpDaIoD4s6RjTHQE5TGA9xKZL0dkUrO5NvM9snv/mmBN
         XCRNG8rncuSoE7VubUFpY/OwYM1TXTtG8lHqHalXYGO7w15JkNrosmUtAsiNz5BqaRGJ
         y+g6/ig7B2giSrIMFLv9fXxnDBNZGLoLnre3oDqNSd1e4N1zChgOuJ6p+0jPcBg5yZyk
         CtJw==
X-Gm-Message-State: AOJu0YwTH2rQlgobah8+J70QX8eOL/H7O+y70xRxxHwuJTRDCcDLcHQx
	cI+UX0ZLxB+HvgBK57KH6fm8rftABl6kl8KA7XRicih8U7D2oEA2hUdCHmk5NsEMzjLFLGPpuWv
	Y7ADf4MuAPtT4lkbDfK9ecwIWhNQ=
X-Gm-Gg: ASbGncu4WDWhWYxqk+l3WWsQ8kh5aKqCWYNCMER6GJz7+W7PpcO+IXPvfuefDsmI0ly
	MSr6+7dG49W8Eij0GW/shyi1ulc1VmzdXLmovluVkR0RpzqUIASuIuoyjo7u8wjanPLq9/OlV3S
	mir7tpDMAVO/rzXSTpvrEh
X-Google-Smtp-Source: AGHT+IHJhjGsKiv4aePpUtkg4rlas7iO8pk6lVZhFRqG+ImEVBfSvWZ1G4g7C9rRkuc3/aXSmfvRFsV56qftSE6+KNA=
X-Received: by 2002:a17:90b:3808:b0:2ff:6608:78cd with SMTP id
 98e67ed59e1d1-30823646b04mr21970178a91.9.1744685149974; Mon, 14 Apr 2025
 19:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250414100358.2940529-1-Qi.Chen@windriver.com>
 <CADkTA4O=qumMgBDckujDy5QfZit3j==Mxnn4ngYn15u1o7rBpQ@mail.gmail.com> <CO6PR11MB56021D1E9EE83AD620F308C6EDB22@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB56021D1E9EE83AD620F308C6EDB22@CO6PR11MB5602.namprd11.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 14 Apr 2025 22:45:39 -0400
X-Gm-Features: ATxdqUEDtOuyKhiHnSMU9WFcckzeTHXL7HVHAnydOHeNb0a80Y_lv365m7uvm4E
Message-ID: <CADkTA4PLwFVqd=Uk_xcT8AXVkNi91L38WfU1b177wJva+mXoeg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/3] podman: update to 5.4.2
To: "Chen, Qi" <Qi.Chen@windriver.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000009bf80e0632c82a5b"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 15 Apr 2025 02:46:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9226

--0000000000009bf80e0632c82a5b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 10:06=E2=80=AFPM Chen, Qi <Qi.Chen@windriver.com> w=
rote:

> Hi Bruce,
>
>
>
> My primary  concern is the walnascar branch. These three upgrades all bum=
p
> recipes versions to stable versions, which I think would be good for
> walnascar branch. I noticed that meta-vrit hasn=E2=80=99t branched out wa=
lnascar.
> So I sent out these patches without =E2=80=98walnascar=E2=80=99 in the ti=
tles.
>
>
>
> When will the walnascar branch be created for meta-virt? Will you take
> these patches for the walnascar branch?
>

I've already branched locally and am doing final testing.

I'll be doing standard -stable updates to the branch, so there's no need to
rush anything like this in.

Also, meta-virt has never (and won't) been concerned with being on a
"release commit", so when I do those updates they'll be to some commit in
the stable update branches of the recipes.

Cheers,

Bruce




>
>
> Regards,
>
> Qi
>
>
>
> *From:* Bruce Ashfield <bruce.ashfield@gmail.com>
> *Sent:* Monday, April 14, 2025 10:12 PM
> *To:* Chen, Qi <Qi.Chen@windriver.com>
> *Cc:* meta-virtualization@lists.yoctoproject.org
> *Subject:* Re: [meta-virtualization][PATCH 1/3] podman: update to 5.4.2
>
>
>
> I'm not taking any package upgrades now.
>
>
>
> When I do my package update cycle around M1.5 of the next release,
> everything will be bumped then.
>
>
>
> Bruce
>
>
>
> On Mon, Apr 14, 2025 at 6:04=E2=80=AFAM Chen Qi via lists.yoctoproject.or=
g
> <https://urldefense.com/v3/__http:/lists.yoctoproject.org__;!!AjveYdw8EvQ=
!YgtbTrmV7UuP6_-xmeKCmaKiA7c37VPp16xjwDmp4PnXq4mLha8BNM_VFgeuop36LBaOU0x0Sr=
psNjJPeyDAI7bL2A$>
> <Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Upgrade podman from 5.4.1+ to 5.4.2.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/podman/podman_git.bb
> <https://urldefense.com/v3/__http:/podman_git.bb__;!!AjveYdw8EvQ!YgtbTrmV=
7UuP6_-xmeKCmaKiA7c37VPp16xjwDmp4PnXq4mLha8BNM_VFgeuop36LBaOU0x0SrpsNjJPeyD=
AHj_h8A$>
> | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/podman/podman_git.bb
> <https://urldefense.com/v3/__http:/podman_git.bb__;!!AjveYdw8EvQ!YgtbTrmV=
7UuP6_-xmeKCmaKiA7c37VPp16xjwDmp4PnXq4mLha8BNM_VFgeuop36LBaOU0x0SrpsNjJPeyD=
AHj_h8A$>
> b/recipes-containers/podman/podman_git.bb
> <https://urldefense.com/v3/__http:/podman_git.bb__;!!AjveYdw8EvQ!YgtbTrmV=
7UuP6_-xmeKCmaKiA7c37VPp16xjwDmp4PnXq4mLha8BNM_VFgeuop36LBaOU0x0SrpsNjJPeyD=
AHj_h8A$>
> index 46c6c969..764c0af8 100644
> --- a/recipes-containers/podman/podman_git.bb
> <https://urldefense.com/v3/__http:/podman_git.bb__;!!AjveYdw8EvQ!YgtbTrmV=
7UuP6_-xmeKCmaKiA7c37VPp16xjwDmp4PnXq4mLha8BNM_VFgeuop36LBaOU0x0SrpsNjJPeyD=
AHj_h8A$>
> +++ b/recipes-containers/podman/podman_git.bb
> <https://urldefense.com/v3/__http:/podman_git.bb__;!!AjveYdw8EvQ!YgtbTrmV=
7UuP6_-xmeKCmaKiA7c37VPp16xjwDmp4PnXq4mLha8BNM_VFgeuop36LBaOU0x0SrpsNjJPeyD=
AHj_h8A$>
> @@ -16,7 +16,7 @@ DEPENDS =3D " \
>      gettext-native \
>  "
>
> -SRCREV =3D "227df90eb7c021097c9ba5f8000c83648a598028"
> +SRCREV =3D "be85287fcf4590961614ee37be65eeb315e5d9ff"
>  SRC_URI =3D " \
>      git://
> github.com/containers/libpod.git;branch=3Dv5.4;protocol=3Dhttps;destsuffi=
x=3D${GO_SRCURI_DESTSUFFIX}
> <https://urldefense.com/v3/__http:/github.com/containers/libpod.git;branc=
h=3Dv5.4;protocol=3Dhttps;destsuffix=3D$*7BGO_SRCURI_DESTSUFFIX*7D__;JSU!!A=
jveYdw8EvQ!YgtbTrmV7UuP6_-xmeKCmaKiA7c37VPp16xjwDmp4PnXq4mLha8BNM_VFgeuop36=
LBaOU0x0SrpsNjJPeyBDKV46Cg$>
> \
>      ${@bb.utils.contains('PACKAGECONFIG', 'rootless',
> 'file://50-podman-rootless.conf', '', d)} \
> @@ -30,7 +30,7 @@ GO_IMPORT =3D "import"
>
>  S =3D "${WORKDIR}/git"
>
> -PV =3D "v5.4.1"
> +PV =3D "v5.4.2"
>
>  CVE_STATUS[CVE-2022-2989] =3D "fixed-version: fixed since v4.3.0"
>  CVE_STATUS[CVE-2023-0778] =3D "fixed-version: fixed since v4.5.0"
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9219):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9219
> <https://urldefense.com/v3/__https:/lists.yoctoproject.org/g/meta-virtual=
ization/message/9219__;!!AjveYdw8EvQ!YgtbTrmV7UuP6_-xmeKCmaKiA7c37VPp16xjwD=
mp4PnXq4mLha8BNM_VFgeuop36LBaOU0x0SrpsNjJPeyCP1y3Xqg$>
> Mute This Topic: https://lists.yoctoproject.org/mt/112254335/1050810
> <https://urldefense.com/v3/__https:/lists.yoctoproject.org/mt/112254335/1=
050810__;!!AjveYdw8EvQ!YgtbTrmV7UuP6_-xmeKCmaKiA7c37VPp16xjwDmp4PnXq4mLha8B=
NM_VFgeuop36LBaOU0x0SrpsNjJPeyDtKN4uYA$>
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> <https://urldefense.com/v3/__https:/lists.yoctoproject.org/g/meta-virtual=
ization/unsub__;!!AjveYdw8EvQ!YgtbTrmV7UuP6_-xmeKCmaKiA7c37VPp16xjwDmp4PnXq=
4mLha8BNM_VFgeuop36LBaOU0x0SrpsNjJPeyDyb0-POQ$>
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

--0000000000009bf80e0632c82a5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 14, 2025 at 10:06=
=E2=80=AFPM Chen, Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@w=
indriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div class=3D"msg-6058584128102264821">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_-6058584128102264821WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Hi Bruce,<u></u><u></=
u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">My primary=C2=A0 conc=
ern is the walnascar branch. These three upgrades all bump recipes versions=
 to stable versions, which I think would be good for walnascar branch. I no=
ticed that meta-vrit hasn=E2=80=99t branched out
 walnascar. So I sent out these patches without =E2=80=98walnascar=E2=80=99=
 in the titles.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">When will the walnasc=
ar branch be created for meta-virt? Will you take these patches for the wal=
nascar branch?</span></p></div></div></div></blockquote><div><br></div><div=
><div class=3D"gmail_default" style=3D"font-size:small">I&#39;ve already br=
anched locally and am doing final testing.</div></div><div><br></div><div><=
div class=3D"gmail_default" style=3D"font-size:small">I&#39;ll be doing sta=
ndard -stable updates to the branch, so there&#39;s no need to rush anythin=
g=C2=A0like this in.</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Also=
, meta-virt has never (and won&#39;t) been concerned with being on a &quot;=
release commit&quot;, so when I do those updates they&#39;ll be to some com=
mit in the stable update branches of the recipes.</div><div class=3D"gmail_=
default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">Cheers,</div><div class=3D"gmail_default" style=3D=
"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">Bruce</div><br><br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div class=3D"msg-6058584128102264821"><div lang=
=3D"EN-US" style=3D"overflow-wrap: break-word;"><div class=3D"m_-6058584128=
102264821WordSection1"><p class=3D"MsoNormal"><span style=3D"font-size:11pt=
">
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
<b>Sent:</b> Monday, April 14, 2025 10:12 PM<br>
<b>To:</b> Chen, Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"=
_blank">Qi.Chen@windriver.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" ta=
rget=3D"_blank">meta-virtualization@lists.yoctoproject.org</a><br>
<b>Subject:</b> Re: [meta-virtualization][PATCH 1/3] podman: update to 5.4.=
2<u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">I&#39;m not taking any package upgrades now.<u></u><=
u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">When I do my package update cycle around M1.5 of the=
 next release, everything will be bumped then.<u></u><u></u></p>
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
<p class=3D"MsoNormal">On Mon, Apr 14, 2025 at 6:04<span style=3D"font-fami=
ly:&quot;Times New Roman&quot;,serif">=E2=80=AF</span>AM Chen Qi via
<a href=3D"https://urldefense.com/v3/__http:/lists.yoctoproject.org__;!!Ajv=
eYdw8EvQ!YgtbTrmV7UuP6_-xmeKCmaKiA7c37VPp16xjwDmp4PnXq4mLha8BNM_VFgeuop36LB=
aOU0x0SrpsNjJPeyDAI7bL2A$" target=3D"_blank">
lists.yoctoproject.org</a> &lt;Qi.Chen=3D<a href=3D"mailto:windriver.com@li=
sts.yoctoproject.org" target=3D"_blank">windriver.com@lists.yoctoproject.or=
g</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">From: Chen Qi &lt;<a hr=
ef=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com=
</a>&gt;<br>
<br>
Upgrade podman from 5.4.1+ to 5.4.2.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/podman/<a href=3D"https://urldefense.com/v3/__http=
:/podman_git.bb__;!!AjveYdw8EvQ!YgtbTrmV7UuP6_-xmeKCmaKiA7c37VPp16xjwDmp4Pn=
Xq4mLha8BNM_VFgeuop36LBaOU0x0SrpsNjJPeyDAHj_h8A$" target=3D"_blank">podman_=
git.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-containers/podman/<a href=3D"https://urldefense.com/v3=
/__http:/podman_git.bb__;!!AjveYdw8EvQ!YgtbTrmV7UuP6_-xmeKCmaKiA7c37VPp16xj=
wDmp4PnXq4mLha8BNM_VFgeuop36LBaOU0x0SrpsNjJPeyDAHj_h8A$" target=3D"_blank">=
podman_git.bb</a> b/recipes-containers/podman/<a href=3D"https://urldefense=
.com/v3/__http:/podman_git.bb__;!!AjveYdw8EvQ!YgtbTrmV7UuP6_-xmeKCmaKiA7c37=
VPp16xjwDmp4PnXq4mLha8BNM_VFgeuop36LBaOU0x0SrpsNjJPeyDAHj_h8A$" target=3D"_=
blank">podman_git.bb</a><br>
index 46c6c969..764c0af8 100644<br>
--- a/recipes-containers/podman/<a href=3D"https://urldefense.com/v3/__http=
:/podman_git.bb__;!!AjveYdw8EvQ!YgtbTrmV7UuP6_-xmeKCmaKiA7c37VPp16xjwDmp4Pn=
Xq4mLha8BNM_VFgeuop36LBaOU0x0SrpsNjJPeyDAHj_h8A$" target=3D"_blank">podman_=
git.bb</a><br>
+++ b/recipes-containers/podman/<a href=3D"https://urldefense.com/v3/__http=
:/podman_git.bb__;!!AjveYdw8EvQ!YgtbTrmV7UuP6_-xmeKCmaKiA7c37VPp16xjwDmp4Pn=
Xq4mLha8BNM_VFgeuop36LBaOU0x0SrpsNjJPeyDAHj_h8A$" target=3D"_blank">podman_=
git.bb</a><br>
@@ -16,7 +16,7 @@ DEPENDS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0gettext-native \<br>
=C2=A0&quot;<br>
<br>
-SRCREV =3D &quot;227df90eb7c021097c9ba5f8000c83648a598028&quot;<br>
+SRCREV =3D &quot;be85287fcf4590961614ee37be65eeb315e5d9ff&quot;<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"https://urldefense.com/v3/__http:/gith=
ub.com/containers/libpod.git;branch=3Dv5.4;protocol=3Dhttps;destsuffix=3D$*=
7BGO_SRCURI_DESTSUFFIX*7D__;JSU!!AjveYdw8EvQ!YgtbTrmV7UuP6_-xmeKCmaKiA7c37V=
Pp16xjwDmp4PnXq4mLha8BNM_VFgeuop36LBaOU0x0SrpsNjJPeyBDKV46Cg$" target=3D"_b=
lank">github.com/containers/libpod.git;branch=3Dv5.4;protocol=3Dhttps;dests=
uffix=3D${GO_SRCURI_DESTSUFFIX}</a>
 \<br>
=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:$%7b@bb.utils.contains(&#39;PACKAGECO=
NFIG" target=3D"_blank">${@bb.utils.contains(&#39;PACKAGECONFIG</a>&#39;, &=
#39;rootless&#39;, &#39;file://50-podman-rootless.conf&#39;, &#39;&#39;, d)=
} \<br>
@@ -30,7 +30,7 @@ GO_IMPORT =3D &quot;import&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-PV =3D &quot;v5.4.1&quot;<br>
+PV =3D &quot;v5.4.2&quot;<br>
<br>
=C2=A0CVE_STATUS[CVE-2022-2989] =3D &quot;fixed-version: fixed since v4.3.0=
&quot;<br>
=C2=A0CVE_STATUS[CVE-2023-0778] =3D &quot;fixed-version: fixed since v4.5.0=
&quot;<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9219): <a href=3D"https://urldefense.com/v3/__https:/li=
sts.yoctoproject.org/g/meta-virtualization/message/9219__;!!AjveYdw8EvQ!Ygt=
bTrmV7UuP6_-xmeKCmaKiA7c37VPp16xjwDmp4PnXq4mLha8BNM_VFgeuop36LBaOU0x0SrpsNj=
JPeyCP1y3Xqg$" target=3D"_blank">
https://lists.yoctoproject.org/g/meta-virtualization/message/9219</a><br>
Mute This Topic: <a href=3D"https://urldefense.com/v3/__https:/lists.yoctop=
roject.org/mt/112254335/1050810__;!!AjveYdw8EvQ!YgtbTrmV7UuP6_-xmeKCmaKiA7c=
37VPp16xjwDmp4PnXq4mLha8BNM_VFgeuop36LBaOU0x0SrpsNjJPeyDtKN4uYA$" target=3D=
"_blank">
https://lists.yoctoproject.org/mt/112254335/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">
meta-virtualization+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/lists.yoctoproje=
ct.org/g/meta-virtualization/unsub__;!!AjveYdw8EvQ!YgtbTrmV7UuP6_-xmeKCmaKi=
A7c37VPp16xjwDmp4PnXq4mLha8BNM_VFgeuop36LBaOU0x0SrpsNjJPeyDyb0-POQ$" target=
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
<p class=3D"MsoNormal"><span class=3D"m_-6058584128102264821gmailsignaturep=
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

--0000000000009bf80e0632c82a5b--

