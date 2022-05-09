Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E176C433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 17:39:33 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.341.1652117963289670059
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 May 2022 10:39:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NkYbfXkH;
 spf=pass (domain: gmail.com, ip: 209.85.219.181,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id j2so26355722ybu.0
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 May 2022 10:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0brpWLp4im2dpPLiqi6DuEW+WoQ54dcinmE/eSMOIms=;
        b=NkYbfXkHtwj5dmMam6xP8wPyB8QoEZn6+/iywdYv45StDV7c+S3cohAb8WfhassN0M
         Cn7VzVSsWez6JiKp9301wMaTlDb0FKHpSnaQ2b8W0+xw9GBzoBOkJsejUJs1sb9Atuw0
         jO4gBTaMCOdsRcGj1pZc/H0V6V97axb2lcJQrn8bieBakmD3qwjBwD5CPXSdnIIu6bQf
         n+1t7jqF1Ndl4EJx+heYi/ib2OyZ9FFmFRbyXD7sIIjOiEnYmNiYhtSzTpbByF5RXIe6
         WOKkGjJIby34aQiRpTJadYTfNTmrbvOs/xJgpEt1MLw30ta2vS8ZlleBW0sIjdSMACbb
         vljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0brpWLp4im2dpPLiqi6DuEW+WoQ54dcinmE/eSMOIms=;
        b=KZ0MfnFD31Owqda+G8uGShpn8dGROb0yF05ND2PWPNXsI7TLpNWbnr7llFlpOrX0wE
         GL2LtD151a50KUWNyrJI54YEonnxZCZalh+CdWeO21jjhhMxNTPZag+XYrFt5uLSNHoC
         ocr+ytd+hCP5ACTs8WZn8df9mq6cjwz1ASjKT1X0587u3pe81doby3LUPQT9Uqeu67T2
         wiECNkbNPRt9m+68sPHoKUOV6DsxiXN7kkCAe7/pd1Alk7O+VW4eifW/OgrOwfHMsdRO
         KFhhvoeqi2YE1rTtxq2xA+cLcNhGfRxodTHPmx7LOulkBK/04MXeRM5LY+lIv9Rx7aqy
         +Q2g==
X-Gm-Message-State: AOAM532QfCHU8ai0zBCXw3CM5QywB37LFhgfVos5jBU8twyy2pB5+03r
	vLFjIUt5JD57lN2kIrqjrQ43oBSbkoTqSH5ts4M=
X-Google-Smtp-Source: 
 ABdhPJzHvP8y3Pexm3tzED/3/mLxk57ORPqY6awLVxtqRMIMNkvEdi9S3rV67cfY6pD3D/Bju3ZJmjiiuYS59A5t5yA=
X-Received: by 2002:a05:6902:114c:b0:641:87a7:da90 with SMTP id
 p12-20020a056902114c00b0064187a7da90mr14646221ybu.561.1652117962486; Mon, 09
 May 2022 10:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220509170059.2751954-1-raj.khem@gmail.com>
 <20220509170059.2751954-2-raj.khem@gmail.com>
In-Reply-To: <20220509170059.2751954-2-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 9 May 2022 13:39:11 -0400
Message-ID: 
 <CADkTA4MK65k18-9xsd_LK49fSqP=KgTwaA0OBkNv0TYLAv=DnA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] seabios: Upgrade to 1.16 release
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 May 2022 17:39:33 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7268

merged.

Bruce

On Mon, May 9, 2022 at 1:01 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Pin to use gcc as compiler always
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  .../seabios/{seabios_1.14.0.bb => seabios_1.16.0.bb}       | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>  rename recipes-extended/seabios/{seabios_1.14.0.bb => seabios_1.16.0.bb} (87%)
>
> diff --git a/recipes-extended/seabios/seabios_1.14.0.bb b/recipes-extended/seabios/seabios_1.16.0.bb
> similarity index 87%
> rename from recipes-extended/seabios/seabios_1.14.0.bb
> rename to recipes-extended/seabios/seabios_1.16.0.bb
> index a090756..ebab54b 100644
> --- a/recipes-extended/seabios/seabios_1.14.0.bb
> +++ b/recipes-extended/seabios/seabios_1.16.0.bb
> @@ -15,9 +15,7 @@ S = "${WORKDIR}/${PN}-${PV}"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504         \
>                      file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6  \
>                      "
> -
> -SRC_URI[md5sum] = "9df3b7de6376850d09161137e7a9b61f"
> -SRC_URI[sha256sum] = "eb70cc62b29aa83e10a653233acebf4bb154d00d0c87dc2a2c6e2da75e5e81fd"
> +SRC_URI[sha256sum] = "d44d8e97ad56f3fd23ed3076077a770d37a5e7bae22daa59656ff41c3334fb34"
>
>  FILES:${PN} = "/usr/share/firmware"
>
> @@ -27,6 +25,9 @@ TUNE_CCARGS = ""
>  EXTRA_OEMAKE += "HOSTCC='${BUILD_CC}'"
>  EXTRA_OEMAKE += "CROSS_PREFIX=${TARGET_PREFIX}"
>
> +# Can not yet compile with clang e.g.
> +TOOLCHAIN = "gcc"
> +
>  COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
>
>  do_configure() {
> --
> 2.36.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

