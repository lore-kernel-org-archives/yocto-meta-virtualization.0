Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web11.10408.1585140792493759599
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 Mar 2020 05:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YCktHS9d;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id de14so2202468edb.4
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 25 Mar 2020 05:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MyzmJ96dUt14W5ChAsSItsR164nBdlL4FQa7NJ+Q7iY=;
        b=YCktHS9d/8TDAu5zPKdczsOj1aP8dDqIlrkqFHQQpbjLW+xeW8LmTYHfsDhkZkQSH6
         L/wRnxQ0NK7rwXHWi35o0ZYQC9T3i2YScyrtfNCFXy7lzh1oWo4cvtICuIiK3NtNd9ME
         X+9hVMAvAYbKpBZVXy33rFI1h7mH+hNqXbIBfV5UDbgRVxkWuIP/zrjnbErBztHZClEe
         QI2foXbO7vgv6KBaDZvv56gmhs/2WkwDzYflzRYr7fk2golAEoXTWE0OMRHjOlzxpHyc
         qD/cYqMJjMFp2z/F9SdtJAXVOnK1SsAYIjkCt2JeYCXgHuoLINzAIL0kNuum34qBmRgT
         12rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MyzmJ96dUt14W5ChAsSItsR164nBdlL4FQa7NJ+Q7iY=;
        b=asmDBuYJKg6HQAqoq3hE8wtPR9hqoCNV/Ecwjb6U7w8RruAVOsecV4YmIH7AA+Ubf+
         crvuUF70CB7maHfDG+hp4hIet63fz7iQJYIlMsYJzhbxBuMJAx5aR3vOpEBoZSSvXbg2
         dPFGWEZmyabfAkQrbDMc/tEL1jSMN9k7RCI6rkb/16rYddIr5K7rXUw8lGiu4lF3B6XJ
         pggi1bpFxc+H7iANYbmr37zGlg2NJ0lLVj/2tlLDn3PkyA9V58kcAh7/+hQU9r6TxpgC
         fEXZu37MHojfbtXfA8JAJo7ah2okfcMINye10KuoYZ9YbXaAjb6m2Uc86bfC5iqitFUz
         LSpg==
X-Gm-Message-State: ANhLgQ2z5PW2DepnwmDOme/xnr0o95htqAtdDYVpZjNluvTgYfvxsfxt
	O1CzqKvP5d0i3/eVeTAnvv8hQNSzPAqEEf47HW4=
X-Google-Smtp-Source: ADFU+vvNg6N8FPxjOP48BRG2owloo+kNnS5tnKNyOyFDKa4eo0bDT5qqFxBZ7StXrBeh4vCehQ6kGOO5wJg6nwjtmjw=
X-Received: by 2002:a17:906:c410:: with SMTP id u16mr1513382ejz.330.1585140790938;
 Wed, 25 Mar 2020 05:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200325054222.387399-1-raj.khem@gmail.com>
In-Reply-To: <20200325054222.387399-1-raj.khem@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 25 Mar 2020 08:53:00 -0400
Message-ID: <CADkTA4P-J=GzikExuvTk7ZE+ej5XocPK7KEQmQ5X1kR3fb1+zQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] openvswitch: Enable LTO
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 25, 2020 at 1:42 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> openvswitch binaries can shed some size with lto
>
> --- a/packages/rdk-linux-gnueabi/openvswitch/openvswitch-ovsdb/files-in-package.txt
> +++ b/packages/rdk-linux-gnueabi/openvswitch/openvswitch-ovsdb/files-in-package.txt
> @@ -1,7 +1,7 @@
> drwxr-xr-x root       root             3488 ./usr
> drwxr-xr-x root       root             3488 ./usr/bin
> --rwxr-xr-x root       root           378984 ./usr/bin/ovsdb-client
> --rwxr-xr-x root       root           353628 ./usr/bin/ovsdb-tool
> --rwxr-xr-x root       root          1411216 ./usr/bin/ovs-vsctl
> +-rwxr-xr-x root       root           203356 ./usr/bin/ovsdb-client
> +-rwxr-xr-x root       root           233172 ./usr/bin/ovsdb-tool
> +-rwxr-xr-x root       root           287012 ./usr/bin/ovs-vsctl
> drwxr-xr-x root       root             3488 ./usr/sbin
> --rwxr-xr-x root       root           379404 ./usr/sbin/ovsdb-server
> +-rwxr-xr-x root       root           287672 ./usr/sbin/ovsdb-server
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  recipes-networking/openvswitch/openvswitch_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index 07258be..bd74f49 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -37,6 +37,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
>
>  DPDK_INSTALL_DIR ?= "/opt/dpdk"
>
> +CFLAGS += "-flto"
> +LDFLAGS += "-flto"

Shouldn't this be something that is configurable ? I know that I want
it to be. i.e. isn't there some sort of distro feature that we can use
to enable or disable this by default ?

Bruce

> +
>  PACKAGECONFIG ?= "libcap-ng"
>  PACKAGECONFIG[dpdk] = "--with-dpdk=${STAGING_DIR_TARGET}${DPDK_INSTALL_DIR}/share/${TARGET_ARCH}-native-linuxapp-gcc,,dpdk,dpdk"
>  PACKAGECONFIG[libcap-ng] = "--enable-libcapng,--disable-libcapng,libcap-ng,"
> --
> 2.26.0
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
