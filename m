Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C88C4167B
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 12:00:32 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web11.16798.1672401631639227466
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 30 Dec 2022 04:00:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R2tT0guR;
 spf=pass (domain: gmail.com, ip: 209.85.222.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id f25so4748083uaa.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 30 Dec 2022 04:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xAoafQVCG6pcm2fFJnfk+3dmCHOFCKhpWRQq5PAwzvQ=;
        b=R2tT0guRefq00KeBshDlMu6IpJKZWZp0xND+tjkTMJbVv/sry4uSLoQNeCG5y9MnWd
         8rJJO/wr2zkoGJBG0YtuzwO4Nos/5IRV4/Jv71E6FBLv+iQbR8REzK6jmV1TSZRsASmt
         ib7ZiTtoCnK/NMNEPTqqpqiC4RoEjIWVvhM60w6eM00DdSYgRMegl4lRCtkNX5qZf/+8
         WxJPawKHGhV7EiLEYouMufvUhN8QmIi/qDtMNlyF+8O80f/FeO3NE55A/kYkQeMRoVJp
         dcfIAVSc4a9GOhVwwMPuNQWZI3Pm4Nm6pK0+QDyQ+JQwQSxvUngnyKiGthcYKTkLBbDS
         QmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xAoafQVCG6pcm2fFJnfk+3dmCHOFCKhpWRQq5PAwzvQ=;
        b=pf5RQDu2Y6wDY0PXAm9nedb75IWNnr9gfrjXvP4kuKJf43JX5htva76NLsD8vb37Rb
         J4jwxCW7D2w5+2cquLHAopCChhR8P+yM8jvaQOc/WVBqc/hWxUNas/UBVP1qHW5Cv5Mm
         z95lrpRJV2mww+DjK3aOFhh4TU7fHn6wnmhZQxnZEikCzlG7l5ClUCcBb4WxpbNuXncl
         bKgTQ+d9NRo1Yl9JbmEWZ6ec9JrAU2/l4t9FDQWtXqojKb0f5A4jq19Z531LjbB/BgVx
         SJyJQ92Jy+621olZa5f1la2TcBI9hdLpStdk6TJJnU89o5fvP5281qbAekiNGVKqmz7H
         w90w==
X-Gm-Message-State: AFqh2kpxHc++eSbzhLnS27takzkLDGIULaFfsMehTw7XXd6mcoao9LwZ
	qEIRfLq0BLO8SzpVuNPs2H8uxwQCRANHiBU5Ns0=
X-Google-Smtp-Source: AMrXdXu2f3Zba+89kdOzjGZvwy+W7gc6jF7ryTG1E2mLIIJn85JUExrQ8MyWoKo2zU1E5VFrG9Jt/WU2iFdG76S6U2M=
X-Received: by 2002:ab0:1d8f:0:b0:419:c304:803a with SMTP id
 l15-20020ab01d8f000000b00419c304803amr2944188uak.15.1672401630372; Fri, 30
 Dec 2022 04:00:30 -0800 (PST)
MIME-Version: 1.0
References: <Sxe2.1672355426401088733.MABE@lists.yoctoproject.org>
In-Reply-To: <Sxe2.1672355426401088733.MABE@lists.yoctoproject.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 30 Dec 2022 12:00:19 +0000
Message-ID: <CANPvuR=-3wbotJiL-w1DhDpR3NsVe9yZ68WDLsHznCHaHC4OdQ@mail.gmail.com>
Subject: Re: [meta-virtualization] Using Docker containers on Yocto with
 RISC-V architecture #meta-virtualization #yocto
To: jmoreno@tierralunaengineering.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000019a57905f10a597c"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 30 Dec 2022 12:00:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7784

--00000000000019a57905f10a597c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

<jmoreno@tierralunaengineering.com> escreveu no dia quinta, 29/12/2022 =C3=
=A0(s)
23:10:

> Hello,
>
> I am using Yocto on a RISC-V board, Microchip PolarFire Icicle Kit:
> https://www.microsemi.com/existing-parts/parts/152514
> (Board's Yocto directory:
> https://github.com/polarfire-soc/meta-polarfire-soc-yocto-bsp)
>
> I would like to use docker containers with this OS and architecture.
> Seeking advice with "meta-virtualization", is this feasible?
>
> What I have done:
>
>    - I have added the "meta-virtualization" layer (pulled from git) and
>    added them to "bblayers.conf".
>
>
>    - In "local.conf", I added the line:
>       - IMAGE_INSTALL +=3D "docker"
>    - After running bitbake, I get an error message:
>
> | NOTE: make -j 32 cross-local
> | [image: =F0=9F=90=B3] cross-local
> | -linkshared not supported on linux/riscv64
> | make: *** [Makefile:85: cross-local] Error 1
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> ERROR: Task (/home/ubuntu/work/yocto/yocto-dev/meta-virtualization/
> recipes-containers/docker/docker-ce_git.bb:do_compile) failed with exit
> code '1'


This build issue is already fixed on some meta-virtualization git branches.
At last master, langdale and kirkstone have the patch, are you using any of
them?

https://git.yoctoproject.org/meta-virtualization/commit/recipes-containers/=
docker?id=3D2d0f7255a75d24ec3e3b686d70e97d20dc39c259

Can you please try this patch?

Jose


>
> Thanks,
>
> Jonathan
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7782):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7782
> Mute This Topic: https://lists.yoctoproject.org/mt/95945792/5052612
> Mute #meta-virtualization:
> https://lists.yoctoproject.org/g/meta-virtualization/mutehashtag/meta-vir=
tualization
> Mute #yocto:
> https://lists.yoctoproject.org/g/meta-virtualization/mutehashtag/yocto
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000019a57905f10a597c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Jonathan,</div><div dir=3D"ltr"><br></=
div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">&lt;<a=
 href=3D"mailto:jmoreno@tierralunaengineering.com">jmoreno@tierralunaengine=
ering.com</a>&gt; escreveu no dia quinta, 29/12/2022 =C3=A0(s) 23:10:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"color:=
rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size:small">Hello=
,</span>
<div style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif">=
=C2=A0</div>
<div style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif">I=
 am using Yocto on a RISC-V board, Microchip PolarFire Icicle Kit:</div>
<div style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif"><=
a style=3D"color:rgb(17,85,204)" href=3D"https://www.microsemi.com/existing=
-parts/parts/152514" rel=3D"noopener" target=3D"_blank">https://www.microse=
mi.com/existing-parts/parts/152514</a></div>
<div style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif">(=
Board&#39;s Yocto directory:=C2=A0<a style=3D"color:rgb(17,85,204)" href=3D=
"https://github.com/polarfire-soc/meta-polarfire-soc-yocto-bsp" rel=3D"noop=
ener" target=3D"_blank">https://github.com/polarfire-soc/meta-polarfire-soc=
-yocto-bsp</a>)</div>
<div style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif">=
=C2=A0</div>
<div style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif">I=
 would like to use docker containers with this OS and architecture. Seeking=
 advice with &quot;meta-virtualization&quot;, is this feasible?</div>
<div style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif">=
=C2=A0</div>
<div style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif">W=
hat I have done:</div>
<div style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif">
<ul>
<li style=3D"margin-left:15px">I have added the &quot;meta-virtualization&q=
uot; layer (pulled from git) and added them to &quot;bblayers.conf&quot;.</=
li>
</ul>
</div>
<div style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif">
<ul>
<li style=3D"margin-left:15px">In &quot;local.conf&quot;, I added the line:=
=C2=A0=C2=A0</li>
<ul>
<li style=3D"margin-left:15px">IMAGE_INSTALL=C2=A0<a id=3D"m_73862216450078=
04586m_7374852545684304810m_997887478859842571plusReplyChip-0" class=3D"gma=
il_plusreply" style=3D"color:rgb(34,34,34)"></a>+=3D &quot;docker&quot;</li=
>
</ul>
<li style=3D"margin-left:15px">After running bitbake, I get an error messag=
e:</li>
</ul>
</div>
<span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;f=
ont-size:small">| NOTE: make -j 32 cross-local</span><br style=3D"color:rgb=
(34,34,34);font-family:Arial,Helvetica,sans-serif"><span style=3D"color:rgb=
(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size:small">|=C2=A0<=
/span><img style=3D"height: 1.2em; width: 1.2em; color: rgb(34, 34, 34); fo=
nt-family: Arial, Helvetica, sans-serif;" src=3D"https://fonts.gstatic.com/=
s/e/notoemoji/15.0/1f433/72.png" alt=3D"=F0=9F=90=B3" aria-label=3D"=F0=9F=
=90=B3"><span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans=
-serif;font-size:small">=C2=A0cross-local</span><br style=3D"color:rgb(34,3=
4,34);font-family:Arial,Helvetica,sans-serif"><span style=3D"color:rgb(34,3=
4,34);font-family:Arial,Helvetica,sans-serif;font-size:small">| -linkshared=
 not supported on linux/riscv64</span><br style=3D"color:rgb(34,34,34);font=
-family:Arial,Helvetica,sans-serif"><span style=3D"color:rgb(34,34,34);font=
-family:Arial,Helvetica,sans-serif;font-size:small">| make: *** [Makefile:8=
5: cross-local] Error 1</span><br style=3D"color:rgb(34,34,34);font-family:=
Arial,Helvetica,sans-serif"><span style=3D"color:rgb(34,34,34);font-family:=
Arial,Helvetica,sans-serif;font-size:small">| ERROR: oe_runmake failed</spa=
n><br style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif">=
<span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;f=
ont-size:small">| WARNING: exit code 1 from a shell command.</span><br styl=
e=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif"><span styl=
e=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size:s=
mall">ERROR: Task (/home/ubuntu/work/yocto/</span><span style=3D"color:rgb(=
34,34,34);font-family:Arial,Helvetica,sans-serif;font-size:small">yocto-dev=
/meta-virtualization/</span><span style=3D"color:rgb(34,34,34);font-family:=
Arial,Helvetica,sans-serif;font-size:small">recipes-containers/docker/</spa=
n><span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif=
;font-size:small">docker-ce_git.bb:do_compile) failed with exit code &#39;1=
&#39;</span></blockquote><div><br>This build issue is already=C2=A0fixed on=
 some meta-virtualization git branches.</div><div>At last master, langdale =
and kirkstone have the patch, are you using any of them?<br><br><a href=3D"=
https://git.yoctoproject.org/meta-virtualization/commit/recipes-containers/=
docker?id=3D2d0f7255a75d24ec3e3b686d70e97d20dc39c259">https://git.yoctoproj=
ect.org/meta-virtualization/commit/recipes-containers/docker?id=3D2d0f7255a=
75d24ec3e3b686d70e97d20dc39c259</a><br><br>Can you please try this patch?<b=
r><br>Jose<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<div style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif">=
=C2=A0</div>
<div style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif">T=
hanks,</div>
<div style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif">=
=C2=A0</div>
<div style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif">J=
onathan</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7782): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7782" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/7782</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/95945792/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/95945792/5052612</a><br>
Mute #meta-virtualization:<a href=3D"https://lists.yoctoproject.org/g/meta-=
virtualization/mutehashtag/meta-virtualization" rel=3D"noreferrer" target=
=3D"_blank">https://lists.yoctoproject.org/g/meta-virtualization/mutehashta=
g/meta-virtualization</a><br>
Mute #yocto:<a href=3D"https://lists.yoctoproject.org/g/meta-virtualization=
/mutehashtag/yocto" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-virtualization/mutehashtag/yocto</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.co=
m" target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--00000000000019a57905f10a597c--

