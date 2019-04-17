Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E92D5E00CF4; Wed, 17 Apr 2019 10:33:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (asselsm[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.181 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
	[209.85.167.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1F072E00CE8
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Apr 2019 10:33:01 -0700 (PDT)
Received: by mail-oi1-f181.google.com with SMTP id l203so20718760oia.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Apr 2019 10:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=r8jMzOtx5QJuy+A9i9ebhktvGFctrdeBjNKKUnieKCo=;
	b=dRKZ2SFLsK+PaQNMcvOCaQPL42ylchQ2GojOAo5HIqOy4iCRULn/XVB3lI80XxEHDB
	tCAlNx0acmnBjLtgzsYGTIwSwPtvNCPMCWE+94Yo1HrsoPApoo0Sp4DrlLTW1/dSQPyf
	5qtTtXV5Uf/yJMR2AkGNy/PCPrGYlDV9ysXfjuvJDldLmqib9yTH40ZagZBj1LgARLuZ
	oi+ThpUecbdBVrN0+FA1RPBesc+qWeTldjUnaIo4+TOfYE9P1ypQihGkIXp+1cTQt5Pr
	eW4c/riKiramneICL9Z0u+5bAavSB0BCegV7d3JaiN3tj5A5UOWABifmjIr5v0L/VMCE
	yzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=r8jMzOtx5QJuy+A9i9ebhktvGFctrdeBjNKKUnieKCo=;
	b=FO5tsExssQJqau56Mv+FkS5bZMsMJe1azN6POhPsh1S2GL57qI4996pGjQgSYsncEr
	lAdooCVPwrhThLBF40o2TURl4MDW8Or3TDarvvkxJ2Bm0zg9qvc95ekZBLHfY4Vl/piK
	X515aJXrbtmRzndX48ifHQCgPZoiQLNlG4bj+eUwC2lm5h3kJh6VTbSdRIjS3/MtziZ2
	6XRWP8WlUkwXRAlrbVVGf7Atb/0e1DLN2ABAWx5KjEoJzHUPb3X6UXjAwOdcQUtAE0AK
	peKUfS/uP8eJw2hh0jO93ZjxSj5l7cHBAjVTdcJQIRIg/6sbvxLXXEsr3+x6D8xtwdDo
	4AdQ==
X-Gm-Message-State: APjAAAVn6n5cipF67UlGGOS/7emuE9Ltspd2Kcl42EsNTPLxeGxMtrlF
	Prr8Su0K46AyBezu59zrA7040ajZ/uf8MqwHByk=
X-Google-Smtp-Source: APXvYqyTxf1Iioh7CbTDCyIx523z0kX5NCVnYeUdjZDWcsERdQ2qecK1Vc2GT63omZdDUSg4exna14z+kQNDJLD8URw=
X-Received: by 2002:aca:f20b:: with SMTP id q11mr62710oih.4.1555522381093;
	Wed, 17 Apr 2019 10:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <5E914B57-EE72-4830-8E45-8BC19CB7307E@arm.com>
	<CAPuovELwBEHwrU=jYFak2HqwcyXtSDspCDuKi2HSWAydLrUm=A@mail.gmail.com>
	<CACMJ4GYddyoA-Q+ZB_qwR+CP+pM93kxyteKJS4cuW-4q8-eNGQ@mail.gmail.com>
	<CAPuovEJ6rA7j7uURyrGfHJhVENSZ8XVuzRzLhRYFrFr1o5R6tA@mail.gmail.com>
	<2F2DB6C9-8B9B-42A3-AA61-2D00C50B0CE0@arm.com>
In-Reply-To: <2F2DB6C9-8B9B-42A3-AA61-2D00C50B0CE0@arm.com>
From: Mark Asselstine <asselsm@gmail.com>
Date: Wed, 17 Apr 2019 13:32:49 -0400
Message-ID: <CAPuovEJkh0GYCBdPYPr3Lb7W2JsgFUWijzFvaRt-2wW8mYXR8g@mail.gmail.com>
To: Sathees Balya <Sathees.Balya@arm.com>
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
X-List-Received-Date: Wed, 17 Apr 2019 17:33:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2019 at 12:38 PM Sathees Balya <Sathees.Balya@arm.com> wrot=
e:
>
> Thanks Mark and Chris.
>
> I applied the patch from Chris and was able to build for arm.
>
> Also, as Mark said bitbake -e xen returned the following for the OVERRIDE=
S with the aarch64.
>
> OVERRIDES=3D"linux:aarch64:pn-xen:fvp:aarch64:poky:class-target:libc-glib=
c:forcevariable"
>

Yes, these are expected. At any rate Chris has a patch out, it is in
Bruce's hands now to accept as is or request any updates.

MarkA

>
> Regards,
> Sathees
>
> =EF=BB=BFOn 17/04/2019, 13:37, "M. Asselstine" <asselsm@mcmaster.ca> wrot=
e:
>
>     On Tue, Apr 16, 2019 at 4:51 PM Christopher Clark
>     <christopher.w.clark@gmail.com> wrote:
>     >
>     > On Mon, Apr 15, 2019 at 6:47 PM M. Asselstine <asselsm@mcmaster.ca>=
 wrote:
>     > > On Mon, Apr 15, 2019 at 9:05 PM Sathees Balya <Sathees.Balya@arm.=
com> wrote:
>     > > > Hi,
>     > > >
>     > > > The xen recipe has a hard dependency on dev86-native package (m=
eta-virtualization/recipes-extended/xen/xen.inc). It does not allow us to b=
uild for aarch64 natively for Arm. At the moment, we have a workaround in t=
he bbappend file for xen to remove the dependency.
>     > > >
>     > > > DEPENDS_remove =3D "dev86-native"
>     > > >
>     > > > Can the recipe be made generic so that both x86 and Arm can be =
built without the need for the above workaround? Thanks.
>     > >
>     > > I am not sure I am following you correctly. But I believe what yo=
u are
>     > > looking for is to drop "dev86-native" from DEPENDS, where it is
>     > > currently listed, and instead list it in something like
>     > >
>     > > DEPENDS_x86 =3D "dev86-native"
>     > >
>     > > in the xen.inc file. ie. make use of the overrides mechanism to o=
nly
>     > > require it for x86 arch. Am I close?
>     >
>     > Suggest: replace the string 'dev86-native' within xen.inc's DEPENDS
>     > definition with:
>     >
>     > ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'dev86-native', '=
', d)}
>
>     Does XEN_TARGET_ARCH ever actually deviate from TARGET_ARCH? I do
>     prefer using the overrides as it tends to be overall more clear to
>     read, but the will work too.
>
>     Sathees, there isn't much to the overrides, do a 'bitbake -e xen' and
>     pipe the output to a file. Then search for "OVERRIDES" and you should
>     find a list of override words, appending one of these words to a
>     variable such as DEPENDS will only set the assignment if the override
>     is present. Read a few tutorials and examine some examples and you
>     should be able to sort it out rather quickly.
>
>     MarkA
>
>     >
>     > which will toggle the requirement for the dev86-native tools based =
on
>     > the target arch the hypervisor is being built for.
>     > If that looks OK, I can send a patch on top of the 4.12 version upr=
ev
>     > that I just posted.
>     >
>     > Christopher
>     >
>     > >
>     > > MarkA
>     > >
>     > > >
>     > > >
>     > > >
>     > > >
>     > > > Regards,
>     > > >
>     > > > Sathees
>     > > >
>     > > > IMPORTANT NOTICE: The contents of this email and any attachment=
s are confidential and may also be privileged. If you are not the intended =
recipient, please notify the sender immediately and do not disclose the con=
tents to any other person, use it for any purpose, or store or copy the inf=
ormation in any medium. Thank you.
>     > > > --
>     > > > _______________________________________________
>     > > > meta-virtualization mailing list
>     > > > meta-virtualization@yoctoproject.org
>     > > > https://lists.yoctoproject.org/listinfo/meta-virtualization
>     > > --
>     > > _______________________________________________
>     > > meta-virtualization mailing list
>     > > meta-virtualization@yoctoproject.org
>     > > https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.

