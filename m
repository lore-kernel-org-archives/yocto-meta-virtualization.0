Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5BBE9E00C87; Tue, 20 Nov 2018 13:02:10 -0800 (PST)
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
	*      [209.85.208.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94922E00C80
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Nov 2018 13:02:08 -0800 (PST)
Received: by mail-lj1-f196.google.com with SMTP id t9-v6so2897454ljh.6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Nov 2018 13:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=te2mkUT3AyXxr3/DrrbDMGGS+I20hXmeIgDhfOaSOAI=;
	b=iki9diW+uYiyQyJf4uU3AWsATfUplZSGQFhhoBWPBELh4rhgrDetcV/F/DqAEUGaX2
	U55CPz3/oFaktj8BF4pHPgtcjzOvRdj8e8JKMA4kFjtrMPb1LmDgw0dAiFyjzHpMcKF4
	5szKB0XvqXjWkx/93EUTP1EIJPJDkDK6VkkFLIX7FR6/PGTQzc+AT2n8H/qulN3QPaue
	04AWHDadiZPSkX0gWcInkGSZIJPuOs2o/netKpdMsCxHH6MuQl4BItDHfcpEZTheugPE
	W1dxoxV1/eSSS2JrAkkqTIixsl58Blx1ZoXkcbygqkdUPwasT/MDCOuYmSILqVS4MC4p
	HBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=te2mkUT3AyXxr3/DrrbDMGGS+I20hXmeIgDhfOaSOAI=;
	b=mPRsyE1MgaIeiiEhH9SdoHWHqUEmKweiqIpOI3ABS/3+DVNG83uXpDExIVI0HPQQCN
	aYfvA7CohsvSC1/68bRJhVxuvZ4Mktpczv8b11BoMs0yMr+VOxfJhDEoplgZxangX+Da
	2QoG9xWXKgrG4TNV4WUuyAy/TpklBRlt35gA+AyKDPLFyZOL8S0d2rmmPClLozOY6WJ4
	BDfpiiDmqoeUFJCV/NRJ3ivS9eInf7uRkcJiptUnBWN7O5aAJEPeuA6NqUB2oH2i1Kah
	iyNIu/7ShxuOTY/nMYaTqEHbEVKwfY4jL1Z0JVfLC1fjxrXPMKXB5Noz+r94jZKDs/WB
	TDVg==
X-Gm-Message-State: AGRZ1gKXZBL/Q6ZwOzT8xy54B4nJ8rLeRglBGbilscMqTuiUu9usSDIE
	m0ppCb7YTDXvSDXAqAJqLF89gFZiyO1bm6vo1TU=
X-Google-Smtp-Source: AFSGD/X2jF86pgWtMP6dLF6tieIt+Syyjpe6K/60DG/rFEDYVJz+UF2XNLB6MSNRU3ZpzsW3i6/fHhc5TKaijLLkU5Y=
X-Received: by 2002:a2e:8596:: with SMTP id
	b22-v6mr2227727lji.122.1542747727593; 
	Tue, 20 Nov 2018 13:02:07 -0800 (PST)
MIME-Version: 1.0
References: <1542331875-2822-1-git-send-email-chin.huat.ang@intel.com>
In-Reply-To: <1542331875-2822-1-git-send-email-chin.huat.ang@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 20 Nov 2018 16:01:55 -0500
Message-ID: <CADkTA4PBz4U4po-7BuFQv6Um8fAKPMSk2=JMW-7iN2-L2B+rPA@mail.gmail.com>
To: chin.huat.ang@intel.com
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] docker: fix broken init script
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
X-List-Received-Date: Tue, 20 Nov 2018 21:02:10 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce
On Thu, Nov 15, 2018 at 8:31 PM Chin Huat Ang <chin.huat.ang@intel.com> wrote:
>
> Fix numerous docker.init issues such as missing runtime dependency
> util-linux-unshare, incomplete handling of start/stop etc. operations
> and minor typos.
>
> Signed-off-by: Chin Huat Ang <chin.huat.ang@intel.com>
> ---
>  recipes-containers/docker/docker-ce_git.bb  |  2 +-
>  recipes-containers/docker/docker_git.bb     |  2 +-
>  recipes-containers/docker/files/docker.init | 12 ++++++++----
>  3 files changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
> index 7a41850..caf6d70 100644
> --- a/recipes-containers/docker/docker-ce_git.bb
> +++ b/recipes-containers/docker/docker-ce_git.bb
> @@ -62,7 +62,7 @@ DEPENDS = " \
>  PACKAGES =+ "${PN}-contrib"
>
>  DEPENDS_append_class-target = " lvm2"
> -RDEPENDS_${PN} = "util-linux iptables \
> +RDEPENDS_${PN} = "util-linux util-linux-unshare iptables \
>                    ${@bb.utils.contains('DISTRO_FEATURES', 'aufs', 'aufs-util', '', d)} \
>                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'cgroup-lite', d)} \
>                   "
> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
> index f63cee1..7957808 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -67,7 +67,7 @@ PACKAGECONFIG[seccomp] = "seccomp,,libseccomp"
>  PACKAGES =+ "${PN}-contrib"
>
>  DEPENDS_append_class-target = " lvm2"
> -RDEPENDS_${PN} = "util-linux iptables \
> +RDEPENDS_${PN} = "util-linux util-linux-unshare iptables \
>                    ${@bb.utils.contains('DISTRO_FEATURES', 'aufs', 'aufs-util', '', d)} \
>                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'cgroup-lite', d)} \
>                   "
> diff --git a/recipes-containers/docker/files/docker.init b/recipes-containers/docker/files/docker.init
> index 2e8eb9e..0aea8d0 100644
> --- a/recipes-containers/docker/files/docker.init
> +++ b/recipes-containers/docker/files/docker.init
> @@ -22,7 +22,7 @@
>  # Source function library.
>  . /etc/init.d/functions
>
> -prog="docker"
> +prog="dockerd"
>  unshare=/usr/bin/unshare
>  exec="/usr/bin/$prog"
>  pidfile="/var/run/$prog.pid"
> @@ -40,7 +40,7 @@ start() {
>      if ! [ -f $pidfile ]; then
>          printf "Starting $prog:\t"
>          echo -e "\n$(date)\n" >> $logfile
> -        "$unshare" -m -- $exec daemon $other_args &>> $logfile &
> +        "$unshare" -m -- $exec $other_args &>> $logfile &
>          pid=$!
>          touch $lockfile
>          # wait up to 10 seconds for the pidfile to exist.  see
> @@ -83,7 +83,7 @@ force_reload() {
>  }
>
>  rh_status() {
> -    status -p $pidfile $prog
> +    status $prog
>  }
>
>  rh_status_q() {
> @@ -99,24 +99,28 @@ check_for_cleanup() {
>
>  case "$1" in
>      start)
> +        rh_status_q && exit 0
>          $1
>          ;;
>      stop)
> +        rh_status_q || exit 0
>          $1
>          ;;
>      restart)
>          $1
>          ;;
>      reload)
> +        rh_status_q || exit 7
>          $1
>          ;;
>      force-reload)
>          force_reload
>          ;;
>      status)
> -        status
> +        rh_status
>          ;;
>      condrestart|try-restart)
> +        rh_status_q || exit 0
>          restart
>          ;;
>      *)
> --
> 2.7.4
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

