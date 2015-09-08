Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ED505E00C62; Tue,  8 Sep 2015 07:02:47 -0700 (PDT)
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
	*      [209.85.160.174 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 07E33E00B5A
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Sep 2015 07:02:43 -0700 (PDT)
Received: by ykei199 with SMTP id i199so119791055yke.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 08 Sep 2015 07:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/Y/tF/GzJ3AEJldokFGqu95y1v63RByqDiMrPVzTCAQ=;
	b=PEUWomlXQg94XFQBc6F+pNCUA7XVGw/kn/bESy2ZNDOyY21H3PivdU8OPUIBNFmvI3
	mllM2F3myx+Yh0zEVZNLRU22h4MGskKxH5bl93sRcVXxG+LtwxzufaNIEOAMP9wQHl0w
	3EOxtNXR+0l9uIPIY9YLGQJNlTM8h6sEcPhiutT6IYEiF8fJG6f3QBTcx9WRuFc2oeC9
	Bd7qPN8BuNWtfxCkqrxKatbZ+PN5avczPCUVcKHhQKg5thqoqVQyubsYS6rVvyp8zqsE
	vVSc/0Yn0ZhCE7zw9WJBJjcrtjV9aQgBu7pFfeymyGS13wsxUIRgkq/NT1UgeDJdhaxo
	554g==
MIME-Version: 1.0
X-Received: by 10.13.194.135 with SMTP id e129mr21363258ywd.62.1441720961268; 
	Tue, 08 Sep 2015 07:02:41 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Tue, 8 Sep 2015 07:02:41 -0700 (PDT)
In-Reply-To: <1441310412-7383-1-git-send-email-mark.asselstine@windriver.com>
References: <1441310412-7383-1-git-send-email-mark.asselstine@windriver.com>
Date: Tue, 8 Sep 2015 10:02:41 -0400
Message-ID: <CADkTA4N36H_G5Cq2asXPw-oVoAOWTKKjUCytset5E61NhzuXYw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] bbappend: switch to use a wildcard beyond major version
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
X-List-Received-Date: Tue, 08 Sep 2015 14:02:48 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Thu, Sep 3, 2015 at 4:00 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Using a wildcard will simplify things when using meta-virtualization
> against different yocto or oe branches and prevent having to make
> future updates to keep in step with package uprevs.
>
> The changes found within these bbappend tend to be generic and
> non-version specific, thus safe for 'porting' via wildcard.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-core/base-files/base-files_3.%.bbappend         |  5 +++++
>  recipes-core/base-files/base-files_3.0.14.bbappend      |  5 -----
>  recipes-core/initscripts/initscripts_1.%.bbappend       | 16 ++++++++++++++++
>  recipes-core/initscripts/initscripts_1.0.bbappend       | 16 ----------------
>  recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend     |  6 ++++++
>  recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend |  6 ------
>  recipes-devtools/python/python_2.%.bbappend             |  8 ++++++++
>  recipes-devtools/python/python_2.7.9.bbappend           |  8 --------
>  recipes-extended/iptables/iptables_1.%.bbappend         |  8 ++++++++
>  recipes-extended/iptables/iptables_1.4.21.bbappend      |  8 --------
>  10 files changed, 43 insertions(+), 43 deletions(-)
>  create mode 100644 recipes-core/base-files/base-files_3.%.bbappend
>  delete mode 100644 recipes-core/base-files/base-files_3.0.14.bbappend
>  create mode 100644 recipes-core/initscripts/initscripts_1.%.bbappend
>  delete mode 100644 recipes-core/initscripts/initscripts_1.0.bbappend
>  create mode 100644 recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
>  delete mode 100644 recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend
>  create mode 100644 recipes-devtools/python/python_2.%.bbappend
>  delete mode 100644 recipes-devtools/python/python_2.7.9.bbappend
>  create mode 100644 recipes-extended/iptables/iptables_1.%.bbappend
>  delete mode 100644 recipes-extended/iptables/iptables_1.4.21.bbappend
>
> diff --git a/recipes-core/base-files/base-files_3.%.bbappend b/recipes-core/base-files/base-files_3.%.bbappend
> new file mode 100644
> index 0000000..eb973ad
> --- /dev/null
> +++ b/recipes-core/base-files/base-files_3.%.bbappend
> @@ -0,0 +1,5 @@
> +do_install_append() {
> +       if echo "${DISTRO_FEATURES}" | grep -q 'xen'; then
> +               echo "xenfs                /proc/xen            xenfs      defaults              0  0" >> ${D}${sysconfdir}/fstab
> +       fi
> +}
> diff --git a/recipes-core/base-files/base-files_3.0.14.bbappend b/recipes-core/base-files/base-files_3.0.14.bbappend
> deleted file mode 100644
> index eb973ad..0000000
> --- a/recipes-core/base-files/base-files_3.0.14.bbappend
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -do_install_append() {
> -       if echo "${DISTRO_FEATURES}" | grep -q 'xen'; then
> -               echo "xenfs                /proc/xen            xenfs      defaults              0  0" >> ${D}${sysconfdir}/fstab
> -       fi
> -}
> diff --git a/recipes-core/initscripts/initscripts_1.%.bbappend b/recipes-core/initscripts/initscripts_1.%.bbappend
> new file mode 100644
> index 0000000..0600ab2
> --- /dev/null
> +++ b/recipes-core/initscripts/initscripts_1.%.bbappend
> @@ -0,0 +1,16 @@
> +do_install_append() {
> +
> +       echo                  >> ${D}${sysconfdir}/init.d/functions
> +       echo success \(\) \{  >> ${D}${sysconfdir}/init.d/functions
> +       echo \ \ \ \ echo \$* >> ${D}${sysconfdir}/init.d/functions
> +       echo \}               >> ${D}${sysconfdir}/init.d/functions
> +       echo failure \(\) \{  >> ${D}${sysconfdir}/init.d/functions
> +       echo \ \ \ \ echo \$* >> ${D}${sysconfdir}/init.d/functions
> +       echo \}               >> ${D}${sysconfdir}/init.d/functions
> +       echo warning \(\) \{  >> ${D}${sysconfdir}/init.d/functions
> +       echo \ \ \ \ echo \$* >> ${D}${sysconfdir}/init.d/functions
> +       echo \}               >> ${D}${sysconfdir}/init.d/functions
> +       echo begin \(\) \{  >> ${D}${sysconfdir}/init.d/functions
> +       echo \ \ \ \ echo \$* >> ${D}${sysconfdir}/init.d/functions
> +       echo \}               >> ${D}${sysconfdir}/init.d/functions
> +}
> diff --git a/recipes-core/initscripts/initscripts_1.0.bbappend b/recipes-core/initscripts/initscripts_1.0.bbappend
> deleted file mode 100644
> index 0600ab2..0000000
> --- a/recipes-core/initscripts/initscripts_1.0.bbappend
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -do_install_append() {
> -
> -       echo                  >> ${D}${sysconfdir}/init.d/functions
> -       echo success \(\) \{  >> ${D}${sysconfdir}/init.d/functions
> -       echo \ \ \ \ echo \$* >> ${D}${sysconfdir}/init.d/functions
> -       echo \}               >> ${D}${sysconfdir}/init.d/functions
> -       echo failure \(\) \{  >> ${D}${sysconfdir}/init.d/functions
> -       echo \ \ \ \ echo \$* >> ${D}${sysconfdir}/init.d/functions
> -       echo \}               >> ${D}${sysconfdir}/init.d/functions
> -       echo warning \(\) \{  >> ${D}${sysconfdir}/init.d/functions
> -       echo \ \ \ \ echo \$* >> ${D}${sysconfdir}/init.d/functions
> -       echo \}               >> ${D}${sysconfdir}/init.d/functions
> -       echo begin \(\) \{  >> ${D}${sysconfdir}/init.d/functions
> -       echo \ \ \ \ echo \$* >> ${D}${sysconfdir}/init.d/functions
> -       echo \}               >> ${D}${sysconfdir}/init.d/functions
> -}
> diff --git a/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend b/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
> new file mode 100644
> index 0000000..1b89aec
> --- /dev/null
> +++ b/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
> @@ -0,0 +1,6 @@
> +do_install_append() {
> +       if echo "${DISTRO_FEATURES}" | grep -q 'xen'; then
> +               echo "" >> ${D}${sysconfdir}/inittab
> +               echo "X0:12345:respawn:/sbin/getty 115200 hvc0" >> ${D}${sysconfdir}/inittab
> +       fi
> +}
> diff --git a/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend b/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend
> deleted file mode 100644
> index 1b89aec..0000000
> --- a/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -do_install_append() {
> -       if echo "${DISTRO_FEATURES}" | grep -q 'xen'; then
> -               echo "" >> ${D}${sysconfdir}/inittab
> -               echo "X0:12345:respawn:/sbin/getty 115200 hvc0" >> ${D}${sysconfdir}/inittab
> -       fi
> -}
> diff --git a/recipes-devtools/python/python_2.%.bbappend b/recipes-devtools/python/python_2.%.bbappend
> new file mode 100644
> index 0000000..55301c7
> --- /dev/null
> +++ b/recipes-devtools/python/python_2.%.bbappend
> @@ -0,0 +1,8 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +
> +DEPENDS += " ncurses"
> +
> +do_compile_prepend() {
> +       export LIBRARY_PATH=${STAGING_DIR_TARGET}/lib
> +}
> +
> diff --git a/recipes-devtools/python/python_2.7.9.bbappend b/recipes-devtools/python/python_2.7.9.bbappend
> deleted file mode 100644
> index 55301c7..0000000
> --- a/recipes-devtools/python/python_2.7.9.bbappend
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> -
> -DEPENDS += " ncurses"
> -
> -do_compile_prepend() {
> -       export LIBRARY_PATH=${STAGING_DIR_TARGET}/lib
> -}
> -
> diff --git a/recipes-extended/iptables/iptables_1.%.bbappend b/recipes-extended/iptables/iptables_1.%.bbappend
> new file mode 100644
> index 0000000..52a4c4f
> --- /dev/null
> +++ b/recipes-extended/iptables/iptables_1.%.bbappend
> @@ -0,0 +1,8 @@
> +RRECOMMENDS_${PN} += "kernel-module-ip6-tables \
> +                      kernel-module-ip6table-filter \
> +                      kernel-module-xt-tcpudp \
> +                      kernel-module-ipt-reject \
> +                      kernel-module-iptable-mangle \
> +                      kernel-module-xt-checksum \
> +                      kernel-module-xt-state \
> +                      "
> diff --git a/recipes-extended/iptables/iptables_1.4.21.bbappend b/recipes-extended/iptables/iptables_1.4.21.bbappend
> deleted file mode 100644
> index 52a4c4f..0000000
> --- a/recipes-extended/iptables/iptables_1.4.21.bbappend
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -RRECOMMENDS_${PN} += "kernel-module-ip6-tables \
> -                      kernel-module-ip6table-filter \
> -                      kernel-module-xt-tcpudp \
> -                      kernel-module-ipt-reject \
> -                      kernel-module-iptable-mangle \
> -                      kernel-module-xt-checksum \
> -                      kernel-module-xt-state \
> -                      "
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

