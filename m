Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0CC71E0049C
	for <meta-virtualization@yoctoproject.org>;
	Sat, 31 Aug 2013 21:01:51 -0700 (PDT)
Received: by mail-lb0-f173.google.com with SMTP id o14so2815458lbi.4
	for <meta-virtualization@yoctoproject.org>;
	Sat, 31 Aug 2013 21:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=V2vUVj+ayfOKTVTc7p2czR4pWFCa0sRMURvwkOhqfEY=;
	b=EBuYf4CsRsU443taq6prDNFv7+HIe9emNBY5ORTKXmeoLdlkgWUDVkf1+/JKD5gcXk
	r7Q6xagLgxf63srj1zyucTSan3rMoQFxZuSLx7SbaMftY4dNo+KoVExN/XDoX2Iu0899
	eRvNrzm5/E+pp0I6vTUmVWEqr4R+Wqt5UWAow7j75i0IevPmt/CIQdD38tIHwb8iLN3m
	kPjGabRonZI6qMHsi74rMAcPFGU/doVHrv1KogQZ8MAbK/m1Njhibg2yyfQ5IlP18INH
	xLTHfhwzwGEN0m916zN7OrqadK3VeYHLeoCK73/9KdhcCO2gxhkIFL11rRjeqgbTm7mG
	6M1w==
MIME-Version: 1.0
X-Received: by 10.112.42.103 with SMTP id n7mr14780179lbl.6.1378008107290;
	Sat, 31 Aug 2013 21:01:47 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Sat, 31 Aug 2013 21:01:47 -0700 (PDT)
In-Reply-To: <CABZSBQfzXc4sKVmqxHwUNM+b+kNv4OaxNVTURsujH-YLzYsFdw@mail.gmail.com>
References: <1377833844-14672-1-git-send-email-cjp256@gmail.com>
	<1377833844-14672-2-git-send-email-cjp256@gmail.com>
	<CADkTA4MAHOGDS7=8VMQQuUYDq_uGXq04WRyGqhfkVw=NBLHxOA@mail.gmail.com>
	<CABZSBQfzXc4sKVmqxHwUNM+b+kNv4OaxNVTURsujH-YLzYsFdw@mail.gmail.com>
Date: Sun, 1 Sep 2013 00:01:47 -0400
Message-ID: <CADkTA4O-OzWqQiee1HxmvkggpUzEDCYHMdKRqJbXQa_SZLjiZw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/4] linux-yocto: add kernel fragment and scc for xen dom0 kernel support.
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
X-List-Received-Date: Sun, 01 Sep 2013 04:01:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Aug 31, 2013 at 10:12 PM, Chris Patterson <cjp256@gmail.com> wrote:
> That'd be great.  There are a couple areas that could perhaps use some work,
> as the fragment is a little excessive in some of the options and/or could be
> broken up a little better, if desired.  On this topic, I have a couple
> questions that would help steer me in the right direction in the future:
>
> 1) One thing that's not immediately clear for me is the question of how to
> best handle a case where a CONFIG_XXX option may in one instance, be
> desirable to be built in - vs being a module in another?  Doing a quick test
> seems to imply the first defined instance is the one used, but I'm not sure
> if there are any well defined rules for conflict resolution.  The reason I'm
> asking is there are CONFIG_XXX=y instances in this config - some of which
> need to be built in, some required, and some just *preferably* built in for
> various use cases. Specifically CONFIG_XEN_PCIDEV_BACKEND=y provides some
> useful functionality before a module could otherwise be loaded (prevent a
> pci device from being owned by a linux driver).

It should be last through the gate that wins, which gives the fragment that
includes another one a chance to tweak and override what it doesn't like.

If you were really seeing first one being set, then something has broken and
I'll hunt it down, I never assume that something hasn't managed to break
itself, but it should still be behaving as it has before.

What you may have seen is that KERNEL_FEATURES and .scc files on a
SRC_URI are applied in a particular order. .scc files and then KERNEL_FEATURES,
so if you want to override a feature, you need to do it with another features.

So in your case, you can have that base fragment sets the requirements as
built in, that's a good start. You could then have a secondary fragment which
sets the preferable options, and more fragments that had completely optional
values. Leaving the recipes and higher level fragments to chose the mix they
want.

Alternatively, you can set them all in the single fragment like it is, and then
the including feature can always override, or from recipe space additional
features be triggered override the values.

>
> 2) The other thing I am curious about is how to negotiate the inclusion of a
> KERNEL_FEATURES which has a number of built-in bits.  The approach used by
> kvm is to effectively always enable the fragment if one is including
> meta-virtualization.  This in and of itself isn't really polluting the
> target image for those that don't want KVM, because they likely simply don't
> include the built kvm modules (ignoring CONFIG_TUN=y).  However, when you
> have the =y cases, the user of the layer doesn't have a choice without going
> through and commenting out the KERNEL_FEATURES_append...?  This was the
> reasoning I took for choosing the base_contains() functionality instead of
> just including it like the other bits (ebtables, vswitch, etc.).  Is the
> goal for the layer's linux-yocto bbappend to support a "generic" kernel (by
> default) to support all of its packages/images?

An excellent point .. and yes, a layer shouldn't really be setting
values like this
unless it was single purpose. If we have Xen and KVM both active and available
via meta-virt, then we really don't want that.

I'd convert KVM to trigger via a IMAGE or DISTRO feature as well, just as you've
done with your fragments.

Cheers,

Bruce

>
> Take care,
> -Chris



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

