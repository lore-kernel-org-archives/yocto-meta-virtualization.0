Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 736A0CCA486
	for <webhook@archiver.kernel.org>; Fri, 17 Jun 2022 15:41:31 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web12.32148.1655480489428656513
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Jun 2022 08:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZW53per3;
 spf=pass (domain: gmail.com, ip: 209.85.221.171,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-vk1-f171.google.com with SMTP id s1so2162805vkl.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Jun 2022 08:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u2NHomHCUCnjuO8EzS3HpFVC2f8zcOKGEy7BlmqVIkw=;
        b=ZW53per3fuvQTJ72GXtYZI+aXVG8Vz2tc9XQ4sKaCE/LRDrymiyjIs8IWtGvNfqJm/
         tijKDSm1gmvaPXzpuYxJa7lY+O9pDYa0znFqzoZts/gLvKVLhfWWoQGmBRH/LfXU+2S1
         6Phgy5F0Dh5BRJAfWSNSetECE/S5le0+0ilhVyI2KvGCM/jLY36SrkTpSTvBHAWe+ip5
         mYYRQiWoy+JJLs1PNULiaK2p5BwnKbLUqB/Ptns3iUCVrTH8tVmvhSQIbtDXodmQymaK
         21655Q9a3SOfzyOQdJ0gECyXJzaZ2nWBIMHYATb5/xROwr/tzxdRPkILZ6v8n2yJp6ww
         loYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u2NHomHCUCnjuO8EzS3HpFVC2f8zcOKGEy7BlmqVIkw=;
        b=O5UWmVPUmmHlAAqVxzxdU2muWACFzL3vzB8vLpDd45T5jpa1p8HlIdKhLBti4M0Veg
         n5mvsEFgz0jXLoUa9RfLXqXcIhwMGpPw3AIOQ2S0Gz+JwhMyfDZKtzYMDLsqSgsAcZB5
         izSHe6Jjs9YUn2WhWy+snBxQFxQyQDHv5b0Kf1nR4L7shH+7YEYXvlyC/0aHSrRV1edq
         u4N6hxQCEQ1EAJnqZCt40rjzO2pC207834oh8QYyj7xtBNkKg9w/rlImF132y3x+6CEF
         BIqxRtZJYusJ7AekrZ0IHOIxVw6UJbYC0h2mdwA344epQ+c/vLIxBVycmDDnYz8YkCO6
         /ThA==
X-Gm-Message-State: AJIora/vG621yFP6CX7gGJz6JrBO7dGYjgna9QF8QDaFuNqE+iOSt3wK
	3gOS59ZLWgOjY+mcOWxO4h8FRiyCK3Xv+a5r3TU=
X-Google-Smtp-Source: 
 AGRyM1ukXJyN/TL3XVtRsw+POa4MJ3jFQ4ac85TNw2H/xFGhxSSAKT1ZMvG1U58tzy0dZSmlvnLC4AdcBu2Roee8oaU=
X-Received: by 2002:a1f:3456:0:b0:368:ca4e:1bd1 with SMTP id
 b83-20020a1f3456000000b00368ca4e1bd1mr5054506vka.36.1655480487662; Fri, 17
 Jun 2022 08:41:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220609095748.176486-1-michal.orzel@arm.com>
 <CADkTA4M_sMQd5v00NzmOas+j7HX0GopE6KRZZLV+TJmDr62fpg@mail.gmail.com>
In-Reply-To: 
 <CADkTA4M_sMQd5v00NzmOas+j7HX0GopE6KRZZLV+TJmDr62fpg@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Fri, 17 Jun 2022 08:41:16 -0700
Message-ID: 
 <CACMJ4GZexTbtNFt27LfpHvgCSz0xorN+mE9HxsGEaqT-cDCBtg@mail.gmail.com>
Subject: Re: [PATCH 0/2] xen: PCI runqemu issue follow-up
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Michal Orzel <michal.orzel@arm.com>,
 meta-virtualization@lists.yoctoproject.org,
	nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Jun 2022 15:41:31 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7389

On Tue, Jun 14, 2022 at 12:47 PM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> I was waiting to hear from Christopher on this one, so I'll let it
> soak a few more days before staging.
>
> Bruce
>
> On Thu, Jun 9, 2022 at 5:58 AM Michal Orzel <michal.orzel@arm.com> wrote:
> >
> > This series acts as a follow-up to the commit:
> > fb0a7b97db4f ("xen: Disable PCI on qemuarm with Xen")
> >
> > This wants to be backported to kirkstone.

Thanks for these patches and for working out what was needed for the
fix, Michal.

Apologies for the slow review - am catching up now after a few days
down with an injury (should be ok).

Christopher


> >
> > Michal Orzel (2):
> >   Revert "xen: Disable PCI on qemuarm with Xen"
> >   xen: Disable highmem on qemuarm
> >
> >  classes/qemuboot-xen-defaults.bbclass |  6 ++++--
> >  classes/qemuboot-xen-dtb.bbclass      | 22 ----------------------
> >  2 files changed, 4 insertions(+), 24 deletions(-)
> >
> > --
> > 2.25.1
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

