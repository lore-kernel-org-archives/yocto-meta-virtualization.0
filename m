Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F88C43219
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 22:11:13 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web09.20071.1643235071698487163
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 14:11:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fbAYLFI5;
 spf=pass (domain: gmail.com, ip: 209.85.218.49,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id p15so1518449ejc.7
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 14:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3nG6z9IzUSP4auqlXLE0va4SQzWG1e0SAiwEn4BYAWY=;
        b=fbAYLFI5h3Fh5IIanKUBHgU5F+nxNBW0oAY1VHPSywR0SDe6FDRPBqIdckGRfdfgMJ
         iRJSU8rE52Heey4n7yhA7yAc5ISYkTD8WeBudh47rWn0dMo/ZpZ0UHzsS6GZqozrjYuZ
         6HXYHhW2v3ORvvPw+n28vcqx+OYCB0lTlAM28eqb86jk5TTvmSUt5JChq8mjN89Npseb
         1EULKG59XYtdlY0nWJ46fsXct//UGQmFjK+4r9xXkXcpYpZ/YaDziD28vRbZtzRTQ1E2
         k3YxAZ99DWu9We22fU+8MY2ANup9e5Q8Yac5UP9ixE+e5YG/1O8QRZJ0AYc0wmnuu3Ra
         Ki5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3nG6z9IzUSP4auqlXLE0va4SQzWG1e0SAiwEn4BYAWY=;
        b=6VbFnQBCutw+roo710qY85frPsUi7ZgbnPdXPwFGXE/OHdIPPfluwq3MpUBVqo5RSQ
         6GcytaoL7IpFm7Qvp2l/NJrK1NW1cIXnmCTsHGt9PNJ8LIwgznb3RtjS8IJDrBIJ1sxv
         krOzFYndwY4fafpJbyJaTeP6HWkRR1+RPC8MvpmBNP5jIfEbS5glBK9cZCO3snETzgWk
         oDoH/fxUjLiPhZdVGKTO4Rp/+lD2HpVblCqbB2SNuY+T7zXovsqLK6CQO8oTLc4oxl6C
         ajegPbdZkz533LJjR8d/62N11k0En3K9F9JXveWNgOxxENP/AUizCf2iBtvYb0xwZcQ5
         trnA==
X-Gm-Message-State: AOAM532x0OV2XC1JFC7s4rLqj1NeEhZF/h/gP7UjRNKlD93rAQfV6elS
	3ZFrqIPRWYqLRysPcEZ8gZXe+HoeAbJo71h0tAI=
X-Google-Smtp-Source: 
 ABdhPJwocE0skG/r+Wv6FXVakgiZ1jBO4M1dSvcS+HVLPizfBlK2mBHxiGLqyhzFjv3+VFILcehTiMzoFUpKp1Y6BXg=
X-Received: by 2002:a17:906:6a93:: with SMTP id
 p19mr574823ejr.711.1643235069997;
 Wed, 26 Jan 2022 14:11:09 -0800 (PST)
MIME-Version: 1.0
References: <20220125024825.15370-1-zhe.he@windriver.com>
In-Reply-To: <20220125024825.15370-1-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 26 Jan 2022 17:10:58 -0500
Message-ID: 
 <CADkTA4M1U=Hua0XwGs5sMZpSLn4z0Qj0GnbrRQWv0H1_JdxApg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] ovs: update to 2.15.3
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Jan 2022 22:11:13 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7034

OVS is one of the upgrades that has traditionally caused us issues.

Can we capture the shortlogs of the commits that are part of the update ?

And a log of the basic tests ? (if you search the mailing list
archives, you'll see examples of the tests we've run in the past ..
and yes, the tests should be in a ptest/automated format, but I've
never quite had time to do that).

Bruce

On Mon, Jan 24, 2022 at 9:48 PM He Zhe <zhe.he@windriver.com> wrote:
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  recipes-networking/openvswitch/openvswitch_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index 0fb7c132..4d413170 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -14,12 +14,12 @@ RDEPENDS:${PN}-ptest += "\
>         "
>
>  S = "${WORKDIR}/git"
> -PV = "2.15.1+${SRCPV}"
> -CVE_VERSION = "2.13.0"
> +PV = "2.15.3+${SRCPV}"
> +CVE_VERSION = "2.15.3"
>
>  FILESEXTRAPATHS:append := "${THISDIR}/${PN}-git:"
>
> -SRCREV = "f8274b78c3403591e84f3c2bbacf8c86920d68ba"
> +SRCREV = "e4d2df62e65a615e19f62e2fd294709be8d75cdc"
>  SRC_URI += "git://github.com/openvswitch/ovs.git;protocol=https;branch=branch-2.15 \
>              file://openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch \
>              file://run-ptest \
> --
> 2.17.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

