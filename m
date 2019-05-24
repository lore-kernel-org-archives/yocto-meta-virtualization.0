Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D85F9E00CAB; Fri, 24 May 2019 16:23:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.210.67 listed in list.dnswl.org]
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40F3CE00A96
	for <meta-virtualization@yoctoproject.org>;
	Fri, 24 May 2019 16:23:31 -0700 (PDT)
Received: by mail-ot1-f67.google.com with SMTP id j49so10116730otc.13
	for <meta-virtualization@yoctoproject.org>;
	Fri, 24 May 2019 16:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
	:from:date:message-id:subject:to:cc;
	bh=6dgAOcVneDVXPONe77UKO0eioZlJT54daST/sBabrJ4=;
	b=ZAe5JA43OUPLTcsG/w6RohWc84fpb/I3w1UzipvDa0+IbA/3QlfqkcfgkZF8pMMEHd
	6Mdzlt7gGAJV7h5eHgH7FZ2+rJskq+3VpeNOMUrBr7flaVpmDTq/p6RTTRGfVkGj9s1X
	a9cUkhlZThoTn21tabxm4yvBefrgi6sK7kd3iZ3L3ulPFagRbcFX20GFDnTci2nKJIp2
	FpumQl0vyqFlnJIPExJKHnOCpIJG9qWBHiDF/z/I1TcHZa2vwS4PE/oO60vhl1vng/BS
	q+AfFqAKOAfdhHmM/Yy/vRBAMTY7e2FqEIBzQwDzSxH7dpxFgq8XHSIMhv0ApQRWXkO1
	oQkQ==
X-Gm-Message-State: APjAAAU5xGfINwtY/1E008IL84xxLbi/KreuPDYUk09n0+6jTPHlMM4H
	EhBh1TXfVcA72xIHZ35zBCqio93YUwGpfBAn+WI=
X-Google-Smtp-Source: APXvYqzN7Vxe+ZNziVGAGOUJplbW63vCTUufcgxb6UxWqrHMLz1lpn2Es2BjVsmiCiMMO78m759a+qNbjOe/alnizTs=
X-Received: by 2002:a9d:5c19:: with SMTP id o25mr34504939otk.176.1558740210419;
	Fri, 24 May 2019 16:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <1557936398-36529-1-git-send-email-hongxu.jia@windriver.com>
	<CADkTA4MbPAADy96fnMMDFPwDfMWeQ9vO=PRUx=Qu8xZHccLuTw@mail.gmail.com>
In-Reply-To: <CADkTA4MbPAADy96fnMMDFPwDfMWeQ9vO=PRUx=Qu8xZHccLuTw@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Fri, 24 May 2019 19:23:18 -0400
Message-ID: <CAPuovE+Hx0g0JF54XCTEeqB2_Vnznii0nTAq3vP17UgrHcogrg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libvirt: fix Nothing PROVIDES 'numactl' on ARM
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
X-List-Received-Date: Fri, 24 May 2019 23:23:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 21, 2019 at 10:40 AM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
>
>
> On Wed, May 15, 2019 at 12:07 PM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>>
>> ARM does not currently support NUMA, and defines COMPATIBLE_HOST in recipe
>> numactl
>>
>> Since commit [b5b5def libvirt: add hook support] applied, it failed with
>> Nothing PROVIDES 'numactl' on ARM BSP, not all BSP define var-KARCH but
>> define var-TARGET_ARCH
>>
>> So check var-TARGET_ARCH, and add numactl to PACKAGECONFIG conditionally
>>
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>  recipes-extended/libvirt/libvirt_5.3.0.bb | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/recipes-extended/libvirt/libvirt_5.3.0.bb b/recipes-extended/libvirt/libvirt_5.3.0.bb
>> index 30bb44c..a949e8f 100644
>> --- a/recipes-extended/libvirt/libvirt_5.3.0.bb
>> +++ b/recipes-extended/libvirt/libvirt_5.3.0.bb
>> @@ -189,9 +189,17 @@ PACKAGECONFIG ??= "qemu yajl openvz vmware vbox esx iproute2 lxc test \
>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit libcap-ng', '', d)} \
>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'libxl', '', d)} \
>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'polkit', '', d)} \
>> -                   ${@bb.utils.contains('KARCH', 'arm', '', 'numactl', d)} \
>> +                   ${@support_numactl(d)} \
>>                    "
>>
>> +def support_numactl(d):
>> +    targetarch = d.getVar("TARGET_ARCH")
>> +    # ARM does not currently support NUMA
>> +    if targetarch.startswith("arm"):
>> +        return ""
>> +
>> +    return "numactl"
>> +
>
>
> Checking TARGET_ARCH is definitely the right thing to use for this.
>
> But out of curiosity, why can't we change it to work the same as the qemu PACKAGECONFIG setting ?
>
> i.e. PACKAGECONFIG_remove_arm = "numactl"
> PACKAGECONFIG_remove_arm64 = "numactl"
>
> (or whatever the ARM64 target arch maps to).
>

Agreed. We should be using the overrides mechanism whenever possible.

MarkA

> Bruce
>
>
>>
>>  # qemu is NOT compatible with mips64
>>  PACKAGECONFIG_remove_mipsarchn32 = "qemu"
>>  PACKAGECONFIG_remove_mipsarchn64 = "qemu"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

