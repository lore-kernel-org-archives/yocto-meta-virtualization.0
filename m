Return-Path: <supritisingh08@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 062C2E00C49; Thu, 18 Feb 2016 07:04:49 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (supritisingh08[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.217.180 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 662ECE00C41
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Feb 2016 07:04:44 -0800 (PST)
Received: by mail-lb0-f180.google.com with SMTP id bc4so30105690lbc.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Feb 2016 07:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=LxEG43Wz5jzCeK4oxV/i4g2sij+iL2CbvofhEIfgVZ4=;
	b=OBE/52lqm1G0xZy3Osk8O9vPCHHALeDOrl6al6GUS/0m1//V/bNAqTc8hgm+hte39q
	neEnnvTtdYFAKRIRDDnRnicrTej0CzgSp+wN3eE8bfsf1L1W4Cua9P/TnDqkIR8izc6Z
	YoyDdIC/tMDtmmMluRjLdLLvsnaScgJeqeiotxpw5uMvCqhyDAooJ2TOdLeGktQvt2LA
	JS2d1DSHBiaRKOd0tpjmLv1ReD4HUQnNf0HrjkTslFC5gkoLHpuCMmtzxjzVJOlFHHsc
	0GiZ2oM3Zu+l7boLAHZ3VNx7B8GRt+97t9t5GBW0EdllJUL5Fd4Fiu6oV1LbZ6E8dCij
	CBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=LxEG43Wz5jzCeK4oxV/i4g2sij+iL2CbvofhEIfgVZ4=;
	b=RRt/ox2yyaEn+dmAtJy1cNKJZ4bz7uqir/U2fNoSciLlL80f/8hm5LeW+Fr6euihsN
	d0mtNk7uJ6XqXZOhDDfkD1wpau4l+T49sBBbaBPQHV8Y6FDUUX3wCBbTjtOqJffCBKW8
	0+h9cE9ECye1JpHZOf+woo1Vsc3YWqHDN5ZDWY0tdgluuzz21EGqTHf+SVcxlL5/eh0K
	I2WciVn3TdgrVvkHUYBHb0BPETyqpbPDKGolUewxv7OVyPmwyv/tFR8eOpxtZpQWq4pN
	FOgqVZHkXmuRdVag/RpATZFieuQlxMQjWqAhdw29EDBOTveo0KhVaI95ZifC5WSbjTmH
	oHXg==
X-Gm-Message-State: AG10YOQWbMnJrAarFIL+w5G3zfZwNDg8tE37frQOi3NhB/FlQKgOJzGIsyQXYEbItZVesEec5ObrMTGUiqfClA==
MIME-Version: 1.0
X-Received: by 10.112.35.162 with SMTP id i2mr3321139lbj.107.1455807883454;
	Thu, 18 Feb 2016 07:04:43 -0800 (PST)
Received: by 10.114.78.195 with HTTP; Thu, 18 Feb 2016 07:04:43 -0800 (PST)
Date: Thu, 18 Feb 2016 16:04:43 +0100
Message-ID: <CAO1oV+eb1+nT+UyP+bT=x_ebi6CptDvxd6h0r3m+RW6eNaimMQ@mail.gmail.com>
From: Supriti Singh <supritisingh08@gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: MinnowBoard Max Hardware Virtualization
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
X-List-Received-Date: Thu, 18 Feb 2016 15:04:49 -0000
Content-Type: multipart/alternative; boundary=001a11c36b66c134b9052c0cafc5

--001a11c36b66c134b9052c0cafc5
Content-Type: text/plain; charset=UTF-8

Hello,

I compiled the latest version of yocto with meta-virtualization layer for
Minnowboard Max.

MbMax have hardware virtualization support,

grep vmx /cpu/procinfo shows the vmx flags.

But when I boot the board, dmesg|grep kvm shows "kvm: no hardware support".

I do see kvm loaded as module. Is there some other settings that I need to
switch on, so that kvm understands that the hardware has the correct
virtualization support.

Or could it be just the UEFI thats disabling it?

modinfo kvm-intel gives the following output
filename:
/lib/modules/4.1.15-yocto-standard/kernel/arch/x86/kvm/kvm-intel.ko
license:        GPL
author:         Qumranet
alias:          cpu:type:x86,ven*fam*mod*:feature:*0085*
depends:        kvm
intree:         Y
vermagic:       4.1.15-yocto-standard SMP preempt mod_unload
parm:           vpid:bool
parm:           flexpriority:bool
parm:           ept:bool
parm:           unrestricted_guest:bool
parm:           eptad:bool
parm:           emulate_invalid_guest_state:bool
parm:           vmm_exclusive:bool
parm:           fasteoi:bool
parm:           enable_apicv:bool
parm:           enable_shadow_vmcs:bool
parm:           nested:bool
parm:           pml:bool
parm:           ple_gap:int
parm:           ple_window:int
parm:           ple_window_grow:int
parm:           ple_window_shrink:int
parm:           ple_window_max:int

Thanks,
Supriti

--001a11c36b66c134b9052c0cafc5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div>I compiled the latest vers=
ion of yocto with meta-virtualization layer for Minnowboard Max.=C2=A0<div>=
<div><br></div><div>MbMax have hardware virtualization support,=C2=A0</div>=
<div><br></div><div>grep vmx /cpu/procinfo shows the vmx flags.=C2=A0</div>=
<div><br></div><div>But when I boot the board, dmesg|grep kvm shows &quot;k=
vm: no hardware support&quot;.</div><div><br></div><div>I do see kvm loaded=
 as module. Is there some other settings that I need to switch on, so that =
kvm understands that the hardware has the correct virtualization support.</=
div><div><br></div><div>Or could it be just the UEFI thats disabling it?=C2=
=A0</div><div><br></div><div>modinfo kvm-intel gives the following output</=
div><div><div>filename: =C2=A0 =C2=A0 =C2=A0 /lib/modules/4.1.15-yocto-stan=
dard/kernel/arch/x86/kvm/kvm-intel.ko</div><div>license: =C2=A0 =C2=A0 =C2=
=A0 =C2=A0GPL</div><div>author: =C2=A0 =C2=A0 =C2=A0 =C2=A0 Qumranet</div><=
div>alias: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu:type:x86,ven*fam*mod*:feat=
ure:*0085*</div><div>depends: =C2=A0 =C2=A0 =C2=A0 =C2=A0kvm</div><div>intr=
ee: =C2=A0 =C2=A0 =C2=A0 =C2=A0 Y</div><div>vermagic: =C2=A0 =C2=A0 =C2=A0 =
4.1.15-yocto-standard SMP preempt mod_unload=C2=A0</div><div>parm: =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vpid:bool</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 flexpriority:bool</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ept:bool</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unrestr=
icted_guest:bool</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eptad:b=
ool</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 emulate_invalid_gues=
t_state:bool</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmm_exclusi=
ve:bool</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fasteoi:bool</di=
v><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enable_apicv:bool</div><div=
>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enable_shadow_vmcs:bool</div><div=
>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nested:bool</div><div>parm: =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pml:bool</div><div>parm: =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ple_gap:int</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ple_window:int</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pl=
e_window_grow:int</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ple_wi=
ndow_shrink:int</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ple_wind=
ow_max:int</div></div><div><br></div><div>Thanks,</div><div>Supriti=C2=A0</=
div><div><div><br></div></div></div></div>

--001a11c36b66c134b9052c0cafc5--
