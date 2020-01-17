Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web09.2652.1579296443530650028
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Jan 2020 13:27:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m93qQGZ8;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id dc19so23602137edb.10
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Jan 2020 13:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QMjJMV714zBkYV30m2yhuog6bxdfLgeQxfHUvlshBhs=;
        b=m93qQGZ8rUdjodQmSsvPZyOyTiCYX5hRrI58hvkLctkGbmAD2tKJTohGWbyYfqyfld
         1fljr74JrvGPVuVNLCpTwBrHO/AYQb+j06nCgCWbGsdsY1fWfNeYXeMmwV9oOb+2DRgS
         m80YjBOQSSfvv/ulKGScOy66JbWgOL/30/Zp+/kQcpHe+9cvjmaqmW2cgY/YR/u+2ZMf
         0omD1JsrLNT7neYANzWvfSCbOEjlcO07jDoAoVRaRRTs2W2TzzaxjuZV6qxXg7402Xsd
         bntajsz5fNNHckpMxLhXyuTIp3g5CoCzTAyG7VuXVJRlDxfubWn9QiCcfbiL7+K8ET1T
         fyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QMjJMV714zBkYV30m2yhuog6bxdfLgeQxfHUvlshBhs=;
        b=cQJU1cRFfYEBr7XJzMNFQYWA5b+/UX33EQK6AqKMhukYE+r2dIRUyTNmWZ6EvzdVhh
         FLNP/hJZ+sNWoxG52qNQRF7rIx/jgJz6K+u5yGJrl+0zCHUaladiQ3d/q15EmFYJnbbf
         qj8dnKdO5/EiWNAxgBVB0LAnhzzuT5ERCstq1w/T92B6bWJE1XXCmMuiA2l3dIDhoLfU
         0P5A4+DDphtjpFktbm74HRU58BtJEErYYkvv4s+4CwrPYrX+SSX44RN8uvlJhQU9BSLp
         PC+PF4AtXaN+e/tAl96zq1Kx/MMlvkcekpXisrMlqgbNO3/uMD2wvM4ErBvUc5a5AkyA
         S7sA==
X-Gm-Message-State: APjAAAUKLXBhKRqmdgBTZO9394C9yZdJXzfeAsR/5ZeEtcida0WrfUgX
	71GM1bxyGlcuSEgNDxgmfWKXzwOUxwL1f2opUzc=
X-Google-Smtp-Source: APXvYqz8ev5YWs82GJxULsHva8bNOWqV7eGj2nSqfv5vVRgsrl0IMifUj6nAGQ0lYCjSCDjMPitsNyq85x+bmQZqM/4=
X-Received: by 2002:a50:ec1a:: with SMTP id g26mr5941405edr.164.1579296442006;
 Fri, 17 Jan 2020 13:27:22 -0800 (PST)
MIME-Version: 1.0
References: <20200115232936.23207-1-stefan@agner.ch>
In-Reply-To: <20200115232936.23207-1-stefan@agner.ch>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 17 Jan 2020 16:27:10 -0500
Message-ID: <CADkTA4P08iFSf76K5UC+JuBRPCSg_VKfVRucAsEpov=pd8T+VA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/2] conmon: bump to version 2.0.9
To: Stefan Agner <stefan@agner.ch>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Tim Orling <timothy.t.orling@linux.intel.com>, Stefan Agner <stefan.agner@toradex.com>
Content-Type: text/plain; charset="UTF-8"

I've merged the version bumps to master.

But I'm still undecided on bringing them to Zeus. Although they are
largely bug fix releases .. they aren't entirely bug fixes.

I'd rather not increment versions on the older branches unless we are
fixing a CVE, or individual patches are difficult to backport.

Thoughts ? I'm open to being convinced to do the version bumps on the
released branch, but didn't see anything really compelling in the
shortlogs.

Bruce

On Wed, Jan 15, 2020 at 6:29 PM Stefan Agner <stefan@agner.ch> wrote:
>
> From: Stefan Agner <stefan.agner@toradex.com>
>
> Bump to latest version 2.0.9. This also makes our Makefile fix obsolete
> as the fix has been aplied upstream.
>
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  .../{conmon_2.0.0.bb => conmon_2.0.9.bb}      |  3 +-
>  ...ail-if-clean-is-called-without-a-bui.patch | 31 -------------------
>  2 files changed, 1 insertion(+), 33 deletions(-)
>  rename recipes-containers/conmon/{conmon_2.0.0.bb => conmon_2.0.9.bb} (83%)
>  delete mode 100644 recipes-containers/conmon/files/0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch
>
> diff --git a/recipes-containers/conmon/conmon_2.0.0.bb b/recipes-containers/conmon/conmon_2.0.9.bb
> similarity index 83%
> rename from recipes-containers/conmon/conmon_2.0.0.bb
> rename to recipes-containers/conmon/conmon_2.0.9.bb
> index f4e2cd6..fc76f15 100644
> --- a/recipes-containers/conmon/conmon_2.0.0.bb
> +++ b/recipes-containers/conmon/conmon_2.0.9.bb
> @@ -6,10 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=61af0b6932ea7b12fb9142721043bc77"
>
>  DEPENDS = "glib-2.0"
>
> -SRCREV = "e217fdff82e0b1a6184a28c43043a4065083407f"
> +SRCREV = "60b42f20f222df9da07a01ee444327348b9f54ee"
>  SRC_URI = "\
>      git://github.com/containers/conmon.git \
> -    file://0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch \
>  "
>
>  SRC_URI[md5sum] = "5c711911d766d76813333c3812277574"
> diff --git a/recipes-containers/conmon/files/0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch b/recipes-containers/conmon/files/0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch
> deleted file mode 100644
> index 8d2b473..0000000
> --- a/recipes-containers/conmon/files/0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 6ef63dfcc65d5401bc7cc7170d569cefcdadcb38 Mon Sep 17 00:00:00 2001
> -From: Stefan Agner <stefan@agner.ch>
> -Date: Fri, 30 Aug 2019 17:49:22 +0200
> -Subject: [PATCH] Makefile: don't fail if clean is called without a build
> -
> -Do not fail when calling the clean target without building first.
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Stefan Agner <stefan@agner.ch>
> ----
> - Makefile | 3 +--
> - 1 file changed, 1 insertion(+), 2 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index fb0e4fb..b525595 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -66,8 +66,7 @@ bin:
> -
> - .PHONY: clean
> - clean:
> --      rm -f bin/conmon src/*.o
> --      rmdir bin
> -+      rm -rf bin/ src/*.o
> -
> - .PHONY: install install.bin install.crio install.podman podman crio
> - install: install.bin
> ---
> -2.23.0
> -
> --
> 2.17.1
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
