Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C431EE00B7F
	for <meta-virtualization@yoctoproject.org>;
	Tue,  1 Apr 2014 17:53:32 -0700 (PDT)
Received: by mail-lb0-f181.google.com with SMTP id c11so7459130lbj.26
	for <meta-virtualization@yoctoproject.org>;
	Tue, 01 Apr 2014 17:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=GTWWmT1lqXPYjX5tXWBOqyp+QMuPWsGCHzrHup1er5I=;
	b=wVsKU4iiH9dhGz1cBx6Wy25tob/5BLuIwhrurroD/f4xm26NaHSR5Gieja/j0rO0JB
	sh5OJ9rlUxvEclv9tVqGU0S6yEZ0QuW6Qti6+p1Qe9BEucO++PbVaM8T/AvL9OEzrj1u
	1L4qSBqK5/YqFIQPJ4FtWEeGl/rmsAoQ2cj/3WovjIaJFxXjEZRHSKgVXEIez0w4sFoc
	SJCaoPH8jPOxQzDfG6pFqRNN68rONvP/H0AGGhldto3zZP+undUq14N3mL9t9wk54FJc
	pYcOaFy7bKRWcPTvG9Q63mqYNek85qfXN0USkp/w5kMDu5n9f46LbgboZlm8a1mIex/o
	iY0w==
MIME-Version: 1.0
X-Received: by 10.152.210.70 with SMTP id ms6mr24696887lac.5.1396400011252;
	Tue, 01 Apr 2014 17:53:31 -0700 (PDT)
Received: by 10.112.58.132 with HTTP; Tue, 1 Apr 2014 17:53:30 -0700 (PDT)
In-Reply-To: <1396353496-3511-1-git-send-email-bogdan.purcareata@freescale.com>
References: <1396353496-3511-1-git-send-email-bogdan.purcareata@freescale.com>
Date: Tue, 1 Apr 2014 20:53:30 -0400
Message-ID: <CADkTA4O_5PBnknnyFEDGwLr8cBuKYvhXcjHWrWS7fZCUi=kM5A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bogdan Purcareata <bogdan.purcareata@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: bug fixes from upstream
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
X-List-Received-Date: Wed, 02 Apr 2014 00:53:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 1, 2014 at 7:58 AM, Bogdan Purcareata
<bogdan.purcareata@freescale.com> wrote:
> Adding a couple of upstream fixes for lxc:
> - follow symlinks when determining if Busybox is statically linked
> - don't fail for lxc.network.type = none
> - don't fail if no default macvlan mode is specified
>
> More details are available in the individual patches.


Looks sane.

merged.

Bruce

>
> Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> ---
>  ...ork_type-set-macvlan-default-mode-to-priv.patch | 43 ++++++++++++++++++++++
>  ...-follow-symlinks-when-inspecting-busybox-.patch | 27 ++++++++++++++
>  ...-Add-missing-LXC_NET_NONE-option-refactor.patch | 38 +++++++++++++++++++
>  recipes-containers/lxc/lxc_1.0.0.bb                |  5 ++-
>  4 files changed, 112 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-containers/lxc/files/config_network_type-set-macvlan-default-mode-to-priv.patch
>  create mode 100644 recipes-containers/lxc/files/lxc-busybox-follow-symlinks-when-inspecting-busybox-.patch
>  create mode 100644 recipes-containers/lxc/files/network.c-Add-missing-LXC_NET_NONE-option-refactor.patch
>
> diff --git a/recipes-containers/lxc/files/config_network_type-set-macvlan-default-mode-to-priv.patch b/recipes-containers/lxc/files/config_network_type-set-macvlan-default-mode-to-priv.patch
> new file mode 100644
> index 0000000..8cb321b
> --- /dev/null
> +++ b/recipes-containers/lxc/files/config_network_type-set-macvlan-default-mode-to-priv.patch
> @@ -0,0 +1,43 @@
> +From 261658e80014c031852a024f8794dd7f2a2351ad Mon Sep 17 00:00:00 2001
> +From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +Date: Fri, 28 Mar 2014 10:31:41 -0400
> +Subject: [PATCH] config_network_type: set macvlan default mode to private
> +
> +If a default mode is not set, the container requires an explicit
> +mode specified in the config file, otherwise creating the
> +container fails.
> +
> +Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +Signed-off-by: Serge Hallyn <serge.hallyn@ubuntu.com>
> +---
> + src/lxc/confile.c | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/lxc/confile.c b/src/lxc/confile.c
> +index d6cf151..90fb344 100644
> +--- a/src/lxc/confile.c
> ++++ b/src/lxc/confile.c
> +@@ -303,6 +303,8 @@ out:
> +       return ret;
> + }
> +
> ++static int macvlan_mode(int *valuep, const char *value);
> ++
> + static int config_network_type(const char *key, const char *value,
> +                              struct lxc_conf *lxc_conf)
> + {
> +@@ -337,8 +339,10 @@ static int config_network_type(const char *key, const char *value,
> +
> +       if (!strcmp(value, "veth"))
> +               netdev->type = LXC_NET_VETH;
> +-      else if (!strcmp(value, "macvlan"))
> ++      else if (!strcmp(value, "macvlan")) {
> +               netdev->type = LXC_NET_MACVLAN;
> ++              macvlan_mode(&netdev->priv.macvlan_attr.mode, "private");
> ++      }
> +       else if (!strcmp(value, "vlan"))
> +               netdev->type = LXC_NET_VLAN;
> +       else if (!strcmp(value, "phys"))
> +--
> +1.9.rc1
> +
> diff --git a/recipes-containers/lxc/files/lxc-busybox-follow-symlinks-when-inspecting-busybox-.patch b/recipes-containers/lxc/files/lxc-busybox-follow-symlinks-when-inspecting-busybox-.patch
> new file mode 100644
> index 0000000..6882c16
> --- /dev/null
> +++ b/recipes-containers/lxc/files/lxc-busybox-follow-symlinks-when-inspecting-busybox-.patch
> @@ -0,0 +1,27 @@
> +From 50dbb8209bf65e4d24ccd06d3ca05004d0ddc63c Mon Sep 17 00:00:00 2001
> +From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +Date: Mon, 24 Mar 2014 12:43:03 -0400
> +Subject: [PATCH] lxc-busybox: follow symlinks when inspecting busybox binary
> +
> +Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +Signed-off-by: Serge Hallyn <serge.hallyn@ubuntu.com>
> +---
> + templates/lxc-busybox.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
> +index e5a512a..246e743 100644
> +--- a/templates/lxc-busybox.in
> ++++ b/templates/lxc-busybox.in
> +@@ -187,7 +187,7 @@ configure_busybox()
> +         return 1
> +     fi
> +
> +-    file $(which busybox) | grep -q "statically linked"
> ++    file -L $(which busybox) | grep -q "statically linked"
> +     if [ $? -ne 0 ]; then
> +         echo "warning : busybox is not statically linked."
> +         echo "warning : The template script may not correctly"
> +--
> +1.9.rc1
> +
> diff --git a/recipes-containers/lxc/files/network.c-Add-missing-LXC_NET_NONE-option-refactor.patch b/recipes-containers/lxc/files/network.c-Add-missing-LXC_NET_NONE-option-refactor.patch
> new file mode 100644
> index 0000000..81fde83
> --- /dev/null
> +++ b/recipes-containers/lxc/files/network.c-Add-missing-LXC_NET_NONE-option-refactor.patch
> @@ -0,0 +1,38 @@
> +From b343592b45c91db8c18e863fac5ab8eeb94445d6 Mon Sep 17 00:00:00 2001
> +From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +Date: Wed, 26 Mar 2014 11:35:09 -0400
> +Subject: [PATCH] network.c: Add missing LXC_NET_NONE option + refactor
> +
> +Add LXC_NET_NONE to known lxc_network_types, so parsing a config
> +file with lxc.network.type = none does not result in failure
> +(e.g. doc/examples/lxc-no-netns.conf). Options have also been
> +reordered to match the enum in conf.h.
> +
> +Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +Signed-off-by: Serge Hallyn <serge.hallyn@ubuntu.com>
> +---
> + src/lxc/network.c | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/lxc/network.c b/src/lxc/network.c
> +index 090b9bd..a9900de 100644
> +--- a/src/lxc/network.c
> ++++ b/src/lxc/network.c
> +@@ -1202,11 +1202,12 @@ int lxc_bridge_attach(const char *bridge, const char *ifname)
> + }
> +
> + static const char* const lxc_network_types[LXC_NET_MAXCONFTYPE + 1] = {
> ++      [LXC_NET_EMPTY]   = "empty",
> +       [LXC_NET_VETH]    = "veth",
> +       [LXC_NET_MACVLAN] = "macvlan",
> +-      [LXC_NET_VLAN]    = "vlan",
> +       [LXC_NET_PHYS]    = "phys",
> +-      [LXC_NET_EMPTY]   = "empty",
> ++      [LXC_NET_VLAN]    = "vlan",
> ++      [LXC_NET_NONE]    = "none",
> + };
> +
> + const char *lxc_net_type_to_str(int type)
> +--
> +1.9.rc1
> +
> diff --git a/recipes-containers/lxc/lxc_1.0.0.bb b/recipes-containers/lxc/lxc_1.0.0.bb
> index 36ac78d..d5fc680 100644
> --- a/recipes-containers/lxc/lxc_1.0.0.bb
> +++ b/recipes-containers/lxc/lxc_1.0.0.bb
> @@ -3,7 +3,7 @@ SECTION = "console/utils"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>  PRIORITY = "optional"
> -PR = "r3"
> +PR = "r4"
>  DEPENDS = "libxml2 libcap"
>  RDEPENDS_${PN} = " \
>                 rsync \
> @@ -23,6 +23,9 @@ RDEPENDS_${PN} = " \
>
>  SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>         file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
> +       file://config_network_type-set-macvlan-default-mode-to-priv.patch \
> +       file://lxc-busybox-follow-symlinks-when-inspecting-busybox-.patch \
> +       file://network.c-Add-missing-LXC_NET_NONE-option-refactor.patch \
>         "
>  SRC_URI[md5sum] = "87a9d168a6e55326303cce3b2cb7f82e"
>  SRC_URI[sha256sum] = "0992212ddaad01dfe8c048e130566b73dd5f34191585f36bdac07a4f8a91f3bd"
> --
> 1.9.rc1
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

