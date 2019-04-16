Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 361E7E00CC9; Tue, 16 Apr 2019 13:51:40 -0700 (PDT)
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
	*      [209.85.208.180 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 735CFE006D8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Apr 2019 13:51:39 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id v13so20404556ljk.4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Apr 2019 13:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=70Ti/YdOWk2aj8KWcPU17QcGNYwQhPzu72zWwPtErRo=;
	b=mGRcZh/dzUYoFKE2nfx41ioxs3A/wkuf9Yh+cbOYZdcdkZZYkOIxNvjh4Np1TES3Sw
	0rsDeKn4jkwxQRbNLYmFHuJm/F3G0tgwErQW+GHvEwojhyKTVy2M0cB1bgEerPBT/W6n
	IF4yaJIOoLmANpgnQUjaXE716V6N/n2C+DLNTG8rpprwnNkVb6IpTDbqCC1AtTwAtvPT
	S9mfIjxEgcgmmWserquYLpwwQ7LogAwNq+kHUg3nAqDDoWKYwmxfB+1kg2EkuLoynoah
	Wn0C2SFjIRtirjUfMLWhcfa4wNlF/wrOHaz7sbV3LWGFgtTtG95jE9xYRbgsi2hJ+8Wz
	IIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=70Ti/YdOWk2aj8KWcPU17QcGNYwQhPzu72zWwPtErRo=;
	b=BCBjXC+KLOKhkFExp99wpDLKTheCh9sr2X5tXr5WAQF5ZoTJJIT1XNSvlqQbL+x3he
	CZWCnxgW+awhSKaFL4qah/zvKBAafU1dSKRjY8rRlSvcs21cdmLVQeQ103vHyPRXT4++
	skyGnfbV2WgegTvJZ6mCQoSBxOQ2G72RhD7YR8l+K6OGLVBginNPN0FM66Qzk/IcLzRc
	OGNnorkO7sqDfptnzBzFA9VPvkFkTwydEqGP9351QpqhJ7Vfm1hcX/+gJwFB1DONF/HB
	sEB63FpMjFe/ehAaL3w17GtXfTJXS6YpiXYHLyFhiolSiODt8w3hdPtg0w4pfaoYmvTZ
	UhxA==
X-Gm-Message-State: APjAAAWotaznx1IiLkUL+/KHVYNITKlZLA3n1zb/8vJWxCC2gFsvZdEj
	msptMVTaT3OLhCTYKMX/C1Uv1hucLCA69hC9yDs=
X-Google-Smtp-Source: APXvYqwpt7OXAcLN7sL8UbS4TiHbUYiT/H9AS9Zd+QKzJHdNCYx5m/WWprsL/VIJ+SztSJdAarataTKNYL8m1D/5s1w=
X-Received: by 2002:a2e:7806:: with SMTP id t6mr16954643ljc.143.1555447898383; 
	Tue, 16 Apr 2019 13:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <5E914B57-EE72-4830-8E45-8BC19CB7307E@arm.com>
	<CAPuovELwBEHwrU=jYFak2HqwcyXtSDspCDuKi2HSWAydLrUm=A@mail.gmail.com>
In-Reply-To: <CAPuovELwBEHwrU=jYFak2HqwcyXtSDspCDuKi2HSWAydLrUm=A@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 16 Apr 2019 13:51:26 -0700
Message-ID: <CACMJ4GYddyoA-Q+ZB_qwR+CP+pM93kxyteKJS4cuW-4q8-eNGQ@mail.gmail.com>
To: "M. Asselstine" <asselsm@mcmaster.ca>
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
X-List-Received-Date: Tue, 16 Apr 2019 20:51:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2019 at 6:47 PM M. Asselstine <asselsm@mcmaster.ca> wrote:
> On Mon, Apr 15, 2019 at 9:05 PM Sathees Balya <Sathees.Balya@arm.com> wro=
te:
> > Hi,
> >
> > The xen recipe has a hard dependency on dev86-native package (meta-virt=
ualization/recipes-extended/xen/xen.inc). It does not allow us to build for=
 aarch64 natively for Arm. At the moment, we have a workaround in the bbapp=
end file for xen to remove the dependency.
> >
> > DEPENDS_remove =3D "dev86-native"
> >
> > Can the recipe be made generic so that both x86 and Arm can be built wi=
thout the need for the above workaround? Thanks.
>
> I am not sure I am following you correctly. But I believe what you are
> looking for is to drop "dev86-native" from DEPENDS, where it is
> currently listed, and instead list it in something like
>
> DEPENDS_x86 =3D "dev86-native"
>
> in the xen.inc file. ie. make use of the overrides mechanism to only
> require it for x86 arch. Am I close?

Suggest: replace the string 'dev86-native' within xen.inc's DEPENDS
definition with:

${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'dev86-native', '', d)}

which will toggle the requirement for the dev86-native tools based on
the target arch the hypervisor is being built for.
If that looks OK, I can send a patch on top of the 4.12 version uprev
that I just posted.

Christopher

>
> MarkA
>
> >
> >
> >
> >
> > Regards,
> >
> > Sathees
> >
> > IMPORTANT NOTICE: The contents of this email and any attachments are co=
nfidential and may also be privileged. If you are not the intended recipien=
t, please notify the sender immediately and do not disclose the contents to=
 any other person, use it for any purpose, or store or copy the information=
 in any medium. Thank you.
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

