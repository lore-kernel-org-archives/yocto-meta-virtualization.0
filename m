Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A9045E004F6; Thu,  7 May 2015 11:14:38 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 06695E00306
	for <meta-virtualization@yoctoproject.org>;
	Thu,  7 May 2015 11:14:35 -0700 (PDT)
Received: by ykec202 with SMTP id c202so13791522yke.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 07 May 2015 11:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=eWqk9JjGhIQq/vnxqJvcBHxVA+2RBjiM6Z7x/S3n5Zs=;
	b=OUeU5+dl+bNt5WldSTSkqr3AIKVious5+Utd6s4HITVXVGdRg0MhukjBdDPoLGTHm8
	Hdd/+Pi5N1fWm7U2/8o6NzFXTgAMV9cotciKOgvugW53ROck9qBTMDgmO/I8tt9p1+jP
	EMLMgxPwAHF+bu5tJHL4ysvgQwroAjldHJQ/bT1EjnDlP0NBhnRqOq3wDqhuSHXs3hvw
	Bjwfm2xn6WIvj/Ca4rGe9pwKgoBuWjt6sPqcY6voJnbvzdq5FWpBoXBHaRLTsMjmuHMr
	R17CjdpC+SGUXSd11q4r/i0df8LXZtzUliuZLLdhhWoEEJpdhYOt1Fzd4JxDtC4uQL7M
	pqXw==
MIME-Version: 1.0
X-Received: by 10.170.172.213 with SMTP id o204mr4466919ykd.123.1431022474399; 
	Thu, 07 May 2015 11:14:34 -0700 (PDT)
Received: by 10.129.109.20 with HTTP; Thu, 7 May 2015 11:14:34 -0700 (PDT)
In-Reply-To: <1430761918-340-1-git-send-email-bogdan.purcareata@freescale.com>
References: <1430761918-340-1-git-send-email-bogdan.purcareata@freescale.com>
Date: Thu, 7 May 2015 14:14:34 -0400
Message-ID: <CADkTA4NbcS_Wtt2RE4aL3yr1ZCKuJogXc7LSRspOCvosCVwZhQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bogdan Purcareata <bogdan.purcareata@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: Add OpenSSH support for Busybox containers
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
X-List-Received-Date: Thu, 07 May 2015 18:14:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks!

merged to master.

Bruce

On Mon, May 4, 2015 at 1:51 PM, Bogdan Purcareata
<bogdan.purcareata@freescale.com> wrote:
> Add command line parameter to create Busybox containers
> with OpenSSH support. As a prerequisite, OpenSSH needs
> to be installed on the host system.
>
> Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> ---
>  .../files/lxc-busybox-add-OpenSSH-support.patch    | 246 +++++++++++++++=
++++++
>  .../files/make-some-OpenSSH-tools-optional.patch   |  49 ++++
>  recipes-containers/lxc/lxc_1.0.7.bb                |   2 +
>  3 files changed, 297 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/lxc-busybox-add-OpenSSH-=
support.patch
>  create mode 100644 recipes-containers/lxc/files/make-some-OpenSSH-tools-=
optional.patch
>
> diff --git a/recipes-containers/lxc/files/lxc-busybox-add-OpenSSH-support=
.patch b/recipes-containers/lxc/files/lxc-busybox-add-OpenSSH-support.patch
> new file mode 100644
> index 0000000..f2f332c
> --- /dev/null
> +++ b/recipes-containers/lxc/files/lxc-busybox-add-OpenSSH-support.patch
> @@ -0,0 +1,246 @@
> +From ed52814c776963efdcc9dcda1ec26fc09930ef93 Mon Sep 17 00:00:00 2001
> +From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +Date: Wed, 22 Apr 2015 14:53:32 +0000
> +Subject: [PATCH] lxc-busybox: add OpenSSH support
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Add an additional template parameter for SSH support in the container. C=
urrently
> +this can be implemented using the Dropbear or OpenSSH utility. The respe=
ctive
> +tool needs to be available on the host Linux.
> +
> +If the parameter is omitted, the template will look for the Dropbear uti=
lity on
> +the host and install it if it is available (legacy behavior).
> +
> +Adding OpenSSH support has been done following the model in the lxc-sshd
> +template.
> +
> +Upstream-status: Accepted
> +[https://github.com/lxc/lxc/commit/ed52814c776963efdcc9dcda1ec26fc09930e=
f93]
> +
> +Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +Acked-by: St=C3=A9phane Graber <stgraber@ubuntu.com>
> +---
> + templates/lxc-busybox.in | 169 ++++++++++++++++++++++++++++++++++++++--=
-------
> + 1 file changed, 139 insertions(+), 30 deletions(-)
> +
> +diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
> +index 7e05bd6..95961a3 100644
> +--- a/templates/lxc-busybox.in
> ++++ b/templates/lxc-busybox.in
> +@@ -22,6 +22,7 @@
> +
> + LXC_MAPPED_UID=3D
> + LXC_MAPPED_GID=3D
> ++SSH=3D
> +
> + # Make sure the usual locations are in PATH
> + export PATH=3D$PATH:/usr/sbin:/usr/bin:/sbin:/bin
> +@@ -160,6 +161,116 @@ EOF
> +     return $res
> + }
> +
> ++install_dropbear()
> ++{
> ++    # copy dropbear binary
> ++    cp $(which dropbear) $rootfs/usr/sbin
> ++    if [ $? -ne 0 ]; then
> ++        echo "Failed to copy dropbear in the rootfs"
> ++        return 1
> ++    fi
> ++
> ++    # make symlinks to various ssh utilities
> ++    utils=3D"\
> ++        $rootfs/usr/bin/dbclient \
> ++        $rootfs/usr/bin/scp \
> ++        $rootfs/usr/bin/ssh \
> ++        $rootfs/usr/sbin/dropbearkey \
> ++        $rootfs/usr/sbin/dropbearconvert \
> ++    "
> ++    echo $utils | xargs -n1 ln -s /usr/sbin/dropbear
> ++
> ++    # add necessary config files
> ++    mkdir $rootfs/etc/dropbear
> ++    dropbearkey -t rsa -f $rootfs/etc/dropbear/dropbear_rsa_host_key > =
/dev/null 2>&1
> ++    dropbearkey -t dss -f $rootfs/etc/dropbear/dropbear_dss_host_key > =
/dev/null 2>&1
> ++
> ++    echo "'dropbear' ssh utility installed"
> ++
> ++    return 0
> ++}
> ++
> ++install_openssh()
> ++{
> ++    # tools to be installed
> ++    server_utils=3D"sshd"
> ++    client_utils=3D"\
> ++        ssh \
> ++        scp \
> ++        sftp \
> ++        ssh-add \
> ++        ssh-agent \
> ++        ssh-keygen \
> ++        ssh-keyscan \
> ++        ssh-argv0 \
> ++        ssh-copy-id \
> ++        "
> ++
> ++    # new folders used by ssh
> ++    ssh_tree=3D"\
> ++$rootfs/etc/ssh \
> ++$rootfs/var/empty/sshd \
> ++$rootfs/var/lib/empty/sshd \
> ++$rootfs/var/run/sshd \
> ++"
> ++
> ++    # create folder structure
> ++    mkdir -p $ssh_tree
> ++    if [ $? -ne 0 ]; then
> ++        return 1
> ++    fi
> ++
> ++    # copy binaries
> ++    for bin in $server_utils $client_utils; do
> ++        tool_path=3D`which $bin`
> ++        cp $tool_path $rootfs/$tool_path
> ++        if [ $? -ne 0 ]; then
> ++            echo "Unable to copy $tool_path in the rootfs"
> ++            return 1
> ++        fi
> ++    done
> ++
> ++    # add user and group
> ++    cat <<EOF >> $rootfs/etc/passwd
> ++sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
> ++EOF
> ++
> ++    cat <<EOF >> $rootfs/etc/group
> ++sshd:x:74:
> ++EOF
> ++
> ++    # generate container keys
> ++    ssh-keygen -t rsa -N "" -f $rootfs/etc/ssh/ssh_host_rsa_key >/dev/n=
ull 2>&1
> ++    ssh-keygen -t dsa -N "" -f $rootfs/etc/ssh/ssh_host_dsa_key >/dev/n=
ull 2>&1
> ++
> ++    # by default setup root password with no password
> ++    cat <<EOF > $rootfs/etc/ssh/sshd_config
> ++Port 22
> ++Protocol 2
> ++HostKey /etc/ssh/ssh_host_rsa_key
> ++HostKey /etc/ssh/ssh_host_dsa_key
> ++UsePrivilegeSeparation yes
> ++KeyRegenerationInterval 3600
> ++ServerKeyBits 768
> ++SyslogFacility AUTH
> ++LogLevel INFO
> ++LoginGraceTime 120
> ++PermitRootLogin yes
> ++StrictModes yes
> ++RSAAuthentication yes
> ++PubkeyAuthentication yes
> ++IgnoreRhosts yes
> ++RhostsRSAAuthentication no
> ++HostbasedAuthentication no
> ++PermitEmptyPasswords yes
> ++ChallengeResponseAuthentication no
> ++EOF
> ++
> ++    echo "'OpenSSH' utility installed"
> ++
> ++    return 0
> ++}
> ++
> + configure_busybox()
> + {
> +     rootfs=3D$1
> +@@ -230,34 +341,6 @@ EOF
> +     lxc-unshare -s MOUNT -- /bin/sh < $CHPASSWD_FILE
> +     rm $CHPASSWD_FILE
> +
> +-    # add ssh functionality if dropbear package available on host
> +-    which dropbear >/dev/null 2>&1
> +-    if [ $? -eq 0 ]; then
> +-        # copy dropbear binary
> +-        cp $(which dropbear) $rootfs/usr/sbin
> +-        if [ $? -ne 0 ]; then
> +-            echo "Failed to copy dropbear in the rootfs"
> +-            return 1
> +-        fi
> +-
> +-        # make symlinks to various ssh utilities
> +-        utils=3D"\
> +-            $rootfs/usr/bin/dbclient \
> +-            $rootfs/usr/bin/scp \
> +-            $rootfs/usr/bin/ssh \
> +-            $rootfs/usr/sbin/dropbearkey \
> +-            $rootfs/usr/sbin/dropbearconvert \
> +-        "
> +-        echo $utils | xargs -n1 ln -s /usr/sbin/dropbear
> +-
> +-        # add necessary config files
> +-        mkdir $rootfs/etc/dropbear
> +-        dropbearkey -t rsa -f $rootfs/etc/dropbear/dropbear_rsa_host_ke=
y > /dev/null 2>&1
> +-        dropbearkey -t dss -f $rootfs/etc/dropbear/dropbear_dss_host_ke=
y > /dev/null 2>&1
> +-
> +-        echo "'dropbear' ssh utility installed"
> +-    fi
> +-
> +     return 0
> + }
> +
> +@@ -315,12 +398,12 @@ remap_userns()
> + usage()
> + {
> +     cat <<EOF
> +-$1 -h|--help -p|--path=3D<path>
> ++$1 -h|--help -p|--path=3D<path> -s|--ssh=3D{dropbear,openssh}
> + EOF
> +     return 0
> + }
> +
> +-options=3D$(getopt -o hp:n: -l help,rootfs:,path:,name:,mapped-uid:,map=
ped-gid: -- "$@")
> ++options=3D$(getopt -o hp:n:s: -l help,rootfs:,path:,name:,mapped-uid:,m=
apped-gid:,ssh: -- "$@")
> + if [ $? -ne 0 ]; then
> +     usage $(basename $0)
> +     exit 1
> +@@ -336,6 +419,7 @@ do
> +         -n|--name)      name=3D$2; shift 2;;
> +         --mapped-uid)   LXC_MAPPED_UID=3D$2; shift 2;;
> +         --mapped-gid)   LXC_MAPPED_GID=3D$2; shift 2;;
> ++        -s|--ssh)       SSH=3D$2; shift 2;;
> +         --)             shift 1; break ;;
> +         *)              break ;;
> +     esac
> +@@ -384,3 +468,28 @@ if [ $? -ne 0 ]; then
> +     echo "failed to remap files to user"
> +     exit 1
> + fi
> ++
> ++if [ -n "$SSH" ]; then
> ++    case "$SSH" in
> ++        "dropbear")
> ++            install_dropbear
> ++            if [ $? -ne 0 ]; then
> ++                echo "Unable to install 'dropbear' ssh utility"
> ++                exit 1
> ++            fi ;;
> ++        "openssh")
> ++            install_openssh
> ++            if [ $? -ne 0 ]; then
> ++                echo "Unable to install 'OpenSSH' utility"
> ++                exit 1
> ++            fi ;;
> ++        *)
> ++            echo "$SSH: unrecognized ssh utility"
> ++            exit 1
> ++    esac
> ++else
> ++    which dropbear >/dev/null 2>&1
> ++    if [ $? -eq 0 ]; then
> ++        install_dropbear
> ++    fi
> ++fi
> +--
> +2.1.4
> +
> diff --git a/recipes-containers/lxc/files/make-some-OpenSSH-tools-optiona=
l.patch b/recipes-containers/lxc/files/make-some-OpenSSH-tools-optional.pat=
ch
> new file mode 100644
> index 0000000..2d28788
> --- /dev/null
> +++ b/recipes-containers/lxc/files/make-some-OpenSSH-tools-optional.patch
> @@ -0,0 +1,49 @@
> +From 34be0d3cd8c4eaca9929470bc8bce5e74975bccf Mon Sep 17 00:00:00 2001
> +From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +Date: Thu, 23 Apr 2015 08:33:00 +0000
> +Subject: [PATCH] lxc-busybox: make some OpenSSH tools optional
> +
> +Currently, when installing OpenSSH in a Busybox container, the template =
searches
> +for all the OpenSSH client binaries available in the Debian distro packa=
ge. The
> +included tools might differ from distro to distro, so make part of the t=
ools
> +optional. The mandatory tools, without which installing OpenSSH fails, a=
re
> +"sshd" for the server and "ssh" and "scp" for the client.
> +
> +Upstream-Status: Submitted
> +[https://lists.linuxcontainers.org/pipermail/lxc-devel/2015-April/011696=
.html]
> +
> +Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +---
> + templates/lxc-busybox.in | 9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
> +index 95961a3..17a3006 100644
> +--- a/templates/lxc-busybox.in
> ++++ b/templates/lxc-busybox.in
> +@@ -197,6 +197,8 @@ install_openssh()
> +     client_utils=3D"\
> +         ssh \
> +         scp \
> ++        "
> ++    client_optional_utils=3D"\
> +         sftp \
> +         ssh-add \
> +         ssh-agent \
> +@@ -230,6 +232,13 @@ $rootfs/var/run/sshd \
> +         fi
> +     done
> +
> ++    for bin in $client_optional_utils; do
> ++        tool_path=3D`which $bin`
> ++        if [ $? -eq 0 ]; then
> ++            cp $tool_path $rootfs/$tool_path
> ++        fi
> ++    done
> ++
> +     # add user and group
> +     cat <<EOF >> $rootfs/etc/passwd
> + sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
> +--
> +2.1.4
> +
> diff --git a/recipes-containers/lxc/lxc_1.0.7.bb b/recipes-containers/lxc=
/lxc_1.0.7.bb
> index 0da1e37..f79ba76 100644
> --- a/recipes-containers/lxc/lxc_1.0.7.bb
> +++ b/recipes-containers/lxc/lxc_1.0.7.bb
> @@ -32,6 +32,8 @@ SRC_URI =3D "http://linuxcontainers.org/downloads/${BPN=
}-${PV}.tar.gz \
>         file://lxc-busybox-use-lxc.rebootsignal-SIGTERM.patch \
>         file://ppc-add-seccomp-support-for-lxc.patch \
>         file://lxc-fix-B-S.patch \
> +       file://lxc-busybox-add-OpenSSH-support.patch \
> +       file://make-some-OpenSSH-tools-optional.patch \
>         "
>
>  SRC_URI[md5sum] =3D "b48f468a9bef0e4e140dd723f0a65ad0"
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

