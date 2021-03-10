Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.4057.1615347355229822036
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Mar 2021 19:35:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bXtEqePF;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id j3so12018786qtj.12
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Mar 2021 19:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=k4QYqxXbwC5ykWdmHrjOCdIFSiIQJ6cS/cs0JGyAXrY=;
        b=bXtEqePF297HB+KPOeshe9Td6gskt41qBOc86bbkfjx2PRibY3X5SZpOvMH3dn1Pfk
         v94vWhJDqeaKFsVQtxxoZYhzW9Pp4/5ShX8B6A5zGJXyiMeApyC7fJSdowCmTW730FML
         nguibqdrO9JLKwTl4J5HCqulliA3tnYgHFOoSZ5sCsYkX4WSJUdFFwcGtWZVQp+g+Jde
         GeYIhN0tAJUD3r/RTrgvFem0kWa7F87CmLeW2oGWIiU5QTptbzrs1gBI6Smc0ygjmI4K
         ZTSt6kruubwFpg80stAgD4orYn6x8gH5aaWhHl0TLDZkqnFPeznXH7yIuRfQR6DqdXPZ
         PWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=k4QYqxXbwC5ykWdmHrjOCdIFSiIQJ6cS/cs0JGyAXrY=;
        b=GO0TywKX6zYVehkY3kVSQQ9lyCqQvUsT+KSY/MBfMbuc/9p8auDqVXIcyXAO5OuuzE
         O6YhsVMSJ+7Z5JPoxr/5ST9q2aZxFtkM9V9fgDwxtKQsGkFQQlQAmiuwzDCUHXlbn2BP
         vcufxVsc4CoHx7M87lDkcdQD1Tnn8MOUtc/aXfv9CxGHUGkJ5QqeY1uwPISPqJogm9g9
         9+uwwy6r9NaPD7aq+3mBKc9TDpGue1twa/QR6DQcvWjwMXowW9FxHKzW/0YWrMAMs3Pi
         xuDt5pBn+IEinDdZ0iCbxlCr75nQUSUJh+xLyzsVpgNKd00E7gtIwRUYr45P1TDmGnaS
         rsvg==
X-Gm-Message-State: AOAM531XXhDr/5n9K6pEKedY47hWIy29SRMZbMPHUUFI6aibynvRXyOQ
	L9tk7uQjSpSLgfLYiuE4/X70SIGT+yvXBTl/
X-Google-Smtp-Source: ABdhPJxUNOy2Lc6cFJJn7OGF/RYsG2M9lvC7UaZgTPtmfdssuXCesunStGN8XsIBhb9PVLv+TlZN3w==
X-Received: by 2002:ac8:720e:: with SMTP id a14mr1171201qtp.132.1615347354329;
        Tue, 09 Mar 2021 19:35:54 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id k126sm11740182qkb.4.2021.03.09.19.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 19:35:54 -0800 (PST)
Date: Tue, 9 Mar 2021 22:35:52 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] nagios-core: update RDEPENDS
Message-ID: <20210310033549.GA15907@gmail.com>
References: <20210310005009.23279-1-changqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20210310005009.23279-1-changqing.li@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][PATCH] nagios-core: update RDEPENDS
on 10/03/2021 Changqing Li wrote:

> From: Changqing Li <changqing.li@windriver.com>
> 
> fix following error during do_rootfs:
> nothing provides php needed by nagios-core-4.4.6-r0.corei7_64
> (try to add '--skip-broken' to skip uninstallable packages)
> 
> Since commit c4ffcaa2 [php: split out phpdbg into a separate package],
> package php is empty.
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  recipes-extended/nagios/nagios-core_4.4.6.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/nagios/nagios-core_4.4.6.bb b/recipes-extended/nagios/nagios-core_4.4.6.bb
> index 4cbec2b..8bcd6c0 100644
> --- a/recipes-extended/nagios/nagios-core_4.4.6.bb
> +++ b/recipes-extended/nagios/nagios-core_4.4.6.bb
> @@ -34,7 +34,7 @@ RDEPENDS_${PN} += "\
>      libpng \
>      fontconfig \
>      apache2 \
> -    php \
> +    php-cli \
>      nagios-base \
>  "
>  
> -- 
> 2.17.1
> 

> 
> 
> 

