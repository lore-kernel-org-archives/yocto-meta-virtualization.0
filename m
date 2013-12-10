Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5A7DE00785
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Dec 2013 08:29:14 -0800 (PST)
Received: by mail-pd0-f174.google.com with SMTP id y13so7600506pdi.19
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Dec 2013 08:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=zC7D42u7RQD3ZUxSdxQf7N2bbG/04NHwoc9ekAMjTUM=;
	b=J5lw/e38BjqnhiRCCPiogBJYv9OfA5W66JgDz+4aCrqgnBAt1lIS6BN5CGIzX055AN
	Qfwb4jytnSdXcJwpkVt6umRnf1aJCPP8XNtAroQXTw/fXkGJNPuRm3EhekHzNhNjWvZ7
	HfeKtsptehLjD0kfs8I/lxaYtmljgndAHn4sjIsexz7Oy3HEz/9gHQIWzPpsp2Nvde4D
	fkD0QWYm+5OXcle9RmVch1q1SjCUEyjaN9eO0jnoAD/5ni51RRCDNc+cjChVTRIgw2In
	a/ENDvEMvg8l8n5TrWKww/YI5ANviT0SFHkT4NK/GAYK461gykOO94/iqN+OjpbXyH2Q
	96uQ==
MIME-Version: 1.0
X-Received: by 10.68.173.132 with SMTP id bk4mr3943353pbc.169.1386692954069;
	Tue, 10 Dec 2013 08:29:14 -0800 (PST)
Received: by 10.68.12.133 with HTTP; Tue, 10 Dec 2013 08:29:13 -0800 (PST)
In-Reply-To: <CABZSBQfqAnYkJf9jqtk_hdoj2QN-FrFDsPiVfdXpmTXTPOU49A@mail.gmail.com>
References: <1386123634-5877-1-git-send-email-flihp@twobit.us>
	<CADkTA4NCOjwCH524=zFx-wyw3E0A+02bnMLswE5HLnAjmHbfBA@mail.gmail.com>
	<CABZSBQd54bgBVsfW+wq0QH6vcv6oW3OVcE6d2G24EA4U5HQpRw@mail.gmail.com>
	<CADkTA4O0-FYcn=REuwno2UFiDZX++yes892FEOWAsfo5boS9rA@mail.gmail.com>
	<CABZSBQfqAnYkJf9jqtk_hdoj2QN-FrFDsPiVfdXpmTXTPOU49A@mail.gmail.com>
Date: Tue, 10 Dec 2013 11:29:13 -0500
Message-ID: <CADkTA4PrcYO4vAoQCxYixYfzKK20+A4VKg7rxN5Ts9-Ek0d0JQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [RFC] xen: Break volatiles out into separate package.
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
X-List-Received-Date: Tue, 10 Dec 2013 16:29:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 9, 2013 at 10:17 PM, Chris Patterson <cjp256@gmail.com> wrote:
> I applied the patch and had a couple notes:
>
> - rename pkg_postinst_${PN}-base -> pkg_postinst_${PN}-volatiles.  As it
> stands, 'populate-volatile.sh update' supposedly only executes when one
> installs xen-base, but it is only there for handling the volatiles.  In my
> testing, I don't think this step is required (it doesn't look like it is
> generating the volatile.cache in the rootfs as I expected) - but it is the
> common practice from what I've seen.

I'd agree with this tweak, since it is simple enough to do as part of the merge.

Phillip: What do you think ? If you want to do a quick repin, I'll wait. If you
don't have the cycles, but agree, I can make the change as part of the merge.

>
> - volatiles indirectly rdepends xen-volatiles now via the script packages. I
> don't see a problem with this as the job is still getting done - but I
> wouldn't mind better defining and cleaning up xen-base a bit (or perhaps
> outright removing it and moving the bits into the appropriate places).

Also agreed. We can put this on a TODO list.

Bruce

>
> Either way, I'm ok with merging. :)
>
> Cheers,
> -Chris
>
>
> On Mon, Dec 9, 2013 at 12:01 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>>
>> On Thu, Dec 5, 2013 at 5:20 PM, Chris Patterson <cjp256@gmail.com> wrote:
>> > Looks good to me.
>> >
>>
>> So to confirm for everyone, no objections if this merges as-is ?
>>
>> Bruce
>>
>> >
>> > On Thu, Dec 5, 2013 at 7:09 PM, Bruce Ashfield
>> > <bruce.ashfield@gmail.com>
>> > wrote:
>> >>
>> >> On Tue, Dec 3, 2013 at 9:20 PM, Philip Tricca <flihp@twobit.us> wrote:
>> >> > The Xen scripts for handling block and vif udev events depend on
>> >> > directories created by the Xen volatile directories. In a situation
>> >> > where the 'base' Xen package isn't installed (NDVM etc) these
>> >> > scripts fail silently. The most simple approach I could come up
>> >> > with is just breaking the Xen volatiles config out into it's own
>> >> > package and setting up the logical dependencies.
>> >> >
>> >> > Creating a new package for just a single file seems like overkill
>> >> > to me but it's the most straightforward thing I could come up with.
>> >>
>> >> This seems reasonable to me, there are plenty of other one file package
>> >> examples (in particular since the update-rc.d only works for one
>> >> initscript
>> >> per package), so that isn't all that out of the ordinary.
>> >>
>> >> So to my eye, this looks ok.
>> >>
>> >> Bruce
>> >>
>> >> >
>> >> > Regards,
>> >> > Philip
>> >> >
>> >> > Signed-off-by: Philip Tricca <flihp@twobit.us>
>> >> > ---
>> >> >  recipes-extended/xen/xen.inc |    8 +++++++-
>> >> >  1 file changed, 7 insertions(+), 1 deletion(-)
>> >> >
>> >> > diff --git a/recipes-extended/xen/xen.inc
>> >> > b/recipes-extended/xen/xen.inc
>> >> > index 9d43814..e31e996 100644
>> >> > --- a/recipes-extended/xen/xen.inc
>> >> > +++ b/recipes-extended/xen/xen.inc
>> >> > @@ -53,12 +53,14 @@ RDEPENDS_${PN}-base = "\
>> >> >  RDEPENDS_${PN}-scripts-block = "\
>> >> >      ${PN}-scripts-common \
>> >> >      ${PN}-udev \
>> >> > +    ${PN}-volatiles \
>> >> >      "
>> >> >
>> >> >  RDEPENDS_${PN}-scripts-network = "\
>> >> >      bridge-utils \
>> >> >      ${PN}-scripts-common \
>> >> >      ${PN}-udev \
>> >> > +    ${PN}-volatiles \
>> >> >      "
>> >> >
>> >> >  PACKAGES = "\
>> >> > @@ -106,6 +108,7 @@ PACKAGES = "\
>> >> >      ${PN}-scripts-network \
>> >> >      ${PN}-staticdev \
>> >> >      ${PN}-udev \
>> >> > +    ${PN}-volatiles \
>> >> >      ${PN}-xcutils \
>> >> >      ${PN}-xencommons \
>> >> >      ${PN}-xend \
>> >> > @@ -210,7 +213,6 @@ FILES_${PN}-hypervisor = "\
>> >> >      "
>> >> >
>> >> >  FILES_${PN}-base = "\
>> >> > -    ${sysconfdir}/default/volatiles/99_xen \
>> >> >      ${sysconfdir}/default/xencommons \
>> >> >      ${sysconfdir}/default/xendomains \
>> >> >      ${sysconfdir}/xen/auto \
>> >> > @@ -425,6 +427,10 @@ FILES_${PN}-udev = "\
>> >> >      ${sysconfdir}/udev/rules.d/xend.rules \
>> >> >      "
>> >> >
>> >> > +FILES_${PN}-volatiles = "\
>> >> > +    ${sysconfdir}/default/volatiles/99_xen \
>> >> > +    "
>> >> > +
>> >> >  FILES_${PN}-xcutils = "\
>> >> >      ${libdir}/xen/bin/lsevtchn \
>> >> >      ${libdir}/xen/bin/readnotes \
>> >> > --
>> >> > 1.7.10.4
>> >> >
>> >> > _______________________________________________
>> >> > meta-virtualization mailing list
>> >> > meta-virtualization@yoctoproject.org
>> >> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>> >>
>> >>
>> >>
>> >> --
>> >> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> >> thee at its end"
>> >> _______________________________________________
>> >> meta-virtualization mailing list
>> >> meta-virtualization@yoctoproject.org
>> >> https://lists.yoctoproject.org/listinfo/meta-virtualization
>> >
>> >
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

