Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web08.9297.1630076029250055408
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 27 Aug 2021 07:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XzPE+Aza;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id e3so5500307qth.9
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 27 Aug 2021 07:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SBYvhpLIKyLJq2VeVUlAjEMIqhFFnwMGpxldIuSWQyE=;
        b=XzPE+Azaqoj/LDC0DV8rNDyAGRbdeiZIgJ6S0pz4tueWGK8cri/aYKnKDOq6K2HgAh
         UDgLySLH5vIQkrQ2aNBP2aXg7DhhB6WM8QvpYvgBBHELd1dzDWZ1kJpuzKzDJ5ZcBvp0
         6LKa3tDbkfoOSTVpD+H3NCDIIn3vIX9KtFG+KWPEOFZ55uJjUxuMx3GR4H+iGH773pFk
         kBtj6bsMZN8bgFHFtg57njTBFpSWu7Wgzx3G+RYPgTnYmdz7Yj3QSgyzePJANlwq/VN2
         j7W53TxDGlhZOq3h7lk+uRIUiZG2CSUujVK2izke6EK3IA6a7QBl7YFH0eq4sqAMcbF5
         VGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SBYvhpLIKyLJq2VeVUlAjEMIqhFFnwMGpxldIuSWQyE=;
        b=ceW4HBkx4fiDajX40xRSsTl4lWQGe+CiS9EDtrExOVwUe5mhq6/lZ+K2kJjCgAKnme
         ZoreQVXkcTGW0X5ebmpIxhd65mLtyyWNj4b2pVkZFYhN3wnKECV4N9ZyLfNKd+r0yhbB
         7Wh3bfW4obK3Mq+oThUqHt7Nqwz0T/HUc1jXj+uMddZxBcoKmBUDu/5/DXJHdZ85dayw
         gnFBp/Wo0+u868C8tDbi7b3OGfMb+kMG5+AQAnBz/T6bcVzm481JXlpvK+YxbwKjdkRr
         m4iIKsTjeTJ2e1WVVFliIEBVKCVGV0rDZXjXS4/+DZP5oEIDoH/EK4tmV8DAD3NOZYc5
         /gTQ==
X-Gm-Message-State: AOAM530hY9Nd27oSgHHkhrmRoeMHNxXqVoYOQ9c+sI4ltAebUKI0Sil9
	tlSaUlvl/+eeIPcZIeMmLRdMjs7idtbneA==
X-Google-Smtp-Source: ABdhPJza/Cdi1tcXoFEBV2gJAfePi2UctwQ1FBmnKFYCPgagHzSp5oigx1DYo4AwfTJ3Jb+IsoGPiw==
X-Received: by 2002:ac8:59c4:: with SMTP id f4mr8647781qtf.334.1630076028330;
        Fri, 27 Aug 2021 07:53:48 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id i16sm3652928qtq.52.2021.08.27.07.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 07:53:47 -0700 (PDT)
Date: Fri, 27 Aug 2021 10:53:46 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Alex Stewart <alex.stewart@ni.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][m-c-s][PATCH 1/2] salt: correct LICENSE md5sum
Message-ID: <20210827145343.GA23990@gmail.com>
References: <20210823191932.2555152-1-alex.stewart@ni.com>
MIME-Version: 1.0
In-Reply-To: <20210823191932.2555152-1-alex.stewart@ni.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks for the fixes, these are now merged.

Bruce

In message: [meta-virtualization][m-c-s][PATCH 1/2] salt: correct LICENSE md5sum
on 23/08/2021 Alex Stewart wrote:

> The md5sum "ac9a49d8..." has never been a salt LICENSE file hashsum.
> Salt_3001 verification therefore fails after fetch.
> 
> Set the LICENSE file hashsum to the correct value as of salt upstream
> commit a1d07e9cc5d84895468bf360390754c4d68308d9 - which services salt
> 3001.
> 
> Signed-off-by: Alex Stewart <alex.stewart@ni.com>
> ---
>  meta-openstack/recipes-support/salt/salt_3001.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-openstack/recipes-support/salt/salt_3001.1.bb b/meta-openstack/recipes-support/salt/salt_3001.1.bb
> index 9b485d699b5e01ed287256b96e33249e98b02ae0..c789ab94c44bb6fd8713f15174b4ffa91a173e47 100644
> --- a/meta-openstack/recipes-support/salt/salt_3001.1.bb
> +++ b/meta-openstack/recipes-support/salt/salt_3001.1.bb
> @@ -1,7 +1,7 @@
>  HOMEPAGE = "http://saltstack.com/"
>  SECTION = "admin"
>  LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=89aea4e17d99a7cacdbeed46a0096b10"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=ac9a49d86925151327b277d6a3999a07"
>  DEPENDS = "\
>             python3-msgpack \
>             python3-pyyaml \
> -- 
> 2.32.0
> 

> 
> 
> 

