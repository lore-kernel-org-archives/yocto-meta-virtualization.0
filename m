Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36824C61DB2
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 03:52:13 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.51534.1749441130737020151
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 08 Jun 2025 20:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JcBljmif;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6fafc79bca8so47173676d6.1
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 08 Jun 2025 20:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749441130; x=1750045930; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B1w1pe228BwoUXlmDZ7EG41Igo0t6SL98YpMUkC6TdA=;
        b=JcBljmif4KqVpvZlu668wRIH8iRsD5lH98eBlarHOBgaCHFDIhpk+VE7RJvXk1IWGE
         MC0hsFxZVvUy2gesrvDWqGV5MgToPczRRoSem8/J72TynhGFFU7umy+VkhKG1itDCtZd
         F02TGMS5XZcbFBAwdGhvTaPALGBALk6QAvL0sClA9oBsNRhvplxUa5MUgJVNoURBRUOs
         HHZ8/XtBhdKUGJMIiT9p1KK48J33D9J+RNtbRKio/W57xRoqV5n/cpaRZsoUkhIRRWdg
         nUwvPXWamE/90lj6MX2sv9N2HZ1rJzMIredw7EHzFgbYk66MIkwbmvcK0eJfpMtsQDHI
         WMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749441130; x=1750045930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1w1pe228BwoUXlmDZ7EG41Igo0t6SL98YpMUkC6TdA=;
        b=DMi7f9YCQ6fVLXv/851CWypDwY38ptYUdMEb/+qXa/albOdaxHAz6FnQK+/FSsuDlL
         Lfx6RLR0+7VaPsGz02fBKAf7H3NYIePX0aIOtKXcH//SfgXKOL6jwrVkz5Tl0MTKiw1U
         +AghO36zB2TuRnNfbJB6TOI8IEY2goZKqIvcjzC9jK/1iupmVDijxVqpaK8r4e8surJT
         yQMj+N9FuRXoFbSVvyjbR+OJg2QL//ds+fYLeFbwh+NfKON1Ju0uLT4F7GgyzK5HPaoU
         FbktLfhNP+glEdWHdJyHRm+akWcohQyqd47zCbgMvomUjDbt7DKG0AajtzTKyr6siLY+
         +tZg==
X-Gm-Message-State: AOJu0YzLsGMhdfRDvdf3EYDiRvBQ+QvOkZWy4iaF1E9HJtvET0RxeKoP
	SOshfrk+HQ4QN/NPX725sRd9wK2hfCTCdNB24n92HsP0zwnTvKuoNNpW/fML9a0E1AY=
X-Gm-Gg: ASbGncturTYg6ePbYlTpGEM2UvBn7Owl/rG7q55f53ZkaHFPFy0vLEnmcZ2XsRymELy
	lHkoBS9aApNHC6eM+LCOYflNUFcS3eZUL0BQgN9VLbj7wmG0wzYeuSNqu8GRDryWAKXROvwcfd/
	UtOKi1QKc4d8iIaUiwQrScy6s08XP485zbxKs5O9B/skXhyBZAJzfN9dH/pr/CzFo3sLuagd/cU
	nWcOAMrs+N1w+EC4SgNdZSsiJjaqbNm49zpl6oUgikUfGVahfKuOb8aPmO2v7Ecvjlc9zxQjSVD
	NeAZOGLU88pEBuSh2EJOV+e9768YKUAh4zOxfGSoxj6gnT87k8tpmTnSLD3nHUAzyVdicFByxKN
	uQDCsG4dPKVpBU8JCjreaoPuq72n+3raHu1prkNJ9
X-Google-Smtp-Source: AGHT+IFOq5PJ96UhCunr0/6IDce0ui43xjSXg5oEP55OVaev7YjCgbwnRFVD+KFJ3TA/rfcJHLWo8A==
X-Received: by 2002:a05:6214:2a83:b0:6fa:cb72:955a with SMTP id 6a1803df08f44-6fb08f6a075mr180857926d6.4.1749441119002;
        Sun, 08 Jun 2025 20:51:59 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09b2a21esm46652916d6.94.2025.06.08.20.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 20:51:58 -0700 (PDT)
Date: Sun, 8 Jun 2025 23:51:56 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: wangmy@fujitsu.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [meta-cloud-services] [PATCH]
 nss-pam-ldapd: Resolve build failure with GCC15
Message-ID: <aEZaXNDKksYSeftg@gmail.com>
References: <1746775973-14094-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1746775973-14094-1-git-send-email-wangmy@fujitsu.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Jun 2025 03:52:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9276

merged (sorry for the delay).

Bruce

In message: [meta-virtualization] [meta-cloud-services] [PATCH] nss-pam-ldapd: Resolve build failure with GCC15
on 09/05/2025 wangmy via lists.yoctoproject.org wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb
> index 582f7592..08923275 100644
> --- a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb
> +++ b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb
> @@ -28,6 +28,7 @@ SRC_URI[md5sum] = "cc30ee0ab91d6c94b7a343ae09b5dc69"
>  SRC_URI[sha256sum] = "c6d661e74693cbf531a790631ca93b73f291fb23cc39465b09deb8da2bfb0e14"
>  
>  DEPENDS += "libpam openldap krb5"
> +EXTRA_OEMAKE += "CC='${CC} -std=c99 '"
>  
>  EXTRA_OECONF = "\
>  	--disable-pynslcd \
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9247): https://lists.yoctoproject.org/g/meta-virtualization/message/9247
> Mute This Topic: https://lists.yoctoproject.org/mt/112894814/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


