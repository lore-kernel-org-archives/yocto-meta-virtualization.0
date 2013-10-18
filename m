Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DA4B4E01700
	for <meta-virtualization@yoctoproject.org>;
	Fri, 18 Oct 2013 08:08:08 -0700 (PDT)
Received: by mail-la0-f46.google.com with SMTP id eh20so826133lab.5
	for <meta-virtualization@yoctoproject.org>;
	Fri, 18 Oct 2013 08:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=GyBzIQpweasmAHj4C6k2EhNteEGmOq8ZC4OXMrwZya0=;
	b=IKBdZQdYKzw3l3Wr4P+9YxYjM7SALgp8I2BKH/orxY7gKON66KqVsCo+3I31xooV5n
	6l0m6BPNRmmZ547DXBRGIMZsUuL1XpDLG+CJbz2XC/ayvjl37+iGtrt74mzu2Cl2q2dL
	HZC3XpjEuxqv/igrc8Jnh7TtTXro3Wz2PhmS4dDb6lfoH6p8QkadiPx5Wjp+u13Vv+fo
	1aGf88dP7sZYT8vGpEeKzfPGvNPJHApMScWLcVGJCvSSG5axrJQysV8bdSUno8YbNOhm
	F6Pl7eak0paqfGGPVQkIazd8WWNlDxaKQ+1P9dyfCKq+kGzChNKrL9XbG/7W8ykIJV7b
	h9gA==
MIME-Version: 1.0
X-Received: by 10.152.7.105 with SMTP id i9mr2890344laa.9.1382108886913; Fri,
	18 Oct 2013 08:08:06 -0700 (PDT)
Received: by 10.112.14.200 with HTTP; Fri, 18 Oct 2013 08:08:06 -0700 (PDT)
In-Reply-To: <1382035656-30349-1-git-send-email-flihp@twobit.us>
References: <1382035656-30349-1-git-send-email-flihp@twobit.us>
Date: Fri, 18 Oct 2013 11:08:06 -0400
Message-ID: <CADkTA4NEey8c9U0Pe6jQikMqEsD0TXggPCq91=Mc=mRD2GkA0g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/3] Build Xen XSM policy with 'xsm' DISTRO_FEATURE.
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
X-List-Received-Date: Fri, 18 Oct 2013 15:08:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Oct 17, 2013 at 2:47 PM,  <flihp@twobit.us> wrote:
> This patch series allows users to build the XSM policy from the Xen
> source tree. This adds a dependency on the checkpolicy compiler from
> meta-selinux layer but only if the 'xsm' DISTRO_FEATURE is present. The
> README has been updated to reflect this conditional dependency (I
> guessed at the formatting).
>
> Philip Tricca (3):
>  xen: avoid installing flask policy file as '/boot'
>  build xsm policy when 'xsm' DISTRO_FEATURE is present
>  Add note about dependency on meta-selinux to README.

Looks fine to me, I was thinking about patch 2/2 and using a variable instead
of the inline python in the configure line .. but in the end, it just
isn't worth it.

I merged the series with some minor tweaks to the shortlogs.

Bruce

>
>  README                                             |    6 +++++
>  ...lask-avoid-installing-policy-file-as-boot.patch |   26 +++++++++++++++++++
>  recipes-extended/xen/xen_4.3.0.bb                  |    9 ++++---
>  3 files changed, 38 insertions(+), 3 deletions(-)
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

