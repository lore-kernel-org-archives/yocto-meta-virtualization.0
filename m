Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D4A54E00E3B; Thu, 14 Nov 2019 14:31:28 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1160E004F6
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Nov 2019 14:31:26 -0800 (PST)
Received: by mail-lj1-f193.google.com with SMTP id k15so8474324lja.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Nov 2019 14:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=K7IEg4E1Ao/jxwJG9PwfosaGKoAXwBBxq+tF3eHyv8k=;
	b=rCBisBxSk7jLFv6o/Ez3H49pehoSJUcHQFawje/BlxRkDuUmn6kaeI9UO28EbOCPL7
	Xj21m0VT6zqRlLtY27QuQwxO19Bgb+SkYy9tRiURneB3FP4H8G7NBWgSTu+xxaLFTtaZ
	vgYmY2R81qj4uH38M16oIBqK+uR54oG8e1Mng6Lq8Z7LE7AX1BD+lxiTriyWk58qG92w
	6f9ZtHpi87M3JkaM+qW6TWM4esV5FR4p+FI8WU5CZZIuz0XYZXsqwM6aM28844bcEbxs
	BHXJYviyzE18hGQ0PJ7HTDaGZw5IXkFUUUPaNMxmVjn8qRFtNp0CykfVDBS2gr/JmxKh
	K8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=K7IEg4E1Ao/jxwJG9PwfosaGKoAXwBBxq+tF3eHyv8k=;
	b=FmTV7GjlFpFUS52pNeXUOo38xUgZ9fNM0mtDdMIlXaDNjpE+iKTlr0DXV6gFoqOw5i
	sIYVG/SZhBx4mds5OzSeTX9L2Jmb1nV3mpmKR0IQnDGdx9Hdhuza0PTg4Y775QVPAF4N
	Qv6bEeOyXAwyxwOZ2klfD3xzXtKDmOwHkGCjnVtq8o3xQy/WWUztQ2e0avj9OMECg8+I
	qVZ4pH9PxzJ0v0OTBJd2YaoSipX9OxHhRzqZzbKJNwXgX6o3THaS8E5U0V7QpwTxyxJP
	i/xN05fmH5a44+bVWkgGEtDdfQZoBVwbdfq0Pq1YYaZHNxVVnxc2CqH5nW7YuccSrgGc
	NJSg==
X-Gm-Message-State: APjAAAXUmc5utGc3Dm0AN/+pqR/lyXEp2pyovbjii4+czoIjDkaLLyjy
	qiR4v2e7NbncnpyRgA9iewkqyiCwv7NCtyk7blM=
X-Google-Smtp-Source: APXvYqw44f+Sn6b4kM/1CRstI52QDT2pD1Yr9ZnLoQ2nlW718cFInTFc/XKOMi4lpinW6MLyeEdTcy0oFISdIPBL+eI=
X-Received: by 2002:a2e:b5d4:: with SMTP id g20mr8652828ljn.140.1573770685742; 
	Thu, 14 Nov 2019 14:31:25 -0800 (PST)
MIME-Version: 1.0
References: <c03f4a40-ed57-76a8-49f8-85e25738a69a@3mdeb.com>
	<CADkTA4PPaE3ijWo7-36-vhKepUwDH2YovZw3Ad9F3N2phiYcdg@mail.gmail.com>
	<56a4bd12-583c-1228-7179-e2bbaa4d4b12@3mdeb.com>
	<CADkTA4OVUVn-jQoGA_SsvGOUzbtX8JoQ-r6LVnpEJTUm3y6gKg@mail.gmail.com>
In-Reply-To: <CADkTA4OVUVn-jQoGA_SsvGOUzbtX8JoQ-r6LVnpEJTUm3y6gKg@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 14 Nov 2019 14:31:13 -0800
Message-ID: <CACMJ4GYJDWAee=z=8rFc8xndHVWL6y=fDHEXUiECRxzVCuOO9w@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
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
X-List-Received-Date: Thu, 14 Nov 2019 22:31:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 14, 2019 at 6:55 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Thu, Nov 14, 2019 at 9:22 AM Norbert Kaminski
> <norbert.kaminski@3mdeb.com> wrote:
> >
> >
> > On 31.10.2019 23:09, Bruce Ashfield wrote:
> > > On Thu, Oct 31, 2019 at 2:23 PM Norbert Kaminski
> > > <norbert.kaminski@3mdeb.com> wrote:
> > >> Why is vmlinuz hard-coded in the syslinux.cfg? Could it be replaced by
> > >> the KERNEL_IMAGETYPE?
> > >>
> > > I'm guessing it just hasn't been something that others have wanted to configure.
> > >
> > > The patch looks ok to me. I assume those that are currently relying on
> > > /vmlinuz will have that already as their kernel build type (since it
> > > is being built).
> > >
> > > I'll wait a few days to see if anyone objects.
> >
> > So far, there have been no objections, thus I think it could be merged.
>
> I've sent a few specific requests out for comment, I'm still waiting
> to hear back.

It looks like openembedded-core uses 'vmlinuz' for the kernel string
in both these classes:
  meta/classes/syslinux.class
  meta/classes/grub-efi.class

so would the same change be appropriate there?  I agree that it
doesn't seem quite right to be hardcoding it to vmlinuz and it could
be useful to get feedback from oe-core on the change.

Christopher

>
> Bruce
>
> >
> > Norbert
> >
> > > Bruce
> > >
> > >
> > >>   From 450becb15192a3541b7a3d55ace75a1929d15add Mon Sep 17 00:00:00 2001
> > >> From: Asiderr <norbert.kaminski@3mdeb.com>
> > >> Date: Thu, 31 Oct 2019 17:50:53 +0100
> > >> Subject: [PATCH] recipes-extended/images/xen-image-minimal.bb: change
> > >> hardcoded vmlinuz to the variable
> > >>
> > >> Signed-off-by: Norbert Kaminski <norbert.kaminski@3mdeb.com>
> > >> ---
> > >>    recipes-extended/images/xen-image-minimal.bb | 2 +-
> > >>    1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/recipes-extended/images/xen-image-minimal.bb
> > >> b/recipes-extended/images/xen-image-minimal.bb
> > >> index c39d378..740ef1f 100644
> > >> --- a/recipes-extended/images/xen-image-minimal.bb
> > >> +++ b/recipes-extended/images/xen-image-minimal.bb
> > >> @@ -61,6 +61,6 @@ build_syslinux_cfg () {
> > >>        echo "PROMPT 1" >> ${SYSLINUX_CFG}
> > >>        echo "LABEL boot" >> ${SYSLINUX_CFG}
> > >>        echo "  KERNEL mboot.c32" >> ${SYSLINUX_CFG}
> > >> -    echo "  APPEND /xen.gz ${SYSLINUX_XEN_ARGS} --- /vmlinuz
> > >> ${SYSLINUX_KERNEL_ARGS} --- /initrd" >> ${SYSLINUX_CFG}
> > >> +    echo "  APPEND /xen.gz ${SYSLINUX_XEN_ARGS} ---
> > >> /${KERNEL_IMAGETYPE} ${SYSLINUX_KERNEL_ARGS} --- /initrd" >> ${SYSLINUX_CFG}
> > >>    }
> > >>
> > >> --
> > >> 2.17.1
> > >>
> > >> --
> > >> _______________________________________________
> > >> meta-virtualization mailing list
> > >> meta-virtualization@yoctoproject.org
> > >> https://lists.yoctoproject.org/listinfo/meta-virtualization
> > >
> > >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

