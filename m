Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 40747E00D24; Thu, 14 Mar 2019 18:33:33 -0700 (PDT)
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
	*      [209.85.167.42 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
	[209.85.167.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 626BDE0049A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Mar 2019 18:33:32 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id u2so5657236lfd.4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Mar 2019 18:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=uV2G32xNhvwmLNim0KR+CtB0BdpPUOTMJ66nQVhqDdo=;
	b=mSGiXQ5QrCxqcpZUKb8W/xYXJZmPVctGB/HDR0mxR7/RB+X9myMYigEfWakCXLXZKR
	j9dsp5/TcurICrRv121GpR3ogm6JlA6jQMOkJVxHEgOFCD1iqX3Uit9BsUBXYIbFSFxR
	/zGWFZL3fbpdJ8h8hlxC1tQ9q0lWusbjC+WGyktMjVOfpGe4RIe7/wXcYRwzR9KzCieH
	CmDtDKidoQtc6wu3lSVA35FBw4eyiVM87WwYPrZeRp+uAcGFzlcjN+cN3bkwo2x8Oags
	2CVngPTVPk813nopxfCznl2U0Ubg6G4MbeTPc25tHAy7tquLegZSVEScMFOqGdKQ4aux
	nfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=uV2G32xNhvwmLNim0KR+CtB0BdpPUOTMJ66nQVhqDdo=;
	b=VB6+4D83AQ53Yx8nD25w96ETngo8+8xMToL9H3xu6UiwahO5PEXJ4CbllmDKFXo4p6
	Fnt4UIzXs6hbC9sghRswWyiVkM3FBQPilG189TDk0OUOHjbPbiA6Bo1nVvPHNi/JhcdO
	2W1K8qr86XC8Hq/n7DrzPTqYr5syIrhjbRVUQGebtN8H6BSir+3TZa0iJi5NepKhTV6d
	bdktqkcLnm7o0IAmXFDFNr1807QZ+b8G/08STu3UtoMrC3HBc3UzNYqmUrzKpbUZcFzA
	lc7eovzfrwf7FzOlOyYrr0dz6Sim86xjaqTmvgmqjmrdtdbJFCyCNWw3Vz4cqxYRlZ1v
	FLGQ==
X-Gm-Message-State: APjAAAVYbfRRsjUDGsBz4ji5xGGAOL9TEKljySN16dWlTi4AWNz5qLHh
	q5Kc9QLjXwW6+cQwDiQ7iKiYXFAy6PIDidBPwWQ=
X-Google-Smtp-Source: APXvYqxan3cabBipABi4xzOqlCV5bE9rwCwJh+JvhVKGNt2uK3t6pIB7p04vmJ+ptO33kxEQYaxtqXR/WslUAnX/FDY=
X-Received: by 2002:a19:598f:: with SMTP id n137mr650594lfb.140.1552613611109; 
	Thu, 14 Mar 2019 18:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <1551927535-18666-1-git-send-email-dengke.du@windriver.com>
	<19ea4f51-91c8-21ff-b972-c7d36ec4e04f@windriver.com>
	<CADkTA4OeoDYtbY3zhgeTUK2LomKcE8-uLy2MBw01SD6Kawj_UA@mail.gmail.com>
	<3cbe9ecd-e62f-8b60-8f96-1f390b32fa0f@windriver.com>
In-Reply-To: <3cbe9ecd-e62f-8b60-8f96-1f390b32fa0f@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 14 Mar 2019 21:33:21 -0400
Message-ID: <CADkTA4PCZiwH8QxnCxv9xskHYZTogvdfwHVugOz-ciDHRcdXxA@mail.gmail.com>
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
X-List-Received-Date: Fri, 15 Mar 2019 01:33:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 14, 2019 at 10:18 AM Mark Hatle <mark.hatle@windriver.com> wrot=
e:
>
> On 3/13/19 9:59 PM, Bruce Ashfield wrote:
> > I'm waiting for Mark to reply to your explanation. He had the open
> > question, I'm waiting for him to ack it.
>
> Sorry, I had nothing to add.. I was satisfied with the answer.
>
> Ack.

ok. Sounds good. I'm traveling tomorrow, so I'll take care of
outstanding merges over the weekend.

Bruce

>
> --Mark
>
> > Bruce
> >
> > On Wed, Mar 13, 2019 at 8:12 PM ddu <dengke.du@windriver.com> wrote:
> >>
> >> Ping.
> >>
> >> =E5=9C=A8 2019/3/7 =E4=B8=8A=E5=8D=8810:58, Dengke Du =E5=86=99=E9=81=
=93:
> >>> The libvirt recipe in meta-virtualization already define the GROUPADD=
_PARAM,
> >>> so we should append it, not override.
> >>>
> >>> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> >>> ---
> >>>   meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend | 2 +-
> >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbap=
pend b/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
> >>> index b55f9a9..0b0f011 100644
> >>> --- a/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
> >>> +++ b/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
> >>> @@ -5,7 +5,7 @@ PACKAGECONFIG ?=3D "qemu lxc test remote macvtap libv=
irtd udev yajl \
> >>>
> >>>   inherit useradd
> >>>   USERADD_PACKAGES =3D "${PN}"
> >>> -GROUPADD_PARAM_${PN} =3D "--system libvirt"
> >>> +GROUPADD_PARAM_${PN}_append =3D " ;--system libvirt"
> >>>
> >>>   do_install_append() {
> >>>       sed -e "s:^#unix_sock_group =3D:unix_sock_group =3D:g" -i ${D}/=
etc/libvirt/libvirtd.conf
> >> --
> >> _______________________________________________
> >> meta-virtualization mailing list
> >> meta-virtualization@yoctoproject.org
> >> https://lists.yoctoproject.org/listinfo/meta-virtualization
> >
> >
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

