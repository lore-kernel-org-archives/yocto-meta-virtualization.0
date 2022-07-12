Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7D6C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 21:16:31 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web12.14708.1657660583150682029
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Jul 2022 14:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eC3+tAOh;
 spf=pass (domain: gmail.com, ip: 209.85.216.41,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 t5-20020a17090a6a0500b001ef965b262eso330075pjj.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Jul 2022 14:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0+jxo2Im+onh0m02rW/zFsR+4u02/oh44cvkWbHuIWQ=;
        b=eC3+tAOhQ9q43TTxPOokWp8j1z4ABr6AozrxDnHqHu7nAjDG0xkT3sZz3iM06cuGmr
         EytffmBFQyVf4a6TuyeOS1P5OBYWS2CqNU0o/jHHfvEh/ADYkpXIoxOiU/HRObZyFISk
         T6nK9HTLc8u0dLrAmSAhidXLWI6IVGm/dEu1kaqkdh25Azf9la6/eOSiGHbKVl/EJEXf
         hYdeFDuTZo4ILULAlGLA0aA75C2DOxDZsq0A0NceDL0ZH6Kh5x09c7rCHRlRwYTg9A+L
         xoGw15sOlG1gEVsnwoPGd79L1DViCnr7+ikRMlXpmk8Q8hAptGt/+y6Qo2cx4hNaRuD/
         78Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0+jxo2Im+onh0m02rW/zFsR+4u02/oh44cvkWbHuIWQ=;
        b=C6L+hVOoDPffijIExrZ8iebpkCwWob52Q3KPJX0EQaVAnRezN9yZ1HCoiFmOFlm634
         /Ix/KEF1pHWlwjCnGXjcwHB7Ma8KexsBFN+mFA47ifnv/8+AP3Kiu+b8lcuHjpLM98Rj
         nNsssfDhtgO88oQCUIs5VrusKYNRFPo4PqsNCBy2ZAuaDtKZ0cnz42qpXs6PLBEkD79m
         wdN7L88l4OWo7E6mUFwZDb74BKqNsKSNEqp1foYKuCImek/FfNDU5p5tTfRhzCF1kmFD
         OlN9pWpbcF3UTxMSuTyvOHFX2zZlo78rAxwRmvTNXpSAabiagaAJTZunNqqr45a/vjHy
         idlQ==
X-Gm-Message-State: AJIora/fwzAljO2xfacqJGlvyOCVBDifSTpfMZNGNG56HCo0so1AR60D
	2YiyER27ueeZ8Bs7tSY2WnNdH2Kszr6rw/ySYE4=
X-Google-Smtp-Source: 
 AGRyM1u3AyDoJlgKjYb5N5CUtiHJWJgwCR0Z+jWgaW6p5UdCJRdJ3+vLO/5Z9UlcCR4wlSmySek8GIiZg512mL+nWOw=
X-Received: by 2002:a17:90a:2e03:b0:1ed:2cd5:6c4e with SMTP id
 q3-20020a17090a2e0300b001ed2cd56c4emr119839pjd.225.1657660582522; Tue, 12 Jul
 2022 14:16:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220712122647.12746-1-vasileios.anagnostopoulos@siemens.com>
 <20220712122647.12746-3-vasileios.anagnostopoulos@siemens.com>
In-Reply-To: <20220712122647.12746-3-vasileios.anagnostopoulos@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 12 Jul 2022 17:16:10 -0400
Message-ID: 
 <CADkTA4PZ6rMBUAF1Q23C6ov9OzjByCjvDQ+dMMxumyJL2fzaUg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 3/3] image-oci-umoci: skip parent
 directory in tar
To: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Jul 2022 21:16:31 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7450

On Tue, Jul 12, 2022 at 8:27 AM Vasileios Anagnostopoulos
<vasileios.anagnostopoulos@siemens.com> wrote:
>
> Skip the inclusion of the parent directory in the tar file.
> Most tools expect a tar file without it. An example of this
> use case is skopeo, where the skopeo copy oci-archive command
> will not work with the generate tar file.

The tar file was never actually intended to be used in that way, hence
why the directory is maintained.  It is just there for easier
transport of the oci image directory, and the existing workflow is
that multiple of these are copied and untar'd .. with this, they'll
clobber each other and break.

We could potentially create a new mode to support this .. I need to
think on it a bit more first.

Bruce

>
> Signed-off-by: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
> ---
>  classes/image-oci-umoci.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
> index f941795..771f288 100644
> --- a/classes/image-oci-umoci.inc
> +++ b/classes/image-oci-umoci.inc
> @@ -107,7 +107,7 @@ IMAGE_CMD:oci() {
>
>      # make a tar version of the image direcotry
>      if [ -n "${OCI_IMAGE_TAR_OUTPUT}" ]; then
> -       tar -cf "$image_name.tar" "$image_name"
> +       tar -cf "$image_name.tar" -C "$image_name" .
>      fi
>
>      # We could make this optional, since the bundle is directly runnable via runc
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7443): https://lists.yoctoproject.org/g/meta-virtualization/message/7443
> Mute This Topic: https://lists.yoctoproject.org/mt/92331697/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

