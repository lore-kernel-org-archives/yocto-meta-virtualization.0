Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.11142.1626287702160949578
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Jul 2021 11:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WLrFUSmw;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id t2so4070564edd.13
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 14 Jul 2021 11:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t8nSobRINh8tbtqyEz2DbYtR+BpHl2jwt0jNTiEP5gM=;
        b=WLrFUSmwkfisZtDxVpMXJLsBCWayjeI7HG8+RNfXpb7MdCg809932QvPELjDS/Hg+b
         F5aGtoYy3mgSF1yeClRoxPd3vxDAeRqHszPfRmpUcPgaqx/FgL+7aD9ZeacEhVRDPMzy
         edhMZ7x9vzdT9RXnNoqiJYrHpSroTkd6K2sWArpkfVZlFc2zmdb7TDIiidNvYd/u8mwP
         f9c3j5TgYjimcwgZnqzXZyU6pSpPAPMcxmtgyZWj8ulb80ZESNVi0FIXi8Knpn/Ch4+y
         VkMzgQ2Eocxv6Tu7ClGgi+BvGDlXPj4XJcsAFET/5+ng/PJNrGjPTFLinIV8uoxuoH7X
         KOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t8nSobRINh8tbtqyEz2DbYtR+BpHl2jwt0jNTiEP5gM=;
        b=BfMwoRfIdYfdl/sg0q8B8VFC6EDzW0HSIQc/pbYFoLXuvaB/x2W9DPknizlDojz6Ln
         PToxfwQg0eJMQln8nR8FeZ1WNcxAcJpgJeVGdSxROtKDfNQgGjy2zYdYqwcvWkF5ueRy
         izbRhfBkGTqdGtuycKPeQ7UEtVcRnrTRZWsjXW+kuDrwXFXQf6liQXSmgGoDKYReDHdJ
         jc7ayRYf150CYUWsPUvGAbgVAqRYOxE+ndKOWFiZxpBlUWAWprSpXzHyqk/jGQbXhgpK
         kRdES+HUOODAoYws/84LsDecdbRVCbgmi9XrWxesztvJkH/k7+YWgavk2WnaNUH+IQFq
         1kGw==
X-Gm-Message-State: AOAM5300dY/JupYcMKmFgTQzRIPaYchYiLtYupWVG8WAN3J6yLQT2M56
	u/XUokLO9qLann42W1FtJskuqL4OZZppsJhetLQ=
X-Google-Smtp-Source: ABdhPJwEc41IaCtgB8c7r7gK4Hg3aL4yxmK0XFCyyt7y+WIvkyfzaZk3ShKw0zDtLds7bPwAcz3lcGfdqPAlYMgfF1c=
X-Received: by 2002:a05:6402:b79:: with SMTP id cb25mr15412004edb.164.1626287700599;
 Wed, 14 Jul 2021 11:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <b3xa.1626287039521799092.2tI6@lists.yoctoproject.org>
In-Reply-To: <b3xa.1626287039521799092.2tI6@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 14 Jul 2021 14:34:49 -0400
Message-ID: <CADkTA4NFpEYES7AJXCaxGkPbkSLNyagFscMhBEQ5-gC+5i15VQ@mail.gmail.com>
Subject: Re: [meta-virtualization] Fetcher failure in crun recipe #meta-virtualization #yocto
To: Mitch Gaines <gainesmitch2@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 14, 2021 at 2:24 PM Mitch Gaines <gainesmitch2@gmail.com> wrote:
>
> Hi there,
>
> I have run into a bit of an issue with the crun recipe on the dunfell branch and from my online searching, it didn't appear to be a known issue. With that in mind, am I missing something that could potentially cause this?
>
> What is peculiar about this is, from the looks of it, those URLs and revisions check out as valid. So, I'm really not sure why it is failing. Do you think it could it be a problem with my environment? If not, please accept this as my bug report :)
>

It is just the upstream repositories switching their branches away
from master -> main.

It is annoying, since it breaks our parsing.

We've already fixed crun once, and I'll queue up another fix if one of
the supporting recipes as now changed branches.

Bruce

> Thanks for the help on this.
>
> See below:
>
> $ bitbake crun
> Loading cache: 100% |###############################################################################################################################################################################| Time: 0:00:00
> Loaded 3547 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           = "1.46.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "arm-poky-linux-gnueabi"
> MACHINE              = "orange-pi-plus2e"
> DISTRO               = "poky"
> DISTRO_VERSION       = "3.1.9"
> TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
> TARGET_FPU           = "hard"
> meta
> meta-poky
> meta-yocto-bsp       = "dunfell:10763296f84b8b1292d1dbaaac8e682592388d1b"
> meta-sunxi           = "dunfell:f367a1ff2c329c801659c6de77910456a4167430"
> meta-oe
> meta-filesystems
> meta-python
> meta-networking
> meta-perl            = "dunfell:7bd47ef6c98323c95a9e527129dca98c9a65ee08"
> meta-virtualization  = "dunfell:bf2930c69b163af0ece08cae2649afffa5b3e810"
> meta-security        = "dunfell:6466c6fb02f36f459b06d434484df26e083f3489"
>
> Initialising tasks: 100% |##########################################################################################################################################################################| Time: 0:00:01
> Sstate summary: Wanted 443 Found 0 Missed 443 Current 220 (0% match, 33% complete)
> NOTE: Executing Tasks
> WARNING: oci-image-spec-v1.0.1+gitAUTOINC+bd4f8fcb09-r0 do_fetch: Failed to fetch URL git://github.com/opencontainers/image-spec.git;destsuffix=git/src/github.com/opencontainers/image-spec, attempting MIRRORS if available
> ERROR: oci-image-spec-v1.0.1+gitAUTOINC+bd4f8fcb09-r0 do_fetch: Fetcher failure: Unable to find revision bd4f8fcb0979a663d8b97a1d4d9b030b3d2ca1fa in branch master even from upstream
> ERROR: oci-image-spec-v1.0.1+gitAUTOINC+bd4f8fcb09-r0 do_fetch: Fetcher failure for URL: 'git://github.com/opencontainers/image-spec.git;destsuffix=git/src/github.com/opencontainers/image-spec'. Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in: /home/mitch/bin/yocto/sunxi-podman-demo/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/oci-image-spec/v1.0.1+gitAUTOINC+bd4f8fcb09-r0/temp/log.do_fetch.595548
> ERROR: Task (/home/mitch/bin/yocto/sunxi-podman-demo/layers/meta-virtualization/recipes-containers/oci-image-spec/oci-image-spec_git.bb:do_fetch) failed with exit code '1'
> WARNING: crun-0.10.2+gita43f72196f7aaf713dc997eaddd0f08612f60ac0-r0 do_fetch: Failed to fetch URL git://github.com/opencontainers/image-spec.git;branch=master;name=ispec;destsuffix=git/libocispec/image-spec, attempting MIRRORS if available
> ERROR: crun-0.10.2+gita43f72196f7aaf713dc997eaddd0f08612f60ac0-r0 do_fetch: Fetcher failure: Unable to find revision 775207bd45b6cb8153ce218cc59351799217451f in branch master even from upstream
> ERROR: crun-0.10.2+gita43f72196f7aaf713dc997eaddd0f08612f60ac0-r0 do_fetch: Fetcher failure for URL: 'git://github.com/opencontainers/image-spec.git;branch=master;name=ispec;destsuffix=git/libocispec/image-spec'. Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in: /home/mitch/bin/yocto/sunxi-podman-demo/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/crun/0.10.2+gita43f72196f7aaf713dc997eaddd0f08612f60ac0-r0/temp/log.do_fetch.595555
> ERROR: Task (/home/mitch/bin/yocto/sunxi-podman-demo/layers/meta-virtualization/recipes-containers/crun/crun_git.bb:do_fetch) failed with exit code '1'
>
>
> Best Regards,
> Mitch
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
