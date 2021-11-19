Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web12.8924.1637328684578002632
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 05:31:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CrbyE20R;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id y12so42740943eda.12
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Nov 2021 05:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4VFo2pV4PuRvHmjKu/gSfjRe4KmH+1v+wkcqtDwxZjA=;
        b=CrbyE20RCfQKKMYkBWPRqEUMvexNGz7ofUQWTIVeOlKbGlgywFxUwhDcU+FmuXjcAR
         tHyu9DSNgoLZB31XzEhyGB2kVpLziDY764x/OKvSuxydrU2jvMsNcxbmL67LLqgu59Nm
         wnIFCtJhxqv33fuYmP/MOFujkpTfH9KucZ4vf8RSR+VNLEFL5HDCWGh6mkPr+qqoqyie
         rMvGMNFdggPMispDHZ9L885U7OpHtMqyjle+/4VN5dvsSgx01vVE2IeleZqF+5qiUlyc
         LAdeK1yADK0/moNH+62Dk7UmQEC6y6Ng3AP83Wk4A5Td060Lgq1ddcNSaePfrSfL2svm
         UheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4VFo2pV4PuRvHmjKu/gSfjRe4KmH+1v+wkcqtDwxZjA=;
        b=ZkYfbs/CBdDZdoTkYY/Ufe4BCUwmWAWwQ/J+G4qRCCZtS4cLfkg28XIRESMJ3a04mm
         8niNzgHgzUfKxTZqojZAJM0ZddPhpCVC/DoxAMge8UlDJt4w7b9ILyviFlGBRMO0MW+6
         VhoMMOcbWGzHM8zyjvpew11/14+6otC03aUKPx2ThVNyFNHjblx/A8LVhAUFqHc0F25S
         3b/71J5/dZISTdYTHN7lyO/9SOkdHLpJZEAoCHVLfP2vzvZDakLxIEE2LdLEKpf9NVQe
         d7P+Wxz7CgjdVLYvCVl55Dt+nzaTWUitPPvd6PsIzTbZPoOEj8vsiOqMBWg+QJYuE5Mx
         +QZA==
X-Gm-Message-State: AOAM531b131Pm60Ku2LqNoXxun6/0pNaFMp/VQaZpYWsvdfNpzM6JpOV
	xNDMpwFvDEKst9K1qtiGHm912+ok7eNz6Q1OLlJJQtCsGgs=
X-Google-Smtp-Source: ABdhPJyT9RN+iTCqzCNk45xpiJP6xJRXEDOdrJUn5NFUQFQGUiRYOjXnzlA+RfPiGcHr0ubL7e0AQaGKWb486t2mEL0=
X-Received: by 2002:a05:6402:908:: with SMTP id g8mr19774652edz.59.1637328683116;
 Fri, 19 Nov 2021 05:31:23 -0800 (PST)
MIME-Version: 1.0
References: <20211116061338.24900-1-Qi.Chen@windriver.com>
In-Reply-To: <20211116061338.24900-1-Qi.Chen@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 19 Nov 2021 08:31:12 -0500
Message-ID: <CADkTA4NaXgKBgwR82jpoxRQ424Fr6cMxVtJOjPKqstbgOw9Eaw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] openvswitch: fix configure error with dpdk enabled
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, Nov 16, 2021 at 1:13 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> When enabling 'dpdk' PACKAGECONFIG, the following error appears.
>
>   | configure: error: Could not find DPDK library in default search path
>
> Fix the error by tweaking the configure option regarding dpdk.
> Add pkgconfig to 'inherit' because pkgconfig is required at do_configure
> when dpdk is enabled.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-networking/openvswitch/openvswitch.inc    | 2 +-
>  recipes-networking/openvswitch/openvswitch_git.bb | 4 +---
>  2 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-networking/openvswitch/openvswitch.inc b/recipes-networking/openvswitch/openvswitch.inc
> index b354a84..831e0b3 100644
> --- a/recipes-networking/openvswitch/openvswitch.inc
> +++ b/recipes-networking/openvswitch/openvswitch.inc
> @@ -72,7 +72,7 @@ FILES:${PN} += "${datadir}/ovsdbmonitor"
>  FILES:${PN} += "/run"
>
>  FILES:${PN} += "${libdir}/python${PYTHON_BASEVERSION}/"
> -inherit autotools update-rc.d systemd python3native
> +inherit pkgconfig autotools update-rc.d systemd python3native
>
>  SYSTEMD_PACKAGES = "${PN}-switch"
>  SYSTEMD_SERVICE:${PN}-switch = " \
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index f1a5c4c..0fb7c13 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -32,10 +32,8 @@ SRC_URI += "git://github.com/openvswitch/ovs.git;protocol=https;branch=branch-2.
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
>
> -DPDK_INSTALL_DIR ?= "/opt/dpdk"
> -
>  PACKAGECONFIG ?= "libcap-ng"
> -PACKAGECONFIG[dpdk] = "--with-dpdk=${STAGING_DIR_TARGET}${DPDK_INSTALL_DIR}/share/${TARGET_ARCH}-native-linuxapp-gcc,,dpdk,dpdk"
> +PACKAGECONFIG[dpdk] = "--with-dpdk=shared,,dpdk,dpdk"
>  PACKAGECONFIG[libcap-ng] = "--enable-libcapng,--disable-libcapng,libcap-ng,"
>  PACKAGECONFIG[ssl] = ",--disable-ssl,openssl,"
>
> --
> 2.33.0
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
