Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7C916E01483
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jun 2013 19:51:10 -0700 (PDT)
Received: by mail-la0-f51.google.com with SMTP id fq12so3024487lab.24
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jun 2013 19:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/ZtFBSZODcAQ1QzCAwbeJHRCAVE0MLrj9TL5M7sMn3Y=;
	b=Vz9KSF/Kfq9X7Y+lQNVMddh82oeahd9bHniz0n+I4yX+yFrhwFzMRbWGjcxm0w9YTx
	N91WH2poFA4YGSbiAs/QFSe+cxhHoIt+VIVtaKlIDh8cba/ka2J/sE/ete5W2AQ/BzQB
	+vwZxRLAtwvVivpc+KdruhOf+u9pGRDVlrnFfJ3eGOF0t9DFmIfCKUtzYhRmnMVqPres
	WVODEtO2cR0GyjVEZi73/R1feh/o4Flj1PpO4l5oeiW1teEnEm/JDFJUj+wYzhPc5+Hz
	6l8OXOb2TnnAGsbRYA6rnXds+vvygFiTcL/NdYb0LRRqnOMnNxDCy2LxK24RStdSj6kS
	Am8A==
MIME-Version: 1.0
X-Received: by 10.152.37.138 with SMTP id y10mr1875145laj.40.1371523869443;
	Mon, 17 Jun 2013 19:51:09 -0700 (PDT)
Received: by 10.112.71.14 with HTTP; Mon, 17 Jun 2013 19:51:09 -0700 (PDT)
In-Reply-To: <AF604684617F454390621992F367F16901D15A31@039-SN2MPN1-011.039d.mgd.msft.net>
References: <1370573111-13102-1-git-send-email-b28495@freescale.com>
	<CADkTA4N=H5RUGCp-iL3ge_psPmpDPhbGTn2ywA3SOj6eo4bmwQ@mail.gmail.com>
	<AF604684617F454390621992F367F16901D15A31@039-SN2MPN1-011.039d.mgd.msft.net>
Date: Mon, 17 Jun 2013 22:51:09 -0400
Message-ID: <CADkTA4N=QkTGmVu0iK9FjnrbTZKT6X2aMOMx37jheDp-78bryw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Liu Ting-B28495 <B28495@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Luo Zhenhua-B19537 <B19537@freescale.com>
Subject: Re: [PATCH] libvirt: use libexecdir instead of hard code path
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
X-List-Received-Date: Tue, 18 Jun 2013 02:51:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 17, 2013 at 10:35 PM, Liu Ting-B28495 <B28495@freescale.com> wrote:
>> -----Original Message-----
>> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
>> Sent: Monday, June 10, 2013 11:25 PM
>> To: Liu Ting-B28495
>> Cc: meta-virtualization@yoctoproject.org; Luo Zhenhua-B19537
>> Subject: Re: [meta-virtualization] [PATCH] libvirt: use libexecdir
>> instead of hard code path
>>
>> On Thu, Jun 6, 2013 at 10:45 PM,  <b28495@freescale.com> wrote:
>> > From: Ting Liu <b28495@freescale.com>
>>
>> Thanks, I've staged the change locally. Will push it out shortly.
>>
>
> Ping.

Hmm. I swear I pushed it out.  I merged patches after this, and they
are present.
I'll hunt for the changes in my test branch!

Bruce

>
>> Bruce
>>
>> >
>> > Signed-off-by: Ting Liu <b28495@freescale.com>
>> > ---
>> >  recipes-extended/libvirt/libvirt_1.0.3.bb |    4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb
>> > b/recipes-extended/libvirt/libvirt_1.0.3.bb
>> > index b29c055..479ce7e 100644
>> > --- a/recipes-extended/libvirt/libvirt_1.0.3.bb
>> > +++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
>> > @@ -3,7 +3,7 @@ HOMEPAGE = "http://libvirt.org"
>> >  LICENSE = "GPLv2+"
>> >  LIC_FILES_CHKSUM =
>> "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
>> >  SECTION = "console/tools"
>> > -PR = "r5"
>> > +PR = "r6"
>> >
>> >  DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap
>> util-linux e2fsprogs pm-utils \
>> >            iptables ebtables dnsmasq readline"
>> > @@ -149,5 +149,5 @@ do_install_append() {
>> >
>> >         # This will wind up in the libvirtd package, but will NOT be
>> invoked by default.
>> >         #
>> > -       mv ${D}/usr/libexec/libvirt-guests.sh ${D}/${sysconfdir}/init.d
>> > +       mv ${D}/${libexecdir}/libvirt-guests.sh
>> > + ${D}/${sysconfdir}/init.d
>> >  }
>> > --
>> > 1.7.9.7
>> >
>> >
>> > _______________________________________________
>> > meta-virtualization mailing list
>> > meta-virtualization@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
>> at its end"
>
>



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

