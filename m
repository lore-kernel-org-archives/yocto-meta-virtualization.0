Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 99D93E0077E; Mon, 16 Feb 2015 20:55:50 -0800 (PST)
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
	*      [209.85.215.54 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF02DE00777
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Feb 2015 20:55:45 -0800 (PST)
Received: by labgf13 with SMTP id gf13so33569774lab.9
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Feb 2015 20:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=MODYNfUBJQjOZzdqCegA2r0C2gAnTWYcxq3hEvb0ZxA=;
	b=v07Vu6fIgQacOzsJkU6xsA3oDBMJwamztga7eSvKj4rl/FK92Sni2aH1qJzlqfCgjJ
	k/wBKz3WtgOgSeyrU3BULp+ub7lzkPMNx8JAWNsrTQVhfrNTSb3fVGML/xVZamtSylkU
	7b4obhFSh2BmO2uhzlxkLInr27xefOSgWM9rr3C4+MyNrmm9OQhFgQ+gzVwsLbFcOw1l
	5vsnI87vD1s29tEFAS0dU8Ke15x7D6wAoTGe96E1I0AsS1JJhmWsIGxdQXztM/mg7s4e
	NNdfgK5EXjGAqtYUZdpXk22F1sNsxftMZA2A5Y+DAhnuYO4PWhzhPNmFsVXacGDWn/qJ
	CwGA==
MIME-Version: 1.0
X-Received: by 10.152.18.133 with SMTP id w5mr26440892lad.51.1424148943998;
	Mon, 16 Feb 2015 20:55:43 -0800 (PST)
Received: by 10.112.40.34 with HTTP; Mon, 16 Feb 2015 20:55:43 -0800 (PST)
In-Reply-To: <5109c896ba3341469be6b848ab5220c3@BN1AFFO11FD019.protection.gbl>
References: <5109c896ba3341469be6b848ab5220c3@BN1AFFO11FD019.protection.gbl>
Date: Mon, 16 Feb 2015 23:55:43 -0500
Message-ID: <CADkTA4NKmw0d8e99Ch-=EhmyrYY+jOmF+HpRJ68kxLYnJp5uZw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Nathan Rossi <nathan.rossi@xilinx.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 07/14] xen: Update recipe to 4.5.0
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
X-List-Received-Date: Tue, 17 Feb 2015 04:55:50 -0000
Content-Type: text/plain; charset=UTF-8

I have no objections to the series. I'll let this soak for another day or two,
and then do the merge.

Cheers,

Bruce

On Mon, Feb 16, 2015 at 3:41 AM, Nathan Rossi <nathan.rossi@xilinx.com> wrote:
> * Added configure step to fix handling of the CC, AS, etc. variables
>   within the xen build scripts.
> * Add configure options for handling of system config directories for
>   cross building
> * Use the qemu provided by oe instead of the xen built version for
>   consistency as well as to remove the need to have two seperate flows
>   for building qemu
> * Disable building of SeaBIOS
> * Removed no longer needed patches
>
> Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
> ---
> Sorry, minor mistake I overlooked. Removed 'squish' from commit message.
> ---
>  ...lask-avoid-installing-policy-file-as-boot.patch | 26 ----------------
>  recipes-extended/xen/xen_4.3.1.bb                  | 24 ---------------
>  recipes-extended/xen/xen_4.5.0.bb                  | 36 ++++++++++++++++++++++
>  3 files changed, 36 insertions(+), 50 deletions(-)
>  delete mode 100644 recipes-extended/xen/files/flask-avoid-installing-policy-file-as-boot.patch
>  delete mode 100644 recipes-extended/xen/xen_4.3.1.bb
>  create mode 100644 recipes-extended/xen/xen_4.5.0.bb
>
> diff --git a/recipes-extended/xen/files/flask-avoid-installing-policy-file-as-boot.patch b/recipes-extended/xen/files/flask-avoid-installing-policy-file-as-boot.patch
> deleted file mode 100644
> index d980807..0000000
> --- a/recipes-extended/xen/files/flask-avoid-installing-policy-file-as-boot.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From 8bff3edead4318bfebc487f929f833d11922c238 Mon Sep 17 00:00:00 2001
> -From: "Vadim A. Misbakh-Soloviov" <mva@mva.name>
> -Date: Tue, 30 Jul 2013 16:34:38 +0400
> -Subject: [PATCH] flask: avoid installing policy file as '/boot'
> -
> -Signed-off-by: Vadim A. Misbakh-Soloviov <mva@mva.name>
> -Acked-by: Daniel De Graaf <dgdegra@tycho.nsa.gov>
> ----
> - tools/flask/policy/Makefile |    1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/tools/flask/policy/Makefile b/tools/flask/policy/Makefile
> -index e666f3e..df1e8f3 100644
> ---- a/tools/flask/policy/Makefile
> -+++ b/tools/flask/policy/Makefile
> -@@ -103,6 +103,7 @@ POLICY_SECTIONS += $(USERS) $(CONSTRAINTS) $(ISID_DEFS)
> - all: $(POLICY_FILENAME)
> -
> - install: $(POLICY_FILENAME)
> -+      $(INSTALL_DIR) $(POLICY_LOADPATH)
> -       $(INSTALL_DATA) $^ $(POLICY_LOADPATH)
> -
> - $(POLICY_FILENAME): policy.conf
> ---
> -1.7.10.4
> -
> diff --git a/recipes-extended/xen/xen_4.3.1.bb b/recipes-extended/xen/xen_4.3.1.bb
> deleted file mode 100644
> index 2c9806b..0000000
> --- a/recipes-extended/xen/xen_4.3.1.bb
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -require xen.inc
> -
> -SRC_URI = " \
> -    http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
> -    file://flask-avoid-installing-policy-file-as-boot.patch \
> -    "
> -
> -SRC_URI[md5sum] = "7616b8704e1ab89c81f011f0e3703bc8"
> -SRC_URI[sha256sum] = "3b5b7cc508b1739753585b5c25635471cdcef680e8770a78bf6ef9333d26a9fd"
> -
> -S = "${WORKDIR}/xen-${PV}"
> -
> -RDEPENDS_${PN}-base += "\
> -    ${PN}-libblktap \
> -    ${PN}-flask \
> -    "
> -
> -do_configure_prepend() {
> -    # fixup qemu-xen-traditional pciutils check hardcoded to test /usr/include/pci
> -    sed -i 's/\/usr\/include\/pci/$(STAGING_INCDIR)\/pci/g' ${S}/tools/qemu-xen-traditional/xen-hooks.mak
> -
> -    # fixup for qemu to cross compile
> -    sed -i 's/configure --d/configure --cross-prefix=${TARGET_PREFIX} --d/g' ${S}/tools/qemu-xen-traditional/xen-setup
> -}
> diff --git a/recipes-extended/xen/xen_4.5.0.bb b/recipes-extended/xen/xen_4.5.0.bb
> new file mode 100644
> index 0000000..62d1d87
> --- /dev/null
> +++ b/recipes-extended/xen/xen_4.5.0.bb
> @@ -0,0 +1,36 @@
> +require xen.inc
> +
> +SRC_URI = " \
> +    http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
> +    "
> +
> +SRC_URI[md5sum] = "9bac43d2419d05a647064d9253bb03fa"
> +SRC_URI[sha256sum] = "5bdb40e2b28d2eeb541bd71a9777f40cbe2ae444b987521d33f099541a006f3b"
> +
> +S = "${WORKDIR}/xen-${PV}"
> +
> +# Xen suffixes the libexecdir within its configure scripts, prevent the nested xen/xen/
> +libexecdir = "${libdir}"
> +
> +# These options override detected values from the build.
> +EXTRA_OECONF_append += " \
> +    --with-initddir=${INIT_D_DIR} \
> +    --with-sysconfig-leaf-dir=default \
> +    --with-system-qemu=/usr/bin/qemu-system-i386 \
> +    --disable-qemu-traditional \
> +    --disable-seabios \
> +    "
> +
> +do_configure_prepend() {
> +    # fixup AS/CC/CCP/etc variable within StdGNU.mk
> +    for i in AS LD CC CPP AR RANLIB NM STRIP OBJCOPY OBJDUMP; do
> +        sed -i "s/^\($i\s\s*\).*=/\1?=/" ${S}/config/StdGNU.mk
> +    done
> +    # fixup environment passing in some makefiles
> +    sed -i 's#\(\w*\)=\(\$.\w*.\)#\1="\2"#' ${S}/tools/firmware/Makefile
> +}
> +
> +do_install_append() {
> +    # fixup default path to qemu-system-i386
> +    sed -i 's#\(test -z "$QEMU_XEN" && QEMU_XEN=\).*$#\1"/usr/bin/qemu-system-i386"#' ${D}/etc/init.d/xencommons
> +}
> --
> 2.1.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

