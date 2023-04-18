Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E7B2C77B75
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 16:59:34 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.15169.1681837167917396130
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Apr 2023 09:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=mpiuMJbO;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: peron.clem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id l17so8864711qvq.10
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 18 Apr 2023 09:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681837167; x=1684429167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9EuryGMyydIQM6bIunbwXpP34++ZkA1Y+T3+7nug64c=;
        b=mpiuMJbOlCa7RM18RCz0F05/1FBiZ1yOA/cWd4DkBRZCCvNk0IX/1iVin7/PaS9u3H
         AcBo7gmeehpQZpgo6SyU5FdVrvmp0yLqygsr5wpOBJEjlq4neKoJ88sriPu6NsesYL74
         /KjJaexgz4d1sPxPAB8P0WIZ+8I0HtykyutScZGo/+OJyxebZC96IHtfkfyBwLR0CjrZ
         Oug8TJXCprNMAfwE/AfQ6XFe9A6lbs/j/8mj49KWGN8duv+FesNI9TBIbifJrnaeTZCS
         WhIEM2iGPgCfBmADpeOLJ/WJO3bPH2FJxL1Q9qAtQZjKPYb4HxrQSoDHXnFzl49dzYy1
         mVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681837167; x=1684429167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9EuryGMyydIQM6bIunbwXpP34++ZkA1Y+T3+7nug64c=;
        b=X3NgO7aBREDi2KTocrkiDRYnsme5cCzTD8NgmgCohfmESS+6E1cesm9qXpTkyKCn53
         fkQxliSw9C7ig+8/J7g5u4/IxVDoESg2lr7hkMWWI6WHrgTZM3X3KEq3u8IJuJUC+gRS
         599xofl70QqtqVg4m0Ob/awETEHWQ5X09ukBwn/xJA3Kv39zlNW4Spl842tsiKY/b9Wr
         TzOzAVZTqDv9cstPU2hSZ3bQB6b3qKF7TcR0w+5tDL3HuE0pSMdyvzC1Vywi1sbLjEFU
         BqzoA1DmXfTXo0qlknWzlXFo4KQvwjM7f8HsGnzrL7aj1UCiK7VCJOv1WfqxRNGcaNMN
         ckdA==
X-Gm-Message-State: AAQBX9cXXG2BrSL/Dp9Yamu4qEYXf4lLy1fko2Z2hCbj5Gfj1NJkoAUX
	z8vbE5c1MHai2detYMM+04PG8J6+DLABJ/uvSPc=
X-Google-Smtp-Source: AKy350YlFZD7M9H2OBDXNvDMa4eLanlCSAPdMa6ox9ECF7XhYR9yV97WVHKZVMESPKJB0kWaueLKt3dGquFA7FHrFJc=
X-Received: by 2002:a05:6214:e67:b0:5ef:8b82:8318 with SMTP id
 jz7-20020a0562140e6700b005ef8b828318mr6234082qvb.42.1681837166769; Tue, 18
 Apr 2023 09:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <DB6PR03MB2901D4439A5131E632CC350791939@DB6PR03MB2901.eurprd03.prod.outlook.com>
 <3071.1681836856076784160@lists.yoctoproject.org>
In-Reply-To: <3071.1681836856076784160@lists.yoctoproject.org>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 18 Apr 2023 18:59:16 +0200
Message-ID: <CAJiuCcdure1pYHm74kwFzO8BLv7Tj4fXFq7VXivBG-TcFMdUjw@mail.gmail.com>
Subject: Re: [meta-virtualization] Deploying container images directly into
 the target rootfs at build time
To: adrian.dudau@keyfactor.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 18 Apr 2023 16:59:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7998

Hi,

On Tue, 18 Apr 2023 at 18:54, Cl=C3=A9ment P=C3=A9ron via lists.yoctoprojec=
t.org
<peron.clem=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> Hi Adrien,
>
>
> I'm really new in building container with OE but did you have a look at: =
https://github.com/savoirfairelinux/meta-embedded-containers/blob/main/reci=
pes-support/container-image/container-archive.bb

Sorry I tried to use the web interface tool, but this didn't make a
proper inline reply :(

>
>
> Regards,
> Clement
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7997): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7997
> Mute This Topic: https://lists.yoctoproject.org/mt/98055400/4240582
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
peron.clem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

