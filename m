Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3428FE008EC; Mon,  3 Nov 2014 05:05:41 -0800 (PST)
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
	*      [209.85.215.48 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53D20E008BA
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Nov 2014 05:05:33 -0800 (PST)
Received: by mail-la0-f48.google.com with SMTP id gq15so9232934lab.7
	for <meta-virtualization@yoctoproject.org>;
	Mon, 03 Nov 2014 05:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=4FNhaMptoXNl7jKU54qw6MyxpXb9skiBl3/juUDLFqI=;
	b=lL+1TdLUNyzs69dLvG2hdbbVSMDloqAzcghyoZQ6f1VNnl6x5OmYSNJ1PWs9tdAGJO
	cTpUalN+mFmGHQm8RcMwm0qWI/uZy50avEZY1QHXX7fj2desVWnluxV85pTbcBctzQs3
	lEQMYKKtbU55IqRNH511JfHWrp/Wc3Sx5kA1/S+eRMlN7HbZYMa+QvRFvVjdAj8O3wx5
	5XmpUXDg7/lTkg17FBqA0k/0ulhYv/4OakL0ZONBsr4iBiFhVibF+J54KZ2/rDLKvcor
	rSbDX62EDafA1LFAxk+hoN9VOTUvQ/NplxZg4r7nOdQxWZLoy0FuBQdEL2E3bCkG+ObO
	EKjg==
MIME-Version: 1.0
X-Received: by 10.152.26.8 with SMTP id h8mr50843702lag.39.1415019932219; Mon,
	03 Nov 2014 05:05:32 -0800 (PST)
Received: by 10.112.4.168 with HTTP; Mon, 3 Nov 2014 05:05:32 -0800 (PST)
In-Reply-To: <1414081914-14838-1-git-send-email-bogdan.purcareata@freescale.com>
References: <1414081914-14838-1-git-send-email-bogdan.purcareata@freescale.com>
Date: Mon, 3 Nov 2014 08:05:32 -0500
Message-ID: <CADkTA4OUYXsxpXOxHf-zFKrpZ7QBkDsc8ZdmaaZ651V9CuGv2Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bogdan Purcareata <bogdan.purcareata@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: add unprivileged Busybox containers support
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
X-List-Received-Date: Mon, 03 Nov 2014 13:05:41 -0000
Content-Type: text/plain; charset=UTF-8

Sorry for the delay .. I thought I had merged this.

This is now merged and in the tree.

Bruce

On Thu, Oct 23, 2014 at 12:31 PM, Bogdan Purcareata
<bogdan.purcareata@freescale.com> wrote:
> Integrate 2 upstream patches that enable creating unprivileged Busybox
> containers.
>
> Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> ---
>  ...sybox_template_mount_fstab_when_available.patch |   32 +++++++
>  ...plate_support_for_unprivileged_containers.patch |   92 ++++++++++++++++++++
>  recipes-containers/lxc/lxc_1.0.6.bb                |    3 +
>  3 files changed, 127 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/busybox_template_mount_fstab_when_available.patch
>  create mode 100644 recipes-containers/lxc/files/busybox_template_support_for_unprivileged_containers.patch
>
> diff --git a/recipes-containers/lxc/files/busybox_template_mount_fstab_when_available.patch b/recipes-containers/lxc/files/busybox_template_mount_fstab_when_available.patch
> new file mode 100644
> index 0000000..74b4fdf
> --- /dev/null
> +++ b/recipes-containers/lxc/files/busybox_template_mount_fstab_when_available.patch
> @@ -0,0 +1,32 @@
> +From 12c3b43fbeacd9cc471adf565ecea3263e37e353 Mon Sep 17 00:00:00 2001
> +From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +Date: Mon, 20 Oct 2014 15:56:54 -0400
> +Subject: [PATCH] busybox template: mount fstab when available
> +
> +When running unprivileged, lxc-create will touch a fstab file, with bind-mounts
> +for the ttys and other devices. Add this entry in the container config.
> +
> +Upstream-Status: Accepted
> +[https://github.com/lxc/lxc/commit/12c3b43fbeacd9cc471adf565ecea3263e37e353]
> +
> +Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +Acked-by: Serge E. Hallyn <serge.hallyn@ubuntu.com>
> +---
> + templates/lxc-busybox.in | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
> +index ca2dd43..ee54a7a 100644
> +--- a/templates/lxc-busybox.in
> ++++ b/templates/lxc-busybox.in
> +@@ -301,6 +301,10 @@ EOF
> +     done
> +     echo "lxc.mount.entry = /sys/kernel/security sys/kernel/security none ro,bind,optional 0 0" >>$path/config
> +     echo "lxc.mount.auto = proc:mixed sys" >>$path/config
> ++
> ++    if [ -f "$path/fstab" ]; then
> ++        echo "lxc.mount = $path/fstab" >>$path/config
> ++    fi
> + }
> +
> + remap_userns()
> diff --git a/recipes-containers/lxc/files/busybox_template_support_for_unprivileged_containers.patch b/recipes-containers/lxc/files/busybox_template_support_for_unprivileged_containers.patch
> new file mode 100644
> index 0000000..4e9ab74
> --- /dev/null
> +++ b/recipes-containers/lxc/files/busybox_template_support_for_unprivileged_containers.patch
> @@ -0,0 +1,92 @@
> +From a542dd3c1aca8b6674f631d625d888eb13ae3a4d Mon Sep 17 00:00:00 2001
> +From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +Date: Mon, 20 Oct 2014 15:56:53 -0400
> +Subject: [PATCH] busybox template: support for unprivileged containers
> +
> +Apply the changes found in templates/lxc-download to the busybox template as
> +well. Change ownership of the config and fstab files to the unprivileged user,
> +and the ownership of the rootfs to root in the new user namespace.
> +
> +Eliminate the "unsupported for userns" flag.
> +
> +Upstream-Status: Accepted
> +[https://github.com/lxc/lxc/commit/a542dd3c1aca8b6674f631d625d888eb13ae3a4d]
> +
> +Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +Acked-by: Serge E. Hallyn <serge.hallyn@ubuntu.com>
> +---
> + templates/lxc-busybox.in | 36 ++++++++++++++++++++++++++----------
> + 1 file changed, 26 insertions(+), 10 deletions(-)
> +
> +diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
> +index 246e743..ca2dd43 100644
> +--- a/templates/lxc-busybox.in
> ++++ b/templates/lxc-busybox.in
> +@@ -20,15 +20,8 @@
> + # License along with this library; if not, write to the Free Software
> + # Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
> +
> +-# Detect use under userns (unsupported)
> +-for arg in "$@"; do
> +-    [ "$arg" = "--" ] && break
> +-    if [ "$arg" = "--mapped-uid" -o "$arg" = "--mapped-gid" ]; then
> +-        echo "This template can't be used for unprivileged containers." 1>&2
> +-        echo "You may want to try the \"download\" template instead." 1>&2
> +-        exit 1
> +-    fi
> +-done
> ++LXC_MAPPED_UID=
> ++LXC_MAPPED_GID=
> +
> + # Make sure the usual locations are in PATH
> + export PATH=$PATH:/usr/sbin:/usr/bin:/sbin:/bin
> +@@ -310,6 +303,21 @@ EOF
> +     echo "lxc.mount.auto = proc:mixed sys" >>$path/config
> + }
> +
> ++remap_userns()
> ++{
> ++    path=$1
> ++
> ++    if [ -n "$LXC_MAPPED_UID" ] && [ "$LXC_MAPPED_UID" != "-1" ]; then
> ++        chown $LXC_MAPPED_UID $path/config $path/fstab >/dev/null 2>&1
> ++        chown -R root $path/rootfs >/dev/null 2>&1
> ++    fi
> ++
> ++    if [ -n "$LXC_MAPPED_GID" ] && [ "$LXC_MAPPED_GID" != "-1" ]; then
> ++        chgrp $LXC_MAPPED_GID $path/config $path/fstab >/dev/null 2>&1
> ++        chgrp -R root $path/rootfs >/dev/null 2>&1
> ++    fi
> ++}
> ++
> + usage()
> + {
> +     cat <<EOF
> +@@ -318,7 +326,7 @@ EOF
> +     return 0
> + }
> +
> +-options=$(getopt -o hp:n: -l help,rootfs:,path:,name: -- "$@")
> ++options=$(getopt -o hp:n: -l help,rootfs:,path:,name:,mapped-uid:,mapped-gid: -- "$@")
> + if [ $? -ne 0 ]; then
> +     usage $(basename $0)
> +     exit 1
> +@@ -332,6 +340,8 @@ do
> +         -p|--path)      path=$2; shift 2;;
> +         --rootfs)       rootfs=$2; shift 2;;
> +         -n|--name)      name=$2; shift 2;;
> ++        --mapped-uid)   LXC_MAPPED_UID=$2; shift 2;;
> ++        --mapped-gid)   LXC_MAPPED_GID=$2; shift 2;;
> +         --)             shift 1; break ;;
> +         *)              break ;;
> +     esac
> +@@ -374,3 +384,9 @@ if [ $? -ne 0 ]; then
> +     echo "failed to write configuration file"
> +     exit 1
> + fi
> ++
> ++remap_userns $path
> ++if [ $? -ne 0 ]; then
> ++    echo "failed to remap files to user"
> ++    exit 1
> ++fi
> diff --git a/recipes-containers/lxc/lxc_1.0.6.bb b/recipes-containers/lxc/lxc_1.0.6.bb
> index 2d384dd..0805573 100644
> --- a/recipes-containers/lxc/lxc_1.0.6.bb
> +++ b/recipes-containers/lxc/lxc_1.0.6.bb
> @@ -26,7 +26,10 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>         file://runtest.patch \
>         file://run-ptest \
>         file://automake-ensure-VPATH-builds-correctly.patch \
> +       file://busybox_template_mount_fstab_when_available.patch \
> +       file://busybox_template_support_for_unprivileged_containers.patch \
>         "
> +
>  SRC_URI[md5sum] = "4aad3aee84b42faa194e44091d723a3b"
>  SRC_URI[sha256sum] = "fc6bffa750f00daaa92aa33d719c1cc235146aa779ebd2a64a0c24423977cf14"
>
> --
> 1.7.10.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

