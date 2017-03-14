Return-Path: <pello.heriz@alumni.mondragon.edu>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35A27E00901; Tue, 14 Mar 2017 06:32:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.193 listed in dnsbl.sorbs.net]
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 340ADE00901
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Mar 2017 06:32:17 -0700 (PDT)
Received: by mail-ot0-f193.google.com with SMTP id i1so19621280ota.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Mar 2017 06:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=alumni.mondragon.edu; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Dm8liwWLwBQlnrE4pwAgJbCiC3XozgbjqGYaMqL1WGw=;
	b=AexTB6a+/hFMnGr6NVxiQos4+0wP2FTU31zL3JpDA6y+v8wxUnN7dUmb8DJwlyQRDW
	Hco068vicnS7GGtIO+wx3wkQ540BKzGaYMZ/LcfXOBPk/TgdTVvVVku/kBXl16MPtIJ2
	wKel8XXNiSYbsJ1kgo999x9WSJHh3lwTGu7K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Dm8liwWLwBQlnrE4pwAgJbCiC3XozgbjqGYaMqL1WGw=;
	b=H3NVAT34HCmFLHNvmUCofz7UrtU9RAnYKPAlgL756SDsnpn7SP6kl+Cs1i2ZE15bv3
	R8rQ7bi+Fk5sM1jJbYXBl7JqxxCaBbNIWHCDndKoXj9Gm3y6/KCqlbqy4IaHTQBEJ2pE
	RsBOdZBi//oBdcIh9b/2Cnoi2didHKtTJm2/tModsDuP9644g2mc0QiVDu+7lq9g5HVy
	Uh2hmeLaQhDA5J2kdGVMA/g6K+WQNRnSWz4aZtz8yxWn7071whSlJALXn+I/gwv2gyrb
	cDeXe93chr2+ACEwcUt+ASaoCma7NlYlYb4F1k4bdv0cKZq0SGehfB5GHrGQRNbUhPJ2
	3dnA==
X-Gm-Message-State: AFeK/H3Sm+2G+cl7lo/Rxfz6lqVbRAvCfrpfdztfMfunpdvfWmMRApOMFggvk0bGX99S6uGX0RBoNpgeylvgGjAL
X-Received: by 10.157.36.161 with SMTP id z30mr22172597ota.208.1489498336709; 
	Tue, 14 Mar 2017 06:32:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.4.52 with HTTP; Tue, 14 Mar 2017 06:32:16 -0700 (PDT)
In-Reply-To: <CA+aJhH3dGFeMVL8Z6TYgru3UVG8FZzy1oQQ5emd+5Db_9SQM2A@mail.gmail.com>
References: <CAFL6qn48eNqHgE-oZFfac-a9pNUkiimfSobkgcW-FEQV9i=_uQ@mail.gmail.com>
	<CA+aJhH3dGFeMVL8Z6TYgru3UVG8FZzy1oQQ5emd+5Db_9SQM2A@mail.gmail.com>
From: Pello Heriz <pello.heriz@alumni.mondragon.edu>
Date: Tue, 14 Mar 2017 14:32:16 +0100
Message-ID: <CAFL6qn6Em-2Bqw8AU0SGpFC+knNw5EuuuaXecGRJa5gcvdFPRw@mail.gmail.com>
To: Nathan Rossi <nathan@nathanrossi.com>
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
X-List-Received-Date: Tue, 14 Mar 2017 13:32:21 -0000
Content-Type: multipart/alternative; boundary=94eb2c04f89a40e2fe054ab0db06

--94eb2c04f89a40e2fe054ab0db06
Content-Type: text/plain; charset=UTF-8

Hi,

I have clone Xilinx qemu from here:  git clone git://
github.com/Xilinx/qemu.git

Anyway, if I go into qemu directory and I execute "qemu-system-aarch64
-machine help" command, in the supported machines response dosen't appear
xlnx-zcu102.

What do I nee to do?

Regards,
Pello

2017-03-14 13:34 GMT+01:00 Nathan Rossi <nathan@nathanrossi.com>:

> On 14 March 2017 at 18:57, Pello Heriz <pello.heriz@alumni.mondragon.edu>
> wrote:
> > Hi,
> >
> > I'm trying to launch QEMU from my SD card but I'm having some problems.
> >
> > I have followed the instructions that appears on page 37 in the next
> link:
> > https://japan.xilinx.com/support/documentation/sw_
> manuals_j/xilinx2016_2/ug1169-zynqmp-qemu.pdf
> >
> > All the process was fine until arriving into step number 4. When I tried
> to
> > boot QEMU from the SD card, I can see in the terminal that the machine
> that
> > I'm trying to use is not supported. Here is the report:
> >
> > pello@pello-VirtualBox:/opt/yocto_GE/yocto_master/poky/build$
> > qemu-system-aarch64 -M arm-generic-fdt -nographic -device
> > loader,file=/opt/yocto_GE/yocto_master/poky/build/tmp/
> deploy/images/zcu102-zynqmp/fsbl.elf,cpu=0
> > -dtb
> > /opt/yocto_GE/yocto_master/poky/build/tmp/deploy/images/
> zcu102-zynqmp/Image--4.6-xilinx-v2016.4+git0+2762bc9163-r0-zynqmp-zcu102-
> revB-20170306094246.dtb
> > -device loader,addr=0xfd1a0104,data=0x8000000e,data-len=4 -drive
> > file=/media/pello/5A08-C4B7/zynqmp_master.img,if=sd,
> format=raw,index=0-boot
> > mode=3
> > qemu-system-aarch64: -drive
> > file=/media/pello/5A08-C4B7/zynqmp_master.img,if=sd,
> format=raw,index=0-boot:
> > unsupported machine type
> > Use -machine help to list supported machines
> > pello@pello-VirtualBox:/opt/yocto_GE/yocto_master/poky/build$
> >
> > What can I do?
>
> Make sure you are using the correct qemu-system-aarch64 binary. By
> default the qemu built that is in the images recipe-sysroot/usr/bin/
> is the mainline qemu, but you want the qemu-xilinx one. If you are
> building meta-xilinx with zcu102-zynqmp (presumably master), you will
> need to dive one level deeper to use
> usr/bin/qemu-xilinx/qemu-system-aarch64.
>
> Regards,
> Nathan
>

--94eb2c04f89a40e2fe054ab0db06
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I have clone Xilinx qemu from here:=
=C2=A0<span style=3D"background-color:rgb(238,238,238);color:rgb(0,0,0);fon=
t-size:13px"> git clone git://<a href=3D"http://github.com/Xilinx/qemu.git"=
>github.com/Xilinx/qemu.git</a></span></div><div><span style=3D"background-=
color:rgb(238,238,238);color:rgb(0,0,0);font-size:13px"><br></span></div><d=
iv><font face=3D"arial, helvetica, sans-serif">Anyway, if I go into qemu di=
rectory and I execute &quot;qemu-system-aarch64 -machine help&quot; command=
, in the supported machines response dosen&#39;t appear xlnx-zcu102.</font>=
</div><div><font face=3D"arial, helvetica, sans-serif"><br></font></div><di=
v><font face=3D"arial, helvetica, sans-serif">What do I nee to do?</font></=
div><div><font face=3D"arial, helvetica, sans-serif"><br></font></div><div>=
<font face=3D"arial, helvetica, sans-serif">Regards,</font></div><div><font=
 face=3D"arial, helvetica, sans-serif">Pello</font></div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">2017-03-14 13:34 GMT+01:00 =
Nathan Rossi <span dir=3D"ltr">&lt;<a href=3D"mailto:nathan@nathanrossi.com=
" target=3D"_blank">nathan@nathanrossi.com</a>&gt;</span>:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><span class=3D"">On 14 March 2017 at 18:57, Pello Heriz &=
lt;<a href=3D"mailto:pello.heriz@alumni.mondragon.edu">pello.heriz@alumni.m=
ondragon.<wbr>edu</a>&gt; wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; I&#39;m trying to launch QEMU from my SD card but I&#39;m having some =
problems.<br>
&gt;<br>
&gt; I have followed the instructions that appears on page 37 in the next l=
ink:<br>
&gt; <a href=3D"https://japan.xilinx.com/support/documentation/sw_manuals_j=
/xilinx2016_2/ug1169-zynqmp-qemu.pdf" rel=3D"noreferrer" target=3D"_blank">=
https://japan.xilinx.com/<wbr>support/documentation/sw_<wbr>manuals_j/xilin=
x2016_2/ug1169-<wbr>zynqmp-qemu.pdf</a><br>
&gt;<br>
&gt; All the process was fine until arriving into step number 4. When I tri=
ed to<br>
&gt; boot QEMU from the SD card, I can see in the terminal that the machine=
 that<br>
&gt; I&#39;m trying to use is not supported. Here is the report:<br>
&gt;<br>
&gt; pello@pello-VirtualBox:/opt/<wbr>yocto_GE/yocto_master/poky/<wbr>build=
$<br>
&gt; qemu-system-aarch64 -M arm-generic-fdt -nographic -device<br>
&gt; loader,file=3D/opt/yocto_GE/<wbr>yocto_master/poky/build/tmp/<wbr>depl=
oy/images/zcu102-zynqmp/<wbr>fsbl.elf,cpu=3D0<br>
&gt; -dtb<br>
&gt; /opt/yocto_GE/yocto_master/<wbr>poky/build/tmp/deploy/images/<wbr>zcu1=
02-zynqmp/Image--4.6-<wbr>xilinx-v2016.4+git0+<wbr>2762bc9163-r0-zynqmp-zcu=
102-<wbr>revB-20170306094246.dtb<br>
&gt; -device loader,addr=3D0xfd1a0104,data=3D<wbr>0x8000000e,data-len=3D4 -=
drive<br>
&gt; file=3D/media/pello/5A08-C4B7/<wbr>zynqmp_master.img,if=3Dsd,<wbr>form=
at=3Draw,index=3D0-boot<br>
&gt; mode=3D3<br>
&gt; qemu-system-aarch64: -drive<br>
&gt; file=3D/media/pello/5A08-C4B7/<wbr>zynqmp_master.img,if=3Dsd,<wbr>form=
at=3Draw,index=3D0-boot:<br>
&gt; unsupported machine type<br>
&gt; Use -machine help to list supported machines<br>
&gt; pello@pello-VirtualBox:/opt/<wbr>yocto_GE/yocto_master/poky/<wbr>build=
$<br>
&gt;<br>
&gt; What can I do?<br>
<br>
</span>Make sure you are using the correct qemu-system-aarch64 binary. By<b=
r>
default the qemu built that is in the images recipe-sysroot/usr/bin/<br>
is the mainline qemu, but you want the qemu-xilinx one. If you are<br>
building meta-xilinx with zcu102-zynqmp (presumably master), you will<br>
need to dive one level deeper to use<br>
usr/bin/qemu-xilinx/qemu-<wbr>system-aarch64.<br>
<br>
Regards,<br>
Nathan<br>
</blockquote></div><br></div>

--94eb2c04f89a40e2fe054ab0db06--
