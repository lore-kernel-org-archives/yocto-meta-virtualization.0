Return-Path: <anthony.t.davies@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2672FC433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 00:28:55 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.1429.1669768132034722074
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 29 Nov 2022 16:28:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ex75pLKt;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: anthony.t.davies@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-14279410bf4so19196037fac.8
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Nov 2022 16:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c/GuqXDTl7pDR0R8K23GFUUFhc8sGJ1oPz82LykpFSQ=;
        b=Ex75pLKtBhhzE9yZgRZTmQ+YKEGrn7iO338OjqizBJ7AqAzlac+mmWNWtkaTj5tPGw
         0ET38nqUNrWM328nrIR/0OzXwOzpDQX0z9n4qxm6B3zifgDo8mYKjsMksZpOvEmdTEJG
         lTP0OltaTLfcoumG24WJZTQ8zsNvN1BnBVSdH3KfWij0Ojh4IcNm0yHikEpS/HH1WpIH
         e/BH1K0j3zt2ln5IZDvc/dJ9Lc9WGS+AyTbN96MuZjS3st74+YZOkYLilg5qD5FUnNQn
         DcNy5dKc8MnBHhkEYoqSMcFIq0fJd7JS76MYAtGK6ID5kl9TeBh+J300BpNyLxHIzuw+
         4H4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c/GuqXDTl7pDR0R8K23GFUUFhc8sGJ1oPz82LykpFSQ=;
        b=OU2po5h8CCIiynvcfOMR0523xzeI2VO0E55idmjc7HlqLNOoXkVrOhNXpKoUc3nkgT
         kHeGGyXa7fdrcdfw5grclWCypvlVzu+NfJNFhlywWqujrRKSSb82GW0BPJfe7+QB2RHD
         iRT/DuviUIGOyShksWpMPCo4YbuMIiMtbAWVW5ZaOWSlDJkJfEbXuoTv8ykm1ZUR8KXj
         6sFlyKdbe2DwHhGin3Pp4VXGz8i6IQAxHL/rb8P5MnDE3+otI8j9bzYICC1vnfsB9uoR
         Qa5QvoComUc4w6Vp7R3QlOogUD+bh3sIDnk6+rWZqdckpFJzda1Xgzd8WO897kMKSIGn
         7p2A==
X-Gm-Message-State: ANoB5pmHNo7raRErhlaA37kyz+Z7aVK1NE0YFQsMkLaUHQ20Pxvlw8DX
	CfOdBGa65xdGWzgRPjOngbEjz69UuoEiWaMiolhMN4L0
X-Google-Smtp-Source: AA0mqf5ApGs3xP5+2QkYsINzl9StuoTgx/8VJB+LqOPc42K7TvcOc1KDh8AHRl+eiR3DL797Gz9N5opMyJw1ku1pLCo=
X-Received: by 2002:a05:6870:e90:b0:143:edc:c354 with SMTP id
 mm16-20020a0568700e9000b001430edcc354mr22334098oab.276.1669768131153; Tue, 29
 Nov 2022 16:28:51 -0800 (PST)
MIME-Version: 1.0
From: Anthony Davies <anthony.t.davies@gmail.com>
Date: Wed, 30 Nov 2022 11:28:39 +1100
Message-ID: <CAL5F+oJ78-LCD44FjQrJzrjrVcN2m1bCqUv746HFVdMFuUvPgw@mail.gmail.com>
Subject: k3s (kirkstone) segfaults when run on hardware
To: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000050939905eea53013"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Nov 2022 00:28:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7706

--00000000000050939905eea53013
Content-Type: text/plain; charset="UTF-8"

Hi,

I have created an image that includes k3s. When my hardware boots and I
attempt to execute k3s straight out segfaults, output from "k3s --debug"
and no logs are created.

On #meta-virt it was suggested to try another go program on my image, I
installed "go-helloworld" which runs successfully.

Regards,

Tony Davies

--00000000000050939905eea53013
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I have created an image that includ=
es k3s. When=C2=A0my hardware boots and I attempt to execute k3s straight o=
ut segfaults, output from &quot;k3s --debug&quot; and no logs are created.<=
/div><div><br></div><div>On #meta-virt it was suggested to try another go p=
rogram on my image, I installed &quot;go-helloworld&quot; which runs succes=
sfully.</div><div><br></div><div>Regards,</div><div><br>Tony Davies</div></=
div>

--00000000000050939905eea53013--

