Return-Path: <pello.heriz@alumni.mondragon.edu>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3A2D9E009B8; Tue, 14 Mar 2017 01:57:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.179 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.179 listed in list.dnswl.org]
Received: from mail-ot0-f179.google.com (mail-ot0-f179.google.com
	[74.125.82.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 470B3E00939
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Mar 2017 01:57:24 -0700 (PDT)
Received: by mail-ot0-f179.google.com with SMTP id 19so129319426oti.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Mar 2017 01:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=alumni.mondragon.edu; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=jjX6m9dEFTT9wXzqiRgBunz6uiaMj8nM1aKXuf08v1c=;
	b=ZhEFKJ7/fov5bwO14JzHxr8lM+8hn7f4rLZCWz+ksovq35VOXENHJBuIbjX8F5lEQ6
	nqguGAwHfBrradbqFUNORqTDa2Nn5kkwbg3yPuJSu9Q0rYgCZl1sEz8G4qiIXrvztPyi
	BSSh7UAPHTiuTc2tCz5ocQS5YzTII74Xd4khI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=jjX6m9dEFTT9wXzqiRgBunz6uiaMj8nM1aKXuf08v1c=;
	b=DBpR2NhiQp8PhiSnSkjFEQ1hz9AOMxJar81jXRqE/vWeL8y3Iugm/NXlQ/8EWATca/
	8ToCK4SkmvoCEo23B2hwP7iQwtl/Os5ftqCTn4lxguS6QIAjnLVx7u8E35YsgpfTOJ8k
	I7qqjhgItxcrzS1upEBtlnjM4Ch9PCeYtxAmJ+a8QoaQ8kmocRzTt0h/BvgKs1AdzqAl
	uNO8qL31z6z4ONT/475wR+WeksyPbwmDGg+KJJ2wppixHoiilhxw3qqGkjK4I55phvZ+
	IbBd2yo/9MvAq5j/amSe7C1B60imTc+bQFGTsiTrzG+7tYE+jjp/oxA7mvU1H4MbH4e1
	2plQ==
X-Gm-Message-State: AFeK/H0sWipVLqEPhEvK7CjksVn5jN7vlY6K3M7+JNHucwnA/d8+qIXsLz4v/oK3sfyczKbrYx1P7BRPeTQJ9G9m
X-Received: by 10.157.21.4 with SMTP id u4mr18479732otf.229.1489481843947;
	Tue, 14 Mar 2017 01:57:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.68.138 with HTTP; Tue, 14 Mar 2017 01:57:23 -0700 (PDT)
From: Pello Heriz <pello.heriz@alumni.mondragon.edu>
Date: Tue, 14 Mar 2017 09:57:23 +0100
Message-ID: <CAFL6qn48eNqHgE-oZFfac-a9pNUkiimfSobkgcW-FEQV9i=_uQ@mail.gmail.com>
To: meta-xilinx@yoctoproject.org, meta-xilinx-request@yoctoproject.org, 
	meta-virtualization@yoctoproject.org
Subject: Booting ZCU102 SD image on QEMU
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
X-List-Received-Date: Tue, 14 Mar 2017 08:57:29 -0000
Content-Type: multipart/alternative; boundary=94eb2c1918e8354e9c054aad0450

--94eb2c1918e8354e9c054aad0450
Content-Type: text/plain; charset=UTF-8

Hi,

I'm trying to launch QEMU from my SD card but I'm having some problems.

I have followed the instructions that appears on page 37 in the next link:
https://japan.xilinx.com/support/documentation/sw_manuals_j/xilinx2016_2/ug1169-zynqmp-qemu.pdf

All the process was fine until arriving into step number 4. When I tried to
boot QEMU from the SD card, I can see in the terminal that the machine that
I'm trying to use is not supported. Here is the report:

pello@pello-VirtualBox:/opt/yocto_GE/yocto_master/poky/build$
qemu-system-aarch64 -M arm-generic-fdt -nographic -device
loader,file=/opt/yocto_GE/yocto_master/poky/build/tmp/deploy/images/zcu102-zynqmp/fsbl.elf,cpu=0
-dtb
/opt/yocto_GE/yocto_master/poky/build/tmp/deploy/images/zcu102-zynqmp/Image--4.6-xilinx-v2016.4+git0+2762bc9163-r0-zynqmp-zcu102-revB-20170306094246.dtb
-device loader,addr=0xfd1a0104,data=0x8000000e,data-len=4 -drive
file=/media/pello/5A08-C4B7/zynqmp_master.img,if=sd,format=raw,index=0-boot
mode=3
qemu-system-aarch64: -drive
file=/media/pello/5A08-C4B7/zynqmp_master.img,if=sd,format=raw,index=0-boot:
unsupported machine type
Use -machine help to list supported machines
pello@pello-VirtualBox:/opt/yocto_GE/yocto_master/poky/build$

What can I do?

Thanks,
Pello

--94eb2c1918e8354e9c054aad0450
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I&#39;m trying to launch QEMU from =
my SD card but I&#39;m having some problems.</div><div><br></div><div>I hav=
e followed the instructions that appears on page 37 in the next link:</div>=
<div><a href=3D"https://japan.xilinx.com/support/documentation/sw_manuals_j=
/xilinx2016_2/ug1169-zynqmp-qemu.pdf">https://japan.xilinx.com/support/docu=
mentation/sw_manuals_j/xilinx2016_2/ug1169-zynqmp-qemu.pdf</a><br></div><di=
v><br></div><div>All the process was fine until arriving into step number 4=
. When I tried to boot QEMU from the SD card, I can see in the terminal tha=
t the machine that I&#39;m trying to use is not supported. Here is the repo=
rt:</div><div><br></div><div><div>pello@pello-VirtualBox:/opt/yocto_GE/yoct=
o_master/poky/build$ qemu-system-aarch64 -M arm-generic-fdt -nographic -dev=
ice loader,file=3D/opt/yocto_GE/yocto_master/poky/build/tmp/deploy/images/z=
cu102-zynqmp/fsbl.elf,cpu=3D0 -dtb /opt/yocto_GE/yocto_master/poky/build/tm=
p/deploy/images/zcu102-zynqmp/Image--4.6-xilinx-v2016.4+git0+2762bc9163-r0-=
zynqmp-zcu102-revB-20170306094246.dtb -device loader,addr=3D0xfd1a0104,data=
=3D0x8000000e,data-len=3D4 -drive file=3D/media/pello/5A08-C4B7/zynqmp_mast=
er.img,if=3Dsd,format=3Draw,index=3D0-boot mode=3D3</div><div>qemu-system-a=
arch64: -drive file=3D/media/pello/5A08-C4B7/zynqmp_master.img,if=3Dsd,form=
at=3Draw,index=3D0-boot: unsupported machine type</div><div>Use -machine he=
lp to list supported machines</div><div>pello@pello-VirtualBox:/opt/yocto_G=
E/yocto_master/poky/build$=C2=A0</div></div><div><br></div><div>What can I =
do?</div><div><br></div><div>Thanks,</div><div>Pello</div></div>

--94eb2c1918e8354e9c054aad0450--
