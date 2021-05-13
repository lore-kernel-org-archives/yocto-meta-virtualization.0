Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web08.1362.1620925919552808036
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 13 May 2021 10:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pQBkBNgE;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id n184so25916043oia.12
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 13 May 2021 10:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4VkYuoWzU4J2TIbyDytqCFLihudAeVaKhGu/uCQSAzk=;
        b=pQBkBNgEYMs6e5pvijGQs4WqDPgSxBVBHnCDwYSgl8xEF3vOZu1wp1ODldNKid9K+v
         pNdfHMIOVo9fBmJ/7O369Vf19yoSPSc2iMNaziVAZgfP6DxhSEC6uwA74mLS8iw5rYMx
         b0upKp9y2f+2fAWbKvAdfOnkRS7EQKkPOSr53g2OglU6I56IBX3WEmvMXFeybOojET2Q
         8CImHQlCs8TV6Wj76VxfL+wsTw8O6rS3CnRvqLiMHNQ4jyTzg4Zvq2g2mnCxH1+CuRwl
         p5PaXOmFnMANipNSJPvHw48ae775MHGhEroFIwTo3Op1xx3UKDlzygRuMk64WVhbymXG
         WZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4VkYuoWzU4J2TIbyDytqCFLihudAeVaKhGu/uCQSAzk=;
        b=dNnxY8eN55/bkoQ0KfX2b9czXI+HAZr5qN5oWZWRcCQcGGZVLIjkgcU6FdnCENPcR6
         d9Sl2ntCS7joQ5QxsCG4245payaTQr7Mo+yQXKapfbcm4RCn1tT5CA+QuNvcDY6P758z
         ztehUXVNl9BlCaqkGQW+rxTLufdeclkw54X+1Fy8KB+3CXQLKF5yJp2LAJIo6cGs4jg3
         0PePdnyEGSXuuSVhQkk04PfJMAAYofil11BTXSAVFJ2BK0tgDTy7VOjjlnVsUsNH/drQ
         B9r12zusLcTMj8xoiJDOc59iYWmIUD2imy9exfXNyxGBC7dmpvQefgwgx5K/ReIIt103
         h1RA==
X-Gm-Message-State: AOAM5317gjRbF2p4dlSZ/YBReSlhBHWamLZy+iwZLGSsleaRT3oSguXR
	gTEMuZ0h35/yMItKZA6R97Ev9zA2iCVCbiZb/yE=
X-Google-Smtp-Source: ABdhPJyqjizvJBleZ0WDpG8kpEy15rzK5hFWPzRBYIF8iH6JhBIXMb91HtoYiRzLQ/uZGsnwXorosXFm7h/wa5ir6rc=
X-Received: by 2002:a05:6808:193:: with SMTP id w19mr14458959oic.152.1620925918891;
 Thu, 13 May 2021 10:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210513155812.3905140-1-richard.neill@arm.com>
In-Reply-To: <20210513155812.3905140-1-richard.neill@arm.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Thu, 13 May 2021 10:11:46 -0700
Message-ID: <CACMJ4GYdOzumXJQ5kTAGcMPpdYpfRtiQSzz=qqw5DKEUjkBpZg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] xen, rpi4: fix typo in raspberrypi dynamic-layers inclusion
To: Richard Neill <richard.neill@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 13, 2021 at 8:57 AM Richard Neill <richard.neill@arm.com> wrote:
>
> Signed-off-by: Richard Neill <richard.neill@arm.com>

Thanks, Richard - I appreciate the find and fix.

Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>

Christopher

> ---
>  conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index f1f468b..b3e5283 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -13,7 +13,7 @@ LICENSE_PATH += "${LAYERDIR}/files/custom-licenses"
>
>  BBFILES_DYNAMIC += " \
>      raspberrypi:${LAYERDIR}/dynamic-layers/raspberrypi/*/*/*.bb \
> -    raspberrypi:${LAYERDIR}/dynamic-layers/rasbperrypi/*/*/*.bbappend \
> +    raspberrypi:${LAYERDIR}/dynamic-layers/raspberrypi/*/*/*.bbappend \
>      xilinx:${LAYERDIR}/dynamic-layers/xilinx/*/*/*.bb \
>      xilinx:${LAYERDIR}/dynamic-layers/xilinx/*/*/*.bbappend \
>  "
> --
> 2.25.1
>
>
> 
>
