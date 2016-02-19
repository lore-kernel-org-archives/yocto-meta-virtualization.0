Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A420CE00D46; Fri, 19 Feb 2016 07:29:01 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [74.125.82.53 listed in list.dnswl.org]
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 33575E00D37
	for <meta-virtualization@yoctoproject.org>;
	Fri, 19 Feb 2016 07:28:56 -0800 (PST)
Received: by mail-wm0-f53.google.com with SMTP id b205so73030982wmb.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 19 Feb 2016 07:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:cc;
	bh=zpGKT8U9aRGk1N5yP8piEQUCLeLlxvSckQHJ0NJGNUU=;
	b=NCrmQcp4a2pbwBiu5cwTRkkgyt0A0kWOFkqa/WFmXe78c5lHIgdQUIija4X9T12ZBp
	mddd82uzFqS1COHTjnZ8KerTyyBL5I+kl/kuRCUSc6ypnavEbdMklj3OSTEfzGcXkVQ5
	PI3KN7I5uVwDBI9NbJMI/nQW8E1LGbTdJCKgM+pyumgoQSC6w6WxbgFHFYt9TAeroBk4
	CccBXOkhU3kU2OzOqEbY79r4x1IkKvnuEdR4jP8WeS+npnRspXtffZeANNfcSBVEg638
	9AC7oTr5Cih0UD+BtSgf5g1cMBW29Wi02HgYh8rq28d/kGniuSoj857CjliGeECrmyje
	P/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:date:message-id:subject:from:to:cc;
	bh=zpGKT8U9aRGk1N5yP8piEQUCLeLlxvSckQHJ0NJGNUU=;
	b=JDyKQiSybHtAmNCC29H2/IVwFi6Sc8etwKYTVz53+YkPrr1bwk+t3E4AEKAAaPxD5o
	3pS1oyKFysWyV+WCRve6Xleub35VrydtTavZmfVhR3Or1zS/B7cqUqomn+sjFsjLzM+4
	Kx/4p+AgLy66v1cAf4fBsbpI4bYjjMyoTUaBB9DAUgZ8kSK4k4dZvoB1BmxY3WEXfX9m
	4PzjztTtqNFbemXaacCD87X9wy8ioaar+K7Sjhid5/nQoyC3hl6MAXh/X7j5ChPTT09l
	YHbo7OHm/MIlGXT3v31393uBSquJ8WzuoNogT9Ntm+s9mt3dd7FKmcUXsBURUnYajqEy
	IjLw==
X-Gm-Message-State: AG10YOQKd1Lx3/ldcNdzD/1djNr3ETzPtz4B8nQL2uFCGlzfZ6No8JIstKGodyl4YEn035OHtBeagL/2Y3ImjQ==
MIME-Version: 1.0
X-Received: by 10.28.156.199 with SMTP id f190mr9439536wme.83.1455895736221;
	Fri, 19 Feb 2016 07:28:56 -0800 (PST)
Sender: asselsm@gmail.com
Received: by 10.194.203.130 with HTTP; Fri, 19 Feb 2016 07:28:56 -0800 (PST)
In-Reply-To: <CAO1oV+cJzvDGcTrJ-C3ivrTBddOS7SSUx=NwStAwS_OHrYAMrg@mail.gmail.com>
References: <CAO1oV+eb1+nT+UyP+bT=x_ebi6CptDvxd6h0r3m+RW6eNaimMQ@mail.gmail.com>
	<CAO1oV+cJzvDGcTrJ-C3ivrTBddOS7SSUx=NwStAwS_OHrYAMrg@mail.gmail.com>
Date: Fri, 19 Feb 2016 10:28:56 -0500
X-Google-Sender-Auth: 4kfASbx5_PMFu0c1PI2empoqC_Q
Message-ID: <CAPuovEJUV_cZcr8xSNEmWA2qsRvMT+JVCPRnE_jtiSGh48-s=A@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Supriti Singh <supritisingh08@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: MinnowBoard Max Hardware Virtualization
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
X-List-Received-Date: Fri, 19 Feb 2016 15:29:01 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 19, 2016 at 8:11 AM, Supriti Singh <supritisingh08@gmail.com> wrote:
> I checked the IA32_FEATURE_CONTROL and its value is 5.
>
> So my guess is its somehow the kvm yocto which is not right.

There would be no changes in the kernel around KVM, at least it is
highly unlikely. Is 'lscpu' available in your rootfs? what does it
report for Virtualization? Failing this I would change kvm and
kvm-intel to be built as modules, this will allow you to unload/load
them and open the possibility for you to up the verbosity of the
kernel logging or instrumenting the support check with additional
printks.

Mark


>
>
>
> On Thu, Feb 18, 2016 at 4:04 PM, Supriti Singh <supritisingh08@gmail.com>
> wrote:
>>
>> Hello,
>>
>> I compiled the latest version of yocto with meta-virtualization layer for
>> Minnowboard Max.
>>
>> MbMax have hardware virtualization support,
>>
>> grep vmx /cpu/procinfo shows the vmx flags.
>>
>> But when I boot the board, dmesg|grep kvm shows "kvm: no hardware
>> support".
>>
>> I do see kvm loaded as module. Is there some other settings that I need to
>> switch on, so that kvm understands that the hardware has the correct
>> virtualization support.
>>
>> Or could it be just the UEFI thats disabling it?
>>
>> modinfo kvm-intel gives the following output
>> filename:
>> /lib/modules/4.1.15-yocto-standard/kernel/arch/x86/kvm/kvm-intel.ko
>> license:        GPL
>> author:         Qumranet
>> alias:          cpu:type:x86,ven*fam*mod*:feature:*0085*
>> depends:        kvm
>> intree:         Y
>> vermagic:       4.1.15-yocto-standard SMP preempt mod_unload
>> parm:           vpid:bool
>> parm:           flexpriority:bool
>> parm:           ept:bool
>> parm:           unrestricted_guest:bool
>> parm:           eptad:bool
>> parm:           emulate_invalid_guest_state:bool
>> parm:           vmm_exclusive:bool
>> parm:           fasteoi:bool
>> parm:           enable_apicv:bool
>> parm:           enable_shadow_vmcs:bool
>> parm:           nested:bool
>> parm:           pml:bool
>> parm:           ple_gap:int
>> parm:           ple_window:int
>> parm:           ple_window_grow:int
>> parm:           ple_window_shrink:int
>> parm:           ple_window_max:int
>>
>> Thanks,
>> Supriti
>>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

