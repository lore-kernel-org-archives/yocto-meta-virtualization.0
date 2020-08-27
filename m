Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.28560.1598560206823024234
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Aug 2020 13:30:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IIZgFT88;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id u3so7318578qkd.9
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Aug 2020 13:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=enDQY+MM3HC4yHnNFCTwOzaek6tTR8MXApWtXnXemnU=;
        b=IIZgFT88EoT+OtRseQScSzssH4YzFKqQh+NO9UL4TEdM6Y8T2Y7eEUvAmdEPudOd9j
         MpjL0BfeTHf1AHc/y6OzmZt3Yip2SFoI53bYBwe/5lZuHC0Mw9JIc2LA4J9Ro88uqJor
         aXvheB3yRwdkpEVOx0t30LX7Vi29PEgzbAMhEPB9y20lMCNMKy4jWGBgqM4HBgeOPWDU
         2sh7SV2u0KwVlRa9QR3woy9c6Fac55e9NEc5oHFiX3OO7vsVjkL0udc8DeZjoorDhSoo
         of+qsYG0i8dQd0JDIqn2CJVy+diAHSwQ24xZoAvMxwelkmahUkWA1AD3K6/9V3k7fIPB
         9TzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=enDQY+MM3HC4yHnNFCTwOzaek6tTR8MXApWtXnXemnU=;
        b=cxbYhSXkSVKH3Oy8EG/4vXikdIzSf2cH0WvD0JatKyNQTFd7PXiOemg2O9jxqBDCOF
         4jtY98RD1Cj32Q1TcSC1lmzl27DjlRMVLG+K93BE+oj6lYLT+8cjn9L93cIE1NCM9O6G
         0Ow702c7Yn6M/El2ivp1gYM1Lxpv3FvEy/OHAhGKcNWzFNharBahmyDKaZI1AnMzDQ7+
         o2LZOdfW2YFqvcrdg0c1ewSueWyhhSOnEalyZVO8LRp6ijdaImXhOBRAIIBzJRpxyNDV
         CCzWF9cJstV7ijZ0LDvxJibUZ2kL0+dJllBDGNxMkQ9w2P+5bdiwo0HsE6UxJ8LYX5vk
         aGrQ==
X-Gm-Message-State: AOAM532j4Zvc20zVeu+lhGWqT7b56WCIQb1Ib2aCRsKUqdY/zQU0U/oD
	6iiOHLB2F4dX8Q7cdZDCzKs=
X-Google-Smtp-Source: ABdhPJxlqsSnNwSr88SbjiyQOWLf6zm6ryibdthvKacIwkvnQ3gONxN8mYYcC4+cRGzKDwuz2yfsbg==
X-Received: by 2002:a37:508:: with SMTP id 8mr19971625qkf.416.1598560205877;
        Thu, 27 Aug 2020 13:30:05 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id e21sm2565328qkl.88.2020.08.27.13.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 13:30:05 -0700 (PDT)
Date: Thu, 27 Aug 2020 16:30:03 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	christopher.w.clark@gmail.com, cardoe@gentoo.org
Subject: Re: [meta-virtualization][PATCH v2] xen: Fix menuconfig and add support for config fragments and diffconfig
Message-ID: <20200827203002.GA36814@gmail.com>
References: <1597398993-36660-1-git-send-email-diego.sueiro@arm.com>
MIME-Version: 1.0
In-Reply-To: <1597398993-36660-1-git-send-email-diego.sueiro@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

v2 is merged (which is now a 1 patch series, versus the original 2
patch series).

If I've got that wrong, let me know!

Bruce


In message: [meta-virtualization][PATCH v2] xen: Fix menuconfig and add support for config fragments and diffconfig
on 14/08/2020 Diego Sueiro wrote:

> Changes in v2:
>     - Fixed typo in recipes-extended/xen/README
>     - Removed documentation changes from 0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch
>     - Updated Upstream-Status in 0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch
>     - Call find_cfgs function only once in recipes-extended/xen/xen-hypervisor.inc
> 
> Diego Sueiro (1):
>   xen: Fix menuconfig and add support for config fragments and
>     diffconfig
> 
>  recipes-extended/xen/README                        |  3 ++
>  ...g-Allow-specification-of-ncurses-location.patch | 49 ++++++++++++++++++++++
>  recipes-extended/xen/xen-hypervisor.inc            | 49 +++++++++-------------
>  recipes-extended/xen/xen_4.14.bb                   |  1 +
>  recipes-extended/xen/xen_git.bb                    |  1 +
>  5 files changed, 73 insertions(+), 30 deletions(-)
>  create mode 100644 recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch
> 
> --
> 2.7.4
> 
> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.

> 

