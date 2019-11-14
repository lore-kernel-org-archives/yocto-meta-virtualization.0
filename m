Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7EF65E00E4F; Thu, 14 Nov 2019 06:55:42 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.65 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C8BD1E00DF3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Nov 2019 06:55:41 -0800 (PST)
Received: by mail-ed1-f65.google.com with SMTP id s10so5239140edi.5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Nov 2019 06:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qsRUWAqngTiB5DJHey+X0GACq3gDpnzIP6an6MI2luQ=;
	b=OpuLHGA0wS9G0gXWoNnDz6VpjuGaSvrPGPAsEykCHTKyqSjHt4qHoXb/99zjzFHS2z
	mR1gC1bvn+fjJvRKeNKtAx5ZumaTP3A9mnZWaHn6tStXVg9SYsimrJypP9009EQLc4jB
	tAk9EuQ2l1yyE/45zTLgylrue1qzknzF8CYVfSRGae4Rb2WspeYSs6DvbqXvwixTUkWj
	EZzfmmUDtnP46mawUR8w5gYNi8WqMIK1QS9w0LLji+d9PzrIe1KdRsCJXc2h4Gzfh0vl
	CEVGkwgZYKp68A+e41ifTN0//7h5sU+cOyJo0nPvZjQhZHoAhvHiHJKLpWh/D/bJ1Oyu
	Qs0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qsRUWAqngTiB5DJHey+X0GACq3gDpnzIP6an6MI2luQ=;
	b=UTBt5k0L6lfgCGLZ0ZfJ4jDqLlxPFSmM+eAc/ZwR02MO921WAj+mUPFVTqK1lXCq8B
	XaiFBVTZSZ4CCZ8mZPFM2tdVq0lS/NSJdqm+d7mMpECe8209h0hQEc2CL/7zqaW0tevq
	9IdpAxKMInDJzneHEE/bMzMfpikKK2fNsKIyAnLkFg6jo+FdVkmf+VJEs4dfsGLmr3wv
	UPzvEV2v/VX9pshDwls406U0P8x2/2WNKibYzLismnH8A7Bb+GogZb09uCUymAEFhM+0
	XLJ+WkJH1H1kgXqrsrVvlTN0z9ndCjEI5hE7RskZJ5wbrujxWRj5CzgQqbZmEyisHso/
	h/1w==
X-Gm-Message-State: APjAAAUy7D5+xA5CHoiy5kYLloQFbdsX2R8wtvWUQ4f3w6xkvdHugP2D
	PB86cwdc3yKh7LwglxYi7ssOyVRtd6q4GPUd7MNsPf2k
X-Google-Smtp-Source: APXvYqw42v59M0rdl2PEcs6vZkBYvZkiC0TU8rBIObKM8OwXQsSYaqjPlMKM7unzC/n2qjBwvMN4V8TVPIdIVy064Us=
X-Received: by 2002:aa7:d496:: with SMTP id b22mr1728194edr.122.1573743340721; 
	Thu, 14 Nov 2019 06:55:40 -0800 (PST)
MIME-Version: 1.0
References: <c03f4a40-ed57-76a8-49f8-85e25738a69a@3mdeb.com>
	<CADkTA4PPaE3ijWo7-36-vhKepUwDH2YovZw3Ad9F3N2phiYcdg@mail.gmail.com>
	<56a4bd12-583c-1228-7179-e2bbaa4d4b12@3mdeb.com>
In-Reply-To: <56a4bd12-583c-1228-7179-e2bbaa4d4b12@3mdeb.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 14 Nov 2019 09:55:29 -0500
Message-ID: <CADkTA4OVUVn-jQoGA_SsvGOUzbtX8JoQ-r6LVnpEJTUm3y6gKg@mail.gmail.com>
To: Norbert Kaminski <norbert.kaminski@3mdeb.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>,
	piotr.krol@3mdeb.com
Subject: Re: recipes-extended/images/xen-image-minimal.bb: change, hardcoded vmlinuz to the KERNEL_IMAGETYPE variable
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
X-List-Received-Date: Thu, 14 Nov 2019 14:55:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 14, 2019 at 9:22 AM Norbert Kaminski
<norbert.kaminski@3mdeb.com> wrote:
>
>
> On 31.10.2019 23:09, Bruce Ashfield wrote:
> > On Thu, Oct 31, 2019 at 2:23 PM Norbert Kaminski
> > <norbert.kaminski@3mdeb.com> wrote:
> >> Why is vmlinuz hard-coded in the syslinux.cfg? Could it be replaced by
> >> the KERNEL_IMAGETYPE?
> >>
> > I'm guessing it just hasn't been something that others have wanted to configure.
> >
> > The patch looks ok to me. I assume those that are currently relying on
> > /vmlinuz will have that already as their kernel build type (since it
> > is being built).
> >
> > I'll wait a few days to see if anyone objects.
>
> So far, there have been no objections, thus I think it could be merged.

I've sent a few specific requests out for comment, I'm still waiting
to hear back.

Bruce

>
> Norbert
>
> > Bruce
> >
> >
> >>   From 450becb15192a3541b7a3d55ace75a1929d15add Mon Sep 17 00:00:00 2001
> >> From: Asiderr <norbert.kaminski@3mdeb.com>
> >> Date: Thu, 31 Oct 2019 17:50:53 +0100
> >> Subject: [PATCH] recipes-extended/images/xen-image-minimal.bb: change
> >> hardcoded vmlinuz to the variable
> >>
> >> Signed-off-by: Norbert Kaminski <norbert.kaminski@3mdeb.com>
> >> ---
> >>    recipes-extended/images/xen-image-minimal.bb | 2 +-
> >>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/recipes-extended/images/xen-image-minimal.bb
> >> b/recipes-extended/images/xen-image-minimal.bb
> >> index c39d378..740ef1f 100644
> >> --- a/recipes-extended/images/xen-image-minimal.bb
> >> +++ b/recipes-extended/images/xen-image-minimal.bb
> >> @@ -61,6 +61,6 @@ build_syslinux_cfg () {
> >>        echo "PROMPT 1" >> ${SYSLINUX_CFG}
> >>        echo "LABEL boot" >> ${SYSLINUX_CFG}
> >>        echo "  KERNEL mboot.c32" >> ${SYSLINUX_CFG}
> >> -    echo "  APPEND /xen.gz ${SYSLINUX_XEN_ARGS} --- /vmlinuz
> >> ${SYSLINUX_KERNEL_ARGS} --- /initrd" >> ${SYSLINUX_CFG}
> >> +    echo "  APPEND /xen.gz ${SYSLINUX_XEN_ARGS} ---
> >> /${KERNEL_IMAGETYPE} ${SYSLINUX_KERNEL_ARGS} --- /initrd" >> ${SYSLINUX_CFG}
> >>    }
> >>
> >> --
> >> 2.17.1
> >>
> >> --
> >> _______________________________________________
> >> meta-virtualization mailing list
> >> meta-virtualization@yoctoproject.org
> >> https://lists.yoctoproject.org/listinfo/meta-virtualization
> >
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

