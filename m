Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.7641.1618368670353225828
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 19:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TpbN5VwB;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 7BA2738C0109
	for <meta-virtualization@yoctoproject.org>; Wed, 14 Apr 2021 02:51:09 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id o5so20148629qkb.0
        for <meta-virtualization@yoctoproject.org>; Tue, 13 Apr 2021 19:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AMzryqF54TmQuFDq2w3Uvfx1vpD33m1Y4IIILSimfY8=;
        b=TpbN5VwBQbD/5V3XgpLOgVZdHOLLmFcy4ZTpGKyaXfghNnY1SDHhMDExeRNlHrtEGa
         Oxwa70C0hwaXa0rEscKeZcalN9f/BHwwNs6mhBcvllDlMqF3wpkuOJwlml9wC7NNGPTN
         NjiBwJAmOWWW+hMO/CElK9lKFrOjwDoIInn/oTvXcka7gBVJMmiUUD09HCimzCXz7kit
         2UbLsIZjScnfaajasB79FSHiE9mHvm2oYozYy0HUNeoeuP09gAohCgld5+BEIDP3o0tp
         gl+K5WL9niscTl/q2tIwFwZP/c3m4pfJFI+PtBXPJHIiUKbk/Ex6TMOmHjY2pmwNZ0GD
         loJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AMzryqF54TmQuFDq2w3Uvfx1vpD33m1Y4IIILSimfY8=;
        b=doajtF5qxO1cmvqjl4hM+TLxH20m8+zCrrPXlHb7VFp0N/5nnt6bEInA+OTU/N/LmY
         Pnp5Xd/m19hvOl5p06srqQAK4w5RLGgDRYHsxUUpVzorQHNCPcBjxenY7OhZ6o8Hu5p0
         7ZY/9y2QG0hMwM9G0Q1PwJMHAVWMn49Y1ihER3rzGCKVkKblaSJttQEo8L2VrKa6DIZv
         OWc/6XeqKlIx64z9iJKsOUirztpoDsHzasA86M4pJQVv5UmVL22sQwqGYFHJuUG1x9zY
         gUa2BoJP1CClQ/dMB7P0a0mY8aJRp8xWcqxiy03Sk8JeEmZesLz07vNm0GIKMbwOZIQ+
         tv/A==
X-Gm-Message-State: AOAM530aAIWkTbZAGBZQ3sjZdSjMtjqr5wB1io4hFMCu0DjmIUtQAiLa
	AR4D0tql7aEmADD2C2i/oZE=
X-Google-Smtp-Source: ABdhPJxw4jaKTDja28pDwGdR/2JQWdfNJdAoBQQMkA4CRTDTkMXEn+iCwEUhC/mkdeOkSE36edniew==
X-Received: by 2002:ae9:f713:: with SMTP id s19mr16570382qkg.208.1618368668498;
        Tue, 13 Apr 2021 19:51:08 -0700 (PDT)
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id i7sm2879117qki.72.2021.04.13.19.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 19:51:08 -0700 (PDT)
Date: Tue, 13 Apr 2021 22:51:06 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] novnc: Correct LICENSE
Message-ID: <20210414025104.GA28408@gmail.com>
References: <1618334238-4306-1-git-send-email-zangrc.fnst@fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1618334238-4306-1-git-send-email-zangrc.fnst@fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] novnc: Correct LICENSE
on 14/04/2021 zangrc wrote:

> The LICENSE.txt file is described as follows:
> The default noVNC license is MPL-2.0.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
> ---
>  meta-openstack/recipes-extended/novnc/novnc_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-openstack/recipes-extended/novnc/novnc_git.bb b/meta-openstack/recipes-extended/novnc/novnc_git.bb
> index ee20e3b..7099d85 100644
> --- a/meta-openstack/recipes-extended/novnc/novnc_git.bb
> +++ b/meta-openstack/recipes-extended/novnc/novnc_git.bb
> @@ -4,7 +4,7 @@ SECTION = "web"
>  
>  PR = "r0"
>  
> -LICENSE = "MIT"
> +LICENSE = "MPL-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ac06308a999996ffc2d24d81b3a39f1b"
>  
>  SRCREV = "8f12ca7a5a64144fe548cada332d5d19ef26a1fe"
> -- 
> 2.25.1
> 

> 
> 
> 

