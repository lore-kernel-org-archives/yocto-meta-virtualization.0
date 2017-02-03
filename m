Return-Path: <apetroaiecristeamihaela@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 47DE3E004A0; Fri,  3 Feb 2017 09:53:23 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (apetroaiecristeamihaela[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.68 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.68 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6C777E003E1
	for <meta-virtualization@yoctoproject.org>;
	Fri,  3 Feb 2017 09:53:21 -0800 (PST)
Received: by mail-wm0-f68.google.com with SMTP id v77so5889396wmv.0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 03 Feb 2017 09:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:content-transfer-encoding:mime-version:subject:message-id:date
	:to; bh=N6goP2d/RKiu+2E4a1nFOk+bdOUPuEnUZR4hrPs8Ut8=;
	b=tnuD8ZsPYWDX3QpDBrBkykKag4aw9GU6ZAJOvr9sySdALrlcgW169nVo2boyIvezDS
	U9r6UQKR6t5pBJHks/UOXmbn+w4rI+leSD7xm5snt0z/PpxRliT4GTU7H5B3pPEyK5pb
	1IManNMFn/sLWCSbSRCuDV/ircrvnKBHoBlFIY8OUgG2L6OaNCIrRaZfpMo6IOCB/P2N
	6Q+rs5YOwpuTGK7PvvBnuQoTW9hxBMKWoanNoHHf+NPZLY+zD3nkT48ngxYWuMDWdhyx
	xPw/bxRzt3Fp9GH0UU+XBd1S3XZUVi4LtIEmImlZT5+NnNtCP+MF3s5pqzlvVJGEdQEQ
	+epQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:message-id:date:to;
	bh=N6goP2d/RKiu+2E4a1nFOk+bdOUPuEnUZR4hrPs8Ut8=;
	b=s7TPa4WPT7juGc/aeYpdPpV9GjWtFje4S0u3Tc5qew+ghtLyrLgc0BLZbXYy9bppLJ
	fDwld3uq8/p0AVaEPm8xI0AACn+EEbiRtKgCYOSOsZmFxMbw1rPXCbM+PC8tvtrM6pKl
	81cNCKVTNzbuE8SaR7flk9LvHnot1kNrWNqJbo2fujNuHlOMssh3XgCEcS7Y+6ncbLan
	lFeZJc8syV+7vfewm0/PcrUkZbsb58TLfCbh85F6op8mIBMehaoIsxYcxCbZOAii/tnH
	7e6qOMMBgedSkUeJa3PBe/6S3Sdj7x2nN7WwXbMdTRzK9B1aN4HfvSAEesN+hXVy7kSn
	m8gA==
X-Gm-Message-State: AMke39ly0863gsSKrmV+2YLbeWmCT8Tjzu7Ef2NBiz8uOekoijjC5Jy+2s9n7ov5eBjNTg==
X-Received: by 10.28.220.135 with SMTP id t129mr2728272wmg.38.1486144400812;
	Fri, 03 Feb 2017 09:53:20 -0800 (PST)
Received: from uos-147711.clients.soton.ac.uk (boldrewood.soton.ac.uk.
	[152.78.0.15]) by smtp.gmail.com with ESMTPSA id
	d29sm4100981wmi.19.2017.02.03.09.53.19
	for <meta-virtualization@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Feb 2017 09:53:20 -0800 (PST)
From: Mihaela Apetroaie-Cristea <apetroaiecristeamihaela@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Message-Id: <3BF3053B-640D-4362-B28B-4382F2A9C762@gmail.com>
Date: Fri, 3 Feb 2017 17:53:19 +0000
To: meta-virtualization@yoctoproject.org
X-Mailer: Apple Mail (2.3259)
Subject: ERROR: meta-virtualization/recipes-devtools/go-cross/go-cross_1.6.bb:do_compile
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
X-List-Received-Date: Fri, 03 Feb 2017 17:53:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hello,=20


I am trying to add docker to my raspbarry pi image using yocto, but I =
get a go_cross error from meta-virtualization layer.

my meta-virtualization is morty, up to date

my OS is Debian Jessie up to date

here is the log file:

NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        =3D "1.32.0"
BUILD_SYS         =3D "x86_64-linux"
NATIVELSBSTRING   =3D "universal-4.9"
TARGET_SYS        =3D "arm-poky-linux-gnueabi"
MACHINE           =3D "raspberrypi2"
DISTRO            =3D "poky"
DISTRO_VERSION    =3D "2.2.1"
TUNE_FEATURES     =3D "arm armv7ve vfp thumb neon vfpv4 =
callconvention-hard cortexa7"
TARGET_FPU        =3D "hard"
meta
meta-poky         =3D "morty:a3fa5ce87619e81d7acfa43340dd18d8f2b2d7dc"
meta-selinux      =3D "master:bae51859f0dbcdde9fd563d15128a6dbbb816801"
meta-oe
meta-networking
meta-filesystems
meta-python       =3D "morty:1efa5d623bc64659b57389e50be2568b1355d5f7"
meta-qt5          =3D "morty:4020adfd5198cf581eb20fbfd7d5b4c1a42fcdf4"
meta-yocto-bsp    =3D "morty:a3fa5ce87619e81d7acfa43340dd18d8f2b2d7dc"
meta-mender-core
meta-mender-raspberrypi =3D =
"morty:784d57078cada80bff9ac257133504bf29c50fbe"
meta-raspberrypi  =3D "morty:73980301cf6c4d1d968266bbc2adb0ca35a91912"
meta-mender-demo  =3D "morty:784d57078cada80bff9ac257133504bf29c50fbe"
oe-meta-go        =3D "master:68a7ca5e8f0eeed1b21135816040e055e4dc583a"
meta-virtualization =3D "morty:120745a7fcb72ece2616ce3f5ae233badb587352"

NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Running task 816 of 3246 =
(/media/mika/new/poky/meta/recipes-core/systemd/systemd_230.bb:do_install_=
ptest_base)
NOTE: recipe systemd-1_230+gitAUTOINC+3a74d4fc90-r0: task =
do_install_ptest_base: Started
NOTE: Running task 1338 of 3246 =
(/media/mika/new/poky/meta-virtualization/recipes-devtools/go-cross/go-cro=
ss_1.6.bb:do_compile)
NOTE: Running task 1347 of 3246 =
(/media/mika/new/poky/meta/recipes-devtools/python/python-setuptools_22.0.=
5.bb:do_configure)
NOTE: Running task 1348 of 3246 =
(/media/mika/new/poky/meta/recipes-extended/libidn/libidn_1.33.bb:do_packa=
gedata)
NOTE: recipe go-cross-1.6.2-r0: task do_compile: Started
ERROR: go-cross-1.6.2-r0 do_compile: Function failed: do_compile (log =
file is located at =
/media/mika/new/poky/build3/tmp/work/x86_64-linux/go-cr$
ERROR: Logfile of failure stored in: =
/media/mika/new/poky/build3/tmp/work/x86_64-linux/go-cross/1.6.2-r0/temp/l=
og.do_compile.49550
NOTE: recipe go-cross-1.6.2-r0: task do_compile: Failed
ERROR: Task =
(/media/mika/new/poky/meta-virtualization/recipes-devtools/go-cross/go-cro=
ss_1.6.bb:do_compile) failed with exit code '1'
NOTE: Running task 1349 of 3246 =
(/media/mika/new/poky/meta/recipes-support/nettle/nettle_3.2.bb:do_package=
data)
NOTE: recipe python-setuptools-22.0.5-r0: task do_configure: Started
NOTE: recipe python-setuptools-22.0.5-r0: task do_configure: Succeeded
NOTE: recipe libidn-1.33-r0: task do_packagedata: Started
NOTE: recipe nettle-3.2-r0: task do_packagedata: Started
NOTE: recipe systemd-1_230+gitAUTOINC+3a74d4fc90-r0: task =
do_install_ptest_base: Succeeded
NOTE: recipe libidn-1.33-r0: task do_packagedata: Succeeded
NOTE: recipe nettle-3.2-r0: task do_packagedata: Succeeded
NOTE: Tasks Summary: Attempted 1349 tasks of which 1344 didn't need to =
be rerun and 1 failed.


Thank you

--=20
Mihaela=

