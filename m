Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.35112.1597628055859921803
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 16 Aug 2020 18:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rYpqaEz3;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d27so11322289qtg.4
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 16 Aug 2020 18:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FgUM3SS9mpHzXvWVaU80cyxJckVcnZIAocIA13XIw+U=;
        b=rYpqaEz3SbwkECRTUgC03p/G4LMQPjc9RddU6cyjQmER7yzPwCEBFgZ+Yd/OA0+g0k
         ObX5L3FmWYUbPliswtu9KtGlhJrMBJ2b3SEdzXsN19jHX3qX1p9tIWPmzQ6WgAjoRbH7
         qWnzCHEsieALD8lyzmJ7gTEfOanNLRSGEd1FRLvQxwhEHPRw7DjL1ctsBbgrx2lLFIaL
         8XLZsv6lGZkKzpt/O1fGTSbtKstr4bHtYXQp5cpiYs2GA9I/gw/avQHWVqwfW4baJa4M
         1A4LLZhd9fIQ1beKZbE/28OPjaVjsLgCAfe6NO4aP67HFBRYEdcGFwmmAyQ4Z+esQF6K
         Ag6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FgUM3SS9mpHzXvWVaU80cyxJckVcnZIAocIA13XIw+U=;
        b=L8tUei71184CyyTZpS1JBD9GAqodJEeZKZcta/witJ0S/fJZ/SmtAAu9c/EGPBOA4E
         O31bJs7hGSS4yKyn1S8hzRDPqb4co4cG5/cp47hxXhnoLleSRHf0vxbnqxcs3oS7xwv0
         symN4r3eC3tJdNlpVyPGioLZVrWM1Yo0Gdv1rQ/stmxUVRPYeHMn9HUy4J4aDAsff7kC
         z1VwzX/k+XeMTrXGtg6ABdzZX/WJ7BeaFHaOj2eInO+dejnazF51LRw9PXYhjl/jfSaq
         7I2f5FFCvEvOELMnYxbCLA3+Km6i6gaBigvwqlH1YmW4kvkuM7O5ck+xXbhQQfeyW/b6
         BgXA==
X-Gm-Message-State: AOAM533szLA11xabGcCBvYEU30SVfScpPgxGpnbJWnIuv1dVAfiIGE9W
	Rrgd2jvDQm+Su0U7AcxkeG8=
X-Google-Smtp-Source: ABdhPJyTnNamG8WUFxrNqljI6FhtKo50RCcfo4t5lCa60qvkhWCsseZpyeek2nTJxR/+3cOL7PwOrQ==
X-Received: by 2002:ac8:470e:: with SMTP id f14mr11632455qtp.380.1597628055019;
        Sun, 16 Aug 2020 18:34:15 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id k24sm18282027qtb.26.2020.08.16.18.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 18:34:14 -0700 (PDT)
Date: Sun, 16 Aug 2020 21:34:12 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	christopher.w.clark@gmail.com, cardoe@gentoo.org
Subject: Re: [meta-virtualization][PATCH v2] xen: Fix menuconfig and add support for config fragments and diffconfig
Message-ID: <20200817013409.GA13307@gmail.com>
References: <1597398993-36660-1-git-send-email-diego.sueiro@arm.com>
MIME-Version: 1.0
In-Reply-To: <1597398993-36660-1-git-send-email-diego.sueiro@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization][PATCH v2] xen: Fix menuconfig and add support for config fragments and diffconfig
on 14/08/2020 Diego Sueiro wrote:

> Changes in v2:
>     - Fixed typo in recipes-extended/xen/README
>     - Removed documentation changes from 0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch
>     - Updated Upstream-Status in 0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch
>     - Call find_cfgs function only once in recipes-extended/xen/xen-hypervisor.inc


v2 looks good to me.

Christopher, do you agree ?

Bruce

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

