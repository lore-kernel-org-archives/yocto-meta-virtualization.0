Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C274E00D77; Sat, 16 Mar 2019 17:23:10 -0700 (PDT)
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
	*      [209.85.167.44 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
	[209.85.167.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D68F8E00B77
	for <meta-virtualization@yoctoproject.org>;
	Sat, 16 Mar 2019 17:23:09 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id h6so9267623lfc.2
	for <meta-virtualization@yoctoproject.org>;
	Sat, 16 Mar 2019 17:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=JQdi9Gm93O1TJUVvlusp9jiAuPsZQAZqiwdsqJ34yLo=;
	b=V87BdRTE+EkXeqYPi8sFvHpU2d2ajz22iKVZWL52HaRsUFiZdC2GwN9YxMmMoLLhwO
	b4S0hkLK6ddkKQ/cbH8kSJ2fQNzjmjjAqkU8SyUVsINdQXeVh6maKFGODsKS0CBxE0Dk
	5fvORoo+4hg20leLkAM19I01YS2J3X9oekIW2/m6g7ZKS40JAKPregJxg2YwrWnfHHMt
	qCuXYV0LILz6zYIUYNF8NGGvIEQQjQ7dgtSDWItWPSRKTJ+UU2jauqNI3E2MIP2vbyCP
	6HdSFzUsokHA18cv9CVH3D7sVMRp9VX2oledMMSm76CISx0SClKOeBsHWqXdS6nFxXMa
	RsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=JQdi9Gm93O1TJUVvlusp9jiAuPsZQAZqiwdsqJ34yLo=;
	b=pUtuXrR0B03Xlf5dGnnXhe6KZqPe0XZ4c8n1gUCKjyTUfUD+uLpbsgl4m2w867Aktr
	KI8PP5ZwCdwj8JMbLhUU2JmiTpv3fiNcyeqL0JJDL5CbJ5SCip4bb+62Sgowx9yiMyV0
	pM424VnN+QTPvgn6BxPXGr11awhDcPVBfTOg+45rzDpcwkeZztIy1wszUi4IqMJ1Drb5
	mdFwb0UcOfsd5uyItL4gN8ZI1KaIjOQa0X7DWX7fSReSgQbGFQi0gdgOyVwn5O10PY9A
	OvDPXqTwHuDmpgyMQps22XBxeCvUgTKS5owu/vleoCfnUQOfhzgMl36kYxwV8O7rCE9S
	/f1g==
X-Gm-Message-State: APjAAAWRApXtrcsS9yl77qd4TkrxxDBHNeEjgCtibT2DKeZogNw3PHbf
	mDZWLdHWgKCDsnC5I+2fPvW2aHKq3HZ8AFZ6bYo=
X-Google-Smtp-Source: APXvYqzvANU5bzFBz9Ogxd8LJEYoMZFmGoIL6aA5gMQRHrudw9lEcDEyh8b6dIwYLRVrc0nKNDzCKOsvjjyhc3qI8UY=
X-Received: by 2002:a19:2bca:: with SMTP id r193mr2010176lfr.2.1552782188759; 
	Sat, 16 Mar 2019 17:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <1551927535-18666-1-git-send-email-dengke.du@windriver.com>
	<19ea4f51-91c8-21ff-b972-c7d36ec4e04f@windriver.com>
	<CADkTA4OeoDYtbY3zhgeTUK2LomKcE8-uLy2MBw01SD6Kawj_UA@mail.gmail.com>
	<3cbe9ecd-e62f-8b60-8f96-1f390b32fa0f@windriver.com>
	<CADkTA4PCZiwH8QxnCxv9xskHYZTogvdfwHVugOz-ciDHRcdXxA@mail.gmail.com>
In-Reply-To: <CADkTA4PCZiwH8QxnCxv9xskHYZTogvdfwHVugOz-ciDHRcdXxA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 16 Mar 2019 20:22:57 -0400
Message-ID: <CADkTA4N5-Kn0Mh4ojt6irKq5Z5tZQNb5bOKVHSb2Be=_ueUdoQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH] libvirt: fix GROUPADD_PARAM override conflict
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
X-List-Received-Date: Sun, 17 Mar 2019 00:23:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is now merged

Bruce

On Thu, Mar 14, 2019 at 9:33 PM Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
>
> On Thu, Mar 14, 2019 at 10:18 AM Mark Hatle <mark.hatle@windriver.com> wr=
ote:
> >
> > On 3/13/19 9:59 PM, Bruce Ashfield wrote:
> > > I'm waiting for Mark to reply to your explanation. He had the open
> > > question, I'm waiting for him to ack it.
> >
> > Sorry, I had nothing to add.. I was satisfied with the answer.
> >
> > Ack.
>
> ok. Sounds good. I'm traveling tomorrow, so I'll take care of
> outstanding merges over the weekend.
>
> Bruce
>
> >
> > --Mark
> >
> > > Bruce
> > >
> > > On Wed, Mar 13, 2019 at 8:12 PM ddu <dengke.du@windriver.com> wrote:
> > >>
> > >> Ping.
> > >>
> > >> =E5=9C=A8 2019/3/7 =E4=B8=8A=E5=8D=8810:58, Dengke Du =E5=86=99=E9=
=81=93:
> > >>> The libvirt recipe in meta-virtualization already define the GROUPA=
DD_PARAM,
> > >>> so we should append it, not override.
> > >>>
> > >>> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> > >>> ---
> > >>>   meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend | 2 =
+-
> > >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bb=
append b/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
> > >>> index b55f9a9..0b0f011 100644
> > >>> --- a/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
> > >>> +++ b/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
> > >>> @@ -5,7 +5,7 @@ PACKAGECONFIG ?=3D "qemu lxc test remote macvtap li=
bvirtd udev yajl \
> > >>>
> > >>>   inherit useradd
> > >>>   USERADD_PACKAGES =3D "${PN}"
> > >>> -GROUPADD_PARAM_${PN} =3D "--system libvirt"
> > >>> +GROUPADD_PARAM_${PN}_append =3D " ;--system libvirt"
> > >>>
> > >>>   do_install_append() {
> > >>>       sed -e "s:^#unix_sock_group =3D:unix_sock_group =3D:g" -i ${D=
}/etc/libvirt/libvirtd.conf
> > >> --
> > >> _______________________________________________
> > >> meta-virtualization mailing list
> > >> meta-virtualization@yoctoproject.org
> > >> https://lists.yoctoproject.org/listinfo/meta-virtualization
> > >
> > >
> > >
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

