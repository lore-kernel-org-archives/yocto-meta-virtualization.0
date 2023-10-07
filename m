Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D5D9E9413D
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 00:53:32 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.9916.1696640011127274258
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Oct 2023 17:53:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XwGFiAlb;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-79f82b26abfso101595039f.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Oct 2023 17:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696640010; x=1697244810; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mblwhVI5DQPa/T7ISpJKDk/j2sBJJUFGAEqjfT7Edio=;
        b=XwGFiAlba+k0j3iL5/gBWEVQw2/kLnW3QyCeBxRE0u9jfkZ4cFpfLJXp3VKrkQjUE5
         KVHUf7pU92nAsmmkuEbfTc2V5HmbYD1rV/sXtgW6uuHBZeTbgp+APRlJUe0PY5VDufvs
         PB2SkzPUEfFnwv9O6r5HViNNiauykBgfgBufRmcQP4uefKonNzvFLTj+qsyiD5X95CVp
         8bMQPREKG46E4JJeI+sMULUNcpHiluPJBAEAnkR+rJjrQnbrIOr0erKBJemepZgGVsPB
         56CsecYXL/maYZ9ehjW4OjhLPQJR0MNUtCEaUZNEQ8EmCCqRCzSajrbNoej5zzbw/tmM
         1sdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696640010; x=1697244810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mblwhVI5DQPa/T7ISpJKDk/j2sBJJUFGAEqjfT7Edio=;
        b=Nz6L2cq628goo3Uly5aLF5fznoFtBWeNuvGe+Gk9sMTleBBKqxsDCdREdrZ6+W8kRF
         cvXxlnDS40G6ThmoEQnvNym9q+BfwNFAYgguFo5tr38cXyTcwdzKAP12o2GrCfh/3OB3
         C5YizMxie1mTzonVsBUxZwzH2T4Ux57Jg5xb7adIeg5HE1LkiJmodm8GoWNQZNTRmqbU
         F2KzaMsXNw6S565isKsqzJlGJ9BPQxwWVWKQE78yfpdGn96vF+OkpJc2yKHIfeOCpAQu
         JUg+UTmEFQ4Tw5oFckQ92rC5hnklZYeE1zy5SNxkoLtclF4pgitQcCdklGF7XhTXKVcc
         N6lQ==
X-Gm-Message-State: AOJu0YwUGTGxdOv02hvdVi1uAdKU3DwUYNF+QvQJPlyrbTILWXL1eKCA
	og1BQk5H+eXNVEqxpoxbnJE0SwcjOK7YpU1YMcU=
X-Google-Smtp-Source: AGHT+IHlP0XdRZizK1j3wGw3LjZ3Lu90+HB7Um2q8jpRbiNjptXvShPdudhac3n+j0/yhJTVV9fAq92LM5l9vTXcIwY=
X-Received: by 2002:a5d:96cc:0:b0:795:1a7c:486f with SMTP id
 r12-20020a5d96cc000000b007951a7c486fmr10201863iol.14.1696640010213; Fri, 06
 Oct 2023 17:53:30 -0700 (PDT)
MIME-Version: 1.0
References: <1D32D17E-126F-413C-9F22-2E5CCF20E61F@gmail.com> <AS1PR10MB5697BD98F27E7C45E4D4C4E8FDC9A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697BD98F27E7C45E4D4C4E8FDC9A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 6 Oct 2023 20:53:19 -0400
Message-ID: <CADkTA4P=iuTAbZyk=g=Z_oCZOS8i1GXKNDrPgU1U7CmrMZoW6g@mail.gmail.com>
Subject: Re: [meta-virtualization] Docker-compose Go update on kirkstone
To: peter.marko@siemens.com
Cc: "przemekchwiala@gmail.com" <przemekchwiala@gmail.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000001ee035060715c9ad"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 07 Oct 2023 00:53:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8339

--0000000000001ee035060715c9ad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Peter is correct, the issue with the build is very likely due to the golang
version, and we've had good success in supporting m-virt master on old
releases using the newer golang.

As for getting the package officially in the older branch, that's a
different question. It technically is a new package, so it isn't a major
version jump in the same sense as if we backported the same recipe/package
from master to the old branch. That being said, adding a new feature to a
released branch is also not something we typically do.

Bruce

On Fri, Oct 6, 2023 at 2:21=E2=80=AFPM Peter Marko via lists.yoctoproject.o=
rg
<peter.marko=3Dsiemens.com@lists.yoctoproject.org> wrote:

> You will probably need new golang version.
>
> Mixin layer kirkstone/go is working pretty well with meta-virtualization
> master.
>
> https://git.yoctoproject.org/meta-lts-mixins/tree/?h=3Dkirkstone/go
>
>
>
> Peter
>
>
>
> *From:* meta-virtualization@lists.yoctoproject.org <
> meta-virtualization@lists.yoctoproject.org> *On Behalf Of *Przemyslaw
> Chwiala via lists.yoctoproject.org
> *Sent:* Friday, October 6, 2023 17:23
> *To:* meta-virtualization@lists.yoctoproject.org
> *Subject:* [meta-virtualization] Docker-compose Go update on kirkstone
>
>
>
> > Hello,
> >
> > I'm working on the kirkstone branch, where we still have
> python3-docker-compose_1.29.2.bb. I am wondering if there is any chance
> to upgrade to the Go version of docker-compose from the main branch? I
> tried to build the recipe from the main branch, but got some errors. Befo=
re
> I dig into fixing them, I'd like to ask if you see any additional issues
> that might block building docker-compose_git.bb from the main branch on
> kirkstone?
> >
> > Thank you
> > Przemek
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8338):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8338
> Mute This Topic: https://lists.yoctoproject.org/mt/101799787/1050810
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

--0000000000001ee035060715c9ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Peter is correct, the issue with the build is very likely due=
 to the golang version, and we&#39;ve had good success=C2=A0in supporting m=
-virt master on old releases using the newer golang.</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">As for getting the package officially=C2=A0in t=
he older branch, that&#39;s a different question. It technically is a new p=
ackage, so it isn&#39;t a major version jump in the same sense as if we bac=
kported the same recipe/package from master to the old branch. That being s=
aid, adding a new feature to a released branch is also not something we typ=
ically do.</div><div class=3D"gmail_default" style=3D"font-size:small"><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Fri, Oct 6, 2023 at 2:21=E2=80=AFPM Peter Marko via <a href=3D"http://lists=
.yoctoproject.org">lists.yoctoproject.org</a> &lt;peter.marko=3D<a href=3D"=
mailto:siemens.com@lists.yoctoproject.org">siemens.com@lists.yoctoproject.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div class=3D"msg1067042315536724852">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_1067042315536724852WordSection1">
<p class=3D"MsoNormal">You will probably need new golang version.<u></u><u>=
</u></p>
<p class=3D"MsoNormal">Mixin layer kirkstone/go is working pretty well with=
 meta-virtualization master.<u></u><u></u></p>
<p class=3D"MsoNormal"><a href=3D"https://git.yoctoproject.org/meta-lts-mix=
ins/tree/?h=3Dkirkstone/go" target=3D"_blank">https://git.yoctoproject.org/=
meta-lts-mixins/tree/?h=3Dkirkstone/go</a><u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Peter<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b>From:</b> <a href=3D"mailto:meta-virtualization@l=
ists.yoctoproject.org" target=3D"_blank">meta-virtualization@lists.yoctopro=
ject.org</a> &lt;<a href=3D"mailto:meta-virtualization@lists.yoctoproject.o=
rg" target=3D"_blank">meta-virtualization@lists.yoctoproject.org</a>&gt;
<b>On Behalf Of </b>Przemyslaw Chwiala via <a href=3D"http://lists.yoctopro=
ject.org" target=3D"_blank">lists.yoctoproject.org</a><br>
<b>Sent:</b> Friday, October 6, 2023 17:23<br>
<b>To:</b> <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" ta=
rget=3D"_blank">meta-virtualization@lists.yoctoproject.org</a><br>
<b>Subject:</b> [meta-virtualization] Docker-compose Go update on kirkstone=
<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">&gt; Hello,<br>
&gt;<br>
&gt; I&#39;m working on the kirkstone branch, where we still have <a href=
=3D"http://python3-docker-compose_1.29.2.bb" target=3D"_blank">python3-dock=
er-compose_1.29.2.bb</a>. I am wondering if there is any chance to upgrade =
to the Go version of docker-compose from the main branch? I tried to build =
the recipe from the main branch, but got
 some errors. Before I dig into fixing them, I&#39;d like to ask if you see=
 any additional issues that might block building <a href=3D"http://docker-c=
ompose_git.bb" target=3D"_blank">docker-compose_git.bb</a> from the main br=
anch on kirkstone?<br>
&gt;<br>
&gt; Thank you<br>
&gt; Przemek<u></u><u></u></p>
</div>
</div>
</div>
</div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8338): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8338" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8338</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/101799787/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/101799787/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div></blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gm=
ail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signatu=
re">- Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II=
<br><br></div></div>

--0000000000001ee035060715c9ad--

