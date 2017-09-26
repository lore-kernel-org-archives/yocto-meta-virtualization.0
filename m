Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 29C3AE00D18; Mon, 25 Sep 2017 17:51:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_LOW,
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.216.182 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.182 listed in dnsbl.sorbs.net]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 859CCE00D10
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 17:51:08 -0700 (PDT)
Received: by mail-qt0-f182.google.com with SMTP id s18so8791954qta.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 17:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lk1de2id4jMW+ju4W5AVDqLMalfXQH2VNZZM8hE6PlQ=;
	b=Ms3ZXxNAYOl9ajjxOQto4XvCms8KNrqsaZtdB6qIIm+57NdIGsL09LblarNrXlQtqK
	SXBnr4YZfoWAtRGwbhYczRQLK3QJkwve88GheDOzdpC+7Dn0EQRkS1RzkEx9UWJRoZTB
	vBBrTVO1Lu3jZfYvFQoJ47JxvXL2b8UZX1z5xOxehsdPo5lJtTHn0fLLo0mmirbOTdMM
	SQF1X7FbpnKp1WQDmWAV60dwGwUopZXkZyCYDXu1OwVwCh/sBBlhA465l2FYxsxcV01J
	hlHaAUYlYG9jY3OlyUeEqGEVKMY3HUtclDRccy2I1RUie6ZlfBI3rPSHTTOjUGc7X6eR
	vBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lk1de2id4jMW+ju4W5AVDqLMalfXQH2VNZZM8hE6PlQ=;
	b=Uf1cRaP/5d+u5pnindJVQff9UJ+l+G2YwXz1b+f9lfwsvmn6j3gBa4BLc5QAZebphM
	lIomx3DhpE9jaK6SnfRq+j8cBAfEIXe1GQy1g+lRc/jbHoOUglvH5OXdbJqnkVRYmmyv
	CjvyplhmN54Um+LE0+uMkN9qZPfBJcG6k1/ryGI9sbln5idmqLMo4rBfRID2HiMKqyd6
	3bsgp2LUiN2QiWdaZi1RRiIPgLn2zltX5+5ssN2+bLv+J7br63laC0TqrQdbm74z6Xwy
	1tT37ftEqzpGlzxsqf3cWbzsLIqCSw+YrmegxjVkpExWtCuFCQdcwscmckzsH2Gfv5dM
	Q2LA==
X-Gm-Message-State: AHPjjUg266+b77OplUOm7EbOAfHKhfJ4E4tItcfl8yHby+3LJLN0h523
	nrZcvFAvgRfwbDRfnazOnQlp0Le1pr8p9NGs23A=
X-Google-Smtp-Source: AOwi7QD31P7BcPlB94xy9UMQ7IWeDUqW7lPgMuO9DwRXELHH0PNOKnbowHbuJVSmVXNgENeLh5nuJ5u4u2eYdU3bILU=
X-Received: by 10.200.51.69 with SMTP id u5mr13869669qta.204.1506387067590;
	Mon, 25 Sep 2017 17:51:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.148.104 with HTTP; Mon, 25 Sep 2017 17:51:07 -0700 (PDT)
In-Reply-To: <CACrgodd-pndXEkJujo2SvqmqM44UZruZzxjv4DAcW+uYPr9-4g@mail.gmail.com>
References: <CACrgodd-pndXEkJujo2SvqmqM44UZruZzxjv4DAcW+uYPr9-4g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 25 Sep 2017 20:51:07 -0400
Message-ID: <CADkTA4O0jbwi1Y9uLQcYbEk7W7Nk1y3xJE31_-k5J+y1+a7d5g@mail.gmail.com>
To: Lai Eddy <eddy.lai.tw@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services] open-iscsi-kernel build error
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
X-List-Received-Date: Tue, 26 Sep 2017 00:51:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 25, 2017 at 8:47 PM, Lai Eddy <eddy.lai.tw@gmail.com> wrote:
> I want to use iscsi in my yocto project so I add
> open-iscsi-kernel and open-iscsi-kernel

These recipes have had relatively little use, and none for a while.

Last I checked:

http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb?h=master

Is a better option for iscsi kernel support.

I need to purge the recipes from meta-openstack to make that clear (it
isn't clear at all at the moment).

Bruce

> into my local.conf
> but got following build error
> ---------------------------------------------------------------
> ERROR: open-iscsi-kernel-2.0-873-r2 do_compile: oe_runmake failed
> ERROR: open-iscsi-kernel-2.0-873-r2 do_compile: Function failed: do_compile
> (log file is located at
> /home/user/poky/build/tmp/work/intel_corei7_64-poky-linux/open-iscsi-kernel/2.0-873-r2/temp/log.do_compile.1691)
> ERROR: Logfile of failure stored in:
> /home/user/poky/build/tmp/work/intel_corei7_64-poky-linux/open-iscsi-kernel/2.0-873-r2/temp/log.do_compile.1691
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 8
> KERNEL_SRC=/home/user/poky/build/tmp/work-shared/intel-corei7-64/kernel-source
> KSRC=/home/user/poky/build/tmp/work-shared/intel-corei7-64/kernel-source
> LDFLAGS= kernel
> | make -C kernel
> | make[1]: Entering directory
> '/home/user/poky/build/tmp/work/intel_corei7_64-poky-linux/open-iscsi-kernel/2.0-873-r2/open-iscsi-2.0-873/kernel'
> | echo "Patching source code for linux-2.6.28-33 ..."
> | Patching source code for linux-2.6.28-33 ...
> | if [ -e cur_patched ]; then \
> | make -C . clean; \
> | fi
> | patch -p1 < 2.6.28-32_compat.patch
> | patching file iscsi_tcp.c
> | patching file libiscsi.c
> | patching file libiscsi.h
> | patching file libiscsi_tcp.c
> | patching file libiscsi_tcp.h
> | patching file open_iscsi_compat.h
> | cp 2.6.28-32_compat.patch has_28to32_patch
> | ln -s has_28to32_patch cur_patched
> | make -C
> /home/user/poky/build/tmp/work-shared/intel-corei7-64/kernel-source M=`pwd`
> KBUILD_OUTPUT=/home/user/poky/build/tmp/work-shared/intel-corei7-64/kernel-build-artifacts
> V=0 modules
> | make[2]: Entering directory
> '/home/user/poky/build/tmp/work-shared/intel-corei7-64/kernel-source'
> | make[3]: Entering directory
> '/home/user/poky/build/tmp/work-shared/intel-corei7-64/kernel-build-artifacts'
> |   CC [M]
> /home/user/poky/build/tmp/work/intel_corei7_64-poky-linux/open-iscsi-kernel/2.0-873-r2/open-iscsi-2.0-873/kernel/scsi_transport_iscsi.o
> |   CC [M]
> /home/user/poky/build/tmp/work/intel_corei7_64-poky-linux/open-iscsi-kernel/2.0-873-r2/open-iscsi-2.0-873/kernel/libiscsi.o
> |   CC [M]
> /home/user/poky/build/tmp/work/intel_corei7_64-poky-linux/open-iscsi-kernel/2.0-873-r2/open-iscsi-2.0-873/kernel/libiscsi_tcp.o
> |   CC [M]
> /home/user/poky/build/tmp/work/intel_corei7_64-poky-linux/open-iscsi-kernel/2.0-873-r2/open-iscsi-2.0-873/kernel/iscsi_tcp.o
> | In file included from
> /home/user/poky/build/tmp/work/intel_corei7_64-poky-linux/open-iscsi-kernel/2.0-873-r2/open-iscsi-2.0-873/kernel/iscsi_tcp.c:47:0:
> |
> /home/user/poky/build/tmp/work/intel_corei7_64-poky-linux/open-iscsi-kernel/2.0-873-r2/open-iscsi-2.0-873/kernel/iscsi_tcp.h:48:19:
> error: field 'tx_hash' has incomplete type
> |   struct hash_desc tx_hash; /* CRC32C (Tx) */
> |                    ^~~~~~~
> |
> /home/user/poky/build/tmp/work/intel_corei7_64-poky-linux/open-iscsi-kernel/2.0-873-r2/open-iscsi-2.0-873/kernel/iscsi_tcp.h:49:19:
> error: field 'rx_hash' has incomplete type
> |   struct hash_desc rx_hash; /* CRC32C (Rx) */
> |                    ^~~~~~~
> |
> /home/user/poky/build/tmp/work/intel_corei7_64-poky-linux/open-iscsi-kernel/2.0-873-r2/open-iscsi-2.0-873/kernel/iscsi_tcp.c:
> In function 'iscsi_sw_tcp_conn_set_callbacks':
> |
> /home/user/poky/build/tmp/work/intel_corei7_64-poky-linux/open-iscsi-kernel/2.0-873-r2/open-iscsi-2.0-873/kernel/iscsi_tcp.c:201:30:
> error: assignment from incompatible pointer type
> [-Werror=incompatible-pointer-types]
> |   tcp_sw_conn->old_data_ready = sk->sk_data_ready;
>
> my build environment is:
> ----------------------------------------
> Build Configuration:
> BB_VERSION        = "1.34.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "universal"
> TARGET_SYS        = "x86_64-poky-linux"
> MACHINE           = "intel-corei7-64"
> DISTRO            = "poky"
> DISTRO_VERSION    = "2.3.1"
> TUNE_FEATURES     = "m64 corei7"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

