Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web10.2301.1586401478743386918
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Apr 2020 20:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N7ULVuHD;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id e5so11464664edq.5
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Apr 2020 20:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PZCknqEnWlR7VL3PX83hlElr1DFdwjvliqpuYrAItEE=;
        b=N7ULVuHDVuwEJPU8ZXXdVwPUOgcnwpE3UScolvdKn0PVkU5WxmSWelMkbb1YFScL2J
         lRf1a8GYQ+pzm3tc+HoCrv3tBvvRtxB18xA4GdFnudtMPrgMIVm4eZIkaxE+rXEkBuQk
         wqh+msCZwJ0TsNXzcTp9MMZc6lMIB+m9lgePl/ZPHXTrEKCzFZB19TQ7aOAeW/6TMb++
         AI7Rsp62sK016hBC1U17ptHo3wjfr723wmBCMM+7BwJo0ScKYIgW9Z6bi8J4IfJoa4Iv
         wPY8788OKmjH6wCvODmCis3+9yh4kX/b7k/oO4odIkUSzgAcgWQahEybhnBNXCmeQL5N
         5oBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PZCknqEnWlR7VL3PX83hlElr1DFdwjvliqpuYrAItEE=;
        b=dXuBCL65Ij0bSehf5/ry2Xi2Py3OS++jf8cvWCF82RuujLbZZJtYp0aej5VbqP2Ruv
         Kshx9ci12g1TV5DSRPemRSCIEH+HaKtQpyEpta3hm3aGkFsieiCN3eO47QxunhDwTp47
         ztcBirH495Uq+j1ri6iYdHdx897jf2rKy8B385PTx/1jHLV5CFCgGEU3rbL8O8tOdl2E
         3Zp0F4C5rdDvZtn+46VsD10kGz2Q5z4zgCHtxtM6a4wJLfN3cR1AiMCRX7JeIFgVtqs0
         c34qBEqSkycbGX4BkQJ0Veo5dS/mUYvgsm0qWrJAKXI/WXSOEiW1jqAJGv6okXKFEZRO
         Xs2Q==
X-Gm-Message-State: AGi0PuaPeWZJGO8Rt8GgQTl5JwPn6sNvmksuN2ySvDkDPgyyi9K9Nv/W
	HC67K2gVvI+/0FjNLxpbj5Vg164sI/fqJXtDhrVJnoOu
X-Google-Smtp-Source: APiQypJxO1c0ZozxyWF0zxOQFbl1m5G0RDQ+7UyH5Uc1AnRZ1HsjLojPocWreprrpeDsDk52r6Eo0rhOfaImCyrOt/w=
X-Received: by 2002:a17:906:7c2:: with SMTP id m2mr8759617ejc.339.1586401477176;
 Wed, 08 Apr 2020 20:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200406042049.28540-1-yanfei.xu@windriver.com>
In-Reply-To: <20200406042049.28540-1-yanfei.xu@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 8 Apr 2020 23:04:26 -0400
Message-ID: <CADkTA4PNF2NoigLJrt1cTFQKoV76Feb27fPzPK+1pGgh7v4vOw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] lxc: Fix containers failed to start with LXC 3.2.1
To: "Xu, Yanfei" <yanfei.xu@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

As of April 6th, LXC 4.0 has been released.

Given that it is a LTS release, I'd prefer to jump to that for the
dunfell branch .. even if it is just recently released by LXC.

Can you try and uprev ? If not, I'll get to it in the next few weeks,
but I'll hold on merging this patch in preference for the uprev.

Bruce

On Mon, Apr 6, 2020 at 12:21 AM Xu, Yanfei <yanfei.xu@windriver.com> wrote:
>
> From: Yanfei Xu <yanfei.xu@windriver.com>
>
> LXC 3.2.1 has a bug that containers may start failed in some cases, and
> this patch from upstream fix it.
>
> -------error message------
> lxc-start vc0 20200323102154.497 ERROR    cgfsng -
> cgfsng.c:__do_cgroup_enter:1500 - No space left on device - Failed to
> enter cgroup "/sys/fs/cgroup/cpuset//lxc.monitor/vc0-4/cgroup.procs"
> lxc-start vc0 20200323102154.497 ERROR    start -
> start.c:__lxc_start:2009 - Failed to enter monitor cgroup
> lxc-start vc0 20200323102154.497 ERROR    lxccontainer -
> lxccontainer.c:wait_on_daemonized_start:872 - Received container state
> "STOPPING" instead of "RUNNING"
> lxc-start vc0 20200323102154.497 ERROR    lxc_start -
> lxc_start.c:main:329 - The container failed to start
> lxc-start vc0 20200323102154.497 ERROR    lxc_start -
> lxc_start.c:main:332 - To get more details, run the container in
> foreground mode
> -------------------------
>
> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> ---
>  ...1-cgroups-initialize-cpuset-properly.patch | 40 +++++++++++++++++++
>  recipes-containers/lxc/lxc_3.2.1.bb           |  1 +
>  2 files changed, 41 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/0001-cgroups-initialize-cpuset-properly.patch
>
> diff --git a/recipes-containers/lxc/files/0001-cgroups-initialize-cpuset-properly.patch b/recipes-containers/lxc/files/0001-cgroups-initialize-cpuset-properly.patch
> new file mode 100644
> index 0000000..9d0c2ae
> --- /dev/null
> +++ b/recipes-containers/lxc/files/0001-cgroups-initialize-cpuset-properly.patch
> @@ -0,0 +1,40 @@
> +From b31d62b847a3ee013613795094cce4acc12345ef Mon Sep 17 00:00:00 2001
> +From: Christian Brauner <christian.brauner@ubuntu.com>
> +Date: Sun, 28 Jul 2019 23:13:26 +0200
> +Subject: [PATCH] cgroups: initialize cpuset properly
> +
> +Closes #3108.
> +Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
> +
> +Upstream-Status: Backport[https://github.com/lxc/lxc/pull/3108]
> +
> +Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> +---
> + src/lxc/cgroups/cgfsng.c | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/lxc/cgroups/cgfsng.c b/src/lxc/cgroups/cgfsng.c
> +index 7b8fe6736..c29c0958e 100644
> +--- a/src/lxc/cgroups/cgfsng.c
> ++++ b/src/lxc/cgroups/cgfsng.c
> +@@ -496,12 +496,12 @@ static bool cg_legacy_filter_and_set_cpus(char *path, bool am_initialized)
> +       }
> +
> +       if (!flipped_bit) {
> +-              DEBUG("No isolated or offline cpus present in cpuset");
> +-              return true;
> ++              cpulist = lxc_cpumask_to_cpulist(possmask, maxposs);
> ++              TRACE("No isolated or offline cpus present in cpuset");
> ++      } else {
> ++              cpulist = move_ptr(posscpus);
> ++              TRACE("Removed isolated or offline cpus from cpuset");
> +       }
> +-      DEBUG("Removed isolated or offline cpus from cpuset");
> +-
> +-      cpulist = lxc_cpumask_to_cpulist(possmask, maxposs);
> +       if (!cpulist) {
> +               ERROR("Failed to create cpu list");
> +               return false;
> +--
> +2.18.2
> +
> diff --git a/recipes-containers/lxc/lxc_3.2.1.bb b/recipes-containers/lxc/lxc_3.2.1.bb
> index 9592dd9..57e48c1 100644
> --- a/recipes-containers/lxc/lxc_3.2.1.bb
> +++ b/recipes-containers/lxc/lxc_3.2.1.bb
> @@ -50,6 +50,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>         file://dnsmasq.conf \
>         file://lxc-net \
>         file://0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch \
> +       file://0001-cgroups-initialize-cpuset-properly.patch \
>         "
>
>  SRC_URI[md5sum] = "4886c8d1c8e221fe526eefcb47857b85"
> --
> 2.24.1
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
