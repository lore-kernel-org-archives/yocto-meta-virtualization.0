Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.29263.1610338601913324403
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 10 Jan 2021 20:16:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C6A5b0eR;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 5DD8738C06CD
	for <meta-virtualization@yoctoproject.org>; Mon, 11 Jan 2021 04:16:41 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id r17so17001252ilo.11
        for <meta-virtualization@yoctoproject.org>; Sun, 10 Jan 2021 20:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=YltxyxptQFTm0VDDqOx5gxy9YYcBwAq3o8v4cEvaJjY=;
        b=C6A5b0eRzj3C5geXdhrO5a/Y/qRzjpFUQ+k8cJ3PKioeMSOVvYwcSisXmCMf050Rl1
         liTGESFMU/3WT7YW9RxqSdZnMtY5PmPXGfYgVN8q8oWpf1+dSGwMLXJfW+QIRXb0i9we
         Ac6+uNivFchO5siuNHznEYU+dLK+nBN5ZXQ07KK2Zn9PW2EDnOaDHJqn3mETCqYWMt7j
         TfTCqT4yV2QqD8BnLdK984wk5HC4gFbNkRhTTJM6Qc3Yyxk6s9QGuuwxMTBPt/itAFp3
         WfS7O/ktMh5LF6t6bRy5THkq0sENlKhk6Se+zVVTZVwxJHn7JkBgA48O0SkJ9eLm9rR1
         kdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YltxyxptQFTm0VDDqOx5gxy9YYcBwAq3o8v4cEvaJjY=;
        b=HJAQZMuEj36gXhkxjM+yGCIMYXxWLsH2xt+p6fa7Lagc3YDhRxwwUH57nFqi/qJIlY
         UFhTkq2MOwG4qFZezN8A59Tid/mIHCNnnPBrwRJgI4c1UhVFVuaw2sPBy7q3bFhZCVy4
         OcBJUzIOYJplFCnbX55yAXkaln5EGnPwpJNcxZ+rdgOsQd7FrNi2j+TflDcWVnvoVoHC
         zyTH5mrekq9hixce0qnn9H73EFyZqfa396v36RMa1khCN4pwlIHfbumz+nrzb8o98xH5
         7SeYRqTw/13XDsrYs5BiJw32Ox9/JlwI89o2nVRsQ3a7zUrUKePhMmxMUaPNK+DK8du6
         pn7w==
X-Gm-Message-State: AOAM533zx3/I7Rwao118d0TitQtnmmKfQIXcnDhBNuAaKc/za1KNCWA8
	6UQzH8Cu2vpaXM/SrV99MKw=
X-Google-Smtp-Source: ABdhPJyh44sxCJdOMVvmKV7Uckfhie3bZe4ZQK1nEnyg+Y2mqTtAQh+8NOQdAz51CHXC6njHhInBpw==
X-Received: by 2002:a05:6e02:2142:: with SMTP id d2mr3686609ilv.142.1610338600639;
        Sun, 10 Jan 2021 20:16:40 -0800 (PST)
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id m18sm9996809ioy.44.2021.01.10.20.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 20:16:40 -0800 (PST)
Date: Sun, 10 Jan 2021 23:16:38 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-manilaclient: upgrade 2.3.0 -> 2.4.0
Message-ID: <20210111041637.GB26888@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1609832061-107932-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1609832089-107969-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1609832245-108034-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1609832257-108071-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python3-manilaclient: upgrade 2.3.0 -> 2.4.0
on 05/01/2021 zhengruoqin wrote:

> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  ...hon3-manilaclient_2.3.0.bb => python3-manilaclient_2.4.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-openstack/recipes-devtools/python/{python3-manilaclient_2.3.0.bb => python3-manilaclient_2.4.0.bb} (90%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python3-manilaclient_2.3.0.bb b/meta-openstack/recipes-devtools/python/python3-manilaclient_2.4.0.bb
> similarity index 90%
> rename from meta-openstack/recipes-devtools/python/python3-manilaclient_2.3.0.bb
> rename to meta-openstack/recipes-devtools/python/python3-manilaclient_2.4.0.bb
> index 78403c2d..c0a55210 100644
> --- a/meta-openstack/recipes-devtools/python/python3-manilaclient_2.3.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-manilaclient_2.4.0.bb
> @@ -4,7 +4,7 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=9edbbf5857ab51214ef0e8b79069bb07"
>  
> -SRC_URI[sha256sum] = "7b5b3215215a720ace08e53caca447a605dee9c8b3b3cfaa302b6bc7e63e4a28"
> +SRC_URI[sha256sum] = "e314cce0e1d2b92ff194dfa8e29bc67dd5703799a43abf7c323616ddb50d83c0"
>  
>  DEPENDS += " \
>          python3-pip \
> -- 
> 2.25.1
> 
> 
> 

> 
> 
> 


