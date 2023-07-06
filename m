Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC1BEB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 03:55:27 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.14139.1688615718773609764
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 05 Jul 2023 20:55:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZzFpjRUQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-765942d497fso33805385a.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Jul 2023 20:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688615718; x=1691207718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0idYXazgX2wgq15Ftd+rTeVpxZoNn3P2gxvA3kjoEZk=;
        b=ZzFpjRUQ7aZqcX/RngGipDgfSnZmlL3vQ8Ksp/MNiEiHteDn4m+Cynhx7ZP8IHPh31
         DJaC0h122qCdxfQZROQVitQi+YoHjmNdb7GWjR2+6ic/s2k+e0aPWV3giLjTzTVxSS4Q
         LFqJ6DV7BnTRZonx0kI8eHr9+H9+qVjKx3jwUbl2VX/u3c+6m5Dy+q5mhUy8pRQmRezM
         6X6C39GJnNO+3Xe52zxwlgdifvOFUrBrysgIMovnDVVbymJfi5hiDOy6yTdHBwxZC3LM
         N8cMWclVDiRfOC+XS4BGo/MtIL9+3i7pgtuBi7hlXeJPePpXQMhbZET/BttyQUuIF8xo
         7QAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688615718; x=1691207718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0idYXazgX2wgq15Ftd+rTeVpxZoNn3P2gxvA3kjoEZk=;
        b=JAgJxwJoWVDXhpIvyJ4+JuPVDIX+wg8/x/KmoMtEfOeGojffK6mUG/jjRiEAgAa1mO
         l12l0jYcoj5mKZdetMMuc52D69BPBLToV5Ag0S9NeuH0RLuwFjbR+QAT4MmeieCfShrF
         MpMUfCdu3Tp03bb7ePc6ZUAl9a/hMwrHgtoGr1Or/+PNkoXp//qOE5xvAQxXH9eWtqVC
         xuOiJ0WOFEN74jDnISw3MtmGVQMya3tGRG5GPplcWO6nHyvBYbdoxSWNl74ykLABRRGt
         D5ZKiffuq9qUkMDVOMse8HykTU24CdVhhFzwL08Nifigv7aBuhwC29m5Xth9qNHslMZy
         N+cg==
X-Gm-Message-State: ABy/qLZrALwRgTeUEmv6vLAuxOkIws8+XSVMX8ZrojIzeCJDg1xBqW7p
	tIrsf9KsHjXPpYCio265m0A=
X-Google-Smtp-Source: APBJJlHlPMDrEB7Oc1B6zimdNC4SQI0qRgq6weAt0pmGLAM1KfoAgbN13pxKXJpBaw1vk8Pl6l9eZQ==
X-Received: by 2002:a0c:f0d0:0:b0:636:39ed:4dd3 with SMTP id d16-20020a0cf0d0000000b0063639ed4dd3mr506811qvl.39.1688615717806;
        Wed, 05 Jul 2023 20:55:17 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id k1-20020a0cf581000000b00630164a9992sm346959qvm.73.2023.07.05.20.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 20:55:17 -0700 (PDT)
Date: Wed, 5 Jul 2023 23:55:15 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Henry Wang <Henry.Wang@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, Wei Chen <wei.chen@arm.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Diego Sueiro <diego.sueiro@arm.com>,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [mickledore][PATCH 0/2] Use linux-yocto 6.1 for RPi4 in
 mickledore
Message-ID: <ZKY7I4884rY7gO6u@gmail.com>
References: <20230704112952.721002-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704112952.721002-1-Henry.Wang@arm.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Jul 2023 03:55:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8119

In message: [mickledore][PATCH 0/2] Use linux-yocto 6.1 for RPi4 in mickledore
on 04/07/2023 Henry Wang wrote:

> This series is the original commits on master branch rebased on top
> of mickledore. Sending to mickledore to make the RPi4 use linux-yocto 6.1.

The changes look ok to me, but for mickledore, there's no reason
to drop the 5.15 bbappend, we only removed it in master due to
gcc-13 issues, it is still a valid kernel target in mickledore.

So I've merged all but the bbappend drop.

Bruce

> 
> I've verified latest Xen hypervisor with these patches can boot
> linux-yocto 6.1 as Dom0 and all our internal Xen test cases passed.
> 
> Christopher Clark (1):
>   rpi, xen, linux-yocto: enable linux-yocto 6.1 for RPi4
> 
> Martin Jansa (1):
>   rpi: linux-yocto: drop 5.15 bbappend
> 
>  .../{linux-yocto_5.15.bbappend => linux-yocto_6.1.bbappend}   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename dynamic-layers/raspberrypi/recipes-kernel/linux/{linux-yocto_5.15.bbappend => linux-yocto_6.1.bbappend} (51%)
> 
> -- 
> 2.25.1
> 

