Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6EE53E004D2; Fri,  3 Feb 2017 11:26:24 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.196 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.213.196 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yb0-f196.google.com (mail-yb0-f196.google.com
	[209.85.213.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3D1D5E00480
	for <meta-virtualization@yoctoproject.org>;
	Fri,  3 Feb 2017 11:26:20 -0800 (PST)
Received: by mail-yb0-f196.google.com with SMTP id o65so1198463ybo.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 03 Feb 2017 11:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=m7OdOLW2+QR3FJ1vHIk5BPWd9FlaMFqqFRpen29xh5I=;
	b=Awdv2KS1H8oj0Pl0a0P2NXaoBDD31ROnwzLu6vWUaDTpga7wa2nTEm7YRqByQsGVnZ
	QChKKw9Xlw4Hu7ceeFx/LaVk7KArNj8w8CtGUw0aqczWT8qj9gQvCILcPiYtUOqQu3dO
	SNcBXkmYda7eRi5zsOkL3CtEYTxouqOV+S/nwR4mFsk7VD95reLkn2g4z+sDlDkR3kn1
	OZAeKI+nygYiRa4Td7UAQI/+gdUgp1IS/MuioCWGhhLAEbK4SM8LeLus0YBts5RQUgGU
	5uMX42IZOSvj9DotgXwejmamVYGHf/jKPiK1tPjDw3pvE3skyZk10LOScWI75WgUuEcm
	NJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=m7OdOLW2+QR3FJ1vHIk5BPWd9FlaMFqqFRpen29xh5I=;
	b=CVqAOCFPJLJzuCMn9aXoCjkxeImPJyf3Cq0h3KScZQy3iV8aX8t2n4RLEd5UZXUjkN
	0MHPlWEq++mRAVkSw7BecnYr5a0mNLZUJNTcPjchYVurBu6GvgBKx9xa0I6OUyIiFPdR
	yGxrJq4VMIzxn5h+NvQu2+EAl1WaqfbPQyovnM/YjdDfSlCfpiuGt9ZSG+RuPoae7HdB
	LKgWlfHBI4h+LH3DJLGi0X0EsAt2Jarmu41BiuAM1E8sruhLasn6uuL8K5owhbAOuH/A
	3d2woU0Hq2qrRphJOjCzGyXh1OdBXffafIFtcoo+gU27BNMZj+7QU+NAjGjnONzJKIhH
	KAyQ==
X-Gm-Message-State: AIkVDXKHF8+RQ/lViAgyaMjTanzFf9qWGodN4VQSzGlCOWY1KyCG2ISKx8h+5fdX0scIhoD3iT8bv/7higS1oQ==
X-Received: by 10.37.110.11 with SMTP id j11mr7467631ybc.40.1486149980109;
	Fri, 03 Feb 2017 11:26:20 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.172.100 with HTTP; Fri, 3 Feb 2017 11:26:19 -0800 (PST)
In-Reply-To: <3BF3053B-640D-4362-B28B-4382F2A9C762@gmail.com>
References: <3BF3053B-640D-4362-B28B-4382F2A9C762@gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Fri, 3 Feb 2017 14:26:19 -0500
X-Google-Sender-Auth: 3OMBm56ZRjCnl2BJGkHGUg0eS6M
Message-ID: <CAPuovELr=z8m67xexnCdHKSj8KgVxGJnmTh5F8cyVN+Ed7bbEQ@mail.gmail.com>
To: Mihaela Apetroaie-Cristea <apetroaiecristeamihaela@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: ERROR: meta-virtualization/recipes-devtools/go-cross/go-cross_1.6.bb:do_compile
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Feb 2017 19:26:24 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 3, 2017 at 12:53 PM, Mihaela Apetroaie-Cristea
<apetroaiecristeamihaela@gmail.com> wrote:
> Hello,
>
>
> I am trying to add docker to my raspbarry pi image using yocto, but I get a go_cross error from meta-virtualization layer.
>
> my meta-virtualization is morty, up to date
>
> my OS is Debian Jessie up to date
>
> here is the log file:
>
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION        = "1.32.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "universal-4.9"
> TARGET_SYS        = "arm-poky-linux-gnueabi"
> MACHINE           = "raspberrypi2"
> DISTRO            = "poky"
> DISTRO_VERSION    = "2.2.1"
> TUNE_FEATURES     = "arm armv7ve vfp thumb neon vfpv4 callconvention-hard cortexa7"
> TARGET_FPU        = "hard"
> meta
> meta-poky         = "morty:a3fa5ce87619e81d7acfa43340dd18d8f2b2d7dc"
> meta-selinux      = "master:bae51859f0dbcdde9fd563d15128a6dbbb816801"
> meta-oe
> meta-networking
> meta-filesystems
> meta-python       = "morty:1efa5d623bc64659b57389e50be2568b1355d5f7"
> meta-qt5          = "morty:4020adfd5198cf581eb20fbfd7d5b4c1a42fcdf4"
> meta-yocto-bsp    = "morty:a3fa5ce87619e81d7acfa43340dd18d8f2b2d7dc"
> meta-mender-core
> meta-mender-raspberrypi = "morty:784d57078cada80bff9ac257133504bf29c50fbe"
> meta-raspberrypi  = "morty:73980301cf6c4d1d968266bbc2adb0ca35a91912"
> meta-mender-demo  = "morty:784d57078cada80bff9ac257133504bf29c50fbe"
> oe-meta-go        = "master:68a7ca5e8f0eeed1b21135816040e055e4dc583a"
> meta-virtualization = "morty:120745a7fcb72ece2616ce3f5ae233badb587352"
>
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> NOTE: Running task 816 of 3246 (/media/mika/new/poky/meta/recipes-core/systemd/systemd_230.bb:do_install_ptest_base)
> NOTE: recipe systemd-1_230+gitAUTOINC+3a74d4fc90-r0: task do_install_ptest_base: Started
> NOTE: Running task 1338 of 3246 (/media/mika/new/poky/meta-virtualization/recipes-devtools/go-cross/go-cross_1.6.bb:do_compile)
> NOTE: Running task 1347 of 3246 (/media/mika/new/poky/meta/recipes-devtools/python/python-setuptools_22.0.5.bb:do_configure)
> NOTE: Running task 1348 of 3246 (/media/mika/new/poky/meta/recipes-extended/libidn/libidn_1.33.bb:do_packagedata)
> NOTE: recipe go-cross-1.6.2-r0: task do_compile: Started
> ERROR: go-cross-1.6.2-r0 do_compile: Function failed: do_compile (log file is located at /media/mika/new/poky/build3/tmp/work/x86_64-linux/go-cr$
> ERROR: Logfile of failure stored in: /media/mika/new/poky/build3/tmp/work/x86_64-linux/go-cross/1.6.2-r0/temp/log.do_compile.49550


And the contents of this ^^^^^ log?

Note that I am currently working through some build issues with Docker
(caused by the per recipe sysroot stuff) so if you are building with
master you might run into some issues. I should have fixes out early
next week.

Mark

> NOTE: recipe go-cross-1.6.2-r0: task do_compile: Failed
> ERROR: Task (/media/mika/new/poky/meta-virtualization/recipes-devtools/go-cross/go-cross_1.6.bb:do_compile) failed with exit code '1'
> NOTE: Running task 1349 of 3246 (/media/mika/new/poky/meta/recipes-support/nettle/nettle_3.2.bb:do_packagedata)
> NOTE: recipe python-setuptools-22.0.5-r0: task do_configure: Started
> NOTE: recipe python-setuptools-22.0.5-r0: task do_configure: Succeeded
> NOTE: recipe libidn-1.33-r0: task do_packagedata: Started
> NOTE: recipe nettle-3.2-r0: task do_packagedata: Started
> NOTE: recipe systemd-1_230+gitAUTOINC+3a74d4fc90-r0: task do_install_ptest_base: Succeeded
> NOTE: recipe libidn-1.33-r0: task do_packagedata: Succeeded
> NOTE: recipe nettle-3.2-r0: task do_packagedata: Succeeded
> NOTE: Tasks Summary: Attempted 1349 tasks of which 1344 didn't need to be rerun and 1 failed.
>
>
> Thank you
>
> --
> Mihaela
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

