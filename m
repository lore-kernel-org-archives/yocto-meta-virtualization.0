Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31969C7EE29
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 13:46:44 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.49757.1685367969633739140
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 29 May 2023 06:46:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=bizpGb3D;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-75ce1196bd7so53267285a.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 29 May 2023 06:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685367998; x=1687959998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GM9py9Zw1QtjC9N1RNa56fNdWvQPwbFROx8wSx4ZYks=;
        b=bizpGb3DVA8dIoV4T42BiHYPiN9oB+dYhHeB3jCx7DnVEHHJqcIdQW31aX0Ciz9u/L
         qQ/IqjNwuBWplXnqWxghoHUdFTlfpdB191X6qHwxwF99hMqglZwKVhFnl4QTiR3T88RI
         o/IaLj27BehNVfbH5pbQ9BE8cvM6XPKKkbb6nCapxIEGb5J87JP0rlObpjspDPIJjzUJ
         Mj+wj4TZn9kiSlVRjbkFPzzwmdzvVBQrJXtASEu+RuxlCGO5+FyZVgfBTPs6762UVzmI
         nnIXqviEnQ5/yV9JFV0oReobXbEjip2KuRnhvcdh0BGt053cty7FjmlFSvds5pbE3xI6
         7poQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685367998; x=1687959998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GM9py9Zw1QtjC9N1RNa56fNdWvQPwbFROx8wSx4ZYks=;
        b=WAN3uLqgXy7EvrM2/iUBxpEV7bMTbiPcj1W+lMOt9+Im0XsW4o5l9CfoW/r+HtKJeW
         5AQwEm5T4Tas7nRDPj+JETr1GSdmCZa1xz5w//8t8jNeGky9eoVAnhkH9tyIQuI7Nr/7
         ucLDv+9pgsHTqCkFKGgM3wdYvCjPALRXoHz6egbTxIOqQ1oOgo0yeZ73HZAldZq9O6Wo
         T6aU6lhL2V+GXJJNISxxveW7N2/UyMkPLMgmSqWTmH1ZMYKJ6Mud5/9nYya9/hJxgGx0
         WauUpcvT+MJd9f3vNbV/aIp2xWOyx6Z35+V14qVYI6ZrolPpxcPRBWIfMUcmFIDDzRT5
         PmYw==
X-Gm-Message-State: AC+VfDwwdQgNOv44/MYkt24ui370vHo2F3xlFFCianWwtlohcwb7rl37
	/1pscVr6MlvNVefESI6iiuE=
X-Google-Smtp-Source: ACHHUZ5aZ4aFp17+kF4X1AjdxN46VGNL6G8PHDSjqWxZOguU+WjB40IkXgqvdiJx4LOOKU2ZZRNibA==
X-Received: by 2002:a05:620a:3d17:b0:75b:23a0:d9eb with SMTP id tq23-20020a05620a3d1700b0075b23a0d9ebmr6946349qkn.65.1685367998260;
        Mon, 29 May 2023 06:46:38 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id m11-20020ae9e70b000000b0075cecc90e95sm569722qka.90.2023.05.29.06.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 06:46:37 -0700 (PDT)
Date: Mon, 29 May 2023 09:46:36 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] rpi, xen, linux-yocto: enable
 linux-yocto 6.1 for RPi4
Message-ID: <ZHSsvM4jCZQQLnJz@gmail.com>
References: <20230527202706.1233092-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230527202706.1233092-1-christopher.w.clark@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 29 May 2023 13:46:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8086

merged.

Bruce

In message: [meta-virtualization][PATCH] rpi, xen, linux-yocto: enable linux-yocto 6.1 for RPi4
on 27/05/2023 Christopher Clark wrote:

> Added to the raspberrypi dynamic layer for use with Xen as
> the default preference for Linux kernel.
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> ---
>  .../recipes-kernel/linux/linux-yocto_6.1.bbappend           | 6 ++++++
>  1 file changed, 6 insertions(+)
>  create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.1.bbappend
> 
> diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.1.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.1.bbappend
> new file mode 100644
> index 0000000..dd7edea
> --- /dev/null
> +++ b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.1.bbappend
> @@ -0,0 +1,6 @@
> +# Enable use of the linux-yocto kernel for the Raspberry Pi 4
> +KBRANCH:raspberrypi4-64 ?= "v6.1/standard/bcm-2xxx-rpi"
> +KMACHINE:raspberrypi4-64 ?= "bcm-2xxx-rpi4"
> +COMPATIBLE_MACHINE:raspberrypi4-64 = "(raspberrypi4-64)"
> +
> +require linux-yocto_xen-rpi.inc
> -- 
> 2.25.1
> 

