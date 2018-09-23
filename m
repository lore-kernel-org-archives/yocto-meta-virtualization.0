Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BF907E00874; Sat, 22 Sep 2018 20:12:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C3700E0078F
	for <meta-virtualization@yoctoproject.org>;
	Sat, 22 Sep 2018 20:12:12 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id m7-v6so347646ljc.9
	for <meta-virtualization@yoctoproject.org>;
	Sat, 22 Sep 2018 20:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5B56VCa+PedG9lwdHWOCTzuDhETqHRfqvM+vQUGxj/8=;
	b=Nmhi+SdXZLvxwotwDaLwgKeNyLS+uqMBTvuUqaAVBBSC6s7ZJ7E9zBnkEs6ngMA7Da
	lqUMGuZYlC2cQaHVp18MOhBXGcPge4t/ouQcZhtSRKgm1fJbKK5CWDggrcKKEXWAA4em
	pfQdhh79QUJ21rVM68WJ412+Faml/RWy98cRo8t/3bnYofEt73tn86S+eha50k4cr53z
	cGSkOYQtnU3fyRC9CeZUYfQLRFvYNIiT/Vai+lsAqZEaaiEL3ChCJTCth/G3ae0UxNXX
	8xzosgOB8loOR2ph3CJz7hP+56JD+nqi0RfZdzMcS8MVFKsefjDQbU+2H3yeUQ/dXwq1
	B0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5B56VCa+PedG9lwdHWOCTzuDhETqHRfqvM+vQUGxj/8=;
	b=P9qVXcPp2SFUmiAiaNVareMT2Lc6qeIAlSFPGaKcdnJZgoomANoYOM/dP9nXx5DPoQ
	dq80LVdhIFjen+Gk0S5kJEDAPOpfInfJgfY3aQ2Qw37YbWtM7UPqXNCv6NSbdQom/8Au
	S7kHueaMqBNunHP3zj5lnQ5wwadlcZwtVwrDHBqoqM3JBBYnTtaKJU+l/vNbecacTrsh
	qt//Sn16nfAjKK4Ad/RXC9GLTRtR13RndBvcl1yler+O7IwmybjwDJpGh5u3dZnzw/ZL
	FDWsXe97Wbg15hWVwX3UVxWxaRcDlM8h4DhEmkDC0WtwVr9gwqJIwMMpqDJbV2+RSFdU
	Uzbw==
X-Gm-Message-State: ABuFfoj4bUmrGe+aMiN2PSZ5BIFun8ZkgNw2xg8QXptG4W6MNM5jh4KY
	lXmA5tR30J/hHqJgdbf55T/NpvkBF/Zy9gc9sO8=
X-Google-Smtp-Source: ACcGV602VNy+s+VLSFOYmpdK0onDoKphvXIJ7OACHdhsWKwl2Mbw1S/FIXASUyyv0qTGo1kYLRtCOr1wEg9kFEEf6g4=
X-Received: by 2002:a2e:84c6:: with SMTP id q6-v6mr7145775ljh.65.1537672331394;
	Sat, 22 Sep 2018 20:12:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:86c9:0:0:0:0:0 with HTTP; Sat, 22 Sep 2018 20:12:10
	-0700 (PDT)
In-Reply-To: <1537390675-29637-1-git-send-email-christopher.w.clark@gmail.com>
References: <1537390675-29637-1-git-send-email-christopher.w.clark@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 22 Sep 2018 23:12:10 -0400
Message-ID: <CADkTA4MvWZPGgWwBQXyAW=utnW5vCBoSSRmRiWbcJDpmg9DPbg@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] seabios: update to 1.11.2 and use github for SRC_URI
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
X-List-Received-Date: Sun, 23 Sep 2018 03:12:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 19, 2018 at 4:57 PM,  <christopher.w.clark@gmail.com> wrote:
> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> Update to version 1.11.2 fixes compile errors encountered with 1.9.1.
>
> Use the official QEMU github mirror of git.qemu.org/seabios as
> a stable, maintained, available SRC_URI for seabios releases.
>
> While downloads.seabios.org is documented as the official source,
> it has not published tarballs for the most recent releases.
>
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> ---
>
> The prior version 1.9.1 was failing to build with current master of OE:
>
> | src/stacks.c: Assembler messages:
> | src/stacks.c:567: Error: found '(', expected: ')'
> | src/stacks.c:567: Error: junk `(%ebp))' after expression
> | src/stacks.c:568: Warning: indirect call without `*'
> | Makefile:133: recipe for target 'out/src/stacks.o' failed
> | make: *** [out/src/stacks.o] Error 1

merged.

Bruce

>
>  recipes-extended/seabios/seabios_1.11.2.bb | 44 ++++++++++++++++++++++++++++++
>  recipes-extended/seabios/seabios_1.9.1.bb  | 43 -----------------------------
>  2 files changed, 44 insertions(+), 43 deletions(-)
>  create mode 100644 recipes-extended/seabios/seabios_1.11.2.bb
>  delete mode 100644 recipes-extended/seabios/seabios_1.9.1.bb
>
> diff --git a/recipes-extended/seabios/seabios_1.11.2.bb b/recipes-extended/seabios/seabios_1.11.2.bb
> new file mode 100644
> index 0000000..4ea9eb7
> --- /dev/null
> +++ b/recipes-extended/seabios/seabios_1.11.2.bb
> @@ -0,0 +1,44 @@
> +DESCRIPTION = "SeaBIOS"
> +HOMEPAGE = "http://www.coreboot.org/SeaBIOS"
> +LICENSE = "LGPLv3"
> +SECTION = "firmware"
> +
> +SRC_URI = " \
> +    https://github.com/qemu/seabios/archive/rel-${PV}.tar.gz \
> +    file://hostcc.patch \
> +    "
> +S = "${WORKDIR}/${PN}-rel-${PV}"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504         \
> +                    file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6  \
> +                    "
> +
> +SRC_URI[md5sum] = "3f78065837dbd8873513a1b7d5276e78"
> +SRC_URI[sha256sum] = "73e73c8e406d97265782f6c942b3c1d178ed4f4afc9f381b22336c3968291693"
> +
> +FILES_${PN} = "/usr/share/firmware"
> +
> +DEPENDS = "util-linux-native file-native bison-native flex-native gettext-native iasl-native python-native"
> +
> +TUNE_CCARGS = ""
> +EXTRA_OEMAKE += "HOSTCC='${BUILD_CC}'"
> +EXTRA_OEMAKE += "CROSS_PREFIX=${TARGET_PREFIX}"
> +
> +COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
> +
> +do_configure() {
> +    oe_runmake defconfig
> +}
> +
> +do_compile() {
> +    unset CPP
> +    unset CPPFLAGS
> +    oe_runmake
> +}
> +
> +do_install() {
> +    oe_runmake
> +    install -d ${D}/usr/share/firmware
> +    install -m 0644 out/bios.bin ${D}/usr/share/firmware/
> +}
> +
> diff --git a/recipes-extended/seabios/seabios_1.9.1.bb b/recipes-extended/seabios/seabios_1.9.1.bb
> deleted file mode 100644
> index 77e8f34..0000000
> --- a/recipes-extended/seabios/seabios_1.9.1.bb
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -DESCRIPTION = "SeaBIOS"
> -HOMEPAGE = "http://www.coreboot.org/SeaBIOS"
> -LICENSE = "LGPLv3"
> -SECTION = "firmware"
> -
> -SRC_URI = " \
> -    https://www.seabios.org/downloads/${PN}-${PV}.tar.gz \
> -    file://hostcc.patch \
> -    "
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504         \
> -                    file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6  \
> -                    "
> -
> -SRC_URI[md5sum] = "e21b6f3e54d492be837ef20d66617f81"
> -SRC_URI[sha256sum] = "8a2a562fe5cfd37fe8327cdc4a60accdfe441e235b29e6999fdeb442ba98d608"
> -
> -FILES_${PN} = "/usr/share/firmware"
> -
> -DEPENDS = "util-linux-native file-native bison-native flex-native gettext-native iasl-native python-native"
> -
> -TUNE_CCARGS = ""
> -EXTRA_OEMAKE += "HOSTCC='${BUILD_CC}'"
> -EXTRA_OEMAKE += "CROSS_PREFIX=${TARGET_PREFIX}"
> -
> -COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
> -
> -do_configure() {
> -    oe_runmake defconfig
> -}
> -
> -do_compile() {
> -    unset CPP
> -    unset CPPFLAGS
> -    oe_runmake
> -}
> -
> -do_install() {
> -    oe_runmake
> -    install -d ${D}/usr/share/firmware
> -    install -m 0644 out/bios.bin ${D}/usr/share/firmware/
> -}
> -
> --
> 2.7.4
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

