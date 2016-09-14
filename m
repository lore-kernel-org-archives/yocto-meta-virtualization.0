Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 19C13E00509; Wed, 14 Sep 2016 10:49:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_LOW,
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.213.195 listed in dnsbl.sorbs.net]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yb0-f195.google.com (mail-yb0-f195.google.com
	[209.85.213.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2813CE0045D
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Sep 2016 10:49:19 -0700 (PDT)
Received: by mail-yb0-f195.google.com with SMTP id o203so795023yba.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Sep 2016 10:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3WPGL0htRiUnI6SjhtBAhqqEvWlXQ1TFYpXacvq/beA=;
	b=gIbTMAPjD+D5vkHuM5B6eZumazv8EWWm2kUFiX/SuFvRUCT1QETU6zxMCzHQfABs90
	NHsUXhh9kKZhz+0T4IpvqkbXkL1Pd6u8B2TQcX15RLXPa2ObbZ6r93pvB/eBx+/G/ZAv
	jAL1AoRNw5bQ8XqTbsvguYkTpikNHH4t3Gp1VxVPDINwbfz9lDlzGRQIHGQVm9CP2S5S
	coPZx+LKK6VC7pdWuyFTfn/D8ZJqxAQISMfi/xfxGW0NKSmPdFoJrXnLKpMCW4r1sxpF
	N5Fl/8YKlZ6x8/eiumNTjspQPyI2aEZPVdssJMexT9Uno2NA6kpF3HP4VXOgZpaLwKA2
	BDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=3WPGL0htRiUnI6SjhtBAhqqEvWlXQ1TFYpXacvq/beA=;
	b=EuNEULV8Zdo8OK2wdyEEihIcp+0jUVTzH9FLESYjRzP6/3jZiHQqVZeys+WRWh6VBp
	MNdv5RPQgtqUj0F3xR1zdDxEvhjnbAFM+WuGMzJlo5T3HPC5rRQsqFM+X85tf1fTmf5u
	uLYPOq168krWN0Se+piCL4oFhqoUnGT593B5Cuv4xlUDreGZdeVtDDi8zJStUfysI8o2
	VQq+/bKn1akPuB4y6cY2uo/RBbkvrJVXY/pcd+kX8MvDpAY8uDBZSmDBdEv4Z8SRkk3F
	P2w71lrOyW+QI/0LzJ+1rnM++TzCJo1g3U+cSGmvuMqGYYxX60ONEMrg9nR9SGozGQ9Q
	ga/A==
X-Gm-Message-State: AE9vXwMwAWFhMqiOS5ofoffnl2KkRGsdvb8s9zoFTsof6OtPCI704f+dWnca+rEMaSsAl70vYPVujvBuCwPwxQ==
X-Received: by 10.37.38.78 with SMTP id m75mr4113107ybm.150.1473875359297;
	Wed, 14 Sep 2016 10:49:19 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.171.207 with HTTP; Wed, 14 Sep 2016 10:49:18 -0700 (PDT)
In-Reply-To: <1473312960-115788-2-git-send-email-jianchuan.wang@windriver.com>
References: <1473312960-115788-1-git-send-email-jianchuan.wang@windriver.com>
	<1473312960-115788-2-git-send-email-jianchuan.wang@windriver.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Wed, 14 Sep 2016 13:49:18 -0400
X-Google-Sender-Auth: V-hF_NbsH9b9QQA4BuvVfBhN9Bg
Message-ID: <CAPuovELPUFkVpsG3mc3kfD9GevvUgGq6Ta65vc_1b2G_E_N=tw@mail.gmail.com>
To: jianchuan.wang@windriver.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/3] protobuf-c: uprev to 1.2.1 from 0.15
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Sep 2016 17:49:25 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 8, 2016 at 1:35 AM,  <jianchuan.wang@windriver.com> wrote:
> From: Jianchuan Wang <jianchuan.wang@windriver.com>
>
> Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
> ---

Please make use of the '-M' option for git format-patch or similar in
the future. This will drop the similar changes caused by the file
move, allowing the review to focus on the changes in the file only.

Thanks,
Mark


>  recipes-devtools/protobuf/protobuf-c_0.15.bb  | 20 -------------------
>  recipes-devtools/protobuf/protobuf-c_1.2.1.bb | 28 +++++++++++++++++++++++++++
>  2 files changed, 28 insertions(+), 20 deletions(-)
>  delete mode 100644 recipes-devtools/protobuf/protobuf-c_0.15.bb
>  create mode 100644 recipes-devtools/protobuf/protobuf-c_1.2.1.bb
>
> diff --git a/recipes-devtools/protobuf/protobuf-c_0.15.bb b/recipes-devtools/protobuf/protobuf-c_0.15.bb
> deleted file mode 100644
> index 4876d33..0000000
> --- a/recipes-devtools/protobuf/protobuf-c_0.15.bb
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -SUMMARY = "protobuf-c"
> -DESCRIPTION = "This package provides a code generator and runtime libraries to use Protocol Buffers from pure C"
> -HOMEPAGE = "http://code.google.com/p/protobuf-c/"
> -SECTION = "console/tools"
> -LICENSE = "Apache-2.0"
> -
> -LIC_FILES_CHKSUM = "file://src/google/protobuf-c/protobuf-c.c;endline=33;md5=333140fae7cf8a38dc5f980ddb63704b"
> -
> -PR = "r1"
> -
> -DEPENDS = "protobuf"
> -
> -SRC_URI[md5sum] = "73ff0c8df50d2eee75269ad8f8c07dc8"
> -SRC_URI[sha256sum] = "8fcb538e13a5431c46168fc8f2e6ad2574e2db9b684c0c72b066e24f010a0036"
> -SRC_URI = "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/protobuf-c/protobuf-c-${PV}.tar.gz \
> -        file://disable_tests.patch"
> -
> -inherit autotools
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/recipes-devtools/protobuf/protobuf-c_1.2.1.bb b/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
> new file mode 100644
> index 0000000..ff2499e
> --- /dev/null
> +++ b/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
> @@ -0,0 +1,28 @@
> +SUMMARY = "protobuf-c"
> +DESCRIPTION = "This package provides a code generator and runtime libraries to use Protocol Buffers from pure C"
> +HOMEPAGE = "http://code.google.com/p/protobuf-c/"
> +SECTION = "console/tools"
> +LICENSE = "Apache-2.0"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=235c3195a3968524dc1524b4ebea0c0e"
> +
> +COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
> +
> +DEPENDS = "protobuf protobuf-c-native"
> +
> +SRC_URI[md5sum] = "e544249c329391fff512c3874895cfbe"
> +SRC_URI[sha256sum] = "846eb4846f19598affdc349d817a8c4c0c68fd940303e6934725c889f16f00bd"
> +SRC_URI = "https://github.com/protobuf-c/protobuf-c/releases/download/v1.2.1/protobuf-c-1.2.1.tar.gz "
> +#SRC_URI_append_class-target ="file://0001-protobuf-c-Remove-the-rules-which-depend-on-the-nati.patch"
> +
> +inherit autotools pkgconfig
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +do_configure_prepend_class-target() {
> +    export PKG_CONFIG_PATH="${STAGING_LIBDIR_NATIVE}/pkgconfig:${PKG_CONFIG_PATH}"
> +}
> +
> +do_install_append_class-native() {
> +    install -m 755 ${B}/t/generated-code2/cxx-generate-packed-data ${D}/${bindir}
> +}
> --
> 2.8.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

