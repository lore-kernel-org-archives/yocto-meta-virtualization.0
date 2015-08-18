Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 36C81E009F3; Tue, 18 Aug 2015 10:12:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.177 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F26E2E008EC
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Aug 2015 10:12:12 -0700 (PDT)
Received: by ykfw73 with SMTP id w73so111486985ykf.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Aug 2015 10:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=5EspIVx2vJ8MFcobMrsQzxDtprn/HBykqouxqVOZIrs=;
	b=YESSKZq4K/otNeD84Ncc5Mr7IjCCu6yYTFN4RDx2tehD2pYyT9LOvH/JwIQuVpJ+gm
	r/P2OldIZXgejiAHrcIvpdioPJkq27EKtFRtI4iZkWFYYT+Euf4mKGo1DXVO085PxLzr
	7P+xBnaOP5cJiO2QsCz+Dua2iqzKYFSMIP7baUKcMPnCq6K3A4+h6WaGwoDjlPtwBY6m
	kLgK4bpvtiMkBa5p1aUwIdJw74GEdFQat386Iop84Vb2cNfB7YDCnbcMLnjlIIrwrv/7
	o2ckrL6pr17+zNgg6DG3pfe5nItL7FGR923Xd+MHxKsd4cWedfNIvgjuIor/uEqRbG3z
	VTRA==
MIME-Version: 1.0
X-Received: by 10.129.16.215 with SMTP id 206mr8024172ywq.13.1439917931334;
	Tue, 18 Aug 2015 10:12:11 -0700 (PDT)
Received: by 10.13.216.216 with HTTP; Tue, 18 Aug 2015 10:12:11 -0700 (PDT)
In-Reply-To: <1439862749-11235-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1439862749-11235-1-git-send-email-leimaohui@cn.fujitsu.com>
Date: Tue, 18 Aug 2015 13:12:11 -0400
Message-ID: <CADkTA4P3ZTJ5Mt1hwbAoo+Gq-7Z_qw65G=L5zaLCLJN7nhG74A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Lei Maohui <leimaohui@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [m-c-s][PATCH] open-iscsi-user: upgrade 2.0-871->2.0-873
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
X-List-Received-Date: Tue, 18 Aug 2015 17:12:16 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 17, 2015 at 9:52 PM, Lei Maohui <leimaohui@cn.fujitsu.com> wrote:
> -deleted patch not used any more
> -add new patch for new version

merged.

Bruce

>
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  .../0001-fix-build-error-of-cross-build.patch      | 30 ++++++++++++++++++++++
>  .../open-iscsi/files/user.patch                    | 11 --------
>  ...-user_2.0-871.bb => open-iscsi-user_2.0-873.bb} |  8 +++---
>  3 files changed, 34 insertions(+), 15 deletions(-)
>  create mode 100644 meta-openstack/recipes-connectivity/open-iscsi/files/0001-fix-build-error-of-cross-build.patch
>  delete mode 100644 meta-openstack/recipes-connectivity/open-iscsi/files/user.patch
>  rename meta-openstack/recipes-connectivity/open-iscsi/{open-iscsi-user_2.0-871.bb => open-iscsi-user_2.0-873.bb} (87%)
>
> diff --git a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-fix-build-error-of-cross-build.patch b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-fix-build-error-of-cross-build.patch
> new file mode 100644
> index 0000000..206da48
> --- /dev/null
> +++ b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-fix-build-error-of-cross-build.patch
> @@ -0,0 +1,30 @@
> +From 943a321104a5b2c4ac25bdb2ae81b5b208e3973c Mon Sep 17 00:00:00 2001
> +From: Lei Maohui <leimaohui@cn.fujitsu.com>
> +Date: Tue, 18 Aug 2015 10:29:35 +0900
> +Subject: [PATCH] fix build error of cross build
> +
> +The error likes as following
> +| configure: error: cannot run C compiled programs.
> +| If you meant to cross compile, use `--host'.
> +
> +Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index c5d9700..1f31e43 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -42,7 +42,7 @@ user: utils/open-isns/Makefile
> +       @echo "Read README file for detailed information."
> +
> + utils/open-isns/Makefile: utils/open-isns/configure utils/open-isns/Makefile.in
> +-      cd utils/open-isns; ./configure CFLAGS="$(OPTFLAGS)" --with-security=no
> ++      cd utils/open-isns; ./configure CFLAGS="$(OPTFLAGS)" --with-security=no ${CONFIGURE_ARGS}
> +
> + kernel: force
> +       $(MAKE) -C kernel
> +--
> +1.8.4.2
> +
> diff --git a/meta-openstack/recipes-connectivity/open-iscsi/files/user.patch b/meta-openstack/recipes-connectivity/open-iscsi/files/user.patch
> deleted file mode 100644
> index 767c508..0000000
> --- a/meta-openstack/recipes-connectivity/open-iscsi/files/user.patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -diff -Nurd a/usr/iscsi_sysfs.c b/usr/iscsi_sysfs.c
> ---- a/usr/iscsi_sysfs.c        2012-08-06 12:32:21.098233792 +0200
> -+++ b/usr/iscsi_sysfs.c        2012-08-06 12:33:09.534233952 +0200
> -@@ -22,6 +22,7 @@
> - #include <string.h>
> - #include <errno.h>
> - #include <dirent.h>
> -+#include <sys/stat.h>
> -
> - #include "log.h"
> - #include "initiator.h"
> diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.0-871.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.0-873.bb
> similarity index 87%
> rename from meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.0-871.bb
> rename to meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.0-873.bb
> index 5b3a257..4c9326e 100644
> --- a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.0-871.bb
> +++ b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.0-873.bb
> @@ -8,7 +8,7 @@ inherit systemd
>  LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
>
>  SRC_URI = "http://www.open-iscsi.org/bits/open-iscsi-${PV}.tar.gz   \
> -           file://user.patch                                        \
> +           file://0001-fix-build-error-of-cross-build.patch         \
>             file://open-iscsi                                        \
>             file://initiatorname.iscsi                               \
>             "
> @@ -16,7 +16,7 @@ SRC_URI = "http://www.open-iscsi.org/bits/open-iscsi-${PV}.tar.gz   \
>
>  S = "${WORKDIR}/open-iscsi-${PV}"
>  TARGET_CC_ARCH += "${LDFLAGS}"
> -
> +EXTRA_OEMAKE += "CONFIGURE_ARGS='--host=${HOST_SYS}'"
>
>  do_compile () {
>          oe_runmake user
> @@ -29,8 +29,8 @@ do_install () {
>  }
>
>
> -SRC_URI[md5sum] = "0c403e8c9ad41607571ba0e6e8ff196e"
> -SRC_URI[sha256sum] = "bcea8746ae82f2ada7bc05d2aa59bcda1ca0d5197f05f2e16744aae59f0a7dcb"
> +SRC_URI[md5sum] = "8b8316d7c9469149a6cc6234478347f7"
> +SRC_URI[sha256sum] = "7dd9f2f97da417560349a8da44ea4fcfe98bfd5ef284240a2cc4ff8e88ac7cd9"
>
>  # systemd support
>  PACKAGES =+ "${PN}-systemd"
> --
> 1.8.4.2
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

