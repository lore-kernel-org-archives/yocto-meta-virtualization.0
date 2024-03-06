Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D618EC5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 20:22:54 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.6074.1709756574198930831
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 06 Mar 2024 12:22:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UESmhtCJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-29a74c88f74so17443a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 06 Mar 2024 12:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709756574; x=1710361374; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcAG9ysgyiO5MnK5l9Zpz4SIhGZKLBPUayRcU0PfwC4=;
        b=UESmhtCJfMPf8kLAULo8ofabZB27MUEHe1hR7odiXbqS+9Rp8ZbA3Vi8BViwGMHouz
         puqoAWpZYa9IFlzVduxMgck4oEkoSNZGkcm27WPUGMhXNBj3woRQlVF9PdyOhQIU8gz3
         UM5rz9dti1zjMkN3mj7HvNf78tPo78xA8cM35mabR3NOI+Apiw7dRu8Znm6oz36H6MPt
         wxpBNdWlIvHtwIQtBhqUx/pyGGjM2XSjUaz//sAqeKj+UDvJe2op2N/C2p5hNRGr1WBO
         pwMher4Hws2gt4PS+UL0bZwauSlQAZfB/HugjsylESApXerDe+B7vwUuOtwfBWUMRTJ/
         0j+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709756574; x=1710361374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VcAG9ysgyiO5MnK5l9Zpz4SIhGZKLBPUayRcU0PfwC4=;
        b=VNM9DJwqIqnCehlzOyliKCaEPfL1vxTl5Lhu4QUib6DNpXhw7A5C9A6ZWS9naHWl5N
         KoaJorw7CFpd49jmEKz/a2IxMJgP59ApRyPgQ2EwnRC8SAniaBFh/fVt/0m1ijyRoL3e
         fqCErEkrKsiGTwz9P4lsYZn15N10E4i83dHWhWLDKoSt2ApokN9iC7VGn3Aq3ta/tUYJ
         LCK6Ep/nKfyzKl34cUnOrlixpjFHaU8AJmu6JUsYngGLPKC8yT7+erYXBLnmBp3li5vE
         sjxaYmlpCiQGl44p6DFEYncR7PASInJPRfdHj8Z4/r1Gwkgpqmnv7Dtch9Ye3w72Zk1p
         6eKw==
X-Gm-Message-State: AOJu0Yw/1LDS7zhyUJ42aguh37HJTSCm41ethuF3AcM621t9dO7phwVR
	SnE2ZY6o9BP+SmF/2KNoQFuyWHz/eKd2XeESFhWNVRg9pUaxdO8fK0rlKz64Ns5yrEATcB0IuIP
	wbah+yD0UOjTDjIaBp9FBxdbwj8w=
X-Google-Smtp-Source: AGHT+IH4FY2EzmDzg+5OgIj5H9so/+XnwI9JkNrJ0MblHgT0Vja+5tyJddJ/cwz40S2gmWjZOyHAg+hc2TGYEGThW24=
X-Received: by 2002:a17:90a:9ef:b0:29a:eb0f:e356 with SMTP id
 102-20020a17090a09ef00b0029aeb0fe356mr13565738pjo.37.1709756573520; Wed, 06
 Mar 2024 12:22:53 -0800 (PST)
MIME-Version: 1.0
References: <20240306023958.3779337-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20240306023958.3779337-1-xiangyu.chen@eng.windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 6 Mar 2024 15:22:42 -0500
Message-ID: <CADkTA4PtcSfQhx3hUSVVCwnxiT+HBogVfUaiY+GH++vCop6fMA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] kernel/cfg: add CONFIG_CGROUP_BPF to
 docker config
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 06 Mar 2024 20:22:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8607

On Tue, Mar 5, 2024 at 9:00=E2=80=AFPM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> Add CONFIG_CGROUP_BPF to ensure docker can be started under cgroup v2,
> otherwise it would report the following error:
>
>      Error: for ... error setting cgroup config for procHooks process:
>      bpf_prog_query(BPF_CGROUP_DEVICE) failed: invalid argument: unknown
>
> Cgroup v2 device controller has no interface files and is implemented on =
top
> of cgroup BPF. To control access to device files, a user may create bpf p=
rograms
> of type BPF_PROG_TYPE_CGROUP_DEVICE and attach them to cgroups with
> BPF_CGROUP_DEVICE flag.

related to this, check out my latest push to master-next. I've not taken tw=
eaks
to the fragments in meta-virt lately, as I really want to get rid of
the duplicate
fragments between the main kernel-cache and the layer.

So I finally took the time to do the sync and removal in meta-virt.

See what you get when building against meta-virt with that change, and
then we can do this same change in the kernel-cache and bump the
yocto-cfg-fragments SRCREV in meta-virt.

Bruce

>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  recipes-kernel/linux/linux-yocto/docker.cfg | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-kernel/linux/linux-yocto/docker.cfg b/recipes-kernel=
/linux/linux-yocto/docker.cfg
> index eeeaa242..4d8d7e04 100644
> --- a/recipes-kernel/linux/linux-yocto/docker.cfg
> +++ b/recipes-kernel/linux/linux-yocto/docker.cfg
> @@ -11,3 +11,5 @@ CONFIG_IP_NF_TARGET_MASQUERADE=3Dm
>  CONFIG_NETFILTER_XT_MATCH_IPVS=3Dm
>
>  CONFIG_OVERLAY_FS=3Dy
> +
> +CONFIG_CGROUP_BPF=3Dy
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8603): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8603
> Mute This Topic: https://lists.yoctoproject.org/mt/104758931/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

