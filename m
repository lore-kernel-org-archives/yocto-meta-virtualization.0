Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B60EFC001E0
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 21:14:44 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.145765.1692134077565297608
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 15 Aug 2023 14:14:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=pid2K/ZO;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3fe2048c910so53963445e9.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 15 Aug 2023 14:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692134076; x=1692738876;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7w3wBo3kILxPpNEn2YKxM6gIV/DMpv8niRnO3GI2xTY=;
        b=pid2K/ZOeoRBv7r83R5xB2vVtYPp4PWC3iK2Suw0cWyD4bDxzT+MGFLexwW5zSS8wl
         tksMfWs+hq0xU3OkrffkDDvNm65nnTz52ZgX8nYMUYkfNA+XZVpcTPpjLzs2yFqGEPUT
         0V65StZY2TXcTwg0OJKqgxHH/+5ffUFEL8DW3nEvvtLaiROIxPoGDgTpF9uYyfO7cZwc
         gytuDYALq++9b4ZZQj4l0khX6oXWQvs1Xnye68fgaVBFoy10bnFmHK9e9jRdGobd7NtT
         FunsUbubG8XRRQCv0s/CirjBJhGudwzhrZrDyhmUNS6BxcZDnXT8QvZ0IeE+LTluwh76
         s5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692134076; x=1692738876;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7w3wBo3kILxPpNEn2YKxM6gIV/DMpv8niRnO3GI2xTY=;
        b=Z42AZRnUHB24CdqcW7ijF7m1c9kO652ijxLPF0MKRkzolBtDSAd73UqIEvwvhdGnDu
         qsz8HZY6KitTlIeiNKHWzERO+8LQ3HI/fppVzYuiGILpfWRKa6+YqKLMReOa8obC4O2q
         PkYEB8XEc7ftYqXv4LFqTtbDa+YAXDuKkSfU/4RRrZQEczZqTF3NHdrgUqfKcSmXx/NO
         v8gZ1Ghc2ytgtvPcCtLEg2CpLyUNig3SwEy2YLaM4SzkRwvO9le3/oIjQAtqpDJpn26g
         lUSe/c6dmCyswMuKdKx/Xsz1TtfiJxnUonJzrYvRXp6N1fEPwml6LcfwBb1yQGkwIjiO
         1Kag==
X-Gm-Message-State: AOJu0YwAw1q8cpVPbxJsLf09enqvyp6E1AFP+Pm3BnYo2D97IEiXh9BP
	yq6FdwHrCjGMiof9Ewl2Aj6HPAPBmQr4wKHy8Qw=
X-Google-Smtp-Source: AGHT+IFbKvLuJ/nfxbLGeLPgCC3hDRZkm2nHuLIc4lZirdpxlOydTLJnxAU2pVhsMT2kqvLjqjBRVHCvmF9kFbkRZyA=
X-Received: by 2002:a5d:618e:0:b0:317:dada:2417 with SMTP id
 j14-20020a5d618e000000b00317dada2417mr9998991wru.31.1692134075649; Tue, 15
 Aug 2023 14:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230814151356.1001953-1-Martin.Jansa@gmail.com>
 <177B48E707B1FD85.12117@lists.yoctoproject.org> <CA+chaQei9w4MDNhZPojhKXf=Tx-DTt2PE0UapJ3eis5eciTnDw@mail.gmail.com>
 <CA+chaQcKaxcvOF6Y6p8D-B80NwCEqZVuh6QvpA-9Rm=TUiFTMQ@mail.gmail.com> <BL1PR11MB600117F27F20E29B53648DEEAD14A@BL1PR11MB6001.namprd11.prod.outlook.com>
In-Reply-To: <BL1PR11MB600117F27F20E29B53648DEEAD14A@BL1PR11MB6001.namprd11.prod.outlook.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 15 Aug 2023 23:14:24 +0200
Message-ID: <CA+chaQcuBONPMTDZMvtow23T_ZeoeKuqotHXXOV=muj1Hifa+w@mail.gmail.com>
Subject: Re: [meta-virtualization] [kirkstone][RFC][PATCHv2] docker: update to
 v20.10.25 + 58 commits to fix compatibility with go currently in kirkstone
To: fib@cisco.com
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000007dd55c0602fcaa26"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 15 Aug 2023 21:14:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8193

--0000000000007dd55c0602fcaa26
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hmm, I was testing docker-moby, not docker-ce, but I don't see why it would
be happening. Will try docker-ce tomorrow.

On Tue, Aug 15, 2023 at 11:06=E2=80=AFPM Ruslan Babayev (fib) via
lists.yoctoproject.org <fib=3Dcisco.com@lists.yoctoproject.org> wrote:

> Hi Martin,
>
>
>
> Build fails with:
>
>
>
> ERROR:
> docker-ce-20.10.25-ce+git3056208812eb5e792fa99736c9167d1e10f4ab49-r0
> do_patch: Applying patch
> '0001-Revert-go-updates-from-1.19.12-to-1.18.7.patch' on target directory
> '<REDACTED>/tmp/work/core2-64-poky-linux/docker-ce/20.10.25-ce+git3056208=
812eb5e792fa99736c9167d1e10f4ab49-r0/git/src/import'
>
> CmdError('quilt --quiltrc
> <REDACTED>/tmp/work/core2-64-poky-linux/docker-ce/20.10.25-ce+git30562088=
12eb5e792fa99736c9167d1e10f4ab49-r0/recipe-sysroot-native/etc/quiltrc
> push', 0, 'stdout: Applying patch
> 0001-Revert-go-updates-from-1.19.12-to-1.18.7.patch
>
> patching file Dockerfile
>
> Hunk #1 FAILED at 3.
>
> Hunk #2 FAILED at 267.
>
> Hunk #3 FAILED at 316.
>
> 3 out of 3 hunks FAILED -- rejects in file Dockerfile
>
> patching file Dockerfile.e2e
>
> Hunk #1 FAILED at 1.
>
> 1 out of 1 hunk FAILED -- rejects in file Dockerfile.e2e
>
> patching file Dockerfile.simple
>
> Hunk #1 FAILED at 5.
>
> 1 out of 1 hunk FAILED -- rejects in file Dockerfile.simple
>
> patching file Dockerfile.windows
>
> Hunk #1 FAILED at 165.
>
> 1 out of 1 hunk FAILED -- rejects in file Dockerfile.windows
>
> patching file hack/dockerfile/install/gotestsum.installer
>
> Hunk #1 FAILED at 1.
>
> 1 out of 1 hunk FAILED -- rejects in file
> hack/dockerfile/install/gotestsum.installer
>
> Patch 0001-Revert-go-updates-from-1.19.12-to-1.18.7.patch can be
> reverse-applied
>
>
>
> stderr: ')
>
> ERROR: Logfile of failure stored in:
> <REDACTED>/tmp/work/core2-64-poky-linux/docker-ce/20.10.25-ce+git30562088=
12eb5e792fa99736c9167d1e10f4ab49-r0/temp/log.do_patch.622820
>
> ERROR: Task
> <REDACTED>/meta-virtualization/recipes-containers/docker/docker-ce_git.bb=
:do_patch)
> failed with exit code '1'
>
>
>
>
>
> *From:* meta-virtualization@lists.yoctoproject.org <
> meta-virtualization@lists.yoctoproject.org> *On Behalf Of *Martin Jansa
> *Sent:* Monday, August 14, 2023 12:03 PM
> *To:* Martin.Jansa@gmail.com
> *Cc:* meta-virtualization@lists.yoctoproject.org
> *Subject:* Re: [meta-virtualization] [kirkstone][RFC][PATCHv2] docker:
> update to v20.10.25 + 58 commits to fix compatibility with go currently i=
n
> kirkstone
>
>
>
> On Mon, Aug 14, 2023 at 9:00=E2=80=AFPM Martin Jansa <martin.jansa@gmail.=
com>
> wrote:
>
>
>
>
>
> On Mon, Aug 14, 2023 at 5:17=E2=80=AFPM Martin Jansa via lists.yoctoproje=
ct.org
> <Martin.Jansa=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> RFC, because I've only build tested this in kirkstone, waiting for whole
> image to build to test it in runtime
>
>
>
> Passed minimal sanity check on rpi4-64:
>
>
>
> my fat fingers didn't pass copy&pasting test, here 2nd try:
>
>
>
> root@rpi4:~# systemctl start docker.service
> root@rpi4:~# docker run -it --rm ubuntu
> Unable to find image 'ubuntu:latest' locally
> latest: Pulling from library/ubuntu
> 5af00eab9784: Pull complete
> Digest:
> sha256:0bced47fffa3361afa981854fcabcd4577cd43cebbb808cea2b1f33a3dd7f508
> Status: Downloaded newer image for ubuntu:latest
> root@92414c21da3d:/#
>
> root@92414c21da3d:/# cat /etc/lsb-release
> DISTRIB_ID=3DUbuntu
> DISTRIB_RELEASE=3D22.04
> DISTRIB_CODENAME=3Djammy
> DISTRIB_DESCRIPTION=3D"Ubuntu 22.04.2 LTS"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8192):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8192
> Mute This Topic: https://lists.yoctoproject.org/mt/100738603/3617156
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007dd55c0602fcaa26
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hmm, I was testing docker-moby, not docker-ce, but I don&#=
39;t see why it would be happening. Will try docker-ce tomorrow.</div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug=
 15, 2023 at 11:06=E2=80=AFPM Ruslan Babayev (fib) via <a href=3D"http://li=
sts.yoctoproject.org">lists.yoctoproject.org</a> &lt;fib=3D<a href=3D"mailt=
o:cisco.com@lists.yoctoproject.org">cisco.com@lists.yoctoproject.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div cl=
ass=3D"msg3871469644072750127">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_3871469644072750127WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">Hi Martin,<u></u><u><=
/u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">Build fails with:<u><=
/u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">ERROR: docker-ce-20.1=
0.25-ce+git3056208812eb5e792fa99736c9167d1e10f4ab49-r0 do_patch: Applying p=
atch &#39;0001-Revert-go-updates-from-1.19.12-to-1.18.7.patch&#39; on targe=
t directory &#39;&lt;REDACTED&gt;/tmp/work/core2-64-poky-linux/docker-ce/20=
.10.25-ce+git3056208812eb5e792fa99736c9167d1e10f4ab49-r0/git/src/import&#39=
;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">CmdError(&#39;quilt -=
-quiltrc &lt;REDACTED&gt;/tmp/work/core2-64-poky-linux/docker-ce/20.10.25-c=
e+git3056208812eb5e792fa99736c9167d1e10f4ab49-r0/recipe-sysroot-native/etc/=
quiltrc push&#39;, 0, &#39;stdout: Applying patch 0001-Revert-go-updates-fr=
om-1.19.12-to-1.18.7.patch<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">patching file Dockerf=
ile<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">Hunk #1 FAILED at 3.<=
u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">Hunk #2 FAILED at 267=
.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">Hunk #3 FAILED at 316=
.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">3 out of 3 hunks FAIL=
ED -- rejects in file Dockerfile<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">patching file Dockerf=
ile.e2e<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">Hunk #1 FAILED at 1.<=
u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">1 out of 1 hunk FAILE=
D -- rejects in file Dockerfile.e2e<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">patching file Dockerf=
ile.simple<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">Hunk #1 FAILED at 5.<=
u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">1 out of 1 hunk FAILE=
D -- rejects in file Dockerfile.simple<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">patching file Dockerf=
ile.windows<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">Hunk #1 FAILED at 165=
.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">1 out of 1 hunk FAILE=
D -- rejects in file Dockerfile.windows<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">patching file hack/do=
ckerfile/install/gotestsum.installer<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">Hunk #1 FAILED at 1.<=
u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">1 out of 1 hunk FAILE=
D -- rejects in file hack/dockerfile/install/gotestsum.installer<u></u><u><=
/u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">Patch 0001-Revert-go-=
updates-from-1.19.12-to-1.18.7.patch can be reverse-applied<u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">stderr: &#39;)<u></u>=
<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">ERROR: Logfile of fai=
lure stored in: &lt;REDACTED&gt;/tmp/work/core2-64-poky-linux/docker-ce/20.=
10.25-ce+git3056208812eb5e792fa99736c9167d1e10f4ab49-r0/temp/log.do_patch.6=
22820<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">ERROR: Task &lt;REDAC=
TED&gt;/meta-virtualization/recipes-containers/docker/docker-ce_git.bb:do_p=
atch) failed with exit code &#39;1&#39;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt"><u></u>=C2=A0<u></u><=
/span></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b>From:</b> <a href=3D"mailto:meta-virtualization@l=
ists.yoctoproject.org" target=3D"_blank">meta-virtualization@lists.yoctopro=
ject.org</a> &lt;<a href=3D"mailto:meta-virtualization@lists.yoctoproject.o=
rg" target=3D"_blank">meta-virtualization@lists.yoctoproject.org</a>&gt;
<b>On Behalf Of </b>Martin Jansa<br>
<b>Sent:</b> Monday, August 14, 2023 12:03 PM<br>
<b>To:</b> <a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank">Mart=
in.Jansa@gmail.com</a><br>
<b>Cc:</b> <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" ta=
rget=3D"_blank">meta-virtualization@lists.yoctoproject.org</a><br>
<b>Subject:</b> Re: [meta-virtualization] [kirkstone][RFC][PATCHv2] docker:=
 update to v20.10.25 + 58 commits to fix compatibility with go currently in=
 kirkstone<u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Mon, Aug 14, 2023 at 9:00=E2=80=AFPM Martin Jansa=
 &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jan=
sa@gmail.com</a>&gt; wrote:<u></u><u></u></p>
</div>
<div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Mon, Aug 14, 2023 at 5:17=E2=80=AFPM Martin Jansa=
 via <a href=3D"http://lists.yoctoproject.org" target=3D"_blank">
lists.yoctoproject.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@l=
ists.yoctoproject.org" target=3D"_blank">gmail.com@lists.yoctoproject.org</=
a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<div>
<p class=3D"MsoNormal">RFC, because I&#39;ve only build tested this in kirk=
stone, waiting for whole image to build to test it in runtime<u></u><u></u>=
</p>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Passed minimal sanity check on rpi4-64:<u></u><u></u=
></p>
</div>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">my fat fingers didn&#39;t pass copy&amp;pasting test=
, here 2nd try:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">root@rpi4:~# systemctl start docker.service<br>
root@rpi4:~# docker run -it --rm ubuntu<br>
Unable to find image &#39;ubuntu:latest&#39; locally<br>
latest: Pulling from library/ubuntu<br>
5af00eab9784: Pull complete <br>
Digest: sha256:0bced47fffa3361afa981854fcabcd4577cd43cebbb808cea2b1f33a3dd7=
f508<br>
Status: Downloaded newer image for ubuntu:latest<br>
root@92414c21da3d:/#<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">root@92414c21da3d:/# cat /etc/lsb-release <br>
DISTRIB_ID=3DUbuntu<br>
DISTRIB_RELEASE=3D22.04<br>
DISTRIB_CODENAME=3Djammy<br>
DISTRIB_DESCRIPTION=3D&quot;Ubuntu 22.04.2 LTS&quot;<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8192): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8192" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8192</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/100738603/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/100738603/3617156</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com=
" target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div></blockquote></div>

--0000000000007dd55c0602fcaa26--

