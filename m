Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14B7CE01481
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Mar 2013 05:44:43 -0700 (PDT)
Received: by mail-la0-f44.google.com with SMTP id eb20so15628801lab.17
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Mar 2013 05:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=RiFEQKTUoitwI4gR57mhCHs4ScGCUGRs9ex8sh15O+k=;
	b=rQMWAdEoO68V1piVgSk2ZWTcPyD2B6fZVUvWd+GRwzBlPJRbKhyMn9DAkfFS9JpI2O
	z5XFDOFQcGAWo94snBp3rjiQ9NJhLtCMB1L3tboeCI4O9e5xXGRM6rr6zKgO04dcWgjp
	6xmMyFfXYuK5Hv5DcU4uxHbP4KMX5GhsiyUTrOiY1krfrKZyeyiuSdmyiJRwhV3GacGt
	Xi49FF1lKFTBmfQfgZxFQIfx4WsFfhInsOBLfJqdbxvSARDb/zOxWkcASZt7VfWr5q3c
	1vP9OwbiW06/ARnI5ETnKJJ8VaK5MLiQGs800XrGYDS4jjUyIuVmWBgr8jQiJ2cCfBsY
	7+vg==
MIME-Version: 1.0
X-Received: by 10.112.137.162 with SMTP id qj2mr7227320lbb.26.1364388282456;
	Wed, 27 Mar 2013 05:44:42 -0700 (PDT)
Received: by 10.112.61.3 with HTTP; Wed, 27 Mar 2013 05:44:42 -0700 (PDT)
In-Reply-To: <CAAKB1h2HKsboFT=h9HDCC9MnZYz9N5VB4jHE0U_BSwg+KjxaMA@mail.gmail.com>
References: <1363152493-25261-1-git-send-email-hong-hua.yin@freescale.com>
	<CADkTA4N1wugSgFowPCCyjtcMVeGSrVOHO+CqUwO8KuuKutZ2nw@mail.gmail.com>
	<CADkTA4NSqeasAR7Q4nK_4pVp1uYfF67=zCSZVLJFQECzCn48xA@mail.gmail.com>
	<B5012D5F6E2BBC4DBF16B3E6037A5B732EB3B5@039-SN1MPN1-003.039d.mgd.msft.net>
	<CADkTA4OZYOZfVxGEDJCi22Fk26YnVvWZRwerkSoXr6i5T8GnGw@mail.gmail.com>
	<CAAKB1h2HKsboFT=h9HDCC9MnZYz9N5VB4jHE0U_BSwg+KjxaMA@mail.gmail.com>
Date: Wed, 27 Mar 2013 08:44:42 -0400
Message-ID: <CADkTA4PxUvqQ+SjuEeSvjr3X-o-42MZxsdREKA_tyEXXoefihw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: David Nystrom <david.c.nystrom@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Yin Olivia-R63875 <r63875@freescale.com>
Subject: Re: [PATCH] libvirt: upgrade to 1.0.3
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
X-List-Received-Date: Wed, 27 Mar 2013 12:44:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 27, 2013 at 8:22 AM, David Nystrom
<david.c.nystrom@gmail.com> wrote:
> I suggest we create a recipe for a ptest enabled test image to get everyone
> using exactly the same tests, and keep everything in the recipes. This will
> also allow a standardized test report format.

And coupled with this, we can enable the kernel self tests as an optional
configuration fragment (3.8+ has an even better tests infrastructure for
this) so we can have a kernel test -> userspace test enabled image out
of the box.

I can take care of the kernel part, is anyone working on the userspace part ?

Cheers,

Bruce

>
> Br,
> David
>
> On Mar 18, 2013 4:33 AM, "Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:
>>
>> On Sun, Mar 17, 2013 at 10:49 PM, Yin Olivia-R63875
>> <r63875@freescale.com> wrote:
>> > Hi Bruce,
>> >
>> > I can't find any example tests you required.
>> >
>> > I just ran on FSL PowerPC platforms with QEMU/LXC cases and most domain
>> > functions worked well.
>> >
>>
>>
>> Meaning: start, stop, destroy, migrate for VMs ? And similar tests
>> with LXC containers ?
>>
>> As we get more people using layers and projects associated with the
>> Yocto project, we need
>> to generate a set of baseline / sanity tests so we can ensure that
>> updates don't cause
>> regressions.
>>
>> This is a minor version bump, so I've staged it here, but if you have
>> any READMEs,
>> scripts or tests steps for this functionality, capturing it in the
>> layer for reference would
>> help everyone out.
>>
>> I plan to pull together my own similar docs and contribute them to the
>> effort.
>>
>> Cheers,
>>
>> Bruce
>>
>> >
>> > Best Regards,
>> > Olivia
>> >
>> >
>> >
>> > -----Original Message-----
>> > From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
>> > Sent: Friday, March 15, 2013 10:39 PM
>> > To: Yin Olivia-R63875
>> > Cc: meta-virtualization@yoctoproject.org
>> > Subject: Re: [meta-virtualization] [PATCH] libvirt: upgrade to 1.0.3
>> >
>> > On Wed, Mar 13, 2013 at 6:11 AM, Bruce Ashfield
>> > <bruce.ashfield@gmail.com> wrote:
>> >> On Wed, Mar 13, 2013 at 12:28 AM, Olivia Yin
>> >> <hong-hua.yin@freescale.com> wrote:
>> >>> Signed-off-by: Olivia Yin <hong-hua.yin@freescale.com>
>> >>
>> >> Can you quickly summarize what testing was done with libvirt ? Just so
>> >> we can get a feel for the arches that have been covered, and what
>> >> functionality has been exercised.
>> >>
>> >> Since this patch removes the 1.0 version, we won't have a fallback in
>> >> tree if things break.
>> >
>> > ping. There are a few outstanding questions on this. No rush, but I
>> > didn't want anyone to think we were ignoring or had dropped this series.
>> >
>> > Cheers,
>> >
>> > Bruce
>> >
>> >>
>> >> Cheers,
>> >>
>> >> Bruce
>> >>
>> >>> ---
>> >>>  .../libvirt/{libvirt_1.0.0.bb => libvirt_1.0.3.bb} |    4 ++--
>> >>>  1 files changed, 2 insertions(+), 2 deletions(-)  rename
>> >>> recipes-extended/libvirt/{libvirt_1.0.0.bb => libvirt_1.0.3.bb} (97%)
>> >>>
>> >>> diff --git a/recipes-extended/libvirt/libvirt_1.0.0.bb
>> >>> b/recipes-extended/libvirt/libvirt_1.0.3.bb
>> >>> similarity index 97%
>> >>> rename from recipes-extended/libvirt/libvirt_1.0.0.bb
>> >>> rename to recipes-extended/libvirt/libvirt_1.0.3.bb
>> >>> index 90d7dbb..372e874 100644
>> >>> --- a/recipes-extended/libvirt/libvirt_1.0.0.bb
>> >>> +++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
>> >>> @@ -22,8 +22,8 @@ SRC_URI =
>> >>> "http://libvirt.org/sources/libvirt-${PV}.tar.gz \
>> >>>         file://libvirtd.sh \
>> >>>         file://libvirtd.conf"
>> >>>
>> >>> -SRC_URI[md5sum] = "7c8b006de7338e30866bb56738803b21"
>> >>> -SRC_URI[sha256sum] =
>> >>> "14c8a30ebfb939c82cab5f759a95d09646b43b4210e45490e92459ae65123076"
>> >>> +SRC_URI[md5sum] = "3d9f85d586c9aa3d819b626622f3fc97"
>> >>> +SRC_URI[sha256sum] =
>> >>> "f64f4acd7cdcfc6ab5e803195ed58b949f262b54e3659d8c37b33f0fec112757"
>> >>>
>> >>>  inherit autotools gettext update-rc.d
>> >>>
>> >>> --
>> >>> 1.6.4
>> >>>
>> >>>
>> >>> _______________________________________________
>> >>> meta-virtualization mailing list
>> >>> meta-virtualization@yoctoproject.org
>> >>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>> >>
>> >>
>> >>
>> >> --
>> >> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> >> thee at its end"
>> >
>> >
>> >
>> > --
>> > "Thou shalt not follow the NULL pointer, for chaos and madness await
>> > thee at its end"
>> >
>> >
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



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

