Return-Path: <nathan@nathanrossi.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 54BE0E009A5; Tue, 14 Mar 2017 05:34:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.175 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.175 listed in list.dnswl.org]
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 12033E00961
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Mar 2017 05:34:34 -0700 (PDT)
Received: by mail-qt0-f175.google.com with SMTP id n21so54167513qta.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Mar 2017 05:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yjWohrMq8kWqssxsx1APCXmm0LQrLjhe4MQbm3hbNoA=;
	b=E70vlSmlYKC28yJ+ok0ax2pLCRPmeLJJugIULHIHliGKNmLNajdo6NvebU6jvvlh14
	KBBFuMsxHA9GagEdaerdzPGQoFSsZ+di5e3/XzUILiKyFvjiitBe2fjZE6C24lnEskmM
	jJa7beQZBmRDjs7xrQrc/0Oq0HwIBOPR/WQ1eupNheR+s7D/nmD+4/G/OaxcK5SNZgX1
	dT+oucKBacFOkmPO543GM24cUWc+pPWELrP30PhUasIJdqB6M7GZCVmIDgcF5MKVhRQ1
	G3UptJxuYADWLTGQWOpvnwWidXaoG2PQ/r/EVl2gZHuptsAW3w08EMc4SkWiXnu+o47J
	eBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yjWohrMq8kWqssxsx1APCXmm0LQrLjhe4MQbm3hbNoA=;
	b=Ilp3l0YyvCmmLkORcY1Md0SR8/qCwYd5MA65r5nL0x/wbUBp0YckKUFb21xl4eAtWq
	8C8knhQrEXDniaRYsrh0Y0bXUbxQwAdIztrWNApUtSEGJZndTLTBcUotI+C5w9pEEDQB
	QoMnw0gIGB3/tNhWzNLrx1edjkR4Qz2tqi8EOQdBUWHiJao6tJV0Lfo3kw3bRRpKb8Wm
	caC9Mr+hWUZfTrZuPR6EGfeQNv4CLLcZMuemPPG9Zsu92MB1MzIxnmamPONQmPBXw3IY
	CfX1A1e8B08dRCZvvQPVEAAt4F527x22otKJUuWCQPO9t7Kac5KvE1d3JPm1iEQ1RRqW
	4zEg==
X-Gm-Message-State: AMke39kw8bO/pWHQaXCW9AoH0GAgG3EyainZQnGO7VR/3i0CmJE+wWej/xzW9PXCK60Rx+BMpHKSueX4Hk8z8Q==
X-Received: by 10.237.50.97 with SMTP id y88mr39685908qtd.104.1489494873844;
	Tue, 14 Mar 2017 05:34:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.134.130 with HTTP; Tue, 14 Mar 2017 05:34:33 -0700 (PDT)
In-Reply-To: <CAFL6qn48eNqHgE-oZFfac-a9pNUkiimfSobkgcW-FEQV9i=_uQ@mail.gmail.com>
References: <CAFL6qn48eNqHgE-oZFfac-a9pNUkiimfSobkgcW-FEQV9i=_uQ@mail.gmail.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Tue, 14 Mar 2017 22:34:33 +1000
Message-ID: <CA+aJhH3dGFeMVL8Z6TYgru3UVG8FZzy1oQQ5emd+5Db_9SQM2A@mail.gmail.com>
To: Pello Heriz <pello.heriz@alumni.mondragon.edu>
Cc: meta-virtualization@yoctoproject.org, meta-xilinx@yoctoproject.org,
	meta-xilinx-request@yoctoproject.org
Subject: Re: [meta-xilinx] Booting ZCU102 SD image on QEMU
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
X-List-Received-Date: Tue, 14 Mar 2017 12:34:36 -0000
Content-Type: text/plain; charset=UTF-8

On 14 March 2017 at 18:57, Pello Heriz <pello.heriz@alumni.mondragon.edu> wrote:
> Hi,
>
> I'm trying to launch QEMU from my SD card but I'm having some problems.
>
> I have followed the instructions that appears on page 37 in the next link:
> https://japan.xilinx.com/support/documentation/sw_manuals_j/xilinx2016_2/ug1169-zynqmp-qemu.pdf
>
> All the process was fine until arriving into step number 4. When I tried to
> boot QEMU from the SD card, I can see in the terminal that the machine that
> I'm trying to use is not supported. Here is the report:
>
> pello@pello-VirtualBox:/opt/yocto_GE/yocto_master/poky/build$
> qemu-system-aarch64 -M arm-generic-fdt -nographic -device
> loader,file=/opt/yocto_GE/yocto_master/poky/build/tmp/deploy/images/zcu102-zynqmp/fsbl.elf,cpu=0
> -dtb
> /opt/yocto_GE/yocto_master/poky/build/tmp/deploy/images/zcu102-zynqmp/Image--4.6-xilinx-v2016.4+git0+2762bc9163-r0-zynqmp-zcu102-revB-20170306094246.dtb
> -device loader,addr=0xfd1a0104,data=0x8000000e,data-len=4 -drive
> file=/media/pello/5A08-C4B7/zynqmp_master.img,if=sd,format=raw,index=0-boot
> mode=3
> qemu-system-aarch64: -drive
> file=/media/pello/5A08-C4B7/zynqmp_master.img,if=sd,format=raw,index=0-boot:
> unsupported machine type
> Use -machine help to list supported machines
> pello@pello-VirtualBox:/opt/yocto_GE/yocto_master/poky/build$
>
> What can I do?

Make sure you are using the correct qemu-system-aarch64 binary. By
default the qemu built that is in the images recipe-sysroot/usr/bin/
is the mainline qemu, but you want the qemu-xilinx one. If you are
building meta-xilinx with zcu102-zynqmp (presumably master), you will
need to dive one level deeper to use
usr/bin/qemu-xilinx/qemu-system-aarch64.

Regards,
Nathan

