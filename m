Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CD3ABE017CE
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 Nov 2013 12:50:17 -0800 (PST)
Received: by mail-la0-f41.google.com with SMTP id hp15so363506lab.14
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 Nov 2013 12:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=jsv9mknjoIu8uBXPKLFs6OZePpFXJ2acmjIZVXubLXY=;
	b=HThywf5CQkorssVqn3tvnw0WFUyQNzhACa0HH1ePZOsyOFiOkUcJD1ZlpTyxJTvfmC
	Eyx+sI3+1Glajl2m5dOid6tH/uTeR/PgA3B+PrFjg9NBko57hRzwOHKj4/BsgjPqMbND
	xu1dnVmBjpE4EamTTNjOCtBRaqofAl/hiuBaPvTZbwDRQr+RKPXEmile/djTGAhvy/HD
	Uy/cK8IX6Pi46Nzwo6RwD0hbKsO0DpgwfFCUE+dO5ZyG7urBR51F8COI5L4jHcYSkKLU
	dQcQXkvKViaG3CLJ3Br60ND8zfg3UqN9ihz/kJMeEpikZXunZRgUOhVQm8hicb5GlznE
	TJww==
MIME-Version: 1.0
X-Received: by 10.112.154.129 with SMTP id vo1mr3186735lbb.31.1384203014713;
	Mon, 11 Nov 2013 12:50:14 -0800 (PST)
Received: by 10.112.14.200 with HTTP; Mon, 11 Nov 2013 12:50:14 -0800 (PST)
In-Reply-To: <1383883267-31992-1-git-send-email-cjp256@gmail.com>
References: <1383883267-31992-1-git-send-email-cjp256@gmail.com>
Date: Mon, 11 Nov 2013 15:50:14 -0500
Message-ID: <CADkTA4NSxOOmyimDw28N4pbgbzw=GMN79Q0q0J1H-AwY1XT1Pg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2 00/10] xen cleanup and upgrades
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Nov 2013 20:50:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 7, 2013 at 11:00 PM, Chris Patterson <cjp256@gmail.com> wrote:
> Cleaned out old xen bits, upgraded to 4.3.1, moved to common xen.inc,
> and added git recipe pointing to xen-unstable.
>
> I broke out the cleanup into smaller patches in hopes that it will make it through.
>
> If not, you can find these patches in branch=xen-upgrades-and-cleanup-v2 at:
> https://github.com/cjp256/meta-virtualization.git
>

The series looks fine to me. I've pulled it in locally and will push the changes
shortly.

Bruce

> Chris Patterson (10):
>   xen: remove xsm from default PACKAGECONFIG options.
>   xen: remove 4.1.2 recipe and patches
>   xen: remove xen-hg recipe and patches
>   xen: remove xen-rt recipe and patches
>   xen: remove old xen.inc and xen-python.inc
>   xen: remove old patches
>   xen: rename xen patches directory from xen-4.3.0 to files.
>   xen: upgrade to 4.3.1
>   xen: improve organization with new xen.inc
>   xen: add xen_git recipe.
>
>  .../xen/files/allow_disable_xend.patch             |   75 -
>  ...lask-avoid-installing-policy-file-as-boot.patch |   26 +
>  .../xen/files/ioemu-cross-gl-check.patch           |   29 -
>  recipes-extended/xen/files/xend-config.sxp         |  304 -
>  recipes-extended/xen/files/xenminiinit.sh          |   59 -
>  .../xen/xen-4.1.2/allow_disable_xend.patch         |   75 -
>  ...lask-avoid-installing-policy-file-as-boot.patch |   26 -
>  recipes-extended/xen/xen-hg.bb                     |   29 -
>  .../xen/xen-hg/ioemu-cross-gl-check.patch          |   29 -
>  .../xen/xen-hg/tools_qemu_xen_remove_CFLAGS.patch  |   48 -
>  recipes-extended/xen/xen-python.inc                |   49 -
>  recipes-extended/xen/xen-rt/rt-xen_0.3_4.0.1.patch | 6785 --------------------
>  recipes-extended/xen/xen-rt_4.0.1.bb               |   25 -
>  recipes-extended/xen/xen.inc                       |  902 ++-
>  recipes-extended/xen/xen_4.1.2.bb                  |   24 -
>  recipes-extended/xen/xen_4.3.0.bb                  |  650 --
>  recipes-extended/xen/xen_4.3.1.bb                  |   24 +
>  recipes-extended/xen/xen_git.bb                    |   18 +
>  18 files changed, 677 insertions(+), 8500 deletions(-)
>  delete mode 100644 recipes-extended/xen/files/allow_disable_xend.patch
>  create mode 100644 recipes-extended/xen/files/flask-avoid-installing-policy-file-as-boot.patch
>  delete mode 100644 recipes-extended/xen/files/ioemu-cross-gl-check.patch
>  delete mode 100644 recipes-extended/xen/files/xend-config.sxp
>  delete mode 100755 recipes-extended/xen/files/xenminiinit.sh
>  delete mode 100644 recipes-extended/xen/xen-4.1.2/allow_disable_xend.patch
>  delete mode 100644 recipes-extended/xen/xen-4.3.0/flask-avoid-installing-policy-file-as-boot.patch
>  delete mode 100644 recipes-extended/xen/xen-hg.bb
>  delete mode 100644 recipes-extended/xen/xen-hg/ioemu-cross-gl-check.patch
>  delete mode 100644 recipes-extended/xen/xen-hg/tools_qemu_xen_remove_CFLAGS.patch
>  delete mode 100644 recipes-extended/xen/xen-python.inc
>  delete mode 100644 recipes-extended/xen/xen-rt/rt-xen_0.3_4.0.1.patch
>  delete mode 100644 recipes-extended/xen/xen-rt_4.0.1.bb
>  delete mode 100644 recipes-extended/xen/xen_4.1.2.bb
>  delete mode 100644 recipes-extended/xen/xen_4.3.0.bb
>  create mode 100644 recipes-extended/xen/xen_4.3.1.bb
>  create mode 100644 recipes-extended/xen/xen_git.bb
>
> --
> 1.8.4.rc3
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

