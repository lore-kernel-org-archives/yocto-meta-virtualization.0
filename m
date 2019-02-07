Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1D8BEE00C08; Thu,  7 Feb 2019 07:03:34 -0800 (PST)
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
	*      [209.85.219.175 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (asselsm[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
	[209.85.219.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2FF9E00C08
	for <meta-virtualization@yoctoproject.org>;
	Thu,  7 Feb 2019 07:03:31 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id 7so32734ybp.13
	for <meta-virtualization@yoctoproject.org>;
	Thu, 07 Feb 2019 07:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=n6JzQWwMdejfRGPRLeDtUl8rYnr0yIyF+yY2SLkkYqE=;
	b=YvAb4TZ158VTlELP9bJCpuS2MkaXj/BJuxVhK2mXSCkPb1ejhCR8ARBzRE/dYyenEK
	h1zWD6bwtRmTvrKHBcPFiBTdSZR2+c8tUl543/aItY2Y3oN92byjPYLtIcORMKOPWXbq
	ItnaEaTzXUK+GZluJWoHBTCIc6GdDreB48i4Ee7tcFCz1ZDs1PujScJ9+zqUQ9IK/ayP
	Bm3mwlSHABMiLchFtcYZJbzFLpORBZiboKX7kZ+UKGY2pzTWOXJwZtvjaGkuJzCsZ1eF
	7wDv9sG89V1BSLIfl/HUH2dOyupbcj7ZCgMq9s/BaFMpAj8iRIwqcRjPXBGw7Q7XYd4c
	IiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=n6JzQWwMdejfRGPRLeDtUl8rYnr0yIyF+yY2SLkkYqE=;
	b=UWWNwyLcI2ipV7wUTkFw4I79MIiwMmgTkhkpXR1IvUGqYU/qZlnL3klk9clOrehrkp
	0ZwWChbu4kxG3ZtdHJytFibDwQrvLuzI8B2t3paYHa7VUQJTM004PPbxx4EkqLS6+rIS
	99zLmCY87WMeNAqi9UN5nCG+42IvT+p9Sbu1gdIO3vbBUB21/wa4vMAuHRhmOY5MX0Nk
	txhbztzctOq/yL1hEwjx99+gZZHUWVcumOJlOX61mX1U6JLLZW+B1z1Ygii+33oNk4PD
	YK1ppVps0aQ8O1z43qrUa+vIJG9tNVMMMQ+gmIv4g6saZD9+yVoPRPN3Fn48b7kT+keM
	orSQ==
X-Gm-Message-State: AHQUAuYRgV/Um0pjgu1JWMAfR0nQc/Sqw6ME7RQQ073O3s8WpwNxKNn2
	rbvs8JA3o+l/LwrachwqzG13cUglRNv16i+8VOM=
X-Google-Smtp-Source: AHgI3IZsVKR0ioKa6HIzvgwKWkAVN9sjIJuc/Gk6OAZn10t1hSlsWmiGIh208IjSCJeJLmIL82pIqWM4DmJeHr/1u+w=
X-Received: by 2002:a25:860e:: with SMTP id y14mr13532345ybk.390.1549551810478;
	Thu, 07 Feb 2019 07:03:30 -0800 (PST)
MIME-Version: 1.0
References: <283D8E4691BA2F4EADBC70DF0256D7A302DB5C5549@UM-EXMBX02.comm.ad.roke.co.uk>
In-Reply-To: <283D8E4691BA2F4EADBC70DF0256D7A302DB5C5549@UM-EXMBX02.comm.ad.roke.co.uk>
From: Mark Asselstine <asselsm@gmail.com>
Date: Thu, 7 Feb 2019 10:03:19 -0500
Message-ID: <CAPuovEKqoeHKT2d4TbV1qs6ZjWwuoHLpx4h3keVBPbvKQegpaw@mail.gmail.com>
To: "Coy, Russell" <russell.coy@roke.co.uk>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Adding Docker to NXP Image fails to execute run on target
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
X-List-Received-Date: Thu, 07 Feb 2019 15:03:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 1, 2019 at 10:31 AM Coy, Russell <russell.coy@roke.co.uk> wrote=
:
>
> Hello all,
>
> I am trying to add Docker to an image built under Yocto and hence am atte=
mpting to use the meta-virtualization layer.
>
> The target processor is an NXP imx8mq evk board and I am basing everythin=
g on the NXP BSP v4.9.51, which is based on Yocto morty.
>
> I have git cloned the morty branch of the meta-virtualization layer to th=
e top level of our Yocto project and added the layer to the build/bblayers.=
conf file and added DISTRO_FEATURES_append =3D " virtualization" to the bui=
ld/local.conf file. I have a custom layer with a custom image (based on cor=
e-image) that includes docker (i.e. IMAGE_INSTALL +=3D " docker=E2=80=9D). =
A complete re-build of the image using bitbake is successful, and when the =
image is transferred to the target (on an sd card) and booted, the docker d=
aemon starts up OK. However if I then try running =E2=80=9Cdocker run hello=
-world=E2=80=9D to test out the installation, it will pull the hello-world =
image, but fails with a daemon error:
>
> Unable to find image 'hello-world:latest' locally
>
> latest: Pulling from library/hello-world
>
> 3b4173355427: Pulling fs layer
>
> 3b4173355427: Verifying Checksum
>
> 3b4173355427: Download complete
>
> 3b4173355427: Pull complete
>
> Digest: sha256:2557e3c07ed1e38f26e389462d03ed943586f744621577a99efb77324b=
0fe535
>
> Status: Downloaded newer image for hello-world:latest
>
> docker: Error response from daemon: operation not supported.

This is what you need to focus on. Run docker with '--debug' review
logs... you need to determine what operation is not supported.

If after doing this you still can't determine what is wrong I usually
recommend you get a known working configuration up and running which
you can compare against. In this case configure another build, setup
the bblayers.conf and setup your local.conf with
---
MACHINE =3D "qemux86-64"
DISTRO_FEATURES_append =3D " virtualization"
IMAGE_INSTALL_append =3D "docker kernel-module-xt-conntrack
kernel-module-nf-nat kernel-module-xt-addrtype"

KERNEL_MODULE_AUTOLOAD +=3D "xt_conntrack"
KERNEL_MODULE_AUTOLOAD +=3D "xt_addrtype"

DISTRO_FEATURES_append =3D " systemd"
DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"
VIRTUAL-RUNTIME_init_manager =3D "systemd"
VIRTUAL-RUNTIME_initscripts =3D "systemd-compat-units"
---

Run the image in QEMU and you should be able to run get the hello
world container running. Then you can compare your non-working case
with the working case.

Mark


>
> See 'docker run --help'.
>
> Other images give similar results (e.g. busybox or alpine).
>
> It seems that the pull works, and images are downloaded OK, but they do n=
ot run.
>
> I=E2=80=99d be grateful if you have any advice on how to get this branch =
of docker working?
>
> For information:
>
> =E2=80=9Cdocker info=E2=80=9D gives:
>
> Containers: 0
>
> Running: 0
>
> Paused: 0
>
> Stopped: 0
>
> Images: 1
>
> Server Version: 1.12.5
>
> Storage Driver: overlay
>
> Backing Filesystem: extfs
>
> Logging Driver: json-file
>
> Cgroup Driver: cgroupfs
>
> Plugins:
>
> Volume: local
>
> Network: host bridge overlay null
>
> Swarm: inactive
>
> Runtimes: runc
>
> Default Runtime: runc
>
> Security Options:
>
> Kernel Version: 4.9.51-imx_4.9.51_imx8m_ga+g6df7474
>
> Operating System: NXP i.MX Release Distro 4.9.51-mx8-ga (morty)
>
> OSType: linux
>
> Architecture: aarch64
>
> CPUs: 4
>
> Total Memory: 2.928 GiB
>
> Name: Test-imx8
>
> ID: L4G3:4SLL:UO75:25FS:6OO6:NOPG:SGF7:DXVC:GN5P:7DZK:4O2D:3K4L
>
> Docker Root Dir: /var/lib/docker
>
> Debug Mode (client): false
>
> Debug Mode (server): false
>
> Registry: https://index.docker.io/v1/
>
> Insecure Registries:
>
> http://localhost:5000
>
> 127.0.0.0/8
>
> Downloading and running =E2=80=9Ccheck-config.sh=E2=80=9D gives:
>
> info: reading kernel config from /proc/config.gz ...
>
> Generally Necessary:
>
> - cgroup hierarchy: properly mounted [/sys/fs/cgroup]
>
> - CONFIG_NAMESPACES: enabled
>
> - CONFIG_NET_NS: enabled
>
> - CONFIG_PID_NS: enabled
>
> - CONFIG_IPC_NS: enabled
>
> - CONFIG_UTS_NS: enabled
>
> - CONFIG_CGROUPS: enabled
>
> - CONFIG_CGROUP_CPUACCT: enabled
>
> - CONFIG_CGROUP_DEVICE: enabled
>
> - CONFIG_CGROUP_FREEZER: missing
>
> - CONFIG_CGROUP_SCHED: enabled
>
> - CONFIG_CPUSETS: enabled
>
> - CONFIG_MEMCG: enabled
>
> - CONFIG_KEYS: enabled
>
> - CONFIG_VETH: enabled (as module)
>
> - CONFIG_BRIDGE: enabled (as module)
>
> - CONFIG_BRIDGE_NETFILTER: enabled (as module)
>
> - CONFIG_NF_NAT_IPV4: enabled (as module)
>
> - CONFIG_IP_NF_FILTER: enabled (as module)
>
> - CONFIG_IP_NF_TARGET_MASQUERADE: enabled (as module)
>
> - CONFIG_NETFILTER_XT_MATCH_ADDRTYPE: enabled (as module)
>
> - CONFIG_NETFILTER_XT_MATCH_CONNTRACK: enabled (as module)
>
> - CONFIG_NETFILTER_XT_MATCH_IPVS: missing
>
> - CONFIG_IP_NF_NAT: enabled (as module)
>
> - CONFIG_NF_NAT: enabled (as module)
>
> - CONFIG_NF_NAT_NEEDED: enabled
>
> - CONFIG_POSIX_MQUEUE: enabled
>
> Optional Features:
>
> - CONFIG_USER_NS: enabled
>
> - CONFIG_SECCOMP: enabled
>
> - CONFIG_CGROUP_PIDS: enabled
>
> - CONFIG_MEMCG_SWAP: enabled
>
> - CONFIG_MEMCG_SWAP_ENABLED: enabled
>
>     (cgroup swap accounting is currently enabled)
>
> - CONFIG_BLK_CGROUP: enabled
>
> - CONFIG_BLK_DEV_THROTTLING: missing
>
> - CONFIG_IOSCHED_CFQ: enabled
>
> - CONFIG_CFQ_GROUP_IOSCHED: missing
>
> - CONFIG_CGROUP_PERF: enabled
>
> - CONFIG_CGROUP_HUGETLB: enabled
>
> - CONFIG_NET_CLS_CGROUP: missing
>
> - CONFIG_CGROUP_NET_PRIO: missing
>
> - CONFIG_CFS_BANDWIDTH: missing
>
> - CONFIG_FAIR_GROUP_SCHED: enabled
>
> - CONFIG_RT_GROUP_SCHED: missing
>
> - CONFIG_IP_NF_TARGET_REDIRECT: missing
>
> - CONFIG_IP_VS: missing
>
> - CONFIG_IP_VS_NFCT: missing
>
> - CONFIG_IP_VS_PROTO_TCP: missing
>
> - CONFIG_IP_VS_PROTO_UDP: missing
>
> - CONFIG_IP_VS_RR: missing
>
> - CONFIG_EXT3_FS: enabled
>
> - CONFIG_EXT3_FS_XATTR: missing
>
> - CONFIG_EXT3_FS_POSIX_ACL: missing
>
> - CONFIG_EXT3_FS_SECURITY: missing
>
>     (enable these ext3 configs if you are using ext3 as backing filesyste=
m)
>
> - CONFIG_EXT4_FS: enabled
>
> - CONFIG_EXT4_FS_POSIX_ACL: enabled
>
> - CONFIG_EXT4_FS_SECURITY: missing
>
>     enable these ext4 configs if you are using ext4 as backing filesystem
>
> - Network Drivers:
>
>   - "overlay":
>
>     - CONFIG_VXLAN: missing
>
>       Optional (for encrypted networks):
>
>       - CONFIG_CRYPTO: enabled
>
>       - CONFIG_CRYPTO_AEAD: enabled
>
>       - CONFIG_CRYPTO_GCM: enabled
>
>       - CONFIG_CRYPTO_SEQIV: enabled
>
>       - CONFIG_CRYPTO_GHASH: enabled
>
>       - CONFIG_XFRM: enabled
>
>       - CONFIG_XFRM_USER: missing
>
>       - CONFIG_XFRM_ALGO: missing
>
>       - CONFIG_INET_ESP: missing
>
>       - CONFIG_INET_XFRM_MODE_TRANSPORT: enabled
>
>   - "mipvlan":
>
>     - CONFIG_IPVLAN: missing
>
>   - "macvlan":
>
>     - CONFIG_MACVLAN: enabled (as module)
>
>     - CONFIG_DUMMY: missing
>
>   - "ftp,tftp client in container":
>
>     - CONFIG_NF_NAT_FTP: missing
>
>     - CONFIG_NF_CONNTRACK_FTP: missing
>
>     - CONFIG_NF_NAT_TFTP: missing
>
>     - CONFIG_NF_CONNTRACK_TFTP: missing
>
> - Storage Drivers:
>
>   - "aufs":
>
>     - CONFIG_AUFS_FS: missing
>
>   - "btrfs":
>
>     - CONFIG_BTRFS_FS: enabled (as module)
>
>     - CONFIG_BTRFS_FS_POSIX_ACL: enabled
>
>   - "devicemapper":
>
>     - CONFIG_BLK_DEV_DM: missing
>
>     - CONFIG_DM_THIN_PROVISIONING: missing
>
>   - "overlay":
>
>     - CONFIG_OVERLAY_FS: enabled (as module)
>
>   - "zfs":
>
>     - /dev/zfs: missing
>
>     - zfs command: missing
>
>     - zpool command: missing
>
> Limits:
>
> - /proc/sys/kernel/keys/root_maxkeys: 1000000
>
> =E2=80=9Cdocker =E2=80=93version=E2=80=9D gives:
>
> Docker version 1.12.5, build 7392c3b
>
> From the config output, I see that some variables are not enabled. Could =
this be an issue?
>
> Kind regards,
>
> Russell
>
>
>
> Follow Us: LinkedIn | Twitter | Facebook
>
> Roke Manor Research Limited, Romsey, Hampshire, SO51 0ZN, United Kingdom.=
 Part of the Chemring Group. Registered in England & Wales. Registered No: =
00267550. The information contained in this e-mail and any attachments is p=
roprietary to Roke Manor Research Limited and must not be passed to any thi=
rd party without permission. This communication is for information only and=
 shall not create or change any contractual relationship.
> www.roke.co.uk
>
> ________________________________
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

