Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5393BE00B5E; Thu,  4 Oct 2018 06:31:56 -0700 (PDT)
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
	*      [209.85.167.52 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
	[209.85.167.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1D33AE00B23
	for <meta-virtualization@yoctoproject.org>;
	Thu,  4 Oct 2018 06:31:55 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id m18-v6so6772864lfl.11
	for <meta-virtualization@yoctoproject.org>;
	Thu, 04 Oct 2018 06:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RpLjHdFmccfsE+5kh1moz7r3W0YbmQoOb6riIIheLlY=;
	b=RW99LQmpFOOCa3NIPNenC+i8oMeLw5YE2o5mS7Iht/iy9jDlY3G8X1a+a3qi6pGoDB
	QprfvejeY1wrOPwfHe4w43gXVUn4slOqKPcoTP5yRKZK7G2N4WqHvlhhq0Leix/sQlbG
	PEqRAMFUuIJmgBviuD3/ZJFCazQEgHSIGBQCN0eRWcwqn+ffM48vs5qqbhxZRsLH9KQ3
	T0luPDUJ1pS+vyTfsTwEBiqhjBUpcVacU37WCU85IavNL8FlBNgT/asI/kGDCADzu7Yk
	PXyropIhRbAzZ8KiAz/6y8D0ukUSZW1o4qDC6lDuChDzlhKHjKvO7cHhfw4bFGjX1Xqu
	EgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RpLjHdFmccfsE+5kh1moz7r3W0YbmQoOb6riIIheLlY=;
	b=KEGKXzwrra8PBYo76VekeMOPSntx+EVQskmMemTCsac63oThKe1DRepRN159vONtRj
	FcczT7mcoil0hzdZtLf87MvVVSvQ0/DaRPjpWp0Noz7UeDMgqc5++vbuouE5fl9bXeJH
	rcalQagV67tEgEzKkXq6ZDD5hAPeqGE7cRYuFUuUsp2wnSV16uty41JZ6EpOO9Fz4bA6
	4Vqm4zNgKOHyBP4eFLFukGLV4oY3vCnJaAdMXPKh8XDPp10+3gn55sBzQl+8y4QI6KNS
	3ylcAx/1h1Oi6HO19rw6WKw6fO4bVtGn2L/GwtB0hp3PLfUJnjhCCYxnTtFDQfcayTf4
	a7ww==
X-Gm-Message-State: ABuFfogOgNoZOqNCnP3GqpXK3g3RWfv1yizkXP/4rFCZ3WZBMtsAzkKR
	JmM4h8ZcgaKzGFV79dvoFE6WQ8sQ4OVlCzxRkx4=
X-Google-Smtp-Source: ACcGV62jVUaelcVbQSIuZ03TqFiyk/YZ3ZjylB9gWLfnLf+AA+MBMprBzprdh99AfzY2hlkgIhiNYcpK6axt/WwT7Og=
X-Received: by 2002:a19:a686:: with SMTP id
	p128-v6mr3820481lfe.42.1538659913915; 
	Thu, 04 Oct 2018 06:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <1538505826-7045-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1538505826-7045-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 4 Oct 2018 09:31:42 -0400
Message-ID: <CADkTA4O6M3gOwn0WgZcJRg-Qof=BEDJsnPO5e+Myoi3dnGDD=g@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] lxcfs: move recipe from meta-overc to here
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
X-List-Received-Date: Thu, 04 Oct 2018 13:31:56 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks Mark,

this is now merged.

Bruce
On Tue, Oct 2, 2018 at 2:45 PM Mark Asselstine
<mark.asselstine@windriver.com> wrote:
>
> This recipe was originally written and included in meta-overc as it
> was used by the overc framework so we implemented it there to sort out
> the kinks. Since this package is not specific to the OverC framework
> and people may be interested in including it in their images without
> having any interest in the OverC framework we are moving this recipe
> here, alongside lxc and other container related recipes.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  ...ystemd-allow-for-distinct-build-directory.patch | 47 ++++++++++++++++++++++
>  .../systemd-ensure-var-lib-lxcfs-exists.patch      | 27 +++++++++++++
>  recipes-containers/lxcfs/lxcfs_3.0.1.bb            | 25 ++++++++++++
>  3 files changed, 99 insertions(+)
>  create mode 100644 recipes-containers/lxcfs/files/systemd-allow-for-distinct-build-directory.patch
>  create mode 100644 recipes-containers/lxcfs/files/systemd-ensure-var-lib-lxcfs-exists.patch
>  create mode 100644 recipes-containers/lxcfs/lxcfs_3.0.1.bb
>
> diff --git a/recipes-containers/lxcfs/files/systemd-allow-for-distinct-build-directory.patch b/recipes-containers/lxcfs/files/systemd-allow-for-distinct-build-directory.patch
> new file mode 100644
> index 0000000..14228d6
> --- /dev/null
> +++ b/recipes-containers/lxcfs/files/systemd-allow-for-distinct-build-directory.patch
> @@ -0,0 +1,47 @@
> +From 66a71fbf94020651880f1dbb6e4663d93391b47c Mon Sep 17 00:00:00 2001
> +From: Mark Asselstine <mark.asselstine@windriver.com>
> +Date: Mon, 10 Sep 2018 13:14:07 -0400
> +Subject: [PATCH] systemd: allow for distinct build directory
> +
> +The Makefile.am is currently written in a way that doesn't allow for a
> +distinct build directory. As such we get the error:
> +
> +    install: cannot stat 'lxcfs.service': No such file or directory
> +
> +Make use of $(srcdir) to correct this.
> +
> +Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> +---
> + config/init/systemd/Makefile.am | 2 +-
> + config/init/systemd/Makefile.in | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/config/init/systemd/Makefile.am b/config/init/systemd/Makefile.am
> +index 79e96f5..d6933f9 100644
> +--- a/config/init/systemd/Makefile.am
> ++++ b/config/init/systemd/Makefile.am
> +@@ -5,7 +5,7 @@ SYSTEMD_UNIT_DIR = /lib/systemd/system
> +
> + install-systemd: lxcfs.service
> +       $(MKDIR_P) $(DESTDIR)$(SYSTEMD_UNIT_DIR)
> +-      $(INSTALL_DATA) lxcfs.service $(DESTDIR)$(SYSTEMD_UNIT_DIR)/
> ++      $(INSTALL_DATA) $(srcdir)/lxcfs.service $(DESTDIR)$(SYSTEMD_UNIT_DIR)/
> +
> + uninstall-systemd:
> +       rm -f $(DESTDIR)$(SYSTEMD_UNIT_DIR)/lxcfs.service
> +diff --git a/config/init/systemd/Makefile.in b/config/init/systemd/Makefile.in
> +index d433e8a..430190c 100644
> +--- a/config/init/systemd/Makefile.in
> ++++ b/config/init/systemd/Makefile.in
> +@@ -450,7 +450,7 @@ uninstall-am: uninstall-local
> +
> + @INIT_SCRIPT_SYSTEMD_TRUE@install-systemd: lxcfs.service
> + @INIT_SCRIPT_SYSTEMD_TRUE@    $(MKDIR_P) $(DESTDIR)$(SYSTEMD_UNIT_DIR)
> +-@INIT_SCRIPT_SYSTEMD_TRUE@    $(INSTALL_DATA) lxcfs.service $(DESTDIR)$(SYSTEMD_UNIT_DIR)/
> ++@INIT_SCRIPT_SYSTEMD_TRUE@    $(INSTALL_DATA) $(srcdir)/lxcfs.service $(DESTDIR)$(SYSTEMD_UNIT_DIR)/
> +
> + @INIT_SCRIPT_SYSTEMD_TRUE@uninstall-systemd:
> + @INIT_SCRIPT_SYSTEMD_TRUE@    rm -f $(DESTDIR)$(SYSTEMD_UNIT_DIR)/lxcfs.service
> +--
> +2.7.4
> +
> diff --git a/recipes-containers/lxcfs/files/systemd-ensure-var-lib-lxcfs-exists.patch b/recipes-containers/lxcfs/files/systemd-ensure-var-lib-lxcfs-exists.patch
> new file mode 100644
> index 0000000..5e5673a
> --- /dev/null
> +++ b/recipes-containers/lxcfs/files/systemd-ensure-var-lib-lxcfs-exists.patch
> @@ -0,0 +1,27 @@
> +From 89bf4b64e810e174068e7861490e6d6ab2d14854 Mon Sep 17 00:00:00 2001
> +From: Mark Asselstine <mark.asselstine@windriver.com>
> +Date: Mon, 10 Sep 2018 15:01:54 -0400
> +Subject: [PATCH] systemd: ensure /var/lib/lxcfs exists
> +
> +If the directory doesn't exist the service will fail to start.
> +
> +Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> +---
> + config/init/systemd/lxcfs.service | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/config/init/systemd/lxcfs.service b/config/init/systemd/lxcfs.service
> +index 95e3ee9..d887203 100644
> +--- a/config/init/systemd/lxcfs.service
> ++++ b/config/init/systemd/lxcfs.service
> +@@ -5,6 +5,7 @@ Before=lxc.service
> + Documentation=man:lxcfs(1)
> +
> + [Service]
> ++ExecStartPre=-/bin/mkdir /var/lib/lxcfs
> + ExecStart=/usr/bin/lxcfs /var/lib/lxcfs/
> + KillMode=process
> + Restart=on-failure
> +--
> +2.7.4
> +
> diff --git a/recipes-containers/lxcfs/lxcfs_3.0.1.bb b/recipes-containers/lxcfs/lxcfs_3.0.1.bb
> new file mode 100644
> index 0000000..576027f
> --- /dev/null
> +++ b/recipes-containers/lxcfs/lxcfs_3.0.1.bb
> @@ -0,0 +1,25 @@
> +SUMMARY = "LXCFS is a userspace filesystem created to avoid kernel limitations"
> +LICENSE = "Apache-2.0"
> +
> +inherit autotools pkgconfig systemd
> +
> +SRC_URI = " \
> +    https://linuxcontainers.org/downloads/lxcfs/lxcfs-${PV}.tar.gz \
> +    file://systemd-allow-for-distinct-build-directory.patch \
> +    file://systemd-ensure-var-lib-lxcfs-exists.patch \
> +"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +SRC_URI[md5sum] = "fa49872fc45846125455199a2cce18f1"
> +SRC_URI[sha256sum] = "016c317f13392bebccba338511f537332fb2fdbaf62a5f6d77307b38a348f41f"
> +
> +DEPENDS += "fuse"
> +RDEPENDS_${PN} += "fuse"
> +
> +FILES_${PN} += "${datadir}/lxc/config/common.conf.d/*"
> +
> +CACHED_CONFIGUREVARS += "ac_cv_path_HELP2MAN='false // No help2man //'"
> +EXTRA_OECONF += "--with-distro=unknown --with-init-script=${VIRTUAL-RUNTIME_init_manager}"
> +
> +SYSTEMD_PACKAGES = "${PN}"
> +SYSTEMD_SERVICE_${PN} = "lxcfs.service"
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

