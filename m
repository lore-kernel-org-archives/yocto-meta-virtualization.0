Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web12.8554.1575659315170079226
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Dec 2019 11:08:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kqm6ixSH;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id c26so6765917eds.8
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Dec 2019 11:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ALX62R6eL5uDZy/gh/9FkoFoSKM/LUXEzocphp1XKZE=;
        b=Kqm6ixSHpFYFYWKsB33gGiveQogG6dQoSrDow1lpuaNyeu2L5X5NJjsn4GzclHLQOZ
         sq4ZcqlBrkkV3r3sW2Qhn0uXdPfqmX1bg7JuUGKo2lUH38mwleozREcw86a9kExJgsad
         SDhscAN9nrzAfyG8P/NRmuveSGM9bahj0mJXFMFtgLGYd495hVR2LIeuDvuzGjBLC9Gq
         WBJKEsLrbc2X/wHew4YuceseoOTLbO19uS0Q9C5vlSHufJMgNebRjPmh3roecUCUL+DX
         ejOwwMUIY4wHT6d6QDCf+HkGVs8BfgZGPS3Fmsg75xVUZIipot6lvc/Ohu3jFqYUL5+V
         GT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ALX62R6eL5uDZy/gh/9FkoFoSKM/LUXEzocphp1XKZE=;
        b=aweaqgPnKrTpETAQpRJMKXmizPsJBj3ZMkfLcMrVBpLBONHkOjVMsMvaC6wrHxEd/r
         DNmwDnf/MI06QR568KSKegNwvAeQ0DpCL453WrK2Y8ZiuMZisByZoLjZlDQSYNQLwVOH
         36LASs1f4v4nju7jjYsNImOW3zKk53RHBTb4+ocgVRUwF6XLsW6X2k5hMCyAne2lAvtL
         JOqRyUAyjH4UgN002wXJLNsBfnUp3pW54q/UDUDI6JhhqcW/2nKQLOTzyc6HPhk+hEyb
         nzHaL1YTqm+PGN8LitdQNm5oj5RPUTc2rAC7j7+O32Dn3Cvd5yJTwy1zt68zbHsXHaHQ
         wyYA==
X-Gm-Message-State: APjAAAUlWn5HF0NUWlBIwz1pQGDgVKz1uSZrH/MEh78OBRZtoEmK3zFv
	97nDwe8UDTHfvaoe/eTBj0X6HNZKf5unQROR3qM=
X-Google-Smtp-Source: APXvYqxuA5q09BKMwYDeeS3x+CB8eLwRUzo2CogmbnQSAoXiZjZpx+a2pkC9Ucc2sYfOdp0Y3FIGOdycTAFMHhRDZlU=
X-Received: by 2002:aa7:ca54:: with SMTP id j20mr18116047edt.179.1575659313571;
 Fri, 06 Dec 2019 11:08:33 -0800 (PST)
MIME-Version: 1.0
References: <1575314833-10994-1-git-send-email-liu.ming50@gmail.com>
In-Reply-To: <1575314833-10994-1-git-send-email-liu.ming50@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 6 Dec 2019 14:08:22 -0500
Message-ID: <CADkTA4MB39xztYRKj-g=V63f1Zhp7S62UPuV9heOK-F9aOc0QQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 0/3] Uprev docker-compose to 1.25.0
To: Ming Liu <liu.ming50@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Stefan Agner <stefan.agner@toradex.com>, ChenQi <Qi.Chen@windriver.com>
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Dec 2, 2019 at 2:27 PM Ming Liu <liu.ming50@gmail.com> wrote:
>
> From: Ming Liu <liu.ming50@gmail.com>
>
> This patch set mainly aims to uprev docker-compose to 1.25.0 and also
> upgrade some of its dependencies to the latest release version.
>
> Test on a colibri-imx8x machine against:
> https://docs.docker.com/compose/gettingstarted/
>
> Ming Liu (3):
>   python-docker-pycreds: uprev to 0.4.0
>   python-docker: uprev to 4.1.0
>   python3-docker-compose: uprev to 1.25.0
>
>  ...up.py-remove-maximum-version-requirements.patch | 33 +++++++++++----------
>  .../python3-docker-compose_1.21.2.bb               | 31 --------------------
>  .../python3-docker-compose_1.25.0.bb               | 34 ++++++++++++++++++++++
>  recipes-devtools/python/python-docker-pycreds.inc  |  4 +--
>  ...eds_0.3.0.bb => python-docker-pycreds_0.4.0.bb} |  0
>  recipes-devtools/python/python-docker.inc          |  4 +--
>  ...thon-docker_3.4.0.bb => python-docker_4.1.0.bb} |  0
>  ...ds_0.3.0.bb => python3-docker-pycreds_0.4.0.bb} |  0
>  ...on3-docker_3.4.0.bb => python3-docker_4.1.0.bb} |  0
>  9 files changed, 55 insertions(+), 51 deletions(-)
>  delete mode 100644 recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
>  create mode 100644 recipes-containers/docker-compose/python3-docker-compose_1.25.0.bb
>  rename recipes-devtools/python/{python-docker-pycreds_0.3.0.bb => python-docker-pycreds_0.4.0.bb} (100%)
>  rename recipes-devtools/python/{python-docker_3.4.0.bb => python-docker_4.1.0.bb} (100%)
>  rename recipes-devtools/python/{python3-docker-pycreds_0.3.0.bb => python3-docker-pycreds_0.4.0.bb} (100%)
>  rename recipes-devtools/python/{python3-docker_3.4.0.bb => python3-docker_4.1.0.bb} (100%)
>
> --
> 2.7.4
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#4799): https://lists.yoctoproject.org/g/meta-virtualization/message/4799
> Mute This Topic: https://lists.yoctoproject.org/mt/65175066/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
