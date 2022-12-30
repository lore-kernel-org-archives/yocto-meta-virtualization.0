Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE5CC4332F
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 02:08:29 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web10.10120.1672366099575633601
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 29 Dec 2022 18:08:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fWG6YyiB;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id c20so6828641ilj.10
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Dec 2022 18:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BSP7gZnv9jdiJ8Zj9Mz8MxP7PzOgj1tD34fhBIEJT4w=;
        b=fWG6YyiBggMN+/0hkmxfUUfSjuXytmnsCkLzHeOHGgkO2nDXhcTHz5lt+yErIdf9/i
         H80d/1vhnxttjp4URmzapFE/mY9G5JA9cociFoULji5JfQyl6XHcqLZTh/KEwP5dy7IT
         czwsMyq0ckYFd8Vem5CcJZ3u2hINBHgOWolWiNTysqPhat4oJzhgKVroDvYngGLGy8gg
         1BUNGMc+bqABpt87B5aNtB+c+ynobvrho166ISKmq8r1541AolAho6JEUr4Zn2qW7EMg
         gMTYW8C8/Dt42tnetE4H2hHPIB1PllZ7rqBquXWDce5u6gqRieCrOvVsS9g9Gy1yV/g4
         YEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSP7gZnv9jdiJ8Zj9Mz8MxP7PzOgj1tD34fhBIEJT4w=;
        b=tle9j/1tnsedQA1ZWNthmuH7nYMW0FEkZClAHHqxpXxBnQOz3eiM7BzOrsggElTDRf
         ZT4o/GFHdmozPDxiCjYekwojFZx1cEboyrIjwWWREm0qPpMzsmc8v01eBYT0YARA7ex8
         NcVSjrT3K0RLMjumQlY/QsYSK6Ekb30+0r4BhWHumyxJyn3VB8DWM6X402nSkohJoDFR
         fsChLQxxY7cRxqpqaCtevaE6RM6OjX6ll8AzqczO17LIfyYRlEgQBtK0YQ+ta0TDXVjv
         7xLx6jA9xaXEZzHZDO38z/dzQUdIqYLWPZfy/MIHWWIMPesMd7khQ5sJOwcjUM4AmuBN
         P5CQ==
X-Gm-Message-State: AFqh2kqbW1AcxfmsjdgRCr6i10dx8fbMLvZTnYRdVx3d7LjsCdeWvg4T
	I/ptSbBj5bdWye/JM9eOXE9cZ6ucfKElKjzGYPw=
X-Google-Smtp-Source: AMrXdXvvWlt1gaN8p8ndIJeFuNwjJ2tZaXi/Fu8fsXKYrgfSwWdB6dRuFo/xkeEWCem8qR/bTwW48kcDD/9xUcmw2ko=
X-Received: by 2002:a92:c98d:0:b0:30b:b810:8a57 with SMTP id
 y13-20020a92c98d000000b0030bb8108a57mr2687348iln.276.1672366098857; Thu, 29
 Dec 2022 18:08:18 -0800 (PST)
MIME-Version: 1.0
References: <Sxe2.1672355426401088733.MABE@lists.yoctoproject.org>
In-Reply-To: <Sxe2.1672355426401088733.MABE@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 29 Dec 2022 21:08:08 -0500
Message-ID: <CADkTA4PQmSOCAL19eJbd-jWzEGcFE5YOyfsLk9qEHCZuNJ42KQ@mail.gmail.com>
Subject: Re: [meta-virtualization] Using Docker containers on Yocto with
 RISC-V architecture #meta-virtualization #yocto
To: jmoreno@tierralunaengineering.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000041c4c305f102130e"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 30 Dec 2022 02:08:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7783

--00000000000041c4c305f102130e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 29, 2022 at 6:10 PM <jmoreno@tierralunaengineering.com> wrote:

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
>
>
riscv isn't an architecture that is built or tested with meta-virt, so
while it might be feasible, I don't even know what work would be required
to get all the components building for the architecture.

Clearly the flags we are using in the recipe don't work for riscv (or
perhaps they are being added by the docker Makefiles themselves .. I'm not
on my typical setup so I can't check), so that's the first thing to
investigate and then work through the issues.

Patches to fix the build for the architecture would be accepted, but
there's no one that I know of who's currently working on support.

Bruce




> Thanks,
>
> Jonathan
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7782):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7782
> Mute This Topic: https://lists.yoctoproject.org/mt/95945792/1050810
> Mute #meta-virtualization:
> https://lists.yoctoproject.org/g/meta-virtualization/mutehashtag/meta-vir=
tualization
> Mute #yocto:
> https://lists.yoctoproject.org/g/meta-virtualization/mutehashtag/yocto
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

--00000000000041c4c305f102130e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Dec 29, 2022 at 6:10 PM &lt;<a href=3D"mail=
to:jmoreno@tierralunaengineering.com" target=3D"_blank">jmoreno@tierralunae=
ngineering.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetic=
a,sans-serif;font-size:small">Hello,</span>
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
<li style=3D"margin-left:15px">IMAGE_INSTALL=C2=A0<a id=3D"m_33152720444743=
26318m_-6725594613676172307m_7374852545684304810m_997887478859842571plusRep=
lyChip-0" class=3D"gmail_plusreply" style=3D"color:rgb(34,34,34)"></a>+=3D =
&quot;docker&quot;</li>
</ul>
<li style=3D"margin-left:15px">After running bitbake, I get an error messag=
e:</li>
</ul>
</div>
<span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;f=
ont-size:small">| NOTE: make -j 32 cross-local</span><br style=3D"color:rgb=
(34,34,34);font-family:Arial,Helvetica,sans-serif"><span style=3D"color:rgb=
(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size:small">|=C2=A0<=
/span><img style=3D"height:1.2em;width:1.2em;color:rgb(34,34,34);font-famil=
y:Arial,Helvetica,sans-serif" src=3D"https://fonts.gstatic.com/s/e/notoemoj=
i/15.0/1f433/72.png" alt=3D"=F0=9F=90=B3" aria-label=3D"=F0=9F=90=B3"><span=
 style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-s=
ize:small">=C2=A0cross-local</span><br style=3D"color:rgb(34,34,34);font-fa=
mily:Arial,Helvetica,sans-serif"><span style=3D"color:rgb(34,34,34);font-fa=
mily:Arial,Helvetica,sans-serif;font-size:small">| -linkshared not supporte=
d on linux/riscv64</span><br style=3D"color:rgb(34,34,34);font-family:Arial=
,Helvetica,sans-serif"><span style=3D"color:rgb(34,34,34);font-family:Arial=
,Helvetica,sans-serif;font-size:small">| make: *** [Makefile:85: cross-loca=
l] Error 1</span><br style=3D"color:rgb(34,34,34);font-family:Arial,Helveti=
ca,sans-serif"><span style=3D"color:rgb(34,34,34);font-family:Arial,Helveti=
ca,sans-serif;font-size:small">| ERROR: oe_runmake failed</span><br style=
=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif"><span style=
=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size:sm=
all">| WARNING: exit code 1 from a shell command.</span><br style=3D"color:=
rgb(34,34,34);font-family:Arial,Helvetica,sans-serif"><span style=3D"color:=
rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size:small">ERROR=
: Task (/home/ubuntu/work/yocto/</span><span style=3D"color:rgb(34,34,34);f=
ont-family:Arial,Helvetica,sans-serif;font-size:small">yocto-dev/meta-virtu=
alization/</span><span style=3D"color:rgb(34,34,34);font-family:Arial,Helve=
tica,sans-serif;font-size:small">recipes-containers/docker/</span><span sty=
le=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size:=
small">docker-ce_git.bb:do_compile) failed with exit code &#39;1&#39;</span=
>
<div style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif">=
=C2=A0</div></blockquote><div><div class=3D"gmail_default" style=3D"font-si=
ze:small"></div><div class=3D"gmail_default" style=3D"font-size:small">risc=
v isn&#39;t an architecture that is built or tested with meta-virt, so whil=
e it might be feasible, I don&#39;t even know what work would be required t=
o get all the components building for the architecture.</div><div class=3D"=
gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">Clearly the flags we are using in the recipe=
 don&#39;t work for riscv (or perhaps they are being added by the docker Ma=
kefiles themselves .. I&#39;m not on my typical setup so I can&#39;t check)=
, so that&#39;s the first thing to investigate and then work through the is=
sues.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">Patches to fix the =
build for the architecture would be accepted, but there&#39;s no one that I=
 know of who&#39;s currently working on support.</div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">Bruce</div><br></div><div><br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
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
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/95945792/1050=
810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/95945792/1050810</a><br>
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
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
>- Thou shalt not follow the NULL pointer, for chaos and madness await thee=
 at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br=
><br></div></div>

--00000000000041c4c305f102130e--

