Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.9961.1612877063392561179
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Feb 2021 05:24:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hbOj3+hU;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 6E9CF38C06BE
	for <meta-virtualization@yoctoproject.org>; Tue,  9 Feb 2021 13:24:22 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id p6so2615222qvm.12
        for <meta-virtualization@yoctoproject.org>; Tue, 09 Feb 2021 05:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=G5eetnPbiiuCRdl2uZbo106BYoIVl3xEi5agJPN2nPI=;
        b=hbOj3+hUuCogoX2q+b+2j+YbDRsAt8PlVbOEEoZUCcyyl4DZmkXfOl+ZAmxprKy9hP
         ESVh46Pni7Rgeww02cOSLtZXnsB8PqgIQ/oTeZEHWAFhYsNIgUkj3Xn3rOFW5v0j6Zfl
         IOxStz7PsmPlucTw0t4iRxa5r6YVe4LKCbrcFmBoK5clixZBXIZFImI39mCiFGLeXJFh
         GOBSQ6WbSNviG5BSDe1H6YgS/2MTpsieZCkFgqs227+Nugd4PZsAUtxr2A8m4mdweqbb
         C3DvucVPIp+d56vq2uczkztihwUhiobXyRD2Ku+cCR5H6j9Y60GXwXkTS3oNvG6ZcU2O
         c4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=G5eetnPbiiuCRdl2uZbo106BYoIVl3xEi5agJPN2nPI=;
        b=AuHOZrHLNhB56iTXksPRrgqDSR0+2lFfjzu0cTHpdKZOem7NEg34xGV4YAwVrN1nKI
         jsPZ00PughKBVptFUOIsJUvfw7gOVZkOK6h5hjdOVfirhbunu6tu4l5LEwp/YS1Z4O71
         R0zL4suMwzp8WW8AFidKgYmVodrT68rc+FwaKdIqaiE34jw9RheE2JECNwbJzNFFWQuF
         YWt2aBAVqybbNfGg6TGUo3JobWIR5p/6LI4PFdrkudF33rw4+XQuM9ff1ukrMvU/7YCh
         5NIfr5tSy1FuiRZ4zKYRsD8KoHhO17Vi8cBS7BqPQmswwbDSucjwa4le0y/stC1sK9ol
         4XLw==
X-Gm-Message-State: AOAM533wDJZDdbhcc8wkXiDEKbyVS/x2rLIEyYEMRpfIWsJjLiX1oVf6
	oW7JVAXwTarag4gmkaORx08FBwO+/o3aNz4x
X-Google-Smtp-Source: ABdhPJz0VKSnL6VS0Yq4/id5YGrEOFn1J0wz7eAtrrZgNyXXyaHoe0Qepj0MZ8LBFZLivXtbeZvZnQ==
X-Received: by 2002:ad4:4dc5:: with SMTP id cw5mr5613207qvb.5.1612877060911;
        Tue, 09 Feb 2021 05:24:20 -0800 (PST)
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id w143sm19009402qka.58.2021.02.09.05.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 05:24:20 -0800 (PST)
Date: Tue, 9 Feb 2021 08:24:18 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-keyring: upgrade 21.8.0 -> 22.0.1
Message-ID: <20210209132416.GA44948@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1612492185-33353-3-git-send-email-wangmy@cn.fujitsu.com>
 <1612492185-33353-4-git-send-email-wangmy@cn.fujitsu.com>
 <1612492185-33353-2-git-send-email-wangmy@cn.fujitsu.com>
 <1612492185-33353-5-git-send-email-wangmy@cn.fujitsu.com>
 <1612492185-33353-1-git-send-email-wangmy@cn.fujitsu.com>
 <1612492349-33410-1-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python3-keyring: upgrade 21.8.0 -> 22.0.1
on 05/02/2021 Wang Mingyu wrote:

> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../{python3-keyring_21.8.0.bb => python3-keyring_22.0.1.bb}  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python3-keyring_21.8.0.bb => python3-keyring_22.0.1.bb} (74%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python3-keyring_21.8.0.bb b/meta-openstack/recipes-devtools/python/python3-keyring_22.0.1.bb
> similarity index 74%
> rename from meta-openstack/recipes-devtools/python/python3-keyring_21.8.0.bb
> rename to meta-openstack/recipes-devtools/python/python3-keyring_22.0.1.bb
> index b81172e8..1eba7f64 100644
> --- a/meta-openstack/recipes-devtools/python/python3-keyring_21.8.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-keyring_22.0.1.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
>  
> -SRC_URI[md5sum] = "08913a578efc485bd5763822234d27c6"
> -SRC_URI[sha256sum] = "1746d3ac913d449a090caf11e9e4af00e26c3f7f7e81027872192b2398b98675"
> +SRC_URI[md5sum] = "88e1607f9f40b82ab9e28529eec3edbc"
> +SRC_URI[sha256sum] = "9acb3e1452edbb7544822b12fd25459078769e560fa51f418b6d00afaa6178df"
>  
>  inherit setuptools3 pypi
>  
> -- 
> 2.25.1
> 
> 
> 

> 
> 
> 


