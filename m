Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 05219E01653
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Oct 2013 20:34:45 -0700 (PDT)
Received: by mail-lb0-f178.google.com with SMTP id z5so2972476lbh.9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Oct 2013 20:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=MnPAhskK9FMFi+5M86u5TpQllM6Lz1oJUrsM+fGM5So=;
	b=tEIOF77/+FxZQZ1sPA5w+gzSIWR8yo/xQs8N6sH06x4QUihBQ46YEImdgSUiOYvkCG
	WtvKylib5XalQMuRkENdk70adubIw47BqNqwbL9TCeRL9WsSeBM3Ac/Yg0TeKXw0JzvN
	OWTHpsDuMlbAI+7LhTfFXUnBq27rAzeHgLmINYHpxMRmSJtw4G3Klg4GHWX/UsjghZJz
	uYWFzElz9ClK/Wb8GC3CqQL8ky4TqfRT/lYUwmi2Gfakp+dvjfjSJJxgVOnA854GlR+C
	8Wmgk60yIfzWMWmxycQFu9MLgPS4owNIkq2Ii0A248KiVOBfs3Q9+B+2CJSVZXIT3K/V
	heoA==
MIME-Version: 1.0
X-Received: by 10.112.168.35 with SMTP id zt3mr14700974lbb.11.1381462484236;
	Thu, 10 Oct 2013 20:34:44 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Thu, 10 Oct 2013 20:34:44 -0700 (PDT)
In-Reply-To: <1381371771-12021-1-git-send-email-cjp256@gmail.com>
References: <1381371771-12021-1-git-send-email-cjp256@gmail.com>
Date: Thu, 10 Oct 2013 23:34:44 -0400
Message-ID: <CADkTA4PUpuVhh28WFetFChKapQvZ8ym4D+EvmgadX-3u93=CoA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2 0/3] Xen guest support
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
X-List-Received-Date: Fri, 11 Oct 2013 03:34:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 9, 2013 at 10:22 PM, Chris Patterson <cjp256@gmail.com> wrote:
> This patch set supercedes:
> [meta-virtualization][PATCH] xen-guest-image-minimal: example image for a PV/HVM/PVHVM xen guest built with the 'xen-guest' kernel fragment.
> [meta-virtualization][PATCH] linux-yocto: Add xen guest kernel fragment support for PV/HVM guests, using 'xen-guest' distro flag.
>
> v1 -> v2:
> Consolidates xen-guest.cfg and xen.cfg into a single fragment that should be more consistent with typical yocto fragments and satisfies requirements for different types of xen guests.
> Simplified xen-guest-image-minimal to simply append console=hvc0 kernel argument instead of the special syslinux config handling.

Chris,

I grabbed and merged these three, plus the outstanding patches from your
other series. I very well could have missed something, so if i have, resend
them and I'll get them merged right away.

Bruce

>
> Chris Patterson (3):
>   linux-yocto/xen: update fragment to support both dom0 and typical xen
>     guests.
>   xen-image-minimal: update image installed modules to reflect xen
>     fragment changes.
>   xen-guest-image-minimal: add minimal xen guest image.
>
>  recipes-extended/images/xen-guest-image-minimal.bb | 16 ++++++++++++++++
>  recipes-extended/images/xen-image-minimal.bb       |  6 ------
>  recipes-kernel/linux/linux-yocto/xen.cfg           | 13 ++++++-------
>  recipes-kernel/linux/linux-yocto/xen.scc           |  4 ++--
>  recipes-kernel/linux/linux-yocto_3.10.bbappend     |  2 +-
>  recipes-kernel/linux/linux-yocto_3.4.bbappend      |  2 +-
>  recipes-kernel/linux/linux-yocto_3.8.bbappend      |  2 +-
>  7 files changed, 27 insertions(+), 18 deletions(-)
>  create mode 100644 recipes-extended/images/xen-guest-image-minimal.bb
>
> --
> 1.8.4.rc3
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

