Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5D389E00D30; Thu, 28 Sep 2017 13:01:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.194 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.194 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 508B5E00CD0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 28 Sep 2017 13:01:05 -0700 (PDT)
Received: by mail-qk0-f194.google.com with SMTP id d70so1730687qkc.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 28 Sep 2017 13:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CDRQjkwRuoTdqjAhEk7OJ7w1UAS+s5ntFyt93irO2e0=;
	b=InJ7RL3KltzkIanL9rHXl8e4XFE26dKnIeE4z5LpENDoOxZ2KMuijbxpUzJhttUIK0
	R13xHZwT6lcOcp/XaHeg7LlZCDUX6mfa2fqj53xfdBGyn3TIyJ5SSrzXVbbz8RR02rKA
	7XOMH4uGF5l7V8ZzZLsWOQSQchc+Pq+aBWcUuLYJNSXMwBvJQJoHkwP7S2YZQU1j7xXS
	y+nrK0WEPLw+eIMAZQs3Un6/T/prnTW5r/GBu2JD5nhlxVlufckjiSEaaW3PBKutcLDb
	REu3CKEqYMJfHplxVy6X5r+hTUiEDbgfJNLAGSRz6EkKLl8nEngd2CtE+tbwuIo730aM
	lGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CDRQjkwRuoTdqjAhEk7OJ7w1UAS+s5ntFyt93irO2e0=;
	b=g7rK6JfR44TvPK3B/jd8mvgYyarDFhaJoDlgfPfGT35bgU+8lvtxMLCPxOq3tEncPS
	puhDKTHajw66vb+cqloto49kDzeFAb3l7AVObXOAzFPqi4e65iGgiz03Xqmsu3GlsGyf
	hcdQgfUA/lHchz5Le/BFXHJIoNvq0MBWvB9R+OkXyB8h+GuIAfF936sVzUMfFrrqKXKe
	HGz4yXNf9FisDTFOyZxBzm+D1kgmN3MJpfzKYC1XMsJuw1Ki6oXGOkDzag/f50hNK4oK
	C1xh98Yq+D1CjOVlCIHsQ9jeiFp3vbtEIOsAVvJe+VEiYFu7h9rSsmTeBoXpFYCBzOWN
	zyOw==
X-Gm-Message-State: AMCzsaW7F+t5JMdsZWQzVcd13+lwpnNV8jiW82fwh0Iwt1rpBaHWIIy6
	ZuxavNd89ErRAkZ0EUw1hqEXZMgOgy5+10LQH14=
X-Google-Smtp-Source: AOwi7QDZ9LeTjO01GsnzSp44Hjfy0Ncfrz15HZcUqM+ZGBL4LSRNT4MQ84MRjM1DDDTfZz8RJ2+OrTwaAOANjSjHvaE=
X-Received: by 10.233.232.8 with SMTP id a8mr90808qkg.265.1506628864677; Thu,
	28 Sep 2017 13:01:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.148.104 with HTTP; Thu, 28 Sep 2017 13:01:04 -0700 (PDT)
In-Reply-To: <ed40284d-63df-633f-c933-2f24454ef264@windriver.com>
References: <20170926033105.15731-1-Qi.Chen@windriver.com>
	<20170926033105.15731-2-Qi.Chen@windriver.com>
	<CACMJ4Gawh22qtGgedcpZbkOC2=MM7fQHFT5MV-v26gbxWe=BeA@mail.gmail.com>
	<CADkTA4OTUxuz4BX4ZssAJptoapkHO9GMW83C6pVgFM=JTuLAsA@mail.gmail.com>
	<ed40284d-63df-633f-c933-2f24454ef264@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 28 Sep 2017 16:01:04 -0400
Message-ID: <CADkTA4NrJ0MQPBak23Foom5kPh4pfBt9t=bKaKZLx1VD3YUzTA@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH V3 2/3] linux-yocto: make bbappend have effect conditionally
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
X-List-Received-Date: Thu, 28 Sep 2017 20:01:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 27, 2017 at 10:47 PM, ChenQi <Qi.Chen@windriver.com> wrote:
> On 09/27/2017 08:43 PM, Bruce Ashfield wrote:
>
>
>
> On Tue, Sep 26, 2017 at 4:57 PM, Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
>>
>> On Mon, Sep 25, 2017 at 8:31 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
>> > Make these bbappend files to take effect only when DISTRO_FEATURES
>> > contain 'virtualization'. Otherwise, we would meet failure failure
>> > at system booting up qemux86. Related logs are as below.
>> >
>> >  systemd-modules-load[113]: Failed to insert 'kvm_amd': Operation not
>> > supported
>> >  systemd-modules-load[113]: Failed to insert 'kvm_intel': Operation not
>> > supported
>> >
>> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ...
>> > diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc
>> > b/recipes-kernel/linux/linux-yocto_virtualization.inc
>> > new file mode 100644
>> > index 0000000..8b296d7
>> > --- /dev/null
>> > +++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
>> > @@ -0,0 +1,20 @@
>> > +FILESEXTRAPATHS_prepend := "${THISDIR}/linux-yocto:"
>> > +
>> > +SRC_URI += "file://xt-checksum.scc \
>> > +            file://ebtables.scc \
>> > +           file://vswitch.scc \
>> > +           file://lxc.scc \
>> > +            file://docker.scc \
>> > +           "
>> > +KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
>> > +
>> > +KERNEL_MODULE_AUTOLOAD += "openvswitch"
>> > +KERNEL_MODULE_AUTOLOAD += "kvm"
>> > +KERNEL_MODULE_AUTOLOAD += "kvm-amd"
>> > +KERNEL_MODULE_AUTOLOAD += "kvm-intel"
>> > +
>> > +# aufs kernel support required for xen-image-minimal
>> > +KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES',
>> > 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
>> > +
>> > +# xen kernel support
>> > +SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '
>> > file://xen.scc', '', d)}"
>> > --
>> > 2.11.0
>> >
>> > --
>>
>> Suggestion for a preferred change: make the KVM features depend on
>> DISTRO_FEATURES containing 'kvm', in the same way that the Xen
>> features do for DISTRO_FEATURES containing 'xen'.
>>
>> Here's why: those KVM kernel modules are not of interest on Xen
>> systems. With this change, you're removing the KVM features from the
>> qemu build to solve your bug in hand, by making it conditional on
>> 'virtualization', but is still leaves them present when only Xen is
>> needed.
>>
>> With that change, I'm not sure whether a 'virtualization' disto
>> feature is immediately useful. It could make sense for features that
>> are hypervisor-agnostic but I don't have an immediate example to point
>> to.
>
>
> I like the suggestion as well. I'd like to future proof this a bit, and we
> should keep the
> virtualization feature around, but make the KVM features depend on kvm in
> the
> DISTRO_FEATURES. Less churn on distro flags is a good thing.
>
> Chen Qi, can you rework the check and warning message to reflect that 'kvm'
> is the distro feature to set ?
>
> Bruce
>
>
> Hi Bruce and Christopher,
>
> The status of 'kvm' in yocto (in specific, oe-core layer) is a little
> different from that of 'xen'.
>
> 'xen' has been accepted as a distro feature, and the qemu recipe deals with
> it like below.
> meta/recipes-devtools/qemu/qemu.inc:
> ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
> meta/recipes-devtools/qemu/qemu.inc:PACKAGECONFIG[xen] =
> "--enable-xen,--disable-xen,xen,xen-libxenstore xen-libxenctrl
> xen-libxenguest"
>
> However, for 'kvm', things are different.
> It's enabled by default for the qemu (native, nativesdk and target) like
> below.
> PACKAGECONFIG ??= " \
>         fdt sdl \
>         fdt sdl kvm \
>         ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
>         "
> PACKAGECONFIG_class-native ??= "fdt alsa kvm"
> PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm"
> PACKAGECONFIG[kvm] = "--enable-kvm,--disable-kvm"
> To make things more complicated, our runqemu script, and the related oeqa
> parts also deal with the 'kvm' parameter.
>
> When talking about 'kvm' above, I'm talking about it from the view of
> treating 'kvm' as a distro feature. I know that enabling kvm for qemu and
> enabling kvm related configs for kernel are two different things, although
> they are somewhat related.
>
> Given the above situation, I'd like to suggest we don't deal with 'kvm' in
> meta-virtualization for now.
> I'll find time to see if we can make 'kvm' as a distro feature in oe-core.
> And we deal with 'kvm' in this layer after that.

I'm actually not concerned about the oe-core part for now, getting this name
into meta-virt correctly .. the first time .. is my concern. I don't
want to only use
'virtualization' now, and then switch it later to match a new (more widely
used) KVM distro feature.

I had forgotten about the xen distro feature, and now that it has been pointed
out, calling this 'virtualization' while it only impacts KVM build
options to the
kernel, doesn't make sense.

So at a minimum, the kernel module autoload of kvm* should look for a kvm
distro feature, but having the .inc included via the general 'virtualization'
distro feature is still fine. Within the .inc, we have the xen and kvm
differences
.. which is fine.

Bruce

>
> Best Regards,
> Chen Qi
>
>
>
>>
>>
>> Christopher
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at
> its end"
>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

