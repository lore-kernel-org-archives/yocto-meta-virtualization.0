Return-Path: <kurt.bodiker@braintrust-us.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 21F5EE00848; Fri,  3 Aug 2018 08:59:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.214.50 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B38F1E006B4
	for <meta-virtualization@yoctoproject.org>;
	Fri,  3 Aug 2018 08:59:28 -0700 (PDT)
Received: by mail-it0-f50.google.com with SMTP id p81-v6so9066725itp.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 03 Aug 2018 08:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=braintrust-us-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=Ho1R+Yi+985dFBxdTPf0VCIbugwMJNXB+FILXx4X+Iw=;
	b=dNC9l5b/Ds1BmcWRmesLnSIGi7iUCrJ+RN+B1LWZhTh5rG3RgKFPycZEvJA1nQjxbd
	sU7X14yeT+vuD5RUwxwUUNz+ioeyxtgIwtHTj4QRAowM1Y6qzFYHe5vcsPNYWQALNdv6
	1EWCIGBYpVzRKL7CIPh/ZjltDs+8y4uoo4ySp9twoklgh4UfAeh9mCmdyNbW3Q2AIwu0
	HJlfqaBnL2W8mQDQ66viaqZZAOK4MGq6E8pNUzTIHQVf204qxkBr4/+AujIwrCr1lomr
	vmiSCRf3n9LjPHoIN6qHGQeFPB0odnL8FQR5qStPmtZvkb8LpK+PlFAq5HHmxntBBBKz
	QmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=Ho1R+Yi+985dFBxdTPf0VCIbugwMJNXB+FILXx4X+Iw=;
	b=JwS8noFLn1T/HIxWSgmhCiiVQ84gQrrgxJcx9NbwqVjIv0O5urJCZV8B1HXZ0ZqEHS
	5du/D8Gyz8DBOON4TSx1GVuBTV6UW8Cg9pruhzlne8kzK4EnlApqQYSrGA17DnY+mnl/
	j7SE9rB4UH1NyE3YG7FE8FPPdi5OyvcUbHHpy+KMM5SaE/jOWKjWQEUXqazA0G0ui5z/
	QzDEeelXsIky6bzKMNYsy2LBxlevf7hVMOq5Ou7DkRa2RjvhnpsSTSmt94r30WgVDf9A
	r7s2ZS35XRRGnrHBlFUAT+UtVTGlTXKNlfHmNo7+0an4TwPUE84X+VxVIs+4nymUx5rz
	0UyQ==
X-Gm-Message-State: AOUpUlG6ixOSXaBEkBS6Cp52ylxMn7d9EYlujOYIINAu65wq+2KnqJjl
	PR6n8Zq0IloywVo1wGrvUbmbbiMqlP63Qlb0Vgupi2cLfNKoqGG7AA61Aw1+6ZHaV9Ya+PLUP5P
	xYi+ShLtCHSTQ7SsvT2Zlz+5llYnrDPzA6JBV/VkDIy8VvpxDHg==
X-Google-Smtp-Source: AAOMgpdfIJuM4nceUPkSt6RPXW540dwimcvcaBvLZNXPjFI9lv5uIT24oe0lDT/vzxxuRCD40em406FjsWSx103TF5E=
X-Received: by 2002:a24:2ed4:: with SMTP id
	i203-v6mr7146551ita.114.1533311967721; 
	Fri, 03 Aug 2018 08:59:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:7d58:0:0:0:0:0 with HTTP;
	Fri, 3 Aug 2018 08:59:27 -0700 (PDT)
In-Reply-To: <mailman.89055.1533065770.15860.meta-virtualization@yoctoproject.org>
References: <mailman.89055.1533065770.15860.meta-virtualization@yoctoproject.org>
From: "Bodiker, Kurt" <kurt.bodiker@braintrust-us.com>
Date: Fri, 3 Aug 2018 11:59:27 -0400
Message-ID: <CAGfCXKE0=CVV_MihnfRc1wZvAocScdG6kPA0shoHi7kveqZ_7Q@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: Re: meta-virtualization Digest, Vol 68, Issue 23
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
X-List-Received-Date: Fri, 03 Aug 2018 15:59:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 31, 2018 at 3:36 PM,
<meta-virtualization-request@yoctoproject.org> wrote:
> Send meta-virtualization mailing list submissions to
>         meta-virtualization@yoctoproject.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
>         https://lists.yoctoproject.org/listinfo/meta-virtualization
> or, via email, send a message with subject or body 'help' to
>         meta-virtualization-request@yoctoproject.org
>
> You can reach the person managing the list at
>         meta-virtualization-owner@yoctoproject.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of meta-virtualization digest..."
>
>
> Today's Topics:
>
>    1. [PATCH v2 0/9] Xen: upgrade to 4.11.0
>       (christopher.w.clark@gmail.com)
>    2. [PATCH v2 2/9] xen: add recipe for 4.11.0
>       (christopher.w.clark@gmail.com)
>    3. [PATCH v2 1/9] xen: upgrade to 4.10.1,    and apply patches for
>       gcc 8.1 compatibility (christopher.w.clark@gmail.com)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Tue, 31 Jul 2018 12:35:41 -0700
> From: christopher.w.clark@gmail.com
> To: meta-virtualization@yoctoproject.org
> Cc: cardoe@gentoo.org
> Subject: [meta-virtualization] [PATCH v2 0/9] Xen: upgrade to 4.11.0
> Message-ID:
>         <1533065750-25786-1-git-send-email-christopher.w.clark@gmail.com>
>
> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> This patch series:
> * Fixes Xen recipe compatibility with gcc 8.1
> * Adds the Xen recipe for Xen's current version: 4.11.0
> * Upgrades the existing Xen recipe from 4.10.0 to 4.10.1
>     - provided to ease backport to older branches (eg. sumo)
> * Adds packaging for the Xen shim component and depriv-fd-checker
> * Removes the 4.10.1 and 4.9.1 recipes
>     - superceded by version 4.11.0
> * Upgrades the vtpm stubdomains to Xen version 4.11.0
> * Applies a bug fix patch to the tpm emulator
> * Fixes whitespace patch fuzz on a vtpm patch
> * Updates the Xen git recipe to build upstream staging
> * Applies a workaround for an upstream parallel build bug
>
> Changes since version 1:
> * Use simpler workaround for the upstream parallel build bug
>   (just build the hypervisor before the tools)
> * Add packaging for the new depriv-fd-checker tool
>
> Christopher Clark (9):
>   xen: upgrade to 4.10.1, and apply patches for gcc 8.1 compatibility
>   xen: add recipe for 4.11.0
>   tpm-emulator: apply patch to fix memcmp defect found by gcc
>   xen-vtpm,mini-os : upgrade to Xen 4.11.0
>   xen-vtpm : fix patch fuzz, whitespace-only change
>   xen: remove 4.9.1 recipe and patches no longer required
>   xen: remove 4.10.1 recipe and patches no longer required
>   xen: package depriv-fd-checker
>   xen: Update git recipe to build latest upstream staging branch
>
>  ...check-to-see-if-removing-a-p2m-entry-actu.patch | 176 ---------------=
------
>  ...eturn-value-of-p2m_set_entry-when-decreas.patch | 109 -------------
>  .../xen/files/mini-os_udivmoddi4-gcc7.patch        |  43 -----
>  .../xen/files/tools-xentop-vwprintw.patch          |  25 +++
>  .../xen/files/vtpm-deepquote-anyloc.patch          |   8 +-
>  .../xen/files/vtpm_TPM_ChangeAuthAsymFinish.patch  |  28 ++++
>  recipes-extended/xen/files/xsa246-4.9.patch        |  74 ---------
>  recipes-extended/xen/files/xsa248.patch            | 164 ---------------=
----
>  recipes-extended/xen/files/xsa249.patch            |  42 -----
>  recipes-extended/xen/files/xsa250.patch            |  67 --------
>  recipes-extended/xen/files/xsa251.patch            |  21 ---
>  recipes-extended/xen/files/xsa253.patch            |  26 ---
>  recipes-extended/xen/mini-os_4.11.0.bb             |  17 ++
>  recipes-extended/xen/mini-os_4.9.0.bb              |  18 ---
>  recipes-extended/xen/tpm-emulator_0.7.4.bb         |   1 +
>  recipes-extended/xen/xen-vtpm_4.11.0.bb            |  21 +++
>  recipes-extended/xen/xen-vtpm_4.9.0.bb             |  21 ---
>  recipes-extended/xen/xen.inc                       |  15 ++
>  recipes-extended/xen/xen_4.10.0.bb                 |  12 --
>  recipes-extended/xen/xen_4.11.0.bb                 |  12 ++
>  recipes-extended/xen/xen_4.9.1.bb                  |  18 ---
>  recipes-extended/xen/xen_git.bb                    |   7 +-
>  22 files changed, 127 insertions(+), 798 deletions(-)
>  delete mode 100644 recipes-extended/xen/files/0001-p2m-Always-check-to-s=
ee-if-removing-a-p2m-entry-actu.patch
>  delete mode 100644 recipes-extended/xen/files/0002-p2m-Check-return-valu=
e-of-p2m_set_entry-when-decreas.patch
>  delete mode 100644 recipes-extended/xen/files/mini-os_udivmoddi4-gcc7.pa=
tch
>  create mode 100644 recipes-extended/xen/files/tools-xentop-vwprintw.patc=
h
>  create mode 100644 recipes-extended/xen/files/vtpm_TPM_ChangeAuthAsymFin=
ish.patch
>  delete mode 100644 recipes-extended/xen/files/xsa246-4.9.patch
>  delete mode 100644 recipes-extended/xen/files/xsa248.patch
>  delete mode 100644 recipes-extended/xen/files/xsa249.patch
>  delete mode 100644 recipes-extended/xen/files/xsa250.patch
>  delete mode 100644 recipes-extended/xen/files/xsa251.patch
>  delete mode 100644 recipes-extended/xen/files/xsa253.patch
>  create mode 100644 recipes-extended/xen/mini-os_4.11.0.bb
>  delete mode 100644 recipes-extended/xen/mini-os_4.9.0.bb
>  create mode 100644 recipes-extended/xen/xen-vtpm_4.11.0.bb
>  delete mode 100644 recipes-extended/xen/xen-vtpm_4.9.0.bb
>  delete mode 100644 recipes-extended/xen/xen_4.10.0.bb
>  create mode 100644 recipes-extended/xen/xen_4.11.0.bb
>  delete mode 100644 recipes-extended/xen/xen_4.9.1.bb
>
> --
> 2.7.4
>
>
>
> ------------------------------
>
> Message: 2
> Date: Tue, 31 Jul 2018 12:35:43 -0700
> From: christopher.w.clark@gmail.com
> To: meta-virtualization@yoctoproject.org
> Cc: cardoe@gentoo.org
> Subject: [meta-virtualization] [PATCH v2 2/9] xen: add recipe for
>         4.11.0
> Message-ID:
>         <1533065750-25786-3-git-send-email-christopher.w.clark@gmail.com>
>
> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> ---
>  recipes-extended/xen/xen_4.11.0.bb | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 recipes-extended/xen/xen_4.11.0.bb
>
> diff --git a/recipes-extended/xen/xen_4.11.0.bb b/recipes-extended/xen/xe=
n_4.11.0.bb
> new file mode 100644
> index 0000000..7884194
> --- /dev/null
> +++ b/recipes-extended/xen/xen_4.11.0.bb
> @@ -0,0 +1,12 @@
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
> +require xen.inc
> +
> +SRC_URI =3D " \
> +    https://downloads.xenproject.org/release/xen/${PV}/xen-${PV}.tar.gz =
\
> +    file://tools-xentop-vwprintw.patch \
> +    "
> +
> +SRC_URI[md5sum] =3D "cbec0600284921744bc14119f4ed3fff"
> +SRC_URI[sha256sum] =3D "826e3a9f6d0eac94a825d272cc2c1294e22640ae75af906e=
b13920f9ad667643"
> +
> +S =3D "${WORKDIR}/xen-${PV}"
> --
> 2.7.4
>
>
>
> ------------------------------
>
> Message: 3
> Date: Tue, 31 Jul 2018 12:35:42 -0700
> From: christopher.w.clark@gmail.com
> To: meta-virtualization@yoctoproject.org
> Cc: cardoe@gentoo.org
> Subject: [meta-virtualization] [PATCH v2 1/9] xen: upgrade to 4.10.1,
>         and apply patches for gcc 8.1 compatibility
> Message-ID:
>         <1533065750-25786-2-git-send-email-christopher.w.clark@gmail.com>
> Content-Type: text/plain; charset=3DUTF-8
>
> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> Adds packaging for new binary: xen-shim.
>
> Builds the hypervisor before building the tools to workaround an upstream
> parallel build bug that causes the shim to be rebuilt during install.
>
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> ---
>  .../shim-don-t-let-build-modify-shim.config.patch  | 47 ++++++++++++++
>  ...ls-gdbsx-fix-Wstringop-truncation-warning.patch | 41 ++++++++++++
>  ...tools-kdd-mute-spurious-gcc-warning-part1.patch | 47 ++++++++++++++
>  ...tools-kdd-mute-spurious-gcc-warning-part2.patch | 52 +++++++++++++++
>  .../xen/files/tools-libxc-fix-strncpy-size.patch   | 44 +++++++++++++
>  ...ols-misc-fix-hypothetical-buffer-overflow.patch | 46 ++++++++++++++
>  .../tools-xenpmd-fix-possible-0-truncation.patch   | 74 ++++++++++++++++=
++++++
>  .../xen/files/tools-xentop-vwprintw.patch          | 25 ++++++++
>  recipes-extended/xen/files/xsa253.patch            | 26 --------
>  recipes-extended/xen/xen.inc                       | 14 ++++
>  recipes-extended/xen/xen_4.10.0.bb                 | 12 ----
>  recipes-extended/xen/xen_4.10.1.bb                 | 19 ++++++
>  12 files changed, 409 insertions(+), 38 deletions(-)
>  create mode 100644 recipes-extended/xen/files/shim-don-t-let-build-modif=
y-shim.config.patch
>  create mode 100644 recipes-extended/xen/files/tools-gdbsx-fix-Wstringop-=
truncation-warning.patch
>  create mode 100644 recipes-extended/xen/files/tools-kdd-mute-spurious-gc=
c-warning-part1.patch
>  create mode 100644 recipes-extended/xen/files/tools-kdd-mute-spurious-gc=
c-warning-part2.patch
>  create mode 100644 recipes-extended/xen/files/tools-libxc-fix-strncpy-si=
ze.patch
>  create mode 100644 recipes-extended/xen/files/tools-misc-fix-hypothetica=
l-buffer-overflow.patch
>  create mode 100644 recipes-extended/xen/files/tools-xenpmd-fix-possible-=
0-truncation.patch
>  create mode 100644 recipes-extended/xen/files/tools-xentop-vwprintw.patc=
h
>  delete mode 100644 recipes-extended/xen/files/xsa253.patch
>  delete mode 100644 recipes-extended/xen/xen_4.10.0.bb
>  create mode 100644 recipes-extended/xen/xen_4.10.1.bb
>
> diff --git a/recipes-extended/xen/files/shim-don-t-let-build-modify-shim.=
config.patch b/recipes-extended/xen/files/shim-don-t-let-build-modify-shim.=
config.patch
> new file mode 100644
> index 0000000..7403528
> --- /dev/null
> +++ b/recipes-extended/xen/files/shim-don-t-let-build-modify-shim.config.=
patch
> @@ -0,0 +1,47 @@
> +From 8717e7417cebeae162fd61ea4cbdcdd422748f08 Mon Sep 17 00:00:00 2001
> +From: Juergen Gross <jgross@suse.com>
> +Date: Fri, 20 Apr 2018 17:47:55 +0200
> +Subject: [PATCH] shim: don't let build modify shim.config
> +
> +Currently building the shim will modify shim.config in case some config
> +option was added or modified in the hypervisor.
> +
> +Avoid that by copying shim.config to an intermediate file instead.
> +
> +Signed-off-by: Juergen Gross <jgross@suse.com>
> +Reviewed-by: Jan Beulich <jbeulich@suse.com>
> +Acked-by: Wei Liu <wei.liu2@citrix.com>
> +---
> + tools/firmware/xen-dir/Makefile | 16 ++++++----------
> + 1 file changed, 6 insertions(+), 10 deletions(-)
> +
> +diff --git a/tools/firmware/xen-dir/Makefile b/tools/firmware/xen-dir/Ma=
kefile
> +index a7e69ae..84648c3 100644
> +--- a/tools/firmware/xen-dir/Makefile
> ++++ b/tools/firmware/xen-dir/Makefile
> +@@ -41,16 +41,12 @@ linkfarm.stamp: $(DEP_DIRS) $(DEP_FILES) FORCE
> + $(D): linkfarm.stamp
> +       $(MAKE) -C $(D)/xen distclean
> +
> +-.PHONY: shim-%config
> +-shim-%config: $(D) FORCE
> +-      $(MAKE) -C $(D)/xen $*config \
> +-              XEN_CONFIG_EXPERT=3Dy \
> +-              KCONFIG_CONFIG=3D$(CURDIR)/shim.config
> +-
> +-xen-shim: $(D) shim-olddefconfig
> +-      $(MAKE) -C $(D)/xen build \
> +-              XEN_CONFIG_EXPERT=3Dy \
> +-              KCONFIG_CONFIG=3D$(CURDIR)/shim.config
> ++$(D)/xen/.config: shim.config $(D)
> ++      cp $< $@
> ++      $(MAKE) -C $(@D) olddefconfig XEN_CONFIG_EXPERT=3Dy
> ++
> ++xen-shim: $(D)/xen/.config
> ++      $(MAKE) -C $(<D) build XEN_CONFIG_EXPERT=3Dy
> +       ln -sf $(D)/xen/xen $@
> +       ln -sf $(D)/xen/xen-syms $@-syms
> +
> +--
> +2.7.4
> +
> diff --git a/recipes-extended/xen/files/tools-gdbsx-fix-Wstringop-truncat=
ion-warning.patch b/recipes-extended/xen/files/tools-gdbsx-fix-Wstringop-tr=
uncation-warning.patch
> new file mode 100644
> index 0000000..2896d9f
> --- /dev/null
> +++ b/recipes-extended/xen/files/tools-gdbsx-fix-Wstringop-truncation-war=
ning.patch
> @@ -0,0 +1,41 @@
> +From 7f601f7c341c80d554615556d60e3b8ed1e5ad4f Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Marek=3D20Marczykowski-G=3DC3=3DB3recki?=3D
> + <marmarek@invisiblethingslab.com>
> +Date: Thu, 5 Apr 2018 03:50:54 +0200
> +Subject: [PATCH] tools/gdbsx: fix -Wstringop-truncation warning
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +gcc-8 complains:
> +
> +    gx_main.c: In function 'prepare_stop_reply':
> +    gx_main.c:385:9: error: 'strncpy' output truncated before terminatin=
g nul copying 6 bytes from a string of the same length [-Werror=3Dstringop-=
truncation]
> +             strncpy(buf, "watch:", 6);
> +             ^~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Since terminating '\0' isn't needed here at all, switch to memcpy.
> +
> +Signed-off-by: Marek Marczykowski-G?recki <marmarek@invisiblethingslab.c=
om>
> +Acked-by: Wei Liu <wei.liu2@citrix.com>
> +Release-Acked-by: Juergen Gross <jgross@suse.com>
> +---
> + tools/debugger/gdbsx/gx/gx_main.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tools/debugger/gdbsx/gx/gx_main.c b/tools/debugger/gdbsx/gx=
/gx_main.c
> +index a908c45..6dfa501 100644
> +--- a/tools/debugger/gdbsx/gx/gx_main.c
> ++++ b/tools/debugger/gdbsx/gx/gx_main.c
> +@@ -382,7 +382,7 @@ prepare_stop_reply(enum target_signal sig, char *buf=
, vcpuid_t vcpu)
> +
> +     /* TBD: check if we stopped because of watchpoint */
> +     if (watchpoint_stop()) {
> +-        strncpy(buf, "watch:", 6);
> ++        memcpy(buf, "watch:", 6);
> +         buf +=3D 6;
> +         /* TBD: **/
> +     }
> +--
> +2.7.4
> +
> diff --git a/recipes-extended/xen/files/tools-kdd-mute-spurious-gcc-warni=
ng-part1.patch b/recipes-extended/xen/files/tools-kdd-mute-spurious-gcc-war=
ning-part1.patch
> new file mode 100644
> index 0000000..f94d22c
> --- /dev/null
> +++ b/recipes-extended/xen/files/tools-kdd-mute-spurious-gcc-warning-part=
1.patch
> @@ -0,0 +1,47 @@
> +From 437e00fea04becc91c1b6bc1c0baa636b067a5cc Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Marek=3D20Marczykowski-G=3DC3=3DB3recki?=3D
> + <marmarek@invisiblethingslab.com>
> +Date: Thu, 5 Apr 2018 03:50:55 +0200
> +Subject: [PATCH] tools/kdd: mute spurious gcc warning
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +gcc-8 complains:
> +
> +    kdd.c:698:13: error: 'memcpy' offset [-204, -717] is out of the boun=
ds [0, 216] of object 'ctrl' with type 'kdd_ctrl' {aka 'union <anonymous>'}=
 [-Werror=3Darray-bounds]
> +                 memcpy(buf, ((uint8_t *)&ctrl.c32) + offset, len);
> +                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +    kdd.c: In function 'kdd_select_callback':
> +    kdd.c:642:14: note: 'ctrl' declared here
> +         kdd_ctrl ctrl;
> +                  ^~~~
> +
> +But this is impossible - 'offset' is unsigned and correctly validated
> +few lines before.
> +
> +Signed-off-by: Marek Marczykowski-G?recki <marmarek@invisiblethingslab.c=
om>
> +Acked-by: Wei Liu <wei.liu2@citrix.com>
> +Release-Acked-by: Juergen Gross <jgross@suse.com>
> +---
> + tools/debugger/kdd/kdd.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/tools/debugger/kdd/kdd.c b/tools/debugger/kdd/kdd.c
> +index 1bd5dd5..61d769e 100644
> +--- a/tools/debugger/kdd/kdd.c
> ++++ b/tools/debugger/kdd/kdd.c
> +@@ -695,7 +695,10 @@ static void kdd_handle_read_ctrl(kdd_state *s)
> +             KDD_LOG(s, "Request outside of known control space\n");
> +             len =3D 0;
> +         } else {
> ++#pragma GCC diagnostic push
> ++#pragma GCC diagnostic ignored "-Warray-bounds"
> +             memcpy(buf, ((uint8_t *)&ctrl.c32) + offset, len);
> ++#pragma GCC diagnostic pop
> +         }
> +     }
> +
> +--
> +2.7.4
> +
> diff --git a/recipes-extended/xen/files/tools-kdd-mute-spurious-gcc-warni=
ng-part2.patch b/recipes-extended/xen/files/tools-kdd-mute-spurious-gcc-war=
ning-part2.patch
> new file mode 100644
> index 0000000..afd1423
> --- /dev/null
> +++ b/recipes-extended/xen/files/tools-kdd-mute-spurious-gcc-warning-part=
2.patch
> @@ -0,0 +1,52 @@
> +From 2de2b10b2252761baa5dd0077df384dbfcca8212 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Marek=3D20Marczykowski-G=3DC3=3DB3recki?=3D
> + <marmarek@invisiblethingslab.com>
> +Date: Tue, 22 May 2018 21:47:45 +0200
> +Subject: [PATCH] tools/kdd: alternative way of muting spurious gcc warni=
ng
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Older gcc does not support #pragma GCC diagnostics, so use alternative
> +approach - change variable type to uint32_t (this code handle 32-bit
> +requests only anyway), which apparently also avoid gcc complaining about
> +this (otherwise correct) code.
> +
> +Fixes 437e00fea04becc91c1b6bc1c0baa636b067a5cc "tools/kdd: mute spurious
> +gcc warning"
> +
> +Signed-off-by: Marek Marczykowski-G?recki <marmarek@invisiblethingslab.c=
om>
> +Acked-by: Wei Liu <wei.liu2@citrix.com>
> +Release-acked-by: Juergen Gross <jgross@suse.com>
> +Acked-by: Tim Deegan <tim@xen.org>
> +---
> + tools/debugger/kdd/kdd.c | 5 +----
> + 1 file changed, 1 insertion(+), 4 deletions(-)
> +
> +diff --git a/tools/debugger/kdd/kdd.c b/tools/debugger/kdd/kdd.c
> +index 61d769e..5a019a0 100644
> +--- a/tools/debugger/kdd/kdd.c
> ++++ b/tools/debugger/kdd/kdd.c
> +@@ -687,7 +687,7 @@ static void kdd_handle_read_ctrl(kdd_state *s)
> +         }
> +     } else {
> +         /* 32-bit control-register space starts at 0x[2]cc, for 84 byte=
s */
> +-        uint64_t offset =3D addr;
> ++        uint32_t offset =3D addr;
> +         if (offset > 0x200)
> +             offset -=3D 0x200;
> +         offset -=3D 0xcc;
> +@@ -695,10 +695,7 @@ static void kdd_handle_read_ctrl(kdd_state *s)
> +             KDD_LOG(s, "Request outside of known control space\n");
> +             len =3D 0;
> +         } else {
> +-#pragma GCC diagnostic push
> +-#pragma GCC diagnostic ignored "-Warray-bounds"
> +             memcpy(buf, ((uint8_t *)&ctrl.c32) + offset, len);
> +-#pragma GCC diagnostic pop
> +         }
> +     }
> +
> +--
> +2.7.4
> +
> diff --git a/recipes-extended/xen/files/tools-libxc-fix-strncpy-size.patc=
h b/recipes-extended/xen/files/tools-libxc-fix-strncpy-size.patch
> new file mode 100644
> index 0000000..2d606cd
> --- /dev/null
> +++ b/recipes-extended/xen/files/tools-libxc-fix-strncpy-size.patch
> @@ -0,0 +1,44 @@
> +From fa7789ef18bd2e716997937af71b2e4b5b00a159 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Marek=3D20Marczykowski-G=3DC3=3DB3recki?=3D
> + <marmarek@invisiblethingslab.com>
> +Date: Thu, 5 Apr 2018 03:50:49 +0200
> +Subject: [PATCH] tools/libxc: fix strncpy size
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +gcc-8 warns about possible truncation of trailing '\0'.
> +Final character is overridden by '\0' anyway, so don't bother to copy
> +it.
> +
> +This fixes compile failure:
> +
> +    xc_pm.c: In function 'xc_set_cpufreq_gov':
> +    xc_pm.c:308:5: error: 'strncpy' specified bound 16 equals destinatio=
n size [-Werror=3Dstringop-truncation]
> +         strncpy(scaling_governor, govname, CPUFREQ_NAME_LEN);
> +         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +    cc1: all warnings being treated as errors
> +
> +Signed-off-by: Marek Marczykowski-G?recki <marmarek@invisiblethingslab.c=
om>
> +Acked-by: Wei Liu <wei.liu2@citrix.com>
> +Release-Acked-by: Juergen Gross <jgross@suse.com>
> +---
> + tools/libxc/xc_pm.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tools/libxc/xc_pm.c b/tools/libxc/xc_pm.c
> +index 67e2418..6f8d548 100644
> +--- a/tools/libxc/xc_pm.c
> ++++ b/tools/libxc/xc_pm.c
> +@@ -305,7 +305,7 @@ int xc_set_cpufreq_gov(xc_interface *xch, int cpuid,=
 char *govname)
> +     sysctl.cmd =3D XEN_SYSCTL_pm_op;
> +     sysctl.u.pm_op.cmd =3D SET_CPUFREQ_GOV;
> +     sysctl.u.pm_op.cpuid =3D cpuid;
> +-    strncpy(scaling_governor, govname, CPUFREQ_NAME_LEN);
> ++    strncpy(scaling_governor, govname, CPUFREQ_NAME_LEN - 1);
> +     scaling_governor[CPUFREQ_NAME_LEN - 1] =3D '\0';
> +
> +     return xc_sysctl(xch, &sysctl);
> +--
> +2.7.4
> +
> diff --git a/recipes-extended/xen/files/tools-misc-fix-hypothetical-buffe=
r-overflow.patch b/recipes-extended/xen/files/tools-misc-fix-hypothetical-b=
uffer-overflow.patch
> new file mode 100644
> index 0000000..a499861
> --- /dev/null
> +++ b/recipes-extended/xen/files/tools-misc-fix-hypothetical-buffer-overf=
low.patch
> @@ -0,0 +1,46 @@
> +From 27751d89248c8c5eef6d8b56eb8f7d2084145080 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Marek=3D20Marczykowski-G=3DC3=3DB3recki?=3D
> + <marmarek@invisiblethingslab.com>
> +Date: Thu, 5 Apr 2018 03:50:50 +0200
> +Subject: [PATCH] tools/misc: fix hypothetical buffer overflow in xen-low=
memd
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +gcc-8 complains:
> +
> +    xen-lowmemd.c: In function 'handle_low_mem':
> +    xen-lowmemd.c:80:55: error: '%s' directive output may be truncated w=
riting up to 511 bytes into a region of size 489 [-Werror=3Dformat-truncati=
on=3D]
> +             snprintf(error, BUFSZ,"Failed to write target %s to xenstor=
e", data);
> +                                                           ^~           =
    ~~~~
> +    xen-lowmemd.c:80:9: note: 'snprintf' output between 36 and 547 bytes=
 into a destination of size 512
> +             snprintf(error, BUFSZ,"Failed to write target %s to xenstor=
e", data);
> +             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
> +
> +In practice it wouldn't happen, because 'data' contains string
> +representation of 64-bit unsigned number (20 characters at most).
> +But place a limit to mute gcc warning.
> +
> +Signed-off-by: Marek Marczykowski-G?recki <marmarek@invisiblethingslab.c=
om>
> +Acked-by: Wei Liu <wei.liu2@citrix.com>
> +Release-Acked-by: Juergen Gross <jgross@suse.com>
> +---
> + tools/misc/xen-lowmemd.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tools/misc/xen-lowmemd.c b/tools/misc/xen-lowmemd.c
> +index 865a54c..79ad34c 100644
> +--- a/tools/misc/xen-lowmemd.c
> ++++ b/tools/misc/xen-lowmemd.c
> +@@ -77,7 +77,7 @@ void handle_low_mem(void)
> +     if (!xs_write(xs_handle, XBT_NULL,
> +             "/local/domain/0/memory/target", data, strlen(data)))
> +     {
> +-        snprintf(error, BUFSZ,"Failed to write target %s to xenstore", =
data);
> ++        snprintf(error, BUFSZ,"Failed to write target %.24s to xenstore=
", data);
> +         perror(error);
> +     }
> + }
> +--
> +2.7.4
> +
> diff --git a/recipes-extended/xen/files/tools-xenpmd-fix-possible-0-trunc=
ation.patch b/recipes-extended/xen/files/tools-xenpmd-fix-possible-0-trunca=
tion.patch
> new file mode 100644
> index 0000000..86a8e35
> --- /dev/null
> +++ b/recipes-extended/xen/files/tools-xenpmd-fix-possible-0-truncation.p=
atch
> @@ -0,0 +1,74 @@
> +From 938c8f53b1f80175c6f7a1399efdb984abb0cb8b Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Marek=3D20Marczykowski-G=3DC3=3DB3recki?=3D
> + <marmarek@invisiblethingslab.com>
> +Date: Thu, 5 Apr 2018 03:50:53 +0200
> +Subject: [PATCH] tools/xenpmd: fix possible '\0' truncation
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +gcc-8 complains:
> +    xenpmd.c:207:9: error: 'strncpy' specified bound 32 equals destinati=
on size [-Werror=3Dstringop-truncation]
> +             strncpy(info->oem_info, attrib_value, 32);
> +             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +    xenpmd.c:201:9: error: 'strncpy' specified bound 32 equals destinati=
on size [-Werror=3Dstringop-truncation]
> +             strncpy(info->battery_type, attrib_value, 32);
> +             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +    xenpmd.c:195:9: error: 'strncpy' specified bound 32 equals destinati=
on size [-Werror=3Dstringop-truncation]
> +             strncpy(info->serial_number, attrib_value, 32);
> +             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +    xenpmd.c:189:9: error: 'strncpy' specified bound 32 equals destinati=
on size [-Werror=3Dstringop-truncation]
> +             strncpy(info->model_number, attrib_value, 32);
> +             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Copy 31 chars, then make sure terminating '\0' is present. Those fields
> +are passed to strlen and as '%s' for snprintf later.
> +
> +Signed-off-by: Marek Marczykowski-G?recki <marmarek@invisiblethingslab.c=
om>
> +Acked-by: Wei Liu <wei.liu2@citrix.com>
> +Release-Acked-by: Juergen Gross <jgross@suse.com>
> +---
> + tools/xenpmd/xenpmd.c | 12 ++++++++----
> + 1 file changed, 8 insertions(+), 4 deletions(-)
> +
> +diff --git a/tools/xenpmd/xenpmd.c b/tools/xenpmd/xenpmd.c
> +index 689c8fd..56412a9 100644
> +--- a/tools/xenpmd/xenpmd.c
> ++++ b/tools/xenpmd/xenpmd.c
> +@@ -186,25 +186,29 @@ void set_attribute_battery_info(char *attrib_name,
> +
> +     if ( strstr(attrib_name, "model number") )
> +     {
> +-        strncpy(info->model_number, attrib_value, 32);
> ++        strncpy(info->model_number, attrib_value, 31);
> ++        info->model_number[31] =3D '\0';
> +         return;
> +     }
> +
> +     if ( strstr(attrib_name, "serial number") )
> +     {
> +-        strncpy(info->serial_number, attrib_value, 32);
> ++        strncpy(info->serial_number, attrib_value, 31);
> ++        info->serial_number[31] =3D '\0';
> +         return;
> +     }
> +
> +     if ( strstr(attrib_name, "battery type") )
> +     {
> +-        strncpy(info->battery_type, attrib_value, 32);
> ++        strncpy(info->battery_type, attrib_value, 31);
> ++        info->battery_type[31] =3D '\0';
> +         return;
> +     }
> +
> +     if ( strstr(attrib_name, "OEM info") )
> +     {
> +-        strncpy(info->oem_info, attrib_value, 32);
> ++        strncpy(info->oem_info, attrib_value, 31);
> ++        info->oem_info[31] =3D '\0';
> +         return;
> +     }
> +
> +--
> +2.7.4
> +
> diff --git a/recipes-extended/xen/files/tools-xentop-vwprintw.patch b/rec=
ipes-extended/xen/files/tools-xentop-vwprintw.patch
> new file mode 100644
> index 0000000..5d5d011
> --- /dev/null
> +++ b/recipes-extended/xen/files/tools-xentop-vwprintw.patch
> @@ -0,0 +1,25 @@
> +tools/xentop : fix vwprintw -Werror=3Ddeprecated-declarations warning
> +
> +gcc-8.1 complains:
> +
> +| xentop.c: In function 'print':
> +| xentop.c:304:4: error: 'vwprintw' is deprecated [-Werror=3Ddeprecated-=
declarations]
> +|     vwprintw(stdscr, (curses_str_t)fmt, args);
> +|     ^~~~~~~~
> +
> +vw_printw is the non-deprecated alternative.
> +
> +Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> +diff --git a/tools/xenstat/xentop/xentop.c b/tools/xenstat/xentop/xentop=
.c
> +index 2fd2b67..c465810 100644
> +--- a/tools/xenstat/xentop/xentop.c
> ++++ b/tools/xenstat/xentop/xentop.c
> +@@ -301,7 +301,7 @@ static void print(const char *fmt, ...)
> +       if (!batch) {
> +               if((current_row() < lines()-1)) {
> +                       va_start(args, fmt);
> +-                      vwprintw(stdscr, (curses_str_t)fmt, args);
> ++                      vw_printw(stdscr, (curses_str_t)fmt, args);
> +                       va_end(args);
> +               }
> +       } else {
> diff --git a/recipes-extended/xen/files/xsa253.patch b/recipes-extended/x=
en/files/xsa253.patch
> deleted file mode 100644
> index 19e4269..0000000
> --- a/recipes-extended/xen/files/xsa253.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From: Andrew Cooper <andrew.cooper3@citrix.com>
> -Subject: x86/msr: Free msr_vcpu_policy during vcpu destruction
> -
> -c/s 4187f79dc7 "x86/msr: introduce struct msr_vcpu_policy" introduced a
> -per-vcpu memory allocation, but failed to free it in the clean vcpu
> -destruction case.
> -
> -This is XSA-253
> -
> -Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> -Reviewed-by: Jan Beulich <jbeulich@suse.com>
> -
> -diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> -index b17468c..0ae715d 100644
> ---- a/xen/arch/x86/domain.c
> -+++ b/xen/arch/x86/domain.c
> -@@ -382,6 +382,9 @@ void vcpu_destroy(struct vcpu *v)
> -
> -     vcpu_destroy_fpu(v);
> -
> -+    xfree(v->arch.msr);
> -+    v->arch.msr =3D NULL;
> -+
> -     if ( !is_idle_domain(v->domain) )
> -         vpmu_destroy(v);
> -
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index cadbd78..42c93b4 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -91,6 +91,7 @@ RRECOMMENDS_${PN}-base =3D " \
>      ${PN}-libvhd \
>      ${PN}-flask \
>      ${PN}-hvmloader \
> +    ${PN}-shim \
>      ${PN}-xenpaging \
>      "
>
> @@ -213,6 +214,7 @@ PACKAGES =3D "\
>      ${PN}-scripts-block \
>      ${PN}-scripts-common \
>      ${PN}-scripts-network \
> +    ${PN}-shim \
>      ${PN}-staticdev \
>      ${PN}-volatiles \
>      ${PN}-xcutils \
> @@ -638,6 +640,11 @@ FILES_${PN}-scripts-common =3D " \
>      ${sysconfdir}/xen/scripts/xen-script-common.sh \
>      "
>
> +INSANE_SKIP_${PN}-shim =3D "arch"
> +FILES_${PN}-shim =3D " \
> +    ${libdir}/xen/boot/xen-shim \
> +    "
> +
>  FILES_${PN}-volatiles =3D "\
>      ${sysconfdir}/default/volatiles/99_xen \
>      ${sysconfdir}/tmpfiles.d/xen.conf \
> @@ -930,10 +937,17 @@ do_compile() {
>      # workaround for build bug when CFLAGS is exported
>      # https://www.mail-archive.com/xen-devel@lists.xen.org/msg67822.html
>      unset CFLAGS
> +
> +    # Workaround for parallel build bug: build xen first.
> +    # https://lists.xenproject.org/archives/html/xen-devel/2018-07/msg02=
551.html
> +    oe_runmake xen
>      oe_runmake
>  }
>
>  do_install() {
> +    # CFLAGS is used to set PY_CFLAGS which affects the pygrub install
> +    # so also need to unset CFLAGS here:
> +    unset CFLAGS
>      oe_runmake DESTDIR=3D"${D}" install
>
>      # remove installed volatiles
> diff --git a/recipes-extended/xen/xen_4.10.0.bb b/recipes-extended/xen/xe=
n_4.10.0.bb
> deleted file mode 100644
> index d314b9b..0000000
> --- a/recipes-extended/xen/xen_4.10.0.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
> -require xen.inc
> -
> -SRC_URI =3D " \
> -    https://downloads.xenproject.org/release/xen/${PV}/xen-${PV}.tar.gz =
\
> -    file://xsa253.patch \
> -    "
> -
> -SRC_URI[md5sum] =3D "ab9d320d02cb40f6b40506aed1a38d58"
> -SRC_URI[sha256sum] =3D "0262a7023f8b12bcacfb0b25e69b2a63291f944f7683d54d=
8f33d4b2ca556844"
> -
> -S =3D "${WORKDIR}/xen-${PV}"
> diff --git a/recipes-extended/xen/xen_4.10.1.bb b/recipes-extended/xen/xe=
n_4.10.1.bb
> new file mode 100644
> index 0000000..01c0788
> --- /dev/null
> +++ b/recipes-extended/xen/xen_4.10.1.bb
> @@ -0,0 +1,19 @@
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
> +require xen.inc
> +
> +SRC_URI =3D " \
> +    https://downloads.xenproject.org/release/xen/${PV}/xen-${PV}.tar.gz =
\
> +    file://tools-libxc-fix-strncpy-size.patch \
> +    file://tools-misc-fix-hypothetical-buffer-overflow.patch \
> +    file://tools-xentop-vwprintw.patch \
> +    file://tools-xenpmd-fix-possible-0-truncation.patch \
> +    file://tools-gdbsx-fix-Wstringop-truncation-warning.patch \
> +    file://tools-kdd-mute-spurious-gcc-warning-part1.patch \
> +    file://tools-kdd-mute-spurious-gcc-warning-part2.patch \
> +    file://shim-don-t-let-build-modify-shim.config.patch \
> +    "
> +
> +SRC_URI[md5sum] =3D "d1b1d14ce76622062c9977d9c8ba772e"
> +SRC_URI[sha256sum] =3D "570d654f357d4085accdf752989c1cbc33e2075feac8fcc5=
05d68bdb81b1a0cf"
> +
> +S =3D "${WORKDIR}/xen-${PV}"
> --
> 2.7.4
>
>
>
> ------------------------------
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
> End of meta-virtualization Digest, Vol 68, Issue 23
> ***************************************************

Reviewed-By: Kurt Bodiker <kurt.bodiker@braintrust-us.com>

--=20

*This email and all attachments are considered confidential and the=20
proprietary information of BrainTrust Holdings.=C2=A0 Unauthorized disclosu=
re is=20
prohibited.=C2=A0 *

