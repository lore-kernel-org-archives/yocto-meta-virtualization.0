Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web12.7333.1601332341049554830
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Sep 2020 15:32:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=khOsLw7R;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id c8so4041162edv.5
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Sep 2020 15:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k7VAXtG/vZb0Sy8rZEPwQ7T4BfpiW2K75mTh5RMcxUw=;
        b=khOsLw7RuEJKlSc6iEFEUJyGGgvJP5p2nWNvOgtLzXeGKU3AyBdYjSgSlzoAqkZ5Sd
         NNQxtrV8OSrob/7i1x+HxXKwBpNNFRr+21HXes6j73eJF01+BZFTuxoAtYv4wHMOnMRd
         Ct2J6+2tuRmBVjZ7oj6MKT7HgN7qrP7FhzMzpWGYdBZ4YrfkyjVO7Pcckm1vCe0zNpqW
         XajpZZQkkZWxg7f/Nx3xIJ2f+Y4FIKxLxFw46LAjaiq52mjTt62KnvrZ9AlmNzNeltWi
         OV0WOZacyA4UCs63h78ogKHiV4nw94rqdHQg8jqqWC2uPO/SJzxQDEEqugu3BuNdGCz9
         Pr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k7VAXtG/vZb0Sy8rZEPwQ7T4BfpiW2K75mTh5RMcxUw=;
        b=ap6Un6cdCcLtRykT+TWCeANleWTRi7ZNMBRpvTTnFdMZ1ewUOWmGmiUeSF9LoDBKT5
         jvosQhWbdxnH/jpSao/9YY7vfR3HkJ6BdSNpyJHC4clfBv/lMvnkWi5arCAgsdwWh8wF
         mtaFoNGSPcyYEsbntj6q117qurJ70Oni30jOBaH9xZf4rbGsvukWkAylLu4dYnzLDmuc
         /mMRO/fu+lpWmxMIlPbjssk+QBmXxso+XuYBHbg21w99DC24meAONI2L+GSlHxu2/GkN
         bwcZPtUN+JW0HUcXxD2OkTFpwQhuF1g8ED+9UEX6QJA97v9+0aNXAXmQrTFiAuVzU68i
         Xrjg==
X-Gm-Message-State: AOAM532qHwOAqBag5/qGfW9lQ5UzVLEUDdHlvJnZBYC2O3L/9BuouAiP
	LfBwzu4r0nrkhgVJh52YrReei55UYtgL7CaC5Ek=
X-Google-Smtp-Source: ABdhPJxLBeNPPAWGgwuM2bAYm3r3ee/Y9tXy7B8ahvUMNwgGB16eLq3XYbWXLBYKGRyYzGQqBOCGVpAQr/lDx5D57C8=
X-Received: by 2002:a05:6402:16c9:: with SMTP id r9mr178328edx.27.1601332339344;
 Mon, 28 Sep 2020 15:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200922194539.51933-1-bruce.ashfield@gmail.com>
 <20200922194539.51933-3-bruce.ashfield@gmail.com> <CA+chaQe00HMya5KUDFONH9L4Wk4j1x=8tu-f=2KC1X-V9DR+HQ@mail.gmail.com>
 <CADkTA4M-LUew7NOucP-1cMK_JuXY2bNLsqCN+beQAmPcJBWC9w@mail.gmail.com>
In-Reply-To: <CADkTA4M-LUew7NOucP-1cMK_JuXY2bNLsqCN+beQAmPcJBWC9w@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 28 Sep 2020 18:32:07 -0400
Message-ID: <CADkTA4OR26qP07G24k14HhxViQddnaapPSEjnb0hQhYDSy8gfw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 3/7] busybox: add initrd variant
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 27, 2020 at 1:45 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Sun, Sep 27, 2020 at 12:08 PM Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > Not sure if it's worth adding an DISABLE_STATIC exception for libxcrypt in meta/conf/distro/include/no-static-libs.inc or libxcrypt recipe, but for DISTROs which include conf/distro/include/no-static-libs.inc this recipe fails with:
> > ld: error: cannot find -lcrypt
> > because there won't be static libcrypt.a in RSS.
>
> Aha.
>
> I hadn't considered that. I should be able to fix that up with a
> libxcrypte bbappend, that triggers only on a distro feature.

As it turns out, I've already been down the route with the busybox
configuration associated with the 'vmsep' distro feature.

So, I split the CONFIG_STATIC into a separate fragment, and only
enable it when the vmsep distro feature is set. When vmsep is set,
there's a bbappend for libxcrypt that makes sure it is statically
available (and that's been in the layer for a while now).

Hopefully that solves the issue.

Bruce

>
> Bruce
>
> >
> > On Tue, Sep 22, 2020 at 9:49 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >>
> >> From: Bruce Ashfield <bruce.ashfield@xilinx.com>
> >>
> >> Add a busybox variant that inherits almost all of its support from
> >> the core busybox recipe, but adds configuration values that are
> >> appropriate to be used in an initrd.
> >>
> >> In particular:
> >>
> >>   - we build busybox statically
> >>   - we enable runlevel and init functionality
> >>   - mdev is always enabled
> >>   - applet install support is enabled
> >>
> >> Signed-off-by: Bruce Ashfield <bruce.ashfield@xilinx.com>
> >> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >> ---
> >>  .../busybox/busybox-initrd/initrd.cfg         | 14 +++++++++++++
> >>  recipes-core/busybox/busybox-initrd/runx.cfg  |  1 +
> >>  recipes-core/busybox/busybox-initrd_1.32.0.bb | 20 +++++++++++++++++++
> >>  3 files changed, 35 insertions(+)
> >>  create mode 100644 recipes-core/busybox/busybox-initrd/initrd.cfg
> >>  create mode 100644 recipes-core/busybox/busybox-initrd/runx.cfg
> >>  create mode 100644 recipes-core/busybox/busybox-initrd_1.32.0.bb
> >>
> >> diff --git a/recipes-core/busybox/busybox-initrd/initrd.cfg b/recipes-core/busybox/busybox-initrd/initrd.cfg
> >> new file mode 100644
> >> index 0000000..9f64c4c
> >> --- /dev/null
> >> +++ b/recipes-core/busybox/busybox-initrd/initrd.cfg
> >> @@ -0,0 +1,14 @@
> >> +CONFIG_INIT=y
> >> +CNOFIG_FEATURE_UTMP=y
> >> +CONFIG_RUNLEVEL=y
> >> +CONFIG_FEATURE_USE_INITTAB=y
> >> +CONFIG_HALT=y
> >> +CONFIG_POWEROFF=y
> >> +CONFIG_FEATURE_KILL_DELAY=0
> >> +CONFIG_TELINIT_PATH=""
> >> +CONFIG_INIT_TERMINAL_TYPE=""
> >> +
> >> +# CONFIG_FEATURE_SHADOWPASSWDS is not set
> >> +CONFIG_USE_BB_PWD_GRP=y
> >> +
> >> +CONFIG_STATIC=y
> >> diff --git a/recipes-core/busybox/busybox-initrd/runx.cfg b/recipes-core/busybox/busybox-initrd/runx.cfg
> >> new file mode 100644
> >> index 0000000..1f1ac6a
> >> --- /dev/null
> >> +++ b/recipes-core/busybox/busybox-initrd/runx.cfg
> >> @@ -0,0 +1 @@
> >> +CONFIG_FEATURE_INSTALLER=y
> >> diff --git a/recipes-core/busybox/busybox-initrd_1.32.0.bb b/recipes-core/busybox/busybox-initrd_1.32.0.bb
> >> new file mode 100644
> >> index 0000000..82edb57
> >> --- /dev/null
> >> +++ b/recipes-core/busybox/busybox-initrd_1.32.0.bb
> >> @@ -0,0 +1,20 @@
> >> +FILESEXTRAPATHS_prepend := "${THISDIR}/busybox-initrd:${COREBASE}/meta/recipes-core/busybox/busybox:${COREBASE}/meta/recipes-core/busybox/files:"
> >> +
> >> +require recipes-core/busybox/busybox_${PV}.bb
> >> +
> >> +SRC_URI += "file://init.cfg \
> >> +            file://mdev.cfg \
> >> +            file://runx.cfg \
> >> +            file://initrd.cfg"
> >> +
> >> +S = "${WORKDIR}/busybox-${PV}"
> >> +
> >> +# override security-flags settings, we have some warnings to ignore
> >> +SECURITY_STRINGFORMAT = ""
> >> +
> >> +# we do this to get the target binary available to recipes that
> >> +# depend on busybox
> >> +SYSROOT_DIRS += "/bin"
> >> +BUSYBOX_SPLIT_SUID = "0"
> >> +
> >> +FILES_${PN} += "${sysconfdir}/init.d/*"
> >> --
> >> 2.19.1
> >>
> >>
> >> 
> >>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
