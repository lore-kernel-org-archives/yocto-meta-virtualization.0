Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B965EE00D3F; Wed, 17 Apr 2019 05:37:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.176 listed in list.dnswl.org]
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
	[209.85.167.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0337E0096F
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Apr 2019 05:37:11 -0700 (PDT)
Received: by mail-oi1-f176.google.com with SMTP id n187so19863769oih.6
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Apr 2019 05:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=9/5dD51BJ2NnNuGNlkkNcQuXi7VdTbIndkpUkwEu6pc=;
	b=L7/45dyysaVXWiE6gI+y1d37I5qnzBqjFORF1mFfVPqn5Y6v4+joR7FxF7zh5E+nTQ
	4Fp54HYmBPXpcIKSttquHqL0Y519lSw1j+M6fcfRoLarmuWcO3bzPiDQO7ESjKy7xExc
	cS0TZt2JCSoxMlP1qZQrO/gRf6PXERidBbMe21BKQ5+JM2Eej69L+QpnmCJH1XVPx1lF
	sbwhZGVUkyZG/Q6vNwhuGt1dCUIack+bKjsI05DuXQqXV9bz4XAJdWZpfXBx/K+LMkkt
	HpDVDqd/WnhFMNQ9mS8Qxh2e8Ew3+kNqEsknEKTy/8AMtTVpviuuKGbDOk6j/TPAa9ac
	88oQ==
X-Gm-Message-State: APjAAAXKrgSK98MH4f0z1rK4vlEqszrLa1GGIXTEQUSP0RCusLP54yIo
	404WMNNGDTNfctXkwy3xLCkawYZQjiYbIlObaHo=
X-Google-Smtp-Source: APXvYqx0lf1FHmn8dr3Mjdu9zXdFPZJQMZb0tvpnl85Bk2DtV3mRuzLGtLR+g0/W0KXPvP1zzpUjE0yWrI9Ve6UAukE=
X-Received: by 2002:aca:f20b:: with SMTP id q11mr26498731oih.4.1555504631131; 
	Wed, 17 Apr 2019 05:37:11 -0700 (PDT)
MIME-Version: 1.0
References: <5E914B57-EE72-4830-8E45-8BC19CB7307E@arm.com>
	<CAPuovELwBEHwrU=jYFak2HqwcyXtSDspCDuKi2HSWAydLrUm=A@mail.gmail.com>
	<CACMJ4GYddyoA-Q+ZB_qwR+CP+pM93kxyteKJS4cuW-4q8-eNGQ@mail.gmail.com>
In-Reply-To: <CACMJ4GYddyoA-Q+ZB_qwR+CP+pM93kxyteKJS4cuW-4q8-eNGQ@mail.gmail.com>
From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Wed, 17 Apr 2019 08:36:57 -0400
Message-ID: <CAPuovEJ6rA7j7uURyrGfHJhVENSZ8XVuzRzLhRYFrFr1o5R6tA@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
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
X-List-Received-Date: Wed, 17 Apr 2019 12:37:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2019 at 4:51 PM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> On Mon, Apr 15, 2019 at 6:47 PM M. Asselstine <asselsm@mcmaster.ca> wrote=
:
> > On Mon, Apr 15, 2019 at 9:05 PM Sathees Balya <Sathees.Balya@arm.com> w=
rote:
> > > Hi,
> > >
> > > The xen recipe has a hard dependency on dev86-native package (meta-vi=
rtualization/recipes-extended/xen/xen.inc). It does not allow us to build f=
or aarch64 natively for Arm. At the moment, we have a workaround in the bba=
ppend file for xen to remove the dependency.
> > >
> > > DEPENDS_remove =3D "dev86-native"
> > >
> > > Can the recipe be made generic so that both x86 and Arm can be built =
without the need for the above workaround? Thanks.
> >
> > I am not sure I am following you correctly. But I believe what you are
> > looking for is to drop "dev86-native" from DEPENDS, where it is
> > currently listed, and instead list it in something like
> >
> > DEPENDS_x86 =3D "dev86-native"
> >
> > in the xen.inc file. ie. make use of the overrides mechanism to only
> > require it for x86 arch. Am I close?
>
> Suggest: replace the string 'dev86-native' within xen.inc's DEPENDS
> definition with:
>
> ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'dev86-native', '', d)}

Does XEN_TARGET_ARCH ever actually deviate from TARGET_ARCH? I do
prefer using the overrides as it tends to be overall more clear to
read, but the will work too.

Sathees, there isn't much to the overrides, do a 'bitbake -e xen' and
pipe the output to a file. Then search for "OVERRIDES" and you should
find a list of override words, appending one of these words to a
variable such as DEPENDS will only set the assignment if the override
is present. Read a few tutorials and examine some examples and you
should be able to sort it out rather quickly.

MarkA

>
> which will toggle the requirement for the dev86-native tools based on
> the target arch the hypervisor is being built for.
> If that looks OK, I can send a patch on top of the 4.12 version uprev
> that I just posted.
>
> Christopher
>
> >
> > MarkA
> >
> > >
> > >
> > >
> > >
> > > Regards,
> > >
> > > Sathees
> > >
> > > IMPORTANT NOTICE: The contents of this email and any attachments are =
confidential and may also be privileged. If you are not the intended recipi=
ent, please notify the sender immediately and do not disclose the contents =
to any other person, use it for any purpose, or store or copy the informati=
on in any medium. Thank you.
> > > --
> > > _______________________________________________
> > > meta-virtualization mailing list
> > > meta-virtualization@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-virtualization
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization

