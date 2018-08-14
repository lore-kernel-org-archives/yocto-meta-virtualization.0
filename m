Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BEE14E006B3; Tue, 14 Aug 2018 10:04:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.167.67 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93132E0049F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Aug 2018 10:03:59 -0700 (PDT)
Received: by mail-lf1-f67.google.com with SMTP id n96-v6so14299502lfi.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Aug 2018 10:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=k2CyURa9/25DTd2gbCi7QMLe1je5R/n8IhfMg1nOdS8=;
	b=Bs8TkJv+/5UfbzPQK9D57raOtY4h0lD4oerypj8RwQjWaT1xkdA1elBqqmd7uEaWmb
	wTsVGqM3tij/NnGjJ552vBIdHnvNMoy9PXOHILfihEaJXJGfMgHp1nIgFGxYNI3nt9G/
	yzplgvPfDJWt5XUl86mh4dF3VVfqd1dehfQWF/sjXkecZG9+6NQkZnOD0RxniM9dkjcc
	N5YMrHkBUA7hcvtPYkM+j23VrKY5K7IdKSFA91jDO7CNW/BrDgvmXjqUeS54gr6b6ldG
	yJOhf7u8YkfF+VeARwk7kAsmdKtyCd0x6FtXUqqe9mcur12RMngS6dVzQgkU1Ah+D7pi
	wvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=k2CyURa9/25DTd2gbCi7QMLe1je5R/n8IhfMg1nOdS8=;
	b=nVXzLLP2XcL0nwaNW8LS8NwsAbiwJ9ji6SgfDfV6mmS7yTkZbcll83scDwQg5L+oLG
	5v7amrINVrAe4TwB+aI7VVw++35PMQC9Ai+N24RyKW/FoXDyZULmc0O2W/Qi9hKvIPrk
	1GyntOQfCQftoR6pDapOF7N5ZIf7fI6t48TnVy1VL0K+3i+f1Y3PScUtQnPzaHQ1M7aZ
	7SmmXFQ6Hlfq89GO4lCE3LOjiztxia7L5v97GWZNoDyQfASEWTI8MIfRH3O7cScrhGlT
	OgXMOaijK5WMgWZtvu6+JymtvfP3lJ0nGx9WrRYvxtwfK02rZLqXt3nLEiCoPDwxEVXD
	k40Q==
X-Gm-Message-State: AOUpUlH4KmERhVGrBnEsagd9QpCkeashNH9yYhWKl5/whThZrhnPpt5/
	YvPYIBMFKL/Na+oFnhHi9H02DNXwS236GfNm4dM=
X-Google-Smtp-Source: AA+uWPy2HlJ1BaXEk3g8f5qIQLAU1KQqk/5CLm1cQYD4a9ybcoAETBqklRUhnTXoJRnFGafOB7mJ5ShKPIMjxLZVexw=
X-Received: by 2002:a19:f50d:: with SMTP id
	j13-v6mr13858838lfb.127.1534266238635; 
	Tue, 14 Aug 2018 10:03:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Tue, 14 Aug 2018 10:03:58
	-0700 (PDT)
In-Reply-To: <1533886172-328377-1-git-send-email-mingli.yu@windriver.com>
References: <1533886172-328377-1-git-send-email-mingli.yu@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 14 Aug 2018 13:03:58 -0400
Message-ID: <CADkTA4PU5XqH0OmNs8UPad+3_t0tofj7hc2_jFR0GuUKAxJ9og@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-openstack][PATCH] tgt: add systemd service file
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
X-List-Received-Date: Tue, 14 Aug 2018 17:04:00 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Aug 10, 2018 at 3:29 AM,  <mingli.yu@windriver.com> wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> Add systemd service file for tgt
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  meta-openstack/recipes-support/tgt/files/tgtd      |  5 ++++
>  .../recipes-support/tgt/files/tgtd.service         | 33 ++++++++++++++++++++++
>  meta-openstack/recipes-support/tgt/tgt_git.bb      | 22 +++++++++++++--
>  3 files changed, 58 insertions(+), 2 deletions(-)
>  create mode 100644 meta-openstack/recipes-support/tgt/files/tgtd
>  create mode 100755 meta-openstack/recipes-support/tgt/files/tgtd.service
>
> diff --git a/meta-openstack/recipes-support/tgt/files/tgtd b/meta-openstack/recipes-support/tgt/files/tgtd
> new file mode 100644
> index 0000000..64df6a3
> --- /dev/null
> +++ b/meta-openstack/recipes-support/tgt/files/tgtd
> @@ -0,0 +1,5 @@
> +# options for tgtd
> +TGTD_OPTS=""
> +
> +# configuration file
> +TGTD_CONFIG=/etc/tgt/targets.conf
> diff --git a/meta-openstack/recipes-support/tgt/files/tgtd.service b/meta-openstack/recipes-support/tgt/files/tgtd.service
> new file mode 100755
> index 0000000..afbd4b4
> --- /dev/null
> +++ b/meta-openstack/recipes-support/tgt/files/tgtd.service
> @@ -0,0 +1,33 @@
> +[Unit]
> +Description=tgtd iSCSI target daemon
> +After=network.target
> +
> +[Service]
> +EnvironmentFile=@SYSCONFDIR@/sysconfig/tgtd
> +
> +ExecStart=@SBINDIR@/tgtd -f $TGTD_OPTS
> +# see bz 848942. workaround for a race for now.
> +ExecStartPost=@BASE_BINDIR@/sleep 5
> +# Put tgtd into "offline" state until all the targets are configured.
> +# We don't want initiators to (re)connect and fail the connection
> +# if it's not ready.
> +ExecStartPost=@SBINDIR@/tgtadm --op update --mode sys --name State -v offline
> +# Configure the targets.
> +ExecStartPost=@SBINDIR@/tgt-admin -e -c $TGTD_CONFIG
> +# Put tgtd into "ready" state.
> +ExecStartPost=@SBINDIR@/tgtadm --op update --mode sys --name State -v ready
> +
> +# Update configuration for targets. Only targets which
> +# are not in use will be updated.
> +ExecReload=@SBINDIR@/tgt-admin --update ALL -c $TGTD_CONFIG
> +
> +# NOTE: Shutdown of the iscsi target may cause data corruption
> +# for initiators that are connected.
> +ExecStop=@SBINDIR@/tgtadm --op update --mode sys --name State -v offline
> +# Remove all targets. It only removes targets which are not in use.
> +ExecStop=@SBINDIR@/tgt-admin --update ALL -c /dev/null
> +# tgtd will exit if all targets were removed
> +ExecStop=@SBINDIR@/tgtadm --op delete --mode system
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-openstack/recipes-support/tgt/tgt_git.bb b/meta-openstack/recipes-support/tgt/tgt_git.bb
> index f4e12da..b94b034 100644
> --- a/meta-openstack/recipes-support/tgt/tgt_git.bb
> +++ b/meta-openstack/recipes-support/tgt/tgt_git.bb
> @@ -12,13 +12,19 @@ SRC_URI = "git://github.com/fujita/tgt.git \
>          file://0001-usr-Makefile-WARNING-fix.patch \
>          file://usr-Makefile-apply-LDFLAGS-to-all-executables.patch \
>  "
> -SRC_URI += "file://tgtd.init"
> +SRC_URI += "file://tgtd.init \
> +            file://tgtd.service \
> +            file://tgtd \
> +"
>
>  S = "${WORKDIR}/git"
>
>  CONFFILES_${PN} += "${sysconfdir}/tgt/targets.conf"
>
> -inherit update-rc.d
> +inherit update-rc.d systemd
> +
> +SYSTEMD_SERVICE_${PN} = "tgtd.service"
> +SYSTEMD_AUTO_ENABLE_${PN} = "disable"
>
>  CFLAGS += ' -I. -DUSE_SIGNALFD -DUSE_TIMERFD -D_GNU_SOURCE -DTGT_VERSION=\\"1.0.63\\" -DBSDIR=\\"${libdir}/backing-store\\"'
>
> @@ -33,9 +39,21 @@ do_install() {
>      if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
>          install -d ${D}${sysconfdir}/init.d
>          install -m 0755 ${WORKDIR}/tgtd.init ${D}${sysconfdir}/init.d/tgtd
> +    elif ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/tgtd.service ${D}${systemd_unitdir}/system/tgtd.service
> +        install -d ${D}${sysconfdir}/sysconfig
> +        install -m 0644 ${WORKDIR}/tgtd ${D}${sysconfdir}/sysconfig/tgtd
> +        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/tgtd.service
> +        sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' ${D}${systemd_unitdir}/system/tgtd.service
> +        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/tgtd.service
>      fi
>  }
>
> +FILES_${PN} += "${systemd_unitdir}/system/tgtd.service \
> +                ${sysconfdir}/sysconfig/tgtd \
> +"
> +
>  RDEPENDS_${PN} = " \
>      bash \
>      libaio \
> --
> 2.7.4
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

