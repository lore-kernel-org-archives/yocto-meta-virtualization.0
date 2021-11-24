Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web08.4664.1637791395750043109
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Nov 2021 14:03:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FzKAAqnL;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id t83so5436744qke.8
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Nov 2021 14:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=4JP5OtMXDOQZqRlQHpqvq459PCZMgAZd1nzUibgZzxE=;
        b=FzKAAqnLAYtZU7kguG+AYQ26dNqjkES+OYj+WYc1WxEkSarf1MGHC9ztcvn4G0UxR2
         xql90DCK0jw5c00xJ0QFty+N1i2fSaBHRjpqjt/Zio2lrbBgQ+tjJU7O6QjEtue2wVSG
         zr3OFcLDxD+dWatRE/PwhR7Pv8JU8/Vqn9mFsJphcKGQa7VfKfNtckkaummeWl3D/7FA
         bpG1vz6emFNY8rWddICKx7e1ugpOn7Rtle+xMjZk/VWVUEhLAGMSRCTPT293zQuFTU4V
         5N7ecyYVWQW2m2MNdrojiCmmdgLuLrTV2uUkGVP1RB/Iz9OPY2AsNluysS1MD35fY8m1
         XzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4JP5OtMXDOQZqRlQHpqvq459PCZMgAZd1nzUibgZzxE=;
        b=yX3BA1OhQKs0KiTNcvBtCEoeWeXySBZZwy33/n6YZBIp1pKD8emcAamWSxfDv4j0O1
         5yBPqWnrEQsSJ8On9AugKNK733aA0D9AR3HoaFXlvhQ3S+JnWYlbPDYhR8LDQpAIBozq
         ll6ao/OXGmxNdrFyirD38WD8ByDwxwNIhvmWUSOnvwE31M1Cap+XctHQA5BZ2M4RSCQi
         E70J8SQL6XyYI98kPJfeR6HFGlqj0p+H1n8t6eBZZhe5eVxkD0rqPgumLaY0O6pOpR9D
         5tnyMeIGRkj1gja9gE6CplsDNSHAYQD2mqVpUJNRZ1BUDKbPfsb6nCA8SW8ohRSH2DwX
         ZyhQ==
X-Gm-Message-State: AOAM532i54XdhVjNp1Emwh/w4tzBck4nDisB5Myfan7DnsFEUl9EWzKt
	3Tftfg0qqR6iml2Lvht5hfQYX8jvEl9Dhw==
X-Google-Smtp-Source: ABdhPJz0r2i1rT0R9dV6IrI4jymeL7y2o0x4h0j5NmsS2OoYZh0ROuFAh03Pg6pvUBtWW6mzKSXWSQ==
X-Received: by 2002:a05:620a:a47:: with SMTP id j7mr9668078qka.439.1637791394832;
        Wed, 24 Nov 2021 14:03:14 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id v21sm564683qta.0.2021.11.24.14.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 14:03:14 -0800 (PST)
Date: Wed, 24 Nov 2021 17:03:12 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [meta-cloud-services][PATCH 1/3] openstack-image-compute: fix warning of operator append combined with +=
Message-ID: <20211124220312.GB41710@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20211120041652.583066-3-yi.zhao@windriver.com>
 <20211120041652.583066-2-yi.zhao@windriver.com>
 <20211120041652.583066-1-yi.zhao@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [meta-cloud-services][PATCH 1/3] openstack-image-compute: fix warning of operator append combined with +=
on 20/11/2021 Yi Zhao wrote:

> Fixes:
> WARNING: openstack-image-compute.bb: IMAGE_ROOTFS_EXTRA_SPACE:append +=
> is not a recommended operator combination, please replace it.
> 
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../recipes-extended/images/openstack-image-compute.bb          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-openstack/recipes-extended/images/openstack-image-compute.bb b/meta-openstack/recipes-extended/images/openstack-image-compute.bb
> index 15726fd..a725e2e 100644
> --- a/meta-openstack/recipes-extended/images/openstack-image-compute.bb
> +++ b/meta-openstack/recipes-extended/images/openstack-image-compute.bb
> @@ -19,6 +19,6 @@ inherit monitor
>  
>  # Ensure extra space for guest images, and rabbit MQ has a hard coded
>  # check for 2G of free space, so we use 3G as a starting point.
> -IMAGE_ROOTFS_EXTRA_SPACE:append += "+ 3000000"
> +IMAGE_ROOTFS_EXTRA_SPACE:append = " + 3000000"
>  
>  # ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ; "
> -- 
> 2.25.1
> 

> 
> 
> 


