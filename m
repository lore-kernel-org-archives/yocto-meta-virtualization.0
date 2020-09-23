Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.12360.1600864848370046706
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Sep 2020 05:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kicuXSEJ;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 7CBA738C084A
	for <meta-virtualization@yoctoproject.org>; Wed, 23 Sep 2020 05:40:47 -0700 (PDT)
Received: by mail-ed1-f67.google.com with SMTP id a12so19619404eds.13
        for <meta-virtualization@yoctoproject.org>; Wed, 23 Sep 2020 05:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BYYF3g0Dr2bTJrOSFJYE6piEB42r3KS0R+y4rlex4wk=;
        b=kicuXSEJkLv4I4Se1RHU9LNPPGJ7Fxr9B3a6JnciQmktIqufwqyRK2xyegP6jV2FId
         Xx9jbHOyZ7nCQncX6VvR0BNsxVEfJ5ZbfT31E5ukToPqQpQPI4Bu+6wsOjEas/5PazpK
         JslKC7D0iJDFDia11vaFILaKjz3f+Zrly5cz60o8cPtW1042YKACDavh1Psyk3MLiQkE
         M3TFvfGi6hdMuYOWTspTV11iOWNaeqBMm79n2vcOY0SitWBvUhlIXG7W+YvHoGTceps2
         rhOPgb5uUBoMrJw6xfiM18ARKOduKmerQqwBI7yRZqsKDXtQMa9aywccLdyQ2nLgaNce
         Txeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BYYF3g0Dr2bTJrOSFJYE6piEB42r3KS0R+y4rlex4wk=;
        b=OHKKRdD+kKHEPGFFOo4iLH5gHWOnGv/EXvCzbg8u/5Pe8EiNDu0wKtuTy0LmybsnLm
         kw11tCSmh9DsvpKXKtoVkg5aaXr6z++JU7bJPmennUJaSHl0DWHfdrDlTqG+LOZ2VLtw
         tUrZRVEoNLEOEQ0sXp9BKFILUX1nBRHuDCcwM0zA7FGRWMwrJHpQFTI6WzHQQDt9BBIH
         gR+zMAKh2xmxe2UH595nCiu2ecvw8QxA09vN2bpwn0m/ASoVt3s6v5kHzGdRgJkUMJwH
         8FKTSr5qoYInTW/lsi+QPeMVsSGwuZwtTs5tH3j9lUa7YvHj8JDDJYEYqLQwIp/cAhlj
         n5kQ==
X-Gm-Message-State: AOAM532U299jDzlPPFtFHAQ3AETG6Y23tr3zZBqWh1w8JmMQhHjCzbB0
	LwwHUJxkQ6WzXtRQog2wCldnL+W/qtSb89dWwpI=
X-Google-Smtp-Source: ABdhPJwDxfs1iSg3DY155+69NEKcsqTPcyEjGWFLvvX3ZLeuVvhhfKYL1Tp8rLKvBWVUHV+I3XZ695QvYlAaWEJLjow=
X-Received: by 2002:a05:6402:22fc:: with SMTP id dn28mr9185035edb.365.1600864845779;
 Wed, 23 Sep 2020 05:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <16370E1C8879D0E3.12779@lists.yoctoproject.org> <20200923075309.46978-1-mingli.yu@windriver.com>
In-Reply-To: <20200923075309.46978-1-mingli.yu@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 23 Sep 2020 08:40:34 -0400
Message-ID: <CADkTA4NfOEhuR1JWWkJPAZvNKU6kk_Prz9kejRwBYefqxsFo_g@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH v2] lxc: remove deprecated options in lxc*.service
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 23, 2020 at 3:54 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Remove deprecated options in lxc*.service to silence below warning:
>  # systemctl status lxc
>  [snip]
>  /usr/lib/systemd/system/lxc.service:17: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
>  /usr/lib/systemd/system/lxc.service:18: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.

What's the delta to v1 ?

Bruce

>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  ...setting-regarding-the-Standard-Outpu.patch | 35 +++++++++++++++++++
>  ...ed-options-in-lxc.service-fixes-3527.patch | 31 ++++++++++++++++
>  recipes-containers/lxc/lxc_4.0.2.bb           |  2 ++
>  3 files changed, 68 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
>  create mode 100644 recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
>
> diff --git a/recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch b/recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
> new file mode 100644
> index 0000000..ab97422
> --- /dev/null
> +++ b/recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
> @@ -0,0 +1,35 @@
> +From a7a92a06a47322dee45664db5c7bfa68b2b95edb Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Wed, 23 Sep 2020 07:03:02 +0000
> +Subject: [PATCH] Remove obsolete setting regarding the Standard Output
> +
> +The Standard output type "syslog" is obsolete, causing a warning since systemd
> +version 246 [1].
> +
> +Please consider using "journal" or "journal+console"
> +
> +[1] https://github.com/systemd/systemd/blob/master/NEWS#L202
> +
> +Upstream-Status: Submitted [https://github.com/lxc/lxc/pull/3541]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + config/init/systemd/lxc@.service.in         | 2 --
> + 1 files changed, 2 deletions(-)
> +
> +diff --git a/config/init/systemd/lxc@.service.in b/config/init/systemd/lxc@.service.in
> +index a2aa2211f..21ce64aef 100644
> +--- a/config/init/systemd/lxc@.service.in
> ++++ b/config/init/systemd/lxc@.service.in
> +@@ -14,8 +14,6 @@ ExecStop=@BINDIR@/lxc-stop -n %i
> + # Environment=BOOTUP=serial
> + # Environment=CONSOLETYPE=serial
> + Delegate=yes
> +-StandardOutput=syslog
> +-StandardError=syslog
> +
> + [Install]
> + WantedBy=multi-user.target
> +--
> +2.26.2
> +
> diff --git a/recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch b/recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
> new file mode 100644
> index 0000000..2957680
> --- /dev/null
> +++ b/recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
> @@ -0,0 +1,31 @@
> +From 0c4cd88d4a19d27ba9b5d2c8fa4d482d78211c35 Mon Sep 17 00:00:00 2001
> +From: graysky <graysky@archlinux.us>
> +Date: Fri, 21 Aug 2020 06:33:49 -0400
> +Subject: [PATCH] remove deprecated options in lxc.service fixes #3527
> +
> +Remove deprecated options in lxc.service fixes #3527
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: graysky <graysky@archlinux.us>
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + config/init/systemd/lxc.service.in | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/config/init/systemd/lxc.service.in b/config/init/systemd/lxc.service.in
> +index e3745dc2d..397a6c4d0 100644
> +--- a/config/init/systemd/lxc.service.in
> ++++ b/config/init/systemd/lxc.service.in
> +@@ -14,8 +14,6 @@ ExecReload=@LIBEXECDIR@/lxc/lxc-apparmor-load
> + # Environment=BOOTUP=serial
> + # Environment=CONSOLETYPE=serial
> + Delegate=yes
> +-StandardOutput=syslog
> +-StandardError=syslog
> +
> + [Install]
> + WantedBy=multi-user.target
> +--
> +2.26.2
> +
> diff --git a/recipes-containers/lxc/lxc_4.0.2.bb b/recipes-containers/lxc/lxc_4.0.2.bb
> index d0ead81..ead6bb2 100644
> --- a/recipes-containers/lxc/lxc_4.0.2.bb
> +++ b/recipes-containers/lxc/lxc_4.0.2.bb
> @@ -47,6 +47,8 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>         file://templates-use-curl-instead-of-wget.patch \
>         file://tests-our-init-is-not-busybox.patch \
>         file://tests-add-no-validate-when-using-download-template.patch \
> +       file://0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch \
> +       file://0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch \
>         file://dnsmasq.conf \
>         file://lxc-net \
>         "
> --
> 2.26.2
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
