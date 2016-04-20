Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 94764E007D2; Wed, 20 Apr 2016 13:47:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.218.50 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F25CE007D2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Apr 2016 13:47:02 -0700 (PDT)
Received: by mail-oi0-f50.google.com with SMTP id k142so54742216oib.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Apr 2016 13:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=CHZsHAGNcXtC3VigMz7igT7Pkj9QentTYPfco/O4Wcg=;
	b=lrZGaUuqmSdNIl6TpqC5Pky+KZYnyOH2F/aWMzDW3DLFqTxE4cBwlWRVOVcVXhGgbp
	zLE2yg1pKRqbpLmbPFg13pQOWxwxD+joFsii+XecnJ37G2cKHMttij8BNfUVlp7VF9XW
	kAuHKLZ4uiyzzJSZe1Dac7X0waXnzHYRTu6th6Z5MQQV079IBokhdDuuQb5RjjiAcMiq
	eYJw/SWSqJnOxYpbSZ5HOi3SiZknQOJN2TTYdqGNMg3NIEKxk0fOslCICxbTX+ivyfON
	lmQIBWiArpjTNlQF+Rk7PZJkF671kqAeK6MKNcfdSsdirj29NfRnuoRXMb8PIZiI+20X
	uj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=CHZsHAGNcXtC3VigMz7igT7Pkj9QentTYPfco/O4Wcg=;
	b=GpCiipHvNl4+uEqwGLXXBzu8qPEqlWNUGzcPzVgEoBPdvjH4vJq7yBnVX+2KuwRny6
	7HLszWHNtka4AgM57ySRYuV4d2e31jUBhXn7mdo/rVd/18faGrzY7ZcXFnsnlpRMe71S
	Vr4yW2P7i7KWj4zAPGLvLoZ/4jW2qVhI03TM4MVF3IUiGD8IZ5o4Vik0Ogas7Pz8+1Dd
	40Lm9Qnqh8PmlBOnSiWCjv/hftXvjbvI/nBqpguWYfKvR+wTD5LYgog01NrZM1xJsOTu
	+ZekKFDMiG8xtflM5W2AVnwxKsEvA9GnmgkPDDIyEWEFaDrxOQv+TGJQE54qLzEY8U4N
	uQhA==
X-Gm-Message-State: AOPr4FUlr9/NB96shPJt9KLLe2gcfAMrdlNmuL+pYtfflmkpagYFU1ZY/0tW36UOeR/vjO3oXRti5hzH2/N0Hw==
MIME-Version: 1.0
X-Received: by 10.202.190.65 with SMTP id o62mr4560518oif.109.1461185221864;
	Wed, 20 Apr 2016 13:47:01 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Wed, 20 Apr 2016 13:47:01 -0700 (PDT)
In-Reply-To: <CADkTA4OO1Ha3nDfO7T=sgrQ9vef4wjOJyPvUqQuDVinBRzVK9Q@mail.gmail.com>
References: <1460450138-16240-1-git-send-email-zongchun.yu@nxp.com>
	<HE1PR04MB2170BADC77C7DC4781349639FD6C0@HE1PR04MB2170.eurprd04.prod.outlook.com>
	<CADkTA4NdArOKj2cqgVj2i2qfLf_-DQpoMT3mfAQycMEGwP7p4w@mail.gmail.com>
	<HE1PR04MB2170699B2D798054BA45765EFD6C0@HE1PR04MB2170.eurprd04.prod.outlook.com>
	<AM3PR04MB40313AB152240F2495C7B0F936C0@AM3PR04MB403.eurprd04.prod.outlook.com>
	<CADkTA4OO1Ha3nDfO7T=sgrQ9vef4wjOJyPvUqQuDVinBRzVK9Q@mail.gmail.com>
Message-ID: <CADkTA4MAKMzBqW+azTEJpA9-d9DUmLHBFoNqT=Rq5a28J3_deg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Wei Lu <W.Lu@nxp.com>
X-Mailman-Approved-At: Fri, 23 Dec 2016 16:01:39 -0800
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Bogdan Purcareata <bogdan.purcareata@nxp.com>
Subject: Re: [PATCH][v2] docker: uprev to 1.9.0
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
Date: Wed, 20 Apr 2016 20:47:14 -0000
X-Original-Date: Wed, 20 Apr 2016 16:47:01 -0400
X-List-Received-Date: Wed, 20 Apr 2016 20:47:14 -0000
Content-Type: multipart/alternative; boundary=001a113d706219b7eb0530f0b278

--001a113d706219b7eb0530f0b278
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 19, 2016 at 3:30 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Tue, Apr 19, 2016 at 3:29 AM, Wei Lu <W.Lu@nxp.com> wrote:
>
>> Hello,
>>
>>
>>
>
> Thanks. I've queued this locally. If my testing passes, I'll follow up
> when it has been
> pushed.
>

I had to fix some other go 1.x applications, but I can confirm that this
also worked for
x86-64.

The changes are now pushed.

Bruce


>
> Bruce
>
>
>> For Docker running on ARM64, we need enable below configures, these extr=
a
>> configures are not enabled in default kernel, so we need open it manuall=
y.
>>
>> CONFIG_CGROUP_DEBUG=3Dy
>>
>> CONFIG_CGROUP_FREEZER=3Dy
>>
>> CONFIG_CGROUP_DEVICE=3Dy
>>
>> CONFIG_CPUSETS=3Dy
>>
>> CONFIG_CGROUP_CPUACCT=3Dy
>>
>> CONFIG_CGROUP_PERF=3Dy
>>
>> CONFIG_BLK_CGROUP=3Dy
>>
>> CONFIG_DEBUG_BLK_CGROUP=3Dy
>>
>> CONFIG_UTS_NS=3Dy
>>
>> CONFIG_IPC_NS=3Dy
>>
>> CONFIG_USER_NS=3Dy
>>
>> CONFIG_IPV6=3Dy
>>
>> CONFIG_BRIDGE=3Dy
>>
>> CONFIG_VLAN_8021Q=3Dy
>>
>> CONFIG_VLAN_8021Q_GVRP=3Dy
>>
>> CONFIG_VLAN_8021Q_MVRP=3Dy
>>
>> CONFIG_MACVLAN=3Dy
>>
>> CONFIG_MACVTAP=3Dy
>>
>> CONFIG_VETH=3Dy
>>
>> CONFIG_DEVPTS_MULTIPLE_INSTANCES=3Dy
>>
>> CONFIG_EXT2_FS_XATTR=3Dy
>>
>> CONFIG_EXT2_FS_POSIX_ACL=3Dy
>>
>> CONFIG_EXT3_FS_POSIX_ACL=3Dy
>>
>> CONFIG_EXT4_FS_POSIX_ACL=3Dy
>>
>> CONFIG_TMPFS_POSIX_ACL=3Dy
>>
>> CONFIG_SECCOMP=3Dy
>>
>> CONFIG_BLK_DEV_THROTTLING=3Dy
>>
>> CONFIG_CFQ_GROUP_IOSCHED=3Dy
>>
>> CONFIG_OVERLAY_FS=3Dy
>>
>> CONFIG_TMPFS_POSIX_ACL=3Dy
>>
>> CONFIG_TMPFS_XATTR=3Dy
>>
>> CONFIG_NETFILTER=3Dy
>>
>> CONFIG_NETFILTER_ADVANCED=3Dy
>>
>> CONFIG_BRIDGE_NETFILTER=3Dm
>>
>> CONFIG_NETFILTER_NETLINK=3Dy
>>
>> CONFIG_NF_CONNTRACK=3Dy
>>
>> CONFIG_NF_CONNTRACK_MARK=3Dy
>>
>> CONFIG_NF_CONNTRACK_PROCFS=3Dy
>>
>> CONFIG_NF_NAT=3Dy
>>
>> CONFIG_NF_NAT_NEEDED=3Dy
>>
>> CONFIG_NF_TABLES=3Dy
>>
>> CONFIG_NFT_CT=3Dy
>>
>> CONFIG_NFT_RBTREE=3Dy
>>
>> CONFIG_NFT_MASQ=3Dy
>>
>> CONFIG_NFT_NAT=3Dy
>>
>> CONFIG_NFT_COMPAT=3Dy
>>
>> CONFIG_NETFILTER_XTABLES=3Dy
>>
>> CONFIG_NETFILTER_XT_CONNMARK=3Dy
>>
>> CONFIG_NETFILTER_XT_TARGET_CONNMARK=3Dy
>>
>> CONFIG_NETFILTER_XT_NAT=3Dy
>>
>> CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=3Dy
>>
>> CONFIG_NETFILTER_XT_MATCH_CONNMARK=3Dy
>>
>> CONFIG_NETFILTER_XT_MATCH_CONNTRACK=3Dy
>>
>> CONFIG_NF_DEFRAG_IPV4=3Dy
>>
>> CONFIG_NF_CONNTRACK_IPV4=3Dy
>>
>> CONFIG_NF_CONNTRACK_PROC_COMPAT=3Dy
>>
>> CONFIG_NF_TABLES_IPV4=3Dy
>>
>> CONFIG_NF_NAT_IPV4=3Dy
>>
>> CONFIG_NF_NAT_MASQUERADE_IPV4=3Dy
>>
>> CONFIG_IP_NF_IPTABLES=3Dy
>>
>> CONFIG_IP_NF_FILTER=3Dy
>>
>> CONFIG_IP_NF_NAT=3Dy
>>
>> CONFIG_IP_NF_TARGET_MASQUERADE=3Dy
>>
>> CONFIG_IP_NF_MANGLE=3Dy
>>
>> CONFIG_NF_TABLES_BRIDGE=3Dy
>>
>> CONFIG_BRIDGE_NF_EBTABLES=3Dy
>>
>> CONFIG_BRIDGE_EBT_T_NAT=3Dy
>>
>> CONFIG_BRIDGE_EBT_DNAT=3Dy
>>
>> CONFIG_BRIDGE_EBT_SNAT=3Dy
>>
>>
>>
>> Test steps on ARM64:
>>
>> docker daemon &
>>
>> docker  login docker hub
>>
>> docker search arm64
>>
>> docker pull $ARM64_images
>>
>> docker run -d -p 30081:80 --name=3Dsandbox1 -h sandbox1 $ARM64_images ba=
sh
>> -c "lighttpd -f /etc/lighttpd/lighttpd.conf -D"
>>
>> docker logout
>>
>> docker ps =E2=80=93a
>>
>> docker images
>>
>> docker stop sandbox1
>>
>> docker rm sandbox1
>>
>>
>>
>>
>>
>> Regards
>>
>> Lu Wei
>>
>>
>>
>> *From:* Zongchun Yu
>> *Sent:* Tuesday, April 19, 2016 11:18 AM
>> *To:* Bruce Ashfield <bruce.ashfield@gmail.com>; Wei Lu <W.Lu@nxp.com>
>> *Cc:* meta-virtualization@yoctoproject.org
>> *Subject:* RE: [meta-virtualization][PATCH][v2] docker: uprev to 1.9.0
>>
>>
>>
>> Okay.  Let me add Lu wei.
>>
>>
>>
>> Hi Lu wei.
>>
>>
>>
>> Can you help to provide the arm64 test and configure message to Bruce?
>>
>>
>>
>>
>>
>> Thank you.
>>
>>
>>
>> Best Regards
>>
>> Zongchun
>>
>> *From:* Bruce Ashfield [mailto:bruce.ashfield@gmail.com
>> <bruce.ashfield@gmail.com>]
>> *Sent:* Tuesday, April 19, 2016 11:10 AM
>> *To:* Zongchun Yu
>> *Cc:* meta-virtualization@yoctoproject.org
>> *Subject:* Re: [meta-virtualization][PATCH][v2] docker: uprev to 1.9.0
>>
>>
>>
>>
>>
>>
>>
>> On Mon, Apr 18, 2016 at 10:26 PM, Zongchun Yu <zongchun.yu@nxp.com>
>> wrote:
>>
>> Hi Bruce.
>>
>> May I know if you have comments about this v2 patch? If not. Can you hel=
p
>> to apply the patch?
>>
>>
>>
>>
>>
>> I'm waiting to hear from Bogdan P: .. you said the following:
>>
>>
>>
>> ------------
>>
>>
>>
>> Hi Bogdan P.
>>
>>
>>
>> Can you help to provide the arm64 test and configure messages to Bruce?
>>
>>
>>
>> -----------
>>
>>
>>
>> And I see no other email on the subject .. so I'm not sure why I'd have
>> started to merge a new version.
>>
>>
>>
>> Bruce
>>
>>
>>
>>
>> Thanks.
>>
>> Best Regards
>> Zongchun
>>
>> -----Original Message-----
>> From: zongchun.yu@nxp.com [mailto:zongchun.yu@nxp.com]
>> Sent: Tuesday, April 12, 2016 4:36 PM
>> To: meta-virtualization@yoctoproject.org
>> Cc: bruce.ashfield@gmail.com; Zongchun Yu
>> Subject: [meta-virtualization][PATCH][v2] docker: uprev to 1.9.0
>>
>> From: Zongchun Yu <zongchun.yu@nxp.com>
>>
>> Uprev to 1.9.0.
>> Enable build support for arm64.
>> The libcontainer is removed from the source in the new version. drop the
>> nsinit install lines.
>>
>> Signed-off-by: Zongchun Yu <zongchun.yu@nxp.com>
>> ---
>>  recipes-containers/docker/docker_git.bb            |   38 +-
>>  .../docker/files/Bump-bolt-to-v1.1.0.patch         | 1828
>> ++++++++++++++++++++
>>  .../docker/files/disable_sha1sum_startup.patch     |   21 +-
>>  3 files changed, 1855 insertions(+), 32 deletions(-)
>>  create mode 100644
>> recipes-containers/docker/files/Bump-bolt-to-v1.1.0.patch
>>
>> diff --git a/recipes-containers/docker/docker_git.bb
>> b/recipes-containers/docker/docker_git.bb
>> index 2672b22..19fdef0 100644
>> --- a/recipes-containers/docker/docker_git.bb
>> +++ b/recipes-containers/docker/docker_git.bb
>> @@ -18,23 +18,23 @@ DESCRIPTION =3D "Linux container runtime \
>>   subtle and/or glaring issues. \
>>   "
>>
>> -SRCREV =3D "7c8fca2ddb58c8d2c4fb4df31c242886df7dd257"
>> -SRCBRANCH =3D "v1.6.2"
>> +SRCREV =3D "76d6bc9a9f1690e16f3721ba165364688b626de2"
>>  SRC_URI =3D "\
>> -       git://github.com/docker/docker.git;branch=3D${SRCBRANCH};nobranc=
h=3D1
>> <http://github.com/docker/docker.git;branch=3D$%7bSRCBRANCH%7d;nobranch=
=3D1>
>> \
>> +       git://github.com/docker/docker.git;nobranch=3D1 \
>>         file://docker.service \
>>         file://docker.init \
>>         file://hi.Dockerfile \
>>         file://disable_sha1sum_startup.patch \
>> +       file://Bump-bolt-to-v1.1.0.patch \
>>         "
>>
>>  # Apache-2.0 for docker
>>  LICENSE =3D "Apache-2.0"
>> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1cc0497778922bfd6cb48721deb8=
0dc7"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dcc2221abf0b96ea39dd68141b70f=
7937"
>>
>>  S =3D "${WORKDIR}/git"
>>
>> -DOCKER_VERSION =3D "1.6.2"
>> +DOCKER_VERSION =3D "1.9.0"
>>  PV =3D "${DOCKER_VERSION}+git${SRCREV}"
>>
>>  DEPENDS =3D "go-cross \
>> @@ -62,17 +62,17 @@ RRECOMMENDS_${PN} =3D "lxc docker-registry rt-tests"
>>  RRECOMMENDS_${PN} +=3D " kernel-module-dm-thin-pool kernel-module-nf-na=
t"
>>  DOCKER_PKG=3D"github.com/docker/docker"
>>
>> -do_configure() {
>> -}
>> +do_configure[noexec] =3D "1"
>>
>>  do_compile() {
>> -       export PATH=3D${STAGING_BINDIR_NATIVE}/${HOST_SYS}/go-1.3:$PATH
>> -
>>         export GOARCH=3D"${TARGET_ARCH}"
>> -       # supported amd64, 386, arm
>> +       # supported amd64, 386, arm arm64
>>         if [ "${TARGET_ARCH}" =3D "x86_64" ]; then
>>                 export GOARCH=3D"amd64"
>>         fi
>> +       if [ "${TARGET_ARCH}" =3D "aarch64" ]; then
>> +               export GOARCH=3D"arm64"
>> +       fi
>>
>>         # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
>>         # docker to download its dependencies but rather
>> @@ -84,21 +84,19 @@ do_compile() {
>>         export
>> GOPATH=3D"${S}/.gopath:${S}/vendor:${STAGING_DIR_TARGET}/${prefix}/local=
/go"
>>         cd -
>>
>> -       export CGO_ENABLED=3D"1"
>> -
>>         # Pass the needed cflags/ldflags so that cgo
>>         # can find the needed headers files and libraries
>> -       export CGO_CFLAGS=3D"${BUILDSDK_CFLAGS}"
>> -       export CGO_LDFLAGS=3D"${BUILDSDK_LDFLAGS}"
>> +       export CGO_ENABLED=3D"1"
>> +       export CGO_CFLAGS=3D"${BUILDSDK_CFLAGS}
>> --sysroot=3D${STAGING_DIR_TARGET}"
>> +       export CGO_LDFLAGS=3D"${BUILDSDK_LDFLAGS}
>> --sysroot=3D${STAGING_DIR_TARGET}"
>> +       # in order to exclude devicemapper and btrfs -
>> https://github.com/docker/docker/issues/14056
>> +       export DOCKER_BUILDTAGS=3D'exclude_graphdriver_btrfs
>> exclude_graphdriver_devicemapper'
>>
>>         # this is the unsupported built structure
>>         # that doesn't rely on an existing docker
>>         # to build this:
>>         DOCKER_GITCOMMIT=3D"${SRCREV}" \
>>           ./hack/make.sh dynbinary
>> -
>> -       # make nsinit from libcontainer
>> -       go install github.com/docker/libcontainer/nsinit/
>>  }
>>
>>  inherit systemd update-rc.d
>> @@ -127,12 +125,6 @@ do_install() {
>>              install -m 0755 ${WORKDIR}/docker.init
>> ${D}${sysconfdir}/init.d/docker.init
>>         fi
>>
>> -       if [ -d ${S}/vendor/bin/linux_* ]; then
>> -               cp ${S}/vendor/bin/linux_*/* ${D}/${bindir}
>> -       else
>> -               cp ${S}/vendor/bin/* ${D}/${bindir}
>> -       fi
>> -
>>         mkdir -p ${D}/usr/share/docker/
>>         cp ${WORKDIR}/hi.Dockerfile ${D}/usr/share/docker/
>>  }
>> diff --git a/recipes-containers/docker/files/Bump-bolt-to-v1.1.0.patch
>> b/recipes-containers/docker/files/Bump-bolt-to-v1.1.0.patch
>> new file mode 100644
>> index 0000000..ca4ad81
>> --- /dev/null
>> +++ b/recipes-containers/docker/files/Bump-bolt-to-v1.1.0.patch
>> @@ -0,0 +1,1828 @@
>> +From a41917c2c88bd7f694d141ac67f4a194aaa16fa1 Mon Sep 17 00:00:00 2001
>> +From: Qiang Huang <h.huangqiang@huawei.com>
>> +Date: Wed, 28 Oct 2015 08:49:45 +0800
>> +Subject: [PATCH] Bump bolt to v1.1.0
>> +
>> +It adds ARM64, ppc64le, s390x, solaris support, and a bunch of
>> +bugfixs.
>> +
>> +Signed-off-by: Qiang Huang <h.huangqiang@huawei.com>
>> +---
>> + hack/vendor.sh                                     |   2 +-
>> + vendor/src/github.com/boltdb/bolt/.gitignore       |   1 +
>> + vendor/src/github.com/boltdb/bolt/README.md        | 250
>> +++++++++++++++++++--
>> + vendor/src/github.com/boltdb/bolt/batch.go         | 138 ++++++++++++
>> + vendor/src/github.com/boltdb/bolt/bolt_386.go      |   5 +-
>> + vendor/src/github.com/boltdb/bolt/bolt_amd64.go    |   3 +
>> + vendor/src/github.com/boltdb/bolt/bolt_arm.go      |   5 +-
>> + vendor/src/github.com/boltdb/bolt/bolt_arm64.go    |   9 +
>> + vendor/src/github.com/boltdb/bolt/bolt_ppc64le.go  |   9 +
>> + vendor/src/github.com/boltdb/bolt/bolt_s390x.go    |   9 +
>> + vendor/src/github.com/boltdb/bolt/bolt_unix.go     |  37 ++-
>> + .../github.com/boltdb/bolt/bolt_unix_solaris.go    | 101 +++++++++
>> + vendor/src/github.com/boltdb/bolt/bolt_windows.go  |  10 +-
>> + vendor/src/github.com/boltdb/bolt/bucket.go        |  29 ++-
>> + vendor/src/github.com/boltdb/bolt/cursor.go        |  12 +-
>> + vendor/src/github.com/boltdb/bolt/db.go            | 195
>> ++++++++++++----
>> + vendor/src/github.com/boltdb/bolt/errors.go        |   4 +
>> + vendor/src/github.com/boltdb/bolt/freelist.go      |  28 ++-
>> + vendor/src/github.com/boltdb/bolt/node.go          |  36 ++-
>> + vendor/src/github.com/boltdb/bolt/page.go          |  45 +++-
>> + vendor/src/github.com/boltdb/bolt/tx.go            |  80 +++++--
>> + 21 files changed, 886 insertions(+), 122 deletions(-)
>> + create mode 100644 vendor/src/github.com/boltdb/bolt/batch.go
>> + create mode 100644 vendor/src/github.com/boltdb/bolt/bolt_arm64.go
>> + create mode 100644 vendor/src/github.com/boltdb/bolt/bolt_ppc64le.go
>> + create mode 100644 vendor/src/github.com/boltdb/bolt/bolt_s390x.go
>> + create mode 100644 vendor/src/
>> github.com/boltdb/bolt/bolt_unix_solaris.go
>> +
>> +diff --git a/hack/vendor.sh b/hack/vendor.sh
>> +index d872d4a..c28e677 100755
>> +--- a/hack/vendor.sh
>> ++++ b/hack/vendor.sh
>> +@@ -36,7 +36,7 @@ clone git github.com/coreos/etcd v2.2.0
>> + fix_rewritten_imports github.com/coreos/etcd
>> + clone git github.com/ugorji/go 5abd4e96a45c386928ed2ca2a7ef63e2533e18e=
c
>> + clone git github.com/hashicorp/consul v0.5.2
>> +-clone git github.com/boltdb/bolt v1.0
>> ++clone git github.com/boltdb/bolt v1.1.0
>> +
>> + # get graph and distribution packages
>> + clone git github.com/docker/distribution
>> 20c4b7a1805a52753dfd593ee1cc35558722a0ce # docker/1.9 branch
>> +diff --git a/vendor/src/github.com/boltdb/bolt/.gitignore b/vendor/src/
>> github.com/boltdb/bolt/.gitignore
>> +index b2bb382..c7bd2b7 100644
>> +--- a/vendor/src/github.com/boltdb/bolt/.gitignore
>> ++++ b/vendor/src/github.com/boltdb/bolt/.gitignore
>> +@@ -1,3 +1,4 @@
>> + *.prof
>> + *.test
>> ++*.swp
>> + /bin/
>> +diff --git a/vendor/src/github.com/boltdb/bolt/README.md b/vendor/src/
>> github.com/boltdb/bolt/README.md
>> +index 727e977..0a33ebc 100644
>> +--- a/vendor/src/github.com/boltdb/bolt/README.md
>> ++++ b/vendor/src/github.com/boltdb/bolt/README.md
>> +@@ -16,7 +16,7 @@ and setting values. That's it.
>> +
>> + ## Project Status
>> +
>> +-Bolt is stable and the API is fixed. Full unit test coverage and
>> randomized
>> ++Bolt is stable and the API is fixed. Full unit test coverage and
>> randomized
>> + black box testing are used to ensure database consistency and thread
>> safety.
>> + Bolt is currently in high-load production environments serving
>> databases as
>> + large as 1TB. Many companies such as Shopify and Heroku use Bolt-backe=
d
>> +@@ -87,6 +87,11 @@ are not thread safe. To work with data in multiple
>> goroutines you must start
>> + a transaction for each one or use locking to ensure only one goroutine
>> accesses
>> + a transaction at a time. Creating transaction from the `DB` is thread
>> safe.
>> +
>> ++Read-only transactions and read-write transactions should not depend o=
n
>> one
>> ++another and generally shouldn't be opened simultaneously in the same
>> goroutine.
>> ++This can cause a deadlock as the read-write transaction needs to
>> periodically
>> ++re-map the data file but it cannot do so while a read-only transaction
>> is open.
>> ++
>> +
>> + #### Read-write transactions
>> +
>> +@@ -120,12 +125,88 @@ err :=3D db.View(func(tx *bolt.Tx) error {
>> + })
>> + ```
>> +
>> +-You also get a consistent view of the database within this closure,
>> however,
>> ++You also get a consistent view of the database within this closure,
>> however,
>> + no mutating operations are allowed within a read-only transaction. You
>> can only
>> + retrieve buckets, retrieve values, and copy the database within a
>> read-only
>> + transaction.
>> +
>> +
>> ++#### Batch read-write transactions
>> ++
>> ++Each `DB.Update()` waits for disk to commit the writes. This overhead
>> ++can be minimized by combining multiple updates with the `DB.Batch()`
>> ++function:
>> ++
>> ++```go
>> ++err :=3D db.Batch(func(tx *bolt.Tx) error {
>> ++      ...
>> ++      return nil
>> ++})
>> ++```
>> ++
>> ++Concurrent Batch calls are opportunistically combined into larger
>> ++transactions. Batch is only useful when there are multiple goroutines
>> ++calling it.
>> ++
>> ++The trade-off is that `Batch` can call the given
>> ++function multiple times, if parts of the transaction fail. The
>> ++function must be idempotent and side effects must take effect only
>> ++after a successful return from `DB.Batch()`.
>> ++
>> ++For example: don't display messages from inside the function, instead
>> ++set variables in the enclosing scope:
>> ++
>> ++```go
>> ++var id uint64
>> ++err :=3D db.Batch(func(tx *bolt.Tx) error {
>> ++      // Find last key in bucket, decode as bigendian uint64, incremen=
t
>> ++      // by one, encode back to []byte, and add new key.
>> ++      ...
>> ++      id =3D newValue
>> ++      return nil
>> ++})
>> ++if err !=3D nil {
>> ++      return ...
>> ++}
>> ++fmt.Println("Allocated ID %d", id)
>> ++```
>> ++
>> ++
>> ++#### Managing transactions manually
>> ++
>> ++The `DB.View()` and `DB.Update()` functions are wrappers around the
>> `DB.Begin()`
>> ++function. These helper functions will start the transaction, execute a
>> function,
>> ++and then safely close your transaction if an error is returned. This i=
s
>> the
>> ++recommended way to use Bolt transactions.
>> ++
>> ++However, sometimes you may want to manually start and end your
>> transactions.
>> ++You can use the `Tx.Begin()` function directly but _please_ be sure to
>> close the
>> ++transaction.
>> ++
>> ++```go
>> ++// Start a writable transaction.
>> ++tx, err :=3D db.Begin(true)
>> ++if err !=3D nil {
>> ++    return err
>> ++}
>> ++defer tx.Rollback()
>> ++
>> ++// Use the transaction...
>> ++_, err :=3D tx.CreateBucket([]byte("MyBucket"))
>> ++if err !=3D nil {
>> ++    return err
>> ++}
>> ++
>> ++// Commit the transaction and check for error.
>> ++if err :=3D tx.Commit(); err !=3D nil {
>> ++    return err
>> ++}
>> ++```
>> ++
>> ++The first argument to `DB.Begin()` is a boolean stating if the
>> transaction
>> ++should be writable.
>> ++
>> ++
>> + ### Using buckets
>> +
>> + Buckets are collections of key/value pairs within the database. All
>> keys in a
>> +@@ -175,13 +256,61 @@ db.View(func(tx *bolt.Tx) error {
>> + ```
>> +
>> + The `Get()` function does not return an error because its operation is
>> +-guarenteed to work (unless there is some kind of system failure). If
>> the key
>> ++guaranteed to work (unless there is some kind of system failure). If
>> the key
>> + exists then it will return its byte slice value. If it doesn't exist
>> then it
>> + will return `nil`. It's important to note that you can have a
>> zero-length value
>> + set to a key which is different than the key not existing.
>> +
>> + Use the `Bucket.Delete()` function to delete a key from the bucket.
>> +
>> ++Please note that values returned from `Get()` are only valid while the
>> ++transaction is open. If you need to use a value outside of the
>> transaction
>> ++then you must use `copy()` to copy it to another byte slice.
>> ++
>> ++
>> ++### Autoincrementing integer for the bucket
>> ++By using the NextSequence() function, you can let Bolt determine a
>> sequence
>> ++which can be used as the unique identifier for your key/value pairs.
>> See the
>> ++example below.
>> ++
>> ++```go
>> ++// CreateUser saves u to the store. The new user ID is set on u once
>> the data is persisted.
>> ++func (s *Store) CreateUser(u *User) error {
>> ++    return s.db.Update(func(tx *bolt.Tx) error {
>> ++        // Retrieve the users bucket.
>> ++        // This should be created when the DB is first opened.
>> ++        b :=3D tx.Bucket([]byte("users"))
>> ++
>> ++        // Generate ID for the user.
>> ++        // This returns an error only if the Tx is closed or not
>> writeable.
>> ++        // That can't happen in an Update() call so I ignore the error
>> check.
>> ++        id, _ =3D b.NextSequence()
>> ++        u.ID =3D int(id)
>> ++
>> ++        // Marshal user data into bytes.
>> ++        buf, err :=3D json.Marshal(u)
>> ++        if err !=3D nil {
>> ++            return err
>> ++        }
>> ++
>> ++        // Persist bytes to users bucket.
>> ++        return b.Put(itob(u.ID), buf)
>> ++    })
>> ++}
>> ++
>> ++// itob returns an 8-byte big endian representation of v.
>> ++func itob(v int) []byte {
>> ++    b :=3D make([]byte, 8)
>> ++    binary.BigEndian.PutUint64(b, uint64(v))
>> ++    return b
>> ++}
>> ++
>> ++type User struct {
>> ++    ID int
>> ++    ...
>> ++}
>> ++
>> ++```
>> +
>> + ### Iterating over keys
>> +
>> +@@ -254,7 +383,7 @@ db.View(func(tx *bolt.Tx) error {
>> +       max :=3D []byte("2000-01-01T00:00:00Z")
>> +
>> +       // Iterate over the 90's.
>> +-      for k, v :=3D c.Seek(min); k !=3D nil && bytes.Compare(k, max) !=
=3D -1;
>> k, v =3D c.Next() {
>> ++      for k, v :=3D c.Seek(min); k !=3D nil && bytes.Compare(k, max) <=
=3D 0;
>> k, v =3D c.Next() {
>> +               fmt.Printf("%s: %s\n", k, v)
>> +       }
>> +
>> +@@ -294,7 +423,7 @@ func (*Bucket) DeleteBucket(key []byte) error
>> +
>> + ### Database backups
>> +
>> +-Bolt is a single file so it's easy to backup. You can use the
>> `Tx.Copy()`
>> ++Bolt is a single file so it's easy to backup. You can use the
>> `Tx.WriteTo()`
>> + function to write a consistent view of the database to a writer. If yo=
u
>> call
>> + this from a read-only transaction, it will perform a hot backup and no=
t
>> block
>> + your other database reads and writes. It will also use `O_DIRECT` when
>> available
>> +@@ -305,11 +434,12 @@ do database backups:
>> +
>> + ```go
>> + func BackupHandleFunc(w http.ResponseWriter, req *http.Request) {
>> +-      err :=3D db.View(func(tx bolt.Tx) error {
>> ++      err :=3D db.View(func(tx *bolt.Tx) error {
>> +               w.Header().Set("Content-Type", "application/octet-stream=
")
>> +               w.Header().Set("Content-Disposition", `attachment;
>> filename=3D"my.db"`)
>> +               w.Header().Set("Content-Length",
>> strconv.Itoa(int(tx.Size())))
>> +-              return tx.Copy(w)
>> ++              _, err :=3D tx.WriteTo(w)
>> ++              return err
>> +       })
>> +       if err !=3D nil {
>> +               http.Error(w, err.Error(), http.StatusInternalServerErro=
r)
>> +@@ -351,14 +481,13 @@ go func() {
>> +               // Grab the current stats and diff them.
>> +               stats :=3D db.Stats()
>> +               diff :=3D stats.Sub(&prev)
>> +-
>> ++
>> +               // Encode stats to JSON and print to STDERR.
>> +               json.NewEncoder(os.Stderr).Encode(diff)
>> +
>> +               // Save stats for the next loop.
>> +               prev =3D stats
>> +       }
>> +-}
>> + }()
>> + ```
>> +
>> +@@ -366,25 +495,83 @@ It's also useful to pipe these stats to a service
>> such as statsd for monitoring
>> + or to provide an HTTP endpoint that will perform a fixed-length sample=
.
>> +
>> +
>> ++### Read-Only Mode
>> ++
>> ++Sometimes it is useful to create a shared, read-only Bolt database. To
>> this,
>> ++set the `Options.ReadOnly` flag when opening your database. Read-only
>> mode
>> ++uses a shared lock to allow multiple processes to read from the
>> database but
>> ++it will block any processes from opening the database in read-write
>> mode.
>> ++
>> ++```go
>> ++db, err :=3D bolt.Open("my.db", 0666, &bolt.Options{ReadOnly: true})
>> ++if err !=3D nil {
>> ++      log.Fatal(err)
>> ++}
>> ++```
>> ++
>> ++
>> + ## Resources
>> +
>> + For more information on getting started with Bolt, check out the
>> following articles:
>> +
>> + * [Intro to BoltDB: Painless Performant Persistence](
>> http://npf.io/2014/07/intro-to-boltdb-painless-performant-persistence/)
>> by [Nate Finch](https://github.com/natefinch).
>> ++* [Bolt -- an embedded key/value database for Go](
>> https://www.progville.com/go/bolt-embedded-db-golang/) by Progville
>> ++
>> ++
>> ++## Comparison with other databases
>> ++
>> ++### Postgres, MySQL, & other relational databases
>> ++
>> ++Relational databases structure data into rows and are only accessible
>> through
>> ++the use of SQL. This approach provides flexibility in how you store an=
d
>> query
>> ++your data but also incurs overhead in parsing and planning SQL
>> statements. Bolt
>> ++accesses all data by a byte slice key. This makes Bolt fast to read an=
d
>> write
>> ++data by key but provides no built-in support for joining values
>> together.
>> ++
>> ++Most relational databases (with the exception of SQLite) are standalon=
e
>> servers
>> ++that run separately from your application. This gives your systems
>> ++flexibility to connect multiple application servers to a single databa=
se
>> ++server but also adds overhead in serializing and transporting data ove=
r
>> the
>> ++network. Bolt runs as a library included in your application so all
>> data access
>> ++has to go through your application's process. This brings data closer
>> to your
>> ++application but limits multi-process access to the data.
>> ++
>> ++
>> ++### LevelDB, RocksDB
>> +
>> ++LevelDB and its derivatives (RocksDB, HyperLevelDB) are similar to Bol=
t
>> in that
>> ++they are libraries bundled into the application, however, their
>> underlying
>> ++structure is a log-structured merge-tree (LSM tree). An LSM tree
>> optimizes
>> ++random writes by using a write ahead log and multi-tiered, sorted file=
s
>> called
>> ++SSTables. Bolt uses a B+tree internally and only a single file. Both
>> approaches
>> ++have trade offs.
>> +
>> ++If you require a high random write throughput (>10,000 w/sec) or you
>> need to use
>> ++spinning disks then LevelDB could be a good choice. If your applicatio=
n
>> is
>> ++read-heavy or does a lot of range scans then Bolt could be a good
>> choice.
>> +
>> +-## Comparing Bolt to LMDB
>> ++One other important consideration is that LevelDB does not have
>> transactions.
>> ++It supports batch writing of key/values pairs and it supports read
>> snapshots
>> ++but it will not give you the ability to do a compare-and-swap operatio=
n
>> safely.
>> ++Bolt supports fully serializable ACID transactions.
>> ++
>> ++
>> ++### LMDB
>> +
>> + Bolt was originally a port of LMDB so it is architecturally similar.
>> Both use
>> +-a B+tree, have ACID semanetics with fully serializable transactions,
>> and support
>> ++a B+tree, have ACID semantics with fully serializable transactions, an=
d
>> support
>> + lock-free MVCC using a single writer and multiple readers.
>> +
>> + The two projects have somewhat diverged. LMDB heavily focuses on raw
>> performance
>> + while Bolt has focused on simplicity and ease of use. For example, LMD=
B
>> allows
>> +-several unsafe actions such as direct writes and append writes for the
>> sake of
>> +-performance. Bolt opts to disallow actions which can leave the databas=
e
>> in a
>> +-corrupted state. The only exception to this in Bolt is `DB.NoSync`.
>> ++several unsafe actions such as direct writes for the sake of
>> performance. Bolt
>> ++opts to disallow actions which can leave the database in a corrupted
>> state. The
>> ++only exception to this in Bolt is `DB.NoSync`.
>> ++
>> ++There are also a few differences in API. LMDB requires a maximum mmap
>> size when
>> ++opening an `mdb_env` whereas Bolt will handle incremental mmap resizin=
g
>> ++automatically. LMDB overloads the getter and setter functions with
>> multiple
>> ++flags whereas Bolt splits these specialized cases into their own
>> functions.
>> +
>> +
>> + ## Caveats & Limitations
>> +@@ -425,14 +612,33 @@ Here are a few things to note when evaluating and
>> using Bolt:
>> +   can in memory and will release memory as needed to other processes.
>> This means
>> +   that Bolt can show very high memory usage when working with large
>> databases.
>> +   However, this is expected and the OS will release memory as needed.
>> Bolt can
>> +-  handle databases much larger than the available physical RAM.
>> ++  handle databases much larger than the available physical RAM,
>> provided its
>> ++  memory-map fits in the process virtual address space. It may be
>> problematic
>> ++  on 32-bits systems.
>> ++
>> ++* The data structures in the Bolt database are memory mapped so the
>> data file
>> ++  will be endian specific. This means that you cannot copy a Bolt file
>> from a
>> ++  little endian machine to a big endian machine and have it work. For
>> most
>> ++  users this is not a concern since most modern CPUs are little endian=
.
>> ++
>> ++* Because of the way pages are laid out on disk, Bolt cannot truncate
>> data files
>> ++  and return free pages back to the disk. Instead, Bolt maintains a
>> free list
>> ++  of unused pages within its data file. These free pages can be reused
>> by later
>> ++  transactions. This works well for many use cases as databases
>> generally tend
>> ++  to grow. However, it's important to note that deleting large chunks
>> of data
>> ++  will not allow you to reclaim that space on disk.
>> ++
>> ++  For more information on page allocation, [see this
>> comment][page-allocation].
>> ++
>> ++[page-allocation]:
>> https://github.com/boltdb/bolt/issues/308#issuecomment-74811638
>> +
>> +
>> + ## Other Projects Using Bolt
>> +
>> + Below is a list of public, open source projects that use Bolt:
>> +
>> +-* [Bazil](https://github.com/bazillion/bazil) - A file system that
>> lets your data reside where it is most convenient for it to reside.
>> ++* [Operation Go: A Routine Mission](http://gocode.io) - An online
>> programming game for Golang using Bolt for user accounts and a leaderboa=
rd.
>> ++* [Bazil](https://bazil.org/) - A file system that lets your data
>> reside where it is most convenient for it to reside.
>> + * [DVID](https://github.com/janelia-flyem/dvid) - Added Bolt as
>> optional storage engine and testing it against Basho-tuned leveldb.
>> + * [Skybox Analytics](https://github.com/skybox/skybox) - A standalone
>> funnel analysis tool for web analytics.
>> + * [Scuttlebutt](https://github.com/benbjohnson/scuttlebutt) - Uses
>> Bolt to store and process all Twitter mentions of GitHub projects.
>> +@@ -450,6 +656,16 @@ Below is a list of public, open source projects
>> that use Bolt:
>> + * [bleve](http://www.blevesearch.com/) - A pure Go search engine
>> similar to ElasticSearch that uses Bolt as the default storage backend.
>> + * [tentacool](https://github.com/optiflows/tentacool) - REST api
>> server to manage system stuff (IP, DNS, Gateway...) on a linux server.
>> + * [SkyDB](https://github.com/skydb/sky) - Behavioral analytics
>> database.
>> ++* [Seaweed File System](https://github.com/chrislusf/weed-fs) - Highly
>> scalable distributed key~file system with O(1) disk read.
>> ++* [InfluxDB](http://influxdb.com) - Scalable datastore for metrics,
>> events, and real-time analytics.
>> ++* [Freehold](http://tshannon.bitbucket.org/freehold/) - An open,
>> secure, and lightweight platform for your files and data.
>> ++* [Prometheus Annotation Server](
>> https://github.com/oliver006/prom_annotation_server) - Annotation server
>> for PromDash & Prometheus service monitoring system.
>> ++* [Consul](https://github.com/hashicorp/consul) - Consul is service
>> discovery and configuration made easy. Distributed, highly available, an=
d
>> datacenter-aware.
>> ++* [Kala](https://github.com/ajvb/kala) - Kala is a modern job
>> scheduler optimized to run on a single node. It is persistent, JSON over
>> HTTP API, ISO 8601 duration notation, and dependent jobs.
>> ++* [drive](https://github.com/odeke-em/drive) - drive is an unofficial
>> Google Drive command line client for \*NIX operating systems.
>> ++* [stow](https://github.com/djherbis/stow) -  a persistence manager
>> for objects
>> ++  backed by boltdb.
>> ++* [buckets](https://github.com/joyrexus/buckets) - a bolt wrapper
>> streamlining
>> ++  simple tx and key scans.
>> +
>> + If you are using Bolt in a project please send a pull request to add i=
t
>> to the list.
>> +-
>> +diff --git a/vendor/src/github.com/boltdb/bolt/batch.go b/vendor/src/
>> github.com/boltdb/bolt/batch.go
>> +new file mode 100644
>> +index 0000000..84acae6
>> +--- /dev/null
>> ++++ b/vendor/src/github.com/boltdb/bolt/batch.go
>> +@@ -0,0 +1,138 @@
>> ++package bolt
>> ++
>> ++import (
>> ++      "errors"
>> ++      "fmt"
>> ++      "sync"
>> ++      "time"
>> ++)
>> ++
>> ++// Batch calls fn as part of a batch. It behaves similar to Update,
>> ++// except:
>> ++//
>> ++// 1. concurrent Batch calls can be combined into a single Bolt
>> ++// transaction.
>> ++//
>> ++// 2. the function passed to Batch may be called multiple times,
>> ++// regardless of whether it returns error or not.
>> ++//
>> ++// This means that Batch function side effects must be idempotent and
>> ++// take permanent effect only after a successful return is seen in
>> ++// caller.
>> ++//
>> ++// The maximum batch size and delay can be adjusted with DB.MaxBatchSi=
ze
>> ++// and DB.MaxBatchDelay, respectively.
>> ++//
>> ++// Batch is only useful when there are multiple goroutines calling it.
>> ++func (db *DB) Batch(fn func(*Tx) error) error {
>> ++      errCh :=3D make(chan error, 1)
>> ++
>> ++      db.batchMu.Lock()
>> ++      if (db.batch =3D=3D nil) || (db.batch !=3D nil && len(db.batch.c=
alls)
>> >=3D db.MaxBatchSize) {
>> ++              // There is no existing batch, or the existing batch is
>> full; start a new one.
>> ++              db.batch =3D &batch{
>> ++                      db: db,
>> ++              }
>> ++              db.batch.timer =3D time.AfterFunc(db.MaxBatchDelay,
>> db.batch.trigger)
>> ++      }
>> ++      db.batch.calls =3D append(db.batch.calls, call{fn: fn, err: errC=
h})
>> ++      if len(db.batch.calls) >=3D db.MaxBatchSize {
>> ++              // wake up batch, it's ready to run
>> ++              go db.batch.trigger()
>> ++      }
>> ++      db.batchMu.Unlock()
>> ++
>> ++      err :=3D <-errCh
>> ++      if err =3D=3D trySolo {
>> ++              err =3D db.Update(fn)
>> ++      }
>> ++      return err
>> ++}
>> ++
>> ++type call struct {
>> ++      fn  func(*Tx) error
>> ++      err chan<- error
>> ++}
>> ++
>> ++type batch struct {
>> ++      db    *DB
>> ++      timer *time.Timer
>> ++      start sync.Once
>> ++      calls []call
>> ++}
>> ++
>> ++// trigger runs the batch if it hasn't already been run.
>> ++func (b *batch) trigger() {
>> ++      b.start.Do(b.run)
>> ++}
>> ++
>> ++// run performs the transactions in the batch and communicates results
>> ++// back to DB.Batch.
>> ++func (b *batch) run() {
>> ++      b.db.batchMu.Lock()
>> ++      b.timer.Stop()
>> ++      // Make sure no new work is added to this batch, but don't break
>> ++      // other batches.
>> ++      if b.db.batch =3D=3D b {
>> ++              b.db.batch =3D nil
>> ++      }
>> ++      b.db.batchMu.Unlock()
>> ++
>> ++retry:
>> ++      for len(b.calls) > 0 {
>> ++              var failIdx =3D -1
>> ++              err :=3D b.db.Update(func(tx *Tx) error {
>> ++                      for i, c :=3D range b.calls {
>> ++                              if err :=3D safelyCall(c.fn, tx); err !=
=3D
>> nil {
>> ++                                      failIdx =3D i
>> ++                                      return err
>> ++                              }
>> ++                      }
>> ++                      return nil
>> ++              })
>> ++
>> ++              if failIdx >=3D 0 {
>> ++                      // take the failing transaction out of the batch=
.
>> it's
>> ++                      // safe to shorten b.calls here because db.batch
>> no longer
>> ++                      // points to us, and we hold the mutex anyway.
>> ++                      c :=3D b.calls[failIdx]
>> ++                      b.calls[failIdx], b.calls =3D
>> b.calls[len(b.calls)-1], b.calls[:len(b.calls)-1]
>> ++                      // tell the submitter re-run it solo, continue
>> with the rest of the batch
>> ++                      c.err <- trySolo
>> ++                      continue retry
>> ++              }
>> ++
>> ++              // pass success, or bolt internal errors, to all callers
>> ++              for _, c :=3D range b.calls {
>> ++                      if c.err !=3D nil {
>> ++                              c.err <- err
>> ++                      }
>> ++              }
>> ++              break retry
>> ++      }
>> ++}
>> ++
>> ++// trySolo is a special sentinel error value used for signaling that a
>> ++// transaction function should be re-run. It should never be seen by
>> ++// callers.
>> ++var trySolo =3D errors.New("batch function returned an error and shoul=
d
>> be re-run solo")
>> ++
>> ++type panicked struct {
>> ++      reason interface{}
>> ++}
>> ++
>> ++func (p panicked) Error() string {
>> ++      if err, ok :=3D p.reason.(error); ok {
>> ++              return err.Error()
>> ++      }
>> ++      return fmt.Sprintf("panic: %v", p.reason)
>> ++}
>> ++
>> ++func safelyCall(fn func(*Tx) error, tx *Tx) (err error) {
>> ++      defer func() {
>> ++              if p :=3D recover(); p !=3D nil {
>> ++                      err =3D panicked{p}
>> ++              }
>> ++      }()
>> ++      return fn(tx)
>> ++}
>> +diff --git a/vendor/src/github.com/boltdb/bolt/bolt_386.go b/vendor/src=
/
>> github.com/boltdb/bolt/bolt_386.go
>> +index 856f401..e659bfb 100644
>> +--- a/vendor/src/github.com/boltdb/bolt/bolt_386.go
>> ++++ b/vendor/src/github.com/boltdb/bolt/bolt_386.go
>> +@@ -1,4 +1,7 @@
>> + package bolt
>> +
>> + // maxMapSize represents the largest mmap size supported by Bolt.
>> +-const maxMapSize =3D 0xFFFFFFF // 256MB
>> ++const maxMapSize =3D 0x7FFFFFFF // 2GB
>> ++
>> ++// maxAllocSize is the size used when creating array pointers.
>> ++const maxAllocSize =3D 0xFFFFFFF
>> +diff --git a/vendor/src/github.com/boltdb/bolt/bolt_amd64.go
>> b/vendor/src/github.com/boltdb/bolt/bolt_amd64.go
>> +index 4262932..cca6b7e 100644
>> +--- a/vendor/src/github.com/boltdb/bolt/bolt_amd64.go
>> ++++ b/vendor/src/github.com/boltdb/bolt/bolt_amd64.go
>> +@@ -2,3 +2,6 @@ package bolt
>> +
>> + // maxMapSize represents the largest mmap size supported by Bolt.
>> + const maxMapSize =3D 0xFFFFFFFFFFFF // 256TB
>> ++
>> ++// maxAllocSize is the size used when creating array pointers.
>> ++const maxAllocSize =3D 0x7FFFFFFF
>> +diff --git a/vendor/src/github.com/boltdb/bolt/bolt_arm.go b/vendor/src=
/
>> github.com/boltdb/bolt/bolt_arm.go
>> +index 856f401..e659bfb 100644
>> +--- a/vendor/src/github.com/boltdb/bolt/bolt_arm.go
>> ++++ b/vendor/src/github.com/boltdb/bolt/bolt_arm.go
>> +@@ -1,4 +1,7 @@
>> + package bolt
>> +
>> + // maxMapSize represents the largest mmap size supported by Bolt.
>> +-const maxMapSize =3D 0xFFFFFFF // 256MB
>> ++const maxMapSize =3D 0x7FFFFFFF // 2GB
>> ++
>> ++// maxAllocSize is the size used when creating array pointers.
>> ++const maxAllocSize =3D 0xFFFFFFF
>> +diff --git a/vendor/src/github.com/boltdb/bolt/bolt_arm64.go
>> b/vendor/src/github.com/boltdb/bolt/bolt_arm64.go
>> +new file mode 100644
>> +index 0000000..6d23093
>> +--- /dev/null
>> ++++ b/vendor/src/github.com/boltdb/bolt/bolt_arm64.go
>> +@@ -0,0 +1,9 @@
>> ++// +build arm64
>> ++
>> ++package bolt
>> ++
>> ++// maxMapSize represents the largest mmap size supported by Bolt.
>> ++const maxMapSize =3D 0xFFFFFFFFFFFF // 256TB
>> ++
>> ++// maxAllocSize is the size used when creating array pointers.
>> ++const maxAllocSize =3D 0x7FFFFFFF
>> +diff --git a/vendor/src/github.com/boltdb/bolt/bolt_ppc64le.go
>> b/vendor/src/github.com/boltdb/bolt/bolt_ppc64le.go
>> +new file mode 100644
>> +index 0000000..8351e12
>> +--- /dev/null
>> ++++ b/vendor/src/github.com/boltdb/bolt/bolt_ppc64le.go
>> +@@ -0,0 +1,9 @@
>> ++// +build ppc64le
>> ++
>> ++package bolt
>> ++
>> ++// maxMapSize represents the largest mmap size supported by Bolt.
>> ++const maxMapSize =3D 0xFFFFFFFFFFFF // 256TB
>> ++
>> ++// maxAllocSize is the size used when creating array pointers.
>> ++const maxAllocSize =3D 0x7FFFFFFF
>> +diff --git a/vendor/src/github.com/boltdb/bolt/bolt_s390x.go
>> b/vendor/src/github.com/boltdb/bolt/bolt_s390x.go
>> +new file mode 100644
>> +index 0000000..f4dd26b
>> +--- /dev/null
>> ++++ b/vendor/src/github.com/boltdb/bolt/bolt_s390x.go
>> +@@ -0,0 +1,9 @@
>> ++// +build s390x
>> ++
>> ++package bolt
>> ++
>> ++// maxMapSize represents the largest mmap size supported by Bolt.
>> ++const maxMapSize =3D 0xFFFFFFFFFFFF // 256TB
>> ++
>> ++// maxAllocSize is the size used when creating array pointers.
>> ++const maxAllocSize =3D 0x7FFFFFFF
>> +diff --git a/vendor/src/github.com/boltdb/bolt/bolt_unix.go
>> b/vendor/src/github.com/boltdb/bolt/bolt_unix.go
>> +index 95647a7..6eef6b2 100644
>> +--- a/vendor/src/github.com/boltdb/bolt/bolt_unix.go
>> ++++ b/vendor/src/github.com/boltdb/bolt/bolt_unix.go
>> +@@ -1,8 +1,9 @@
>> +-// +build !windows,!plan9
>> ++// +build !windows,!plan9,!solaris
>> +
>> + package bolt
>> +
>> + import (
>> ++      "fmt"
>> +       "os"
>> +       "syscall"
>> +       "time"
>> +@@ -10,7 +11,7 @@ import (
>> + )
>> +
>> + // flock acquires an advisory lock on a file descriptor.
>> +-func flock(f *os.File, timeout time.Duration) error {
>> ++func flock(f *os.File, exclusive bool, timeout time.Duration) error {
>> +       var t time.Time
>> +       for {
>> +               // If we're beyond our timeout then return an error.
>> +@@ -20,9 +21,13 @@ func flock(f *os.File, timeout time.Duration) error =
{
>> +               } else if timeout > 0 && time.Since(t) > timeout {
>> +                       return ErrTimeout
>> +               }
>> ++              flag :=3D syscall.LOCK_SH
>> ++              if exclusive {
>> ++                      flag =3D syscall.LOCK_EX
>> ++              }
>> +
>> +               // Otherwise attempt to obtain an exclusive lock.
>> +-              err :=3D syscall.Flock(int(f.Fd()),
>> syscall.LOCK_EX|syscall.LOCK_NB)
>> ++              err :=3D syscall.Flock(int(f.Fd()), flag|syscall.LOCK_NB=
)
>> +               if err =3D=3D nil {
>> +                       return nil
>> +               } else if err !=3D syscall.EWOULDBLOCK {
>> +@@ -41,11 +46,28 @@ func funlock(f *os.File) error {
>> +
>> + // mmap memory maps a DB's data file.
>> + func mmap(db *DB, sz int) error {
>> ++      // Truncate and fsync to ensure file size metadata is flushed.
>> ++      // https://github.com/boltdb/bolt/issues/284
>> ++      if !db.NoGrowSync && !db.readOnly {
>> ++              if err :=3D db.file.Truncate(int64(sz)); err !=3D nil {
>> ++                      return fmt.Errorf("file resize error: %s", err)
>> ++              }
>> ++              if err :=3D db.file.Sync(); err !=3D nil {
>> ++                      return fmt.Errorf("file sync error: %s", err)
>> ++              }
>> ++      }
>> ++
>> ++      // Map the data file to memory.
>> +       b, err :=3D syscall.Mmap(int(db.file.Fd()), 0, sz,
>> syscall.PROT_READ, syscall.MAP_SHARED)
>> +       if err !=3D nil {
>> +               return err
>> +       }
>> +
>> ++      // Advise the kernel that the mmap is accessed randomly.
>> ++      if err :=3D madvise(b, syscall.MADV_RANDOM); err !=3D nil {
>> ++              return fmt.Errorf("madvise: %s", err)
>> ++      }
>> ++
>> +       // Save the original byte slice and convert to a byte array
>> pointer.
>> +       db.dataref =3D b
>> +       db.data =3D (*[maxMapSize]byte)(unsafe.Pointer(&b[0]))
>> +@@ -67,3 +89,12 @@ func munmap(db *DB) error {
>> +       db.datasz =3D 0
>> +       return err
>> + }
>> ++
>> ++// NOTE: This function is copied from stdlib because it is not
>> available on darwin.
>> ++func madvise(b []byte, advice int) (err error) {
>> ++      _, _, e1 :=3D syscall.Syscall(syscall.SYS_MADVISE,
>> uintptr(unsafe.Pointer(&b[0])), uintptr(len(b)), uintptr(advice))
>> ++      if e1 !=3D 0 {
>> ++              err =3D e1
>> ++      }
>> ++      return
>> ++}
>> +diff --git a/vendor/src/github.com/boltdb/bolt/bolt_unix_solaris.go
>> b/vendor/src/github.com/boltdb/bolt/bolt_unix_solaris.go
>> +new file mode 100644
>> +index 0000000..f480ee7
>> +--- /dev/null
>> ++++ b/vendor/src/github.com/boltdb/bolt/bolt_unix_solaris.go
>> +@@ -0,0 +1,101 @@
>> ++
>> ++package bolt
>> ++
>> ++import (
>> ++      "fmt"
>> ++      "os"
>> ++      "syscall"
>> ++      "time"
>> ++      "unsafe"
>> ++      "golang.org/x/sys/unix"
>> ++)
>> ++
>> ++// flock acquires an advisory lock on a file descriptor.
>> ++func flock(f *os.File, exclusive bool, timeout time.Duration) error {
>> ++      var t time.Time
>> ++      for {
>> ++              // If we're beyond our timeout then return an error.
>> ++              // This can only occur after we've attempted a flock onc=
e.
>> ++              if t.IsZero() {
>> ++                      t =3D time.Now()
>> ++              } else if timeout > 0 && time.Since(t) > timeout {
>> ++                      return ErrTimeout
>> ++              }
>> ++              var lock syscall.Flock_t
>> ++              lock.Start =3D 0
>> ++              lock.Len =3D 0
>> ++              lock.Pid =3D 0
>> ++              lock.Whence =3D 0
>> ++              lock.Pid =3D 0
>> ++              if exclusive {
>> ++                      lock.Type =3D syscall.F_WRLCK
>> ++              } else {
>> ++                      lock.Type =3D syscall.F_RDLCK
>> ++              }
>> ++              err :=3D syscall.FcntlFlock(f.Fd(), syscall.F_SETLK, &lo=
ck)
>> ++              if err =3D=3D nil {
>> ++                      return nil
>> ++              } else if err !=3D syscall.EAGAIN {
>> ++                      return err
>> ++              }
>> ++
>> ++              // Wait for a bit and try again.
>> ++              time.Sleep(50 * time.Millisecond)
>> ++      }
>> ++}
>> ++
>> ++// funlock releases an advisory lock on a file descriptor.
>> ++func funlock(f *os.File) error {
>> ++      var lock syscall.Flock_t
>> ++      lock.Start =3D 0
>> ++      lock.Len =3D 0
>> ++      lock.Type =3D syscall.F_UNLCK
>> ++      lock.Whence =3D 0
>> ++      return syscall.FcntlFlock(uintptr(f.Fd()), syscall.F_SETLK, &loc=
k)
>> ++}
>> ++
>> ++// mmap memory maps a DB's data file.
>> ++func mmap(db *DB, sz int) error {
>> ++      // Truncate and fsync to ensure file size metadata is flushed.
>> ++      // https://github.com/boltdb/bolt/issues/284
>> ++      if !db.NoGrowSync && !db.readOnly {
>> ++              if err :=3D db.file.Truncate(int64(sz)); err !=3D nil {
>> ++                      return fmt.Errorf("file resize error: %s", err)
>> ++              }
>> ++              if err :=3D db.file.Sync(); err !=3D nil {
>> ++                      return fmt.Errorf("file sync error: %s", err)
>> ++              }
>> ++      }
>> ++
>> ++      // Map the data file to memory.
>> ++      b, err :=3D unix.Mmap(int(db.file.Fd()), 0, sz, syscall.PROT_REA=
D,
>> syscall.MAP_SHARED)
>> ++      if err !=3D nil {
>> ++              return err
>> ++      }
>> ++
>> ++      // Advise the kernel that the mmap is accessed randomly.
>> ++      if err :=3D unix.Madvise(b, syscall.MADV_RANDOM); err !=3D nil {
>> ++              return fmt.Errorf("madvise: %s", err)
>> ++      }
>> ++
>> ++      // Save the original byte slice and convert to a byte array
>> pointer.
>> ++      db.dataref =3D b
>> ++      db.data =3D (*[maxMapSize]byte)(unsafe.Pointer(&b[0]))
>> ++      db.datasz =3D sz
>> ++      return nil
>> ++}
>> ++
>> ++// munmap unmaps a DB's data file from memory.
>> ++func munmap(db *DB) error {
>> ++      // Ignore the unmap if we have no mapped data.
>> ++      if db.dataref =3D=3D nil {
>> ++              return nil
>> ++      }
>> ++
>> ++      // Unmap using the original byte slice.
>> ++      err :=3D unix.Munmap(db.dataref)
>> ++      db.dataref =3D nil
>> ++      db.data =3D nil
>> ++      db.datasz =3D 0
>> ++      return err
>> ++}
>> +diff --git a/vendor/src/github.com/boltdb/bolt/bolt_windows.go
>> b/vendor/src/github.com/boltdb/bolt/bolt_windows.go
>> +index c8539d4..8b782be 100644
>> +--- a/vendor/src/github.com/boltdb/bolt/bolt_windows.go
>> ++++ b/vendor/src/github.com/boltdb/bolt/bolt_windows.go
>> +@@ -16,7 +16,7 @@ func fdatasync(db *DB) error {
>> + }
>> +
>> + // flock acquires an advisory lock on a file descriptor.
>> +-func flock(f *os.File, _ time.Duration) error {
>> ++func flock(f *os.File, _ bool, _ time.Duration) error {
>> +       return nil
>> + }
>> +
>> +@@ -28,9 +28,11 @@ func funlock(f *os.File) error {
>> + // mmap memory maps a DB's data file.
>> + // Based on: https://github.com/edsrzf/mmap-go
>> + func mmap(db *DB, sz int) error {
>> +-      // Truncate the database to the size of the mmap.
>> +-      if err :=3D db.file.Truncate(int64(sz)); err !=3D nil {
>> +-              return fmt.Errorf("truncate: %s", err)
>> ++      if !db.readOnly {
>> ++              // Truncate the database to the size of the mmap.
>> ++              if err :=3D db.file.Truncate(int64(sz)); err !=3D nil {
>> ++                      return fmt.Errorf("truncate: %s", err)
>> ++              }
>> +       }
>> +
>> +       // Open a file mapping handle.
>> +diff --git a/vendor/src/github.com/boltdb/bolt/bucket.go b/vendor/src/
>> github.com/boltdb/bolt/bucket.go
>> +index 2630800..2925288 100644
>> +--- a/vendor/src/github.com/boltdb/bolt/bucket.go
>> ++++ b/vendor/src/github.com/boltdb/bolt/bucket.go
>> +@@ -99,6 +99,7 @@ func (b *Bucket) Cursor() *Cursor {
>> +
>> + // Bucket retrieves a nested bucket by name.
>> + // Returns nil if the bucket does not exist.
>> ++// The bucket instance is only valid for the lifetime of the
>> transaction.
>> + func (b *Bucket) Bucket(name []byte) *Bucket {
>> +       if b.buckets !=3D nil {
>> +               if child :=3D b.buckets[string(name)]; child !=3D nil {
>> +@@ -148,6 +149,7 @@ func (b *Bucket) openBucket(value []byte) *Bucket {
>> +
>> + // CreateBucket creates a new bucket at the given key and returns the
>> new bucket.
>> + // Returns an error if the key already exists, if the bucket name is
>> blank, or if the bucket name is too long.
>> ++// The bucket instance is only valid for the lifetime of the
>> transaction.
>> + func (b *Bucket) CreateBucket(key []byte) (*Bucket, error) {
>> +       if b.tx.db =3D=3D nil {
>> +               return nil, ErrTxClosed
>> +@@ -192,6 +194,7 @@ func (b *Bucket) CreateBucket(key []byte) (*Bucket,
>> error) {
>> +
>> + // CreateBucketIfNotExists creates a new bucket if it doesn't already
>> exist and returns a reference to it.
>> + // Returns an error if the bucket name is blank, or if the bucket name
>> is too long.
>> ++// The bucket instance is only valid for the lifetime of the
>> transaction.
>> + func (b *Bucket) CreateBucketIfNotExists(key []byte) (*Bucket, error) =
{
>> +       child, err :=3D b.CreateBucket(key)
>> +       if err =3D=3D ErrBucketExists {
>> +@@ -252,6 +255,7 @@ func (b *Bucket) DeleteBucket(key []byte) error {
>> +
>> + // Get retrieves the value for a key in the bucket.
>> + // Returns a nil value if the key does not exist or if the key is a
>> nested bucket.
>> ++// The returned value is only valid for the life of the transaction.
>> + func (b *Bucket) Get(key []byte) []byte {
>> +       k, v, flags :=3D b.Cursor().seek(key)
>> +
>> +@@ -332,6 +336,12 @@ func (b *Bucket) NextSequence() (uint64, error) {
>> +               return 0, ErrTxNotWritable
>> +       }
>> +
>> ++      // Materialize the root node if it hasn't been already so that t=
he
>> ++      // bucket will be saved during commit.
>> ++      if b.rootNode =3D=3D nil {
>> ++              _ =3D b.node(b.root, nil)
>> ++      }
>> ++
>> +       // Increment and return the sequence.
>> +       b.bucket.sequence++
>> +       return b.bucket.sequence, nil
>> +@@ -339,7 +349,8 @@ func (b *Bucket) NextSequence() (uint64, error) {
>> +
>> + // ForEach executes a function for each key/value pair in a bucket.
>> + // If the provided function returns an error then the iteration is
>> stopped and
>> +-// the error is returned to the caller.
>> ++// the error is returned to the caller. The provided function must not
>> modify
>> ++// the bucket; this will result in undefined behavior.
>> + func (b *Bucket) ForEach(fn func(k, v []byte) error) error {
>> +       if b.tx.db =3D=3D nil {
>> +               return ErrTxClosed
>> +@@ -511,8 +522,12 @@ func (b *Bucket) spill() error {
>> +               // Update parent node.
>> +               var c =3D b.Cursor()
>> +               k, _, flags :=3D c.seek([]byte(name))
>> +-              _assert(bytes.Equal([]byte(name), k), "misplaced bucket
>> header: %x -> %x", []byte(name), k)
>> +-              _assert(flags&bucketLeafFlag !=3D 0, "unexpected bucket
>> header flag: %x", flags)
>> ++              if !bytes.Equal([]byte(name), k) {
>> ++                      panic(fmt.Sprintf("misplaced bucket header: %x -=
>
>> %x", []byte(name), k))
>> ++              }
>> ++              if flags&bucketLeafFlag =3D=3D 0 {
>> ++                      panic(fmt.Sprintf("unexpected bucket header flag=
:
>> %x", flags))
>> ++              }
>> +               c.node().put([]byte(name), []byte(name), value, 0,
>> bucketLeafFlag)
>> +       }
>> +
>> +@@ -528,7 +543,9 @@ func (b *Bucket) spill() error {
>> +       b.rootNode =3D b.rootNode.root()
>> +
>> +       // Update the root node for this bucket.
>> +-      _assert(b.rootNode.pgid < b.tx.meta.pgid, "pgid (%d) above high
>> water mark (%d)", b.rootNode.pgid, b.tx.meta.pgid)
>> ++      if b.rootNode.pgid >=3D b.tx.meta.pgid {
>> ++              panic(fmt.Sprintf("pgid (%d) above high water mark (%d)"=
,
>> b.rootNode.pgid, b.tx.meta.pgid))
>> ++      }
>> +       b.root =3D b.rootNode.pgid
>> +
>> +       return nil
>> +@@ -659,7 +676,9 @@ func (b *Bucket) pageNode(id pgid) (*page, *node) {
>> +       // Inline buckets have a fake page embedded in their value so
>> treat them
>> +       // differently. We'll return the rootNode (if available) or the
>> fake page.
>> +       if b.root =3D=3D 0 {
>> +-              _assert(id =3D=3D 0, "inline bucket non-zero page access=
(2):
>> %d !=3D 0", id)
>> ++              if id !=3D 0 {
>> ++                      panic(fmt.Sprintf("inline bucket non-zero page
>> access(2): %d !=3D 0", id))
>> ++              }
>> +               if b.rootNode !=3D nil {
>> +                       return nil, b.rootNode
>> +               }
>> +diff --git a/vendor/src/github.com/boltdb/bolt/cursor.go b/vendor/src/
>> github.com/boltdb/bolt/cursor.go
>> +index 3bfc2f1..006c548 100644
>> +--- a/vendor/src/github.com/boltdb/bolt/cursor.go
>> ++++ b/vendor/src/github.com/boltdb/bolt/cursor.go
>> +@@ -2,6 +2,7 @@ package bolt
>> +
>> + import (
>> +       "bytes"
>> ++      "fmt"
>> +       "sort"
>> + )
>> +
>> +@@ -9,6 +10,8 @@ import (
>> + // Cursors see nested buckets with value =3D=3D nil.
>> + // Cursors can be obtained from a transaction and are valid as long as
>> the transaction is open.
>> + //
>> ++// Keys and values returned from the cursor are only valid for the lif=
e
>> of the transaction.
>> ++//
>> + // Changing data while traversing with a cursor may cause it to be
>> invalidated
>> + // and return unexpected keys and/or values. You must reposition your
>> cursor
>> + // after mutating data.
>> +@@ -24,6 +27,7 @@ func (c *Cursor) Bucket() *Bucket {
>> +
>> + // First moves the cursor to the first item in the bucket and returns
>> its key and value.
>> + // If the bucket is empty then a nil key and value are returned.
>> ++// The returned key and value are only valid for the life of the
>> transaction.
>> + func (c *Cursor) First() (key []byte, value []byte) {
>> +       _assert(c.bucket.tx.db !=3D nil, "tx closed")
>> +       c.stack =3D c.stack[:0]
>> +@@ -40,6 +44,7 @@ func (c *Cursor) First() (key []byte, value []byte) {
>> +
>> + // Last moves the cursor to the last item in the bucket and returns it=
s
>> key and value.
>> + // If the bucket is empty then a nil key and value are returned.
>> ++// The returned key and value are only valid for the life of the
>> transaction.
>> + func (c *Cursor) Last() (key []byte, value []byte) {
>> +       _assert(c.bucket.tx.db !=3D nil, "tx closed")
>> +       c.stack =3D c.stack[:0]
>> +@@ -57,6 +62,7 @@ func (c *Cursor) Last() (key []byte, value []byte) {
>> +
>> + // Next moves the cursor to the next item in the bucket and returns it=
s
>> key and value.
>> + // If the cursor is at the end of the bucket then a nil key and value
>> are returned.
>> ++// The returned key and value are only valid for the life of the
>> transaction.
>> + func (c *Cursor) Next() (key []byte, value []byte) {
>> +       _assert(c.bucket.tx.db !=3D nil, "tx closed")
>> +       k, v, flags :=3D c.next()
>> +@@ -68,6 +74,7 @@ func (c *Cursor) Next() (key []byte, value []byte) {
>> +
>> + // Prev moves the cursor to the previous item in the bucket and return=
s
>> its key and value.
>> + // If the cursor is at the beginning of the bucket then a nil key and
>> value are returned.
>> ++// The returned key and value are only valid for the life of the
>> transaction.
>> + func (c *Cursor) Prev() (key []byte, value []byte) {
>> +       _assert(c.bucket.tx.db !=3D nil, "tx closed")
>> +
>> +@@ -99,6 +106,7 @@ func (c *Cursor) Prev() (key []byte, value []byte) {
>> + // Seek moves the cursor to a given key and returns it.
>> + // If the key does not exist then the next key is used. If no keys
>> + // follow, a nil key is returned.
>> ++// The returned key and value are only valid for the life of the
>> transaction.
>> + func (c *Cursor) Seek(seek []byte) (key []byte, value []byte) {
>> +       k, v, flags :=3D c.seek(seek)
>> +
>> +@@ -228,8 +236,8 @@ func (c *Cursor) next() (key []byte, value []byte,
>> flags uint32) {
>> + // search recursively performs a binary search against a given
>> page/node until it finds a given key.
>> + func (c *Cursor) search(key []byte, pgid pgid) {
>> +       p, n :=3D c.bucket.pageNode(pgid)
>> +-      if p !=3D nil {
>> +-              _assert((p.flags&(branchPageFlag|leafPageFlag)) !=3D 0,
>> "invalid page type: %d: %x", p.id, p.flags)
>> ++      if p !=3D nil && (p.flags&(branchPageFlag|leafPageFlag)) =3D=3D =
0 {
>> ++              panic(fmt.Sprintf("invalid page type: %d: %x", p.id,
>> p.flags))
>> +       }
>> +       e :=3D elemRef{page: p, node: n}
>> +       c.stack =3D append(c.stack, e)
>> +diff --git a/vendor/src/github.com/boltdb/bolt/db.go b/vendor/src/
>> github.com/boltdb/bolt/db.go
>> +index 6c45736..d39c4aa 100644
>> +--- a/vendor/src/github.com/boltdb/bolt/db.go
>> ++++ b/vendor/src/github.com/boltdb/bolt/db.go
>> +@@ -12,9 +12,6 @@ import (
>> +       "unsafe"
>> + )
>> +
>> +-// The smallest size that the mmap can be.
>> +-const minMmapSize =3D 1 << 22 // 4MB
>> +-
>> + // The largest step that can be taken when remapping the mmap.
>> + const maxMmapStep =3D 1 << 30 // 1GB
>> +
>> +@@ -30,6 +27,12 @@ const magic uint32 =3D 0xED0CDAED
>> + // must be synchronzied using the msync(2) syscall.
>> + const IgnoreNoSync =3D runtime.GOOS =3D=3D "openbsd"
>> +
>> ++// Default values if not set in a DB instance.
>> ++const (
>> ++      DefaultMaxBatchSize  int =3D 1000
>> ++      DefaultMaxBatchDelay     =3D 10 * time.Millisecond
>> ++)
>> ++
>> + // DB represents a collection of buckets persisted to a file on disk.
>> + // All data access is performed through transactions which can be
>> obtained through the DB.
>> + // All the functions on DB will return a ErrDatabaseNotOpen if accesse=
d
>> before Open() is called.
>> +@@ -52,9 +55,33 @@ type DB struct {
>> +       // THIS IS UNSAFE. PLEASE USE WITH CAUTION.
>> +       NoSync bool
>> +
>> ++      // When true, skips the truncate call when growing the database.
>> ++      // Setting this to true is only safe on non-ext3/ext4 systems.
>> ++      // Skipping truncation avoids preallocation of hard drive space
>> and
>> ++      // bypasses a truncate() and fsync() syscall on remapping.
>> ++      //
>> ++      // https://github.com/boltdb/bolt/issues/284
>> ++      NoGrowSync bool
>> ++
>> ++      // MaxBatchSize is the maximum size of a batch. Default value is
>> ++      // copied from DefaultMaxBatchSize in Open.
>> ++      //
>> ++      // If <=3D0, disables batching.
>> ++      //
>> ++      // Do not change concurrently with calls to Batch.
>> ++      MaxBatchSize int
>> ++
>> ++      // MaxBatchDelay is the maximum delay before a batch starts.
>> ++      // Default value is copied from DefaultMaxBatchDelay in Open.
>> ++      //
>> ++      // If <=3D0, effectively disables batching.
>> ++      //
>> ++      // Do not change concurrently with calls to Batch.
>> ++      MaxBatchDelay time.Duration
>> ++
>> +       path     string
>> +       file     *os.File
>> +-      dataref  []byte
>> ++      dataref  []byte // mmap'ed readonly, write throws SEGV
>> +       data     *[maxMapSize]byte
>> +       datasz   int
>> +       meta0    *meta
>> +@@ -66,6 +93,9 @@ type DB struct {
>> +       freelist *freelist
>> +       stats    Stats
>> +
>> ++      batchMu sync.Mutex
>> ++      batch   *batch
>> ++
>> +       rwlock   sync.Mutex   // Allows only one writer at a time.
>> +       metalock sync.Mutex   // Protects meta page access.
>> +       mmaplock sync.RWMutex // Protects mmap access during remapping.
>> +@@ -74,6 +104,10 @@ type DB struct {
>> +       ops struct {
>> +               writeAt func(b []byte, off int64) (n int, err error)
>> +       }
>> ++
>> ++      // Read only mode.
>> ++      // When true, Update() and Begin(true) return ErrDatabaseReadOnl=
y
>> immediately.
>> ++      readOnly bool
>> + }
>> +
>> + // Path returns the path to currently open database file.
>> +@@ -101,20 +135,34 @@ func Open(path string, mode os.FileMode, options
>> *Options) (*DB, error) {
>> +       if options =3D=3D nil {
>> +               options =3D DefaultOptions
>> +       }
>> ++      db.NoGrowSync =3D options.NoGrowSync
>> ++
>> ++      // Set default values for later DB operations.
>> ++      db.MaxBatchSize =3D DefaultMaxBatchSize
>> ++      db.MaxBatchDelay =3D DefaultMaxBatchDelay
>> ++
>> ++      flag :=3D os.O_RDWR
>> ++      if options.ReadOnly {
>> ++              flag =3D os.O_RDONLY
>> ++              db.readOnly =3D true
>> ++      }
>> +
>> +       // Open data file and separate sync handler for metadata writes.
>> +       db.path =3D path
>> +-
>> +       var err error
>> +-      if db.file, err =3D os.OpenFile(db.path, os.O_RDWR|os.O_CREATE,
>> mode); err !=3D nil {
>> ++      if db.file, err =3D os.OpenFile(db.path, flag|os.O_CREATE, mode)=
;
>> err !=3D nil {
>> +               _ =3D db.close()
>> +               return nil, err
>> +       }
>> +
>> +-      // Lock file so that other processes using Bolt cannot use the
>> database
>> +-      // at the same time. This would cause corruption since the two
>> processes
>> +-      // would write meta pages and free pages separately.
>> +-      if err :=3D flock(db.file, options.Timeout); err !=3D nil {
>> ++      // Lock file so that other processes using Bolt in read-write
>> mode cannot
>> ++      // use the database  at the same time. This would cause
>> corruption since
>> ++      // the two processes would write meta pages and free pages
>> separately.
>> ++      // The database file is locked exclusively (only one process can
>> grab the lock)
>> ++      // if !options.ReadOnly.
>> ++      // The database file is locked using the shared lock (more than
>> one process may
>> ++      // hold a lock at the same time) otherwise (options.ReadOnly is
>> set).
>> ++      if err :=3D flock(db.file, !db.readOnly, options.Timeout); err !=
=3D
>> nil {
>> +               _ =3D db.close()
>> +               return nil, err
>> +       }
>> +@@ -162,16 +210,6 @@ func (db *DB) mmap(minsz int) error {
>> +       db.mmaplock.Lock()
>> +       defer db.mmaplock.Unlock()
>> +
>> +-      // Dereference all mmap references before unmapping.
>> +-      if db.rwtx !=3D nil {
>> +-              db.rwtx.root.dereference()
>> +-      }
>> +-
>> +-      // Unmap existing data before continuing.
>> +-      if err :=3D db.munmap(); err !=3D nil {
>> +-              return err
>> +-      }
>> +-
>> +       info, err :=3D db.file.Stat()
>> +       if err !=3D nil {
>> +               return fmt.Errorf("mmap stat error: %s", err)
>> +@@ -184,7 +222,20 @@ func (db *DB) mmap(minsz int) error {
>> +       if size < minsz {
>> +               size =3D minsz
>> +       }
>> +-      size =3D db.mmapSize(size)
>> ++      size, err =3D db.mmapSize(size)
>> ++      if err !=3D nil {
>> ++              return err
>> ++      }
>> ++
>> ++      // Dereference all mmap references before unmapping.
>> ++      if db.rwtx !=3D nil {
>> ++              db.rwtx.root.dereference()
>> ++      }
>> ++
>> ++      // Unmap existing data before continuing.
>> ++      if err :=3D db.munmap(); err !=3D nil {
>> ++              return err
>> ++      }
>> +
>> +       // Memory-map the data file as a byte slice.
>> +       if err :=3D mmap(db, size); err !=3D nil {
>> +@@ -215,22 +266,40 @@ func (db *DB) munmap() error {
>> + }
>> +
>> + // mmapSize determines the appropriate size for the mmap given the
>> current size
>> +-// of the database. The minimum size is 4MB and doubles until it
>> reaches 1GB.
>> +-func (db *DB) mmapSize(size int) int {
>> +-      if size <=3D minMmapSize {
>> +-              return minMmapSize
>> +-      } else if size < maxMmapStep {
>> +-              size *=3D 2
>> +-      } else {
>> +-              size +=3D maxMmapStep
>> ++// of the database. The minimum size is 1MB and doubles until it
>> reaches 1GB.
>> ++// Returns an error if the new mmap size is greater than the max
>> allowed.
>> ++func (db *DB) mmapSize(size int) (int, error) {
>> ++      // Double the size from 32KB until 1GB.
>> ++      for i :=3D uint(15); i <=3D 30; i++ {
>> ++              if size <=3D 1<<i {
>> ++                      return 1 << i, nil
>> ++              }
>> ++      }
>> ++
>> ++      // Verify the requested size is not above the maximum allowed.
>> ++      if size > maxMapSize {
>> ++              return 0, fmt.Errorf("mmap too large")
>> ++      }
>> ++
>> ++      // If larger than 1GB then grow by 1GB at a time.
>> ++      sz :=3D int64(size)
>> ++      if remainder :=3D sz % int64(maxMmapStep); remainder > 0 {
>> ++              sz +=3D int64(maxMmapStep) - remainder
>> +       }
>> +
>> +       // Ensure that the mmap size is a multiple of the page size.
>> +-      if (size % db.pageSize) !=3D 0 {
>> +-              size =3D ((size / db.pageSize) + 1) * db.pageSize
>> ++      // This should always be true since we're incrementing in MBs.
>> ++      pageSize :=3D int64(db.pageSize)
>> ++      if (sz % pageSize) !=3D 0 {
>> ++              sz =3D ((sz / pageSize) + 1) * pageSize
>> ++      }
>> ++
>> ++      // If we've exceeded the max size then only grow up to the max
>> size.
>> ++      if sz > maxMapSize {
>> ++              sz =3D maxMapSize
>> +       }
>> +
>> +-      return size
>> ++      return int(sz), nil
>> + }
>> +
>> + // init creates a new database file and initializes its meta pages.
>> +@@ -250,7 +319,6 @@ func (db *DB) init() error {
>> +               m.magic =3D magic
>> +               m.version =3D version
>> +               m.pageSize =3D uint32(db.pageSize)
>> +-              m.version =3D version
>> +               m.freelist =3D 2
>> +               m.root =3D bucket{root: 3}
>> +               m.pgid =3D 4
>> +@@ -283,8 +351,15 @@ func (db *DB) init() error {
>> + // Close releases all database resources.
>> + // All transactions must be closed before closing the database.
>> + func (db *DB) Close() error {
>> ++      db.rwlock.Lock()
>> ++      defer db.rwlock.Unlock()
>> ++
>> +       db.metalock.Lock()
>> +       defer db.metalock.Unlock()
>> ++
>> ++      db.mmaplock.RLock()
>> ++      defer db.mmaplock.RUnlock()
>> ++
>> +       return db.close()
>> + }
>> +
>> +@@ -304,8 +379,11 @@ func (db *DB) close() error {
>> +
>> +       // Close file handles.
>> +       if db.file !=3D nil {
>> +-              // Unlock the file.
>> +-              _ =3D funlock(db.file)
>> ++              // No need to unlock read-only file.
>> ++              if !db.readOnly {
>> ++                      // Unlock the file.
>> ++                      _ =3D funlock(db.file)
>> ++              }
>> +
>> +               // Close the file descriptor.
>> +               if err :=3D db.file.Close(); err !=3D nil {
>> +@@ -323,6 +401,11 @@ func (db *DB) close() error {
>> + // will cause the calls to block and be serialized until the current
>> write
>> + // transaction finishes.
>> + //
>> ++// Transactions should not be depedent on one another. Opening a read
>> ++// transaction and a write transaction in the same goroutine can cause
>> the
>> ++// writer to deadlock because the database periodically needs to
>> re-mmap itself
>> ++// as it grows and it cannot do that while a read transaction is open.
>> ++//
>> + // IMPORTANT: You must close read-only transactions after you are
>> finished or
>> + // else the database will not reclaim old pages.
>> + func (db *DB) Begin(writable bool) (*Tx, error) {
>> +@@ -371,6 +454,11 @@ func (db *DB) beginTx() (*Tx, error) {
>> + }
>> +
>> + func (db *DB) beginRWTx() (*Tx, error) {
>> ++      // If the database was opened with Options.ReadOnly, return an
>> error.
>> ++      if db.readOnly {
>> ++              return nil, ErrDatabaseReadOnly
>> ++      }
>> ++
>> +       // Obtain writer lock. This is released by the transaction when
>> it closes.
>> +       // This enforces only one writer transaction at a time.
>> +       db.rwlock.Lock()
>> +@@ -501,6 +589,12 @@ func (db *DB) View(fn func(*Tx) error) error {
>> +       return nil
>> + }
>> +
>> ++// Sync executes fdatasync() against the database file handle.
>> ++//
>> ++// This is not necessary under normal operation, however, if you use
>> NoSync
>> ++// then it allows you to force the database file to sync against the
>> disk.
>> ++func (db *DB) Sync() error { return fdatasync(db) }
>> ++
>> + // Stats retrieves ongoing performance stats for the database.
>> + // This is only updated when a transaction closes.
>> + func (db *DB) Stats() Stats {
>> +@@ -561,18 +655,30 @@ func (db *DB) allocate(count int) (*page, error) =
{
>> +       return p, nil
>> + }
>> +
>> ++func (db *DB) IsReadOnly() bool {
>> ++      return db.readOnly
>> ++}
>> ++
>> + // Options represents the options that can be set when opening a
>> database.
>> + type Options struct {
>> +       // Timeout is the amount of time to wait to obtain a file lock.
>> +       // When set to zero it will wait indefinitely. This option is on=
ly
>> +       // available on Darwin and Linux.
>> +       Timeout time.Duration
>> ++
>> ++      // Sets the DB.NoGrowSync flag before memory mapping the file.
>> ++      NoGrowSync bool
>> ++
>> ++      // Open database in read-only mode. Uses flock(..., LOCK_SH
>> |LOCK_NB) to
>> ++      // grab a shared lock (UNIX).
>> ++      ReadOnly bool
>> + }
>> +
>> + // DefaultOptions represent the options used if nil options are passed
>> into Open().
>> + // No timeout is used which will cause Bolt to wait indefinitely for a
>> lock.
>> + var DefaultOptions =3D &Options{
>> +-      Timeout: 0,
>> ++      Timeout:    0,
>> ++      NoGrowSync: false,
>> + }
>> +
>> + // Stats represents statistics about the database.
>> +@@ -647,9 +753,11 @@ func (m *meta) copy(dest *meta) {
>> +
>> + // write writes the meta onto a page.
>> + func (m *meta) write(p *page) {
>> +-
>> +-      _assert(m.root.root < m.pgid, "root bucket pgid (%d) above high
>> water mark (%d)", m.root.root, m.pgid)
>> +-      _assert(m.freelist < m.pgid, "freelist pgid (%d) above high wate=
r
>> mark (%d)", m.freelist, m.pgid)
>> ++      if m.root.root >=3D m.pgid {
>> ++              panic(fmt.Sprintf("root bucket pgid (%d) above high wate=
r
>> mark (%d)", m.root.root, m.pgid))
>> ++      } else if m.freelist >=3D m.pgid {
>> ++              panic(fmt.Sprintf("freelist pgid (%d) above high water
>> mark (%d)", m.freelist, m.pgid))
>> ++      }
>> +
>> +       // Page id is either going to be 0 or 1 which we can determine b=
y
>> the transaction ID.
>> +       p.id =3D pgid(m.txid % 2)
>> +@@ -675,13 +783,8 @@ func _assert(condition bool, msg string, v
>> ...interface{}) {
>> +       }
>> + }
>> +
>> +-func warn(v ...interface{}) {
>> +-      fmt.Fprintln(os.Stderr, v...)
>> +-}
>> +-
>> +-func warnf(msg string, v ...interface{}) {
>> +-      fmt.Fprintf(os.Stderr, msg+"\n", v...)
>> +-}
>> ++func warn(v ...interface{})              { fmt.Fprintln(os.Stderr,
>> v...) }
>> ++func warnf(msg string, v ...interface{}) { fmt.Fprintf(os.Stderr,
>> msg+"\n", v...) }
>> +
>> + func printstack() {
>> +       stack :=3D strings.Join(strings.Split(string(debug.Stack()),
>> "\n")[2:], "\n")
>> +diff --git a/vendor/src/github.com/boltdb/bolt/errors.go b/vendor/src/
>> github.com/boltdb/bolt/errors.go
>> +index aa504f1..6883786 100644
>> +--- a/vendor/src/github.com/boltdb/bolt/errors.go
>> ++++ b/vendor/src/github.com/boltdb/bolt/errors.go
>> +@@ -36,6 +36,10 @@ var (
>> +       // ErrTxClosed is returned when committing or rolling back a
>> transaction
>> +       // that has already been committed or rolled back.
>> +       ErrTxClosed =3D errors.New("tx closed")
>> ++
>> ++      // ErrDatabaseReadOnly is returned when a mutating transaction i=
s
>> started on a
>> ++      // read-only database.
>> ++      ErrDatabaseReadOnly =3D errors.New("database is in read-only mod=
e")
>> + )
>> +
>> + // These errors can occur when putting or deleting a value or a bucket=
.
>> +diff --git a/vendor/src/github.com/boltdb/bolt/freelist.go b/vendor/src=
/
>> github.com/boltdb/bolt/freelist.go
>> +index 150e3e6..0161948 100644
>> +--- a/vendor/src/github.com/boltdb/bolt/freelist.go
>> ++++ b/vendor/src/github.com/boltdb/bolt/freelist.go
>> +@@ -1,6 +1,7 @@
>> + package bolt
>> +
>> + import (
>> ++      "fmt"
>> +       "sort"
>> +       "unsafe"
>> + )
>> +@@ -47,15 +48,14 @@ func (f *freelist) pending_count() int {
>> +
>> + // all returns a list of all free ids and all pending ids in one sorte=
d
>> list.
>> + func (f *freelist) all() []pgid {
>> +-      ids :=3D make([]pgid, len(f.ids))
>> +-      copy(ids, f.ids)
>> ++      m :=3D make(pgids, 0)
>> +
>> +       for _, list :=3D range f.pending {
>> +-              ids =3D append(ids, list...)
>> ++              m =3D append(m, list...)
>> +       }
>> +
>> +-      sort.Sort(pgids(ids))
>> +-      return ids
>> ++      sort.Sort(m)
>> ++      return pgids(f.ids).merge(m)
>> + }
>> +
>> + // allocate returns the starting page id of a contiguous list of pages
>> of a given size.
>> +@@ -67,7 +67,9 @@ func (f *freelist) allocate(n int) pgid {
>> +
>> +       var initial, previd pgid
>> +       for i, id :=3D range f.ids {
>> +-              _assert(id > 1, "invalid page allocation: %d", id)
>> ++              if id <=3D 1 {
>> ++                      panic(fmt.Sprintf("invalid page allocation: %d",
>> id))
>> ++              }
>> +
>> +               // Reset initial page if this is not contiguous.
>> +               if previd =3D=3D 0 || id-previd !=3D 1 {
>> +@@ -103,13 +105,17 @@ func (f *freelist) allocate(n int) pgid {
>> + // free releases a page and its overflow for a given transaction id.
>> + // If the page is already free then a panic will occur.
>> + func (f *freelist) free(txid txid, p *page) {
>> +-      _assert(p.id > 1, "cannot free page 0 or 1: %d", p.id)
>> ++      if p.id <=3D 1 {
>> ++              panic(fmt.Sprintf("cannot free page 0 or 1: %d", p.id))
>> ++      }
>> +
>> +       // Free page and all its overflow pages.
>> +       var ids =3D f.pending[txid]
>> +       for id :=3D p.id; id <=3D p.id+pgid(p.overflow); id++ {
>> +               // Verify that page is not already free.
>> +-              _assert(!f.cache[id], "page %d already freed", id)
>> ++              if f.cache[id] {
>> ++                      panic(fmt.Sprintf("page %d already freed", id))
>> ++              }
>> +
>> +               // Add to the freelist and cache.
>> +               ids =3D append(ids, id)
>> +@@ -120,15 +126,17 @@ func (f *freelist) free(txid txid, p *page) {
>> +
>> + // release moves all page ids for a transaction id (or older) to the
>> freelist.
>> + func (f *freelist) release(txid txid) {
>> ++      m :=3D make(pgids, 0)
>> +       for tid, ids :=3D range f.pending {
>> +               if tid <=3D txid {
>> +                       // Move transaction's pending pages to the
>> available freelist.
>> +                       // Don't remove from the cache since the page is
>> still free.
>> +-                      f.ids =3D append(f.ids, ids...)
>> ++                      m =3D append(m, ids...)
>> +                       delete(f.pending, tid)
>> +               }
>> +       }
>> +-      sort.Sort(pgids(f.ids))
>> ++      sort.Sort(m)
>> ++      f.ids =3D pgids(f.ids).merge(m)
>> + }
>> +
>> + // rollback removes the pages from a given pending tx.
>> +diff --git a/vendor/src/github.com/boltdb/bolt/node.go b/vendor/src/
>> github.com/boltdb/bolt/node.go
>> +index c204c39..c9fb21c 100644
>> +--- a/vendor/src/github.com/boltdb/bolt/node.go
>> ++++ b/vendor/src/github.com/boltdb/bolt/node.go
>> +@@ -2,6 +2,7 @@ package bolt
>> +
>> + import (
>> +       "bytes"
>> ++      "fmt"
>> +       "sort"
>> +       "unsafe"
>> + )
>> +@@ -70,7 +71,9 @@ func (n *node) pageElementSize() int {
>> +
>> + // childAt returns the child node at a given index.
>> + func (n *node) childAt(index int) *node {
>> +-      _assert(!n.isLeaf, "invalid childAt(%d) on a leaf node", index)
>> ++      if n.isLeaf {
>> ++              panic(fmt.Sprintf("invalid childAt(%d) on a leaf node",
>> index))
>> ++      }
>> +       return n.bucket.node(n.inodes[index].pgid, n)
>> + }
>> +
>> +@@ -111,9 +114,13 @@ func (n *node) prevSibling() *node {
>> +
>> + // put inserts a key/value.
>> + func (n *node) put(oldKey, newKey, value []byte, pgid pgid, flags
>> uint32) {
>> +-      _assert(pgid < n.bucket.tx.meta.pgid, "pgid (%d) above high wate=
r
>> mark (%d)", pgid, n.bucket.tx.meta.pgid)
>> +-      _assert(len(oldKey) > 0, "put: zero-length old key")
>> +-      _assert(len(newKey) > 0, "put: zero-length new key")
>> ++      if pgid >=3D n.bucket.tx.meta.pgid {
>> ++              panic(fmt.Sprintf("pgid (%d) above high water mark (%d)"=
,
>> pgid, n.bucket.tx.meta.pgid))
>> ++      } else if len(oldKey) <=3D 0 {
>> ++              panic("put: zero-length old key")
>> ++      } else if len(newKey) <=3D 0 {
>> ++              panic("put: zero-length new key")
>> ++      }
>> +
>> +       // Find insertion index.
>> +       index :=3D sort.Search(len(n.inodes), func(i int) bool { return
>> bytes.Compare(n.inodes[i].key, oldKey) !=3D -1 })
>> +@@ -189,7 +196,9 @@ func (n *node) write(p *page) {
>> +               p.flags |=3D branchPageFlag
>> +       }
>> +
>> +-      _assert(len(n.inodes) < 0xFFFF, "inode overflow: %d (pgid=3D%d)"=
,
>> len(n.inodes), p.id)
>> ++      if len(n.inodes) >=3D 0xFFFF {
>> ++              panic(fmt.Sprintf("inode overflow: %d (pgid=3D%d)",
>> len(n.inodes), p.id))
>> ++      }
>> +       p.count =3D uint16(len(n.inodes))
>> +
>> +       // Loop over each item and write it to the page.
>> +@@ -212,11 +221,20 @@ func (n *node) write(p *page) {
>> +                       _assert(elem.pgid !=3D p.id, "write: circular
>> dependency occurred")
>> +               }
>> +
>> ++              // If the length of key+value is larger than the max
>> allocation size
>> ++              // then we need to reallocate the byte array pointer.
>> ++              //
>> ++              // See: https://github.com/boltdb/bolt/pull/335
>> ++              klen, vlen :=3D len(item.key), len(item.value)
>> ++              if len(b) < klen+vlen {
>> ++                      b =3D
>> (*[maxAllocSize]byte)(unsafe.Pointer(&b[0]))[:]
>> ++              }
>> ++
>> +               // Write data for the element to the end of the page.
>> +               copy(b[0:], item.key)
>> +-              b =3D b[len(item.key):]
>> ++              b =3D b[klen:]
>> +               copy(b[0:], item.value)
>> +-              b =3D b[len(item.value):]
>> ++              b =3D b[vlen:]
>> +       }
>> +
>> +       // DEBUG ONLY: n.dump()
>> +@@ -348,7 +366,9 @@ func (n *node) spill() error {
>> +               }
>> +
>> +               // Write the node.
>> +-              _assert(p.id < tx.meta.pgid, "pgid (%d) above high water
>> mark (%d)", p.id, tx.meta.pgid)
>> ++              if p.id >=3D tx.meta.pgid {
>> ++                      panic(fmt.Sprintf("pgid (%d) above high water
>> mark (%d)", p.id, tx.meta.pgid))
>> ++              }
>> +               node.pgid =3D p.id
>> +               node.write(p)
>> +               node.spilled =3D true
>> +diff --git a/vendor/src/github.com/boltdb/bolt/page.go b/vendor/src/
>> github.com/boltdb/bolt/page.go
>> +index b3dc473..818aa1b 100644
>> +--- a/vendor/src/github.com/boltdb/bolt/page.go
>> ++++ b/vendor/src/github.com/boltdb/bolt/page.go
>> +@@ -3,12 +3,12 @@ package bolt
>> + import (
>> +       "fmt"
>> +       "os"
>> ++      "sort"
>> +       "unsafe"
>> + )
>> +
>> + const pageHeaderSize =3D int(unsafe.Offsetof(((*page)(nil)).ptr))
>> +
>> +-const maxAllocSize =3D 0xFFFFFFF
>> + const minKeysPerPage =3D 2
>> +
>> + const branchPageElementSize =3D int(unsafe.Sizeof(branchPageElement{})=
)
>> +@@ -97,7 +97,7 @@ type branchPageElement struct {
>> + // key returns a byte slice of the node key.
>> + func (n *branchPageElement) key() []byte {
>> +       buf :=3D (*[maxAllocSize]byte)(unsafe.Pointer(n))
>> +-      return buf[n.pos : n.pos+n.ksize]
>> ++      return
>> (*[maxAllocSize]byte)(unsafe.Pointer(&buf[n.pos]))[:n.ksize]
>> + }
>> +
>> + // leafPageElement represents a node on a leaf page.
>> +@@ -111,13 +111,13 @@ type leafPageElement struct {
>> + // key returns a byte slice of the node key.
>> + func (n *leafPageElement) key() []byte {
>> +       buf :=3D (*[maxAllocSize]byte)(unsafe.Pointer(n))
>> +-      return buf[n.pos : n.pos+n.ksize]
>> ++      return
>> (*[maxAllocSize]byte)(unsafe.Pointer(&buf[n.pos]))[:n.ksize]
>> + }
>> +
>> + // value returns a byte slice of the node value.
>> + func (n *leafPageElement) value() []byte {
>> +       buf :=3D (*[maxAllocSize]byte)(unsafe.Pointer(n))
>> +-      return buf[n.pos+n.ksize : n.pos+n.ksize+n.vsize]
>> ++      return
>> (*[maxAllocSize]byte)(unsafe.Pointer(&buf[n.pos+n.ksize]))[:n.vsize]
>> + }
>> +
>> + // PageInfo represents human readable information about a page.
>> +@@ -133,3 +133,40 @@ type pgids []pgid
>> + func (s pgids) Len() int           { return len(s) }
>> + func (s pgids) Swap(i, j int)      { s[i], s[j] =3D s[j], s[i] }
>> + func (s pgids) Less(i, j int) bool { return s[i] < s[j] }
>> ++
>> ++// merge returns the sorted union of a and b.
>> ++func (a pgids) merge(b pgids) pgids {
>> ++      // Return the opposite slice if one is nil.
>> ++      if len(a) =3D=3D 0 {
>> ++              return b
>> ++      } else if len(b) =3D=3D 0 {
>> ++              return a
>> ++      }
>> ++
>> ++      // Create a list to hold all elements from both lists.
>> ++      merged :=3D make(pgids, 0, len(a)+len(b))
>> ++
>> ++      // Assign lead to the slice with a lower starting value, follow
>> to the higher value.
>> ++      lead, follow :=3D a, b
>> ++      if b[0] < a[0] {
>> ++              lead, follow =3D b, a
>> ++      }
>> ++
>> ++      // Continue while there are elements in the lead.
>> ++      for len(lead) > 0 {
>> ++              // Merge largest prefix of lead that is ahead of
>> follow[0].
>> ++              n :=3D sort.Search(len(lead), func(i int) bool { return
>> lead[i] > follow[0] })
>> ++              merged =3D append(merged, lead[:n]...)
>> ++              if n >=3D len(lead) {
>> ++                      break
>> ++              }
>> ++
>> ++              // Swap lead and follow.
>> ++              lead, follow =3D follow, lead[n:]
>> ++      }
>> ++
>> ++      // Append what's left in follow.
>> ++      merged =3D append(merged, follow...)
>> ++
>> ++      return merged
>> ++}
>> +diff --git a/vendor/src/github.com/boltdb/bolt/tx.go b/vendor/src/
>> github.com/boltdb/bolt/tx.go
>> +index c041d73..fe6c287 100644
>> +--- a/vendor/src/github.com/boltdb/bolt/tx.go
>> ++++ b/vendor/src/github.com/boltdb/bolt/tx.go
>> +@@ -87,18 +87,21 @@ func (tx *Tx) Stats() TxStats {
>> +
>> + // Bucket retrieves a bucket by name.
>> + // Returns nil if the bucket does not exist.
>> ++// The bucket instance is only valid for the lifetime of the
>> transaction.
>> + func (tx *Tx) Bucket(name []byte) *Bucket {
>> +       return tx.root.Bucket(name)
>> + }
>> +
>> + // CreateBucket creates a new bucket.
>> + // Returns an error if the bucket already exists, if the bucket name i=
s
>> blank, or if the bucket name is too long.
>> ++// The bucket instance is only valid for the lifetime of the
>> transaction.
>> + func (tx *Tx) CreateBucket(name []byte) (*Bucket, error) {
>> +       return tx.root.CreateBucket(name)
>> + }
>> +
>> + // CreateBucketIfNotExists creates a new bucket if it doesn't already
>> exist.
>> + // Returns an error if the bucket name is blank, or if the bucket name
>> is too long.
>> ++// The bucket instance is only valid for the lifetime of the
>> transaction.
>> + func (tx *Tx) CreateBucketIfNotExists(name []byte) (*Bucket, error) {
>> +       return tx.root.CreateBucketIfNotExists(name)
>> + }
>> +@@ -127,7 +130,8 @@ func (tx *Tx) OnCommit(fn func()) {
>> + }
>> +
>> + // Commit writes all changes to disk and updates the meta page.
>> +-// Returns an error if a disk write error occurs.
>> ++// Returns an error if a disk write error occurs, or if Commit is
>> ++// called on a read-only transaction.
>> + func (tx *Tx) Commit() error {
>> +       _assert(!tx.managed, "managed tx commit not allowed")
>> +       if tx.db =3D=3D nil {
>> +@@ -203,7 +207,8 @@ func (tx *Tx) Commit() error {
>> +       return nil
>> + }
>> +
>> +-// Rollback closes the transaction and ignores all previous updates.
>> ++// Rollback closes the transaction and ignores all previous updates.
>> Read-only
>> ++// transactions must be rolled back and not committed.
>> + func (tx *Tx) Rollback() error {
>> +       _assert(!tx.managed, "managed tx rollback not allowed")
>> +       if tx.db =3D=3D nil {
>> +@@ -234,7 +239,8 @@ func (tx *Tx) close() {
>> +               var freelistPendingN =3D tx.db.freelist.pending_count()
>> +               var freelistAlloc =3D tx.db.freelist.size()
>> +
>> +-              // Remove writer lock.
>> ++              // Remove transaction ref & writer lock.
>> ++              tx.db.rwtx =3D nil
>> +               tx.db.rwlock.Unlock()
>> +
>> +               // Merge statistics.
>> +@@ -248,41 +254,51 @@ func (tx *Tx) close() {
>> +       } else {
>> +               tx.db.removeTx(tx)
>> +       }
>> ++
>> ++      // Clear all references.
>> +       tx.db =3D nil
>> ++      tx.meta =3D nil
>> ++      tx.root =3D Bucket{tx: tx}
>> ++      tx.pages =3D nil
>> + }
>> +
>> + // Copy writes the entire database to a writer.
>> +-// A reader transaction is maintained during the copy so it is safe to
>> continue
>> +-// using the database while a copy is in progress.
>> +-// Copy will write exactly tx.Size() bytes into the writer.
>> ++// This function exists for backwards compatibility. Use WriteTo() in
>> + func (tx *Tx) Copy(w io.Writer) error {
>> +-      var f *os.File
>> +-      var err error
>> ++      _, err :=3D tx.WriteTo(w)
>> ++      return err
>> ++}
>> +
>> ++// WriteTo writes the entire database to a writer.
>> ++// If err =3D=3D nil then exactly tx.Size() bytes will be written into=
 the
>> writer.
>> ++func (tx *Tx) WriteTo(w io.Writer) (n int64, err error) {
>> +       // Attempt to open reader directly.
>> ++      var f *os.File
>> +       if f, err =3D os.OpenFile(tx.db.path, os.O_RDONLY|odirect, 0); e=
rr
>> !=3D nil {
>> +               // Fallback to a regular open if that doesn't work.
>> +               if f, err =3D os.OpenFile(tx.db.path, os.O_RDONLY, 0); e=
rr
>> !=3D nil {
>> +-                      return err
>> ++                      return 0, err
>> +               }
>> +       }
>> +
>> +       // Copy the meta pages.
>> +       tx.db.metalock.Lock()
>> +-      _, err =3D io.CopyN(w, f, int64(tx.db.pageSize*2))
>> ++      n, err =3D io.CopyN(w, f, int64(tx.db.pageSize*2))
>> +       tx.db.metalock.Unlock()
>> +       if err !=3D nil {
>> +               _ =3D f.Close()
>> +-              return fmt.Errorf("meta copy: %s", err)
>> ++              return n, fmt.Errorf("meta copy: %s", err)
>> +       }
>> +
>> +       // Copy data pages.
>> +-      if _, err :=3D io.CopyN(w, f, tx.Size()-int64(tx.db.pageSize*2))=
;
>> err !=3D nil {
>> ++      wn, err :=3D io.CopyN(w, f, tx.Size()-int64(tx.db.pageSize*2))
>> ++      n +=3D wn
>> ++      if err !=3D nil {
>> +               _ =3D f.Close()
>> +-              return err
>> ++              return n, err
>> +       }
>> +
>> +-      return f.Close()
>> ++      return n, f.Close()
>> + }
>> +
>> + // CopyFile copies the entire database to file at the given path.
>> +@@ -416,15 +432,39 @@ func (tx *Tx) write() error {
>> +       // Write pages to disk in order.
>> +       for _, p :=3D range pages {
>> +               size :=3D (int(p.overflow) + 1) * tx.db.pageSize
>> +-              buf :=3D (*[maxAllocSize]byte)(unsafe.Pointer(p))[:size]
>> +               offset :=3D int64(p.id) * int64(tx.db.pageSize)
>> +-              if _, err :=3D tx.db.ops.writeAt(buf, offset); err !=3D =
nil {
>> +-                      return err
>> +-              }
>> +
>> +-              // Update statistics.
>> +-              tx.stats.Write++
>> ++              // Write out page in "max allocation" sized chunks.
>> ++              ptr :=3D (*[maxAllocSize]byte)(unsafe.Pointer(p))
>> ++              for {
>> ++                      // Limit our write to our max allocation size.
>> ++                      sz :=3D size
>> ++                      if sz > maxAllocSize-1 {
>> ++                              sz =3D maxAllocSize - 1
>> ++                      }
>> ++
>> ++                      // Write chunk to disk.
>> ++                      buf :=3D ptr[:sz]
>> ++                      if _, err :=3D tx.db.ops.writeAt(buf, offset); e=
rr
>> !=3D nil {
>> ++                              return err
>> ++                      }
>> ++
>> ++                      // Update statistics.
>> ++                      tx.stats.Write++
>> ++
>> ++                      // Exit inner for loop if we've written all the
>> chunks.
>> ++                      size -=3D sz
>> ++                      if size =3D=3D 0 {
>> ++                              break
>> ++                      }
>> ++
>> ++                      // Otherwise move offset forward and move pointe=
r
>> to next chunk.
>> ++                      offset +=3D int64(sz)
>> ++                      ptr =3D
>> (*[maxAllocSize]byte)(unsafe.Pointer(&ptr[sz]))
>> ++              }
>> +       }
>> ++
>> ++      // Ignore file sync if flag is set on DB.
>> +       if !tx.db.NoSync || IgnoreNoSync {
>> +               if err :=3D fdatasync(tx.db); err !=3D nil {
>> +                       return err
>> +--
>> +1.9.1
>> +
>> diff --git
>> a/recipes-containers/docker/files/disable_sha1sum_startup.patch
>> b/recipes-containers/docker/files/disable_sha1sum_startup.patch
>> index 580ca23..cafd83d 100644
>> --- a/recipes-containers/docker/files/disable_sha1sum_startup.patch
>> +++ b/recipes-containers/docker/files/disable_sha1sum_startup.patch
>> @@ -12,20 +12,23 @@ of the binary instead.
>>
>>  Signed-off-by: Amy Fong <amy.fong@windriver.com>
>>  ---
>> - utils/utils.go |   17 +----------------
>> - 1 file changed, 1 insertion(+), 16 deletions(-)
>> + utils/utils.go | 18 +-----------------
>> + 1 file changed, 1 insertion(+), 17 deletions(-)
>>
>> +diff --git a/utils/utils.go b/utils/utils.go
>> +index a17ab9d..3fc514a 100644
>>  --- a/utils/utils.go
>>  +++ b/utils/utils.go
>> -@@ -3,7 +3,6 @@
>> +@@ -2,8 +2,6 @@ package utils
>> +
>>   import (
>>         "bufio"
>> -       "bytes"
>>  -      "crypto/sha1"
>> -       "crypto/sha256"
>> -       "encoding/hex"
>> +-      "encoding/hex"
>>         "fmt"
>> -@@ -75,20 +74,6 @@
>> +       "io"
>> +       "io/ioutil"
>> +@@ -42,20 +40,6 @@ func SelfPath() string {
>>         return path
>>   }
>>
>> @@ -46,7 +49,7 @@ Signed-off-by: Amy Fong <amy.fong@windriver.com>
>>   func isValidDockerInitPath(target string, selfPath string) bool { //
>> target and selfPath should be absolute (InitPath and SelfPath already do
>> this)
>>         if target =3D=3D "" {
>>                 return false
>> -@@ -110,7 +95,7 @@
>> +@@ -77,7 +61,7 @@ func isValidDockerInitPath(target string, selfPath
>> string) bool { // target and
>>                 }
>>                 return os.SameFile(targetFileInfo, selfPathFileInfo)
>>         }
>> @@ -54,4 +57,4 @@ Signed-off-by: Amy Fong <amy.fong@windriver.com>
>>  +      return true
>>   }
>>
>> - // Figure out the path of our dockerinit (which may be SelfPath())
>> + // DockerInitPath figures out the path of our dockerinit (which may be
>> SelfPath())
>> --
>> 1.8.3.2
>>
>>
>>
>>
>>
>> --
>>
>> "Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
>> at its end"
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113d706219b7eb0530f0b278
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Apr 19, 2016 at 3:30 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<=
a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On T=
ue, Apr 19, 2016 at 3:29 AM, Wei Lu <span dir=3D"ltr">&lt;<a href=3D"mailto=
:W.Lu@nxp.com" target=3D"_blank">W.Lu@nxp.com</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">Hello,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0</span></p></div></div><=
/blockquote><div><br></div><div>Thanks. I&#39;ve queued this locally. If my=
 testing passes, I&#39;ll follow up when it has been</div><div>pushed.</div=
></div></div></div></blockquote><div><br></div><div>I had to fix some other=
 go 1.x applications, but I can confirm that this also worked for</div><div=
>x86-64.=C2=A0</div><div><br></div><div>The changes are now pushed.</div><d=
iv><br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><d=
iv><br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div lang=3D"EN-US" link=3D"blue" vlink=3D"purple"><div><p class=3D"MsoNo=
rmal"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-=
serif;color:#1f497d"><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">For Docker running on ARM64, we need =
enable below configures, these extra configures are not enabled in default =
kernel, so we need open it manually.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_CGROUP_DEBUG=3Dy<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_CGROUP_FREEZER=3Dy<u></u><u></=
u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_CGROUP_DEVICE=3Dy<u></u><u></u=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_CPUSETS=3Dy<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_CGROUP_CPUACCT=3Dy<u></u><u></=
u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_CGROUP_PERF=3Dy<u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_BLK_CGROUP=3Dy<u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_DEBUG_BLK_CGROUP=3Dy<u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_UTS_NS=3Dy<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_IPC_NS=3Dy<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_USER_NS=3Dy<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_IPV6=3Dy<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_BRIDGE=3Dy<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_VLAN_8021Q=3Dy<u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_VLAN_8021Q_GVRP=3Dy<u></u><u><=
/u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_VLAN_8021Q_MVRP=3Dy<u></u><u><=
/u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_MACVLAN=3Dy<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_MACVTAP=3Dy<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_VETH=3Dy<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_DEVPTS_MULTIPLE_INSTANCES=3Dy<=
u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_EXT2_FS_XATTR=3Dy<u></u><u></u=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_EXT2_FS_POSIX_ACL=3Dy<u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_EXT3_FS_POSIX_ACL=3Dy<u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_EXT4_FS_POSIX_ACL=3Dy<u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_TMPFS_POSIX_ACL=3Dy<u></u><u><=
/u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_SECCOMP=3Dy<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_BLK_DEV_THROTTLING=3Dy<u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_CFQ_GROUP_IOSCHED=3Dy<u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_OVERLAY_FS=3Dy<u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_TMPFS_POSIX_ACL=3Dy<u></u><u><=
/u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_TMPFS_XATTR=3Dy<u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_NETFILTER=3Dy<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_NETFILTER_ADVANCED=3Dy<u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_BRIDGE_NETFILTER=3Dm<u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_NETFILTER_NETLINK=3Dy<u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_NF_CONNTRACK=3Dy<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_NF_CONNTRACK_MARK=3Dy<u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_NF_CONNTRACK_PROCFS=3Dy<u></u>=
<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_NF_NAT=3Dy<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_NF_NAT_NEEDED=3Dy<u></u><u></u=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_NF_TABLES=3Dy<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_NFT_CT=3Dy<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_NFT_RBTREE=3Dy<u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_NFT_MASQ=3Dy<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_NFT_NAT=3Dy<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_NFT_COMPAT=3Dy<u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_NETFILTER_XTABLES=3Dy<u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_NETFILTER_XT_CONNMARK=3Dy<u></=
u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_NETFILTER_XT_TARGET_CONNMARK=
=3Dy<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_NETFILTER_XT_NAT=3Dy<u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=3D=
y<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_NETFILTER_XT_MATCH_CONNMARK=3D=
y<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_NETFILTER_XT_MATCH_CONNTRACK=
=3Dy<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_NF_DEFRAG_IPV4=3Dy<u></u><u></=
u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_NF_CONNTRACK_IPV4=3Dy<u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_NF_CONNTRACK_PROC_COMPAT=3Dy<u=
></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_NF_TABLES_IPV4=3Dy<u></u><u></=
u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_NF_NAT_IPV4=3Dy<u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_NF_NAT_MASQUERADE_IPV4=3Dy<u><=
/u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_IP_NF_IPTABLES=3Dy<u></u><u></=
u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_IP_NF_FILTER=3Dy<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_IP_NF_NAT=3Dy<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_IP_NF_TARGET_MASQUERADE=3Dy<u>=
</u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_IP_NF_MANGLE=3Dy<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_NF_TABLES_BRIDGE=3Dy<u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_BRIDGE_NF_EBTABLES=3Dy<u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_BRIDGE_EBT_T_NAT=3Dy<u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_BRIDGE_EBT_DNAT=3Dy<u></u><u><=
/u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">CONFIG_BRIDGE_EBT_SNAT=3Dy<u></u><u><=
/u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">Test steps on ARM64:<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">docker daemon &amp;<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">docker =C2=A0login docker hub<u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">docker search arm64<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">docker pull $ARM64_images<u></u><u></=
u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">docker run -d -p 30081:80 --name=3Dsa=
ndbox1 -h sandbox1 $ARM64_images bash -c &quot;lighttpd -f /etc/lighttpd/li=
ghttpd.conf -D&quot;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">docker logout<u></u><u></u></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">docker ps =E2=80=93a<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">docker images<u></u><u></u></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">docker stop sandbox1<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">docker rm sandbox1<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">Regards<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">Lu Wei<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<div>
<div style=3D"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"> Zongchun Yu
<br>
<b>Sent:</b> Tuesday, April 19, 2016 11:18 AM<br>
<b>To:</b> Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;; Wei Lu &lt;<a href=3D"ma=
ilto:W.Lu@nxp.com" target=3D"_blank">W.Lu@nxp.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:meta-virtualization@yoctoproject.org" target=
=3D"_blank">meta-virtualization@yoctoproject.org</a><br>
<b>Subject:</b> RE: [meta-virtualization][PATCH][v2] docker: uprev to 1.9.0=
<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">Okay.=C2=A0 Let me add Lu wei.<u></u>=
<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">Hi Lu wei.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">Can you help to provide the arm64 tes=
t and configure message to Bruce?<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">Thank you.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">Best Regards<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">Zongchun<u></u><u></u></span></p>
<div style=3D"border:none;border-top:solid #b5c4df 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,sans-serif">From:</span></b><span style=3D"font-size:10.0pt;f=
ont-family:&quot;Tahoma&quot;,sans-serif"> Bruce Ashfield [<a href=3D"mailt=
o:bruce.ashfield@gmail.com" target=3D"_blank">mailto:bruce.ashfield@gmail.c=
om</a>]
<br>
<b>Sent:</b> Tuesday, April 19, 2016 11:10 AM<br>
<b>To:</b> Zongchun Yu<br>
<b>Cc:</b> <a href=3D"mailto:meta-virtualization@yoctoproject.org" target=
=3D"_blank">meta-virtualization@yoctoproject.org</a><br>
<b>Subject:</b> Re: [meta-virtualization][PATCH][v2] docker: uprev to 1.9.0=
<u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">On Mon, Apr 18, 2016 at 10:26 PM, Zongchun Yu &lt;<a=
 href=3D"mailto:zongchun.yu@nxp.com" target=3D"_blank">zongchun.yu@nxp.com<=
/a>&gt; wrote:<u></u><u></u></p>
<p class=3D"MsoNormal">Hi Bruce.<br>
<br>
May I know if you have comments about this v2 patch? If not. Can you help t=
o apply the patch?<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I&#39;m waiting to hear from Bogdan P: .. you said t=
he following:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">------------<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">Hi Bogdan P.</span><span style=3D"fon=
t-size:9.5pt"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">=C2=A0</span><span style=3D"font-size=
:9.5pt"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">Can you help to provide the arm64 tes=
t and configure messages to Bruce?</span><span style=3D"font-size:9.5pt"><u=
></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">-----------<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">And I see no other email on the subject .. so I&#39;=
m not sure why I&#39;d have started to merge a new version.<u></u><u></u></=
p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Bruce<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-=
bottom:5.0pt">
<p class=3D"MsoNormal"><br>
Thanks.<br>
<br>
Best Regards<br>
Zongchun<u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">-----Original Message=
-----<br>
From: <a href=3D"mailto:zongchun.yu@nxp.com" target=3D"_blank">zongchun.yu@=
nxp.com</a> [mailto:<a href=3D"mailto:zongchun.yu@nxp.com" target=3D"_blank=
">zongchun.yu@nxp.com</a>]<br>
Sent: Tuesday, April 12, 2016 4:36 PM<br>
To: <a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blan=
k">meta-virtualization@yoctoproject.org</a><br>
Cc: <a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ash=
field@gmail.com</a>; Zongchun Yu<br>
Subject: [meta-virtualization][PATCH][v2] docker: uprev to 1.9.0<br>
<br>
From: Zongchun Yu &lt;<a href=3D"mailto:zongchun.yu@nxp.com" target=3D"_bla=
nk">zongchun.yu@nxp.com</a>&gt;<br>
<br>
Uprev to 1.9.0.<br>
Enable build support for arm64.<br>
The libcontainer is removed from the source in the new version. drop the ns=
init install lines.<br>
<br>
Signed-off-by: Zongchun Yu &lt;<a href=3D"mailto:zongchun.yu@nxp.com" targe=
t=3D"_blank">zongchun.yu@nxp.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/docker/<a href=3D"http://docker_git.bb" target=3D"=
_blank">docker_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A038 +-<br>
=C2=A0.../docker/files/Bump-bolt-to-v1.1.0.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 1828 ++++++++++++++++++++<br>
=C2=A0.../docker/files/disable_sha1sum_startup.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A021 +-<br>
=C2=A03 files changed, 1855 insertions(+), 32 deletions(-)<br>
=C2=A0create mode 100644 recipes-containers/docker/files/Bump-bolt-to-v1.1.=
0.patch<br>
<br>
diff --git a/recipes-containers/docker/<a href=3D"http://docker_git.bb" tar=
get=3D"_blank">docker_git.bb</a> b/recipes-containers/docker/<a href=3D"htt=
p://docker_git.bb" target=3D"_blank">docker_git.bb</a><br>
index 2672b22..19fdef0 100644<br>
--- a/recipes-containers/docker/<a href=3D"http://docker_git.bb" target=3D"=
_blank">docker_git.bb</a><br>
+++ b/recipes-containers/docker/<a href=3D"http://docker_git.bb" target=3D"=
_blank">docker_git.bb</a><br>
@@ -18,23 +18,23 @@ DESCRIPTION =3D &quot;Linux container runtime \<br>
=C2=A0 subtle and/or glaring issues. \<br>
=C2=A0 &quot;<br>
<br>
-SRCREV =3D &quot;7c8fca2ddb58c8d2c4fb4df31c242886df7dd257&quot;<br>
-SRCBRANCH =3D &quot;v1.6.2&quot;<br>
+SRCREV =3D &quot;76d6bc9a9f1690e16f3721ba165364688b626de2&quot;<br>
=C2=A0SRC_URI =3D &quot;\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/docker/docke=
r.git;branch=3D$%7bSRCBRANCH%7d;nobranch=3D1" target=3D"_blank">github.com/=
docker/docker.git;branch=3D${SRCBRANCH};nobranch=3D1</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/docker/docke=
r.git;nobranch=3D1" target=3D"_blank">github.com/docker/docker.git;nobranch=
=3D1</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a>file://docker.service</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a>file://docker.init</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a>file://hi.Dockerfile</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a>file://disable_sha1sum_startup.patch</a> \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0<a>file://Bump-bolt-to-v1.1.0.patch</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0# Apache-2.0 for docker<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;<a>file://LICENSE;md5=3D1cc0497778922bfd6cb4872=
1deb80dc7</a>&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;<a>file://LICENSE;md5=3Dcc2221abf0b96ea39dd6814=
1b70f7937</a>&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-DOCKER_VERSION =3D &quot;1.6.2&quot;<br>
+DOCKER_VERSION =3D &quot;1.9.0&quot;<br>
=C2=A0PV =3D &quot;${DOCKER_VERSION}+git${SRCREV}&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;go-cross \<br>
@@ -62,17 +62,17 @@ RRECOMMENDS_${PN} =3D &quot;lxc docker-registry rt-test=
s&quot;<br>
=C2=A0RRECOMMENDS_${PN} +=3D &quot; kernel-module-dm-thin-pool kernel-modul=
e-nf-nat&quot;<br>
=C2=A0DOCKER_PKG=3D&quot;<a href=3D"http://github.com/docker/docker" target=
=3D"_blank">github.com/docker/docker</a>&quot;<br>
<br>
-do_configure() {<br>
-}<br>
+do_configure[noexec] =3D &quot;1&quot;<br>
<br>
=C2=A0do_compile() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export PATH=3D${STAGING_BINDIR_NATIVE}/${HOST_S=
YS}/go-1.3:$PATH<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOARCH=3D&quot;${TARGET_ARCH}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# supported amd64, 386, arm<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# supported amd64, 386, arm arm64<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${TARGET_ARCH}&quot; =3D &quot;x86_6=
4&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOARCH=3D&qu=
ot;amd64&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${TARGET_ARCH}&quot; =3D &quot;aarch=
64&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export GOARCH=3D&qu=
ot;arm64&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Set GOPATH. See &#39;PACKAGERS.md&#39;. Don&#=
39;t rely on<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # docker to download its dependencies but rathe=
r<br>
@@ -84,21 +84,19 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOPATH=3D&quot;${S}/.gopath:${S}/vendor:=
${STAGING_DIR_TARGET}/${prefix}/local/go&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd -<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D&quot;1&quot;<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so that cgo<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # can find the needed headers files and librari=
es<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D&quot;${BUILDSDK_CFLAGS}&qu=
ot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D&quot;${BUILDSDK_LDFLAGS}&=
quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D&quot;1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D&quot;${BUILDSDK_CFLAGS} --=
sysroot=3D${STAGING_DIR_TARGET}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D&quot;${BUILDSDK_LDFLAGS} =
--sysroot=3D${STAGING_DIR_TARGET}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# in order to exclude devicemapper and btrfs - =
<a href=3D"https://github.com/docker/docker/issues/14056" target=3D"_blank"=
>
https://github.com/docker/docker/issues/14056</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export DOCKER_BUILDTAGS=3D&#39;exclude_graphdri=
ver_btrfs exclude_graphdriver_devicemapper&#39;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # this is the unsupported built structure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # that doesn&#39;t rely on an existing docker<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # to build this:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DOCKER_GITCOMMIT=3D&quot;${SRCREV}&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./hack/make.sh dynbinary<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# make nsinit from libcontainer<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0go install <a href=3D"http://github.com/docker/=
libcontainer/nsinit/" target=3D"_blank">
github.com/docker/libcontainer/nsinit/</a><br>
=C2=A0}<br>
<br>
=C2=A0inherit systemd update-rc.d<br>
@@ -127,12 +125,6 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${WORKDIR}/=
docker.init ${D}${sysconfdir}/init.d/docker.init<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -d ${S}/vendor/bin/linux_* ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${S}/vendor/bin/=
linux_*/* ${D}/${bindir}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${S}/vendor/bin/=
* ${D}/${bindir}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}/usr/share/docker/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${WORKDIR}/hi.Dockerfile ${D}/usr/share/dock=
er/<br>
=C2=A0}<br>
diff --git a/recipes-containers/docker/files/Bump-bolt-to-v1.1.0.patch b/re=
cipes-containers/docker/files/Bump-bolt-to-v1.1.0.patch<br>
new file mode 100644<br>
index 0000000..ca4ad81<br>
--- /dev/null<br>
+++ b/recipes-containers/docker/files/Bump-bolt-to-v1.1.0.patch<br>
@@ -0,0 +1,1828 @@<br>
+From a41917c2c88bd7f694d141ac67f4a194aaa16fa1 Mon Sep 17 00:00:00 2001<br>
+From: Qiang Huang &lt;<a href=3D"mailto:h.huangqiang@huawei.com" target=3D=
"_blank">h.huangqiang@huawei.com</a>&gt;<br>
+Date: Wed, 28 Oct 2015 08:49:45 +0800<br>
+Subject: [PATCH] Bump bolt to v1.1.0<br>
+<br>
+It adds ARM64, ppc64le, s390x, solaris support, and a bunch of<br>
+bugfixs.<br>
+<br>
+Signed-off-by: Qiang Huang &lt;<a href=3D"mailto:h.huangqiang@huawei.com" =
target=3D"_blank">h.huangqiang@huawei.com</a>&gt;<br>
+---<br>
+ hack/vendor.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
+ vendor/src/<a href=3D"http://github.com/boltdb/bolt/.gitignore" target=3D=
"_blank">github.com/boltdb/bolt/.gitignore</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
+ vendor/src/<a href=3D"http://github.com/boltdb/bolt/README.md" target=3D"=
_blank">github.com/boltdb/bolt/README.md</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2=
50 +++++++++++++++++++--<br>
+ vendor/src/<a href=3D"http://github.com/boltdb/bolt/batch.go" target=3D"_=
blank">github.com/boltdb/bolt/batch.go</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 138 ++++++++++++<br>
+ vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_386.go" target=
=3D"_blank">github.com/boltdb/bolt/bolt_386.go</a>=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A05 +-<br>
+ vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_amd64.go" target=
=3D"_blank">github.com/boltdb/bolt/bolt_amd64.go</a>=C2=A0 =C2=A0 |=C2=A0 =
=C2=A03 +<br>
+ vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_arm.go" target=
=3D"_blank">github.com/boltdb/bolt/bolt_arm.go</a>=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A05 +-<br>
+ vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_arm64.go" target=
=3D"_blank">github.com/boltdb/bolt/bolt_arm64.go</a>=C2=A0 =C2=A0 |=C2=A0 =
=C2=A09 +<br>
+ vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_ppc64le.go" targ=
et=3D"_blank">github.com/boltdb/bolt/bolt_ppc64le.go</a>=C2=A0 |=C2=A0 =C2=
=A09 +<br>
+ vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_s390x.go" target=
=3D"_blank">github.com/boltdb/bolt/bolt_s390x.go</a>=C2=A0 =C2=A0 |=C2=A0 =
=C2=A09 +<br>
+ vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_unix.go" target=
=3D"_blank">github.com/boltdb/bolt/bolt_unix.go</a>=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 37 ++-<br>
+ .../<a href=3D"http://github.com/boltdb/bolt/bolt_unix_solaris.go" target=
=3D"_blank">github.com/boltdb/bolt/bolt_unix_solaris.go</a>=C2=A0 =C2=A0 | =
101 +++++++++<br>
+ vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_windows.go" targ=
et=3D"_blank">github.com/boltdb/bolt/bolt_windows.go</a>=C2=A0 |=C2=A0 10 +=
-<br>
+ vendor/src/<a href=3D"http://github.com/boltdb/bolt/bucket.go" target=3D"=
_blank">github.com/boltdb/bolt/bucket.go</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 29 ++-<br>
+ vendor/src/<a href=3D"http://github.com/boltdb/bolt/cursor.go" target=3D"=
_blank">github.com/boltdb/bolt/cursor.go</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 12 +-<br>
+ vendor/src/<a href=3D"http://github.com/boltdb/bolt/db.go" target=3D"_bla=
nk">github.com/boltdb/bolt/db.go</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 195 ++++++++++++----<br>
+ vendor/src/<a href=3D"http://github.com/boltdb/bolt/errors.go" target=3D"=
_blank">github.com/boltdb/bolt/errors.go</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A04 +<br>
+ vendor/src/<a href=3D"http://github.com/boltdb/bolt/freelist.go" target=
=3D"_blank">github.com/boltdb/bolt/freelist.go</a>=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 28 ++-<br>
+ vendor/src/<a href=3D"http://github.com/boltdb/bolt/node.go" target=3D"_b=
lank">github.com/boltdb/bolt/node.go</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 36 ++-<br>
+ vendor/src/<a href=3D"http://github.com/boltdb/bolt/page.go" target=3D"_b=
lank">github.com/boltdb/bolt/page.go</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 45 +++-<br>
+ vendor/src/<a href=3D"http://github.com/boltdb/bolt/tx.go" target=3D"_bla=
nk">github.com/boltdb/bolt/tx.go</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 80 +++++--<br>
+ 21 files changed, 886 insertions(+), 122 deletions(-)<br>
+ create mode 100644 vendor/src/<a href=3D"http://github.com/boltdb/bolt/ba=
tch.go" target=3D"_blank">github.com/boltdb/bolt/batch.go</a><br>
+ create mode 100644 vendor/src/<a href=3D"http://github.com/boltdb/bolt/bo=
lt_arm64.go" target=3D"_blank">github.com/boltdb/bolt/bolt_arm64.go</a><br>
+ create mode 100644 vendor/src/<a href=3D"http://github.com/boltdb/bolt/bo=
lt_ppc64le.go" target=3D"_blank">github.com/boltdb/bolt/bolt_ppc64le.go</a>=
<br>
+ create mode 100644 vendor/src/<a href=3D"http://github.com/boltdb/bolt/bo=
lt_s390x.go" target=3D"_blank">github.com/boltdb/bolt/bolt_s390x.go</a><br>
+ create mode 100644 vendor/src/<a href=3D"http://github.com/boltdb/bolt/bo=
lt_unix_solaris.go" target=3D"_blank">github.com/boltdb/bolt/bolt_unix_sola=
ris.go</a><br>
+<br>
+diff --git a/hack/vendor.sh b/hack/vendor.sh<br>
+index d872d4a..c28e677 100755<br>
+--- a/hack/vendor.sh<br>
++++ b/hack/vendor.sh<br>
+@@ -36,7 +36,7 @@ clone git <a href=3D"http://github.com/coreos/etcd" targ=
et=3D"_blank">
github.com/coreos/etcd</a> v2.2.0<br>
+ fix_rewritten_imports <a href=3D"http://github.com/coreos/etcd" target=3D=
"_blank">github.com/coreos/etcd</a><br>
+ clone git <a href=3D"http://github.com/ugorji/go" target=3D"_blank">githu=
b.com/ugorji/go</a> 5abd4e96a45c386928ed2ca2a7ef63e2533e18ec<br>
+ clone git <a href=3D"http://github.com/hashicorp/consul" target=3D"_blank=
">github.com/hashicorp/consul</a> v0.5.2<br>
+-clone git <a href=3D"http://github.com/boltdb/bolt" target=3D"_blank">git=
hub.com/boltdb/bolt</a> v1.0<br>
++clone git <a href=3D"http://github.com/boltdb/bolt" target=3D"_blank">git=
hub.com/boltdb/bolt</a> v1.1.0<br>
+<br>
+ # get graph and distribution packages<br>
+ clone git <a href=3D"http://github.com/docker/distribution" target=3D"_bl=
ank">github.com/docker/distribution</a> 20c4b7a1805a52753dfd593ee1cc3555872=
2a0ce # docker/1.9 branch<br>
+diff --git a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/.gitignor=
e" target=3D"_blank">github.com/boltdb/bolt/.gitignore</a> b/vendor/src/<a =
href=3D"http://github.com/boltdb/bolt/.gitignore" target=3D"_blank">github.=
com/boltdb/bolt/.gitignore</a><br>
+index b2bb382..c7bd2b7 100644<br>
+--- a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/.gitignore" targ=
et=3D"_blank">github.com/boltdb/bolt/.gitignore</a><br>
++++ b/vendor/src/<a href=3D"http://github.com/boltdb/bolt/.gitignore" targ=
et=3D"_blank">github.com/boltdb/bolt/.gitignore</a><br>
+@@ -1,3 +1,4 @@<br>
+ *.prof<br>
+ *.test<br>
++*.swp<br>
+ /bin/<br>
+diff --git a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/README.md=
" target=3D"_blank">github.com/boltdb/bolt/README.md</a> b/vendor/src/<a hr=
ef=3D"http://github.com/boltdb/bolt/README.md" target=3D"_blank">github.com=
/boltdb/bolt/README.md</a><br>
+index 727e977..0a33ebc 100644<br>
+--- a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/README.md" targe=
t=3D"_blank">github.com/boltdb/bolt/README.md</a><br>
++++ b/vendor/src/<a href=3D"http://github.com/boltdb/bolt/README.md" targe=
t=3D"_blank">github.com/boltdb/bolt/README.md</a><br>
+@@ -16,7 +16,7 @@ and setting values. That&#39;s it.<br>
+<br>
+ ## Project Status<br>
+<br>
+-Bolt is stable and the API is fixed. Full unit test coverage and randomiz=
ed<br>
++Bolt is stable and the API is fixed. Full unit test coverage and randomiz=
ed<br>
+ black box testing are used to ensure database consistency and thread safe=
ty.<br>
+ Bolt is currently in high-load production environments serving databases =
as<br>
+ large as 1TB. Many companies such as Shopify and Heroku use Bolt-backed<b=
r>
+@@ -87,6 +87,11 @@ are not thread safe. To work with data in multiple goro=
utines you must start<br>
+ a transaction for each one or use locking to ensure only one goroutine ac=
cesses<br>
+ a transaction at a time. Creating transaction from the `DB` is thread saf=
e.<br>
+<br>
++Read-only transactions and read-write transactions should not depend on o=
ne<br>
++another and generally shouldn&#39;t be opened simultaneously in the same =
goroutine.<br>
++This can cause a deadlock as the read-write transaction needs to periodic=
ally<br>
++re-map the data file but it cannot do so while a read-only transaction is=
 open.<br>
++<br>
+<br>
+ #### Read-write transactions<br>
+<br>
+@@ -120,12 +125,88 @@ err :=3D db.View(func(tx *bolt.Tx) error {<br>
+ })<br>
+ ```<br>
+<br>
+-You also get a consistent view of the database within this closure, howev=
er,<br>
++You also get a consistent view of the database within this closure, howev=
er,<br>
+ no mutating operations are allowed within a read-only transaction. You ca=
n only<br>
+ retrieve buckets, retrieve values, and copy the database within a read-on=
ly<br>
+ transaction.<br>
+<br>
+<br>
++#### Batch read-write transactions<br>
++<br>
++Each `DB.Update()` waits for disk to commit the writes. This overhead<br>
++can be minimized by combining multiple updates with the `DB.Batch()`<br>
++function:<br>
++<br>
++```go<br>
++err :=3D db.Batch(func(tx *bolt.Tx) error {<br>
++=C2=A0 =C2=A0 =C2=A0 ...<br>
++=C2=A0 =C2=A0 =C2=A0 return nil<br>
++})<br>
++```<br>
++<br>
++Concurrent Batch calls are opportunistically combined into larger<br>
++transactions. Batch is only useful when there are multiple goroutines<br>
++calling it.<br>
++<br>
++The trade-off is that `Batch` can call the given<br>
++function multiple times, if parts of the transaction fail. The<br>
++function must be idempotent and side effects must take effect only<br>
++after a successful return from `DB.Batch()`.<br>
++<br>
++For example: don&#39;t display messages from inside the function, instead=
<br>
++set variables in the enclosing scope:<br>
++<br>
++```go<br>
++var id uint64<br>
++err :=3D db.Batch(func(tx *bolt.Tx) error {<br>
++=C2=A0 =C2=A0 =C2=A0 // Find last key in bucket, decode as bigendian uint=
64, increment<br>
++=C2=A0 =C2=A0 =C2=A0 // by one, encode back to []byte, and add new key.<b=
r>
++=C2=A0 =C2=A0 =C2=A0 ...<br>
++=C2=A0 =C2=A0 =C2=A0 id =3D newValue<br>
++=C2=A0 =C2=A0 =C2=A0 return nil<br>
++})<br>
++if err !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 return ...<br>
++}<br>
++fmt.Println(&quot;Allocated ID %d&quot;, id)<br>
++```<br>
++<br>
++<br>
++#### Managing transactions manually<br>
++<br>
++The `DB.View()` and `DB.Update()` functions are wrappers around the `DB.B=
egin()`<br>
++function. These helper functions will start the transaction, execute a fu=
nction,<br>
++and then safely close your transaction if an error is returned. This is t=
he<br>
++recommended way to use Bolt transactions.<br>
++<br>
++However, sometimes you may want to manually start and end your transactio=
ns.<br>
++You can use the `Tx.Begin()` function directly but _please_ be sure to cl=
ose the<br>
++transaction.<br>
++<br>
++```go<br>
++// Start a writable transaction.<br>
++tx, err :=3D db.Begin(true)<br>
++if err !=3D nil {<br>
++=C2=A0 =C2=A0 return err<br>
++}<br>
++defer tx.Rollback()<br>
++<br>
++// Use the transaction...<br>
++_, err :=3D tx.CreateBucket([]byte(&quot;MyBucket&quot;))<br>
++if err !=3D nil {<br>
++=C2=A0 =C2=A0 return err<br>
++}<br>
++<br>
++// Commit the transaction and check for error.<br>
++if err :=3D tx.Commit(); err !=3D nil {<br>
++=C2=A0 =C2=A0 return err<br>
++}<br>
++```<br>
++<br>
++The first argument to `DB.Begin()` is a boolean stating if the transactio=
n<br>
++should be writable.<br>
++<br>
++<br>
+ ### Using buckets<br>
+<br>
+ Buckets are collections of key/value pairs within the database. All keys =
in a<br>
+@@ -175,13 +256,61 @@ db.View(func(tx *bolt.Tx) error {<br>
+ ```<br>
+<br>
+ The `Get()` function does not return an error because its operation is<br=
>
+-guarenteed to work (unless there is some kind of system failure). If the =
key<br>
++guaranteed to work (unless there is some kind of system failure). If the =
key<br>
+ exists then it will return its byte slice value. If it doesn&#39;t exist =
then it<br>
+ will return `nil`. It&#39;s important to note that you can have a zero-le=
ngth value<br>
+ set to a key which is different than the key not existing.<br>
+<br>
+ Use the `Bucket.Delete()` function to delete a key from the bucket.<br>
+<br>
++Please note that values returned from `Get()` are only valid while the<br=
>
++transaction is open. If you need to use a value outside of the transactio=
n<br>
++then you must use `copy()` to copy it to another byte slice.<br>
++<br>
++<br>
++### Autoincrementing integer for the bucket<br>
++By using the NextSequence() function, you can let Bolt determine a sequen=
ce<br>
++which can be used as the unique identifier for your key/value pairs. See =
the<br>
++example below.<br>
++<br>
++```go<br>
++// CreateUser saves u to the store. The new user ID is set on u once the =
data is persisted.<br>
++func (s *Store) CreateUser(u *User) error {<br>
++=C2=A0 =C2=A0 return s.db.Update(func(tx *bolt.Tx) error {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 // Retrieve the users bucket.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 // This should be created when the DB is firs=
t opened.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 b :=3D tx.Bucket([]byte(&quot;users&quot;))<b=
r>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 // Generate ID for the user.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 // This returns an error only if the Tx is cl=
osed or not writeable.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 // That can&#39;t happen in an Update() call =
so I ignore the error check.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 id, _ =3D b.NextSequence()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 u.ID =3D int(id)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 // Marshal user data into bytes.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 buf, err :=3D json.Marshal(u)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 // Persist bytes to users bucket.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return b.Put(itob(u.ID), buf)<br>
++=C2=A0 =C2=A0 })<br>
++}<br>
++<br>
++// itob returns an 8-byte big endian representation of v.<br>
++func itob(v int) []byte {<br>
++=C2=A0 =C2=A0 b :=3D make([]byte, 8)<br>
++=C2=A0 =C2=A0 binary.BigEndian.PutUint64(b, uint64(v))<br>
++=C2=A0 =C2=A0 return b<br>
++}<br>
++<br>
++type User struct {<br>
++=C2=A0 =C2=A0 ID int<br>
++=C2=A0 =C2=A0 ...<br>
++}<br>
++<br>
++```<br>
+<br>
+ ### Iterating over keys<br>
+<br>
+@@ -254,7 +383,7 @@ db.View(func(tx *bolt.Tx) error {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0max :=3D []byte(&quot;2000-01-01T00:00:00Z&quot=
;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Iterate over the 90&#39;s.<br>
+-=C2=A0 =C2=A0 =C2=A0 for k, v :=3D c.Seek(min); k !=3D nil &amp;&amp; byt=
es.Compare(k, max) !=3D -1; k, v =3D c.Next() {<br>
++=C2=A0 =C2=A0 =C2=A0 for k, v :=3D c.Seek(min); k !=3D nil &amp;&amp; byt=
es.Compare(k, max) &lt;=3D 0; k, v =3D c.Next() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Printf(&quot;%s=
: %s\n&quot;, k, v)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+@@ -294,7 +423,7 @@ func (*Bucket) DeleteBucket(key []byte) error<br>
+<br>
+ ### Database backups<br>
+<br>
+-Bolt is a single file so it&#39;s easy to backup. You can use the `Tx.Cop=
y()`<br>
++Bolt is a single file so it&#39;s easy to backup. You can use the `Tx.Wri=
teTo()`<br>
+ function to write a consistent view of the database to a writer. If you c=
all<br>
+ this from a read-only transaction, it will perform a hot backup and not b=
lock<br>
+ your other database reads and writes. It will also use `O_DIRECT` when av=
ailable<br>
+@@ -305,11 +434,12 @@ do database backups:<br>
+<br>
+ ```go<br>
+ func BackupHandleFunc(w http.ResponseWriter, req *http.Request) {<br>
+-=C2=A0 =C2=A0 =C2=A0 err :=3D db.View(func(tx bolt.Tx) error {<br>
++=C2=A0 =C2=A0 =C2=A0 err :=3D db.View(func(tx *bolt.Tx) error {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0w.Header().Set(&quo=
t;Content-Type&quot;, &quot;application/octet-stream&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0w.Header().Set(&quo=
t;Content-Disposition&quot;, `attachment; filename=3D&quot;my.db&quot;`)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0w.Header().Set(&quo=
t;Content-Length&quot;, strconv.Itoa(int(tx.Size())))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return tx.Copy(w)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _, err :=3D tx.WriteTo(w=
)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0})<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0http.Error(w, err.E=
rror(), http.StatusInternalServerError)<br>
+@@ -351,14 +481,13 @@ go func() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Grab the current=
 stats and diff them.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stats :=3D db.Stats=
()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff :=3D stats.Sub=
(&amp;prev)<br>
+-<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Encode stats to =
JSON and print to STDERR.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0json.NewEncoder(os.=
Stderr).Encode(diff)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Save stats for t=
he next loop.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prev =3D stats<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-}<br>
+ }()<br>
+ ```<br>
+<br>
+@@ -366,25 +495,83 @@ It&#39;s also useful to pipe these stats to a servic=
e such as statsd for monitoring<br>
+ or to provide an HTTP endpoint that will perform a fixed-length sample.<b=
r>
+<br>
+<br>
++### Read-Only Mode<br>
++<br>
++Sometimes it is useful to create a shared, read-only Bolt database. To th=
is,<br>
++set the `Options.ReadOnly` flag when opening your database. Read-only mod=
e<br>
++uses a shared lock to allow multiple processes to read from the database =
but<br>
++it will block any processes from opening the database in read-write mode.=
<br>
++<br>
++```go<br>
++db, err :=3D bolt.Open(&quot;my.db&quot;, 0666, &amp;bolt.Options{ReadOnl=
y: true})<br>
++if err !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 log.Fatal(err)<br>
++}<br>
++```<br>
++<br>
++<br>
+ ## Resources<br>
+<br>
+ For more information on getting started with Bolt, check out the followin=
g articles:<br>
+<br>
+ * [Intro to BoltDB: Painless Performant Persistence](<a href=3D"http://np=
f.io/2014/07/intro-to-boltdb-painless-performant-persistence/" target=3D"_b=
lank">http://npf.io/2014/07/intro-to-boltdb-painless-performant-persistence=
/</a>) by [Nate Finch](<a href=3D"https://github.com/natefinch" target=3D"_=
blank">https://github.com/natefinch</a>).<br>
++* [Bolt -- an embedded key/value database for Go](<a href=3D"https://www.=
progville.com/go/bolt-embedded-db-golang/" target=3D"_blank">https://www.pr=
ogville.com/go/bolt-embedded-db-golang/</a>) by Progville<br>
++<br>
++<br>
++## Comparison with other databases<br>
++<br>
++### Postgres, MySQL, &amp; other relational databases<br>
++<br>
++Relational databases structure data into rows and are only accessible thr=
ough<br>
++the use of SQL. This approach provides flexibility in how you store and q=
uery<br>
++your data but also incurs overhead in parsing and planning SQL statements=
. Bolt<br>
++accesses all data by a byte slice key. This makes Bolt fast to read and w=
rite<br>
++data by key but provides no built-in support for joining values together.=
<br>
++<br>
++Most relational databases (with the exception of SQLite) are standalone s=
ervers<br>
++that run separately from your application. This gives your systems<br>
++flexibility to connect multiple application servers to a single database<=
br>
++server but also adds overhead in serializing and transporting data over t=
he<br>
++network. Bolt runs as a library included in your application so all data =
access<br>
++has to go through your application&#39;s process. This brings data closer=
 to your<br>
++application but limits multi-process access to the data.<br>
++<br>
++<br>
++### LevelDB, RocksDB<br>
+<br>
++LevelDB and its derivatives (RocksDB, HyperLevelDB) are similar to Bolt i=
n that<br>
++they are libraries bundled into the application, however, their underlyin=
g<br>
++structure is a log-structured merge-tree (LSM tree). An LSM tree optimize=
s<br>
++random writes by using a write ahead log and multi-tiered, sorted files c=
alled<br>
++SSTables. Bolt uses a B+tree internally and only a single file. Both appr=
oaches<br>
++have trade offs.<br>
+<br>
++If you require a high random write throughput (&gt;10,000 w/sec) or you n=
eed to use<br>
++spinning disks then LevelDB could be a good choice. If your application i=
s<br>
++read-heavy or does a lot of range scans then Bolt could be a good choice.=
<br>
+<br>
+-## Comparing Bolt to LMDB<br>
++One other important consideration is that LevelDB does not have transacti=
ons.<br>
++It supports batch writing of key/values pairs and it supports read snapsh=
ots<br>
++but it will not give you the ability to do a compare-and-swap operation s=
afely.<br>
++Bolt supports fully serializable ACID transactions.<br>
++<br>
++<br>
++### LMDB<br>
+<br>
+ Bolt was originally a port of LMDB so it is architecturally similar. Both=
 use<br>
+-a B+tree, have ACID semanetics with fully serializable transactions, and =
support<br>
++a B+tree, have ACID semantics with fully serializable transactions, and s=
upport<br>
+ lock-free MVCC using a single writer and multiple readers.<br>
+<br>
+ The two projects have somewhat diverged. LMDB heavily focuses on raw perf=
ormance<br>
+ while Bolt has focused on simplicity and ease of use. For example, LMDB a=
llows<br>
+-several unsafe actions such as direct writes and append writes for the sa=
ke of<br>
+-performance. Bolt opts to disallow actions which can leave the database i=
n a<br>
+-corrupted state. The only exception to this in Bolt is `DB.NoSync`.<br>
++several unsafe actions such as direct writes for the sake of performance.=
 Bolt<br>
++opts to disallow actions which can leave the database in a corrupted stat=
e. The<br>
++only exception to this in Bolt is `DB.NoSync`.<br>
++<br>
++There are also a few differences in API. LMDB requires a maximum mmap siz=
e when<br>
++opening an `mdb_env` whereas Bolt will handle incremental mmap resizing<b=
r>
++automatically. LMDB overloads the getter and setter functions with multip=
le<br>
++flags whereas Bolt splits these specialized cases into their own function=
s.<br>
+<br>
+<br>
+ ## Caveats &amp; Limitations<br>
+@@ -425,14 +612,33 @@ Here are a few things to note when evaluating and us=
ing Bolt:<br>
+=C2=A0 =C2=A0can in memory and will release memory as needed to other proc=
esses. This means<br>
+=C2=A0 =C2=A0that Bolt can show very high memory usage when working with l=
arge databases.<br>
+=C2=A0 =C2=A0However, this is expected and the OS will release memory as n=
eeded. Bolt can<br>
+-=C2=A0 handle databases much larger than the available physical RAM.<br>
++=C2=A0 handle databases much larger than the available physical RAM, prov=
ided its<br>
++=C2=A0 memory-map fits in the process virtual address space. It may be pr=
oblematic<br>
++=C2=A0 on 32-bits systems.<br>
++<br>
++* The data structures in the Bolt database are memory mapped so the data =
file<br>
++=C2=A0 will be endian specific. This means that you cannot copy a Bolt fi=
le from a<br>
++=C2=A0 little endian machine to a big endian machine and have it work. Fo=
r most<br>
++=C2=A0 users this is not a concern since most modern CPUs are little endi=
an.<br>
++<br>
++* Because of the way pages are laid out on disk, Bolt cannot truncate dat=
a files<br>
++=C2=A0 and return free pages back to the disk. Instead, Bolt maintains a =
free list<br>
++=C2=A0 of unused pages within its data file. These free pages can be reus=
ed by later<br>
++=C2=A0 transactions. This works well for many use cases as databases gene=
rally tend<br>
++=C2=A0 to grow. However, it&#39;s important to note that deleting large c=
hunks of data<br>
++=C2=A0 will not allow you to reclaim that space on disk.<br>
++<br>
++=C2=A0 For more information on page allocation, [see this comment][page-a=
llocation].<br>
++<br>
++[page-allocation]: <a href=3D"https://github.com/boltdb/bolt/issues/308#i=
ssuecomment-74811638" target=3D"_blank">
https://github.com/boltdb/bolt/issues/308#issuecomment-74811638</a><br>
+<br>
+<br>
+ ## Other Projects Using Bolt<br>
+<br>
+ Below is a list of public, open source projects that use Bolt:<br>
+<br>
+-* [Bazil](<a href=3D"https://github.com/bazillion/bazil" target=3D"_blank=
">https://github.com/bazillion/bazil</a>) - A file system that lets your da=
ta reside where it is most convenient for it to reside.<br>
++* [Operation Go: A Routine Mission](<a href=3D"http://gocode.io" target=
=3D"_blank">http://gocode.io</a>) - An online programming game for Golang u=
sing Bolt for user accounts and a leaderboard.<br>
++* [Bazil](<a href=3D"https://bazil.org/" target=3D"_blank">https://bazil.=
org/</a>) - A file system that lets your data reside where it is most conve=
nient for it to reside.<br>
+ * [DVID](<a href=3D"https://github.com/janelia-flyem/dvid" target=3D"_bla=
nk">https://github.com/janelia-flyem/dvid</a>) - Added Bolt as optional sto=
rage engine and testing it against Basho-tuned leveldb.<br>
+ * [Skybox Analytics](<a href=3D"https://github.com/skybox/skybox" target=
=3D"_blank">https://github.com/skybox/skybox</a>) - A standalone funnel ana=
lysis tool for web analytics.<br>
+ * [Scuttlebutt](<a href=3D"https://github.com/benbjohnson/scuttlebutt" ta=
rget=3D"_blank">https://github.com/benbjohnson/scuttlebutt</a>) - Uses Bolt=
 to store and process all Twitter mentions of GitHub projects.<br>
+@@ -450,6 +656,16 @@ Below is a list of public, open source projects that =
use Bolt:<br>
+ * [bleve](<a href=3D"http://www.blevesearch.com/" target=3D"_blank">http:=
//www.blevesearch.com/</a>) - A pure Go search engine similar to ElasticSea=
rch that uses Bolt as the default storage backend.<br>
+ * [tentacool](<a href=3D"https://github.com/optiflows/tentacool" target=
=3D"_blank">https://github.com/optiflows/tentacool</a>) - REST api server t=
o manage system stuff (IP, DNS, Gateway...) on a linux server.<br>
+ * [SkyDB](<a href=3D"https://github.com/skydb/sky" target=3D"_blank">http=
s://github.com/skydb/sky</a>) - Behavioral analytics database.<br>
++* [Seaweed File System](<a href=3D"https://github.com/chrislusf/weed-fs" =
target=3D"_blank">https://github.com/chrislusf/weed-fs</a>) - Highly scalab=
le distributed key~file system with O(1) disk read.<br>
++* [InfluxDB](<a href=3D"http://influxdb.com" target=3D"_blank">http://inf=
luxdb.com</a>) - Scalable datastore for metrics, events, and real-time anal=
ytics.<br>
++* [Freehold](<a href=3D"http://tshannon.bitbucket.org/freehold/" target=
=3D"_blank">http://tshannon.bitbucket.org/freehold/</a>) - An open, secure,=
 and lightweight platform for your files and data.<br>
++* [Prometheus Annotation Server](<a href=3D"https://github.com/oliver006/=
prom_annotation_server" target=3D"_blank">https://github.com/oliver006/prom=
_annotation_server</a>) - Annotation server for PromDash &amp; Prometheus s=
ervice monitoring system.<br>
++* [Consul](<a href=3D"https://github.com/hashicorp/consul" target=3D"_bla=
nk">https://github.com/hashicorp/consul</a>) - Consul is service discovery =
and configuration made easy. Distributed, highly available, and datacenter-=
aware.<br>
++* [Kala](<a href=3D"https://github.com/ajvb/kala" target=3D"_blank">https=
://github.com/ajvb/kala</a>) - Kala is a modern job scheduler optimized to =
run on a single node. It is persistent, JSON over HTTP API, ISO 8601 durati=
on notation, and dependent jobs.<br>
++* [drive](<a href=3D"https://github.com/odeke-em/drive" target=3D"_blank"=
>https://github.com/odeke-em/drive</a>) - drive is an unofficial Google Dri=
ve command line client for \*NIX operating systems.<br>
++* [stow](<a href=3D"https://github.com/djherbis/stow" target=3D"_blank">h=
ttps://github.com/djherbis/stow</a>) -=C2=A0 a persistence manager for obje=
cts<br>
++=C2=A0 backed by boltdb.<br>
++* [buckets](<a href=3D"https://github.com/joyrexus/buckets" target=3D"_bl=
ank">https://github.com/joyrexus/buckets</a>) - a bolt wrapper streamlining=
<br>
++=C2=A0 simple tx and key scans.<br>
+<br>
+ If you are using Bolt in a project please send a pull request to add it t=
o the list.<br>
+-<br>
+diff --git a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/batch.go"=
 target=3D"_blank">github.com/boltdb/bolt/batch.go</a> b/vendor/src/<a href=
=3D"http://github.com/boltdb/bolt/batch.go" target=3D"_blank">github.com/bo=
ltdb/bolt/batch.go</a><br>
+new file mode 100644<br>
+index 0000000..84acae6<br>
+--- /dev/null<br>
++++ b/vendor/src/<a href=3D"http://github.com/boltdb/bolt/batch.go" target=
=3D"_blank">github.com/boltdb/bolt/batch.go</a><br>
+@@ -0,0 +1,138 @@<br>
++package bolt<br>
++<br>
++import (<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;errors&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;fmt&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;sync&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;time&quot;<br>
++)<br>
++<br>
++// Batch calls fn as part of a batch. It behaves similar to Update,<br>
++// except:<br>
++//<br>
++// 1. concurrent Batch calls can be combined into a single Bolt<br>
++// transaction.<br>
++//<br>
++// 2. the function passed to Batch may be called multiple times,<br>
++// regardless of whether it returns error or not.<br>
++//<br>
++// This means that Batch function side effects must be idempotent and<br>
++// take permanent effect only after a successful return is seen in<br>
++// caller.<br>
++//<br>
++// The maximum batch size and delay can be adjusted with DB.MaxBatchSize<=
br>
++// and DB.MaxBatchDelay, respectively.<br>
++//<br>
++// Batch is only useful when there are multiple goroutines calling it.<br=
>
++func (db *DB) Batch(fn func(*Tx) error) error {<br>
++=C2=A0 =C2=A0 =C2=A0 errCh :=3D make(chan error, 1)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 db.batchMu.Lock()<br>
++=C2=A0 =C2=A0 =C2=A0 if (db.batch =3D=3D nil) || (db.batch !=3D nil &amp;=
&amp; len(db.batch.calls) &gt;=3D db.MaxBatchSize) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // There is no existing =
batch, or the existing batch is full; start a new one.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 db.batch =3D &amp;batch{=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 db: db,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 db.batch.timer =3D time.=
AfterFunc(db.MaxBatchDelay, db.batch.trigger)<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 db.batch.calls =3D append(db.batch.calls, call{fn: f=
n, err: errCh})<br>
++=C2=A0 =C2=A0 =C2=A0 if len(db.batch.calls) &gt;=3D db.MaxBatchSize {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // wake up batch, it&#39=
;s ready to run<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 go db.batch.trigger()<br=
>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 db.batchMu.Unlock()<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 err :=3D &lt;-errCh<br>
++=C2=A0 =C2=A0 =C2=A0 if err =3D=3D trySolo {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D db.Update(fn)<br=
>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return err<br>
++}<br>
++<br>
++type call struct {<br>
++=C2=A0 =C2=A0 =C2=A0 fn=C2=A0 func(*Tx) error<br>
++=C2=A0 =C2=A0 =C2=A0 err chan&lt;- error<br>
++}<br>
++<br>
++type batch struct {<br>
++=C2=A0 =C2=A0 =C2=A0 db=C2=A0 =C2=A0 *DB<br>
++=C2=A0 =C2=A0 =C2=A0 timer *time.Timer<br>
++=C2=A0 =C2=A0 =C2=A0 start sync.Once<br>
++=C2=A0 =C2=A0 =C2=A0 calls []call<br>
++}<br>
++<br>
++// trigger runs the batch if it hasn&#39;t already been run.<br>
++func (b *batch) trigger() {<br>
++=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://b.start.Do" target=3D"_blank">b.st=
art.Do</a>(b.run)<br>
++}<br>
++<br>
++// run performs the transactions in the batch and communicates results<br=
>
++// back to DB.Batch.<br>
++func (b *batch) run() {<br>
++=C2=A0 =C2=A0 =C2=A0 b.db.batchMu.Lock()<br>
++=C2=A0 =C2=A0 =C2=A0 b.timer.Stop()<br>
++=C2=A0 =C2=A0 =C2=A0 // Make sure no new work is added to this batch, but=
 don&#39;t break<br>
++=C2=A0 =C2=A0 =C2=A0 // other batches.<br>
++=C2=A0 =C2=A0 =C2=A0 if b.db.batch =3D=3D b {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b.db.batch =3D nil<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 b.db.batchMu.Unlock()<br>
++<br>
++retry:<br>
++=C2=A0 =C2=A0 =C2=A0 for len(b.calls) &gt; 0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 var failIdx =3D -1<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err :=3D b.db.Update(fun=
c(tx *Tx) error {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 for i, c :=3D range b.calls {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if err :=3D safelyCall(c.fn, tx); err !=3D =
nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 failIdx =3D i<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return nil<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 })<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if failIdx &gt;=3D 0 {<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // take the failing transaction out of the batch. it&#39;s<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // safe to shorten b.calls here because db.batch no longer<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // points to us, and we hold the mutex anyway.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 c :=3D b.calls[failIdx]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 b.calls[failIdx], b.calls =3D b.calls[len(b.calls)-1], b.calls[:len(b.c=
alls)-1]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // tell the submitter re-run it solo, continue with the rest of the bat=
ch<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 c.err &lt;- trySolo<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 continue retry<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // pass success, or bolt=
 internal errors, to all callers<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for _, c :=3D range b.ca=
lls {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if c.err !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c.err &lt;- err<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break retry<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++}<br>
++<br>
++// trySolo is a special sentinel error value used for signaling that a<br=
>
++// transaction function should be re-run. It should never be seen by<br>
++// callers.<br>
++var trySolo =3D errors.New(&quot;batch function returned an error and sho=
uld be re-run solo&quot;)<br>
++<br>
++type panicked struct {<br>
++=C2=A0 =C2=A0 =C2=A0 reason interface{}<br>
++}<br>
++<br>
++func (p panicked) Error() string {<br>
++=C2=A0 =C2=A0 =C2=A0 if err, ok :=3D p.reason.(error); ok {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err.Error()<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return fmt.Sprintf(&quot;panic: %v&quot;, p.reason)<=
br>
++}<br>
++<br>
++func safelyCall(fn func(*Tx) error, tx *Tx) (err error) {<br>
++=C2=A0 =C2=A0 =C2=A0 defer func() {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if p :=3D recover(); p !=
=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 err =3D panicked{p}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }()<br>
++=C2=A0 =C2=A0 =C2=A0 return fn(tx)<br>
++}<br>
+diff --git a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_386.=
go" target=3D"_blank">github.com/boltdb/bolt/bolt_386.go</a> b/vendor/src/<=
a href=3D"http://github.com/boltdb/bolt/bolt_386.go" target=3D"_blank">gith=
ub.com/boltdb/bolt/bolt_386.go</a><br>
+index 856f401..e659bfb 100644<br>
+--- a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_386.go" tar=
get=3D"_blank">github.com/boltdb/bolt/bolt_386.go</a><br>
++++ b/vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_386.go" tar=
get=3D"_blank">github.com/boltdb/bolt/bolt_386.go</a><br>
+@@ -1,4 +1,7 @@<br>
+ package bolt<br>
+<br>
+ // maxMapSize represents the largest mmap size supported by Bolt.<br>
+-const maxMapSize =3D 0xFFFFFFF // 256MB<br>
++const maxMapSize =3D 0x7FFFFFFF // 2GB<br>
++<br>
++// maxAllocSize is the size used when creating array pointers.<br>
++const maxAllocSize =3D 0xFFFFFFF<br>
+diff --git a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_amd6=
4.go" target=3D"_blank">github.com/boltdb/bolt/bolt_amd64.go</a> b/vendor/s=
rc/<a href=3D"http://github.com/boltdb/bolt/bolt_amd64.go" target=3D"_blank=
">github.com/boltdb/bolt/bolt_amd64.go</a><br>
+index 4262932..cca6b7e 100644<br>
+--- a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_amd64.go" t=
arget=3D"_blank">github.com/boltdb/bolt/bolt_amd64.go</a><br>
++++ b/vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_amd64.go" t=
arget=3D"_blank">github.com/boltdb/bolt/bolt_amd64.go</a><br>
+@@ -2,3 +2,6 @@ package bolt<br>
+<br>
+ // maxMapSize represents the largest mmap size supported by Bolt.<br>
+ const maxMapSize =3D 0xFFFFFFFFFFFF // 256TB<br>
++<br>
++// maxAllocSize is the size used when creating array pointers.<br>
++const maxAllocSize =3D 0x7FFFFFFF<br>
+diff --git a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_arm.=
go" target=3D"_blank">github.com/boltdb/bolt/bolt_arm.go</a> b/vendor/src/<=
a href=3D"http://github.com/boltdb/bolt/bolt_arm.go" target=3D"_blank">gith=
ub.com/boltdb/bolt/bolt_arm.go</a><br>
+index 856f401..e659bfb 100644<br>
+--- a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_arm.go" tar=
get=3D"_blank">github.com/boltdb/bolt/bolt_arm.go</a><br>
++++ b/vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_arm.go" tar=
get=3D"_blank">github.com/boltdb/bolt/bolt_arm.go</a><br>
+@@ -1,4 +1,7 @@<br>
+ package bolt<br>
+<br>
+ // maxMapSize represents the largest mmap size supported by Bolt.<br>
+-const maxMapSize =3D 0xFFFFFFF // 256MB<br>
++const maxMapSize =3D 0x7FFFFFFF // 2GB<br>
++<br>
++// maxAllocSize is the size used when creating array pointers.<br>
++const maxAllocSize =3D 0xFFFFFFF<br>
+diff --git a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_arm6=
4.go" target=3D"_blank">github.com/boltdb/bolt/bolt_arm64.go</a> b/vendor/s=
rc/<a href=3D"http://github.com/boltdb/bolt/bolt_arm64.go" target=3D"_blank=
">github.com/boltdb/bolt/bolt_arm64.go</a><br>
+new file mode 100644<br>
+index 0000000..6d23093<br>
+--- /dev/null<br>
++++ b/vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_arm64.go" t=
arget=3D"_blank">github.com/boltdb/bolt/bolt_arm64.go</a><br>
+@@ -0,0 +1,9 @@<br>
++// +build arm64<br>
++<br>
++package bolt<br>
++<br>
++// maxMapSize represents the largest mmap size supported by Bolt.<br>
++const maxMapSize =3D 0xFFFFFFFFFFFF // 256TB<br>
++<br>
++// maxAllocSize is the size used when creating array pointers.<br>
++const maxAllocSize =3D 0x7FFFFFFF<br>
+diff --git a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_ppc6=
4le.go" target=3D"_blank">github.com/boltdb/bolt/bolt_ppc64le.go</a> b/vend=
or/src/<a href=3D"http://github.com/boltdb/bolt/bolt_ppc64le.go" target=3D"=
_blank">github.com/boltdb/bolt/bolt_ppc64le.go</a><br>
+new file mode 100644<br>
+index 0000000..8351e12<br>
+--- /dev/null<br>
++++ b/vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_ppc64le.go"=
 target=3D"_blank">github.com/boltdb/bolt/bolt_ppc64le.go</a><br>
+@@ -0,0 +1,9 @@<br>
++// +build ppc64le<br>
++<br>
++package bolt<br>
++<br>
++// maxMapSize represents the largest mmap size supported by Bolt.<br>
++const maxMapSize =3D 0xFFFFFFFFFFFF // 256TB<br>
++<br>
++// maxAllocSize is the size used when creating array pointers.<br>
++const maxAllocSize =3D 0x7FFFFFFF<br>
+diff --git a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_s390=
x.go" target=3D"_blank">github.com/boltdb/bolt/bolt_s390x.go</a> b/vendor/s=
rc/<a href=3D"http://github.com/boltdb/bolt/bolt_s390x.go" target=3D"_blank=
">github.com/boltdb/bolt/bolt_s390x.go</a><br>
+new file mode 100644<br>
+index 0000000..f4dd26b<br>
+--- /dev/null<br>
++++ b/vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_s390x.go" t=
arget=3D"_blank">github.com/boltdb/bolt/bolt_s390x.go</a><br>
+@@ -0,0 +1,9 @@<br>
++// +build s390x<br>
++<br>
++package bolt<br>
++<br>
++// maxMapSize represents the largest mmap size supported by Bolt.<br>
++const maxMapSize =3D 0xFFFFFFFFFFFF // 256TB<br>
++<br>
++// maxAllocSize is the size used when creating array pointers.<br>
++const maxAllocSize =3D 0x7FFFFFFF<br>
+diff --git a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_unix=
.go" target=3D"_blank">github.com/boltdb/bolt/bolt_unix.go</a> b/vendor/src=
/<a href=3D"http://github.com/boltdb/bolt/bolt_unix.go" target=3D"_blank">g=
ithub.com/boltdb/bolt/bolt_unix.go</a><br>
+index 95647a7..6eef6b2 100644<br>
+--- a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_unix.go" ta=
rget=3D"_blank">github.com/boltdb/bolt/bolt_unix.go</a><br>
++++ b/vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_unix.go" ta=
rget=3D"_blank">github.com/boltdb/bolt/bolt_unix.go</a><br>
+@@ -1,8 +1,9 @@<br>
+-// +build !windows,!plan9<br>
++// +build !windows,!plan9,!solaris<br>
+<br>
+ package bolt<br>
+<br>
+ import (<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;fmt&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;os&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;syscall&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;time&quot;<br>
+@@ -10,7 +11,7 @@ import (<br>
+ )<br>
+<br>
+ // flock acquires an advisory lock on a file descriptor.<br>
+-func flock(f *os.File, timeout time.Duration) error {<br>
++func flock(f *os.File, exclusive bool, timeout time.Duration) error {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0var t time.Time<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// If we&#39;re bey=
ond our timeout then return an error.<br>
+@@ -20,9 +21,13 @@ func flock(f *os.File, timeout time.Duration) error {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if timeout &=
gt; 0 &amp;&amp; time.Since(t) &gt; timeout {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return ErrTimeout<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flag :=3D syscall.LOCK_S=
H<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if exclusive {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 flag =3D syscall.LOCK_EX<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Otherwise attemp=
t to obtain an exclusive lock.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err :=3D syscall.Flock(i=
nt(f.Fd()), syscall.LOCK_EX|syscall.LOCK_NB)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err :=3D syscall.Flock(i=
nt(f.Fd()), flag|syscall.LOCK_NB)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if err =3D=3D nil {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return nil<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if err !=3D =
syscall.EWOULDBLOCK {<br>
+@@ -41,11 +46,28 @@ func funlock(f *os.File) error {<br>
+<br>
+ // mmap memory maps a DB&#39;s data file.<br>
+ func mmap(db *DB, sz int) error {<br>
++=C2=A0 =C2=A0 =C2=A0 // Truncate and fsync to ensure file size metadata i=
s flushed.<br>
++=C2=A0 =C2=A0 =C2=A0 // <a href=3D"https://github.com/boltdb/bolt/issues/=
284" target=3D"_blank">https://github.com/boltdb/bolt/issues/284</a><br>
++=C2=A0 =C2=A0 =C2=A0 if !db.NoGrowSync &amp;&amp; !db.readOnly {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if err :=3D db.file.Trun=
cate(int64(sz)); err !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return fmt.Errorf(&quot;file resize error: %s&quot;, err)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if err :=3D db.file.Sync=
(); err !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return fmt.Errorf(&quot;file sync error: %s&quot;, err)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // Map the data file to memory.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0b, err :=3D syscall.Mmap(int(db.file.Fd()), 0, =
sz, syscall.PROT_READ, syscall.MAP_SHARED)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
++=C2=A0 =C2=A0 =C2=A0 // Advise the kernel that the mmap is accessed rando=
mly.<br>
++=C2=A0 =C2=A0 =C2=A0 if err :=3D madvise(b, syscall.MADV_RANDOM); err !=
=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return fmt.Errorf(&quot;=
madvise: %s&quot;, err)<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Save the original byte slice and convert to =
a byte array pointer.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0db.dataref =3D b<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0db.data =3D (*[maxMapSize]byte)(unsafe.Pointer(=
&amp;b[0]))<br>
+@@ -67,3 +89,12 @@ func munmap(db *DB) error {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0db.datasz =3D 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return err<br>
+ }<br>
++<br>
++// NOTE: This function is copied from stdlib because it is not available =
on darwin.<br>
++func madvise(b []byte, advice int) (err error) {<br>
++=C2=A0 =C2=A0 =C2=A0 _, _, e1 :=3D syscall.Syscall(syscall.SYS_MADVISE, u=
intptr(unsafe.Pointer(&amp;b[0])), uintptr(len(b)), uintptr(advice))<br>
++=C2=A0 =C2=A0 =C2=A0 if e1 !=3D 0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D e1<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return<br>
++}<br>
+diff --git a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_unix=
_solaris.go" target=3D"_blank">github.com/boltdb/bolt/bolt_unix_solaris.go<=
/a> b/vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_unix_solaris=
.go" target=3D"_blank">github.com/boltdb/bolt/bolt_unix_solaris.go</a><br>
+new file mode 100644<br>
+index 0000000..f480ee7<br>
+--- /dev/null<br>
++++ b/vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_unix_solari=
s.go" target=3D"_blank">github.com/boltdb/bolt/bolt_unix_solaris.go</a><br>
+@@ -0,0 +1,101 @@<br>
++<br>
++package bolt<br>
++<br>
++import (<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;fmt&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;os&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;syscall&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;time&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;unsafe&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"http://golang.org/x/sys/unix" targe=
t=3D"_blank">golang.org/x/sys/unix</a>&quot;<br>
++)<br>
++<br>
++// flock acquires an advisory lock on a file descriptor.<br>
++func flock(f *os.File, exclusive bool, timeout time.Duration) error {<br>
++=C2=A0 =C2=A0 =C2=A0 var t time.Time<br>
++=C2=A0 =C2=A0 =C2=A0 for {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // If we&#39;re beyond o=
ur timeout then return an error.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // This can only occur a=
fter we&#39;ve attempted a flock once.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if t.IsZero() {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 t =3D time.Now()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if timeout &gt; 0=
 &amp;&amp; time.Since(t) &gt; timeout {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return ErrTimeout<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 var lock syscall.Flock_t=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lock.Start =3D 0<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lock.Len =3D 0<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lock.Pid =3D 0<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lock.Whence =3D 0<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lock.Pid =3D 0<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if exclusive {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 lock.Type =3D syscall.F_WRLCK<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 lock.Type =3D syscall.F_RDLCK<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err :=3D syscall.FcntlFl=
ock(f.Fd(), syscall.F_SETLK, &amp;lock)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if err =3D=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return nil<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if err !=3D sysca=
ll.EAGAIN {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return err<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Wait for a bit and tr=
y again.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time.Sleep(50 * time.Mil=
lisecond)<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++}<br>
++<br>
++// funlock releases an advisory lock on a file descriptor.<br>
++func funlock(f *os.File) error {<br>
++=C2=A0 =C2=A0 =C2=A0 var lock syscall.Flock_t<br>
++=C2=A0 =C2=A0 =C2=A0 lock.Start =3D 0<br>
++=C2=A0 =C2=A0 =C2=A0 lock.Len =3D 0<br>
++=C2=A0 =C2=A0 =C2=A0 lock.Type =3D syscall.F_UNLCK<br>
++=C2=A0 =C2=A0 =C2=A0 lock.Whence =3D 0<br>
++=C2=A0 =C2=A0 =C2=A0 return syscall.FcntlFlock(uintptr(f.Fd()), syscall.F=
_SETLK, &amp;lock)<br>
++}<br>
++<br>
++// mmap memory maps a DB&#39;s data file.<br>
++func mmap(db *DB, sz int) error {<br>
++=C2=A0 =C2=A0 =C2=A0 // Truncate and fsync to ensure file size metadata i=
s flushed.<br>
++=C2=A0 =C2=A0 =C2=A0 // <a href=3D"https://github.com/boltdb/bolt/issues/=
284" target=3D"_blank">https://github.com/boltdb/bolt/issues/284</a><br>
++=C2=A0 =C2=A0 =C2=A0 if !db.NoGrowSync &amp;&amp; !db.readOnly {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if err :=3D db.file.Trun=
cate(int64(sz)); err !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return fmt.Errorf(&quot;file resize error: %s&quot;, err)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if err :=3D db.file.Sync=
(); err !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return fmt.Errorf(&quot;file sync error: %s&quot;, err)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // Map the data file to memory.<br>
++=C2=A0 =C2=A0 =C2=A0 b, err :=3D unix.Mmap(int(db.file.Fd()), 0, sz, sysc=
all.PROT_READ, syscall.MAP_SHARED)<br>
++=C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // Advise the kernel that the mmap is accessed rando=
mly.<br>
++=C2=A0 =C2=A0 =C2=A0 if err :=3D unix.Madvise(b, syscall.MADV_RANDOM); er=
r !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return fmt.Errorf(&quot;=
madvise: %s&quot;, err)<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // Save the original byte slice and convert to a byt=
e array pointer.<br>
++=C2=A0 =C2=A0 =C2=A0 db.dataref =3D b<br>
++=C2=A0 =C2=A0 =C2=A0 db.data =3D (*[maxMapSize]byte)(unsafe.Pointer(&amp;=
b[0]))<br>
++=C2=A0 =C2=A0 =C2=A0 db.datasz =3D sz<br>
++=C2=A0 =C2=A0 =C2=A0 return nil<br>
++}<br>
++<br>
++// munmap unmaps a DB&#39;s data file from memory.<br>
++func munmap(db *DB) error {<br>
++=C2=A0 =C2=A0 =C2=A0 // Ignore the unmap if we have no mapped data.<br>
++=C2=A0 =C2=A0 =C2=A0 if db.dataref =3D=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return nil<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // Unmap using the original byte slice.<br>
++=C2=A0 =C2=A0 =C2=A0 err :=3D unix.Munmap(db.dataref)<br>
++=C2=A0 =C2=A0 =C2=A0 db.dataref =3D nil<br>
++=C2=A0 =C2=A0 =C2=A0 db.data =3D nil<br>
++=C2=A0 =C2=A0 =C2=A0 db.datasz =3D 0<br>
++=C2=A0 =C2=A0 =C2=A0 return err<br>
++}<br>
+diff --git a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_wind=
ows.go" target=3D"_blank">github.com/boltdb/bolt/bolt_windows.go</a> b/vend=
or/src/<a href=3D"http://github.com/boltdb/bolt/bolt_windows.go" target=3D"=
_blank">github.com/boltdb/bolt/bolt_windows.go</a><br>
+index c8539d4..8b782be 100644<br>
+--- a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_windows.go"=
 target=3D"_blank">github.com/boltdb/bolt/bolt_windows.go</a><br>
++++ b/vendor/src/<a href=3D"http://github.com/boltdb/bolt/bolt_windows.go"=
 target=3D"_blank">github.com/boltdb/bolt/bolt_windows.go</a><br>
+@@ -16,7 +16,7 @@ func fdatasync(db *DB) error {<br>
+ }<br>
+<br>
+ // flock acquires an advisory lock on a file descriptor.<br>
+-func flock(f *os.File, _ time.Duration) error {<br>
++func flock(f *os.File, _ bool, _ time.Duration) error {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return nil<br>
+ }<br>
+<br>
+@@ -28,9 +28,11 @@ func funlock(f *os.File) error {<br>
+ // mmap memory maps a DB&#39;s data file.<br>
+ // Based on: <a href=3D"https://github.com/edsrzf/mmap-go" target=3D"_bla=
nk">https://github.com/edsrzf/mmap-go</a><br>
+ func mmap(db *DB, sz int) error {<br>
+-=C2=A0 =C2=A0 =C2=A0 // Truncate the database to the size of the mmap.<br=
>
+-=C2=A0 =C2=A0 =C2=A0 if err :=3D db.file.Truncate(int64(sz)); err !=3D ni=
l {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return fmt.Errorf(&quot;=
truncate: %s&quot;, err)<br>
++=C2=A0 =C2=A0 =C2=A0 if !db.readOnly {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Truncate the database=
 to the size of the mmap.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if err :=3D db.file.Trun=
cate(int64(sz)); err !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return fmt.Errorf(&quot;truncate: %s&quot;, err)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Open a file mapping handle.<br>
+diff --git a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/bucket.go=
" target=3D"_blank">github.com/boltdb/bolt/bucket.go</a> b/vendor/src/<a hr=
ef=3D"http://github.com/boltdb/bolt/bucket.go" target=3D"_blank">github.com=
/boltdb/bolt/bucket.go</a><br>
+index 2630800..2925288 100644<br>
+--- a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/bucket.go" targe=
t=3D"_blank">github.com/boltdb/bolt/bucket.go</a><br>
++++ b/vendor/src/<a href=3D"http://github.com/boltdb/bolt/bucket.go" targe=
t=3D"_blank">github.com/boltdb/bolt/bucket.go</a><br>
+@@ -99,6 +99,7 @@ func (b *Bucket) Cursor() *Cursor {<br>
+<br>
+ // Bucket retrieves a nested bucket by name.<br>
+ // Returns nil if the bucket does not exist.<br>
++// The bucket instance is only valid for the lifetime of the transaction.=
<br>
+ func (b *Bucket) Bucket(name []byte) *Bucket {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if b.buckets !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if child :=3D b.buc=
kets[string(name)]; child !=3D nil {<br>
+@@ -148,6 +149,7 @@ func (b *Bucket) openBucket(value []byte) *Bucket {<br=
>
+<br>
+ // CreateBucket creates a new bucket at the given key and returns the new=
 bucket.<br>
+ // Returns an error if the key already exists, if the bucket name is blan=
k, or if the bucket name is too long.<br>
++// The bucket instance is only valid for the lifetime of the transaction.=
<br>
+ func (b *Bucket) CreateBucket(key []byte) (*Bucket, error) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if b.tx.db =3D=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nil, ErrTxCl=
osed<br>
+@@ -192,6 +194,7 @@ func (b *Bucket) CreateBucket(key []byte) (*Bucket, er=
ror) {<br>
+<br>
+ // CreateBucketIfNotExists creates a new bucket if it doesn&#39;t already=
 exist and returns a reference to it.<br>
+ // Returns an error if the bucket name is blank, or if the bucket name is=
 too long.<br>
++// The bucket instance is only valid for the lifetime of the transaction.=
<br>
+ func (b *Bucket) CreateBucketIfNotExists(key []byte) (*Bucket, error) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0child, err :=3D b.CreateBucket(key)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if err =3D=3D ErrBucketExists {<br>
+@@ -252,6 +255,7 @@ func (b *Bucket) DeleteBucket(key []byte) error {<br>
+<br>
+ // Get retrieves the value for a key in the bucket.<br>
+ // Returns a nil value if the key does not exist or if the key is a neste=
d bucket.<br>
++// The returned value is only valid for the life of the transaction.<br>
+ func (b *Bucket) Get(key []byte) []byte {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0k, v, flags :=3D b.Cursor().seek(key)<br>
+<br>
+@@ -332,6 +336,12 @@ func (b *Bucket) NextSequence() (uint64, error) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0, ErrTxNotW=
ritable<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
++=C2=A0 =C2=A0 =C2=A0 // Materialize the root node if it hasn&#39;t been a=
lready so that the<br>
++=C2=A0 =C2=A0 =C2=A0 // bucket will be saved during commit.<br>
++=C2=A0 =C2=A0 =C2=A0 if b.rootNode =3D=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _ =3D b.node(b.root, nil=
)<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Increment and return the sequence.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0b.bucket.sequence++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return b.bucket.sequence, nil<br>
+@@ -339,7 +349,8 @@ func (b *Bucket) NextSequence() (uint64, error) {<br>
+<br>
+ // ForEach executes a function for each key/value pair in a bucket.<br>
+ // If the provided function returns an error then the iteration is stoppe=
d and<br>
+-// the error is returned to the caller.<br>
++// the error is returned to the caller. The provided function must not mo=
dify<br>
++// the bucket; this will result in undefined behavior.<br>
+ func (b *Bucket) ForEach(fn func(k, v []byte) error) error {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if b.tx.db =3D=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ErrTxClosed<=
br>
+@@ -511,8 +522,12 @@ func (b *Bucket) spill() error {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Update parent no=
de.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0var c =3D b.Cursor(=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0k, _, flags :=3D c.=
seek([]byte(name))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _assert(bytes.Equal([]by=
te(name), k), &quot;misplaced bucket header: %x -&gt; %x&quot;, []byte(name=
), k)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _assert(flags&amp;bucket=
LeafFlag !=3D 0, &quot;unexpected bucket header flag: %x&quot;, flags)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if !bytes.Equal([]byte(n=
ame), k) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 panic(fmt.Sprintf(&quot;misplaced bucket header: %x -&gt; %x&quot;, []b=
yte(name), k))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if flags&amp;bucketLeafF=
lag =3D=3D 0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 panic(fmt.Sprintf(&quot;unexpected bucket header flag: %x&quot;, flags)=
)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c.node().put([]byte=
(name), []byte(name), value, 0, bucketLeafFlag)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+@@ -528,7 +543,9 @@ func (b *Bucket) spill() error {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0b.rootNode =3D b.rootNode.root()<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Update the root node for this bucket.<br>
+-=C2=A0 =C2=A0 =C2=A0 _assert(b.rootNode.pgid &lt; b.tx.meta.pgid, &quot;p=
gid (%d) above high water mark (%d)&quot;, b.rootNode.pgid, b.tx.meta.pgid)=
<br>
++=C2=A0 =C2=A0 =C2=A0 if b.rootNode.pgid &gt;=3D b.tx.meta.pgid {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic(fmt.Sprintf(&quot;=
pgid (%d) above high water mark (%d)&quot;, b.rootNode.pgid, b.tx.meta.pgid=
))<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0b.root =3D b.rootNode.pgid<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return nil<br>
+@@ -659,7 +676,9 @@ func (b *Bucket) pageNode(id pgid) (*page, *node) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Inline buckets have a fake page embedded in =
their value so treat them<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// differently. We&#39;ll return the rootNode (=
if available) or the fake page.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if b.root =3D=3D 0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _assert(id =3D=3D 0, &qu=
ot;inline bucket non-zero page access(2): %d !=3D 0&quot;, id)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if id !=3D 0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 panic(fmt.Sprintf(&quot;inline bucket non-zero page access(2): %d !=3D =
0&quot;, id))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if b.rootNode !=3D =
nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return nil, b.rootNode<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+diff --git a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/cursor.go=
" target=3D"_blank">github.com/boltdb/bolt/cursor.go</a> b/vendor/src/<a hr=
ef=3D"http://github.com/boltdb/bolt/cursor.go" target=3D"_blank">github.com=
/boltdb/bolt/cursor.go</a><br>
+index 3bfc2f1..006c548 100644<br>
+--- a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/cursor.go" targe=
t=3D"_blank">github.com/boltdb/bolt/cursor.go</a><br>
++++ b/vendor/src/<a href=3D"http://github.com/boltdb/bolt/cursor.go" targe=
t=3D"_blank">github.com/boltdb/bolt/cursor.go</a><br>
+@@ -2,6 +2,7 @@ package bolt<br>
+<br>
+ import (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;bytes&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;fmt&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;sort&quot;<br>
+ )<br>
+<br>
+@@ -9,6 +10,8 @@ import (<br>
+ // Cursors see nested buckets with value =3D=3D nil.<br>
+ // Cursors can be obtained from a transaction and are valid as long as th=
e transaction is open.<br>
+ //<br>
++// Keys and values returned from the cursor are only valid for the life o=
f the transaction.<br>
++//<br>
+ // Changing data while traversing with a cursor may cause it to be invali=
dated<br>
+ // and return unexpected keys and/or values. You must reposition your cur=
sor<br>
+ // after mutating data.<br>
+@@ -24,6 +27,7 @@ func (c *Cursor) Bucket() *Bucket {<br>
+<br>
+ // First moves the cursor to the first item in the bucket and returns its=
 key and value.<br>
+ // If the bucket is empty then a nil key and value are returned.<br>
++// The returned key and value are only valid for the life of the transact=
ion.<br>
+ func (c *Cursor) First() (key []byte, value []byte) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_assert(c.bucket.tx.db !=3D nil, &quot;tx close=
d&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0c.stack =3D c.stack[:0]<br>
+@@ -40,6 +44,7 @@ func (c *Cursor) First() (key []byte, value []byte) {<br=
>
+<br>
+ // Last moves the cursor to the last item in the bucket and returns its k=
ey and value.<br>
+ // If the bucket is empty then a nil key and value are returned.<br>
++// The returned key and value are only valid for the life of the transact=
ion.<br>
+ func (c *Cursor) Last() (key []byte, value []byte) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_assert(c.bucket.tx.db !=3D nil, &quot;tx close=
d&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0c.stack =3D c.stack[:0]<br>
+@@ -57,6 +62,7 @@ func (c *Cursor) Last() (key []byte, value []byte) {<br>
+<br>
+ // Next moves the cursor to the next item in the bucket and returns its k=
ey and value.<br>
+ // If the cursor is at the end of the bucket then a nil key and value are=
 returned.<br>
++// The returned key and value are only valid for the life of the transact=
ion.<br>
+ func (c *Cursor) Next() (key []byte, value []byte) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_assert(c.bucket.tx.db !=3D nil, &quot;tx close=
d&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0k, v, flags :=3D c.next()<br>
+@@ -68,6 +74,7 @@ func (c *Cursor) Next() (key []byte, value []byte) {<br>
+<br>
+ // Prev moves the cursor to the previous item in the bucket and returns i=
ts key and value.<br>
+ // If the cursor is at the beginning of the bucket then a nil key and val=
ue are returned.<br>
++// The returned key and value are only valid for the life of the transact=
ion.<br>
+ func (c *Cursor) Prev() (key []byte, value []byte) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_assert(c.bucket.tx.db !=3D nil, &quot;tx close=
d&quot;)<br>
+<br>
+@@ -99,6 +106,7 @@ func (c *Cursor) Prev() (key []byte, value []byte) {<br=
>
+ // Seek moves the cursor to a given key and returns it.<br>
+ // If the key does not exist then the next key is used. If no keys<br>
+ // follow, a nil key is returned.<br>
++// The returned key and value are only valid for the life of the transact=
ion.<br>
+ func (c *Cursor) Seek(seek []byte) (key []byte, value []byte) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0k, v, flags :=3D c.seek(seek)<br>
+<br>
+@@ -228,8 +236,8 @@ func (c *Cursor) next() (key []byte, value []byte, fla=
gs uint32) {<br>
+ // search recursively performs a binary search against a given page/node =
until it finds a given key.<br>
+ func (c *Cursor) search(key []byte, pgid pgid) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0p, n :=3D c.bucket.pageNode(pgid)<br>
+-=C2=A0 =C2=A0 =C2=A0 if p !=3D nil {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _assert((p.flags&amp;(br=
anchPageFlag|leafPageFlag)) !=3D 0, &quot;invalid page type: %d: %x&quot;,
<a href=3D"http://p.id" target=3D"_blank">p.id</a>, p.flags)<br>
++=C2=A0 =C2=A0 =C2=A0 if p !=3D nil &amp;&amp; (p.flags&amp;(branchPageFla=
g|leafPageFlag)) =3D=3D 0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic(fmt.Sprintf(&quot;=
invalid page type: %d: %x&quot;, <a href=3D"http://p.id" target=3D"_blank">
p.id</a>, p.flags))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0e :=3D elemRef{page: p, node: n}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0c.stack =3D append(c.stack, e)<br>
+diff --git a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/db.go" ta=
rget=3D"_blank">github.com/boltdb/bolt/db.go</a> b/vendor/src/<a href=3D"ht=
tp://github.com/boltdb/bolt/db.go" target=3D"_blank">github.com/boltdb/bolt=
/db.go</a><br>
+index 6c45736..d39c4aa 100644<br>
+--- a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/db.go" target=3D=
"_blank">github.com/boltdb/bolt/db.go</a><br>
++++ b/vendor/src/<a href=3D"http://github.com/boltdb/bolt/db.go" target=3D=
"_blank">github.com/boltdb/bolt/db.go</a><br>
+@@ -12,9 +12,6 @@ import (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;unsafe&quot;<br>
+ )<br>
+<br>
+-// The smallest size that the mmap can be.<br>
+-const minMmapSize =3D 1 &lt;&lt; 22 // 4MB<br>
+-<br>
+ // The largest step that can be taken when remapping the mmap.<br>
+ const maxMmapStep =3D 1 &lt;&lt; 30 // 1GB<br>
+<br>
+@@ -30,6 +27,12 @@ const magic uint32 =3D 0xED0CDAED<br>
+ // must be synchronzied using the msync(2) syscall.<br>
+ const IgnoreNoSync =3D runtime.GOOS =3D=3D &quot;openbsd&quot;<br>
+<br>
++// Default values if not set in a DB instance.<br>
++const (<br>
++=C2=A0 =C2=A0 =C2=A0 DefaultMaxBatchSize=C2=A0 int =3D 1000<br>
++=C2=A0 =C2=A0 =C2=A0 DefaultMaxBatchDelay=C2=A0 =C2=A0 =C2=A0=3D 10 * tim=
e.Millisecond<br>
++)<br>
++<br>
+ // DB represents a collection of buckets persisted to a file on disk.<br>
+ // All data access is performed through transactions which can be obtaine=
d through the DB.<br>
+ // All the functions on DB will return a ErrDatabaseNotOpen if accessed b=
efore Open() is called.<br>
+@@ -52,9 +55,33 @@ type DB struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// THIS IS UNSAFE. PLEASE USE WITH CAUTION.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NoSync bool<br>
+<br>
++=C2=A0 =C2=A0 =C2=A0 // When true, skips the truncate call when growing t=
he database.<br>
++=C2=A0 =C2=A0 =C2=A0 // Setting this to true is only safe on non-ext3/ext=
4 systems.<br>
++=C2=A0 =C2=A0 =C2=A0 // Skipping truncation avoids preallocation of hard =
drive space and<br>
++=C2=A0 =C2=A0 =C2=A0 // bypasses a truncate() and fsync() syscall on rema=
pping.<br>
++=C2=A0 =C2=A0 =C2=A0 //<br>
++=C2=A0 =C2=A0 =C2=A0 // <a href=3D"https://github.com/boltdb/bolt/issues/=
284" target=3D"_blank">https://github.com/boltdb/bolt/issues/284</a><br>
++=C2=A0 =C2=A0 =C2=A0 NoGrowSync bool<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // MaxBatchSize is the maximum size of a batch. Defa=
ult value is<br>
++=C2=A0 =C2=A0 =C2=A0 // copied from DefaultMaxBatchSize in Open.<br>
++=C2=A0 =C2=A0 =C2=A0 //<br>
++=C2=A0 =C2=A0 =C2=A0 // If &lt;=3D0, disables batching.<br>
++=C2=A0 =C2=A0 =C2=A0 //<br>
++=C2=A0 =C2=A0 =C2=A0 // Do not change concurrently with calls to Batch.<b=
r>
++=C2=A0 =C2=A0 =C2=A0 MaxBatchSize int<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // MaxBatchDelay is the maximum delay before a batch=
 starts.<br>
++=C2=A0 =C2=A0 =C2=A0 // Default value is copied from DefaultMaxBatchDelay=
 in Open.<br>
++=C2=A0 =C2=A0 =C2=A0 //<br>
++=C2=A0 =C2=A0 =C2=A0 // If &lt;=3D0, effectively disables batching.<br>
++=C2=A0 =C2=A0 =C2=A0 //<br>
++=C2=A0 =C2=A0 =C2=A0 // Do not change concurrently with calls to Batch.<b=
r>
++=C2=A0 =C2=A0 =C2=A0 MaxBatchDelay time.Duration<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0path=C2=A0 =C2=A0 =C2=A0string<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file=C2=A0 =C2=A0 =C2=A0*os.File<br>
+-=C2=A0 =C2=A0 =C2=A0 dataref=C2=A0 []byte<br>
++=C2=A0 =C2=A0 =C2=A0 dataref=C2=A0 []byte // mmap&#39;ed readonly, write =
throws SEGV<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0data=C2=A0 =C2=A0 =C2=A0*[maxMapSize]byte<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0datasz=C2=A0 =C2=A0int<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0meta0=C2=A0 =C2=A0 *meta<br>
+@@ -66,6 +93,9 @@ type DB struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0freelist *freelist<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0stats=C2=A0 =C2=A0 Stats<br>
+<br>
++=C2=A0 =C2=A0 =C2=A0 batchMu sync.Mutex<br>
++=C2=A0 =C2=A0 =C2=A0 batch=C2=A0 =C2=A0*batch<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rwlock=C2=A0 =C2=A0sync.Mutex=C2=A0 =C2=A0// Al=
lows only one writer at a time.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0metalock sync.Mutex=C2=A0 =C2=A0// Protects met=
a page access.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mmaplock sync.RWMutex // Protects mmap access d=
uring remapping.<br>
+@@ -74,6 +104,10 @@ type DB struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ops struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0writeAt func(b []by=
te, off int64) (n int, err error)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // Read only mode.<br>
++=C2=A0 =C2=A0 =C2=A0 // When true, Update() and Begin(true) return ErrDat=
abaseReadOnly immediately.<br>
++=C2=A0 =C2=A0 =C2=A0 readOnly bool<br>
+ }<br>
+<br>
+ // Path returns the path to currently open database file.<br>
+@@ -101,20 +135,34 @@ func Open(path string, mode os.FileMode, options *Op=
tions) (*DB, error) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if options =3D=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options =3D Default=
Options<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 db.NoGrowSync =3D options.NoGrowSync<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // Set default values for later DB operations.<br>
++=C2=A0 =C2=A0 =C2=A0 db.MaxBatchSize =3D DefaultMaxBatchSize<br>
++=C2=A0 =C2=A0 =C2=A0 db.MaxBatchDelay =3D DefaultMaxBatchDelay<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 flag :=3D os.O_RDWR<br>
++=C2=A0 =C2=A0 =C2=A0 if options.ReadOnly {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flag =3D os.O_RDONLY<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 db.readOnly =3D true<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Open data file and separate sync handler for=
 metadata writes.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0db.path =3D path<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0var err error<br>
+-=C2=A0 =C2=A0 =C2=A0 if db.file, err =3D os.OpenFile(db.path, os.O_RDWR|o=
s.O_CREATE, mode); err !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 if db.file, err =3D os.OpenFile(db.path, flag|os.O_C=
REATE, mode); err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_ =3D db.close()<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nil, err<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 // Lock file so that other processes using Bolt cann=
ot use the database<br>
+-=C2=A0 =C2=A0 =C2=A0 // at the same time. This would cause corruption sin=
ce the two processes<br>
+-=C2=A0 =C2=A0 =C2=A0 // would write meta pages and free pages separately.=
<br>
+-=C2=A0 =C2=A0 =C2=A0 if err :=3D flock(db.file, options.Timeout); err !=
=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 // Lock file so that other processes using Bolt in r=
ead-write mode cannot<br>
++=C2=A0 =C2=A0 =C2=A0 // use the database=C2=A0 at the same time. This wou=
ld cause corruption since<br>
++=C2=A0 =C2=A0 =C2=A0 // the two processes would write meta pages and free=
 pages separately.<br>
++=C2=A0 =C2=A0 =C2=A0 // The database file is locked exclusively (only one=
 process can grab the lock)<br>
++=C2=A0 =C2=A0 =C2=A0 // if !options.ReadOnly.<br>
++=C2=A0 =C2=A0 =C2=A0 // The database file is locked using the shared lock=
 (more than one process may<br>
++=C2=A0 =C2=A0 =C2=A0 // hold a lock at the same time) otherwise (options.=
ReadOnly is set).<br>
++=C2=A0 =C2=A0 =C2=A0 if err :=3D flock(db.file, !db.readOnly, options.Tim=
eout); err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_ =3D db.close()<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nil, err<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -162,16 +210,6 @@ func (db *DB) mmap(minsz int) error {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0db.mmaplock.Lock()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0defer db.mmaplock.Unlock()<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 // Dereference all mmap references before unmapping.=
<br>
+-=C2=A0 =C2=A0 =C2=A0 if db.rwtx !=3D nil {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 db.rwtx.root.dereference=
()<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 // Unmap existing data before continuing.<br>
+-=C2=A0 =C2=A0 =C2=A0 if err :=3D db.munmap(); err !=3D nil {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0info, err :=3D db.file.Stat()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return fmt.Errorf(&=
quot;mmap stat error: %s&quot;, err)<br>
+@@ -184,7 +222,20 @@ func (db *DB) mmap(minsz int) error {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if size &lt; minsz {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D minsz<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 size =3D db.mmapSize(size)<br>
++=C2=A0 =C2=A0 =C2=A0 size, err =3D db.mmapSize(size)<br>
++=C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // Dereference all mmap references before unmapping.=
<br>
++=C2=A0 =C2=A0 =C2=A0 if db.rwtx !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 db.rwtx.root.dereference=
()<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // Unmap existing data before continuing.<br>
++=C2=A0 =C2=A0 =C2=A0 if err :=3D db.munmap(); err !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Memory-map the data file as a byte slice.<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if err :=3D mmap(db, size); err !=3D nil {<br>
+@@ -215,22 +266,40 @@ func (db *DB) munmap() error {<br>
+ }<br>
+<br>
+ // mmapSize determines the appropriate size for the mmap given the curren=
t size<br>
+-// of the database. The minimum size is 4MB and doubles until it reaches =
1GB.<br>
+-func (db *DB) mmapSize(size int) int {<br>
+-=C2=A0 =C2=A0 =C2=A0 if size &lt;=3D minMmapSize {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return minMmapSize<br>
+-=C2=A0 =C2=A0 =C2=A0 } else if size &lt; maxMmapStep {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size *=3D 2<br>
+-=C2=A0 =C2=A0 =C2=A0 } else {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size +=3D maxMmapStep<br=
>
++// of the database. The minimum size is 1MB and doubles until it reaches =
1GB.<br>
++// Returns an error if the new mmap size is greater than the max allowed.=
<br>
++func (db *DB) mmapSize(size int) (int, error) {<br>
++=C2=A0 =C2=A0 =C2=A0 // Double the size from 32KB until 1GB.<br>
++=C2=A0 =C2=A0 =C2=A0 for i :=3D uint(15); i &lt;=3D 30; i++ {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if size &lt;=3D 1&lt;&lt=
;i {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return 1 &lt;&lt; i, nil<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // Verify the requested size is not above the maximu=
m allowed.<br>
++=C2=A0 =C2=A0 =C2=A0 if size &gt; maxMapSize {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0, fmt.Errorf(&qu=
ot;mmap too large&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // If larger than 1GB then grow by 1GB at a time.<br=
>
++=C2=A0 =C2=A0 =C2=A0 sz :=3D int64(size)<br>
++=C2=A0 =C2=A0 =C2=A0 if remainder :=3D sz % int64(maxMmapStep); remainder=
 &gt; 0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sz +=3D int64(maxMmapSte=
p) - remainder<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Ensure that the mmap size is a multiple of t=
he page size.<br>
+-=C2=A0 =C2=A0 =C2=A0 if (size % db.pageSize) !=3D 0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D ((size / db.pag=
eSize) + 1) * db.pageSize<br>
++=C2=A0 =C2=A0 =C2=A0 // This should always be true since we&#39;re increm=
enting in MBs.<br>
++=C2=A0 =C2=A0 =C2=A0 pageSize :=3D int64(db.pageSize)<br>
++=C2=A0 =C2=A0 =C2=A0 if (sz % pageSize) !=3D 0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sz =3D ((sz / pageSize) =
+ 1) * pageSize<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // If we&#39;ve exceeded the max size then only grow=
 up to the max size.<br>
++=C2=A0 =C2=A0 =C2=A0 if sz &gt; maxMapSize {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sz =3D maxMapSize<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 return size<br>
++=C2=A0 =C2=A0 =C2=A0 return int(sz), nil<br>
+ }<br>
+<br>
+ // init creates a new database file and initializes its meta pages.<br>
+@@ -250,7 +319,6 @@ func (db *DB) init() error {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m.magic =3D magic<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m.version =3D versi=
on<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m.pageSize =3D uint=
32(db.pageSize)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m.version =3D version<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m.freelist =3D 2<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m.root =3D bucket{r=
oot: 3}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m.pgid =3D 4<br>
+@@ -283,8 +351,15 @@ func (db *DB) init() error {<br>
+ // Close releases all database resources.<br>
+ // All transactions must be closed before closing the database.<br>
+ func (db *DB) Close() error {<br>
++=C2=A0 =C2=A0 =C2=A0 db.rwlock.Lock()<br>
++=C2=A0 =C2=A0 =C2=A0 defer db.rwlock.Unlock()<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0db.metalock.Lock()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0defer db.metalock.Unlock()<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 db.mmaplock.RLock()<br>
++=C2=A0 =C2=A0 =C2=A0 defer db.mmaplock.RUnlock()<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return db.close()<br>
+ }<br>
+<br>
+@@ -304,8 +379,11 @@ func (db *DB) close() error {<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Close file handles.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if db.file !=3D nil {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Unlock the file.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _ =3D funlock(db.file)<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // No need to unlock rea=
d-only file.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if !db.readOnly {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // Unlock the file.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 _ =3D funlock(db.file)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Close the file d=
escriptor.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if err :=3D db.file=
.Close(); err !=3D nil {<br>
+@@ -323,6 +401,11 @@ func (db *DB) close() error {<br>
+ // will cause the calls to block and be serialized until the current writ=
e<br>
+ // transaction finishes.<br>
+ //<br>
++// Transactions should not be depedent on one another. Opening a read<br>
++// transaction and a write transaction in the same goroutine can cause th=
e<br>
++// writer to deadlock because the database periodically needs to re-mmap =
itself<br>
++// as it grows and it cannot do that while a read transaction is open.<br=
>
++//<br>
+ // IMPORTANT: You must close read-only transactions after you are finishe=
d or<br>
+ // else the database will not reclaim old pages.<br>
+ func (db *DB) Begin(writable bool) (*Tx, error) {<br>
+@@ -371,6 +454,11 @@ func (db *DB) beginTx() (*Tx, error) {<br>
+ }<br>
+<br>
+ func (db *DB) beginRWTx() (*Tx, error) {<br>
++=C2=A0 =C2=A0 =C2=A0 // If the database was opened with Options.ReadOnly,=
 return an error.<br>
++=C2=A0 =C2=A0 =C2=A0 if db.readOnly {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return nil, ErrDatabaseR=
eadOnly<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Obtain writer lock. This is released by the =
transaction when it closes.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// This enforces only one writer transaction at=
 a time.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0db.rwlock.Lock()<br>
+@@ -501,6 +589,12 @@ func (db *DB) View(fn func(*Tx) error) error {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return nil<br>
+ }<br>
+<br>
++// Sync executes fdatasync() against the database file handle.<br>
++//<br>
++// This is not necessary under normal operation, however, if you use NoSy=
nc<br>
++// then it allows you to force the database file to sync against the disk=
.<br>
++func (db *DB) Sync() error { return fdatasync(db) }<br>
++<br>
+ // Stats retrieves ongoing performance stats for the database.<br>
+ // This is only updated when a transaction closes.<br>
+ func (db *DB) Stats() Stats {<br>
+@@ -561,18 +655,30 @@ func (db *DB) allocate(count int) (*page, error) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return p, nil<br>
+ }<br>
+<br>
++func (db *DB) IsReadOnly() bool {<br>
++=C2=A0 =C2=A0 =C2=A0 return db.readOnly<br>
++}<br>
++<br>
+ // Options represents the options that can be set when opening a database=
.<br>
+ type Options struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Timeout is the amount of time to wait to obt=
ain a file lock.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// When set to zero it will wait indefinitely. =
This option is only<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// available on Darwin and Linux.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Timeout time.Duration<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // Sets the DB.NoGrowSync flag before memory mapping=
 the file.<br>
++=C2=A0 =C2=A0 =C2=A0 NoGrowSync bool<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // Open database in read-only mode. Uses flock(..., =
LOCK_SH |LOCK_NB) to<br>
++=C2=A0 =C2=A0 =C2=A0 // grab a shared lock (UNIX).<br>
++=C2=A0 =C2=A0 =C2=A0 ReadOnly bool<br>
+ }<br>
+<br>
+ // DefaultOptions represent the options used if nil options are passed in=
to Open().<br>
+ // No timeout is used which will cause Bolt to wait indefinitely for a lo=
ck.<br>
+ var DefaultOptions =3D &amp;Options{<br>
+-=C2=A0 =C2=A0 =C2=A0 Timeout: 0,<br>
++=C2=A0 =C2=A0 =C2=A0 Timeout:=C2=A0 =C2=A0 0,<br>
++=C2=A0 =C2=A0 =C2=A0 NoGrowSync: false,<br>
+ }<br>
+<br>
+ // Stats represents statistics about the database.<br>
+@@ -647,9 +753,11 @@ func (m *meta) copy(dest *meta) {<br>
+<br>
+ // write writes the meta onto a page.<br>
+ func (m *meta) write(p *page) {<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 _assert(m.root.root &lt; m.pgid, &quot;root bucket p=
gid (%d) above high water mark (%d)&quot;, m.root.root, m.pgid)<br>
+-=C2=A0 =C2=A0 =C2=A0 _assert(m.freelist &lt; m.pgid, &quot;freelist pgid =
(%d) above high water mark (%d)&quot;, m.freelist, m.pgid)<br>
++=C2=A0 =C2=A0 =C2=A0 if m.root.root &gt;=3D m.pgid {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic(fmt.Sprintf(&quot;=
root bucket pgid (%d) above high water mark (%d)&quot;, m.root.root, m.pgid=
))<br>
++=C2=A0 =C2=A0 =C2=A0 } else if m.freelist &gt;=3D m.pgid {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic(fmt.Sprintf(&quot;=
freelist pgid (%d) above high water mark (%d)&quot;, m.freelist, m.pgid))<b=
r>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Page id is either going to be 0 or 1 which w=
e can determine by the transaction ID.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://p.id" target=3D"_blank">p.id<=
/a> =3D pgid(m.txid % 2)<br>
+@@ -675,13 +783,8 @@ func _assert(condition bool, msg string, v ...interfa=
ce{}) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ }<br>
+<br>
+-func warn(v ...interface{}) {<br>
+-=C2=A0 =C2=A0 =C2=A0 fmt.Fprintln(os.Stderr, v...)<br>
+-}<br>
+-<br>
+-func warnf(msg string, v ...interface{}) {<br>
+-=C2=A0 =C2=A0 =C2=A0 fmt.Fprintf(os.Stderr, msg+&quot;\n&quot;, v...)<br>
+-}<br>
++func warn(v ...interface{})=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 { fmt.Fprintln(os.Stderr, v...) }<br>
++func warnf(msg string, v ...interface{}) { fmt.Fprintf(os.Stderr, msg+&qu=
ot;\n&quot;, v...) }<br>
+<br>
+ func printstack() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0stack :=3D strings.Join(strings.Split(string(de=
bug.Stack()), &quot;\n&quot;)[2:], &quot;\n&quot;)<br>
+diff --git a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/errors.go=
" target=3D"_blank">github.com/boltdb/bolt/errors.go</a> b/vendor/src/<a hr=
ef=3D"http://github.com/boltdb/bolt/errors.go" target=3D"_blank">github.com=
/boltdb/bolt/errors.go</a><br>
+index aa504f1..6883786 100644<br>
+--- a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/errors.go" targe=
t=3D"_blank">github.com/boltdb/bolt/errors.go</a><br>
++++ b/vendor/src/<a href=3D"http://github.com/boltdb/bolt/errors.go" targe=
t=3D"_blank">github.com/boltdb/bolt/errors.go</a><br>
+@@ -36,6 +36,10 @@ var (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// ErrTxClosed is returned when committing or r=
olling back a transaction<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// that has already been committed or rolled ba=
ck.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ErrTxClosed =3D errors.New(&quot;tx closed&quot=
;)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // ErrDatabaseReadOnly is returned when a mutating t=
ransaction is started on a<br>
++=C2=A0 =C2=A0 =C2=A0 // read-only database.<br>
++=C2=A0 =C2=A0 =C2=A0 ErrDatabaseReadOnly =3D errors.New(&quot;database is=
 in read-only mode&quot;)<br>
+ )<br>
+<br>
+ // These errors can occur when putting or deleting a value or a bucket.<b=
r>
+diff --git a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/freelist.=
go" target=3D"_blank">github.com/boltdb/bolt/freelist.go</a> b/vendor/src/<=
a href=3D"http://github.com/boltdb/bolt/freelist.go" target=3D"_blank">gith=
ub.com/boltdb/bolt/freelist.go</a><br>
+index 150e3e6..0161948 100644<br>
+--- a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/freelist.go" tar=
get=3D"_blank">github.com/boltdb/bolt/freelist.go</a><br>
++++ b/vendor/src/<a href=3D"http://github.com/boltdb/bolt/freelist.go" tar=
get=3D"_blank">github.com/boltdb/bolt/freelist.go</a><br>
+@@ -1,6 +1,7 @@<br>
+ package bolt<br>
+<br>
+ import (<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;fmt&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;sort&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;unsafe&quot;<br>
+ )<br>
+@@ -47,15 +48,14 @@ func (f *freelist) pending_count() int {<br>
+<br>
+ // all returns a list of all free ids and all pending ids in one sorted l=
ist.<br>
+ func (f *freelist) all() []pgid {<br>
+-=C2=A0 =C2=A0 =C2=A0 ids :=3D make([]pgid, len(f.ids))<br>
+-=C2=A0 =C2=A0 =C2=A0 copy(ids, f.ids)<br>
++=C2=A0 =C2=A0 =C2=A0 m :=3D make(pgids, 0)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for _, list :=3D range f.pending {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ids =3D append(ids, list=
...)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m =3D append(m, list...)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 sort.Sort(pgids(ids))<br>
+-=C2=A0 =C2=A0 =C2=A0 return ids<br>
++=C2=A0 =C2=A0 =C2=A0 sort.Sort(m)<br>
++=C2=A0 =C2=A0 =C2=A0 return pgids(f.ids).merge(m)<br>
+ }<br>
+<br>
+ // allocate returns the starting page id of a contiguous list of pages of=
 a given size.<br>
+@@ -67,7 +67,9 @@ func (f *freelist) allocate(n int) pgid {<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0var initial, previd pgid<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for i, id :=3D range f.ids {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _assert(id &gt; 1, &quot=
;invalid page allocation: %d&quot;, id)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if id &lt;=3D 1 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 panic(fmt.Sprintf(&quot;invalid page allocation: %d&quot;, id))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Reset initial pa=
ge if this is not contiguous.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if previd =3D=3D 0 =
|| id-previd !=3D 1 {<br>
+@@ -103,13 +105,17 @@ func (f *freelist) allocate(n int) pgid {<br>
+ // free releases a page and its overflow for a given transaction id.<br>
+ // If the page is already free then a panic will occur.<br>
+ func (f *freelist) free(txid txid, p *page) {<br>
+-=C2=A0 =C2=A0 =C2=A0 _assert(<a href=3D"http://p.id" target=3D"_blank">p.=
id</a> &gt; 1, &quot;cannot free page 0 or 1: %d&quot;,
<a href=3D"http://p.id" target=3D"_blank">p.id</a>)<br>
++=C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://p.id" target=3D"_blank">p.id</a=
> &lt;=3D 1 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic(fmt.Sprintf(&quot;=
cannot free page 0 or 1: %d&quot;, <a href=3D"http://p.id" target=3D"_blank=
">
p.id</a>))<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Free page and all its overflow pages.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0var ids =3D f.pending[txid]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for id :=3D <a href=3D"http://p.id" target=3D"_=
blank">p.id</a>; id &lt;=3D <a href=3D"http://p.id" target=3D"_blank">
p.id</a>+pgid(p.overflow); id++ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Verify that page=
 is not already free.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _assert(!f.cache[id], &q=
uot;page %d already freed&quot;, id)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if f.cache[id] {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 panic(fmt.Sprintf(&quot;page %d already freed&quot;, id))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Add to the freel=
ist and cache.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ids =3D append(ids,=
 id)<br>
+@@ -120,15 +126,17 @@ func (f *freelist) free(txid txid, p *page) {<br>
+<br>
+ // release moves all page ids for a transaction id (or older) to the free=
list.<br>
+ func (f *freelist) release(txid txid) {<br>
++=C2=A0 =C2=A0 =C2=A0 m :=3D make(pgids, 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for tid, ids :=3D range f.pending {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if tid &lt;=3D txid=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0// Move transaction&#39;s pending pages to the available freelist=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0// Don&#39;t remove from the cache since the page is still free.<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 f.ids =3D append(f.ids, ids...)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 m =3D append(m, ids...)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0delete(f.pending, tid)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 sort.Sort(pgids(f.ids))<br>
++=C2=A0 =C2=A0 =C2=A0 sort.Sort(m)<br>
++=C2=A0 =C2=A0 =C2=A0 f.ids =3D pgids(f.ids).merge(m)<br>
+ }<br>
+<br>
+ // rollback removes the pages from a given pending tx.<br>
+diff --git a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/node.go" =
target=3D"_blank">github.com/boltdb/bolt/node.go</a> b/vendor/src/<a href=
=3D"http://github.com/boltdb/bolt/node.go" target=3D"_blank">github.com/bol=
tdb/bolt/node.go</a><br>
+index c204c39..c9fb21c 100644<br>
+--- a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/node.go" target=
=3D"_blank">github.com/boltdb/bolt/node.go</a><br>
++++ b/vendor/src/<a href=3D"http://github.com/boltdb/bolt/node.go" target=
=3D"_blank">github.com/boltdb/bolt/node.go</a><br>
+@@ -2,6 +2,7 @@ package bolt<br>
+<br>
+ import (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;bytes&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;fmt&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;sort&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;unsafe&quot;<br>
+ )<br>
+@@ -70,7 +71,9 @@ func (n *node) pageElementSize() int {<br>
+<br>
+ // childAt returns the child node at a given index.<br>
+ func (n *node) childAt(index int) *node {<br>
+-=C2=A0 =C2=A0 =C2=A0 _assert(!n.isLeaf, &quot;invalid childAt(%d) on a le=
af node&quot;, index)<br>
++=C2=A0 =C2=A0 =C2=A0 if n.isLeaf {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic(fmt.Sprintf(&quot;=
invalid childAt(%d) on a leaf node&quot;, index))<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return n.bucket.node(n.inodes[index].pgid, n)<b=
r>
+ }<br>
+<br>
+@@ -111,9 +114,13 @@ func (n *node) prevSibling() *node {<br>
+<br>
+ // put inserts a key/value.<br>
+ func (n *node) put(oldKey, newKey, value []byte, pgid pgid, flags uint32)=
 {<br>
+-=C2=A0 =C2=A0 =C2=A0 _assert(pgid &lt; n.bucket.tx.meta.pgid, &quot;pgid =
(%d) above high water mark (%d)&quot;, pgid, n.bucket.tx.meta.pgid)<br>
+-=C2=A0 =C2=A0 =C2=A0 _assert(len(oldKey) &gt; 0, &quot;put: zero-length o=
ld key&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 _assert(len(newKey) &gt; 0, &quot;put: zero-length n=
ew key&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 if pgid &gt;=3D n.bucket.tx.meta.pgid {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic(fmt.Sprintf(&quot;=
pgid (%d) above high water mark (%d)&quot;, pgid, n.bucket.tx.meta.pgid))<b=
r>
++=C2=A0 =C2=A0 =C2=A0 } else if len(oldKey) &lt;=3D 0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic(&quot;put: zero-le=
ngth old key&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 } else if len(newKey) &lt;=3D 0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic(&quot;put: zero-le=
ngth new key&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Find insertion index.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0index :=3D sort.Search(len(n.inodes), func(i in=
t) bool { return bytes.Compare(n.inodes[i].key, oldKey) !=3D -1 })<br>
+@@ -189,7 +196,9 @@ func (n *node) write(p *page) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p.flags |=3D branch=
PageFlag<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 _assert(len(n.inodes) &lt; 0xFFFF, &quot;inode overf=
low: %d (pgid=3D%d)&quot;, len(n.inodes),
<a href=3D"http://p.id" target=3D"_blank">p.id</a>)<br>
++=C2=A0 =C2=A0 =C2=A0 if len(n.inodes) &gt;=3D 0xFFFF {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic(fmt.Sprintf(&quot;=
inode overflow: %d (pgid=3D%d)&quot;, len(n.inodes), <a href=3D"http://p.id=
" target=3D"_blank">
p.id</a>))<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0p.count =3D uint16(len(n.inodes))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Loop over each item and write it to the page=
.<br>
+@@ -212,11 +221,20 @@ func (n *node) write(p *page) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0_assert(elem.pgid !=3D <a href=3D"http://p.id" target=3D"_blank">
p.id</a>, &quot;write: circular dependency occurred&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // If the length of key+=
value is larger than the max allocation size<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // then we need to reall=
ocate the byte array pointer.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // See: <a href=3D"https=
://github.com/boltdb/bolt/pull/335" target=3D"_blank">
https://github.com/boltdb/bolt/pull/335</a><br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 klen, vlen :=3D len(item=
.key), len(item.value)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(b) &lt; klen+vlen=
 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 b =3D (*[maxAllocSize]byte)(unsafe.Pointer(&amp;b[0]))[:]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Write data for t=
he element to the end of the page.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0copy(b[0:], item.ke=
y)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b =3D b[len(item.key):]<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b =3D b[klen:]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0copy(b[0:], item.va=
lue)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b =3D b[len(item.value):=
]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b =3D b[vlen:]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// DEBUG ONLY: n.dump()<br>
+@@ -348,7 +366,9 @@ func (n *node) spill() error {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Write the node.<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _assert(<a href=3D"http:=
//p.id" target=3D"_blank">p.id</a> &lt; tx.meta.pgid, &quot;pgid (%d) above=
 high water mark (%d)&quot;,
<a href=3D"http://p.id" target=3D"_blank">p.id</a>, tx.meta.pgid)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://p.i=
d" target=3D"_blank">p.id</a> &gt;=3D tx.meta.pgid {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 panic(fmt.Sprintf(&quot;pgid (%d) above high water mark (%d)&quot;,
<a href=3D"http://p.id" target=3D"_blank">p.id</a>, tx.meta.pgid))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0node.pgid =3D <a hr=
ef=3D"http://p.id" target=3D"_blank">p.id</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0node.write(p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0node.spilled =3D tr=
ue<br>
+diff --git a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/page.go" =
target=3D"_blank">github.com/boltdb/bolt/page.go</a> b/vendor/src/<a href=
=3D"http://github.com/boltdb/bolt/page.go" target=3D"_blank">github.com/bol=
tdb/bolt/page.go</a><br>
+index b3dc473..818aa1b 100644<br>
+--- a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/page.go" target=
=3D"_blank">github.com/boltdb/bolt/page.go</a><br>
++++ b/vendor/src/<a href=3D"http://github.com/boltdb/bolt/page.go" target=
=3D"_blank">github.com/boltdb/bolt/page.go</a><br>
+@@ -3,12 +3,12 @@ package bolt<br>
+ import (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;fmt&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;os&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;sort&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;unsafe&quot;<br>
+ )<br>
+<br>
+ const pageHeaderSize =3D int(unsafe.Offsetof(((*page)(nil)).ptr))<br>
+<br>
+-const maxAllocSize =3D 0xFFFFFFF<br>
+ const minKeysPerPage =3D 2<br>
+<br>
+ const branchPageElementSize =3D int(unsafe.Sizeof(branchPageElement{}))<b=
r>
+@@ -97,7 +97,7 @@ type branchPageElement struct {<br>
+ // key returns a byte slice of the node key.<br>
+ func (n *branchPageElement) key() []byte {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0buf :=3D (*[maxAllocSize]byte)(unsafe.Pointer(n=
))<br>
+-=C2=A0 =C2=A0 =C2=A0 return buf[n.pos : n.pos+n.ksize]<br>
++=C2=A0 =C2=A0 =C2=A0 return (*[maxAllocSize]byte)(unsafe.Pointer(&amp;buf=
[n.pos]))[:n.ksize]<br>
+ }<br>
+<br>
+ // leafPageElement represents a node on a leaf page.<br>
+@@ -111,13 +111,13 @@ type leafPageElement struct {<br>
+ // key returns a byte slice of the node key.<br>
+ func (n *leafPageElement) key() []byte {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0buf :=3D (*[maxAllocSize]byte)(unsafe.Pointer(n=
))<br>
+-=C2=A0 =C2=A0 =C2=A0 return buf[n.pos : n.pos+n.ksize]<br>
++=C2=A0 =C2=A0 =C2=A0 return (*[maxAllocSize]byte)(unsafe.Pointer(&amp;buf=
[n.pos]))[:n.ksize]<br>
+ }<br>
+<br>
+ // value returns a byte slice of the node value.<br>
+ func (n *leafPageElement) value() []byte {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0buf :=3D (*[maxAllocSize]byte)(unsafe.Pointer(n=
))<br>
+-=C2=A0 =C2=A0 =C2=A0 return buf[n.pos+n.ksize : n.pos+n.ksize+n.vsize]<br=
>
++=C2=A0 =C2=A0 =C2=A0 return (*[maxAllocSize]byte)(unsafe.Pointer(&amp;buf=
[n.pos+n.ksize]))[:n.vsize]<br>
+ }<br>
+<br>
+ // PageInfo represents human readable information about a page.<br>
+@@ -133,3 +133,40 @@ type pgids []pgid<br>
+ func (s pgids) Len() int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ return=
 len(s) }<br>
+ func (s pgids) Swap(i, j int)=C2=A0 =C2=A0 =C2=A0 { s[i], s[j] =3D s[j], =
s[i] }<br>
+ func (s pgids) Less(i, j int) bool { return s[i] &lt; s[j] }<br>
++<br>
++// merge returns the sorted union of a and b.<br>
++func (a pgids) merge(b pgids) pgids {<br>
++=C2=A0 =C2=A0 =C2=A0 // Return the opposite slice if one is nil.<br>
++=C2=A0 =C2=A0 =C2=A0 if len(a) =3D=3D 0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return b<br>
++=C2=A0 =C2=A0 =C2=A0 } else if len(b) =3D=3D 0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return a<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // Create a list to hold all elements from both list=
s.<br>
++=C2=A0 =C2=A0 =C2=A0 merged :=3D make(pgids, 0, len(a)+len(b))<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // Assign lead to the slice with a lower starting va=
lue, follow to the higher value.<br>
++=C2=A0 =C2=A0 =C2=A0 lead, follow :=3D a, b<br>
++=C2=A0 =C2=A0 =C2=A0 if b[0] &lt; a[0] {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lead, follow =3D b, a<br=
>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // Continue while there are elements in the lead.<br=
>
++=C2=A0 =C2=A0 =C2=A0 for len(lead) &gt; 0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Merge largest prefix =
of lead that is ahead of follow[0].<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n :=3D sort.Search(len(l=
ead), func(i int) bool { return lead[i] &gt; follow[0] })<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 merged =3D append(merged=
, lead[:n]...)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if n &gt;=3D len(lead) {=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Swap lead and follow.=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lead, follow =3D follow,=
 lead[n:]<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // Append what&#39;s left in follow.<br>
++=C2=A0 =C2=A0 =C2=A0 merged =3D append(merged, follow...)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 return merged<br>
++}<br>
+diff --git a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/tx.go" ta=
rget=3D"_blank">github.com/boltdb/bolt/tx.go</a> b/vendor/src/<a href=3D"ht=
tp://github.com/boltdb/bolt/tx.go" target=3D"_blank">github.com/boltdb/bolt=
/tx.go</a><br>
+index c041d73..fe6c287 100644<br>
+--- a/vendor/src/<a href=3D"http://github.com/boltdb/bolt/tx.go" target=3D=
"_blank">github.com/boltdb/bolt/tx.go</a><br>
++++ b/vendor/src/<a href=3D"http://github.com/boltdb/bolt/tx.go" target=3D=
"_blank">github.com/boltdb/bolt/tx.go</a><br>
+@@ -87,18 +87,21 @@ func (tx *Tx) Stats() TxStats {<br>
+<br>
+ // Bucket retrieves a bucket by name.<br>
+ // Returns nil if the bucket does not exist.<br>
++// The bucket instance is only valid for the lifetime of the transaction.=
<br>
+ func (tx *Tx) Bucket(name []byte) *Bucket {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return tx.root.Bucket(name)<br>
+ }<br>
+<br>
+ // CreateBucket creates a new bucket.<br>
+ // Returns an error if the bucket already exists, if the bucket name is b=
lank, or if the bucket name is too long.<br>
++// The bucket instance is only valid for the lifetime of the transaction.=
<br>
+ func (tx *Tx) CreateBucket(name []byte) (*Bucket, error) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return tx.root.CreateBucket(name)<br>
+ }<br>
+<br>
+ // CreateBucketIfNotExists creates a new bucket if it doesn&#39;t already=
 exist.<br>
+ // Returns an error if the bucket name is blank, or if the bucket name is=
 too long.<br>
++// The bucket instance is only valid for the lifetime of the transaction.=
<br>
+ func (tx *Tx) CreateBucketIfNotExists(name []byte) (*Bucket, error) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return tx.root.CreateBucketIfNotExists(name)<br=
>
+ }<br>
+@@ -127,7 +130,8 @@ func (tx *Tx) OnCommit(fn func()) {<br>
+ }<br>
+<br>
+ // Commit writes all changes to disk and updates the meta page.<br>
+-// Returns an error if a disk write error occurs.<br>
++// Returns an error if a disk write error occurs, or if Commit is<br>
++// called on a read-only transaction.<br>
+ func (tx *Tx) Commit() error {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_assert(!tx.managed, &quot;managed tx commit no=
t allowed&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if tx.db =3D=3D nil {<br>
+@@ -203,7 +207,8 @@ func (tx *Tx) Commit() error {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return nil<br>
+ }<br>
+<br>
+-// Rollback closes the transaction and ignores all previous updates.<br>
++// Rollback closes the transaction and ignores all previous updates. Read=
-only<br>
++// transactions must be rolled back and not committed.<br>
+ func (tx *Tx) Rollback() error {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_assert(!tx.managed, &quot;managed tx rollback =
not allowed&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if tx.db =3D=3D nil {<br>
+@@ -234,7 +239,8 @@ func (tx *Tx) close() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0var freelistPending=
N =3D tx.db.freelist.pending_count()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0var freelistAlloc =
=3D tx.db.freelist.size()<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Remove writer lock.<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Remove transaction re=
f &amp; writer lock.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tx.db.rwtx =3D nil<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tx.db.rwlock.Unlock=
()<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Merge statistics=
.<br>
+@@ -248,41 +254,51 @@ func (tx *Tx) close() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tx.db.removeTx(tx)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // Clear all references.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tx.db =3D nil<br>
++=C2=A0 =C2=A0 =C2=A0 tx.meta =3D nil<br>
++=C2=A0 =C2=A0 =C2=A0 tx.root =3D Bucket{tx: tx}<br>
++=C2=A0 =C2=A0 =C2=A0 tx.pages =3D nil<br>
+ }<br>
+<br>
+ // Copy writes the entire database to a writer.<br>
+-// A reader transaction is maintained during the copy so it is safe to co=
ntinue<br>
+-// using the database while a copy is in progress.<br>
+-// Copy will write exactly tx.Size() bytes into the writer.<br>
++// This function exists for backwards compatibility. Use WriteTo() in<br>
+ func (tx *Tx) Copy(w io.Writer) error {<br>
+-=C2=A0 =C2=A0 =C2=A0 var f *os.File<br>
+-=C2=A0 =C2=A0 =C2=A0 var err error<br>
++=C2=A0 =C2=A0 =C2=A0 _, err :=3D tx.WriteTo(w)<br>
++=C2=A0 =C2=A0 =C2=A0 return err<br>
++}<br>
+<br>
++// WriteTo writes the entire database to a writer.<br>
++// If err =3D=3D nil then exactly tx.Size() bytes will be written into th=
e writer.<br>
++func (tx *Tx) WriteTo(w io.Writer) (n int64, err error) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Attempt to open reader directly.<br>
++=C2=A0 =C2=A0 =C2=A0 var f *os.File<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if f, err =3D os.OpenFile(tx.db.path, os.O_RDON=
LY|odirect, 0); err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Fallback to a re=
gular open if that doesn&#39;t work.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if f, err =3D os.Op=
enFile(tx.db.path, os.O_RDONLY, 0); err !=3D nil {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return err<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return 0, err<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Copy the meta pages.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tx.db.metalock.Lock()<br>
+-=C2=A0 =C2=A0 =C2=A0 _, err =3D io.CopyN(w, f, int64(tx.db.pageSize*2))<b=
r>
++=C2=A0 =C2=A0 =C2=A0 n, err =3D io.CopyN(w, f, int64(tx.db.pageSize*2))<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tx.db.metalock.Unlock()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_ =3D f.Close()<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return fmt.Errorf(&quot;=
meta copy: %s&quot;, err)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return n, fmt.Errorf(&qu=
ot;meta copy: %s&quot;, err)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Copy data pages.<br>
+-=C2=A0 =C2=A0 =C2=A0 if _, err :=3D io.CopyN(w, f, tx.Size()-int64(tx.db.=
pageSize*2)); err !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 wn, err :=3D io.CopyN(w, f, tx.Size()-int64(tx.db.pa=
geSize*2))<br>
++=C2=A0 =C2=A0 =C2=A0 n +=3D wn<br>
++=C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_ =3D f.Close()<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return n, err<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 return f.Close()<br>
++=C2=A0 =C2=A0 =C2=A0 return n, f.Close()<br>
+ }<br>
+<br>
+ // CopyFile copies the entire database to file at the given path.<br>
+@@ -416,15 +432,39 @@ func (tx *Tx) write() error {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Write pages to disk in order.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for _, p :=3D range pages {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size :=3D (int(p.ov=
erflow) + 1) * tx.db.pageSize<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf :=3D (*[maxAllocSize=
]byte)(unsafe.Pointer(p))[:size]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset :=3D int64(<=
a href=3D"http://p.id" target=3D"_blank">p.id</a>) * int64(tx.db.pageSize)<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if _, err :=3D tx.db.ops=
.writeAt(buf, offset); err !=3D nil {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return err<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Update statistics.<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tx.stats.Write++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Write out page in &qu=
ot;max allocation&quot; sized chunks.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ptr :=3D (*[maxAllocSize=
]byte)(unsafe.Pointer(p))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // Limit our write to our max allocation size.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 sz :=3D size<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if sz &gt; maxAllocSize-1 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sz =3D maxAllocSize - 1<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // Write chunk to disk.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 buf :=3D ptr[:sz]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if _, err :=3D tx.db.ops.writeAt(buf, offset); err !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // Update statistics.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tx.stats.Write++<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // Exit inner for loop if we&#39;ve written all the chunks.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 size -=3D sz<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if size =3D=3D 0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // Otherwise move offset forward and move pointer to next chunk.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 offset +=3D int64(sz)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ptr =3D (*[maxAllocSize]byte)(unsafe.Pointer(&amp;ptr[sz]))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // Ignore file sync if flag is set on DB.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if !tx.db.NoSync || IgnoreNoSync {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if err :=3D fdatasy=
nc(tx.db); err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return err<br>
+--<br>
+1.9.1<br>
+<br>
diff --git a/recipes-containers/docker/files/disable_sha1sum_startup.patch =
b/recipes-containers/docker/files/disable_sha1sum_startup.patch<br>
index 580ca23..cafd83d 100644<br>
--- a/recipes-containers/docker/files/disable_sha1sum_startup.patch<br>
+++ b/recipes-containers/docker/files/disable_sha1sum_startup.patch<br>
@@ -12,20 +12,23 @@ of the binary instead.<br>
<br>
=C2=A0Signed-off-by: Amy Fong &lt;<a href=3D"mailto:amy.fong@windriver.com"=
 target=3D"_blank">amy.fong@windriver.com</a>&gt;<br>
=C2=A0---<br>
- utils/utils.go |=C2=A0 =C2=A017 +----------------<br>
- 1 file changed, 1 insertion(+), 16 deletions(-)<br>
+ utils/utils.go | 18 +-----------------<br>
+ 1 file changed, 1 insertion(+), 17 deletions(-)<br>
<br>
+diff --git a/utils/utils.go b/utils/utils.go<br>
+index a17ab9d..3fc514a 100644<br>
=C2=A0--- a/utils/utils.go<br>
=C2=A0+++ b/utils/utils.go<br>
-@@ -3,7 +3,6 @@<br>
+@@ -2,8 +2,6 @@ package utils<br>
+<br>
=C2=A0 import (<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;bufio&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;bytes&quot;<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 &quot;crypto/sha1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;crypto/sha256&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;encoding/hex&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 &quot;encoding/hex&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;fmt&quot;<br>
-@@ -75,20 +74,6 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;io&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;io/ioutil&quot;<br>
+@@ -42,20 +40,6 @@ func SelfPath() string {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return path<br>
=C2=A0 }<br>
<br>
@@ -46,7 +49,7 @@ Signed-off-by: Amy Fong &lt;<a href=3D"mailto:amy.fong@wi=
ndriver.com" target=3D"_blank">amy.fong@windriver.com</a>&gt;<br>
=C2=A0 func isValidDockerInitPath(target string, selfPath string) bool { //=
 target and selfPath should be absolute (InitPath and SelfPath already do t=
his)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if target =3D=3D &quot;&quot; {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false<br>
-@@ -110,7 +95,7 @@<br>
+@@ -77,7 +61,7 @@ func isValidDockerInitPath(target string, selfPath strin=
g) bool { // target and<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return os.SameFile(=
targetFileInfo, selfPathFileInfo)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
@@ -54,4 +57,4 @@ Signed-off-by: Amy Fong &lt;<a href=3D"mailto:amy.fong@wi=
ndriver.com" target=3D"_blank">amy.fong@windriver.com</a>&gt;<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 return true<br>
=C2=A0 }<br>
<br>
- // Figure out the path of our dockerinit (which may be SelfPath())<br>
+ // DockerInitPath figures out the path of our dockerinit (which may be Se=
lfPath())<br>
--<br>
1.8.3.2<u></u><u></u></p>
</div>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal"><br>
<br clear=3D"all">
<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<span class=3D"HOEnZb"><font color=3D"#=
888888"><u></u></font></span></p><span class=3D"HOEnZb"><font color=3D"#888=
888">
</font></span></div><span class=3D"HOEnZb"><font color=3D"#888888">
<p class=3D"MsoNormal">-- <u></u><u></u></p>
<div>
<p class=3D"MsoNormal">&quot;Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end&quot;<u></u><u></u></p>
</div>
</font></span></div><span class=3D"HOEnZb"><font color=3D"#888888">
</font></span></div><span class=3D"HOEnZb"><font color=3D"#888888">
</font></span></div><span class=3D"HOEnZb"><font color=3D"#888888">
</font></span></div><span class=3D"HOEnZb"><font color=3D"#888888">

</font></span></blockquote></div><span class=3D"HOEnZb"><font color=3D"#888=
888"><br><br clear=3D"all"><div><br></div>-- <br><div>&quot;Thou shalt not =
follow the NULL pointer, for chaos and madness await thee at its end&quot;<=
/div>
</font></span></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div>

--001a113d706219b7eb0530f0b278--
