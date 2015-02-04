Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 95594E00827; Wed,  4 Feb 2015 06:39:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.42 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1CD6FE00753
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Feb 2015 06:39:12 -0800 (PST)
Received: by mail-la0-f42.google.com with SMTP id ms9so1932082lab.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 04 Feb 2015 06:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=77FZreHZHpVhSFH4uCLGgLtEWR6bHAWn+tPTnq40ZaU=;
	b=EjBTrYJRSCU70Q0XKEv6P++6hMRZLN8Wiaa3qHoDjfoq2PTWxcCJccsx3vFfgJLjp5
	JeMMjtHZnmM43II97WhQUwpLokdXTlSFGprZjWnwlpKhetJbgMsAILVfdihwkWtPes/l
	w8cYVS3n6UTO0IqfQvfpTJhx4vyFWq9Z1RpFTMqve0zandEvF+rzXkWUWn9zHMbGsRov
	SYbdW2I/hxlsdwSV4iipcCx0iNAL4EGu+HzH+xPspkVkyEsBY6aPokAq74+hlMxoMegv
	VAyaDGeLg5zhicevfNRBE2TqmgTc51Won0grJwrS6vd9jV4ayUCOz3NufY9z3swkkM+M
	swxA==
MIME-Version: 1.0
X-Received: by 10.152.87.210 with SMTP id ba18mr30739841lab.3.1423060750792;
	Wed, 04 Feb 2015 06:39:10 -0800 (PST)
Received: by 10.114.182.115 with HTTP; Wed, 4 Feb 2015 06:39:10 -0800 (PST)
In-Reply-To: <4f5c5ef09adc4e219522de0788b5912d@BN1AFFO11FD019.protection.gbl>
References: <fa0c0be68aa042b6bede0c2f644a2c42@BN1BFFO11FD008.protection.gbl>
	<CABZSBQfHtwWRJ62pW3XnAQRBX6HW06d3fqUDG8=zqNv5f+R5-w@mail.gmail.com>
	<CABZSBQc4u6OArq-jaz=WJCQ06RVmv3q3Z=Mw016LDvkz=FfPxA@mail.gmail.com>
	<CABZSBQcyJT093UnpZ4QDA4OQVNQFY8P+suWVTP2=ap4iysbiOQ@mail.gmail.com>
	<CABZSBQcVSi=C+_P+YLte93F6UfzB5k_=93QDxN434iw61NtoVA@mail.gmail.com>
	<4f5c5ef09adc4e219522de0788b5912d@BN1AFFO11FD019.protection.gbl>
Date: Wed, 4 Feb 2015 09:39:10 -0500
Message-ID: <CABZSBQf8-YR5T4JjUsUMf5ONLhP-GVH=Fu5Xo8aeetKYFTqyYw@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Nathan Rossi <nathan.rossi@xilinx.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [RFC 0/8] Update to Xen 4.5.0 and add AArch64 support
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
X-List-Received-Date: Wed, 04 Feb 2015 14:39:18 -0000
Content-Type: multipart/alternative; boundary=001a11c23d648b7e27050e44267a

--001a11c23d648b7e27050e44267a
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 4, 2015 at 4:11 AM, Nathan Rossi <nathan.rossi@xilinx.com>
wrote:

> > -----Original Message-----
> > From: Chris Patterson [mailto:cjp256@gmail.com]
> > Sent: Wednesday, February 04, 2015 3:25 PM
> > To: Nathan Rossi
> > Cc: meta-virtualization@yoctoproject.org
> > Subject: Re: [meta-virtualization] [RFC 0/8] Update to Xen 4.5.0 and add
> > AArch64 support
> >
> >
> >
> > On Wed, Feb 4, 2015 at 12:21 AM, Chris Patterson <cjp256@gmail.com>
> wrote:
> >
> >
> >
> >
> >       On Mon, Feb 2, 2015 at 2:15 AM, Chris Patterson <cjp256@gmail.com>
> > wrote:
> >
> >
> >
> >
> >               On Thu, Jan 29, 2015 at 11:44 PM, Chris Patterson
> > <cjp256@gmail.com> wrote:
> >
> >
> >                       Nice! :)  I'll try to take this for a test drive
> this
> > weekend and provide some feedback.
> >
> >                       On Thu, Jan 29, 2015 at 10:31 PM, Nathan Rossi
> > <nathan.rossi@xilinx.com> wrote:
> >
> >
> >                               This patch series updates the Xen recipes
> to use
> > version 4.5.0 as well as
> >                               refactoring and adding support for AArch64.
> >
> >                               The first 6 patches of this series are
> relatively
> > trivial changes: adding
> >                               additional files to packages, updating
> > dependencies and adding support for
> >                               additional architectures ontop of x86-64.
> The most
> > important change is the
> >                               moving of some x86 of the packages from
> xen-base
> > RDEPENDS to RRECOMMENDS.
> >
> >                               Patches 7 and 8 are the reason for this
> set being
> > a RFC instead of just a patch
> >                               set, I am after feedback regarding the
> changes I
> > have made for these patches.
> >                               In these two patches I disabled the
> building of
> > xen-qemu and seabios from
> >                               within the xen build system. There are a
> number of
> > issues in wrapping the xen
> >                               build system within OE (including source
> fetching
> > and cross building).
> >
> >
> >
> >
> >
> >               +1 with this approach. I'm sure that the qemu rev included
> > with the xen release is better tested and has some appropriate patches
> for
> > xen users.  However, the oe-core qemu recipe is in much better shape.
> > Someone could break it out into its own recipe, if so desired.
> >
> >
> >
> >                               Instead of building qemu from within xen,
> I have
> > configured the qemu which is
> >                               part of oe-core to build with xen support
> > (PACKAGECONFIG_append = "xen"). Since
> >                               xen support is available in mainline qemu
> this
> > allows for easier support of the
> >                               xen device emulation via qemu. The
> PACKAGECONFIG
> > option in oe-core does need to
> >                               be updated to point to the correct depends
> (which
> > is seperate to this patch
> >                               set).
> >
> >
> >
> >
> >
> >               Agreed, maybe document in README? In my local.conf, I
> added:
> >               PACKAGECONFIG_append_pn-qemu = " xen "
> >
> >
> >
> >                               SeaBIOS is disabled due to fetching issues
> as well
> > as only being supported on
> >                               x86. I have not worked out the issues
> around this
> > yet. I am querying as to
> >                               whether supporting it is desired, if so
> should it
> > be via the xen build system
> >                               or as a seperate recipe?
> >
> >
> >
> >
> >
> >               +1 to breaking it out as a separate recipe, but it is
> > important for us x86 hvm users :)  If you'd like, I could attempt to port
> > the recipe we use on openxt to meta-virtualization.
> >
> >
> >
> >
> >       Actually, it seems to go beyond just the rom bin(s) with hvmloader.
> > What about making it arch dependent feature?
> >
> >
> >
> >
> > My mailing list foo is weak this week.  Please ignore the above comment,
> I
> > forgot that was in the old draft. :)
> >
> >
> >
> >
> >
> >                               Thanks,
> >
> >                               Nathan
> >
> >                               Nathan Rossi (8):
> >                                 xen: Fix and refactor common include
> >                                 xen: Add Build and Target architecture
> mapping
> >                                 xen: Move x86/arch specific components
> into
> > RRECOMMENDS
> >                                 xen: Fix up architecture specific steps
> >                                 xen: Add aarch64 as compatible host
> >                                 xen-*image-minimal: Setup conditional
> based on
> > MACHINE_FEATURES
> >                                 xen: Update recipe to 4.5.0
> >                                 xen-image-minimal: Install qemu instead
> of xen-
> > qemu
> >
> >                                recipes-extended/images/xen-guest-image-
> > minimal.bb |   2 +-
> >                                recipes-extended/images/
> xen-image-minimal.bb
> > |   6 +-
> >                                ...lask-avoid-installing-policy-file-as-
> > boot.patch |  26 -----
> >                                recipes-extended/xen/xen-arch.inc
> > |  18 ++++
> >                                recipes-extended/xen/xen.inc
> > | 113 +++++++++++++++++----
> >                                recipes-extended/xen/xen_4.3.1.bb
> > |  24 -----
> >                                recipes-extended/xen/xen_4.5.0.bb
> > |  36 +++++++
> >                                7 files changed, 150 insertions(+), 75
> > deletions(-)
> >                                delete mode 100644 recipes-
> > extended/xen/files/flask-avoid-installing-policy-file-as-boot.patch
> >                                create mode 100644
> recipes-extended/xen/xen-
> > arch.inc
> >                                delete mode 100644 recipes-
> > extended/xen/xen_4.3.1.bb
> >                                create mode 100644 recipes-
> > extended/xen/xen_4.5.0.bb
> >
> >                               --
> >                               2.1.1
> >
> >                               --
> >
>  _______________________________________________
> >                               meta-virtualization mailing list
> >                               meta-virtualization@yoctoproject.org
> >
> https://lists.yoctoproject.org/listinfo/meta-
> > virtualization
> >
> >
> >
> >
> >
> >               I did some really basic testing of xen-image-minimal. I
> built
> > against master on a x86-64 host for an intel x86-64 target.
> >
> >
> >               For my build, I had to set TUNE_CCARGS="" for xen as the
> -mno-
> > sse flag required in xen/arch/x86/Rules.mk was conflicting with the
> > standard tune args.  I'm not sure the most appropriate way to do this,
> but
> > that's how I worked around it.  Any ideas on a better way to handle this?
> >
> >               Without addressing seabios, I couldn't do much to validate
> > running guests, but otherwise it seem to run fine. We'll have to figure
> > out something here.
> >
> >
> >               Nice work!
> >
> >               Cheers,
> >               -Chris
> >
> >
> >
> >
> >       Hey Nathan.  I made some progress on splitting out the firmware-
> > related packages on top of your patches.  I added a xen-hvmloader recipe
> > that would somehow need to be included in the image, but only for x86. I
> > still have some work to do, but my latest build seems to be usable for
> > basic x86 hvm.
> >
> >       Work in progress @ https://github.com/cjp256/meta-
> > virtualization/tree/master
> >
>
> Hi Chris,
>
> Nice work, I'm curious if there was any particular reason for the
> splitting of xen-hvmloader? As I was able to get it into the main xen
> recipe without any fuss, and 'configure' it via PACKAGECONFIG. (see branch
> mentioned below)
>
>
Originally it was because I started with a recipe that was used elsewhere,
and the hvmloader had the requirements for the ROM bits and I expected it
to be messier.  I do not see an issue with bringing it back together as you
did, I think that approach is ideal.

I have updated the patch series, and added some additional patches I was
> working on including systemd support, qemu PACKAGECONFIG setup/defaults and
> a patch for the xen -mno-sse issue. Instead of sending another patch series
> I have just uploaded it to github. Also I have two patches on the top of
> the branch with changes cherry-picked from your branch.
>
>
> https://github.com/nathanrossi/meta-virtualization/commits/nrossi/add-aarch64-support
>
>
Thanks for that, that looks good! For the cherry-pick of the "xen: break
out firmware bits" could you just add Signed-off by for Eric Chanudet <
eric.chanudet@gmail.com> for the portions I borrowed from his other work on
openxt?  I meant to do that before I pushed.  I fixed and rebased @
https://github.com/cjp256/meta-virtualization/tree/add-aarch64-support

Otherwise, there is just some minor recipe cleanup and an issue with
hvmloader picking up ipxe I wanted to look into which could be done with
follow up patches.

Out of curiosity, I noticed in your qemu bbappend that you use
PACKAGECONFIG[_defaultval].  I've never seen that before, is that
supported?  I have seen PACKAGECONFIG += which I believe accomplishes your
goal.  Your method apparently works though :)

Regards,
> Nathan
>

--001a11c23d648b7e27050e44267a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Feb 4, 2015 at 4:11 AM, Nathan Rossi <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:nathan.rossi@xilinx.com" target=3D"_blank">nathan.rossi@xilin=
x.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div><div>&gt; -----Original Message-----<br>
&gt; From: Chris Patterson [mailto:<a href=3D"mailto:cjp256@gmail.com" targ=
et=3D"_blank">cjp256@gmail.com</a>]<br>
&gt; Sent: Wednesday, February 04, 2015 3:25 PM<br>
&gt; To: Nathan Rossi<br>
&gt; Cc: <a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"=
_blank">meta-virtualization@yoctoproject.org</a><br>
&gt; Subject: Re: [meta-virtualization] [RFC 0/8] Update to Xen 4.5.0 and a=
dd<br>
&gt; AArch64 support<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Wed, Feb 4, 2015 at 12:21 AM, Chris Patterson &lt;<a href=3D"mailto=
:cjp256@gmail.com" target=3D"_blank">cjp256@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Mon, Feb 2, 2015 at 2:15 AM, Chris Patter=
son &lt;<a href=3D"mailto:cjp256@gmail.com" target=3D"_blank">cjp256@gmail.=
com</a>&gt;<br>
&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On Thu, Jan 29, =
2015 at 11:44 PM, Chris Patterson<br>
&gt; &lt;<a href=3D"mailto:cjp256@gmail.com" target=3D"_blank">cjp256@gmail=
.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0Nice! :)=C2=A0 I&#39;ll try to take this for a test drive this=
<br>
&gt; weekend and provide some feedback.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0On Thu, Jan 29, 2015 at 10:31 PM, Nathan Rossi<br>
&gt; &lt;<a href=3D"mailto:nathan.rossi@xilinx.com" target=3D"_blank">natha=
n.rossi@xilinx.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This patch series updates the Xen =
recipes to use<br>
&gt; version 4.5.0 as well as<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0refactoring and adding support for=
 AArch64.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The first 6 patches of this series=
 are relatively<br>
&gt; trivial changes: adding<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0additional files to packages, upda=
ting<br>
&gt; dependencies and adding support for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0additional architectures ontop of =
x86-64. The most<br>
&gt; important change is the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0moving of some x86 of the packages=
 from xen-base<br>
&gt; RDEPENDS to RRECOMMENDS.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Patches 7 and 8 are the reason for=
 this set being<br>
&gt; a RFC instead of just a patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set, I am after feedback regarding=
 the changes I<br>
&gt; have made for these patches.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0In these two patches I disabled th=
e building of<br>
&gt; xen-qemu and seabios from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0within the xen build system. There=
 are a number of<br>
&gt; issues in wrapping the xen<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0build system within OE (including =
source fetching<br>
&gt; and cross building).<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+1 with this app=
roach. I&#39;m sure that the qemu rev included<br>
&gt; with the xen release is better tested and has some appropriate patches=
 for<br>
&gt; xen users.=C2=A0 However, the oe-core qemu recipe is in much better sh=
ape.<br>
&gt; Someone could break it out into its own recipe, if so desired.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Instead of building qemu from with=
in xen, I have<br>
&gt; configured the qemu which is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part of oe-core to build with xen =
support<br>
&gt; (PACKAGECONFIG_append =3D &quot;xen&quot;). Since<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xen support is available in mainli=
ne qemu this<br>
&gt; allows for easier support of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xen device emulation via qemu. The=
 PACKAGECONFIG<br>
&gt; option in oe-core does need to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0be updated to point to the correct=
 depends (which<br>
&gt; is seperate to this patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set).<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Agreed, maybe do=
cument in README? In my local.conf, I added:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PACKAGECONFIG_ap=
pend_pn-qemu =3D &quot; xen &quot;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SeaBIOS is disabled due to fetchin=
g issues as well<br>
&gt; as only being supported on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0x86. I have not worked out the iss=
ues around this<br>
&gt; yet. I am querying as to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0whether supporting it is desired, =
if so should it<br>
&gt; be via the xen build system<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0or as a seperate recipe?<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+1 to breaking i=
t out as a separate recipe, but it is<br>
&gt; important for us x86 hvm users :)=C2=A0 If you&#39;d like, I could att=
empt to port<br>
&gt; the recipe we use on openxt to meta-virtualization.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Actually, it seems to go beyond just the rom=
 bin(s) with hvmloader.<br>
&gt; What about making it arch dependent feature?<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; My mailing list foo is weak this week.=C2=A0 Please ignore the above c=
omment, I<br>
&gt; forgot that was in the old draft. :)<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanks,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Nathan<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Nathan Rossi (8):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xen: Fix and refactor commo=
n include<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xen: Add Build and Target a=
rchitecture mapping<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xen: Move x86/arch specific=
 components into<br>
&gt; RRECOMMENDS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xen: Fix up architecture sp=
ecific steps<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xen: Add aarch64 as compati=
ble host<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xen-*image-minimal: Setup c=
onditional based on<br>
&gt; MACHINE_FEATURES<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xen: Update recipe to 4.5.0=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xen-image-minimal: Install =
qemu instead of xen-<br>
&gt; qemu<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recipes-extended/images/xen-guest=
-image-<br>
&gt; <a href=3D"http://minimal.bb" target=3D"_blank">minimal.bb</a> |=C2=A0=
 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recipes-extended/images/<a href=
=3D"http://xen-image-minimal.bb" target=3D"_blank">xen-image-minimal.bb</a>=
<br>
&gt; |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ...lask-avoid-installing-policy-f=
ile-as-<br>
&gt; boot.patch |=C2=A0 26 -----<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recipes-extended/xen/xen-arch.inc=
<br>
&gt; |=C2=A0 18 ++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recipes-extended/xen/xen.inc<br>
&gt; | 113 +++++++++++++++++----<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recipes-extended/xen/<a href=3D"h=
ttp://xen_4.3.1.bb" target=3D"_blank">xen_4.3.1.bb</a><br>
&gt; |=C2=A0 24 -----<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recipes-extended/xen/<a href=3D"h=
ttp://xen_4.5.0.bb" target=3D"_blank">xen_4.5.0.bb</a><br>
&gt; |=C2=A0 36 +++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 7 files changed, 150 insertions(+=
), 75<br>
&gt; deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 delete mode 100644 recipes-<br>
&gt; extended/xen/files/flask-avoid-installing-policy-file-as-boot.patch<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 create mode 100644 recipes-extend=
ed/xen/xen-<br>
&gt; arch.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 delete mode 100644 recipes-<br>
&gt; extended/xen/<a href=3D"http://xen_4.3.1.bb" target=3D"_blank">xen_4.3=
.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 create mode 100644 recipes-<br>
&gt; extended/xen/<a href=3D"http://xen_4.5.0.bb" target=3D"_blank">xen_4.5=
.0.bb</a><br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02.1.1<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__________________________________=
_____________<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta-virtualization mailing list<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:meta-virtualizat=
ion@yoctoproject.org" target=3D"_blank">meta-virtualization@yoctoproject.or=
g</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.yoctoproj=
ect.org/listinfo/meta-" target=3D"_blank">https://lists.yoctoproject.org/li=
stinfo/meta-</a><br>
&gt; virtualization<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I did some reall=
y basic testing of xen-image-minimal. I built<br>
&gt; against master on a x86-64 host for an intel x86-64 target.<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0For my build, I =
had to set TUNE_CCARGS=3D&quot;&quot; for xen as the -mno-<br>
&gt; sse flag required in xen/arch/x86/Rules.mk was conflicting with the<br=
>
&gt; standard tune args.=C2=A0 I&#39;m not sure the most appropriate way to=
 do this, but<br>
&gt; that&#39;s how I worked around it.=C2=A0 Any ideas on a better way to =
handle this?<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Without addressi=
ng seabios, I couldn&#39;t do much to validate<br>
&gt; running guests, but otherwise it seem to run fine. We&#39;ll have to f=
igure<br>
&gt; out something here.<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Nice work!<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Cheers,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Chris<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hey Nathan.=C2=A0 I made some progress on sp=
litting out the firmware-<br>
&gt; related packages on top of your patches.=C2=A0 I added a xen-hvmloader=
 recipe<br>
&gt; that would somehow need to be included in the image, but only for x86.=
 I<br>
&gt; still have some work to do, but my latest build seems to be usable for=
<br>
&gt; basic x86 hvm.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Work in progress @ <a href=3D"https://github=
.com/cjp256/meta-" target=3D"_blank">https://github.com/cjp256/meta-</a><br=
>
&gt; virtualization/tree/master<br>
&gt;<br>
<br>
</div></div>Hi Chris,<br>
<br>
Nice work, I&#39;m curious if there was any particular reason for the split=
ting of xen-hvmloader? As I was able to get it into the main xen recipe wit=
hout any fuss, and &#39;configure&#39; it via PACKAGECONFIG. (see branch me=
ntioned below)<br>
<br></blockquote><div><br></div><div>Originally it was because I started wi=
th a recipe that was used elsewhere, and the hvmloader had the requirements=
 for the ROM bits and I expected it to be messier.=C2=A0 I do not see an is=
sue with bringing it back together as you did, I think that approach is ide=
al.<br><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I have updated the patch series, and added some additional patches I was wo=
rking on including systemd support, qemu PACKAGECONFIG setup/defaults and a=
 patch for the xen -mno-sse issue. Instead of sending another patch series =
I have just uploaded it to github. Also I have two patches on the top of th=
e branch with changes cherry-picked from your branch.<br>
<br>
<a href=3D"https://github.com/nathanrossi/meta-virtualization/commits/nross=
i/add-aarch64-support" target=3D"_blank">https://github.com/nathanrossi/met=
a-virtualization/commits/nrossi/add-aarch64-support</a><br>
<br></blockquote><div><br></div><div>Thanks for that, that looks good! For =
the cherry-pick of the &quot;xen: break out firmware bits&quot; could you j=
ust add Signed-off by for Eric Chanudet &lt;<a href=3D"mailto:eric.chanudet=
@gmail.com">eric.chanudet@gmail.com</a>&gt; for the portions I borrowed fro=
m his other work on openxt?=C2=A0 I meant to do that before I pushed.=C2=A0=
 I fixed and rebased @ <a href=3D"https://github.com/cjp256/meta-virtualiza=
tion/tree/add-aarch64-support">https://github.com/cjp256/meta-virtualizatio=
n/tree/add-aarch64-support</a><br><br>Otherwise, there is just some minor r=
ecipe cleanup and an issue with hvmloader picking up ipxe I wanted to look =
into which could be done with follow up patches.<br><br></div><div>Out of c=
uriosity, I noticed in your qemu bbappend that you use PACKAGECONFIG[_defau=
ltval].=C2=A0 I&#39;ve never seen that before, is that supported?=C2=A0 I h=
ave seen PACKAGECONFIG +=3D which I believe accomplishes your goal.=C2=A0 Y=
our method apparently works though :)<br><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
Regards,<br>
Nathan<br>
</blockquote></div><br></div></div>

--001a11c23d648b7e27050e44267a--
