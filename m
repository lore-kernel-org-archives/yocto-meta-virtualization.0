Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4CCFCE00C14; Thu, 18 Apr 2019 06:30:34 -0700 (PDT)
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
	*      [209.85.167.47 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1711EE00AD5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Apr 2019 06:30:32 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id u17so1654732lfi.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Apr 2019 06:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=UuGYGa1R8qwH/7ARwljHBM1HUwJN3G0ghO8vJubvMEo=;
	b=IvYToOhMgGAMh38scw986RTjVLP2mA6tBG0tVWQeWFxh11FgzDGQMjmtUzUXPaJiZf
	uPldvAYHkpV5vLQI5bfUskS413QTRr1h9Upyqse3HGW6Iq+mNr/zWyv9n3HztOtPOxvw
	EVnJwO3ZLWUfxFEe1Fwi296w+YOPcTVHkGHLj8OIM054WgqvUwfj2R8i391vHohbelrM
	Fx8gAGL0Yf6FKz4xtpXtb+QJ1ilHYc4LrMuTgiROphoyt+9+DO6i9e/ojdZKQevNTBUO
	tmt/QqvEjDVlQMDJVDTc+/XADE1CAI+CfZIYmn23+ZumLBwIhNaL9KZym4sJ7arJRkl4
	wS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=UuGYGa1R8qwH/7ARwljHBM1HUwJN3G0ghO8vJubvMEo=;
	b=LCqyz1ZzGLxKEgD9xAe5s5jZYOucL1xHfDcDDf4N6mkNZRMGgVzGIkyp3OFtDU7h3Q
	xaZ4ePTrlAyR4lbyUvmw88Nmqn/TXE+hdXhaARAYR1roPpr6HZAuukXCi960YfMjFJGs
	lp0br71BqNCPYsPDhJjqzJ0apgt2r99GkkABJB2ppKz8pVYDOAa9gvreoewXpy1f+BQK
	vEmY84uitbsOEV68TrZq7rKIC8eeezsPyBivtT3MAIO1rE5+kBurf1NPhniLaRXkbF1c
	VdrtQO62PjxmS7whTMZacTD67RTk0SvKj3tnvP4FVmh/2rHzOSUf5r8M8Bsv8AoVTThX
	RFDg==
X-Gm-Message-State: APjAAAUGW2JfjdZ2C5kJRKrnLyAp2FTlOpVH5sky01ZVJbF37ovrwdO3
	dykGWQkbTOc2S85yutCJIfk0+n0y2fanuje4pJI=
X-Google-Smtp-Source: APXvYqwb8r89i2FAvTOk89CjeolBKg6hH1gXSuF3B/E8vbkDLvmzUeO+B0/MIwFxWYkzOioM0i0f/Q71j1erOzyFYSQ=
X-Received: by 2002:a19:520e:: with SMTP id m14mr42878998lfb.65.1555594231043; 
	Thu, 18 Apr 2019 06:30:31 -0700 (PDT)
MIME-Version: 1.0
References: <5E914B57-EE72-4830-8E45-8BC19CB7307E@arm.com>
	<CAPuovELwBEHwrU=jYFak2HqwcyXtSDspCDuKi2HSWAydLrUm=A@mail.gmail.com>
	<CACMJ4GYddyoA-Q+ZB_qwR+CP+pM93kxyteKJS4cuW-4q8-eNGQ@mail.gmail.com>
	<CAPuovEJ6rA7j7uURyrGfHJhVENSZ8XVuzRzLhRYFrFr1o5R6tA@mail.gmail.com>
	<2F2DB6C9-8B9B-42A3-AA61-2D00C50B0CE0@arm.com>
	<CAPuovEJkh0GYCBdPYPr3Lb7W2JsgFUWijzFvaRt-2wW8mYXR8g@mail.gmail.com>
In-Reply-To: <CAPuovEJkh0GYCBdPYPr3Lb7W2JsgFUWijzFvaRt-2wW8mYXR8g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 18 Apr 2019 09:30:19 -0400
Message-ID: <CADkTA4OMXR728rFOGurJZKDNAaLRxty20vqKLA-WyAteKZR3iA@mail.gmail.com>
To: Mark Asselstine <asselsm@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Dev86-native dependency
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
X-List-Received-Date: Thu, 18 Apr 2019 13:30:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2019 at 1:33 PM Mark Asselstine <asselsm@gmail.com> wrote:
>
> On Wed, Apr 17, 2019 at 12:38 PM Sathees Balya <Sathees.Balya@arm.com> wr=
ote:
> >
> > Thanks Mark and Chris.
> >
> > I applied the patch from Chris and was able to build for arm.
> >
> > Also, as Mark said bitbake -e xen returned the following for the OVERRI=
DES with the aarch64.
> >
> > OVERRIDES=3D"linux:aarch64:pn-xen:fvp:aarch64:poky:class-target:libc-gl=
ibc:forcevariable"
> >
>
> Yes, these are expected. At any rate Chris has a patch out, it is in
> Bruce's hands now to accept as is or request any updates.

As it turns out TARGET_ARCH and XEN_ARCH do differ a bit. x86-64
versus x86_64. While we could use TARGET_ARCH as an override and be
correct .. I'm worried about clarity in the recipes if I start mixing
the two architecture variables.

I prefer the overrides mechanism as well, but for now, I'll go with
the anonymous python snippet.

Bruce

>
> MarkA
>
> >
> > Regards,
> > Sathees
> >
> > =EF=BB=BFOn 17/04/2019, 13:37, "M. Asselstine" <asselsm@mcmaster.ca> wr=
ote:
> >
> >     On Tue, Apr 16, 2019 at 4:51 PM Christopher Clark
> >     <christopher.w.clark@gmail.com> wrote:
> >     >
> >     > On Mon, Apr 15, 2019 at 6:47 PM M. Asselstine <asselsm@mcmaster.c=
a> wrote:
> >     > > On Mon, Apr 15, 2019 at 9:05 PM Sathees Balya <Sathees.Balya@ar=
m.com> wrote:
> >     > > > Hi,
> >     > > >
> >     > > > The xen recipe has a hard dependency on dev86-native package =
(meta-virtualization/recipes-extended/xen/xen.inc). It does not allow us to=
 build for aarch64 natively for Arm. At the moment, we have a workaround in=
 the bbappend file for xen to remove the dependency.
> >     > > >
> >     > > > DEPENDS_remove =3D "dev86-native"
> >     > > >
> >     > > > Can the recipe be made generic so that both x86 and Arm can b=
e built without the need for the above workaround? Thanks.
> >     > >
> >     > > I am not sure I am following you correctly. But I believe what =
you are
> >     > > looking for is to drop "dev86-native" from DEPENDS, where it is
> >     > > currently listed, and instead list it in something like
> >     > >
> >     > > DEPENDS_x86 =3D "dev86-native"
> >     > >
> >     > > in the xen.inc file. ie. make use of the overrides mechanism to=
 only
> >     > > require it for x86 arch. Am I close?
> >     >
> >     > Suggest: replace the string 'dev86-native' within xen.inc's DEPEN=
DS
> >     > definition with:
> >     >
> >     > ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'dev86-native',=
 '', d)}
> >
> >     Does XEN_TARGET_ARCH ever actually deviate from TARGET_ARCH? I do
> >     prefer using the overrides as it tends to be overall more clear to
> >     read, but the will work too.
> >
> >     Sathees, there isn't much to the overrides, do a 'bitbake -e xen' a=
nd
> >     pipe the output to a file. Then search for "OVERRIDES" and you shou=
ld
> >     find a list of override words, appending one of these words to a
> >     variable such as DEPENDS will only set the assignment if the overri=
de
> >     is present. Read a few tutorials and examine some examples and you
> >     should be able to sort it out rather quickly.
> >
> >     MarkA
> >
> >     >
> >     > which will toggle the requirement for the dev86-native tools base=
d on
> >     > the target arch the hypervisor is being built for.
> >     > If that looks OK, I can send a patch on top of the 4.12 version u=
prev
> >     > that I just posted.
> >     >
> >     > Christopher
> >     >
> >     > >
> >     > > MarkA
> >     > >
> >     > > >
> >     > > >
> >     > > >
> >     > > >
> >     > > > Regards,
> >     > > >
> >     > > > Sathees
> >     > > >
> >     > > > IMPORTANT NOTICE: The contents of this email and any attachme=
nts are confidential and may also be privileged. If you are not the intende=
d recipient, please notify the sender immediately and do not disclose the c=
ontents to any other person, use it for any purpose, or store or copy the i=
nformation in any medium. Thank you.
> >     > > > --
> >     > > > _______________________________________________
> >     > > > meta-virtualization mailing list
> >     > > > meta-virtualization@yoctoproject.org
> >     > > > https://lists.yoctoproject.org/listinfo/meta-virtualization
> >     > > --
> >     > > _______________________________________________
> >     > > meta-virtualization mailing list
> >     > > meta-virtualization@yoctoproject.org
> >     > > https://lists.yoctoproject.org/listinfo/meta-virtualization
> >
> >
> > IMPORTANT NOTICE: The contents of this email and any attachments are co=
nfidential and may also be privileged. If you are not the intended recipien=
t, please notify the sender immediately and do not disclose the contents to=
 any other person, use it for any purpose, or store or copy the information=
 in any medium. Thank you.
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

