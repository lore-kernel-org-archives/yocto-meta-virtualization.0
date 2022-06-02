Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC62C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 12:43:40 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web08.6044.1654173817585200709
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 Jun 2022 05:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jm8whCfp;
 spf=pass (domain: gmail.com, ip: 209.85.128.177,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-2ec42eae76bso49867807b3.10
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 Jun 2022 05:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=quH8HXQ5rJM81RvWKDlNOf0u0+oi3UUjM6VY/w8oquA=;
        b=jm8whCfpNYIOzck8H+BEbrBaiC1V31S27f7TgPTMQ/tkG+9S9saPuHaoqTZVOPEe5f
         7ikAzPt716ehjER9g+zP+Yp6Hm7BOwP+1Pew+uGZCOElbRSkGuxuzXBdy/xq807FqlYh
         TaOxnmKsscBzHqomk1JvBGVEbLPqhTTygI951jJIVP3NdrGf+RkskPTxvM8vhW3G1z7b
         OoxGoKd3Cpo5R7r/s7RMhIhH+kQan4Y0S9vNJkkdeeiXt6V00LoeS2oEqtfEyTINlOfs
         Q4oTOSvpIDU9YnxqYjFBHDokmlwUIiMZelxy1bPn5zfDedL8pRZFwSlNHbnrt9kwV1Mp
         1w6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=quH8HXQ5rJM81RvWKDlNOf0u0+oi3UUjM6VY/w8oquA=;
        b=f0Skufvx8ol1t+WHDjKIKGK80QIBCD3J4n4fnpz6ckKUx8BOqXS42Lz2+2l+hTe6Xg
         tClIKPjVsGX2ucCP0CUA5GU6iMcJhc/0AUrrmbixZFRLXQMIOt4utoW6cSPGGhwn7QJz
         upk7FlY9ZYPRfgGqbn3KJqJFRPiiFkfd+PK059G70fXo4Zj8z/CJrLJ0o9NbnYYDT23A
         xsDWy70rbkrMDanZH+L8VZ8JZgznYvx+PU7ReuiEJejfFYaXGzEzmSWKdorNllLXFzoW
         RrK9zr95gigG0Sk+QgjKczzDV/NT7a0AhHTDpprTFzJ8Cd2h7xG5hoGxFTLuHZYl+F3R
         ynTA==
X-Gm-Message-State: AOAM531o3MLc4vUHGr8fyuxUftRs2Qs8BQDoiz/vjlG+mf9yfYnV05OO
	rjKMH8pGoX0p/Qd/RX35/UD7eD4D/yJehwYJJ3w=
X-Google-Smtp-Source: 
 ABdhPJw7WCjtrQMcJWtLy6i2C2FLq22X4NWQiWn1BqiOu3BMFxJ6BpWQtd/cLu9fZ/r5DwMqlgk+MVkwobpbbkC2phY=
X-Received: by 2002:a05:690c:3:b0:2e0:a28a:f0eb with SMTP id
 bc3-20020a05690c000300b002e0a28af0ebmr5672619ywb.179.1654173816728; Thu, 02
 Jun 2022 05:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <VpOI.1654172441952282386.T9d4@lists.yoctoproject.org>
In-Reply-To: <VpOI.1654172441952282386.T9d4@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 2 Jun 2022 08:43:25 -0400
Message-ID: 
 <CADkTA4M9g3mxer8qHxspmasAwR1uE6erXroJPe8v1wLFqgBdfw@mail.gmail.com>
Subject: Re: [meta-virtualization] Missing https protocol for kata-containers
 recipes
To: =?UTF-8?Q?Aur=C3=A9lien_Bertron?= <aurelienbertron@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Jun 2022 12:43:40 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7333

On Thu, Jun 2, 2022 at 8:20 AM Aur=C3=A9lien Bertron
<aurelienbertron@gmail.com> wrote:
>
> On branch kirkstone, the kata-* recipes clone their sources from github. =
The git fetcher uses unsafe git protocol by default which Github does not s=
upport. This makes the fetch step to fail.
> One can fix this by adding ";protocol=3Dhttps" at the end of the SRC_URI =
entry.

The output of those recipes are broken, but I've left them around (and
didn't include them in the global conversions of protocol, etc) to
entice any interested parties into fixing them :) I could add them to
the block list, but then, they'd be less visible.

So you must be running some sort of world build, or fetch-all to
trigger those particular errors.

I'll think about this for a bit. The protocol fix is easy enough, but
I may just block them this time, versus fixing them up without
testing.

Bruce



>
> Aur=C3=A9lien.
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7332): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7332
> Mute This Topic: https://lists.yoctoproject.org/mt/91497874/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

