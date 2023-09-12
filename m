Return-Path: <marek.belisko@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BCE3CA0ECE
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 07:26:25 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.19710.1694503576974941462
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Sep 2023 00:26:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=EftS312t;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: marek.belisko@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2bcb54226e7so64022661fa.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Sep 2023 00:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694503575; x=1695108375; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lWyc+0W18yKVDJ7IPJL7yxAIYpkjcrKjQvR7h9ctDXo=;
        b=EftS312t4OaZazP5aOqRd+cvLiqr8VNabKRAoBv02oWyitwQOJ+favmrrqcm43i5ng
         989YH0zzCrAgFs/VTRwL6LRNwH7c8VGE0SAmJyNH9hIwkuBFDZ81AI8P/kWJSJh2UxKQ
         Wdyz1dN7Ja5xsYLm1LRHI+rPYP+NIdtjIi0k8KIhDplgO3OVo4ExKkRGCY63EGM3aKXM
         KbaF3Vyzkr77tbBO/MserKqCWCwMDK7G/4MaNeyKjGS5NSOHnGZgPhax0IQNi2rbBQ31
         46cg2kg/hiPnd+UFMThGDUn5csu7T13/9yxOnYrnyUXAm819/MaPkU/Zonovcv0X71Ks
         IN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694503575; x=1695108375;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lWyc+0W18yKVDJ7IPJL7yxAIYpkjcrKjQvR7h9ctDXo=;
        b=oH72WYbwypmUdwLuIumGeWwdmxQdLdw3F78dULGihXhc3lzCCQMQr6W77RGTDWAJBQ
         vzqonOC/KWSyBKWsqiXDez1hLgcst2Xjntnp7mIcpXPDQPwYdu0Eb+2R9ynkCHzhLrDT
         qvf0pxJJHenoB/DJcnVdiEdMHN+D4/1s9svU8NaY9E3loB1XCQTd2CkD9zGVMgRWyTPP
         ++ytV9qIKELrcLeXJvm2Ly8Pzxy56+FkZzRycunJcGqEm5tGFH5A0ceMBdxBqqTAMfgm
         0OqhJWNj67yW4ZGpnJwU6TAyu01IZyigMMYRBCL8OlEzYz9xyXlukP2F47dBU/M3bgLS
         3FxA==
X-Gm-Message-State: AOJu0YxOLdRdPbpdnDGLmFlgDHHIGWO/rJMGm5hm7AABgMPYyMAvuwrO
	Vj5FhH9Hnd3CEXvJpFSYpTIrGYdTb1lUgG35QKHl4Bj0s0s=
X-Google-Smtp-Source: AGHT+IEvfMFGYO1rjyBbl0lsougA0+mA8kTw11hXN/W4E0ygvMnnfx/mJel89tD8+GEbSFOif1ndXjKxIcE629q7poM=
X-Received: by 2002:a2e:3204:0:b0:2bf:7513:2 with SMTP id y4-20020a2e3204000000b002bf75130002mr606804ljy.4.1694503574305;
 Tue, 12 Sep 2023 00:26:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAAfyv34+oTQaT=9-QGkTdCFSJaC6CS=RB6SF=FQrOUssntoBSA@mail.gmail.com>
In-Reply-To: <CAAfyv34+oTQaT=9-QGkTdCFSJaC6CS=RB6SF=FQrOUssntoBSA@mail.gmail.com>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Tue, 12 Sep 2023 09:26:02 +0200
Message-ID: <CAAfyv35VDffm9nLeYP4yb+pvdPBaS0jQ8_1bZ-KaUq28RBBJ1A@mail.gmail.com>
Subject: nerdctl broken in kirkstone
To: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000009e00890605245b87"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Sep 2023 07:26:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8296

--0000000000009e00890605245b87
Content-Type: text/plain; charset="UTF-8"

Hi,

Forwarding in proper mailing list.

I'm trying to add nerdctl to an image using kirkstone release for
meta-virtualization.
I've added bbappend with following fix:

SRC_URI = "git://
github.com/containerd/nerdctl.git;name=nerdcli;branch=main;protocol=https"

(branch name in original recipe is master but main is required)

but then anyways it fails with:

rsync: [sender] change_dir
"/data/projects/test/build/tmp/work/cortexa53-crypto-poky-linux/nerdctl/v0.18.0-r0/nerdctl-v0.18.0/src/import/vendor.fetch/
github.com/Masterminds/semver/v3" failed: No such file or directory (2)
| rsync error: some files/attrs were not transferred (see previous errors)
(code 23) at main.c(1327) [sender=3.2.5]

And in ${BP} I cannot see any of those vendor stuff which should be
present. Is there some fix for that already pending or its known issue?

Thanks and BR,

marek

--0000000000009e00890605245b87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">Hi,<br></div><div dir=3D"ltr" class=3D"gmail_attr"><br></div><div cl=
ass=3D"gmail_attr">Forwarding in proper mailing list.</div><div dir=3D"ltr"=
><div><br></div><div>I&#39;m trying to add nerdctl=C2=A0to an image using k=
irkstone release=C2=A0for meta-virtualization.</div><div>I&#39;ve added bba=
ppend with following fix:</div><div><br></div><div>SRC_URI =3D &quot;git://=
<a href=3D"http://github.com/containerd/nerdctl.git;name=3Dnerdcli;branch=
=3Dmain;protocol=3Dhttps" target=3D"_blank">github.com/containerd/nerdctl.g=
it;name=3Dnerdcli;branch=3Dmain;protocol=3Dhttps</a>&quot;<br></div><div><b=
r></div><div>(branch name in original recipe is master but main is required=
)</div><div><br></div><div>but then anyways it fails with:</div><div><br></=
div><div>rsync: [sender] change_dir &quot;/data/projects/test/build/tmp/wor=
k/cortexa53-crypto-poky-linux/nerdctl/v0.18.0-r0/nerdctl-v0.18.0/src/import=
/vendor.fetch/<a href=3D"http://github.com/Masterminds/semver/v3" target=3D=
"_blank">github.com/Masterminds/semver/v3</a>&quot; failed: No such file or=
 directory (2)<br>| rsync error: some files/attrs were not transferred (see=
 previous errors) (code 23) at main.c(1327) [sender=3D3.2.5]<br></div><div>=
<br></div><div>And in ${BP} I cannot see any of those vendor stuff which sh=
ould be present. Is there some fix for that already pending or its known is=
sue?</div><div><br></div><div>Thanks=C2=A0and BR,</div><div><br></div><div>=
marek</div><div><br></div></div></div></div>

--0000000000009e00890605245b87--

