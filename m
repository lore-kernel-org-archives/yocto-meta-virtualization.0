Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 196F3E00AB0; Tue, 15 Jan 2019 06:01:04 -0800 (PST)
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
	*      [209.85.208.194 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2041E009AA
	for <meta-virtualization@yoctoproject.org>;
	Tue, 15 Jan 2019 06:00:59 -0800 (PST)
Received: by mail-lj1-f194.google.com with SMTP id c19-v6so2408424lja.5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 15 Jan 2019 06:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6KDZDlcVDwaXSCVDFaY+sSQIbG8vvEGOBMZQQ4StsLU=;
	b=QHwJloIQMwFjkwdjARkjbzHVRNGEqp7YnsrgTUbcNsxNZmpHAOiakotVAD1oZG49n8
	Pspd+Hrx6Z4HZOTsy4UqhIVcIdiW7Jg8C1n5ZqjI/axWxizmDyWAtLkLSUl+NIBfkP9j
	zqqCkTE4dNeYoxtKcfDovY4k6mPUPxMEKbG0o4wCfrE1x0BY8viujfN/LhLxk++3E2jP
	tfcrx9nW1axLEkB4gx4hkBg2seOIqfncvdNCCphVJAPtg7uA3y6mG2J64y59t8ea407c
	l+Ve7wIOiFc3sYE5esfiNfbvVbNDphQm/YUtofGpeVWnNNkKBruOysujvkpAuwBGrD7p
	MdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6KDZDlcVDwaXSCVDFaY+sSQIbG8vvEGOBMZQQ4StsLU=;
	b=K9iT7l2/7yfacOUKcZl5fgYqPyAGNXoMj1XETYd6UZwItR3PGp181KivPSPwdUkjDK
	BxvekMmGau/fwXRk+28uRIy1PiIMSDVTfM4VQCmvCSBibhaPnECYs8VFrgbhBMqOoCB8
	95u5dWEOpmvw6mGYoMeEbshkgP8rZDwPESLMoQZND+uSBJKn4TFpBumiWr3B71YvIdFj
	r7aoK0sdsPkVfkG4G/gG07nvhIEnls48+Hp/ULBkdX3qr9H1s2cXObwdEwg4gS6ofEqr
	B7vodGthGA+C442RKmEubqVu6dpMDOMgtjSXiGfC/fdrzm0ONznLEITSDXoIfbvFnWPH
	Nd2g==
X-Gm-Message-State: AJcUukcMss7TCsdAvCraY5rXLJz4UYlfbXA2nfhyH3lJ/tESOSFpeMBF
	1FaP5VpGZKRjnuHJV39Drdn6Af0YOd4TKJcqK4I=
X-Google-Smtp-Source: ALg8bN4C1G5kHk0NoUhnNnL4jLM0PhCPv2ok9puEX3Q6Ugs+gGSBwD+1qA08adtvr4Z8+1tgBPPwcRo5aonljR9X1x8=
X-Received: by 2002:a2e:9059:: with SMTP id
	n25-v6mr2948789ljg.155.1547560858220; 
	Tue, 15 Jan 2019 06:00:58 -0800 (PST)
MIME-Version: 1.0
References: <efdca034-0566-bf7d-47e4-6bbbf0595d45@axis.com>
In-Reply-To: <efdca034-0566-bf7d-47e4-6bbbf0595d45@axis.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 15 Jan 2019 09:00:46 -0500
Message-ID: <CADkTA4MecgeSmbnV-xEGdScXnyee-A81Rn3X7v=k3BmZi-+8bg@mail.gmail.com>
To: Joakim Roubert <joakim.roubert@axis.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] go: Update recipes to conform with OE styleguide
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
X-List-Received-Date: Tue, 15 Jan 2019 14:01:04 -0000
Content-Type: text/plain; charset="UTF-8"

These cleanups cause discontinuities in the git history, so I'm going
to leave them as-is, until we are actually updating/upgrading the
recipes and can do the cleanups then. The plan is to drop some of
these go recipes, since they are better as SRCREV specified parts of
other recipes, versus dependencies like this.

Unless something is actually breaking with the formatting as it
currently is, and in that case, I will update the problematic recipes.

Bruce


On Fri, Jan 11, 2019 at 5:40 AM Joakim Roubert <joakim.roubert@axis.com> wrote:
>
> Updates based on https://www.openembedded.org/wiki/Styleguide and using
> contrib/oe-stylize.py.
>
> Change-Id: I636eaecdecb56ad27f79d25b0976939da4f92b84
> ---
>  recipes-devtools/go/compose-file_git.bb    | 36
> +++++++++++++----------------
>  recipes-devtools/go/go-capability_git.bb   | 20 ++++++++--------
>  recipes-devtools/go/go-cli_git.bb          | 20 ++++++++--------
>  recipes-devtools/go/go-connections_git.bb  | 33 ++++++++++++--------------
>  recipes-devtools/go/go-context_git.bb      | 18 +++++++--------
>  recipes-devtools/go/go-dbus_git.bb         | 20 ++++++++--------
>  recipes-devtools/go/go-distribution_git.bb | 33 ++++++++++++--------------
>  recipes-devtools/go/go-fsnotify_git.bb     | 20 ++++++++--------
>  recipes-devtools/go/go-libtrust_git.bb     | 20 ++++++++--------
>  recipes-devtools/go/go-logrus_git.bb       | 20 ++++++++--------
>  recipes-devtools/go/go-mux_git.bb          | 18 +++++++--------
>  recipes-devtools/go/go-patricia_git.bb     | 20 ++++++++--------
>  recipes-devtools/go/go-pty_git.bb          | 18 +++++++--------
>  recipes-devtools/go/go-systemd_git.bb      | 22 ++++++++----------
>  recipes-devtools/go/grpc-go_git.bb         | 37
> ++++++++++++++----------------
>  recipes-devtools/go/notary_git.bb          | 33 ++++++++++++--------------
>  16 files changed, 175 insertions(+), 213 deletions(-)
>
> diff --git a/recipes-devtools/go/compose-file_git.bb
> b/recipes-devtools/go/compose-file_git.bb
> index bcf8c3d..f129f5d 100644
> --- a/recipes-devtools/go/compose-file_git.bb
> +++ b/recipes-devtools/go/compose-file_git.bb
> @@ -3,39 +3,35 @@ HOMEPAGE = "https://github.com/aanand/compose-file"
>  SECTION = "devel/go"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM =
> "file://src/${PKG_NAME}/LICENSE;md5=9cd86830b557232ce55e2a6b47387471"
> -
> -SRCNAME = "compose-file"
> -
> -PKG_NAME = "github.com/aanand/${SRCNAME}"
> -SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME}"
> -
>  SRCREV = "a3e58764f50597b6217fec07e9bff7225c4a1719"
>  PV = "3.0+git${SRCPV}"
>
> +SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME}"
> +
> +SRCNAME = "compose-file"
>  S = "${WORKDIR}/git"
> +SYSROOT_PREPROCESS_FUNCS += "go_compose_file_sysroot_preprocess"
>
>  # NO-OP the do compile rule because this recipe is source only.
>  do_compile() {
>  }
> -
>  do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
> -           if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> -               mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> -           fi
> -           cp $j ${D}${prefix}/local/go/$j
> -       done
> -       cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${PKG_NAME}/
> +    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> +    for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
> +        if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> +            mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> +        fi
> +        cp $j ${D}${prefix}/local/go/$j
> +    done
> +    cp -r ${S}/src/${PKG_NAME}/LICENSE
> ${D}${prefix}/local/go/src/${PKG_NAME}/
>  }
>
> -SYSROOT_PREPROCESS_FUNCS += "go_compose_file_sysroot_preprocess"
> +FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> +
> +PKG_NAME = "github.com/aanand/${SRCNAME}"
>
>  go_compose_file_sysroot_preprocess () {
>      install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>      cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
>  }
> -
> -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> -
> -CLEANBROKEN = "1"
> \ No newline at end of file
> +CLEANBROKEN = "1"
> diff --git a/recipes-devtools/go/go-capability_git.bb
> b/recipes-devtools/go/go-capability_git.bb
> index 8524af6..4be88b3 100644
> --- a/recipes-devtools/go/go-capability_git.bb
> +++ b/recipes-devtools/go/go-capability_git.bb
> @@ -3,27 +3,25 @@ HOMEPAGE = "https://github.com/syndtr/gocapability"
>  SECTION = "devel/go"
>  LICENSE = "BSD-2-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=a7304f5073e7be4ba7bffabbf9f2bbca"
> -
> -SRCNAME = "gocapability"
> -
> -PKG_NAME = "github.com/syndtr/${SRCNAME}"
> -SRC_URI = "git://${PKG_NAME}.git"
> -
>  SRCREV = "2c00daeb6c3b45114c80ac44119e7b8801fdd852"
>  PV = "0.0+git${SRCPV}"
>
> +SRC_URI = "git://${PKG_NAME}.git"
> +
> +SRCNAME = "gocapability"
>  S = "${WORKDIR}/git"
> +SYSROOT_PREPROCESS_FUNCS += "go_capability_sysroot_preprocess"
>
>  do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> +    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> +    cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
>  }
>
> -SYSROOT_PREPROCESS_FUNCS += "go_capability_sysroot_preprocess"
> +FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> +
> +PKG_NAME = "github.com/syndtr/${SRCNAME}"
>
>  go_capability_sysroot_preprocess () {
>      install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>      cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
>  }
> -
> -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-cli_git.bb
> b/recipes-devtools/go/go-cli_git.bb
> index 21d01ac..1e86b6b 100644
> --- a/recipes-devtools/go/go-cli_git.bb
> +++ b/recipes-devtools/go/go-cli_git.bb
> @@ -3,27 +3,25 @@ HOMEPAGE = "https://github.com/codegangsta/cli"
>  SECTION = "devel/go"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=ed9b539ed65d73926f30ff1f1587dc44"
> -
> -SRCNAME = "cli"
> -
> -PKG_NAME = "github.com/codegangsta/${SRCNAME}"
> -SRC_URI = "git://${PKG_NAME}.git"
> -
>  SRCREV = "27ecc97192df1bf053a22b04463f2b51b8b8373e"
>  PV = "1.1.0+git${SRCREV}"
>
> +SRC_URI = "git://${PKG_NAME}.git"
> +
> +SRCNAME = "cli"
>  S = "${WORKDIR}/git"
> +SYSROOT_PREPROCESS_FUNCS += "go_cli_sysroot_preprocess"
>
>  do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> +    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> +    cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
>  }
>
> -SYSROOT_PREPROCESS_FUNCS += "go_cli_sysroot_preprocess"
> +FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> +
> +PKG_NAME = "github.com/codegangsta/${SRCNAME}"
>
>  go_cli_sysroot_preprocess () {
>      install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>      cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
>  }
> -
> -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-connections_git.bb
> b/recipes-devtools/go/go-connections_git.bb
> index 5d071b0..34ce2bc 100644
> --- a/recipes-devtools/go/go-connections_git.bb
> +++ b/recipes-devtools/go/go-connections_git.bb
> @@ -3,37 +3,34 @@ HOMEPAGE = "https://github.com/docker/connections"
>  SECTION = "devel/go"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM =
> "file://src/${PKG_NAME}/LICENSE;md5=04424bc6f5a5be60691b9824d65c2ad8"
> -
> -SRCNAME = "go-connections"
> -
> -PKG_NAME = "github.com/docker/${SRCNAME}"
> -SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME}"
> -
>  SRCREV = "4ccf312bf1d35e5dbda654e57a9be4c3f3cd0366"
>  PV = "0.2.1+git${SRCPV}"
>
> +SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME}"
> +
> +SRCNAME = "go-connections"
>  S = "${WORKDIR}/git"
> +SYSROOT_PREPROCESS_FUNCS += "go_connections_sysroot_preprocess"
>
>  # NO-OP the do compile rule because this recipe is source only.
>  do_compile() {
>  }
> -
>  do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
> -           if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> -               mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> -           fi
> -           cp $j ${D}${prefix}/local/go/$j
> -       done
> -       cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${PKG_NAME}/
> +    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> +    for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
> +        if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> +            mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> +        fi
> +        cp $j ${D}${prefix}/local/go/$j
> +    done
> +    cp -r ${S}/src/${PKG_NAME}/LICENSE
> ${D}${prefix}/local/go/src/${PKG_NAME}/
>  }
>
> -SYSROOT_PREPROCESS_FUNCS += "go_connections_sysroot_preprocess"
> +FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> +
> +PKG_NAME = "github.com/docker/${SRCNAME}"
>
>  go_connections_sysroot_preprocess () {
>      install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>      cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
>  }
> -
> -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-context_git.bb
> b/recipes-devtools/go/go-context_git.bb
> index 15f6a8d..8bbc68b 100644
> --- a/recipes-devtools/go/go-context_git.bb
> +++ b/recipes-devtools/go/go-context_git.bb
> @@ -3,26 +3,24 @@ HOMEPAGE = "https://github.com/gorilla/context"
>  SECTION = "devel/go"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=c50f6bd9c1e15ed0bad3bea18e3c1b7f"
> +SRCREV = "14f550f51af52180c2eefed15e5fd18d63c0a64a"
>
> -SRCNAME = "context"
> -
> -PKG_NAME = "github.com/gorilla/${SRCNAME}"
>  SRC_URI = "git://${PKG_NAME}.git"
>
> -SRCREV = "14f550f51af52180c2eefed15e5fd18d63c0a64a"
> -
> +SRCNAME = "context"
>  S = "${WORKDIR}/git"
> +SYSROOT_PREPROCESS_FUNCS += "go_context_sysroot_preprocess"
>
>  do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> +    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> +    cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
>  }
>
> -SYSROOT_PREPROCESS_FUNCS += "go_context_sysroot_preprocess"
> +FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> +
> +PKG_NAME = "github.com/gorilla/${SRCNAME}"
>
>  go_context_sysroot_preprocess () {
>      install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>      cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
>  }
> -
> -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-dbus_git.bb
> b/recipes-devtools/go/go-dbus_git.bb
> index 9b206a1..74fec5b 100644
> --- a/recipes-devtools/go/go-dbus_git.bb
> +++ b/recipes-devtools/go/go-dbus_git.bb
> @@ -3,27 +3,25 @@ HOMEPAGE = "https://github.com/godbus/dbus"
>  SECTION = "devel/go"
>  LICENSE = "BSD-2-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=09042bd5c6c96a2b9e45ddf1bc517eed"
> -
> -SRCNAME = "dbus"
> -
> -PKG_NAME = "github.com/godbus/${SRCNAME}"
> -SRC_URI = "git://${PKG_NAME}.git"
> -
>  SRCREV = "5f6efc7ef2759c81b7ba876593971bfce311eab3"
>  PV = "4.0.0+git${SRCREV}"
>
> +SRC_URI = "git://${PKG_NAME}.git"
> +
> +SRCNAME = "dbus"
>  S = "${WORKDIR}/git"
> +SYSROOT_PREPROCESS_FUNCS += "go_dbus_sysroot_preprocess"
>
>  do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> +    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> +    cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
>  }
>
> -SYSROOT_PREPROCESS_FUNCS += "go_dbus_sysroot_preprocess"
> +FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> +
> +PKG_NAME = "github.com/godbus/${SRCNAME}"
>
>  go_dbus_sysroot_preprocess () {
>      install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>      cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
>  }
> -
> -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-distribution_git.bb
> b/recipes-devtools/go/go-distribution_git.bb
> index 9e3f209..a79ee97 100644
> --- a/recipes-devtools/go/go-distribution_git.bb
> +++ b/recipes-devtools/go/go-distribution_git.bb
> @@ -3,37 +3,34 @@ HOMEPAGE = "https://github.com/docker/distribution"
>  SECTION = "devel/go"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM =
> "file://src/${PKG_NAME}/LICENSE;md5=d2794c0df5b907fdace235a619d80314"
> -
> -SRCNAME = "distribution"
> -
> -PKG_NAME = "github.com/docker/${SRCNAME}"
> -SRC_URI =
> "git://${PKG_NAME}.git;branch=docker/1.13;destsuffix=git/src/${PKG_NAME}"
> -
>  SRCREV = "28602af35aceda2f8d571bad7ca37a54cf0250bc"
>  PV = "2.6.0+git${SRCPV}"
>
> +SRC_URI =
> "git://${PKG_NAME}.git;branch=docker/1.13;destsuffix=git/src/${PKG_NAME}"
> +
> +SRCNAME = "distribution"
>  S = "${WORKDIR}/git"
> +SYSROOT_PREPROCESS_FUNCS += "go_distribution_digeset_sysroot_preprocess"
>
>  # NO-OP the do compile rule because this recipe is source only.
>  do_compile() {
>  }
> -
>  do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
> -           if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> -               mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> -           fi
> -           cp $j ${D}${prefix}/local/go/$j
> -       done
> -       cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${PKG_NAME}/
> +    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> +    for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
> +        if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> +            mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> +        fi
> +        cp $j ${D}${prefix}/local/go/$j
> +    done
> +    cp -r ${S}/src/${PKG_NAME}/LICENSE
> ${D}${prefix}/local/go/src/${PKG_NAME}/
>  }
>
> -SYSROOT_PREPROCESS_FUNCS += "go_distribution_digeset_sysroot_preprocess"
> +FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> +
> +PKG_NAME = "github.com/docker/${SRCNAME}"
>
>  go_distribution_digeset_sysroot_preprocess () {
>      install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>      cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
>  }
> -
> -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-fsnotify_git.bb
> b/recipes-devtools/go/go-fsnotify_git.bb
> index 1d9fbdc..25ed1da 100644
> --- a/recipes-devtools/go/go-fsnotify_git.bb
> +++ b/recipes-devtools/go/go-fsnotify_git.bb
> @@ -3,27 +3,25 @@ HOMEPAGE = "https://github.com/go-fsnotify/fsnotify"
>  SECTION = "devel/go"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=c38914c9a7ab03bb2b96d4baaee10769"
> -
> -SRCNAME = "fsnotify"
> -
> -PKG_NAME = "github.com/fsnotify/${SRCNAME}"
> -SRC_URI = "git://${PKG_NAME}.git"
> -
>  SRCREV = "836bfd95fecc0f1511dd66bdbf2b5b61ab8b00b6"
>  PV = "1.2.11+git${SRCREV}"
>
> +SRC_URI = "git://${PKG_NAME}.git"
> +
> +SRCNAME = "fsnotify"
>  S = "${WORKDIR}/git"
> +SYSROOT_PREPROCESS_FUNCS += "go_fsnotify_sysroot_preprocess"
>
>  do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> +    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> +    cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
>  }
>
> -SYSROOT_PREPROCESS_FUNCS += "go_fsnotify_sysroot_preprocess"
> +FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> +
> +PKG_NAME = "github.com/fsnotify/${SRCNAME}"
>
>  go_fsnotify_sysroot_preprocess () {
>      install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>      cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
>  }
> -
> -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-libtrust_git.bb
> b/recipes-devtools/go/go-libtrust_git.bb
> index 5565946..37c5606 100644
> --- a/recipes-devtools/go/go-libtrust_git.bb
> +++ b/recipes-devtools/go/go-libtrust_git.bb
> @@ -3,27 +3,25 @@ HOMEPAGE = "https://github.com/docker/libtrust"
>  SECTION = "devel/go"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
> -
> -SRCNAME = "libtrust"
> -
> -PKG_NAME = "github.com/docker/${SRCNAME}"
> -SRC_URI = "git://${PKG_NAME}.git"
> -
>  SRCREV = "9cbd2a1374f46905c68a4eb3694a130610adc62a"
>  PV = "0.0+git${SRCPV}"
>
> +SRC_URI = "git://${PKG_NAME}.git"
> +
> +SRCNAME = "libtrust"
>  S = "${WORKDIR}/git"
> +SYSROOT_PREPROCESS_FUNCS += "go_libtrust_sysroot_preprocess"
>
>  do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> +    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> +    cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
>  }
>
> -SYSROOT_PREPROCESS_FUNCS += "go_libtrust_sysroot_preprocess"
> +FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> +
> +PKG_NAME = "github.com/docker/${SRCNAME}"
>
>  go_libtrust_sysroot_preprocess () {
>      install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>      cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
>  }
> -
> -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-logrus_git.bb
> b/recipes-devtools/go/go-logrus_git.bb
> index 5c0c359..bd226ce 100644
> --- a/recipes-devtools/go/go-logrus_git.bb
> +++ b/recipes-devtools/go/go-logrus_git.bb
> @@ -3,27 +3,25 @@ HOMEPAGE = "https://github.com/Sirupsen/logrus"
>  SECTION = "devel/go"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=8dadfef729c08ec4e631c4f6fc5d43a0"
> -
> -SRCNAME = "logrus"
> -
> -PKG_NAME = "github.com/Sirupsen/${SRCNAME}"
> -SRC_URI = "git://${PKG_NAME}.git"
> -
>  SRCREV = "d26492970760ca5d33129d2d799e34be5c4782eb"
>  PV = "0.11.0+git${SRCREV}"
>
> +SRC_URI = "git://${PKG_NAME}.git"
> +
> +SRCNAME = "logrus"
>  S = "${WORKDIR}/git"
> +SYSROOT_PREPROCESS_FUNCS += "go_logrus_sysroot_preprocess"
>
>  do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> +    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> +    cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
>  }
>
> -SYSROOT_PREPROCESS_FUNCS += "go_logrus_sysroot_preprocess"
> +FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> +
> +PKG_NAME = "github.com/Sirupsen/${SRCNAME}"
>
>  go_logrus_sysroot_preprocess () {
>      install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>      cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
>  }
> -
> -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-mux_git.bb
> b/recipes-devtools/go/go-mux_git.bb
> index 7a2025a..26557b8 100644
> --- a/recipes-devtools/go/go-mux_git.bb
> +++ b/recipes-devtools/go/go-mux_git.bb
> @@ -3,26 +3,24 @@ HOMEPAGE = "https://github.com/gorilla/mux"
>  SECTION = "devel/go"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=c50f6bd9c1e15ed0bad3bea18e3c1b7f"
> +SRCREV = "136d54f81f00414c45c3c68dd47e98cc97519c5e"
>
> -SRCNAME = "mux"
> -
> -PKG_NAME = "github.com/gorilla/${SRCNAME}"
>  SRC_URI = "git://${PKG_NAME}.git"
>
> -SRCREV = "136d54f81f00414c45c3c68dd47e98cc97519c5e"
> -
> +SRCNAME = "mux"
>  S = "${WORKDIR}/git"
> +SYSROOT_PREPROCESS_FUNCS += "go_mux_sysroot_preprocess"
>
>  do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> +    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> +    cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
>  }
>
> -SYSROOT_PREPROCESS_FUNCS += "go_mux_sysroot_preprocess"
> +FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> +
> +PKG_NAME = "github.com/gorilla/${SRCNAME}"
>
>  go_mux_sysroot_preprocess () {
>      install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>      cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
>  }
> -
> -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-patricia_git.bb
> b/recipes-devtools/go/go-patricia_git.bb
> index 8c1e10d..c466cbe 100644
> --- a/recipes-devtools/go/go-patricia_git.bb
> +++ b/recipes-devtools/go/go-patricia_git.bb
> @@ -3,27 +3,25 @@ HOMEPAGE = "https://github.com/gorilla/context"
>  SECTION = "devel/go"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=9949b99212edd6b1e24ce702376c3baf"
> -
> -SRCNAME = "go-patricia"
> -
> -PKG_NAME = "github.com/tchap/${SRCNAME}"
> -SRC_URI = "git://${PKG_NAME}.git"
> -
>  SRCREV = "666120de432aea38ab06bd5c818f04f4129882c9"
>  PV = "2.2.6+git${SRCPV}"
>
> +SRC_URI = "git://${PKG_NAME}.git"
> +
> +SRCNAME = "go-patricia"
>  S = "${WORKDIR}/git"
> +SYSROOT_PREPROCESS_FUNCS += "go_patricia_sysroot_preprocess"
>
>  do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> +    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> +    cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
>  }
>
> -SYSROOT_PREPROCESS_FUNCS += "go_patricia_sysroot_preprocess"
> +FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> +
> +PKG_NAME = "github.com/tchap/${SRCNAME}"
>
>  go_patricia_sysroot_preprocess () {
>      install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>      cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
>  }
> -
> -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-pty_git.bb
> b/recipes-devtools/go/go-pty_git.bb
> index bc94b31..60ef321 100644
> --- a/recipes-devtools/go/go-pty_git.bb
> +++ b/recipes-devtools/go/go-pty_git.bb
> @@ -3,26 +3,24 @@ HOMEPAGE = "https://github.com/kr/pty"
>  SECTION = "devel/go"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://License;md5=93958070863d769117fa33b129020050"
> +SRCREV = "05017fcccf23c823bfdea560dcc958a136e54fb7"
>
> -SRCNAME = "pty"
> -
> -PKG_NAME = "github.com/kr/${SRCNAME}"
>  SRC_URI = "git://${PKG_NAME}.git"
>
> -SRCREV = "05017fcccf23c823bfdea560dcc958a136e54fb7"
> -
> +SRCNAME = "pty"
>  S = "${WORKDIR}/git"
> +SYSROOT_PREPROCESS_FUNCS += "go_pty_sysroot_preprocess"
>
>  do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> +    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> +    cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
>  }
>
> -SYSROOT_PREPROCESS_FUNCS += "go_pty_sysroot_preprocess"
> +FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> +
> +PKG_NAME = "github.com/kr/${SRCNAME}"
>
>  go_pty_sysroot_preprocess () {
>      install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>      cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
>  }
> -
> -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-systemd_git.bb
> b/recipes-devtools/go/go-systemd_git.bb
> index b61c97a..b76f4a0 100644
> --- a/recipes-devtools/go/go-systemd_git.bb
> +++ b/recipes-devtools/go/go-systemd_git.bb
> @@ -3,29 +3,27 @@ HOMEPAGE = "https://github.com/coreos/go-systemd"
>  SECTION = "devel/go"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5"
> -
> -SRCNAME = "systemd"
> -
> -PKG_NAME = "github.com/coreos/go-${SRCNAME}"
> -SRC_URI = "git://${PKG_NAME}.git"
> -
>  SRCREV = "b4a58d95188dd092ae20072bac14cece0e67c388"
>  PV = "4+git${SRCREV}"
>
> -RDEPENDS_${PN} += "bash"
> +SRC_URI = "git://${PKG_NAME}.git"
>
> +SRCNAME = "systemd"
>  S = "${WORKDIR}/git"
> +SYSROOT_PREPROCESS_FUNCS += "go_systemd_sysroot_preprocess"
>
>  do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> +    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> +    cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
>  }
>
> -SYSROOT_PREPROCESS_FUNCS += "go_systemd_sysroot_preprocess"
> +RDEPENDS_${PN} += "bash"
> +
> +FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> +
> +PKG_NAME = "github.com/coreos/go-${SRCNAME}"
>
>  go_systemd_sysroot_preprocess () {
>      install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>      cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
>  }
> -
> -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/grpc-go_git.bb
> b/recipes-devtools/go/grpc-go_git.bb
> index 48c4249..f8114e3 100644
> --- a/recipes-devtools/go/grpc-go_git.bb
> +++ b/recipes-devtools/go/grpc-go_git.bb
> @@ -3,39 +3,36 @@ HOMEPAGE = "https://github.com/grpc/grpc-go"
>  SECTION = "devel/go"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM =
> "file://src/${PKG_NAME}/LICENSE;md5=a4bad33881612090c6035d8393175996"
> -
> -SRCNAME = "grpc-go"
> -
> -PKG_NAME = "google.golang.org/grpc"
> -SRC_URI =
> "git://github.com/grpc/${SRCNAME}.git;destsuffix=git/src/${PKG_NAME}"
> -
>  SRCREV = "777daa17ff9b5daef1cfdf915088a2ada3332bf0"
>  PV = "1.4.0+git${SRCPV}"
>
> +SRC_URI =
> "git://github.com/grpc/${SRCNAME}.git;destsuffix=git/src/${PKG_NAME}"
> +
> +SRCNAME = "grpc-go"
>  S = "${WORKDIR}/git"
> +SYSROOT_PREPROCESS_FUNCS += "go_grpc_sysroot_preprocess"
>
>  # NO-OP the do compile rule because this recipe is source only.
>  do_compile() {
>  }
> -
>  do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
> -           if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> -               mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> -           fi
> -           cp $j ${D}${prefix}/local/go/$j
> -       done
> -       cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${PKG_NAME}/
> +    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> +    for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
> +        if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> +            mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> +        fi
> +        cp $j ${D}${prefix}/local/go/$j
> +    done
> +    cp -r ${S}/src/${PKG_NAME}/LICENSE
> ${D}${prefix}/local/go/src/${PKG_NAME}/
>  }
>
> -SYSROOT_PREPROCESS_FUNCS += "go_grpc_sysroot_preprocess"
> +FILES_${PN} += " \
> +    ${prefix}/local/go/src/${PKG_NAME}/* \
> +"
> +
> +PKG_NAME = "google.golang.org/grpc"
>
>  go_grpc_sysroot_preprocess () {
>      install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>      cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
>  }
> -
> -FILES_${PN} += " \
> -    ${prefix}/local/go/src/${PKG_NAME}/* \
> -"
> diff --git a/recipes-devtools/go/notary_git.bb
> b/recipes-devtools/go/notary_git.bb
> index d638dc1..15da097 100644
> --- a/recipes-devtools/go/notary_git.bb
> +++ b/recipes-devtools/go/notary_git.bb
> @@ -3,37 +3,34 @@ HOMEPAGE = "https://github.com/docker/notary"
>  SECTION = "devel/go"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM =
> "file://src/${PKG_NAME}/LICENSE;md5=771ddb425ba03c8fab49e5bd9854a4a2"
> -
> -SRCNAME = "notary"
> -
> -PKG_NAME = "github.com/docker/${SRCNAME}"
> -SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME}"
> -
>  SRCREV = "c8aa8cf53cbcda2e92def0c9291e25d770493494"
>  PV = "0.4.2+git${SRCPV}"
>
> +SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME}"
> +
> +SRCNAME = "notary"
>  S = "${WORKDIR}/git"
> +SYSROOT_PREPROCESS_FUNCS += "go_notary_sysroot_preprocess"
>
>  # NO-OP the do compile rule because this recipe is source only.
>  do_compile() {
>  }
> -
>  do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
> -           if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> -               mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> -           fi
> -           cp $j ${D}${prefix}/local/go/$j
> -       done
> -       cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${PKG_NAME}/
> +    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> +    for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
> +        if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> +            mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> +        fi
> +        cp $j ${D}${prefix}/local/go/$j
> +    done
> +    cp -r ${S}/src/${PKG_NAME}/LICENSE
> ${D}${prefix}/local/go/src/${PKG_NAME}/
>  }
>
> -SYSROOT_PREPROCESS_FUNCS += "go_notary_sysroot_preprocess"
> +FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> +
> +PKG_NAME = "github.com/docker/${SRCNAME}"
>
>  go_notary_sysroot_preprocess () {
>      install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>      cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
>  }
> -
> -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> --
> 2.11.0
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

