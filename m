Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1B206E00D2A; Tue, 26 Sep 2017 13:57:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.193 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.193 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 850DDE00CC4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Sep 2017 13:57:40 -0700 (PDT)
Received: by mail-qt0-f193.google.com with SMTP id l25so7829723qtf.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Sep 2017 13:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=N29o2E737dPIXNrd49G/qHIh7cvK7BSktlfCFaeeh6I=;
	b=gusOCuLGvzj6LbMKXHXawv8j7zfdTsdu7n6QMb2O9DMwJwPcMTDt45rEOm2u2Gbq27
	gSKENz+WcN3Oc4qi2KSVBI8MOHpaqhbE82N8+Jxrs2wQyp9VSiO3/LxIP4LZDRBEC2Uh
	raY0SYetdpFqrLT0nMevx7n3FJMjO+jN5G3oExoOQUPHEP3rRltvyktzumS4OlCO0pI5
	x2uGSxqEGlKpOWCXGvXXTy9ks4Fm2qElUZRAtg0qdwaAN0i/wYZovHN74mUtZLsJ5SD1
	s9aqzyDPpZRGik91rJZqZSR2KYEihF6N+SPI8tti+V9QbqiYE6iD6+eejyPsNson98DN
	HR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=N29o2E737dPIXNrd49G/qHIh7cvK7BSktlfCFaeeh6I=;
	b=Yv7eZ56IylN3kuWGetOljXm4CkWfvGHtQS+toApurUKVaND+5yXCnTBjbSANA7X0WJ
	Un4NtAbXLaju3ZWTWUMxv7VPItBdIhkg8CKgZFEwqO56SKvNC3nwicfi6G2YIzkFyvRH
	sQimmk054Fqx3bvj4NU6XaNQ4ExHNmYHaqSgYPZgVrIsqymhQncT+7kuBjxmK7/UNtj3
	kX6x/XCUdO8KMoexseDQjpszb+Swn4qc4gWbaqQ9W1BC1bij2rlwJLoGGW875lvs895d
	lgCn0tEoe6kHxWo3LVIy4r9ubi+Wn0A9fQL+gPwXYk+kH0zivfagU5plvg02/YgqPtzQ
	hV6g==
X-Gm-Message-State: AHPjjUhkbcoAsdi/wLA7NJgkizLu5ZRhbKtrmrrYNHJ+6sItyz1KRVZO
	3/qM5m4CFQ3flLgTVdmpUxkOE7KU1rz8sIEIWPA=
X-Google-Smtp-Source: AOwi7QCSN/joG6P3HLL49HUYp3RhuxyilAn7lJY1xECdAtPGhUBW2rWNpjOlnxopFtWQDzWtsGi7NBpuYT9D91mZJdc=
X-Received: by 10.237.37.91 with SMTP id w27mr18438176qtc.71.1506459459688;
	Tue, 26 Sep 2017 13:57:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.91.6 with HTTP; Tue, 26 Sep 2017 13:57:38 -0700 (PDT)
In-Reply-To: <20170926033105.15731-2-Qi.Chen@windriver.com>
References: <20170926033105.15731-1-Qi.Chen@windriver.com>
	<20170926033105.15731-2-Qi.Chen@windriver.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 26 Sep 2017 13:57:38 -0700
Message-ID: <CACMJ4Gawh22qtGgedcpZbkOC2=MM7fQHFT5MV-v26gbxWe=BeA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
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
X-List-Received-Date: Tue, 26 Sep 2017 20:57:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 25, 2017 at 8:31 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
> Make these bbappend files to take effect only when DISTRO_FEATURES
> contain 'virtualization'. Otherwise, we would meet failure failure
> at system booting up qemux86. Related logs are as below.
>
>  systemd-modules-load[113]: Failed to insert 'kvm_amd': Operation not supported
>  systemd-modules-load[113]: Failed to insert 'kvm_intel': Operation not supported
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
...
> diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc b/recipes-kernel/linux/linux-yocto_virtualization.inc
> new file mode 100644
> index 0000000..8b296d7
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
> @@ -0,0 +1,20 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/linux-yocto:"
> +
> +SRC_URI += "file://xt-checksum.scc \
> +            file://ebtables.scc \
> +           file://vswitch.scc \
> +           file://lxc.scc \
> +            file://docker.scc \
> +           "
> +KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
> +
> +KERNEL_MODULE_AUTOLOAD += "openvswitch"
> +KERNEL_MODULE_AUTOLOAD += "kvm"
> +KERNEL_MODULE_AUTOLOAD += "kvm-amd"
> +KERNEL_MODULE_AUTOLOAD += "kvm-intel"
> +
> +# aufs kernel support required for xen-image-minimal
> +KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
> +
> +# xen kernel support
> +SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
> --
> 2.11.0
>
> --

Suggestion for a preferred change: make the KVM features depend on
DISTRO_FEATURES containing 'kvm', in the same way that the Xen
features do for DISTRO_FEATURES containing 'xen'.

Here's why: those KVM kernel modules are not of interest on Xen
systems. With this change, you're removing the KVM features from the
qemu build to solve your bug in hand, by making it conditional on
'virtualization', but is still leaves them present when only Xen is
needed.

With that change, I'm not sure whether a 'virtualization' disto
feature is immediately useful. It could make sense for features that
are hypervisor-agnostic but I don't have an immediate example to point
to.

Christopher

