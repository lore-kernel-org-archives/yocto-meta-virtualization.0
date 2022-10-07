Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0746CC433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Oct 2022 19:18:47 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web12.8587.1665170317041841330
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 07 Oct 2022 12:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gUCS4OAK;
 spf=pass (domain: gmail.com, ip: 209.85.167.181,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id m130so6598589oif.6
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 07 Oct 2022 12:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngIBmatVqTBPG7ccJ0AuDOnM72Q3c3477NrcUCKjhh0=;
        b=gUCS4OAKc7hRMfWfKS0UdiQQdUIqpBAb+w+0jTx+WFdBc7lL43ihFWN+P1H2GXF/e6
         V2QoDyhXZ+MeKA9D9gw8C8MrfQtv6qMdrhvx9DktmonTgFATgz4Y1Z2fIPjRBN1yVFq8
         aqMEXBJbtGMrZYyblW/e6PQKn2FhNmRlMQAP37UE+HKMWdLkz/HUcWX7GOYtHw8uxxBC
         veTdd6je97GyEyquNiO8g/wBamPN8R+OtO4EpRhCZFmc/gBFBTs3/HhCINoI5MRo7ON+
         piNeTkUO/LHG88bLHo1oqRgIsKWCB0+Zf5cP6DAVVAQr7siAwDDgs3w0tghlYqA7TNnA
         qoag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ngIBmatVqTBPG7ccJ0AuDOnM72Q3c3477NrcUCKjhh0=;
        b=WzDzSmAPxTbBA5TS96OamhM0Mw5AcWUWA8u2cms+lpsX8HesAc+/s0DPB48UjdKARo
         tGH3zlkKmLBmOxK+R/InTAU0xqobiAMJ/EYnshPGm8Yzdju7ZFkSsVCalS2nSZjky45M
         gfy7Fx1XN23NAaL1VpSVPprQGlUGeet+o0orJ1fR2lXDRuQm0UtNSBzIn/frIiuJ1uNZ
         RYLKdH+eG2AdrQZ7LeYwxyaiGt/3caAK8+hI9BpnVoWy5FDOK0AKr3+E7K7PqLJtW76B
         pRVSW7kpdprltxRKuD9IQ8Q97v21ih/LD+7QTVbLrSWi8hOisSHiZCld4UadAXK7tqy1
         RT7Q==
X-Gm-Message-State: ACrzQf3apsnt9bJY51IU9aoc7pR0T6HZIAS3tHNfExMGglk/RY48GmPV
	SzrgKrJdCf92oHxUo8rWcEsQ4dNPfkJijEZI6as=
X-Google-Smtp-Source: 
 AMsMyM51muxis3UpZeizQ5ls9Bdrwx8n2uQL1KKHMIep8JVFZ9akM3LDiNOlySO66DEPdVZo/XbGd299HacqAW7VNb4=
X-Received: by 2002:a05:6808:1a08:b0:354:2875:3d63 with SMTP id
 bk8-20020a0568081a0800b0035428753d63mr3086746oib.241.1665170316218; Fri, 07
 Oct 2022 12:18:36 -0700 (PDT)
MIME-Version: 1.0
References: 
 <SN6PR03MB41278821A2E85FF22A8FECD7C55F9@SN6PR03MB4127.namprd03.prod.outlook.com>
In-Reply-To: 
 <SN6PR03MB41278821A2E85FF22A8FECD7C55F9@SN6PR03MB4127.namprd03.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 7 Oct 2022 15:18:24 -0400
Message-ID: 
 <CADkTA4MUQxP-_3ioLKpMU3PPNV5V9JnvuV+QTcj4wBwsgtVxYA@mail.gmail.com>
Subject: Re: [meta-virtualization] Breaking Change: Github disabled support
 for git://github.com
To: Kevin Saye <ksaye@saye.org>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 07 Oct 2022 19:18:47 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7648

On Fri, Oct 7, 2022 at 3:09 PM Kevin Saye <ksaye@saye.org> wrote:
>
> As far as I know, GitHub disabled unencrypted request using the git://git=
hub.com on March 15 2022.  More info here: https://github.blog/2021-09-01-i=
mproving-git-protocol-security-github/#when-are-these-changes-effective
>
>
>
> My recent build of Yocto, which needs the meta-virtualization seems to fa=
il because of this because recipes-devtools/go/go-systemd_git.bb has a hard=
 dependency on git://github.com
>
>
>
> While I am using sumo (https://git.yoctoproject.org/meta-virtualization/t=
ree/recipes-devtools/go/go-systemd_git.bb?h=3Dsumo) but the latest seems to=
 also have the issue: https://git.yoctoproject.org/meta-virtualization/tree=
/recipes-devtools/go/go-systemd_git.bb?h=3Dlangdale.
>
>
>
> Are there any suggestions on how to resolve this?

We did a global update some time ago, that recipe may have been missed.

Just put protocol=3Dhttps into the SRC_URI and it'll work.

That being said master/langdale and others should be fine as it has
the SRC_URI: SRC_URI =3D
"git://${PKG_NAME}.git;branch=3Dmain;protocol=3Dhttps"

Bruce

>
>
>
> K
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7647): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7647
> Mute This Topic: https://lists.yoctoproject.org/mt/94186888/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

