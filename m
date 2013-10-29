Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC3D3E0174F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Oct 2013 11:20:29 -0700 (PDT)
Received: by mail-la0-f41.google.com with SMTP id el20so215156lab.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Oct 2013 11:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Ob/vvPuZLbWzYA0uzU226X8sZLCUmkDGmMzNm856Q4A=;
	b=MjyhBbWbJTw6u6rvDG7LGz8VtEqTVKjW4YwkeQBFoTGbD1wLl/tTO70Dt4VNBPof48
	R/M5YGfrbwm8H9rKeY2XNo8Ezyso/QkfnMUJCCu+VRN65ky9fvqclHdamSRHXT4r+HI6
	rsEBRSxaagcW86Y/SfmbsFSqcjHjzNUQF0YtrHsMNglnEHMg7M+vrOAi77K8qJ6+3p5p
	AMpw0MjqQe/j8M+eL4uwFqS510QqRwfhLJm3zz4NzkmuCp5bD9VIxW+b+R20jwOqOHNB
	epQ+9w7Br0RXI45a63lc06CsU5GUhyfLnHZaLzLmpfnGAGCmQnZsH/ZhC1HJzoa/CQBY
	abUA==
MIME-Version: 1.0
X-Received: by 10.112.138.164 with SMTP id qr4mr818932lbb.49.1383070827693;
	Tue, 29 Oct 2013 11:20:27 -0700 (PDT)
Received: by 10.112.14.200 with HTTP; Tue, 29 Oct 2013 11:20:27 -0700 (PDT)
In-Reply-To: <1382998249-3028-1-git-send-email-flihp@twobit.us>
References: <1382998249-3028-1-git-send-email-flihp@twobit.us>
Date: Tue, 29 Oct 2013 14:20:27 -0400
Message-ID: <CADkTA4Nsa=Qd3V=9JrV_Xr++4rE-ia9+=1DPSdHReaNwrJctQA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/2] Xen: start using PACKAGECONFIG
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
X-List-Received-Date: Tue, 29 Oct 2013 18:20:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Oct 28, 2013 at 6:10 PM, Philip Tricca <flihp@twobit.us> wrote:
> This is a first pass at cleaning up the DEPENDS and do_configure in
> the xen_4.3.0 recipe. Adding XSM stuff made it clear that directly
> interacting with DISTRO_FEATURES was the wrong way to do it. That and
> when Chris and I ment up at LinuxCon he told me I should have used
> PACKAGECONFIG in the first place :P

:)

>
> This small patch series is the first step to handling features (like
> sdl) using PACKAGECONFIG.

Agreed. Small steps are good. This looks fine to me. I grabbed the series,
since no one has offered an objection!

Bruce

>
> Philip Tricca (2):
>   Convert direct call to ./configure with oe_runconf and EXTRA_OECONF.
>   Use PACKAGECONFIG to deal with XSM policy.
>
>  recipes-extended/xen/xen_4.3.0.bb |   19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
> --
> 1.7.10.4
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

