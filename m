Return-Path: <russell.coy@roke.co.uk>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3B7A8E00CB0; Fri,  1 Feb 2019 07:31:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [207.82.80.167 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from eu-smtp-delivery-167.mimecast.com
	(eu-smtp-delivery-167.mimecast.com [207.82.80.167])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4FBDAE00C50
	for <meta-virtualization@yoctoproject.org>;
	Fri,  1 Feb 2019 07:31:32 -0800 (PST)
Received: from UM-EXCAS02.comm.ad.roke.co.uk (salt-ext.roke.co.uk
	[109.207.29.2]) (Using TLS) by relay.mimecast.com with ESMTP id
	uk-mta-142-L9EDqiz4MfKlAyVEazHl8Q-1; Fri, 01 Feb 2019 15:31:30 +0000
Received: from UM-EXMBX02.comm.ad.roke.co.uk ([fe80::867:2e75:af6e:4b7f]) by
	UM-EXCAS02.comm.ad.roke.co.uk ([::1]) with mapi id 14.03.0319.002;
	Fri, 1 Feb 2019 15:31:29 +0000
From: "Coy, Russell" <russell.coy@roke.co.uk>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: Adding Docker to NXP Image fails to execute run on target
Thread-Index: AdS6QzMHJsAF1FIgRQalQxLkvztVMQ==
Date: Fri, 1 Feb 2019 15:31:28 +0000
Message-ID: <283D8E4691BA2F4EADBC70DF0256D7A302DB5C5549@UM-EXMBX02.comm.ad.roke.co.uk>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.193.190]
MIME-Version: 1.0
X-MC-Unique: L9EDqiz4MfKlAyVEazHl8Q-1
X-Mimecast-Spam-Score: 0
Subject: Adding Docker to NXP Image fails to execute run on target
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
X-List-Received-Date: Fri, 01 Feb 2019 15:31:36 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_283D8E4691BA2F4EADBC70DF0256D7A302DB5C5549UMEXMBX02comm_"

--_000_283D8E4691BA2F4EADBC70DF0256D7A302DB5C5549UMEXMBX02comm_
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello all,
I am trying to add Docker to an image built under Yocto and hence am attemp=
ting to use the meta-virtualization layer.
The target processor is an NXP imx8mq evk board and I am basing everything =
on the NXP BSP v4.9.51, which is based on Yocto morty.
I have git cloned the morty branch of the meta-virtualization layer to the =
top level of our Yocto project and added the layer to the build/bblayers.co=
nf file and added DISTRO_FEATURES_append =3D " virtualization" to the build=
/local.conf file. I have a custom layer with a custom image (based on core-=
image) that includes docker (i.e. IMAGE_INSTALL +=3D " docker"). A complete=
 re-build of the image using bitbake is successful, and when the image is t=
ransferred to the target (on an sd card) and booted, the docker daemon star=
ts up OK. However if I then try running "docker run hello-world" to test ou=
t the installation, it will pull the hello-world image, but fails with a da=
emon error:
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
3b4173355427: Pulling fs layer
3b4173355427: Verifying Checksum
3b4173355427: Download complete
3b4173355427: Pull complete
Digest: sha256:2557e3c07ed1e38f26e389462d03ed943586f744621577a99efb77324b0f=
e535
Status: Downloaded newer image for hello-world:latest
docker: Error response from daemon: operation not supported.
See 'docker run --help'.
Other images give similar results (e.g. busybox or alpine).
It seems that the pull works, and images are downloaded OK, but they do not=
 run.
I'd be grateful if you have any advice on how to get this branch of docker =
working?
For information:
"docker info" gives:
Containers: 0
Running: 0
Paused: 0
Stopped: 0
Images: 1
Server Version: 1.12.5
Storage Driver: overlay
Backing Filesystem: extfs
Logging Driver: json-file
Cgroup Driver: cgroupfs
Plugins:
Volume: local
Network: host bridge overlay null
Swarm: inactive
Runtimes: runc
Default Runtime: runc
Security Options:
Kernel Version: 4.9.51-imx_4.9.51_imx8m_ga+g6df7474
Operating System: NXP i.MX Release Distro 4.9.51-mx8-ga (morty)
OSType: linux
Architecture: aarch64
CPUs: 4
Total Memory: 2.928 GiB
Name: Test-imx8
ID: L4G3:4SLL:UO75:25FS:6OO6:NOPG:SGF7:DXVC:GN5P:7DZK:4O2D:3K4L
Docker Root Dir: /var/lib/docker
Debug Mode (client): false
Debug Mode (server): false
Registry: https://index.docker.io/v1/
Insecure Registries:
http://localhost:5000
127.0.0.0/8
Downloading and running "check-config.sh" gives:
info: reading kernel config from /proc/config.gz ...
Generally Necessary:
- cgroup hierarchy: properly mounted [/sys/fs/cgroup]
- CONFIG_NAMESPACES: enabled
- CONFIG_NET_NS: enabled
- CONFIG_PID_NS: enabled
- CONFIG_IPC_NS: enabled
- CONFIG_UTS_NS: enabled
- CONFIG_CGROUPS: enabled
- CONFIG_CGROUP_CPUACCT: enabled
- CONFIG_CGROUP_DEVICE: enabled
- CONFIG_CGROUP_FREEZER: missing
- CONFIG_CGROUP_SCHED: enabled
- CONFIG_CPUSETS: enabled
- CONFIG_MEMCG: enabled
- CONFIG_KEYS: enabled
- CONFIG_VETH: enabled (as module)
- CONFIG_BRIDGE: enabled (as module)
- CONFIG_BRIDGE_NETFILTER: enabled (as module)
- CONFIG_NF_NAT_IPV4: enabled (as module)
- CONFIG_IP_NF_FILTER: enabled (as module)
- CONFIG_IP_NF_TARGET_MASQUERADE: enabled (as module)
- CONFIG_NETFILTER_XT_MATCH_ADDRTYPE: enabled (as module)
- CONFIG_NETFILTER_XT_MATCH_CONNTRACK: enabled (as module)
- CONFIG_NETFILTER_XT_MATCH_IPVS: missing
- CONFIG_IP_NF_NAT: enabled (as module)
- CONFIG_NF_NAT: enabled (as module)
- CONFIG_NF_NAT_NEEDED: enabled
- CONFIG_POSIX_MQUEUE: enabled
Optional Features:
- CONFIG_USER_NS: enabled
- CONFIG_SECCOMP: enabled
- CONFIG_CGROUP_PIDS: enabled
- CONFIG_MEMCG_SWAP: enabled
- CONFIG_MEMCG_SWAP_ENABLED: enabled
    (cgroup swap accounting is currently enabled)
- CONFIG_BLK_CGROUP: enabled
- CONFIG_BLK_DEV_THROTTLING: missing
- CONFIG_IOSCHED_CFQ: enabled
- CONFIG_CFQ_GROUP_IOSCHED: missing
- CONFIG_CGROUP_PERF: enabled
- CONFIG_CGROUP_HUGETLB: enabled
- CONFIG_NET_CLS_CGROUP: missing
- CONFIG_CGROUP_NET_PRIO: missing
- CONFIG_CFS_BANDWIDTH: missing
- CONFIG_FAIR_GROUP_SCHED: enabled
- CONFIG_RT_GROUP_SCHED: missing
- CONFIG_IP_NF_TARGET_REDIRECT: missing
- CONFIG_IP_VS: missing
- CONFIG_IP_VS_NFCT: missing
- CONFIG_IP_VS_PROTO_TCP: missing
- CONFIG_IP_VS_PROTO_UDP: missing
- CONFIG_IP_VS_RR: missing
- CONFIG_EXT3_FS: enabled
- CONFIG_EXT3_FS_XATTR: missing
- CONFIG_EXT3_FS_POSIX_ACL: missing
- CONFIG_EXT3_FS_SECURITY: missing
    (enable these ext3 configs if you are using ext3 as backing filesystem)
- CONFIG_EXT4_FS: enabled
- CONFIG_EXT4_FS_POSIX_ACL: enabled
- CONFIG_EXT4_FS_SECURITY: missing
    enable these ext4 configs if you are using ext4 as backing filesystem
- Network Drivers:
  - "overlay":
    - CONFIG_VXLAN: missing
      Optional (for encrypted networks):
      - CONFIG_CRYPTO: enabled
      - CONFIG_CRYPTO_AEAD: enabled
      - CONFIG_CRYPTO_GCM: enabled
      - CONFIG_CRYPTO_SEQIV: enabled
      - CONFIG_CRYPTO_GHASH: enabled
      - CONFIG_XFRM: enabled
      - CONFIG_XFRM_USER: missing
      - CONFIG_XFRM_ALGO: missing
      - CONFIG_INET_ESP: missing
      - CONFIG_INET_XFRM_MODE_TRANSPORT: enabled
  - "mipvlan":
    - CONFIG_IPVLAN: missing
  - "macvlan":
    - CONFIG_MACVLAN: enabled (as module)
    - CONFIG_DUMMY: missing
  - "ftp,tftp client in container":
    - CONFIG_NF_NAT_FTP: missing
    - CONFIG_NF_CONNTRACK_FTP: missing
    - CONFIG_NF_NAT_TFTP: missing
    - CONFIG_NF_CONNTRACK_TFTP: missing
- Storage Drivers:
  - "aufs":
    - CONFIG_AUFS_FS: missing
  - "btrfs":
    - CONFIG_BTRFS_FS: enabled (as module)
    - CONFIG_BTRFS_FS_POSIX_ACL: enabled
  - "devicemapper":
    - CONFIG_BLK_DEV_DM: missing
    - CONFIG_DM_THIN_PROVISIONING: missing
  - "overlay":
    - CONFIG_OVERLAY_FS: enabled (as module)
  - "zfs":
    - /dev/zfs: missing
    - zfs command: missing
    - zpool command: missing
Limits:
- /proc/sys/kernel/keys/root_maxkeys: 1000000
"docker -version" gives:
Docker version 1.12.5, build 7392c3b
From the config output, I see that some variables are not enabled. Could th=
is be an issue?
Kind regards,
Russell

________________________________________
Roke Manor Research Limited, Romsey, Hampshire, SO51 0ZN, United Kingdom.Pa=
rt of the Chemring Group.=20
Registered in England & Wales. Registered No: 00267550
http://www.roke.co.uk
_______________________________________
The information contained in this e-mail and any attachments is proprietary=
 to Roke Manor Research Limited and=20
must not be passed to any third party without permission. This communicatio=
n is for information only and shall=20
not create or change any contractual relationship.
________________________________________

--_000_283D8E4691BA2F4EADBC70DF0256D7A302DB5C5549UMEXMBX02comm_
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0cm;
=09margin-bottom:.0001pt;
=09font-size:11.0pt;
=09font-family:"Calibri","sans-serif";
=09mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
=09{mso-style-priority:99;
=09color:blue;
=09text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
=09{mso-style-priority:99;
=09color:purple;
=09text-decoration:underline;}
span.EmailStyle17
=09{mso-style-type:personal-compose;
=09font-family:"Calibri","sans-serif";
=09color:windowtext;}
.MsoChpDefault
=09{mso-style-type:export-only;
=09font-family:"Calibri","sans-serif";
=09mso-fareast-language:EN-US;}
@page WordSection1
=09{size:612.0pt 792.0pt;
=09margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
=09{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head><body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple"><div class=3D"Wo=
rdSection1">
<p class=3D"MsoNormal">Hello all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">I am trying to add Docker to an image built under Yo=
cto and hence am attempting to use the meta-virtualization layer.<o:p></o:p=
></p>
<p class=3D"MsoNormal">The target processor is an NXP imx8mq evk board and =
I am basing everything on the NXP BSP v4.9.51, which is based on Yocto mort=
y.<o:p></o:p></p>
<p class=3D"MsoNormal">I have git cloned the morty branch of the meta-virtu=
alization layer to the top level of our Yocto project and added the layer t=
o the build/bblayers.conf file and added DISTRO_FEATURES_append =3D &quot; =
virtualization&quot; to the build/local.conf file.
 I have a custom layer with a custom image (based on core-image) that inclu=
des docker (i.e. IMAGE_INSTALL &#43;=3D &quot; docker&#8221;). A complete r=
e-build of the image using bitbake is successful, and when the image is tra=
nsferred to the target (on an sd card) and booted,
 the docker daemon starts up OK. However if I then try running &#8220;docke=
r run hello-world&#8221; to test out the installation, it will pull the hel=
lo-world image, but fails with a daemon error:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">Unable to find image 'hello-world:latest' locally<o:=
p></o:p></p>
<p class=3D"MsoNormal">latest: Pulling from library/hello-world<o:p></o:p><=
/p>
<p class=3D"MsoNormal">3b4173355427: Pulling fs layer<o:p></o:p></p>
<p class=3D"MsoNormal">3b4173355427: Verifying Checksum<o:p></o:p></p>
<p class=3D"MsoNormal">3b4173355427: Download complete<o:p></o:p></p>
<p class=3D"MsoNormal">3b4173355427: Pull complete<o:p></o:p></p>
<p class=3D"MsoNormal">Digest: sha256:2557e3c07ed1e38f26e389462d03ed943586f=
744621577a99efb77324b0fe535<o:p></o:p></p>
<p class=3D"MsoNormal">Status: Downloaded newer image for hello-world:lates=
t<o:p></o:p></p>
<p class=3D"MsoNormal">docker: Error response from daemon: operation not su=
pported.<o:p></o:p></p>
<p class=3D"MsoNormal">See 'docker run --help'.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">Other images give similar results (e.g. busybox or a=
lpine).<o:p></o:p></p>
<p class=3D"MsoNormal">It seems that the pull works, and images are downloa=
ded OK, but they do not run.<o:p></o:p></p>
<p class=3D"MsoNormal">I&#8217;d be grateful if you have any advice on how =
to get this branch of docker working?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">For information:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">&#8220;docker info&#8221; gives:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">Containers: 0<o:p></o:p></p>
<p class=3D"MsoNormal">Running: 0<o:p></o:p></p>
<p class=3D"MsoNormal">Paused: 0<o:p></o:p></p>
<p class=3D"MsoNormal">Stopped: 0<o:p></o:p></p>
<p class=3D"MsoNormal">Images: 1<o:p></o:p></p>
<p class=3D"MsoNormal">Server Version: 1.12.5<o:p></o:p></p>
<p class=3D"MsoNormal">Storage Driver: overlay<o:p></o:p></p>
<p class=3D"MsoNormal">Backing Filesystem: extfs<o:p></o:p></p>
<p class=3D"MsoNormal">Logging Driver: json-file<o:p></o:p></p>
<p class=3D"MsoNormal">Cgroup Driver: cgroupfs<o:p></o:p></p>
<p class=3D"MsoNormal">Plugins:<o:p></o:p></p>
<p class=3D"MsoNormal">Volume: local<o:p></o:p></p>
<p class=3D"MsoNormal">Network: host bridge overlay null<o:p></o:p></p>
<p class=3D"MsoNormal">Swarm: inactive<o:p></o:p></p>
<p class=3D"MsoNormal">Runtimes: runc<o:p></o:p></p>
<p class=3D"MsoNormal">Default Runtime: runc<o:p></o:p></p>
<p class=3D"MsoNormal">Security Options:<o:p></o:p></p>
<p class=3D"MsoNormal">Kernel Version: 4.9.51-imx_4.9.51_imx8m_ga&#43;g6df7=
474<o:p></o:p></p>
<p class=3D"MsoNormal">Operating System: NXP i.MX Release Distro 4.9.51-mx8=
-ga (morty)<o:p></o:p></p>
<p class=3D"MsoNormal">OSType: linux<o:p></o:p></p>
<p class=3D"MsoNormal">Architecture: aarch64<o:p></o:p></p>
<p class=3D"MsoNormal">CPUs: 4<o:p></o:p></p>
<p class=3D"MsoNormal">Total Memory: 2.928 GiB<o:p></o:p></p>
<p class=3D"MsoNormal">Name: Test-imx8<o:p></o:p></p>
<p class=3D"MsoNormal">ID: L4G3:4SLL:UO75:25FS:6OO6:NOPG:SGF7:DXVC:GN5P:7DZ=
K:4O2D:3K4L<o:p></o:p></p>
<p class=3D"MsoNormal">Docker Root Dir: /var/lib/docker<o:p></o:p></p>
<p class=3D"MsoNormal">Debug Mode (client): false<o:p></o:p></p>
<p class=3D"MsoNormal">Debug Mode (server): false<o:p></o:p></p>
<p class=3D"MsoNormal">Registry: https://index.docker.io/v1/<o:p></o:p></p>
<p class=3D"MsoNormal">Insecure Registries:<o:p></o:p></p>
<p class=3D"MsoNormal">http://localhost:5000<o:p></o:p></p>
<p class=3D"MsoNormal">127.0.0.0/8<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">Downloading and running &#8220;check-config.sh&#8221=
; gives:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">info: reading kernel config from /proc/config.gz ...=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">Generally Necessary:<o:p></o:p></p>
<p class=3D"MsoNormal">- cgroup hierarchy: properly mounted [/sys/fs/cgroup=
]<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_NAMESPACES: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_NET_NS: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_PID_NS: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_IPC_NS: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_UTS_NS: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_CGROUPS: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_CGROUP_CPUACCT: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_CGROUP_DEVICE: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_CGROUP_FREEZER: missing<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_CGROUP_SCHED: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_CPUSETS: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_MEMCG: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_KEYS: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_VETH: enabled (as module)<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_BRIDGE: enabled (as module)<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_BRIDGE_NETFILTER: enabled (as module)<o:p><=
/o:p></p>
<p class=3D"MsoNormal">- CONFIG_NF_NAT_IPV4: enabled (as module)<o:p></o:p>=
</p>
<p class=3D"MsoNormal">- CONFIG_IP_NF_FILTER: enabled (as module)<o:p></o:p=
></p>
<p class=3D"MsoNormal">- CONFIG_IP_NF_TARGET_MASQUERADE: enabled (as module=
)<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_NETFILTER_XT_MATCH_ADDRTYPE: enabled (as mo=
dule)<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_NETFILTER_XT_MATCH_CONNTRACK: enabled (as m=
odule)<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_NETFILTER_XT_MATCH_IPVS: missing<o:p></o:p>=
</p>
<p class=3D"MsoNormal">- CONFIG_IP_NF_NAT: enabled (as module)<o:p></o:p></=
p>
<p class=3D"MsoNormal">- CONFIG_NF_NAT: enabled (as module)<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_NF_NAT_NEEDED: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_POSIX_MQUEUE: enabled<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">Optional Features:<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_USER_NS: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_SECCOMP: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_CGROUP_PIDS: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_MEMCG_SWAP: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_MEMCG_SWAP_ENABLED: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; (cgroup swap accounting is curren=
tly enabled)<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_BLK_CGROUP: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_BLK_DEV_THROTTLING: missing<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_IOSCHED_CFQ: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_CFQ_GROUP_IOSCHED: missing<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_CGROUP_PERF: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_CGROUP_HUGETLB: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_NET_CLS_CGROUP: missing<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_CGROUP_NET_PRIO: missing<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_CFS_BANDWIDTH: missing<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_FAIR_GROUP_SCHED: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_RT_GROUP_SCHED: missing<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_IP_NF_TARGET_REDIRECT: missing<o:p></o:p></=
p>
<p class=3D"MsoNormal">- CONFIG_IP_VS: missing<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_IP_VS_NFCT: missing<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_IP_VS_PROTO_TCP: missing<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_IP_VS_PROTO_UDP: missing<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_IP_VS_RR: missing<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_EXT3_FS: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_EXT3_FS_XATTR: missing<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_EXT3_FS_POSIX_ACL: missing<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_EXT3_FS_SECURITY: missing<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; (enable these ext3 configs if you=
 are using ext3 as backing filesystem)<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_EXT4_FS: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_EXT4_FS_POSIX_ACL: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">- CONFIG_EXT4_FS_SECURITY: missing<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; enable these ext4 configs if you =
are using ext4 as backing filesystem<o:p></o:p></p>
<p class=3D"MsoNormal">- Network Drivers:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; - &quot;overlay&quot;:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; - CONFIG_VXLAN: missing<o:p></o:p=
></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Optional (for encrypt=
ed networks):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - CONFIG_CRYPTO: enab=
led<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - CONFIG_CRYPTO_AEAD:=
 enabled<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - CONFIG_CRYPTO_GCM: =
enabled<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - CONFIG_CRYPTO_SEQIV=
: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - CONFIG_CRYPTO_GHASH=
: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - CONFIG_XFRM: enable=
d<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - CONFIG_XFRM_USER: m=
issing<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - CONFIG_XFRM_ALGO: m=
issing<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - CONFIG_INET_ESP: mi=
ssing<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - CONFIG_INET_XFRM_MO=
DE_TRANSPORT: enabled<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; - &quot;mipvlan&quot;:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; - CONFIG_IPVLAN: missing<o:p></o:=
p></p>
<p class=3D"MsoNormal">&nbsp; - &quot;macvlan&quot;:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; - CONFIG_MACVLAN: enabled (as mod=
ule)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; - CONFIG_DUMMY: missing<o:p></o:p=
></p>
<p class=3D"MsoNormal">&nbsp; - &quot;ftp,tftp client in container&quot;:<o=
:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; - CONFIG_NF_NAT_FTP: missing<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; - CONFIG_NF_CONNTRACK_FTP: missin=
g<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; - CONFIG_NF_NAT_TFTP: missing<o:p=
></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; - CONFIG_NF_CONNTRACK_TFTP: missi=
ng<o:p></o:p></p>
<p class=3D"MsoNormal">- Storage Drivers:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; - &quot;aufs&quot;:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; - CONFIG_AUFS_FS: missing<o:p></o=
:p></p>
<p class=3D"MsoNormal">&nbsp; - &quot;btrfs&quot;:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; - CONFIG_BTRFS_FS: enabled (as mo=
dule)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; - CONFIG_BTRFS_FS_POSIX_ACL: enab=
led<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; - &quot;devicemapper&quot;:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; - CONFIG_BLK_DEV_DM: missing<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; - CONFIG_DM_THIN_PROVISIONING: mi=
ssing<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; - &quot;overlay&quot;:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; - CONFIG_OVERLAY_FS: enabled (as =
module)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; - &quot;zfs&quot;:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; - /dev/zfs: missing<o:p></o:p></p=
>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; - zfs command: missing<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; - zpool command: missing<o:p></o:=
p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">Limits:<o:p></o:p></p>
<p class=3D"MsoNormal">- /proc/sys/kernel/keys/root_maxkeys: 1000000<o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">&#8220;docker &#8211;version&#8221; gives:<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">Docker version 1.12.5, build 7392c3b<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">From the config output, I see that some variables ar=
e not enabled. Could this be an issue?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">Kind regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Russell<o:p></o:p></p>
</div>
    <br />
    <br />

<p style=3D"margin-top:2em;font-family:arial,sans-serif;font-size:9pt">Foll=
ow Us: <a href=3D"http://www.linkedin.com/company/roke-manor-research" titl=
e=3D"LinkedIn" target=3D"_blank">LinkedIn</a> | <a href=3D"https://twitter.=
com/rokemanor" title=3D"Twitter" target=3D"_blank">Twitter</a> | <a href=3D=
"https://www.facebook.com/rokemanor" title=3D"Facebook" target=3D"_blank">F=
acebook</a></p>

<p style=3D"font-family:arial,sans-serif;font-size:9pt; color:#808080">Roke=
 Manor Research Limited, Romsey, Hampshire, SO51 0ZN, United Kingdom. Part =
of the Chemring Group. Registered in England &amp; Wales. Registered No: 00=
267550. The information contained in this e-mail and any attachments is pro=
prietary to Roke Manor Research Limited and must not be passed to any third=
 party without permission. This communication is for information only and s=
hall not create or change any contractual relationship.<br /><a href=3D"htt=
p://www.roke.co.uk/?utm_source=3DRoke&amp;utm_medium=3DEmail&amp;utm_conten=
t=3DCompany%20Signature&amp;utm_campaign=3DRoke" title=3D"Website" target=
=3D"_blank">www.roke.co.uk</a></p>

<hr style=3D"font-family:arial,sans-serif;font-size:9pt" />



</body></html>

--_000_283D8E4691BA2F4EADBC70DF0256D7A302DB5C5549UMEXMBX02comm_--
