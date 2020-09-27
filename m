Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.18331.1601228760543993976
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 27 Sep 2020 10:46:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CIajx2t/;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id e23so5235177eja.3
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 27 Sep 2020 10:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xgsdG7Ph08jtc/8JyCZxmY4VpgjxW5Q507cT52EL+Vs=;
        b=CIajx2t/R3UYYL+PphOeLRqsaz/JgyRFz8K69N2WxGINYf/5x6VHwi+BLkocbsXzak
         ekNZ7bw47WR6o7BWF185PKIyZEeFHBfYcFwo/rABjRgG0bGaDl+N3LWVTUEJ037o+ZuY
         3pm2ho7oETxzK0UpXTUX+W3FC9Yl3LJ63KlXl2U7/6n5bD5kBZX2ofVeMAzZ2086Bcl3
         jCYlEDPIXLF5xotZQRTzvloy5SalEP63IulQkVpsHqHh/tiVazf7aFDaZIB1RdCnA20b
         dKwKW5lLodjIRqiMOnjY0IYCB1EbCfg+DupXMjzszZkwDQHhLdhiPhyc8eohpSSx9RGd
         Pcsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xgsdG7Ph08jtc/8JyCZxmY4VpgjxW5Q507cT52EL+Vs=;
        b=jVUYIlucIMhQ3A36RXgK+sbGHQedQmtnT/HYI66L2udGvoanpIlpz1PIz9vQqiJkDM
         4Cg1RngVG1qUT4i00ivpetrfrJ4fYIdHnKvzwjXtq5Ews6iSH9/SWxcndJIH3C6V23NG
         hJt+sL63d95VhV+ZswZvJTlP/HDiKdwtMl3YV5EnNG+SlmsRTMgacbYNAzi64GNzn0XG
         fo+zDuVF7kCa6FvmO27KicR1OQ24U5KZbj+8tOqqZJ1iez+2pB9MSurP/YBs0C1cl9SZ
         cmpXOOgvEIzlo0AVzVNZ5OKVxrL9bnBoQh+dImOMFy5RQv3CVTHmDjGMsr5KcKuvimaC
         xXRg==
X-Gm-Message-State: AOAM530c5XKX5XR2N/5pF7bPWMG2b3EeIGWFxurxg4F2V7wblCPP7iHE
	q1hIk/uWhIj43DhauVuJdrQ485WtjgrmACn5Qag=
X-Google-Smtp-Source: ABdhPJyBZIaMIyqUJIyX+TGPNj6J7tDqRkQrEQK+3z8nAGxTpyQZQVhtyHACEjEZjzjJ/tRyfWjF8CB1BtTPt5ATRGU=
X-Received: by 2002:a17:906:1e11:: with SMTP id g17mr11636820ejj.298.1601228758889;
 Sun, 27 Sep 2020 10:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200922194539.51933-1-bruce.ashfield@gmail.com>
 <20200922194539.51933-3-bruce.ashfield@gmail.com> <CA+chaQe00HMya5KUDFONH9L4Wk4j1x=8tu-f=2KC1X-V9DR+HQ@mail.gmail.com>
In-Reply-To: <CA+chaQe00HMya5KUDFONH9L4Wk4j1x=8tu-f=2KC1X-V9DR+HQ@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sun, 27 Sep 2020 13:45:47 -0400
Message-ID: <CADkTA4M-LUew7NOucP-1cMK_JuXY2bNLsqCN+beQAmPcJBWC9w@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 3/7] busybox: add initrd variant
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 27, 2020 at 12:08 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Not sure if it's worth adding an DISABLE_STATIC exception for libxcrypt in meta/conf/distro/include/no-static-libs.inc or libxcrypt recipe, but for DISTROs which include conf/distro/include/no-static-libs.inc this recipe fails with:
> ld: error: cannot find -lcrypt
> because there won't be static libcrypt.a in RSS.

Aha.

I hadn't considered that. I should be able to fix that up with a
libxcrypte bbappend, that triggers only on a distro feature.

Bruce

>
> On Tue, Sep 22, 2020 at 9:49 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>>
>> From: Bruce Ashfield <bruce.ashfield@xilinx.com>
>>
>> Add a busybox variant that inherits almost all of its support from
>> the core busybox recipe, but adds configuration values that are
>> appropriate to be used in an initrd.
>>
>> In particular:
>>
>>   - we build busybox statically
>>   - we enable runlevel and init functionality
>>   - mdev is always enabled
>>   - applet install support is enabled
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@xilinx.com>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>> ---
>>  .../busybox/busybox-initrd/initrd.cfg         | 14 +++++++++++++
>>  recipes-core/busybox/busybox-initrd/runx.cfg  |  1 +
>>  recipes-core/busybox/busybox-initrd_1.32.0.bb | 20 +++++++++++++++++++
>>  3 files changed, 35 insertions(+)
>>  create mode 100644 recipes-core/busybox/busybox-initrd/initrd.cfg
>>  create mode 100644 recipes-core/busybox/busybox-initrd/runx.cfg
>>  create mode 100644 recipes-core/busybox/busybox-initrd_1.32.0.bb
>>
>> diff --git a/recipes-core/busybox/busybox-initrd/initrd.cfg b/recipes-core/busybox/busybox-initrd/initrd.cfg
>> new file mode 100644
>> index 0000000..9f64c4c
>> --- /dev/null
>> +++ b/recipes-core/busybox/busybox-initrd/initrd.cfg
>> @@ -0,0 +1,14 @@
>> +CONFIG_INIT=y
>> +CNOFIG_FEATURE_UTMP=y
>> +CONFIG_RUNLEVEL=y
>> +CONFIG_FEATURE_USE_INITTAB=y
>> +CONFIG_HALT=y
>> +CONFIG_POWEROFF=y
>> +CONFIG_FEATURE_KILL_DELAY=0
>> +CONFIG_TELINIT_PATH=""
>> +CONFIG_INIT_TERMINAL_TYPE=""
>> +
>> +# CONFIG_FEATURE_SHADOWPASSWDS is not set
>> +CONFIG_USE_BB_PWD_GRP=y
>> +
>> +CONFIG_STATIC=y
>> diff --git a/recipes-core/busybox/busybox-initrd/runx.cfg b/recipes-core/busybox/busybox-initrd/runx.cfg
>> new file mode 100644
>> index 0000000..1f1ac6a
>> --- /dev/null
>> +++ b/recipes-core/busybox/busybox-initrd/runx.cfg
>> @@ -0,0 +1 @@
>> +CONFIG_FEATURE_INSTALLER=y
>> diff --git a/recipes-core/busybox/busybox-initrd_1.32.0.bb b/recipes-core/busybox/busybox-initrd_1.32.0.bb
>> new file mode 100644
>> index 0000000..82edb57
>> --- /dev/null
>> +++ b/recipes-core/busybox/busybox-initrd_1.32.0.bb
>> @@ -0,0 +1,20 @@
>> +FILESEXTRAPATHS_prepend := "${THISDIR}/busybox-initrd:${COREBASE}/meta/recipes-core/busybox/busybox:${COREBASE}/meta/recipes-core/busybox/files:"
>> +
>> +require recipes-core/busybox/busybox_${PV}.bb
>> +
>> +SRC_URI += "file://init.cfg \
>> +            file://mdev.cfg \
>> +            file://runx.cfg \
>> +            file://initrd.cfg"
>> +
>> +S = "${WORKDIR}/busybox-${PV}"
>> +
>> +# override security-flags settings, we have some warnings to ignore
>> +SECURITY_STRINGFORMAT = ""
>> +
>> +# we do this to get the target binary available to recipes that
>> +# depend on busybox
>> +SYSROOT_DIRS += "/bin"
>> +BUSYBOX_SPLIT_SUID = "0"
>> +
>> +FILES_${PN} += "${sysconfdir}/init.d/*"
>> --
>> 2.19.1
>>
>>
>> 
>>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
