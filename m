Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 45366E00C87; Wed,  3 Jul 2019 07:04:55 -0700 (PDT)
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
	*      [209.85.208.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15202E00B65
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Jul 2019 07:04:53 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id h10so2607842ljg.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 03 Jul 2019 07:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=agyZTNJOkqxaSbLzkt5HtjMRU6PbjzY0VIbEudgb6xQ=;
	b=lc1elZbKdxDHaL37lsaJvuu6H5oteIp7pC5VDj00QK0QviAWN0b6BlDQwBxxYGBo5I
	iDTyMZtjSwAgFZSK/JpQGaVxsQOKvSbf0fniGhxdn0UWR2gxz4+xVN2MFhTuNkfyjJ19
	WGLUmMmpkIPqq0aC7HErKyu4sH8sIZz2sSkLTYp4b0pqCwM8J2C34LBKp4XCuzXlXIv+
	YDrQBLGCSzrwVimtsBrvGt+HgJmRM1tVApC857NdqJaX/re8Sx6fDzDpEH4UsNoE2boU
	dfhyPVoMqmvctq89ysbPXGb8VW30nmRRZsGnGzL9VxZRGPd06ihmXQ8pA2GtGCWGlKUX
	gVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=agyZTNJOkqxaSbLzkt5HtjMRU6PbjzY0VIbEudgb6xQ=;
	b=RZb+QzOjbjG3QSAGQzpgKk7p2lmORpgfSOMI+KXLEk8eYnmpLOACyMzAcw1pbEgSMo
	Vi3EF7gIDeHYATe8ZYeYEeHALOl0NV+5BCiaNJnJ5g9H/ICaPWx7PaKRGCO37IJ91xKM
	/qYC0nfO1l7eWfjy0ZC9//jy2beEVQMOD3yOqTq2Ih0uEYIJZlYjNdKqk05k5Tt99cJp
	quOlyR/hnZQZp4UZQDLun6AdLmj8XAqtQ3QSEW+clHkeOmSFn3HHja8hnWH+kErKP2T2
	RRyUMua3ieuT+fWjX4UZ2oV/KCZ2CKc77EYYxJydQdgmVPTx+oZGuP2AVBzDzH+9VALD
	rQSw==
X-Gm-Message-State: APjAAAU1dSMzND2ugUqiQZrblrgcROH0VjKg3b1AbK9ACDJLW+q/67Hx
	p0OdVoKTn4kZ6sNUMbOgH7r6pg++1WCMa1Ty5t4M39HV
X-Google-Smtp-Source: APXvYqx/+gby2XUeeLA+/FArfUP+BKKhrzne+pwUmDAmE3EuHaKCK2Kcdk0+6djI8zS0M8eDKdq9yVkaFQTD9xAMqIM=
X-Received: by 2002:a2e:9ac4:: with SMTP id p4mr21277540ljj.185.1562162692462; 
	Wed, 03 Jul 2019 07:04:52 -0700 (PDT)
MIME-Version: 1.0
References: <1561674444-21344-1-git-send-email-bostancioglucevat@gmail.com>
	<CABPcKDMuW_7WwCJzbFnxn+MxnXk4MfTUOiqq+7b0rJa7p9+aGQ@mail.gmail.com>
	<CADkTA4O7qqfoOPEuaUmg562qXFkJQEE-5h2coWWxya4jdfHPkg@mail.gmail.com>
In-Reply-To: <CADkTA4O7qqfoOPEuaUmg562qXFkJQEE-5h2coWWxya4jdfHPkg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 3 Jul 2019 10:04:41 -0400
Message-ID: <CADkTA4PGD4E8X-WYuWRbLpXqY-ZjB0aiKRQwQCAK_RZb7=1KXg@mail.gmail.com>
To: =?UTF-8?B?Q2V2YXQgQm9zdGFuY8Sxb8SfbHU=?= <bostancioglucevat@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] singularity: openssl cert configs path fixed.
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
X-List-Received-Date: Wed, 03 Jul 2019 14:04:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2019 at 11:38 AM Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
>
> It's only been on the list for 4 days, 2 of which were a weekend (and
> today is a holiday where I am). Almost everything sits on the list for
> 48 hours while waiting for comments, then is queued to be pushed after
> that.
>
> So it is just over the 48 hour comment window, and I'll most likely
> queue it on Tuesday.

My local build tests passed.

I was tempted to see if we could make this backward compatible, but
since the old ssl is EOL .. and this is the master branch, I've merged
this as-is.

Cheers,

Bruce

>
> Bruce
>
> On Mon, Jul 1, 2019 at 5:06 AM Cevat Bostanc=C4=B1o=C4=9Flu
> <bostancioglucevat@gmail.com> wrote:
> >
> > Hello, did you guys checked this patch?
> > Cevat
> >
> > ---------- Forwarded message ---------
> > G=C3=B6nderen: Cevat Bostancioglu <bostancioglucevat@gmail.com>
> > Date: 28 Haz 2019 Cum, 01:27
> > Subject: [meta-virtualization][PATCH] singularity: openssl cert configs=
 path fixed.
> > To: <meta-virtualization@yoctoproject.org>
> > Cc: Cevat Bostancioglu <bostancioglucevat@gmail.com>
> >
> >
> > openssl recipe moves ssl-1.1 directory as ssl , singularity recipe cann=
ot find ssl-1.1 path.
> > ---
> >  recipes-containers/singularity/singularity_git.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/recipes-containers/singularity/singularity_git.bb b/recipe=
s-containers/singularity/singularity_git.bb
> > index 6fee8f3..e50052c 100644
> > --- a/recipes-containers/singularity/singularity_git.bb
> > +++ b/recipes-containers/singularity/singularity_git.bb
> > @@ -30,6 +30,6 @@ pkg_postinst_${PN}() {
> >
> >      # python3 expects CA certificates to be installed in a different p=
lace to where
> >      # they are actually installed. These lines link the two locations.
> > -    rm -r $D${libdir}/ssl-1.1/certs
> > -    ln -sr $D${sysconfdir}/ssl/certs $D${libdir}/ssl-1.1
> > +    rm -r $D${libdir}/ssl/certs
> > +    ln -sr $D${sysconfdir}/ssl/certs $D${libdir}/ssl
> >  }
> > --
> > 2.7.4
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

