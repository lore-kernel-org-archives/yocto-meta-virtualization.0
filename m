Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.418.1577124951827507553
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 Dec 2019 10:15:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fLfuk1OQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id d71so6356441qkc.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Dec 2019 10:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gSmXUEktPQzrrlGazakSWmOXBix3eCmM7cZ0N/kc6iU=;
        b=fLfuk1OQ7zydImGfGEqH+jlgvWlL/sGVTL5mng8HRACYIVN6jxttR/LcJbJLKXkZz1
         j2+5SA9F1gVjoYzLHfXqy+pHCPK/EESicFkDygoOjGJvd2E1FpLtICQOE0pYbs33bxFx
         aWJZhz+s1DBstr9S/FujdJwCkUd6CLwy6BUDusud48W4Etxw3axDiDP3eaKktNuW1QN8
         bZX/9S5xrSLgzeKMXZk9Am/gJqnatL71Lxs0K612ghQYV4epQcfh19aNIxBp1MSn/ODF
         HVr4KTSWNFiFPhOZrqKLZj4mZUqJhX72i0ovUS1x5InEK8/QFPoVtmTfCZsorORhRKMe
         BUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gSmXUEktPQzrrlGazakSWmOXBix3eCmM7cZ0N/kc6iU=;
        b=qPH+1UVKRKyrPJtSRV8/FMlFQHRd6iwuv4UChTtcFMZMDw/d5m9VckscRUpG3g7ZFJ
         qbY7QmV0XZx0cW8eGY6whmQZdc+uTHSgRMl+TQKoVOzd2h6TwNqqLcOU1tdeZweOwS7L
         ereOHA+SyjTW1v3HhX2x++i0gG9xVd79+8xcULw1xOOPzjJBgnUeBsc4skiGS1zqbZx0
         tXjMW4jAkep68WxjV8NQingcJW4GducXcpT680QHdQLDSfTf/7Vivl4FEjyC4lXuWCzY
         Rbw23hpOiVKQollytDwU2lVXcFgDJ8goxYPTOWKPJ9/Q9Qfgynr9O2mJJOJIQfLXKbl7
         /qng==
X-Gm-Message-State: APjAAAUPwCVIgAvzWh9B8cPZCtRETmSWrtvAyZPiU5GnQZUknmuUC2PJ
	VeLdTnwE+j3nHApZs1/DLLw=
X-Google-Smtp-Source: APXvYqy08w/1H0PFNJ975XKeKGazCSvfEdt/6WkOXzQaU+DqA0YsHeAwBeLk1+b/qpOJOhl02+v2EA==
X-Received: by 2002:a37:8d3:: with SMTP id 202mr27994735qki.415.1577124950990;
        Mon, 23 Dec 2019 10:15:50 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id m10sm5923632qki.74.2019.12.23.10.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2019 10:15:50 -0800 (PST)
Date: Mon, 23 Dec 2019 13:15:48 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: hongxu <hongxu.jia@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][m-c-s][PATCH] sysklogd bbappend: 1.% -> 2.%
Message-ID: <20191223181547.GB5430@gmail.com>
References: <20191223070937.36937-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20191223070937.36937-1-hongxu.jia@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce


In message: [meta-virtualization][m-c-s][PATCH] sysklogd bbappend: 1.% -> 2.%
on 22/12/2019 hongxu wrote:

> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../sysklogd/{sysklogd_1.%.bbappend => sysklogd_2.%.bbappend}     | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-openstack/recipes-extended/sysklogd/{sysklogd_1.%.bbappend => sysklogd_2.%.bbappend} (100%)
> 
> diff --git a/meta-openstack/recipes-extended/sysklogd/sysklogd_1.%.bbappend b/meta-openstack/recipes-extended/sysklogd/sysklogd_2.%.bbappend
> similarity index 100%
> rename from meta-openstack/recipes-extended/sysklogd/sysklogd_1.%.bbappend
> rename to meta-openstack/recipes-extended/sysklogd/sysklogd_2.%.bbappend
> -- 
> 2.21.0
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4904): https://lists.yoctoproject.org/g/meta-virtualization/message/4904
> Mute This Topic: https://lists.yoctoproject.org/mt/69226464/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-

