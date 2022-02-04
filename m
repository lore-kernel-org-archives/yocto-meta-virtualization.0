Return-Path: <mans.zigher@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D37C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 14:23:30 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web12.9704.1643984610118058393
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 06:23:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jZlBQ/8f;
 spf=pass (domain: gmail.com, ip: 209.85.161.43,
 mailfrom: mans.zigher@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id
 p4-20020a4a8e84000000b002e598a51d60so4822108ook.2
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 06:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uHWUmlRsYoS8IyYiNVlTMknzaon2YiHISU0dTlOxutk=;
        b=jZlBQ/8fyXvONycGGT+4YSC623uWySysklgMcUa/UY8Ptk35hT5IodzF+5FsL0B2Pe
         OBbfVH4wD2zNxKXnjtM6ECIe9/nGKUCMiGuwdVG1Sae+hB8uDPi8ugFzk6JyHnm/VcHu
         zZDXsYLzZtNs8iyMB/HZtWeD5WqWSfjT5b/ALrvIvesFNrBy8Ty/ymtc4BGHdaBF1fBw
         wNPCmthP/GVqf9U7T7ZUtfazYeR0vRAOwPf9bOYUsVtk5Nt6PrdMDa/viQ5xbwvymHpd
         5MaRMEADPNnNzETBfkS7qfSIjgeWESUBlpQpXlu3//ErCBeCzzDXvdlXOMpESWQ2y5He
         VEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uHWUmlRsYoS8IyYiNVlTMknzaon2YiHISU0dTlOxutk=;
        b=ENqR7TE3MmsIozi7o6bbSVAn2GZcI8wqshZqbzgL1ICv/xOSIH3NHE3ByAttQoD14a
         RZq99uDxz1ItVAJ0IkFZg9CQ8GKT/CEwvMk5EaLthqpsumHFrnCd04jlCWJGNeo5p8c2
         SnaVgXJFeXWAofCH+cpCKtWwealLQM8r9CvthcVvzZw+LSs+PBo/7AlB8gBjId2Awalg
         9FqcvnEe2aorhKteUnZ9H4V9QG8E4fQ+yeJIsywdwz8FnsbpB+6ifbDicAj/3AuHMP7+
         pHhFXD5ZOKW3d5mfWzg95Wvvm/FZ2bh/ChZtVzZfo3uxTTC7SucXTveWI/fhr0egd7IM
         GZ/g==
X-Gm-Message-State: AOAM533s5hCBKt6u/qYZMrNJNugGAJDL+GAfmuyj0eKt1EbmpjlCBvZz
	d1BQKRDFx3GEJWR6EVb4534SHGoVrfAqDncaYgcJpScRzOo=
X-Google-Smtp-Source: 
 ABdhPJyGLxUlvsBzrKhEJhyYnMk2bO0Go42EZ+WLJz1bY0En6hj3iWsulHvP84ED4JfAlbvod6e4TUEQXoW+vsD0y40=
X-Received: by 2002:a05:6871:3d4:: with SMTP id
 a20mr656033oag.9.1643984609351;
 Fri, 04 Feb 2022 06:23:29 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAEhQi8=RL8Ngx3jH_qaPGQwpJ=vR8LD0D9vaT11-LN4dCcT-OA@mail.gmail.com>
 <1643984300490.3283050020.1432816834@optimcloud.com>
In-Reply-To: <1643984300490.3283050020.1432816834@optimcloud.com>
From: =?UTF-8?B?TcOlbnM=?= <mans.zigher@gmail.com>
Date: Fri, 4 Feb 2022 15:23:18 +0100
Message-ID: 
 <CAEhQi8mFNmsjymm6tsFCekZpJzXjbibkdHXA4f0KLP2FHZwnCg@mail.gmail.com>
Subject: Re: [meta-virtualization] Docker and GPLv3
To: Embedded Devel <yocto@optimcloud.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Feb 2022 14:23:30 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7044

Hi,

Well, does GPLv3 not require that a customer should be able to build
the GPLv3 like bash and deploy it to the target? It is not directly
secure-boot but the customer has a boot up sequence that starts with
secure boot and then the rootfs needs to be signed. So it would not be
possible to open up the device to allow a customer to deploy his own
version of bash on the target. But I might have misunderstood GPLv3. I
am not an expert.

BR
M=C3=A5ns Zigher

Den fre 4 feb. 2022 kl 15:19 skrev Embedded Devel <yocto@optimcloud.com>:
>
>
>
> On Friday 04 February 2022 15:53:42 PM (+07:00), Mans Zigher wrote:
>
> > Hi,
> >
> > A client of mine wants to have docker on it's product and they are
> > having secure boot enabled which prevents us from having any GPLv3
> > licensed code on the target.
> Okay, wait, why does enabling secure-boot prevent including GPLv3 package=
s??
> Ive never heard this before.

