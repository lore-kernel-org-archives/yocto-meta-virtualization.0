Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web12.4308.1604439001864890610
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Nov 2020 13:30:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YUIfMAaf;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id e5so5064114qvr.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Nov 2020 13:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lSc1ci0cn0wFG2HAxFFWOpPns1hGXfdeLTpJLqo5CKY=;
        b=YUIfMAafOACBukoXhDzJoJENCj7S2wLjEWdQxXag0NS6yHL0QjFdncP9DYpk0d27r5
         WJa8v04rHZ7gb4ItrjYhVOQZw7jWsthsjBa4GvaLJeLK9xZN5TScIlE3vuGwDuCLZ6Hw
         oRAePMUgs9vTFDo31vCIOyLfmRO/P/WhY94fzL8Hq0lQrcxLontMb8F5XY3bjjXnXjBd
         tFFgECpNpxSmKe1zbb7uN6gZwMBWP9ZHg+AGPscF58RFmhMSeTT3zEotHqg122BTRT4Y
         D7i1OvpgjL8tSVnhHPvqwMVL+MG4KzneOc9Lr5nuOhCoLhHxwfiJB/oTRIwYGmx8zDXA
         zFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lSc1ci0cn0wFG2HAxFFWOpPns1hGXfdeLTpJLqo5CKY=;
        b=hfh0xMKljqvN2MamEBxu6GTWDF21vUPDUppa+TGQ48acsufxgKD1EmC7pFkfVqSOfD
         eZ0eZpZmiXP031AKVDLDdLB+nGjjcr6kTnYi7qcUPzaB+qtXP8N3LeKCdm2JmpGCJRO+
         81XGcrcrhkhC9H6DKM5Dow5vWsgp+jeHubPwyD7oYc1CBBBGHbh8mNVQYXyiHe5V8YTg
         BRwtGVqm4QsWGC82gr/wmIKeUK8uSyrg5Z/XGOHtJwg66y5vP2Fw86OsaFX2LRe7oUWn
         NgYArgCEN1OjYcIUFv4lZYUxK+3sNZiszU5NpZ6mKSrwh0Dph+vV6NIKOn0Zmudp72WY
         Ef6g==
X-Gm-Message-State: AOAM532jxTxsimiPTold7WUUR/Q4QV9h4F2arvMxAXq3uAAIPe7x1OWi
	GdI7DA1qJTGJn42w7PEwYhM=
X-Google-Smtp-Source: ABdhPJyhsGARPp2U37KQOfMvXY4SBZREOMdZeOcsNWMKb5OOwZ9otyFo9pCOfeyFTnEnPHu2mkzedQ==
X-Received: by 2002:a0c:f70e:: with SMTP id w14mr29586934qvn.10.1604439000917;
        Tue, 03 Nov 2020 13:30:00 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id b6sm10589456qka.126.2020.11.03.13.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 13:30:00 -0800 (PST)
Date: Tue, 3 Nov 2020 16:29:58 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: sakib.sajal@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] nagios-core: uprev v4.4.3 -> v4.4.6
Message-ID: <20201103212957.GB40662@gmail.com>
References: <20201028173104.40737-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20201028173104.40737-1-sakib.sajal@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][PATCH] nagios-core: uprev v4.4.3 -> v4.4.6
on 28/10/2020 sakib.sajal@windriver.com wrote:

> Minor upgrade including bug and CVE fixes namely CVE-2020-13977
> 
> Testing:
> Built, booted and started nagios-core service without any errors.
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  .../nagios/{nagios-core_4.4.3.bb => nagios-core_4.4.6.bb}   | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>  rename recipes-extended/nagios/{nagios-core_4.4.3.bb => nagios-core_4.4.6.bb} (96%)
> 
> diff --git a/recipes-extended/nagios/nagios-core_4.4.3.bb b/recipes-extended/nagios/nagios-core_4.4.6.bb
> similarity index 96%
> rename from recipes-extended/nagios/nagios-core_4.4.3.bb
> rename to recipes-extended/nagios/nagios-core_4.4.6.bb
> index c78259e..aaa722c 100644
> --- a/recipes-extended/nagios/nagios-core_4.4.3.bb
> +++ b/recipes-extended/nagios/nagios-core_4.4.6.bb
> @@ -20,8 +20,8 @@ SRC_URI = "http://prdownloads.sourceforge.net/sourceforge/${SRCNAME}/${SRCNAME}-
>             file://nagios-core-systemd-volatile.conf \
>             "
>  
> -SRC_URI[md5sum] = "8beb253b1236ee1407f698b5d2a2d894"
> -SRC_URI[sha256sum] = "bba8f0e8dc8cf72f7a7ae4e8ce9c60f5bd315629421b9ec34818a28b8da49f67"
> +SRC_URI[md5sum] = "ba849e9487e13859381eb117127bfee2"
> +SRC_URI[sha256sum] = "ab0d5a52caf01e6f4dcd84252c4eb5df5a24f90bb7f951f03875eef54f5ab0f4"
>  
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>  
> @@ -158,3 +158,5 @@ CVE_PRODUCT = "nagios_core"
>  ALTERNATIVE_PRIORITY_${PN} = '20'
>  ALTERNATIVE_${PN} = "nagios"
>  ALTERNATIVE_LINK_NAME[nagios] = "${localstatedir}/nagios"
> +
> +INSANE_SKIP_${PN} = "already-stripped"
> -- 
> 2.27.0
> 

> 
> 
> 

