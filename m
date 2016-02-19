Return-Path: <supritisingh08@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 077E6E00D2E; Fri, 19 Feb 2016 05:11:46 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B512DE00D0A
	for <meta-virtualization@yoctoproject.org>;
	Fri, 19 Feb 2016 05:11:34 -0800 (PST)
Received: by mail-lb0-f180.google.com with SMTP id bc4so46690788lbc.2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 19 Feb 2016 05:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=TNIfBbvYE1RupGFDxnjsfQgfC4A+jHBh+6YpOVYCxO4=;
	b=diIVcbkCf0kSAjlsx5YuqffL37zDU0edJXspsye2cL1lKzdbW50BIUVdNSjJIl9+0Y
	9QlHnmxaB2by8n0fKinh1Z+edzM0SffXt35+QYPKHlFeG1azzMBRXbBIm4XxDutfvfdW
	vHhjBYkpKllziMVtLhJhYnMJKTanXK1bEDnINtTTfVPIAecdDVG91+PxUJfMAxh2z7JZ
	oouFaoTWaER4iA4c57/Y2xWRLaP8w71dI7JqlbGwW2FFQpGRbtke+07m6jRPpxV5qwjo
	nQNQNnQp79OJqtLxUxGcMa+Ifble/LENP6Q4robhKkl1vu4mTLUJpvL0nhCQoXKYnjpP
	XbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=TNIfBbvYE1RupGFDxnjsfQgfC4A+jHBh+6YpOVYCxO4=;
	b=e6ssU0dc00Lk0M4kM1P6Ly3v/aXpGp3jeafi/uY7rmS4ZYnjUmZ26Z/vy9W4WXcsl5
	mNAejimTYEpVv8lyTkiDtPmmNEi3gi5w/Imqv/bv1s2Khsgf9yqqMlLxOe/pPm767VuL
	1QPb3IXs03Z+9eiDu1XFS8Xs3QZTGhx40R3YGBnuAtEngl0afQ1vXNapb2P5L/1ZWOSO
	OGb9FXZ/hFmZbsjy+AX5D6mxvT0cadDj38/GNk5UsjQeSb1KIbJyQVLyVrLS1aIOGicD
	2W4drtadcqWmfq7Qws00x/cT2+6db/1KTZsT580ZhM4bbMDY28lktpnFwqCjiNCGyiIp
	yDsw==
X-Gm-Message-State: AG10YOQHjd4ojCiCftATIuAyAUZfJrfSTSNLAq4l6CVcnLLrnFh1qXnHyXuf7vVRF3pjQPjlbsKaperwm2Ubuw==
MIME-Version: 1.0
X-Received: by 10.112.78.33 with SMTP id y1mr5103007lbw.62.1455887492638; Fri,
	19 Feb 2016 05:11:32 -0800 (PST)
Received: by 10.114.78.195 with HTTP; Fri, 19 Feb 2016 05:11:32 -0800 (PST)
In-Reply-To: <CAO1oV+eb1+nT+UyP+bT=x_ebi6CptDvxd6h0r3m+RW6eNaimMQ@mail.gmail.com>
References: <CAO1oV+eb1+nT+UyP+bT=x_ebi6CptDvxd6h0r3m+RW6eNaimMQ@mail.gmail.com>
Date: Fri, 19 Feb 2016 14:11:32 +0100
Message-ID: <CAO1oV+cJzvDGcTrJ-C3ivrTBddOS7SSUx=NwStAwS_OHrYAMrg@mail.gmail.com>
From: Supriti Singh <supritisingh08@gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: Re: MinnowBoard Max Hardware Virtualization
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
X-List-Received-Date: Fri, 19 Feb 2016 13:11:46 -0000
Content-Type: multipart/alternative; boundary=001a11c3ec10d4f15d052c1f3874

--001a11c3ec10d4f15d052c1f3874
Content-Type: text/plain; charset=UTF-8

I checked the IA32_FEATURE_CONTROL and its value is 5.

So my guess is its somehow the kvm yocto which is not right.



On Thu, Feb 18, 2016 at 4:04 PM, Supriti Singh <supritisingh08@gmail.com>
wrote:

> Hello,
>
> I compiled the latest version of yocto with meta-virtualization layer for
> Minnowboard Max.
>
> MbMax have hardware virtualization support,
>
> grep vmx /cpu/procinfo shows the vmx flags.
>
> But when I boot the board, dmesg|grep kvm shows "kvm: no hardware support".
>
> I do see kvm loaded as module. Is there some other settings that I need to
> switch on, so that kvm understands that the hardware has the correct
> virtualization support.
>
> Or could it be just the UEFI thats disabling it?
>
> modinfo kvm-intel gives the following output
> filename:
> /lib/modules/4.1.15-yocto-standard/kernel/arch/x86/kvm/kvm-intel.ko
> license:        GPL
> author:         Qumranet
> alias:          cpu:type:x86,ven*fam*mod*:feature:*0085*
> depends:        kvm
> intree:         Y
> vermagic:       4.1.15-yocto-standard SMP preempt mod_unload
> parm:           vpid:bool
> parm:           flexpriority:bool
> parm:           ept:bool
> parm:           unrestricted_guest:bool
> parm:           eptad:bool
> parm:           emulate_invalid_guest_state:bool
> parm:           vmm_exclusive:bool
> parm:           fasteoi:bool
> parm:           enable_apicv:bool
> parm:           enable_shadow_vmcs:bool
> parm:           nested:bool
> parm:           pml:bool
> parm:           ple_gap:int
> parm:           ple_window:int
> parm:           ple_window_grow:int
> parm:           ple_window_shrink:int
> parm:           ple_window_max:int
>
> Thanks,
> Supriti
>
>

--001a11c3ec10d4f15d052c1f3874
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I checked the IA32_FEATURE_CONTROL and its value is 5.=C2=
=A0<div><br></div><div>So my guess is its somehow the kvm yocto which is no=
t right.=C2=A0</div><div><br></div><div><br></div></div><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote">On Thu, Feb 18, 2016 at 4:04 PM, Sup=
riti Singh <span dir=3D"ltr">&lt;<a href=3D"mailto:supritisingh08@gmail.com=
" target=3D"_blank">supritisingh08@gmail.com</a>&gt;</span> wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><div dir=3D"ltr"><div>Hello,</div><div><br></div>=
I compiled the latest version of yocto with meta-virtualization layer for M=
innowboard Max.=C2=A0<div><div><br></div><div>MbMax have hardware virtualiz=
ation support,=C2=A0</div><div><br></div><div>grep vmx /cpu/procinfo shows =
the vmx flags.=C2=A0</div><div><br></div><div>But when I boot the board, dm=
esg|grep kvm shows &quot;kvm: no hardware support&quot;.</div><div><br></di=
v><div>I do see kvm loaded as module. Is there some other settings that I n=
eed to switch on, so that kvm understands that the hardware has the correct=
 virtualization support.</div><div><br></div><div>Or could it be just the U=
EFI thats disabling it?=C2=A0</div><div><br></div><div>modinfo kvm-intel gi=
ves the following output</div><div><div>filename: =C2=A0 =C2=A0 =C2=A0 /lib=
/modules/4.1.15-yocto-standard/kernel/arch/x86/kvm/kvm-intel.ko</div><div>l=
icense: =C2=A0 =C2=A0 =C2=A0 =C2=A0GPL</div><div>author: =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Qumranet</div><div>alias: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu:=
type:x86,ven*fam*mod*:feature:*0085*</div><div>depends: =C2=A0 =C2=A0 =C2=
=A0 =C2=A0kvm</div><div>intree: =C2=A0 =C2=A0 =C2=A0 =C2=A0 Y</div><div>ver=
magic: =C2=A0 =C2=A0 =C2=A0 4.1.15-yocto-standard SMP preempt mod_unload=C2=
=A0</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vpid:bool</div><div>=
parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flexpriority:bool</div><div>parm: =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ept:bool</div><div>parm: =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 unrestricted_guest:bool</div><div>parm: =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 eptad:bool</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 emulate_invalid_guest_state:bool</div><div>parm: =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 vmm_exclusive:bool</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 fasteoi:bool</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 enable_apicv:bool</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 en=
able_shadow_vmcs:bool</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ne=
sted:bool</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pml:bool</div>=
<div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ple_gap:int</div><div>parm: =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ple_window:int</div><div>parm: =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ple_window_grow:int</div><div>parm: =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ple_window_shrink:int</div><div>parm: =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ple_window_max:int</div></div><div><br></div><div>=
Thanks,</div><div>Supriti=C2=A0</div><div><div><br></div></div></div></div>
</blockquote></div><br></div>

--001a11c3ec10d4f15d052c1f3874--
