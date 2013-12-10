Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 29D7FE00785
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Dec 2013 08:30:13 -0800 (PST)
Received: by mail-pd0-f170.google.com with SMTP id g10so7680967pdj.29
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Dec 2013 08:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=GKYzEZICN8zLiIh38nzbP5Yqap75ixNGNGl4dnYoVTw=;
	b=iZn+E0/5BRUHfuVwDOaV87vxeInVc8TcENEom3lWuwAfg1Uu5KjrClEiRMWoVexUD3
	q+Uqk0leMN3GERQ1VcMK4Q8Ym0coFT7pWTyzLx+HKCVAGvfLSk6jiSYRbBee5Iu/DNw1
	aJLuYNeSjY8gk2BO0Oo18b4zHnkqlYRFC5DZXY/1EnHYnDaDGY9CY8egt1S5S/uopb25
	hV1K8LGHD4CGCzNLZS46+GY9/PomuhS9v5TMymqtVewSM5nfytbEJxWWhusdpEUAcA68
	7MbMrtHaMIkc28yjUX8F7ZpdkMFGkKrewxLOt5J0m/Q5NzGil5xv/4LR4eWDh3qxayeh
	UF2w==
MIME-Version: 1.0
X-Received: by 10.66.7.68 with SMTP id h4mr29078335paa.0.1386693012774; Tue,
	10 Dec 2013 08:30:12 -0800 (PST)
Received: by 10.68.12.133 with HTTP; Tue, 10 Dec 2013 08:30:12 -0800 (PST)
In-Reply-To: <1386613971-6107-1-git-send-email-kergoth@gmail.com>
References: <1386613971-6107-1-git-send-email-kergoth@gmail.com>
Date: Tue, 10 Dec 2013 11:30:12 -0500
Message-ID: <CADkTA4NY=KAU3MeBm=cobBOCXZE1KXrB8i6Z5L1Tf-d7FUSvDg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2] lxc: kill use of susv2 'head' args
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
X-List-Received-Date: Tue, 10 Dec 2013 16:30:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 9, 2013 at 1:32 PM, Christopher Larson <kergoth@gmail.com> wrote:
> Without enabling INCLUDE_SUSv2 in busybox, we need to use head's -n argument,
> rather than -#.

Thanks Chris, I've merged and pushed v2.

Bruce

>
> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> ---
>  .../files/lxc-0.9.0-use-susv3-head-arguments.patch | 46 ++++++++++++++++++++++
>  recipes-containers/lxc/lxc_0.9.0.bb                |  1 +
>  2 files changed, 47 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/lxc-0.9.0-use-susv3-head-arguments.patch
>
> diff --git a/recipes-containers/lxc/files/lxc-0.9.0-use-susv3-head-arguments.patch b/recipes-containers/lxc/files/lxc-0.9.0-use-susv3-head-arguments.patch
> new file mode 100644
> index 0000000..86ed7d2
> --- /dev/null
> +++ b/recipes-containers/lxc/files/lxc-0.9.0-use-susv3-head-arguments.patch
> @@ -0,0 +1,46 @@
> +Upstream-status: Pending
> +
> +--- lxc-0.9.0.orig/src/lxc/lxc-checkconfig.in
> ++++ lxc-0.9.0/src/lxc/lxc-checkconfig.in
> +@@ -67,7 +67,7 @@ print_cgroups() {
> +   awk '$1 !~ /#/ && $3 == mp { print $2; } ; END { exit(0); } '  "mp=$1" "$2" ;
> + }
> +
> +-CGROUP_MNT_PATH=`print_cgroups cgroup /proc/self/mounts | head -1`
> ++CGROUP_MNT_PATH=`print_cgroups cgroup /proc/self/mounts | head -n 1`
> + KVER_MAJOR=$($GREP '^# Linux' $CONFIG | \
> +     sed -r 's/.* ([0-9])\.[0-9]{1,2}\.[0-9]{1,3}.*/\1/')
> + if [ "$KVER_MAJOR" = "2" ]; then
> +--- lxc-0.9.0.orig/src/lxc/lxc-netstat.in
> ++++ lxc-0.9.0/src/lxc/lxc-netstat.in
> +@@ -107,7 +107,7 @@ if [ ! -d "$parent_cgroup" ]; then
> +     exit 1
> + fi
> +
> +-pid=$(head -1 $parent_cgroup/$name/tasks)
> ++pid=$(head -n 1 $parent_cgroup/$name/tasks)
> +
> + if [ -z "$pid" ]; then
> +     echo "$(basename $0): no process found for '$name'" >&2
> +--- lxc-0.9.0.orig/templates/lxc-alpine.in
> ++++ lxc-0.9.0/templates/lxc-alpine.in
> +@@ -99,7 +99,7 @@ EOF
> +     if [ "$nics" -eq 1 ] && ! grep -q "^lxc.network.hwaddr" $path/config; then
> +         # see http://sourceforge.net/tracker/?func=detail&aid=3411497&group_id=163076&atid=826303
> +         hwaddr="fe:$(dd if=/dev/urandom bs=8 count=1 2>/dev/null |od -t x8 | \
> +-                      head -1 |awk '{print $2}' | cut -c1-10 |\
> ++                      head -n 1 |awk '{print $2}' | cut -c1-10 |\
> +                       sed 's/\(..\)/\1:/g; s/.$//')"
> +         echo "lxc.network.hwaddr = $hwaddr" >> $path/config
> +     fi
> +--- lxc-0.9.0.orig/templates/lxc-oracle.in
> ++++ lxc-0.9.0/templates/lxc-oracle.in
> +@@ -327,7 +327,7 @@ container_config_create()
> +     # generate a hwaddr for the container with a high mac address
> +     # see http://sourceforge.net/tracker/?func=detail&aid=3411497&group_id=163076&atid=826303
> +     local hwaddr="fe:`dd if=/dev/urandom bs=8 count=1 2>/dev/null |od -t x8 | \
> +-                      head -1 |awk '{print $2}' | cut -c1-10 |\
> ++                      head -n 1 |awk '{print $2}' | cut -c1-10 |\
> +                       sed 's/\(..\)/\1:/g; s/.$//'`"
> +     mkdir -p $cfg_dir || die "unable to create config dir $cfg_dir"
> +     cat <<EOF >> $cfg_dir/config || die "unable to create $cfg_dir/config"
> diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/lxc/lxc_0.9.0.bb
> index 24e0249..4bbc1c1 100644
> --- a/recipes-containers/lxc/lxc_0.9.0.bb
> +++ b/recipes-containers/lxc/lxc_0.9.0.bb
> @@ -27,6 +27,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>         file://lxc-0.9.0-check-when-bind-mounting-libdirs.patch \
>         file://lxc-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch \
>         file://lxc-0.9.0-setup_netdev-re-read-ifindex-in-LXC_NET_PHYS-case.patch \
> +       file://lxc-0.9.0-use-susv3-head-arguments.patch \
>         "
>  SRC_URI[md5sum] = "8552a4479090616f4bc04d8473765fc9"
>  SRC_URI[sha256sum] = "1e1767eae6cc5fbf892c0e193d25da420ba19f2db203716c38f7cdea3b654120"
> --
> 1.8.3.4
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

