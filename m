Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0CBE7E00CA6; Tue,  8 Sep 2015 07:04:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,URIBL_BLACK
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.175 listed in list.dnswl.org]
	*  1.7 URIBL_BLACK Contains an URL listed in the URIBL blacklist
	*      [URIs: configure.ac]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 35B0EE00B5A
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Sep 2015 07:04:51 -0700 (PDT)
Received: by ykdu9 with SMTP id u9so44262735ykd.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 08 Sep 2015 07:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/u2F/sHfk11alKDH3ziAlWdbo54+moz6OF6PcrJF8gM=;
	b=J2GEz90r1sOlxVE3HoIZjzQXAL0ZNlbFWFdSExGFxxVE4TUUEr93uuLMlZKkO7puIk
	eV3Bg1K+ub2Go81ArqwQZqsn7mv8lZG5wRDFoEtzHcxJX5NnRx5jUdlQo7uRoOWKl9oN
	HvCOeBd194s5MPsdL8cJ8YbBqQQqIxZ801/Wj07ZKC4WV3KF3O/GIKg/gDN6Ovqt2dKD
	WcwVPR01YyME6fGu6Q+Amo3R+nE6rXN351CJce3dXeS9KzTxiTltvNDtgdHFPahaCtQ4
	qgd774RtdX4lyI7JyupC33biay7oOLBXDFCQPo1Q5+P2qqaFZmopQtMmbB0CgVyPYfv5
	xaIA==
MIME-Version: 1.0
X-Received: by 10.129.75.3 with SMTP id y3mr28622968ywa.92.1441721090324; Tue,
	08 Sep 2015 07:04:50 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Tue, 8 Sep 2015 07:04:50 -0700 (PDT)
In-Reply-To: <1441521806-12787-1-git-send-email-jianchuan.wang@windriver.com>
References: <1441521806-12787-1-git-send-email-jianchuan.wang@windriver.com>
Date: Tue, 8 Sep 2015 10:04:50 -0400
Message-ID: <CADkTA4Owxm=d0KxXXXQxZy=R70_VVPfzJGbYQ1Vr+X7X6FCzZQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: jianchuan.wang@windriver.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/3] irqbalance: add PACKAGECONFIG for libcap-ng
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
X-List-Received-Date: Tue, 08 Sep 2015 14:04:53 -0000
Content-Type: text/plain; charset=UTF-8

I've merged all the irqbalance patches.

Bruce

On Sun, Sep 6, 2015 at 2:43 AM,  <jianchuan.wang@windriver.com> wrote:
> From: Jianchuan Wang <jianchuan.wang@windriver.com>
>
> Grasp withval for libcap-ng in configure.ac.
>
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
> ---
>  recipes-extended/irqbalance/irqbalance.inc         |  1 +
>  .../irqbalance/fix-configure-libcap-ng.patch       | 24 ++++++++++++++++++++++
>  recipes-extended/irqbalance/irqbalance_1.0.6.bb    |  1 +
>  3 files changed, 26 insertions(+)
>  create mode 100644 recipes-extended/irqbalance/irqbalance/fix-configure-libcap-ng.patch
>
> diff --git a/recipes-extended/irqbalance/irqbalance.inc b/recipes-extended/irqbalance/irqbalance.inc
> index c20840d..10265c9 100644
> --- a/recipes-extended/irqbalance/irqbalance.inc
> +++ b/recipes-extended/irqbalance/irqbalance.inc
> @@ -30,6 +30,7 @@ PACKAGECONFIG ?= ""
>  # enable,disable,depends,rdepends
>  #
>  PACKAGECONFIG[numa] = "--enable-numa,--disable-numa,numactl,"
> +PACKAGECONFIG[libcap-ng] = "--with-libcap-ng,--without-libcap-ng,libcap-ng,"
>
>  do_install () {
>          oe_runmake 'DESTDIR=${D}' install
> diff --git a/recipes-extended/irqbalance/irqbalance/fix-configure-libcap-ng.patch b/recipes-extended/irqbalance/irqbalance/fix-configure-libcap-ng.patch
> new file mode 100644
> index 0000000..5be5243
> --- /dev/null
> +++ b/recipes-extended/irqbalance/irqbalance/fix-configure-libcap-ng.patch
> @@ -0,0 +1,24 @@
> +Subject: [PATCH] grasp withval for libcap-ng
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Ming Liu <ming.liu@windriver.com>
> +---
> + configure.ac |    5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff -urpN a/configure.ac b/configure.ac
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -61,7 +61,10 @@ AS_IF(
> + AM_CONDITIONAL([LOCAL_GLIB], [test "x$local_glib2" = "xyes"])
> +
> + AC_ARG_WITH([libcap-ng],
> +-  AS_HELP_STRING([libcap-ng], [Add libcap-ng-support @<:@default=auto@:>@]))
> ++  [AS_HELP_STRING([libcap-ng], [Add libcap-ng-support @<:@default=auto@:>@])],
> ++  [libcap_ng=$withval],
> ++  [libcap_ng=$withval]
> ++)
> +
> + AS_IF(
> +   [test "x$libcap_ng" != "xno"],
> diff --git a/recipes-extended/irqbalance/irqbalance_1.0.6.bb b/recipes-extended/irqbalance/irqbalance_1.0.6.bb
> index fd08b73..ed0249a 100644
> --- a/recipes-extended/irqbalance/irqbalance_1.0.6.bb
> +++ b/recipes-extended/irqbalance/irqbalance_1.0.6.bb
> @@ -12,4 +12,5 @@ SRC_URI[sha256sum] = "95ac79992e6de501f613c781b0fc8aa17a4aaf6a3d865bb6e15ac6a46c
>  SRC_URI = "http://irqbalance.googlecode.com/files/irqbalance-${PV}.tar.gz \
>             file://add-initscript.patch \
>             file://irqbalance-Add-status-and-reload-commands.patch \
> +           file://fix-configure-libcap-ng.patch \
>            "
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

