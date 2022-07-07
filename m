Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4181C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 13:18:54 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web09.5403.1657199932889853485
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 07 Jul 2022 06:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=afn/iIGr;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id j3so6677193pfb.6;
        Thu, 07 Jul 2022 06:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DJwISTVdbIbJW8cuQPmHWPoAzyieVnFYU0CFb8546xg=;
        b=afn/iIGr+6YrCeNmryOENl8A6VKa2wuU6oaKiroCHdJZ0ZoWz7Qo5vXKwErR9XLfJO
         hvAPFXlQys/DwVvoEiCv2BB90YVD0xNFkfnGJTqO60ROh0L30VpgRiP2lMnzCz+RBmpX
         gBitT/g+M8SGxo2TOJWR+kd0EGifBWpkZJZi2FRt9cUs5E7X61R5SHztJYMXQ6CjJCzv
         4uTLioKnxi/UWYYQF0TXoIMFVmujbSKEkHT4kGTJrAif5zQYZUlv36wUGGxBWnh68TiJ
         FztHnEFromieYETBNfK2blAa7/yWexN/cF4kwjDzrXIu2fW1Lqs8mEcK6TWPsIqCcLJz
         S6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DJwISTVdbIbJW8cuQPmHWPoAzyieVnFYU0CFb8546xg=;
        b=jple2QJKBDAdvhtuEL+l6IsYXqaidv/TROk5vWQbAgirv8d+R7IRdB8TXtcw5MADXw
         U1Yzec0kXGFlbjMqKIwMK6gzo+VBQT3cju+4yYx/0f5XEqi4aJieg3D47YQazc6Imt3/
         qn5Oxr9Valf1FoHe9LzV9BqKmb7XBEOoBSLc/G5+7im4vsxra6wWnCF9lFIf8btHxffQ
         JHjHMmk/YBNZ30+qo4rrrJFaH99rfmvYqnkoEBW74h9Xv4iw+PSKjCOtr/Zcwubq7JKg
         jNAjFVW2+9+Qw7xCWuQ5x96qMJNFkDK98pD9upJN4gNTwXW0hyy6jUqzohiGS/AyZcEc
         jYeA==
X-Gm-Message-State: AJIora+u8lm+7/8W5/mURbUcoN7G1amPj5qV1ew+Lz54yMgDYrWlajCz
	F86YPZIwhrxApCxvh+HEZyI+Wx8Sq+Lnbs3HwuM=
X-Google-Smtp-Source: 
 AGRyM1s3vOoKof8cG5479npHIFY5xEnc6BFf9CsxynCrZepRidHp/7QlaPNKoyvKklsrlJawhK+NyKzNYQnuLXnSCkI=
X-Received: by 2002:a17:902:b186:b0:16b:d762:6d81 with SMTP id
 s6-20020a170902b18600b0016bd7626d81mr28411402plr.88.1657199932083; Thu, 07
 Jul 2022 06:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <YsbcR39JGUL/D8uu@mail.local>
In-Reply-To: <YsbcR39JGUL/D8uu@mail.local>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 7 Jul 2022 09:18:40 -0400
Message-ID: 
 <CADkTA4Mhdnwy2sm9hBDZTeifP9mK2xktvKS7tPjxWHcmrK_6yA@mail.gmail.com>
Subject: Re: check-layer-nightly failure
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	swat <swat@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 07 Jul 2022 13:18:54 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7415

On Thu, Jul 7, 2022 at 9:14 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> Since python3-colorama got upgraded to 0.4.5 in meta-python,
> check-layer-nightly is failing for meta-virtualization:
>
> AssertionError: Adding layer meta-virtualization changed signatures.
> 23 signatures changed, initial differences (first hash before, second after):
>    python3-colorama:do_fetch: 0ac42383a6557a119738c7fda6a53a08837ffe2686b34f8fa5c2db83213bfe39 -> e2cfb137b2ed19476cbfba1402316e3433f7f03d1065fc8c74837ff631ff89c4
>       bitbake-diffsigs --task python3-colorama do_fetch --signature 0ac42383a6557a119738c7fda6a53a08837ffe2686b34f8fa5c2db83213bfe39 e2cfb137b2ed19476cbfba1402316e3433f7f03d1065fc8c74837ff631ff89c4
>       NOTE: Starting bitbake server...
>       Task dependencies changed from:
>       ['BPN', 'PN', 'PV', 'PYPI_ARCHIVE_NAME', 'PYPI_PACKAGE', 'PYPI_PACKAGE_EXT', 'PYPI_SRC_URI', 'SPECIAL_PKGSUFFIX', 'SRCREV', 'SRC_URI', 'SRC_URI[sha256sum]', 'base_do_fetch', 'do_fetch[network]', 'pypi_package', 'pypi_src_uri']
>       to:
>       ['BPN', 'PN', 'PV', 'PYPI_ARCHIVE_NAME', 'PYPI_PACKAGE', 'PYPI_PACKAGE_EXT', 'PYPI_SRC_URI', 'SPECIAL_PKGSUFFIX', 'SRCREV', 'SRC_URI', 'SRC_URI[md5sum]', 'SRC_URI[sha256sum]', 'base_do_fetch', 'do_fetch[network]', 'pypi_package', 'pypi_src_uri']
>       basehash changed from e3e476f44ff3905e371e1451a0e6e301baf5bdfb2f39c4140b75925fb331cd57 to 998a2a96caa4512c9c77acab928aa7246b2e1cecf44e59babf5fa94bcce4a413
>       List of dependencies for variable SRC_URI changed from '{'SRC_URI[sha256sum]', 'PYPI_SRC_URI'}' to '{'SRC_URI[md5sum]', 'SRC_URI[sha256sum]', 'PYPI_SRC_URI'}'
>       changed items: {'SRC_URI[md5sum]'}
>       Dependency on variable SRC_URI[md5sum] was added
>       Variable PV value changed from '0.4.5' to '0.4.4'
>       Variable SRC_URI[sha256sum] value changed from 'e6c6b4334fc50988a639d9b98aa429a0b57da6e17b9a44f0451f930b6967b7a4' to '5941b2b48a20143d2267e95b1c2a7603ce057ee39fd88e7329b0c292aa16869b'

docker-compose has a history of being sensitive to changes in this package.

Once again, I'll put on the record that we continue to ignore the lack
of an elegant way to deal with language layers and the insistence that
somehow the whole world of dependencies can align on one version of a
package.

I'll do a version bump this time, since it does look ok .. but I won't
be dropping the recipe from the layer, and I may have to just fork it
into a version specific package and handle the upgrade cadence in
meta-virtualization.

Bruce

>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

