Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 294D8E00B6C; Sun, 30 Sep 2018 18:33:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.182 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2040DE00901
	for <meta-virtualization@yoctoproject.org>;
	Sun, 30 Sep 2018 18:33:09 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id z21-v6so1494143ljz.0
	for <meta-virtualization@yoctoproject.org>;
	Sun, 30 Sep 2018 18:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gqxaGU6QF5WyA6GL7W1Qcev6jyZupeH4fD6yXdnv6YQ=;
	b=uD7tVyQDPo4x6p1iCO2zujbfZIAr/km2X2hZ1wMvyzNOX29ynE/H1+xS6pyf0SFbFG
	vz8vYv0WO1ElZMOmOQKuTZehCdNcB7OM/ScM7/kPEkRe3TVvMS90gSkvK5ugzPoyRR/h
	ZLaDpvww6z7E4dWwb3Olif8/tWcQNYO2TL0oipMmE402OexYGZlxW6RwxFhD2Vos72yW
	C+ZPrpF1QXnJh/ktSCKExznwIcxuk0Dz+0nt0dC05kxBSpZqfdZN1fRE4adp5QnBYB58
	ZShg5M0bzW0sbYrMYqKrc1azUYMPq+1Lf8gKhHYV1BLQlyHeiuIe7C5kyTrkLEzb2W4h
	OmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gqxaGU6QF5WyA6GL7W1Qcev6jyZupeH4fD6yXdnv6YQ=;
	b=Yp1nZFCHiqCfDs4NNoSvb4GCSvdZ+cN1oTfHwjxr1QQmb0o8L+wxfscJ+aqPIDojMT
	QPE2URiXTCyltbJOwtuYkn/uHpubjKEk2h6HZZttp/PR6kmhC2lvuWx0+y8955Lq7ZBX
	vlAAXhN6Rxz9hG/9oJ+80Tg+oJUjp4C26iFeJ9fwUEutfE7WIJykrqFgQy+fxKZtLykt
	I/WCenrDVzVfXjvxMvEEdO5pGabHd1nEl5TCJ2R3MCIaBkEZAMnPShDo4RCcBJ8YiJmn
	BWyv2/5H39OZZXLs25X13S7h6sIZMboNtuMPfiw1t1VJLK7drG+DT36PwobCHWiNQbZs
	ATKA==
X-Gm-Message-State: ABuFfohUc7RLzTtwHr7r/nWBDwPCy61MI9mVlEk0Uvpe/CbOZ/8mrxAr
	IrsilWkIDLY8gx5RC53FaVA3PHuaoujpCPHOanY=
X-Google-Smtp-Source: ACcGV63XUB641ywPUSrhxCJkkbA4qC/RRy7p9kdr3nilR/GjZqldgggmvE9z5wPZAzSMbVzT9Z9AUtRBw5CCOfKUVCs=
X-Received: by 2002:a2e:7809:: with SMTP id
	t9-v6mr4332785ljc.120.1538357587998; 
	Sun, 30 Sep 2018 18:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <1537989136-27095-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1537989136-27095-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 30 Sep 2018 21:32:56 -0400
Message-ID: <CADkTA4NEnjc=q3=t5xMmwb8k_8Qhbi=mabqKQOatsYcJtEnciA@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/2] libvirt: uprev to v4.7.0
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
X-List-Received-Date: Mon, 01 Oct 2018 01:33:10 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce
On Wed, Sep 26, 2018 at 3:12 PM Mark Asselstine
<mark.asselstine@windriver.com> wrote:
>
> A straight-forward uprev to the latest stable release. As usual basic
> runtime sanity tests have been run along with the ptests. The
> following is the results of the ptests:
>
>   ====================================
>   Testsuite summary for libvirt 4.7.0
>   ====================================
>   # TOTAL: 120
>   # PASS:  117
>   # SKIP:  0
>   # XFAIL: 0
>   # FAIL:  3
>   # XPASS: 0
>   # ERROR: 0
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt-python.inc                     | 4 ++--
>  recipes-extended/libvirt/libvirt/runptest.patch                 | 4 ++--
>  recipes-extended/libvirt/{libvirt_4.5.0.bb => libvirt_4.7.0.bb} | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
>  rename recipes-extended/libvirt/{libvirt_4.5.0.bb => libvirt_4.7.0.bb} (98%)
>
> diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
> index cdc5719..be9079d 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -18,8 +18,8 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
>  SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
>  SRC_URI += "file://libvirt_api_xml_path.patch;patchdir=../libvirt-python-${PV}"
>
> -SRC_URI[libvirt_python.md5sum] = "0c1b66a8878d6436b036565060707f73"
> -SRC_URI[libvirt_python.sha256sum] = "ef35ed6bc24d76563b1ba9b068ef5a048016726dba62a9d057fe6dfbea6b0f60"
> +SRC_URI[libvirt_python.md5sum] = "32cf281199367aec2881c96d1bd80dc6"
> +SRC_URI[libvirt_python.sha256sum] = "e36fee5898de3550ed7e63d5d0a8447f9d78f06574634855dee59eae27930908"
>
>  export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
>  export LIBVIRT_CFLAGS = "-I${S}/include"
> diff --git a/recipes-extended/libvirt/libvirt/runptest.patch b/recipes-extended/libvirt/libvirt/runptest.patch
> index b900c01..457e821 100644
> --- a/recipes-extended/libvirt/libvirt/runptest.patch
> +++ b/recipes-extended/libvirt/libvirt/runptest.patch
> @@ -89,8 +89,8 @@ index 7b93fbd..edc1eb9 100644
>  +      install * $(DEST_DIR)/tools)
>  +      install -d $(DEST_DIR)/src/network
>  +      cp $(top_srcdir)/src/network/*.xml $(DEST_DIR)/src/network
> -+      install -d $(DEST_DIR)/src/cpu
> -+      cp $(top_srcdir)/src/cpu/*.xml $(DEST_DIR)/src/cpu
> ++      install -d $(DEST_DIR)/src/cpu_map
> ++      cp $(top_srcdir)/src/cpu_map/*.xml $(DEST_DIR)/src/cpu_map
>  +      install ../src/libvirt_iohelper $(DEST_DIR)/src
>  +      install -D ../src/libvirtd $(DEST_DIR)/src/libvirtd
>  +      install -d $(DEST_DIR)/src/remote
> diff --git a/recipes-extended/libvirt/libvirt_4.5.0.bb b/recipes-extended/libvirt/libvirt_4.7.0.bb
> similarity index 98%
> rename from recipes-extended/libvirt/libvirt_4.5.0.bb
> rename to recipes-extended/libvirt/libvirt_4.7.0.bb
> index 9cfa74a..14565da 100644
> --- a/recipes-extended/libvirt/libvirt_4.5.0.bb
> +++ b/recipes-extended/libvirt/libvirt_4.7.0.bb
> @@ -37,8 +37,8 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
>             file://configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch \
>            "
>
> -SRC_URI[libvirt.md5sum] = "692b2d00907438ed08a68813d3177cd3"
> -SRC_URI[libvirt.sha256sum] = "e7e95edc0ca553046761ed55a8d01a06a3a3a4238bbeaedb3ba34680a277ab09"
> +SRC_URI[libvirt.md5sum] = "38da6c33250dcbc0a6d68de5c758262b"
> +SRC_URI[libvirt.sha256sum] = "92c279f7321624ac5a37a81f8bbe8c8d2a16781da04c63c99c92d3de035767e4"
>
>  inherit autotools gettext update-rc.d pkgconfig ptest systemd
>
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

