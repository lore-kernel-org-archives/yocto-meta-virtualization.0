Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2848E007C3
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Dec 2013 09:01:03 -0800 (PST)
Received: by mail-pb0-f47.google.com with SMTP id um1so5782842pbc.20
	for <meta-virtualization@yoctoproject.org>;
	Mon, 09 Dec 2013 09:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=CuVg2gZznFSTUFkvAM2bYN3GnHV57lXEtDXD3gNDj7E=;
	b=ld1LQDoFJLjJtZ6K+Ox0JwS62d8OuI9ghQPqgAOQknrKeC6IZ1AJ/nfRRoS7ceF/Bz
	GUydvBW/JdIm9evT54Z7kMZAW/e07ZfBMx/p0FDbxKQTRe3TNALVpJEx4n1iOFM+mm3Z
	UV6kHvYQmfCQb/n+L6tmguWIdQ7lKAGSXayA9676pgf5YoZci5l1CuiNhue22TCubLJN
	+4X0Z80WYS3Oo/P1+sbP2Co3lDwODwPyQ0hPQKuXXgf0MBaez96703DxO/mdoJZD0WzG
	WNDstMVHSfY5EMol21gc4Kl/W1PB8cdMPOFyGaNd8ZpuoeQIQFobkIH5rPegqkEkuZkb
	t2MQ==
MIME-Version: 1.0
X-Received: by 10.68.111.33 with SMTP id if1mr22264503pbb.31.1386608462446;
	Mon, 09 Dec 2013 09:01:02 -0800 (PST)
Received: by 10.68.12.133 with HTTP; Mon, 9 Dec 2013 09:01:02 -0800 (PST)
In-Reply-To: <CABZSBQd54bgBVsfW+wq0QH6vcv6oW3OVcE6d2G24EA4U5HQpRw@mail.gmail.com>
References: <1386123634-5877-1-git-send-email-flihp@twobit.us>
	<CADkTA4NCOjwCH524=zFx-wyw3E0A+02bnMLswE5HLnAjmHbfBA@mail.gmail.com>
	<CABZSBQd54bgBVsfW+wq0QH6vcv6oW3OVcE6d2G24EA4U5HQpRw@mail.gmail.com>
Date: Mon, 9 Dec 2013 12:01:02 -0500
Message-ID: <CADkTA4O0-FYcn=REuwno2UFiDZX++yes892FEOWAsfo5boS9rA@mail.gmail.com>
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
X-List-Received-Date: Mon, 09 Dec 2013 17:01:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Dec 5, 2013 at 5:20 PM, Chris Patterson <cjp256@gmail.com> wrote:
> Looks good to me.
>

So to confirm for everyone, no objections if this merges as-is ?

Bruce

>
> On Thu, Dec 5, 2013 at 7:09 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>>
>> On Tue, Dec 3, 2013 at 9:20 PM, Philip Tricca <flihp@twobit.us> wrote:
>> > The Xen scripts for handling block and vif udev events depend on
>> > directories created by the Xen volatile directories. In a situation
>> > where the 'base' Xen package isn't installed (NDVM etc) these
>> > scripts fail silently. The most simple approach I could come up
>> > with is just breaking the Xen volatiles config out into it's own
>> > package and setting up the logical dependencies.
>> >
>> > Creating a new package for just a single file seems like overkill
>> > to me but it's the most straightforward thing I could come up with.
>>
>> This seems reasonable to me, there are plenty of other one file package
>> examples (in particular since the update-rc.d only works for one
>> initscript
>> per package), so that isn't all that out of the ordinary.
>>
>> So to my eye, this looks ok.
>>
>> Bruce
>>
>> >
>> > Regards,
>> > Philip
>> >
>> > Signed-off-by: Philip Tricca <flihp@twobit.us>
>> > ---
>> >  recipes-extended/xen/xen.inc |    8 +++++++-
>> >  1 file changed, 7 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
>> > index 9d43814..e31e996 100644
>> > --- a/recipes-extended/xen/xen.inc
>> > +++ b/recipes-extended/xen/xen.inc
>> > @@ -53,12 +53,14 @@ RDEPENDS_${PN}-base = "\
>> >  RDEPENDS_${PN}-scripts-block = "\
>> >      ${PN}-scripts-common \
>> >      ${PN}-udev \
>> > +    ${PN}-volatiles \
>> >      "
>> >
>> >  RDEPENDS_${PN}-scripts-network = "\
>> >      bridge-utils \
>> >      ${PN}-scripts-common \
>> >      ${PN}-udev \
>> > +    ${PN}-volatiles \
>> >      "
>> >
>> >  PACKAGES = "\
>> > @@ -106,6 +108,7 @@ PACKAGES = "\
>> >      ${PN}-scripts-network \
>> >      ${PN}-staticdev \
>> >      ${PN}-udev \
>> > +    ${PN}-volatiles \
>> >      ${PN}-xcutils \
>> >      ${PN}-xencommons \
>> >      ${PN}-xend \
>> > @@ -210,7 +213,6 @@ FILES_${PN}-hypervisor = "\
>> >      "
>> >
>> >  FILES_${PN}-base = "\
>> > -    ${sysconfdir}/default/volatiles/99_xen \
>> >      ${sysconfdir}/default/xencommons \
>> >      ${sysconfdir}/default/xendomains \
>> >      ${sysconfdir}/xen/auto \
>> > @@ -425,6 +427,10 @@ FILES_${PN}-udev = "\
>> >      ${sysconfdir}/udev/rules.d/xend.rules \
>> >      "
>> >
>> > +FILES_${PN}-volatiles = "\
>> > +    ${sysconfdir}/default/volatiles/99_xen \
>> > +    "
>> > +
>> >  FILES_${PN}-xcutils = "\
>> >      ${libdir}/xen/bin/lsevtchn \
>> >      ${libdir}/xen/bin/readnotes \
>> > --
>> > 1.7.10.4
>> >
>> > _______________________________________________
>> > meta-virtualization mailing list
>> > meta-virtualization@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

