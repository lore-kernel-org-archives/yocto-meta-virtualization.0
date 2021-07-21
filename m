Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web12.1693.1626835977457441200
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 20 Jul 2021 19:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NF0+X6DU;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id i4so276144qvq.10
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 20 Jul 2021 19:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ws/E+lIpzzBSf1E6Fz5SvGkTGWQRAfz/KWv2TZQBKbY=;
        b=NF0+X6DUlJ57KN1XLdBGa4OmMA4E51WWsdj0nnkd2ssx4fMpzH312dg7N7hfNvjfuR
         L1jcv76/98ZHDr5GN0E+TayNjqOl+3CYDHqHWGY4iC42ZcT+9viikjgGZwMdYzASxvC2
         1FQCNUYqOo2xc9eGxCbLgv5B7zHps3hrokOoMifKzRZj/+1bQ5dl0PDKorTBAJIFAWBM
         tZ3Hzn8j8jmhNRLSMT4WA0zw8vDXleAxCZnZw20Qt0kcAR61q59cZXxazjehe7sNsQ66
         pUIuVz9/OWrghdD3TH8hSrQ8i9PXujYY5jmjfnOtY3g/tt0akbxLCsxNJda86rugH0O3
         RBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ws/E+lIpzzBSf1E6Fz5SvGkTGWQRAfz/KWv2TZQBKbY=;
        b=YXhlijscOwxnJelsMNt9h/4umg554CFhrY2BVIObK0TgPNn3EWT9I7n50MQvrryaKp
         AD90kPc4ePkMLI3BB5rYGKAIlqULxZBeTBeG0i7MGyh++gnHQaRonikeaSabp6Cnb1q0
         1nJ9g7Ser/CBwaTL3dVarnfqvzsjz9v9xN193u+79mreb0P4BSBa1DnpjT3RiBZWSaMp
         uPdm94Tt8f185iNyIa8ZbUsgaoIZYKVddG8vWPs09y5QJ6fRRGqNghv0AINYm7YbLsqH
         Nf0NGhTKB6YE7lvFU3faSfYFvG13CKTPKDUW6Ai90KRMQSJCEpeRhmiS0mrGGhZ0100C
         xnBA==
X-Gm-Message-State: AOAM532RFM2Ipo+MR/SDHOeMc9cVYbmbngZknP0VaLenash9PwRsSC9z
	r9dED12hqmgDPDneSPZ/gLA=
X-Google-Smtp-Source: ABdhPJx3RgmO+MVZEZPxc2GttooJwFWKqjBMfejlV5Htz1oy39SQoq/i8f2mFbCpn7hDkPRvQ1cMog==
X-Received: by 2002:a0c:e7c7:: with SMTP id c7mr33646848qvo.56.1626835976535;
        Tue, 20 Jul 2021 19:52:56 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id s3sm10616495qke.85.2021.07.20.19.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 19:52:56 -0700 (PDT)
Date: Tue, 20 Jul 2021 22:52:54 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: wangmy <wangmy@fujitsu.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] open-iscsi-user: use update-alternatives for libcap-ng.so
Message-ID: <20210721025253.GB44485@gmail.com>
References: <1626829868-1763-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1626829868-1763-1-git-send-email-wangmy@fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] open-iscsi-user: use update-alternatives for libcap-ng.so
on 21/07/2021 wangmy wrote:

> libcap-ng also uses the doc 'libcap-ng.so'.
> 
> libcap-ng has a priority of 100.
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
> index 139ce1db..a05004a1 100644
> --- a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
> +++ b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
> @@ -29,6 +29,11 @@ do_compile () {
>          oe_runmake user
>  }
>  
> +inherit update-alternatives
> +
> +ALTERNATIVE_PRIORITY = "60"
> +ALTERNATIVE_${PN}-dev = "libcap-ng.so"
> +ALTERNATIVE_LINK_NAME[libcap-ng.so] = "${libdir}/libcap-ng.so"
>  
>  do_install () {
>          oe_runmake DESTDIR="${D}" install_user
> -- 
> 2.25.1
> 

> 
> 
> 

