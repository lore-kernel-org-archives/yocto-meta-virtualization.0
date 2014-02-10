Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 48972E005B7
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Feb 2014 06:06:30 -0800 (PST)
Received: from [172.16.141.133] (172.16.141.133) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 10 Feb 2014 15:06:27 +0100
Message-ID: <52F8DCE4.8050404@enea.com>
Date: Mon, 10 Feb 2014 15:06:28 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Josep Puigdemont <josep.puigdemont@enea.com>,
	<meta-virtualization@yoctoproject.org>
References: <1392037746-27912-1-git-send-email-josep.puigdemont@enea.com>
In-Reply-To: <1392037746-27912-1-git-send-email-josep.puigdemont@enea.com>
X-Originating-IP: [172.16.141.133]
Subject: Re: [PATCH] lxc: always strdup lxc.rootfs.mount
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
X-List-Received-Date: Mon, 10 Feb 2014 14:06:37 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2014-02-10 14:09, Josep Puigdemont wrote:
> The reason is that the generic code which handles reading lxc.rootfs.moun=
t
> always frees the old value if not NULL. So without this setting
> lxc.rootfs.mount =3D /mnt causes segfault.
>
> This is a backport for lxc-0.9.0 (dora) of the same fix found in
> upstream's master, see commits 54c30e29 and 53f3f048.
>
> Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> ---
>   .../lxc-0.9.0-always-strdup-rootfs-mount.patch     |   27 +++++++++++++=
+++++++
>   recipes-containers/lxc/lxc_0.9.0.bb                |    1 +
>   2 files changed, 28 insertions(+)
>   create mode 100644 recipes-containers/lxc/files/lxc-0.9.0-always-strdup=
-rootfs-mount.patch
>
> diff --git a/recipes-containers/lxc/files/lxc-0.9.0-always-strdup-rootfs-=
mount.patch b/recipes-containers/lxc/files/lxc-0.9.0-always-strdup-rootfs-m=
ount.patch
> new file mode 100644
> index 0000000..3e299d2
> --- /dev/null
> +++ b/recipes-containers/lxc/files/lxc-0.9.0-always-strdup-rootfs-mount.p=
atch
> @@ -0,0 +1,27 @@
> +diff --git a/src/lxc/conf.c b/src/lxc/conf.c
> +index 6b3f318..2f8b9e6 100644
> +--- a/src/lxc/conf.c
> ++++ b/src/lxc/conf.c
> +@@ -2072,7 +2072,12 @@ struct lxc_conf *lxc_conf_init(void)
> + 	new->console.slave =3D -1;
> + 	new->console.name[0] =3D '\0';
> + 	new->maincmd_fd =3D -1;
> +-	new->rootfs.mount =3D default_rootfs_mount;
> ++	new->rootfs.mount =3D strdup(default_rootfs_mount);
> ++	if (!new->rootfs.mount) {
> ++		ERROR("lxc_conf_init : %m");
> ++		free(new);
> ++		return NULL;
> ++	}
> + 	new->kmsg =3D 1;
> + 	lxc_list_init(&new->cgroup);
> + 	lxc_list_init(&new->network);
> +@@ -3084,7 +3089,7 @@ void lxc_conf_free(struct lxc_conf *conf)
> + 		return;
> + 	if (conf->console.path)
> + 		free(conf->console.path);
> +-	if (conf->rootfs.mount !=3D default_rootfs_mount)
> ++	if (conf->rootfs.mount)
> + 		free(conf->rootfs.mount);
> + 	if (conf->rootfs.path)
> + 		free(conf->rootfs.path);
> diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/lxc=
/lxc_0.9.0.bb
> index 8f7736b..fceefff 100644
> --- a/recipes-containers/lxc/lxc_0.9.0.bb
> +++ b/recipes-containers/lxc/lxc_0.9.0.bb
> @@ -26,6 +26,7 @@ SRC_URI =3D "http://linuxcontainers.org/downloads/${PN}=
-${PV}.tar.gz \
>   	file://lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-host=
s.patch \
>       file://lxc-0.9.0-check-when-bind-mounting-libdirs.patch \
>       file://lxc-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch \
> +    file://lxc-0.9.0-always-strdup-rootfs-mount.patch \
>   	"
>   SRC_URI[md5sum] =3D "8552a4479090616f4bc04d8473765fc9"
>   SRC_URI[sha256sum] =3D "1e1767eae6cc5fbf892c0e193d25da420ba19f2db203716=
c38f7cdea3b654120"
>

Reviewed-by: David Nystr=F6m <david.nystrom@enea.com>

Minor nitpicking, please add the branch name in the subject as:
[dora][PATCH]blah for future patches, unless its for master.

Br,
David


