Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3CA8EE00CB9; Wed, 20 Feb 2019 19:17:32 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5F37E00CB6
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Feb 2019 19:17:30 -0800 (PST)
Received: by mail-lj1-f193.google.com with SMTP id g80so22687184ljg.6
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Feb 2019 19:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aXzg5T0XG/uJhmOYov9zkJRnDZOLGIKKtSkzOyTYn7g=;
	b=HIEQzKpgcsh9uNjkZ2M8iJjaQoKig/0PwBehzLQmNeEXHYqb+YeSVWAzYLStnY7Ot6
	o/rzNVFeB7ZbPPGryypSVM4JilrkYOHFYBFF0CM5pICT0TQpH3XdNj7mlWL6XJxgOORC
	1znntgWSGNR6gQMGbm9LPxzqrSfd59z3X5K+eGZD/WDRIwpMPfuDDeBP2auWapiMZbhN
	jCFWcB2H3qsKo3f58HtCfda7bkHTYfng///3IpJHh9Bn7Bc3GtBRQ/TM9F8Zv6V9YTd0
	ad7V0HSQ/0WjFOWjC53tPCoMdVR4caUQeoGZNNXYRGERyHkqEChf4yZlkSwLNjM52K2+
	XAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aXzg5T0XG/uJhmOYov9zkJRnDZOLGIKKtSkzOyTYn7g=;
	b=osheAmjsObNHT0Glm7hN3qh/7N0ygou9poBkfG/0klIL0RjCwJb2RYXIpfVZKflqYy
	DoFERkBgnF7QerWmz8ML6N9UFtV1ktPfZJqFZ3/L5HZnFiza1r22YHBRBunHwEiCc81C
	0a31AoUMuQ5FuUz9L143LXOtALUrhPJX9rmPJOxkiOPJKVq5epww29ZniXW6R/l3Rr9E
	h48MNaOsLmjycFNb6hUf25AdXDIGQdqg7o99L/jxUsGineb0X97Es90yg+DHGES/vB6q
	uJmNX27KKtUowW4+bdu07gZZbvDUymzt0qqDKfEmp6QsnmjMib9wQbFhdHa3gcqDAd2l
	dONg==
X-Gm-Message-State: AHQUAuZaiVQIThJ4Pb/ET4TOK98htKOoFGc30tggi27/+iH2CbLnqtZP
	jtkAm+lZrF+dOyDCkfvkrJE4OwE6Pn/dO8oI9BA=
X-Google-Smtp-Source: AHgI3Ib7AT+BLXvlWVJIly7UMfRMI0kuiGxkYlI8Gu5H/Zu9qB+ehEg+dA9TtiAOCIr7OYucFtZ5zC/t8oSBC7MfbwU=
X-Received: by 2002:a2e:6309:: with SMTP id x9mr12320245ljb.75.1550719049716; 
	Wed, 20 Feb 2019 19:17:29 -0800 (PST)
MIME-Version: 1.0
References: <20190221005203.29272-1-christopher.w.clark@gmail.com>
In-Reply-To: <20190221005203.29272-1-christopher.w.clark@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 20 Feb 2019 22:17:18 -0500
Message-ID: <CADkTA4Mn=jH3jPxb0Fy0r0Ur5iP8SCwo2KKqkMeyZtTnwqKhAw@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] ipxe: Uprev and fix host compiler and linker flags.
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
X-List-Received-Date: Thu, 21 Feb 2019 03:17:32 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, Feb 20, 2019 at 7:52 PM <christopher.w.clark@gmail.com> wrote:
>
> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> Adds patch to fix detection of the "no-pie" vs "nopie" flag, which needs
> to be performed for both the host and target compilers; cannot assume
> that one works for the other.
>
> Use EXTRA_HOST_CFLAGS and EXTRA_HOST_LDFLAGS variables for passing
> the host tool build parameters: BUILD_CFLAGS and BUILD_LDFLAGS.
>
> Drop unneeded 'NO_WERROR=1' from the recipe and rewrap line.
>
> Uprev commit to latest git revision.
>
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> ---
>  .../files/ipxe-fix-hostcc-nopie-cflags.patch  | 68 +++++++++++++++++++
>  recipes-extended/ipxe/ipxe_git.bb             | 15 +++-
>  2 files changed, 80 insertions(+), 3 deletions(-)
>  create mode 100644 recipes-extended/ipxe/files/ipxe-fix-hostcc-nopie-cflags.patch
>
> diff --git a/recipes-extended/ipxe/files/ipxe-fix-hostcc-nopie-cflags.patch b/recipes-extended/ipxe/files/ipxe-fix-hostcc-nopie-cflags.patch
> new file mode 100644
> index 0000000..da154a6
> --- /dev/null
> +++ b/recipes-extended/ipxe/files/ipxe-fix-hostcc-nopie-cflags.patch
> @@ -0,0 +1,68 @@
> +Fix detection of host compiler "no-pie"/"nopie" and link flags.
> +
> +Detection of the "no-pie" vs "nopie" flag needs to be performed for both
> +the host and target compilers; cannot assume that one works for the other.
> +
> +Use EXTRA_HOST_CFLAGS and EXTRA_HOST_LDFLAGS variables for passing
> +host tool parameters if required. Removes previous hardcoded "-O2 -g".
> +
> +Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> +diff --git a/Makefile.housekeeping b/Makefile.housekeeping
> +index f833492..5451c39 100644
> +--- a/Makefile.housekeeping
> ++++ b/Makefile.housekeeping
> +@@ -133,6 +133,7 @@ eval :
> + WORKAROUND_CFLAGS :=
> + WORKAROUND_ASFLAGS :=
> + WORKAROUND_LDFLAGS :=
> ++WORKAROUND_HOST_CFLAGS :=
> +
> + # Make syntax does not allow use of comma or space in certain places.
> + # This ugly workaround is suggested in the manual.
> +@@ -445,7 +446,7 @@ endif
> + CFLAGS                += $(WORKAROUND_CFLAGS) $(EXTRA_CFLAGS)
> + ASFLAGS               += $(WORKAROUND_ASFLAGS) $(EXTRA_ASFLAGS)
> + LDFLAGS               += $(WORKAROUND_LDFLAGS) $(EXTRA_LDFLAGS)
> +-HOST_CFLAGS   += $(WORKAROUND_CFLAGS) -O2 -g
> ++HOST_CFLAGS   += $(WORKAROUND_HOST_CFLAGS) $(EXTRA_HOST_CFLAGS)
> +
> + # Inhibit -Werror if NO_WERROR is specified on make command line
> + #
> +@@ -1375,7 +1376,7 @@ endif # defined(BIN)
> + # The compression utilities
> + #
> +
> +-ZBIN_LDFLAGS := -llzma
> ++ZBIN_LDFLAGS := -llzma $(EXTRA_HOST_LDFLAGS)
> +
> + $(ZBIN) : util/zbin.c $(MAKEDEPS)
> +       $(QM)$(ECHO) "  [HOSTCC] $@"
> +diff --git a/arch/i386/Makefile b/arch/i386/Makefile
> +index b7c2792..4a637ad 100644
> +--- a/arch/i386/Makefile
> ++++ b/arch/i386/Makefile
> +@@ -78,11 +78,20 @@ CFLAGS                     += -Ui386
> + # -nopie.  We therefore test for both.
> + #
> + ifeq ($(CCTYPE),gcc)
> +-PIE_TEST = [ -z "`$(CC) -fno-PIE -no-pie -x c -c /dev/null -o /dev/null 2>&1`" ]
> +-PIE_FLAGS := $(shell $(PIE_TEST) && $(ECHO) '-fno-PIE -no-pie')
> +-PIE_TEST2 = [ -z "`$(CC) -fno-PIE -nopie -x c -c /dev/null -o /dev/null 2>&1`" ]
> ++PIE_TEST1_FLAGS = "-fno-PIE -no-pie -x c -c /dev/null -o /dev/null 2>&1"
> ++PIE_TEST2_FLAGS = "-fno-PIE -nopie -x c -c /dev/null -o /dev/null 2>&1"
> ++
> ++PIE_TEST1 = [ -z "`$(CC) "$(PIE_TEST1_FLAGS)"`" ]
> ++PIE_TEST2 = [ -z "`$(CC) "$(PIE_TEST2_FLAGS)"`" ]
> ++PIE_FLAGS1 := $(shell $(PIE_TEST1) && $(ECHO) '-fno-PIE -no-pie')
> + PIE_FLAGS2 := $(shell $(PIE_TEST2) && $(ECHO) '-fno-PIE -nopie')
> +-WORKAROUND_CFLAGS += $(PIE_FLAGS) $(PIE_FLAGS2)
> ++WORKAROUND_CFLAGS += $(PIE_FLAGS1) $(PIE_FLAGS2)
> ++
> ++HOST_PIE_TEST1 = [ -z "`$(HOSTCC) "$(PIE_TEST1_FLAGS)"`" ]
> ++HOST_PIE_TEST2 = [ -z "`$(HOSTCC) "$(PIE_TEST2_FLAGS)"`" ]
> ++HOST_PIE_FLAGS1 := $(shell $(HOST_PIE_TEST1) && $(ECHO) '-fno-PIE -no-pie')
> ++HOST_PIE_FLAGS2 := $(shell $(HOST_PIE_TEST2) && $(ECHO) '-fno-PIE -nopie')
> ++WORKAROUND_HOST_CFLAGS += $(HOST_PIE_FLAGS1) $(HOST_PIE_FLAGS2)
> + endif
> +
> + # i386-specific directories containing source files
> diff --git a/recipes-extended/ipxe/ipxe_git.bb b/recipes-extended/ipxe/ipxe_git.bb
> index 18c92d2..1de0f21 100644
> --- a/recipes-extended/ipxe/ipxe_git.bb
> +++ b/recipes-extended/ipxe/ipxe_git.bb
> @@ -4,15 +4,24 @@ LICENSE = "GPLv2"
>  DEPENDS = "binutils-native perl-native syslinux mtools-native cdrtools-native xz"
>  LIC_FILES_CHKSUM = "file://../COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
> -SRCREV = "133f4c47baef6002b2ccb4904a035cda2303c6e5"
> +SRCREV = "64b4452bca04af433f1c98ab782c0e93cd5c88c0"
>  PV = "gitr${SRCPV}"
>  PR = "r0"
>
> -SRC_URI = "git://git.ipxe.org/ipxe.git;protocol=https"
> +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> +
> +SRC_URI = " \
> +    git://git.ipxe.org/ipxe.git;protocol=https \
> +    file://ipxe-fix-hostcc-nopie-cflags.patch \
> +    "
>
>  FILES_${PN} = "/usr/share/firmware/*.rom"
>
> -EXTRA_OEMAKE = "NO_WERROR=1 ISOLINUX_BIN="${STAGING_DIR_TARGET}/usr/share/syslinux/isolinux.bin" CROSS_COMPILE="${TARGET_PREFIX}""
> +EXTRA_OEMAKE = " \
> +    ISOLINUX_BIN="${STAGING_DIR_TARGET}/usr/share/syslinux/isolinux.bin" \
> +    CROSS_COMPILE="${TARGET_PREFIX}" \
> +    EXTRA_HOST_CFLAGS="${BUILD_CFLAGS}" \
> +    EXTRA_HOST_LDFLAGS="${BUILD_LDFLAGS}""
>
>  S = "${WORKDIR}/git/src"
>
> --
> 2.17.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

