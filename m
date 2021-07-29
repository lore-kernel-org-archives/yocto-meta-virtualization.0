Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.10739.1627570990244981615
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 29 Jul 2021 08:03:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OwsU4RP8;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d9so4105207qty.12
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Jul 2021 08:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=38v9IOI/UwgwSPjS9ZkhEA6EIUR4TtVf6LbCMt4EKdA=;
        b=OwsU4RP8IF7c7kuGWiDzrvjkX3t/TmUBDMVHQ03zOnkEmyfAEmP9rQwRRvkh0zDIZk
         E0ijMsxtKqxDjtBmzS+8J42Ys2JWub8ZWJEFAdLpHb1QBMCJONeiedh82j5I4FjURLTc
         Xh8TDX2EIFP+xZXhAKIVy9V4SbvVA/s65jVA5Ah48sMptCg0QjIlJUz+W/viVv3A9TRR
         irNRD0dVSHbJtxpnyxkLAby3M2igwKdYUwxR6akXtC5uSeNPDLvtwgD2lv1WVBlyJfhZ
         OKij0grhaNXtyC4i5UxpOXjVwChc84jko4pfB0ia75gvA1aluuOO1pZsx2bVBG6qA/FO
         02XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=38v9IOI/UwgwSPjS9ZkhEA6EIUR4TtVf6LbCMt4EKdA=;
        b=dU7oK3XZdAABMxhi9EQhEX3y5gnJDneRZ7jzR4g1YC2DegJ0Njjm+It2zUG/teca2K
         EjXpCQnvUROXd0awdC/BtT1KAa/DRNRUh503Wg5fJcpESCLv0n0Mab2FzV5zoIZrvrNS
         M8uW5+YTe10wfKHzgfXJb0iVsZ+Je0RbIpiHSgMxltA3i4ObWOpFG1kE2GrYF5J8B+8B
         QYwtDOBMC3bBSwrf8AZM9GW4GijKRkEtG7y8RvXWszJ/+XoDME9NQVUJvz+u9Un4hH/6
         AnwNjJ2foGerAK7uJCNV9cthoBWtNeCcf9+iVcaDwTIfhrgTCl8Kf3YP9zVqxxWeeykB
         9N5g==
X-Gm-Message-State: AOAM531C2gutjlqG+WP6ocK5fC0TChcUqkrOMiMYWTc3YsTlFepjm9RI
	wevJf4a7aNeU8wTr3wId8CY=
X-Google-Smtp-Source: ABdhPJxzAtyPg1JvnpAus10jzzZfjCc5K2FRGR8OghiGfJJFd1tAW3zgBOFOfAG8iFnLyw+vXKOfYw==
X-Received: by 2002:ac8:5502:: with SMTP id j2mr4568777qtq.116.1627570989300;
        Thu, 29 Jul 2021 08:03:09 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id 188sm1832715qkj.48.2021.07.29.08.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 08:03:08 -0700 (PDT)
Date: Thu, 29 Jul 2021 11:03:07 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@fujitsu.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] open-iscsi-user: Fix link errors
Message-ID: <20210729150304.GA41177@gmail.com>
References: <1627393477-28317-1-git-send-email-zangrc.fnst@fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1627393477-28317-1-git-send-email-zangrc.fnst@fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] open-iscsi-user: Fix link errors
on 27/07/2021 zangrc wrote:

> The wrong link caused conflicts with other packages, so the link error was fixed and the conflict handling was removed.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
> ---
>  .../open-iscsi/open-iscsi-user_2.1.4.bb                   | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
> index 73b5a66..b71d8dc 100644
> --- a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
> +++ b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
> @@ -29,12 +29,6 @@ do_compile () {
>          oe_runmake user
>  }
>  
> -inherit update-alternatives
> -
> -ALTERNATIVE_PRIORITY = "60"
> -ALTERNATIVE_${PN}-dev = "libcap-ng.so"
> -ALTERNATIVE_LINK_NAME[libcap-ng.so] = "${libdir}/libcap-ng.so"
> -
>  do_install () {
>          oe_runmake DESTDIR="${D}" install_user
>          install ${S}/etc/initd/initd.debian ${D}/etc/init.d/open-iscsi
> @@ -42,7 +36,7 @@ do_install () {
>  
>          install -d ${D}${libdir}
>          install -Dm 0644 ${S}/libopeniscsiusr/libopeniscsiusr.so.0.2.0 ${D}${libdir}/
> -        ln -sf ${libdir}/libopeniscsiusr.so.0.2.0 ${D}${libdir}/libcap-ng.so 
> +        ln -sf ${libdir}/libopeniscsiusr.so.0.2.0 ${D}${libdir}/libopeniscsiusr.so
>  }
>  
>  # systemd support
> -- 
> 2.25.1
> 

> 
> 
> 

