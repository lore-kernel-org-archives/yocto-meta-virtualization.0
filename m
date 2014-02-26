Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9BFE4E008F9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 26 Feb 2014 11:33:23 -0800 (PST)
Received: by mail-la0-f41.google.com with SMTP id gl10so993269lab.28
	for <meta-virtualization@yoctoproject.org>;
	Wed, 26 Feb 2014 11:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=O9humQw/4KJ3XuukRJFx+mf/82SyOlmjAgBlRLWGMU8=;
	b=g7W2NJHoHyMYoFEol1EtB03NrPTUkqOf4JN9YjKhjLwkDom2iL8/0LMQLAhPt3ti2W
	C2flT5cw+EGzHrTyH69jqUcEudnlPyuPpigVtncA5Km+FU69q3W1s/1dxlGlra1Ity/G
	j5RCClcUnZfqYJw51htwMMXxg4r2uEvt4VLQskB0FvooWZJWY9IOkYEVpVFcxdlSY/f1
	vonf1xK/vysCOy9Uob38j/HowCPbtMeRSr0dlar655FF9yFEJoOwpB8hoz3+uimp5OCx
	pB9DPffY5EMTgC+PKN4nY8sTioL+yPCIzEIu5VGSNANJDKW2sUPeA/XdpbrmcaE7hhuU
	8BJA==
MIME-Version: 1.0
X-Received: by 10.112.171.67 with SMTP id as3mr3083146lbc.10.1393443201956;
	Wed, 26 Feb 2014 11:33:21 -0800 (PST)
Received: by 10.112.170.166 with HTTP; Wed, 26 Feb 2014 11:33:21 -0800 (PST)
In-Reply-To: <1393409277-17451-1-git-send-email-jonas.eriksson@enea.com>
References: <1393409277-17451-1-git-send-email-jonas.eriksson@enea.com>
Date: Wed, 26 Feb 2014 14:33:21 -0500
Message-ID: <CADkTA4OyZSxsTa3ffsqeQjRSZX+q+yEXS6TDRY6ogEkskKP7jQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Jonas Eriksson <jonas.eriksson@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/5] libvirt fixes and a kernel update
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
X-List-Received-Date: Wed, 26 Feb 2014 19:33:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 26, 2014 at 5:07 AM, Jonas Eriksson <jonas.eriksson@enea.com> wrote:
> Hi,
>
> The ultimate goal of this patch series was to use a DISTRO_FEATURE to include
> the lxc.scc configuration in the kernel to be built. This is done to avoid that
> the kernel configuration gets additional code paths ( =y options ) when adding
> the meta-virtualization layer. The configurations that enables modules are left
> untouched.

I've never been particularly concerned about the extra functionality that is
introduced when meta-virt is added, since container support (and arguably
lxc if you are doing "virtualization") is a fairly basic feature.

I'm concerned that within meta-virt we are creating an undocumented set of
DISTRO_FEATURES, and over using the concept. The items are already
controlled via PACKAGECONFIG, so users have flexibility from that point
of view.

We could also use IMAGE_FEATURES as an alternative to distro features,
since we are really only coordinating libvirt and the kernel when "lxc" is a
distro feature .. which arguably isn't distro wide.

Outside of the lxc change, everything looks pretty good, I'm going to ack
the individual patches to make it clear :)

Don't misunderstand my comments, there's no white/black answer here, I'm
just trying to spark a discussion to make sure the direction is clear
and we have
a pseudo-consensus :)

Cheers,

Bruce

>
> In this process, I stumbled upon some bugs/issues with the libvirt recipe,
> which are updated as well.
>
> Best regards,
> /Jonas
>
> Jonas Eriksson (5):
>   libvirt: Change license to LGPLv2.1+
>   libvirt: Fix selinux DISTRO_FEATURE check
>   Use a DISTRO_FEATURE to toggle LXC support
>   libvirt: Use DISTRO_FEATURES to enable Xen support
>   libvirt: Disable polkit driver when there is no x11
>
>  recipes-extended/libvirt/libvirt_1.2.1.bb      | 14 +++++++++-----
>  recipes-kernel/linux/linux-yocto_3.10.bbappend |  4 +++-
>  recipes-kernel/linux/linux-yocto_3.4.bbappend  |  4 +++-
>  recipes-kernel/linux/linux-yocto_3.8.bbappend  |  4 +++-
>  4 files changed, 18 insertions(+), 8 deletions(-)
>
> --
> 1.9.rc1
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

