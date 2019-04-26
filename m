Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A4272E00CDD; Fri, 26 Apr 2019 08:02:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.44 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
	[209.85.167.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0750DE00CC9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 26 Apr 2019 08:02:44 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id v1so2728015lfg.5
	for <meta-virtualization@yoctoproject.org>;
	Fri, 26 Apr 2019 08:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YHShRYEs7yceUqdrzehsocWOYPJevPAL6Uu2hNuQFNI=;
	b=fQtNW+pekyLn7zTcCgaPWje232J1Xuzz623BsMHavxdeeIzx9M6hePYGvL4WEr/8gI
	8cEpDnat38Mke9V1uyA0TPv3k47ZJ/EfdvTWmBfV06L+2/ul/rbvjWkVQGg+0MH9PQWg
	4TZrcy2BerGz60NvHtb528mkejH0kyBpEJg1hQM0pEoV3l0Jxul0UgZthAezJicTo1AF
	Jtb6QeHwi/kxVjPg809TCHsvHC6t5+RJo8wvRjo5/BSr4OpxBvF69YUKwswuxcUnq6M4
	OnajstzJ/WkZEKNyNJ2Ra/bALr/CgCLq7/pBw47bLilJKc3ebBggs6R94deeU2yf2fpi
	HJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YHShRYEs7yceUqdrzehsocWOYPJevPAL6Uu2hNuQFNI=;
	b=lg3V/cC7BKHzZR9mca2eWasiiCsScnsjckjrrwkoeFeGuZiFSpOEtMktQ2mBDngPP6
	uyoFAs1R/M+WuR75MTBzVDj4c5i0LuRo4rk1y5+p3cFHqjN22s/vTKSuTD+YJSAq6VEn
	WJekxWVfK/CSw+wXH/EtrxHRdSnOvd+OtF489ibI3Wp7GVSCNOYKKDpwImBX4AWMyg2v
	Cu3Yp5Flv8920Zhxd2LiCH/zuwtTfPEbFVBwUFsMOLqMOBxlCBhx7E4w5PhZoaKKIPEh
	vzlQEK2E1wRTLD5JpYDkBmKp9JRNv7dWtNgfrSPnexjYWFrwHFO5pSBq5kZ1XIu7oFTL
	UZ+w==
X-Gm-Message-State: APjAAAUY5ZQsCadQ3rcTzq6wUFa5JVwgza9UajIvQB5a5dk0vthNH1nU
	jq4J1yrM+B1z9rWt+GsEsHlqn2Vt6XvB/gNyqBAZ27yJ
X-Google-Smtp-Source: APXvYqxZtFTNAAhvWxvxPVdgh2Gmo+vMszse3rOlF9g2hcqp7wTMCe+L+vrK8BZSiu5aueAQQwA/gfc+nABhXA6NBzw=
X-Received: by 2002:a19:a94d:: with SMTP id s74mr10392420lfe.134.1556290963634;
	Fri, 26 Apr 2019 08:02:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190425074430.92599-1-hongzhi.song@windriver.com>
In-Reply-To: <20190425074430.92599-1-hongzhi.song@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 26 Apr 2019 11:02:31 -0400
Message-ID: <CADkTA4PzYhKyPBF=NEC7a_Qxg=y3W4OnZNbrG9JQdDNA=eW39w@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] glusterfs: uprev from v5.4 to v6.1
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
X-List-Received-Date: Fri, 26 Apr 2019 15:02:49 -0000
Content-Type: multipart/alternative; boundary="0000000000000dfbf40587703a62"

--0000000000000dfbf40587703a62
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Thu, Apr 25, 2019 at 3:45 AM Hongzhi.Song <hongzhi.song@windriver.com>
wrote:

> The release-6.1 fixes a lot of CVEs.
>
> Modify parts of patches for v6.1.
> Remove bd-xlator configure which has been dropped.
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  .../glusterfs/files/glusterd-change-port-range.patch | 14 +++++++-------
>  ...erfs-api-remove-unnecessary-library-options.patch | 11 ++++++-----
>  .../glusterfs-change-default-nfs-port-number.patch   | 20
> ++++++++++----------
>  ...-configure-automake-with-subdir-objects-for.patch | 18
> +++++++++++-------
>  .../glusterfs-disable-default-startup-scripts.patch  | 18
> +++++++++++-------
>  recipes-extended/glusterfs/glusterfs.inc             |  2 --
>  recipes-extended/glusterfs/glusterfs_5.4.bb          |  6 ------
>  recipes-extended/glusterfs/glusterfs_6.1.bb          |  6 ++++++
>  8 files changed, 51 insertions(+), 44 deletions(-)
>  delete mode 100644 recipes-extended/glusterfs/glusterfs_5.4.bb
>  create mode 100644 recipes-extended/glusterfs/glusterfs_6.1.bb
>
> diff --git
> a/recipes-extended/glusterfs/files/glusterd-change-port-range.patch
> b/recipes-extended/glusterfs/files/glusterd-change-port-range.patch
> index 52b6ffa..3458d8a 100644
> --- a/recipes-extended/glusterfs/files/glusterd-change-port-range.patch
> +++ b/recipes-extended/glusterfs/files/glusterd-change-port-range.patch
> @@ -1,6 +1,6 @@
> -From a0ed85e0b268dba76d9c820571e1b9217b51e985 Mon Sep 17 00:00:00 2001
> +From 59d1b6fb5e6315df9fc55a74576b1bfde30303f0 Mon Sep 17 00:00:00 2001
>  From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> -Date: Tue, 12 Mar 2019 20:03:21 -0700
> +Date: Wed, 24 Apr 2019 23:07:58 -0400
>  Subject: [PATCH] glusterd: change port range
>
>  glusterfsd chooses tcp ports within the dynamic
> @@ -22,24 +22,24 @@ Signed-off-by: Vu Tran <vu.tran@windriver.com>
>  Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
>  [Yi: minor adjust to apply the patch on 3.11.1]
>  Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> -[Hogzhi: minor adjust to apply the patch on v5.4]
> +[Hogzhi: modify patch for release-6.1]
>  Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
>  ---
>   extras/glusterd.vol | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/extras/glusterd.vol b/extras/glusterd.vol
> -index 88d412c..b89aa56 100644
> +index 6045591..d814b5f 100644
>  --- a/extras/glusterd.vol
>  +++ b/extras/glusterd.vol
> -@@ -9,6 +9,6 @@ volume management
> +@@ -11,6 +11,6 @@ volume management
>       option event-threads 1
>   #   option lock-timer 180
>   #   option transport.address-family inet6
>  -#   option base-port 49152
>  +#   option base-port 59152
> - #   option max-port  65535
> +     option max-port  60999
>   end-volume
>  --
> -2.17.1
> +2.8.1
>
> diff --git
> a/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch
> b/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch
> index 2f140ea..32f4dc1 100644
> ---
> a/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch
> +++
> b/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch
> @@ -1,6 +1,6 @@
> -From 2ef09531d1d14cd64d5ba4ffbd9a99af10ae1ec4 Mon Sep 17 00:00:00 2001
> +From 2b55524fab066cb14880a819f570b7f839bae1ce Mon Sep 17 00:00:00 2001
>  From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> -Date: Tue, 12 Mar 2019 19:37:51 -0700
> +Date: Wed, 24 Apr 2019 22:44:12 -0400
>  Subject: [PATCH] glusterfs-api: remove unnecessary library options
>
>  These cause QA errors when users of the api such
> @@ -11,13 +11,14 @@ Upstream-Status: Inappropriate [embedded specific]
>
>  Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
>  Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
> +[modify patch for release-6.1]
>  Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
>  ---
>   glusterfs-api.pc.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/glusterfs-api.pc.in b/glusterfs-api.pc.in
> -index 6af4e10..01b9d0f 100644
> +index 4a2edb7..153c4ad 100644
>  --- a/glusterfs-api.pc.in
>  +++ b/glusterfs-api.pc.in
>  @@ -8,5 +8,5 @@ Description: GlusterFS API
> @@ -26,7 +27,7 @@ index 6af4e10..01b9d0f 100644
>   Requires: @PKGCONFIG_UUID@
>  -Libs: -L${libdir} @GFAPI_LIBS@ -lgfapi -lglusterfs -lgfrpc -lgfxdr
>  +Libs: -lgfapi -lglusterfs -lgfrpc -lgfxdr
> - Cflags: -I${includedir} -D_FILE_OFFSET_BITS=64 -D__USE_FILE_OFFSET64
> -DUSE_POSIX_ACLS=@USE_POSIX_ACLS@
> + Cflags: -I${includedir} -D_FILE_OFFSET_BITS=64 -D__USE_FILE_OFFSET64
> -D__USE_LARGEFILE64 -DUSE_POSIX_ACLS=@USE_POSIX_ACLS@
>  --
> -2.17.1
> +2.8.1
>
> diff --git
> a/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch
> b/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch
> index e3453a2..deb9e45 100644
> ---
> a/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch
> +++
> b/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch
> @@ -1,6 +1,6 @@
> -From b0c106e74beee36c20f73b956841007209a7f23c Mon Sep 17 00:00:00 2001
> +From b8b48d3c4ab92ce167db8137426fad45e938b11b Mon Sep 17 00:00:00 2001
>  From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> -Date: Tue, 12 Mar 2019 19:52:03 -0700
> +Date: Wed, 24 Apr 2019 22:50:01 -0400
>  Subject: [PATCH] glusterfs: change default nfs port number
>
>  Currently both native nfs and glusterfs-nfs use NFS well
> @@ -30,25 +30,25 @@ Signed-off-by: Vu Tran <vu.tran@windriver.com>
>  Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
>  [Yi: minor adjust to apply the patch on 3.11.1]
>  Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> -[Hongzhi: minor adjust to apply the patch on v5.4]
> +[Hongzhi: modify patch for release-6.1]
>  Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
>  ---
> - libglusterfs/src/common-utils.h | 2 +-
> + libglusterfs/src/glusterfs/common-utils.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> -diff --git a/libglusterfs/src/common-utils.h
> b/libglusterfs/src/common-utils.h
> -index 6a6fd8c..218e379 100644
> ---- a/libglusterfs/src/common-utils.h
> -+++ b/libglusterfs/src/common-utils.h
> +diff --git a/libglusterfs/src/glusterfs/common-utils.h
> b/libglusterfs/src/glusterfs/common-utils.h
> +index 0e2ecc7..59237a9 100644
> +--- a/libglusterfs/src/glusterfs/common-utils.h
> ++++ b/libglusterfs/src/glusterfs/common-utils.h
>  @@ -108,7 +108,7 @@ trap(void);
>   /* Defining this here as it is needed by glusterd for setting
>    * nfs port in volume status.
>    */
>  -#define GF_NFS3_PORT 2049
> -+#define GF_NFS3_PORT    38467
> ++#define GF_NFS3_PORT 38467
>
>   #define GF_CLIENT_PORT_CEILING 1024
>   #define GF_IANA_PRIV_PORTS_START 49152 /* RFC 6335 */
>  --
> -2.17.1
> +2.8.1
>
> diff --git
> a/recipes-extended/glusterfs/files/glusterfs-configure-automake-with-subdir-objects-for.patch
> b/recipes-extended/glusterfs/files/glusterfs-configure-automake-with-subdir-objects-for.patch
> index 8f3c854..6278ce6 100644
> ---
> a/recipes-extended/glusterfs/files/glusterfs-configure-automake-with-subdir-objects-for.patch
> +++
> b/recipes-extended/glusterfs/files/glusterfs-configure-automake-with-subdir-objects-for.patch
> @@ -1,6 +1,6 @@
> -From bb34fd21ae26005cf099928f41e68a0d98685eba Mon Sep 17 00:00:00 2001
> -From: Xulin Sun <xulin.sun@windriver.com>
> -Date: Mon, 21 Mar 2016 17:32:50 +0800
> +From fcd612f75c2e99a0748bebbf530b730d0019d2bf Mon Sep 17 00:00:00 2001
> +From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> +Date: Wed, 24 Apr 2019 22:33:49 -0400
>  Subject: [PATCH] glusterfs: configure: automake with subdir-objects &
> foreign
>   parameters
>
> @@ -10,21 +10,22 @@ autoconf execution failed when using automake 1.14
> around version.
>  Upstream-Status: Pending
>
>  Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
> -
> +[modify the patch for release-6.1]
> +Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
>  ---
>   configure.ac | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index 43efd6d..8ce28f6 100644
> +index 2f341de..b28ac20 100644
>  --- a/configure.ac
>  +++ b/configure.ac
>  @@ -13,11 +13,11 @@ AC_INIT([glusterfs],
>   AC_SUBST([PACKAGE_RELEASE],
>            [m4_esyscmd([build-aux/pkg-version --release])])
>
> --AM_INIT_AUTOMAKE(tar-pax)
> -+#AM_INIT_AUTOMAKE(tar-pax)
> +-AM_INIT_AUTOMAKE([tar-pax foreign])
> ++#AM_INIT_AUTOMAKE([tar-pax foreign])
>
>   # Removes warnings when using automake 1.14 around (...but option
> 'subdir-objects' is disabled )
>   #but libglusterfs fails to build with contrib (Then are not set up that
> way?)
> @@ -33,3 +34,6 @@ index 43efd6d..8ce28f6 100644
>
>   m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES(yes)])
>
> +--
> +2.8.1
> +
> diff --git
> a/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-scripts.patch
> b/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-scripts.patch
> index dbc81b6..7f582dc 100644
> ---
> a/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-scripts.patch
> +++
> b/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-scripts.patch
> @@ -1,6 +1,6 @@
> -From 08b55ee9ccb02db0519ddc9902025e191c1500b1 Mon Sep 17 00:00:00 2001
> -From: Donn Seeley <donn.seeley@windriver.com>
> -Date: Fri, 28 Feb 2014 09:11:02 -0500
> +From bbc23b4723a5f60f2b6f4daf734194f9a3a315d8 Mon Sep 17 00:00:00 2001
> +From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> +Date: Wed, 24 Apr 2019 22:41:04 -0400
>  Subject: [PATCH] Add the glusterfs package
>
>  The glusterfs code for installing start-up scripts checks for systemd
> @@ -18,21 +18,25 @@ Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
>  Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
>  [Yi: minor adjust to apply the patch on 3.11.1]
>  Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> -
> +[modify patch for release-6.1]
> +Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
>  ---
>   extras/Makefile.am | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/extras/Makefile.am b/extras/Makefile.am
> -index 3af1103..8978dde 100644
> +index ff5ca9b..1f59746 100644
>  --- a/extras/Makefile.am
>  +++ b/extras/Makefile.am
> -@@ -4,7 +4,7 @@ addonexec_SCRIPTS = peer_add_secret_pub
> +@@ -10,7 +10,7 @@ endif
>   EditorModedir = $(docdir)
>   EditorMode_DATA = glusterfs-mode.el glusterfs.vim
>
>  -SUBDIRS = init.d systemd benchmarking hook-scripts $(OCF_SUBDIR)
> LinuxRPM \
>  +SUBDIRS = benchmarking hook-scripts $(OCF_SUBDIR) LinuxRPM \
> -           $(GEOREP_EXTRAS_SUBDIR) snap_scheduler firewalld cliutils
> +           $(GEOREP_EXTRAS_SUBDIR) snap_scheduler firewalld cliutils
> python
>
>   confdir = $(sysconfdir)/glusterfs
> +--
> +2.8.1
> +
> diff --git a/recipes-extended/glusterfs/glusterfs.inc
> b/recipes-extended/glusterfs/glusterfs.inc
> index 5843d7c..ab5f4e0 100644
> --- a/recipes-extended/glusterfs/glusterfs.inc
> +++ b/recipes-extended/glusterfs/glusterfs.inc
> @@ -16,7 +16,6 @@ SRC_URI += "file://glusterd.init \
>              file://glusterfs-api-remove-unnecessary-library-options.patch
> \
>              file://python-work-around-host-and-target-python.patch \
>              file://glusterfs-change-default-nfs-port-number.patch \
> -            file://dependence-on-correct-header-file-path.patch \
>              file://libglusterfs-Don-t-link-against-libfl.patch \
>              file://glusterd-change-port-range.patch \
>
>  file://configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch \
> @@ -51,7 +50,6 @@ EXTRA_OECONF = "ac_cv_file__etc_debian_version=no \
>                 "
>
>  PACKAGECONFIG ??= "georeplication libibverbs"
> -PACKAGECONFIG[bd-xlator] = "--enable-bd-xlator,--disable-bd-xlator,lvm2,"
>  PACKAGECONFIG[debug] = "--enable-debug,--disable-debug,,"
>  PACKAGECONFIG[georeplication] =
> "--enable-georeplication,--disable-georeplication,,rsync"
>  PACKAGECONFIG[libibverbs] =
> "--enable-ibverbs,--disable-ibverbs,virtual/libibverbs librdmacm,"
> diff --git a/recipes-extended/glusterfs/glusterfs_5.4.bb
> b/recipes-extended/glusterfs/glusterfs_5.4.bb
> deleted file mode 100644
> index 90ffd14..0000000
> --- a/recipes-extended/glusterfs/glusterfs_5.4.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -SRC_URI = "
> https://bits.gluster.org/pub/gluster/glusterfs/src/${BPN}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "b52ec9101de3c01c7db17c00b3234d94"
> -SRC_URI[sha256sum] =
> "d4f8cf7551c4ac97480fa4f2da6077171b12d5501ee1ddc4cd8535e2336bde7e"
> -
> -require glusterfs.inc
> diff --git a/recipes-extended/glusterfs/glusterfs_6.1.bb
> b/recipes-extended/glusterfs/glusterfs_6.1.bb
> new file mode 100644
> index 0000000..e109c08
> --- /dev/null
> +++ b/recipes-extended/glusterfs/glusterfs_6.1.bb
> @@ -0,0 +1,6 @@
> +SRC_URI = "
> https://bits.gluster.org/pub/gluster/glusterfs/src/${BPN}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "18967c357204d4cbdd9c1731508862c6"
> +SRC_URI[sha256sum] =
> "32ac75c883cdf18e081893ce5210b2331f1ee9ba25e3f3f56136d9878b194dc7"
> +
> +require glusterfs.inc
> --
> 2.8.1
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000000dfbf40587703a62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">merged.</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bru=
ce</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Thu, Apr 25, 2019 at 3:45 AM Hongzhi.Song &lt;<a href=3D"mailto:=
hongzhi.song@windriver.com">hongzhi.song@windriver.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">The release-6.1 fixes=
 a lot of CVEs.<br>
<br>
Modify parts of patches for v6.1.<br>
Remove bd-xlator configure which has been dropped.<br>
<br>
Signed-off-by: Hongzhi.Song &lt;<a href=3D"mailto:hongzhi.song@windriver.co=
m" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../glusterfs/files/glusterd-change-port-range.patch | 14 +++++++----=
---<br>
=C2=A0...erfs-api-remove-unnecessary-library-options.patch | 11 ++++++-----=
<br>
=C2=A0.../glusterfs-change-default-nfs-port-number.patch=C2=A0 =C2=A0| 20 +=
+++++++++----------<br>
=C2=A0...-configure-automake-with-subdir-objects-for.patch | 18 +++++++++++=
-------<br>
=C2=A0.../glusterfs-disable-default-startup-scripts.patch=C2=A0 | 18 ++++++=
+++++-------<br>
=C2=A0recipes-extended/glusterfs/glusterfs.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 --<br>
=C2=A0recipes-extended/glusterfs/<a href=3D"http://glusterfs_5.4.bb" rel=3D=
"noreferrer" target=3D"_blank">glusterfs_5.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 6 ------<br>
=C2=A0recipes-extended/glusterfs/<a href=3D"http://glusterfs_6.1.bb" rel=3D=
"noreferrer" target=3D"_blank">glusterfs_6.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 6 ++++++<br>
=C2=A08 files changed, 51 insertions(+), 44 deletions(-)<br>
=C2=A0delete mode 100644 recipes-extended/glusterfs/<a href=3D"http://glust=
erfs_5.4.bb" rel=3D"noreferrer" target=3D"_blank">glusterfs_5.4.bb</a><br>
=C2=A0create mode 100644 recipes-extended/glusterfs/<a href=3D"http://glust=
erfs_6.1.bb" rel=3D"noreferrer" target=3D"_blank">glusterfs_6.1.bb</a><br>
<br>
diff --git a/recipes-extended/glusterfs/files/glusterd-change-port-range.pa=
tch b/recipes-extended/glusterfs/files/glusterd-change-port-range.patch<br>
index 52b6ffa..3458d8a 100644<br>
--- a/recipes-extended/glusterfs/files/glusterd-change-port-range.patch<br>
+++ b/recipes-extended/glusterfs/files/glusterd-change-port-range.patch<br>
@@ -1,6 +1,6 @@<br>
-From a0ed85e0b268dba76d9c820571e1b9217b51e985 Mon Sep 17 00:00:00 2001<br>
+From 59d1b6fb5e6315df9fc55a74576b1bfde30303f0 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: &quot;Hongzhi.Song&quot; &lt;<a href=3D"mailto:hongzhi.song@win=
driver.com" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;<br>
-Date: Tue, 12 Mar 2019 20:03:21 -0700<br>
+Date: Wed, 24 Apr 2019 23:07:58 -0400<br>
=C2=A0Subject: [PATCH] glusterd: change port range<br>
<br>
=C2=A0glusterfsd chooses tcp ports within the dynamic<br>
@@ -22,24 +22,24 @@ Signed-off-by: Vu Tran &lt;<a href=3D"mailto:vu.tran@wi=
ndriver.com" target=3D"_blank">vu.tran@windriver.com</a>&gt;<br>
=C2=A0Signed-off-by: Xulin Sun &lt;<a href=3D"mailto:xulin.sun@windriver.co=
m" target=3D"_blank">xulin.sun@windriver.com</a>&gt;<br>
=C2=A0[Yi: minor adjust to apply the patch on 3.11.1]<br>
=C2=A0Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" t=
arget=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
-[Hogzhi: minor adjust to apply the patch on v5.4]<br>
+[Hogzhi: modify patch for release-6.1]<br>
=C2=A0Signed-off-by: Hongzhi.Song &lt;<a href=3D"mailto:hongzhi.song@windri=
ver.com" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 extras/glusterd.vol | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/extras/glusterd.vol b/extras/glusterd.vol<br>
-index 88d412c..b89aa56 100644<br>
+index 6045591..d814b5f 100644<br>
=C2=A0--- a/extras/glusterd.vol<br>
=C2=A0+++ b/extras/glusterd.vol<br>
-@@ -9,6 +9,6 @@ volume management<br>
+@@ -11,6 +11,6 @@ volume management<br>
=C2=A0 =C2=A0 =C2=A0 option event-threads 1<br>
=C2=A0 #=C2=A0 =C2=A0option lock-timer 180<br>
=C2=A0 #=C2=A0 =C2=A0option transport.address-family inet6<br>
=C2=A0-#=C2=A0 =C2=A0option base-port 49152<br>
=C2=A0+#=C2=A0 =C2=A0option base-port 59152<br>
- #=C2=A0 =C2=A0option max-port=C2=A0 65535<br>
+=C2=A0 =C2=A0 =C2=A0option max-port=C2=A0 60999<br>
=C2=A0 end-volume<br>
=C2=A0-- <br>
-2.17.1<br>
+2.8.1<br>
<br>
diff --git a/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecess=
ary-library-options.patch b/recipes-extended/glusterfs/files/glusterfs-api-=
remove-unnecessary-library-options.patch<br>
index 2f140ea..32f4dc1 100644<br>
--- a/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-lib=
rary-options.patch<br>
+++ b/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-lib=
rary-options.patch<br>
@@ -1,6 +1,6 @@<br>
-From 2ef09531d1d14cd64d5ba4ffbd9a99af10ae1ec4 Mon Sep 17 00:00:00 2001<br>
+From 2b55524fab066cb14880a819f570b7f839bae1ce Mon Sep 17 00:00:00 2001<br>
=C2=A0From: &quot;Hongzhi.Song&quot; &lt;<a href=3D"mailto:hongzhi.song@win=
driver.com" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;<br>
-Date: Tue, 12 Mar 2019 19:37:51 -0700<br>
+Date: Wed, 24 Apr 2019 22:44:12 -0400<br>
=C2=A0Subject: [PATCH] glusterfs-api: remove unnecessary library options<br=
>
<br>
=C2=A0These cause QA errors when users of the api such<br>
@@ -11,13 +11,14 @@ Upstream-Status: Inappropriate [embedded specific]<br>
<br>
=C2=A0Signed-off-by: Jim Somerville &lt;<a href=3D"mailto:Jim.Somerville@wi=
ndriver.com" target=3D"_blank">Jim.Somerville@windriver.com</a>&gt;<br>
=C2=A0Signed-off-by: Xulin Sun &lt;<a href=3D"mailto:xulin.sun@windriver.co=
m" target=3D"_blank">xulin.sun@windriver.com</a>&gt;<br>
+[modify patch for release-6.1]<br>
=C2=A0Signed-off-by: Hongzhi.Song &lt;<a href=3D"mailto:hongzhi.song@windri=
ver.com" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 <a href=3D"http://glusterfs-api.pc.in" rel=3D"noreferrer" target=3D"=
_blank">glusterfs-api.pc.in</a> | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://glusterfs-api.pc.in" rel=3D"noreferrer=
" target=3D"_blank">glusterfs-api.pc.in</a> b/<a href=3D"http://glusterfs-a=
pi.pc.in" rel=3D"noreferrer" target=3D"_blank">glusterfs-api.pc.in</a><br>
-index 6af4e10..01b9d0f 100644<br>
+index 4a2edb7..153c4ad 100644<br>
=C2=A0--- a/<a href=3D"http://glusterfs-api.pc.in" rel=3D"noreferrer" targe=
t=3D"_blank">glusterfs-api.pc.in</a><br>
=C2=A0+++ b/<a href=3D"http://glusterfs-api.pc.in" rel=3D"noreferrer" targe=
t=3D"_blank">glusterfs-api.pc.in</a><br>
=C2=A0@@ -8,5 +8,5 @@ Description: GlusterFS API<br>
@@ -26,7 +27,7 @@ index 6af4e10..01b9d0f 100644<br>
=C2=A0 Requires: @PKGCONFIG_UUID@<br>
=C2=A0-Libs: -L${libdir} @GFAPI_LIBS@ -lgfapi -lglusterfs -lgfrpc -lgfxdr<b=
r>
=C2=A0+Libs: -lgfapi -lglusterfs -lgfrpc -lgfxdr<br>
- Cflags: -I${includedir} -D_FILE_OFFSET_BITS=3D64 -D__USE_FILE_OFFSET64 -D=
USE_POSIX_ACLS=3D@USE_POSIX_ACLS@<br>
+ Cflags: -I${includedir} -D_FILE_OFFSET_BITS=3D64 -D__USE_FILE_OFFSET64 -D=
__USE_LARGEFILE64 -DUSE_POSIX_ACLS=3D@USE_POSIX_ACLS@<br>
=C2=A0-- <br>
-2.17.1<br>
+2.8.1<br>
<br>
diff --git a/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-=
port-number.patch b/recipes-extended/glusterfs/files/glusterfs-change-defau=
lt-nfs-port-number.patch<br>
index e3453a2..deb9e45 100644<br>
--- a/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-nu=
mber.patch<br>
+++ b/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-nu=
mber.patch<br>
@@ -1,6 +1,6 @@<br>
-From b0c106e74beee36c20f73b956841007209a7f23c Mon Sep 17 00:00:00 2001<br>
+From b8b48d3c4ab92ce167db8137426fad45e938b11b Mon Sep 17 00:00:00 2001<br>
=C2=A0From: &quot;Hongzhi.Song&quot; &lt;<a href=3D"mailto:hongzhi.song@win=
driver.com" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;<br>
-Date: Tue, 12 Mar 2019 19:52:03 -0700<br>
+Date: Wed, 24 Apr 2019 22:50:01 -0400<br>
=C2=A0Subject: [PATCH] glusterfs: change default nfs port number<br>
<br>
=C2=A0Currently both native nfs and glusterfs-nfs use NFS well<br>
@@ -30,25 +30,25 @@ Signed-off-by: Vu Tran &lt;<a href=3D"mailto:vu.tran@wi=
ndriver.com" target=3D"_blank">vu.tran@windriver.com</a>&gt;<br>
=C2=A0Signed-off-by: Xulin Sun &lt;<a href=3D"mailto:xulin.sun@windriver.co=
m" target=3D"_blank">xulin.sun@windriver.com</a>&gt;<br>
=C2=A0[Yi: minor adjust to apply the patch on 3.11.1]<br>
=C2=A0Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" t=
arget=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
-[Hongzhi: minor adjust to apply the patch on v5.4]<br>
+[Hongzhi: modify patch for release-6.1]<br>
=C2=A0Signed-off-by: Hongzhi.Song &lt;<a href=3D"mailto:hongzhi.song@windri=
ver.com" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;<br>
=C2=A0---<br>
- libglusterfs/src/common-utils.h | 2 +-<br>
+ libglusterfs/src/glusterfs/common-utils.h | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
-diff --git a/libglusterfs/src/common-utils.h b/libglusterfs/src/common-uti=
ls.h<br>
-index 6a6fd8c..218e379 100644<br>
---- a/libglusterfs/src/common-utils.h<br>
-+++ b/libglusterfs/src/common-utils.h<br>
+diff --git a/libglusterfs/src/glusterfs/common-utils.h b/libglusterfs/src/=
glusterfs/common-utils.h<br>
+index 0e2ecc7..59237a9 100644<br>
+--- a/libglusterfs/src/glusterfs/common-utils.h<br>
++++ b/libglusterfs/src/glusterfs/common-utils.h<br>
=C2=A0@@ -108,7 +108,7 @@ trap(void);<br>
=C2=A0 /* Defining this here as it is needed by glusterd for setting<br>
=C2=A0 =C2=A0* nfs port in volume status.<br>
=C2=A0 =C2=A0*/<br>
=C2=A0-#define GF_NFS3_PORT 2049<br>
-+#define GF_NFS3_PORT=C2=A0 =C2=A0 38467<br>
++#define GF_NFS3_PORT 38467<br>
<br>
=C2=A0 #define GF_CLIENT_PORT_CEILING 1024<br>
=C2=A0 #define GF_IANA_PRIV_PORTS_START 49152 /* RFC 6335 */<br>
=C2=A0-- <br>
-2.17.1<br>
+2.8.1<br>
<br>
diff --git a/recipes-extended/glusterfs/files/glusterfs-configure-automake-=
with-subdir-objects-for.patch b/recipes-extended/glusterfs/files/glusterfs-=
configure-automake-with-subdir-objects-for.patch<br>
index 8f3c854..6278ce6 100644<br>
--- a/recipes-extended/glusterfs/files/glusterfs-configure-automake-with-su=
bdir-objects-for.patch<br>
+++ b/recipes-extended/glusterfs/files/glusterfs-configure-automake-with-su=
bdir-objects-for.patch<br>
@@ -1,6 +1,6 @@<br>
-From bb34fd21ae26005cf099928f41e68a0d98685eba Mon Sep 17 00:00:00 2001<br>
-From: Xulin Sun &lt;<a href=3D"mailto:xulin.sun@windriver.com" target=3D"_=
blank">xulin.sun@windriver.com</a>&gt;<br>
-Date: Mon, 21 Mar 2016 17:32:50 +0800<br>
+From fcd612f75c2e99a0748bebbf530b730d0019d2bf Mon Sep 17 00:00:00 2001<br>
+From: &quot;Hongzhi.Song&quot; &lt;<a href=3D"mailto:hongzhi.song@windrive=
r.com" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;<br>
+Date: Wed, 24 Apr 2019 22:33:49 -0400<br>
=C2=A0Subject: [PATCH] glusterfs: configure: automake with subdir-objects &=
amp; foreign<br>
=C2=A0 parameters<br>
<br>
@@ -10,21 +10,22 @@ autoconf execution failed when using automake 1.14 arou=
nd version.<br>
=C2=A0Upstream-Status: Pending<br>
<br>
=C2=A0Signed-off-by: Xulin Sun &lt;<a href=3D"mailto:xulin.sun@windriver.co=
m" target=3D"_blank">xulin.sun@windriver.com</a>&gt;<br>
-<br>
+[modify the patch for release-6.1]<br>
+Signed-off-by: Hongzhi.Song &lt;<a href=3D"mailto:hongzhi.song@windriver.c=
om" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a> | 4 ++--<br>
=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
-index 43efd6d..8ce28f6 100644<br>
+index 2f341de..b28ac20 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0@@ -13,11 +13,11 @@ AC_INIT([glusterfs],<br>
=C2=A0 AC_SUBST([PACKAGE_RELEASE],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[m4_esyscmd([build-aux/pkg-version=
 --release])])<br>
<br>
--AM_INIT_AUTOMAKE(tar-pax)<br>
-+#AM_INIT_AUTOMAKE(tar-pax)<br>
+-AM_INIT_AUTOMAKE([tar-pax foreign])<br>
++#AM_INIT_AUTOMAKE([tar-pax foreign])<br>
<br>
=C2=A0 # Removes warnings when using automake 1.14 around (...but option &#=
39;subdir-objects&#39; is disabled )<br>
=C2=A0 #but libglusterfs fails to build with contrib (Then are not set up t=
hat way?)<br>
@@ -33,3 +34,6 @@ index 43efd6d..8ce28f6 100644<br>
<br>
=C2=A0 m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES(yes)])<br>
<br>
+-- <br>
+2.8.1<br>
+<br>
diff --git a/recipes-extended/glusterfs/files/glusterfs-disable-default-sta=
rtup-scripts.patch b/recipes-extended/glusterfs/files/glusterfs-disable-def=
ault-startup-scripts.patch<br>
index dbc81b6..7f582dc 100644<br>
--- a/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-sc=
ripts.patch<br>
+++ b/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-sc=
ripts.patch<br>
@@ -1,6 +1,6 @@<br>
-From 08b55ee9ccb02db0519ddc9902025e191c1500b1 Mon Sep 17 00:00:00 2001<br>
-From: Donn Seeley &lt;<a href=3D"mailto:donn.seeley@windriver.com" target=
=3D"_blank">donn.seeley@windriver.com</a>&gt;<br>
-Date: Fri, 28 Feb 2014 09:11:02 -0500<br>
+From bbc23b4723a5f60f2b6f4daf734194f9a3a315d8 Mon Sep 17 00:00:00 2001<br>
+From: &quot;Hongzhi.Song&quot; &lt;<a href=3D"mailto:hongzhi.song@windrive=
r.com" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;<br>
+Date: Wed, 24 Apr 2019 22:41:04 -0400<br>
=C2=A0Subject: [PATCH] Add the glusterfs package<br>
<br>
=C2=A0The glusterfs code for installing start-up scripts checks for systemd=
<br>
@@ -18,21 +18,25 @@ Signed-off-by: Donn Seeley &lt;<a href=3D"mailto:donn.s=
eeley@windriver.com" target=3D"_blank">donn.seeley@windriver.com</a>&gt;<br=
>
=C2=A0Signed-off-by: Xulin Sun &lt;<a href=3D"mailto:xulin.sun@windriver.co=
m" target=3D"_blank">xulin.sun@windriver.com</a>&gt;<br>
=C2=A0[Yi: minor adjust to apply the patch on 3.11.1]<br>
=C2=A0Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" t=
arget=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
-<br>
+[modify patch for release-6.1]<br>
+Signed-off-by: Hongzhi.Song &lt;<a href=3D"mailto:hongzhi.song@windriver.c=
om" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 extras/Makefile.am | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/extras/Makefile.am b/extras/Makefile.am<br>
-index 3af1103..8978dde 100644<br>
+index ff5ca9b..1f59746 100644<br>
=C2=A0--- a/extras/Makefile.am<br>
=C2=A0+++ b/extras/Makefile.am<br>
-@@ -4,7 +4,7 @@ addonexec_SCRIPTS =3D peer_add_secret_pub<br>
+@@ -10,7 +10,7 @@ endif<br>
=C2=A0 EditorModedir =3D $(docdir)<br>
=C2=A0 EditorMode_DATA =3D glusterfs-mode.el glusterfs.vim<br>
<br>
=C2=A0-SUBDIRS =3D init.d systemd benchmarking hook-scripts $(OCF_SUBDIR) L=
inuxRPM \<br>
=C2=A0+SUBDIRS =3D benchmarking hook-scripts $(OCF_SUBDIR) LinuxRPM \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(GEOREP_EXTRAS_SUBDIR) snap_sche=
duler firewalld cliutils<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(GEOREP_EXTRAS_SUBDIR) snap_sche=
duler firewalld cliutils python<br>
<br>
=C2=A0 confdir =3D $(sysconfdir)/glusterfs<br>
+-- <br>
+2.8.1<br>
+<br>
diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/gl=
usterfs/glusterfs.inc<br>
index 5843d7c..ab5f4e0 100644<br>
--- a/recipes-extended/glusterfs/glusterfs.inc<br>
+++ b/recipes-extended/glusterfs/glusterfs.inc<br>
@@ -16,7 +16,6 @@ SRC_URI +=3D &quot;file://glusterd.init \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://glusterfs-api-remove=
-unnecessary-library-options.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://python-work-around-h=
ost-and-target-python.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://glusterfs-change-def=
ault-nfs-port-number.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://dependence-on-correct-hea=
der-file-path.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://libglusterfs-Don-t-l=
ink-against-libfl.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://glusterd-change-port=
-range.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://configure.ac-allow-P=
YTHON-values-to-be-passed-via-en.patch \<br>
@@ -51,7 +50,6 @@ EXTRA_OECONF =3D &quot;ac_cv_file__etc_debian_version=3Dn=
o \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;georeplication libibverbs&quot;<br>
-PACKAGECONFIG[bd-xlator] =3D &quot;--enable-bd-xlator,--disable-bd-xlator,=
lvm2,&quot;<br>
=C2=A0PACKAGECONFIG[debug] =3D &quot;--enable-debug,--disable-debug,,&quot;=
<br>
=C2=A0PACKAGECONFIG[georeplication] =3D &quot;--enable-georeplication,--dis=
able-georeplication,,rsync&quot;<br>
=C2=A0PACKAGECONFIG[libibverbs] =3D &quot;--enable-ibverbs,--disable-ibverb=
s,virtual/libibverbs librdmacm,&quot;<br>
diff --git a/recipes-extended/glusterfs/<a href=3D"http://glusterfs_5.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">glusterfs_5.4.bb</a> b/recipes-extend=
ed/glusterfs/<a href=3D"http://glusterfs_5.4.bb" rel=3D"noreferrer" target=
=3D"_blank">glusterfs_5.4.bb</a><br>
deleted file mode 100644<br>
index 90ffd14..0000000<br>
--- a/recipes-extended/glusterfs/<a href=3D"http://glusterfs_5.4.bb" rel=3D=
"noreferrer" target=3D"_blank">glusterfs_5.4.bb</a><br>
+++ /dev/null<br>
@@ -1,6 +0,0 @@<br>
-SRC_URI =3D &quot;<a href=3D"https://bits.gluster.org/pub/gluster/glusterf=
s/src/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">htt=
ps://bits.gluster.org/pub/gluster/glusterfs/src/${BPN}-${PV}.tar.gz</a>&quo=
t;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;b52ec9101de3c01c7db17c00b3234d94&quot;<br>
-SRC_URI[sha256sum] =3D &quot;d4f8cf7551c4ac97480fa4f2da6077171b12d5501ee1d=
dc4cd8535e2336bde7e&quot;<br>
-<br>
-require glusterfs.inc<br>
diff --git a/recipes-extended/glusterfs/<a href=3D"http://glusterfs_6.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">glusterfs_6.1.bb</a> b/recipes-extend=
ed/glusterfs/<a href=3D"http://glusterfs_6.1.bb" rel=3D"noreferrer" target=
=3D"_blank">glusterfs_6.1.bb</a><br>
new file mode 100644<br>
index 0000000..e109c08<br>
--- /dev/null<br>
+++ b/recipes-extended/glusterfs/<a href=3D"http://glusterfs_6.1.bb" rel=3D=
"noreferrer" target=3D"_blank">glusterfs_6.1.bb</a><br>
@@ -0,0 +1,6 @@<br>
+SRC_URI =3D &quot;<a href=3D"https://bits.gluster.org/pub/gluster/glusterf=
s/src/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">htt=
ps://bits.gluster.org/pub/gluster/glusterfs/src/${BPN}-${PV}.tar.gz</a>&quo=
t;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;18967c357204d4cbdd9c1731508862c6&quot;<br>
+SRC_URI[sha256sum] =3D &quot;32ac75c883cdf18e081893ce5210b2331f1ee9ba25e3f=
3f56136d9878b194dc7&quot;<br>
+<br>
+require glusterfs.inc<br>
-- <br>
2.8.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--0000000000000dfbf40587703a62--
