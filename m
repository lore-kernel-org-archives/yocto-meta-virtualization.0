Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 29E5DE00D14; Wed, 13 Mar 2019 19:59:21 -0700 (PDT)
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
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.178 listed in list.dnswl.org]
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
	[209.85.208.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7AC95E00D11
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 Mar 2019 19:59:19 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id d24so3429178ljc.12
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 Mar 2019 19:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=taHgyGQRn0TK3ecUrvKSH9hbSVX6wkQWMtvyEi65+W4=;
	b=PrN6dvQXFyRFjrlek5Yomn2dZzEgISANXJHVV4bF2f4iR83yEneZ8mMYFfXhN8RdAp
	rVKHvxem5Go1w3o+z74SScycXI/IXDLEfPLmbthB99U5ZuPFLmqleQiMGEicbmdYnDqL
	+KLneMsHrMjUZ4nLbf4KZtSi22MuGoZUKg86uLiqgMwIFEAJzHKJYN4ud5OlVCSvnAMe
	Z8n17PthRUc1yQUmK5i6boUfHJSw1HZNZfHST8P1yV3LjMWEqRm3a4Nc8PFQDq6pTSZE
	Fk2fYxF67vzh/H4aK2Cc9bS8Vl/1bCVNpFyBc4RE9pdZIlLFZSdgA1rqYeVd1SOnusT8
	An7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=taHgyGQRn0TK3ecUrvKSH9hbSVX6wkQWMtvyEi65+W4=;
	b=VG4d+hjPOj98fFzXkuhDIl658VgeZiVEeaifXUct5gSJSo6M59HHLYrLC4899cyQ9H
	R156PUUuowLJr5D84J7gGzF4vIZfltFnUxu9g4a48vO2vvFKyOuwXq+0/x/vVwYZxz1J
	5gmGGZBwO7CjDbNrOBsushz1g/UIZUTu1WzJBBpfAnSO5yEx5JC9HjQiaZfaeWXrHQXG
	uqYgfq2RSocgTHvBSjJrt4+rGp/Q2xeh9LDHC0IlBJDRLgoDytUxVBxsRYsyD9gpeEc3
	4pKtboi2JK6ooOCUX0KwVzFE1bI8njFA4hnKekPR6/UQwlVMAQZrHHetftv1MYWakLbW
	50Jw==
X-Gm-Message-State: APjAAAWOgg3FwHsewuOaL6OZwm94gq8LuMyIgewLKo6AA8s/es4ZuaiF
	SxoxC1SRDczRH6XszTe+cALxFAxtgr4D+5TsMx3MWFAY
X-Google-Smtp-Source: APXvYqzRvSLrApAwQqC+IA9/QEl0PpmTJQTzSjpibEHO13FDirz5dakfvdZSGC9UvBpa/0ikKZ/1VOI5WW8B0RA8CTk=
X-Received: by 2002:a2e:98c8:: with SMTP id s8mr25166636ljj.84.1552532358222; 
	Wed, 13 Mar 2019 19:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <1551927535-18666-1-git-send-email-dengke.du@windriver.com>
	<19ea4f51-91c8-21ff-b972-c7d36ec4e04f@windriver.com>
In-Reply-To: <19ea4f51-91c8-21ff-b972-c7d36ec4e04f@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 13 Mar 2019 22:59:08 -0400
Message-ID: <CADkTA4OeoDYtbY3zhgeTUK2LomKcE8-uLy2MBw01SD6Kawj_UA@mail.gmail.com>
To: ddu <dengke.du@windriver.com>
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
X-List-Received-Date: Thu, 14 Mar 2019 02:59:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm waiting for Mark to reply to your explanation. He had the open
question, I'm waiting for him to ack it.

Bruce

On Wed, Mar 13, 2019 at 8:12 PM ddu <dengke.du@windriver.com> wrote:
>
> Ping.
>
> =E5=9C=A8 2019/3/7 =E4=B8=8A=E5=8D=8810:58, Dengke Du =E5=86=99=E9=81=93:
> > The libvirt recipe in meta-virtualization already define the GROUPADD_P=
ARAM,
> > so we should append it, not override.
> >
> > Signed-off-by: Dengke Du <dengke.du@windriver.com>
> > ---
> >   meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappe=
nd b/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
> > index b55f9a9..0b0f011 100644
> > --- a/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
> > +++ b/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
> > @@ -5,7 +5,7 @@ PACKAGECONFIG ?=3D "qemu lxc test remote macvtap libvir=
td udev yajl \
> >
> >   inherit useradd
> >   USERADD_PACKAGES =3D "${PN}"
> > -GROUPADD_PARAM_${PN} =3D "--system libvirt"
> > +GROUPADD_PARAM_${PN}_append =3D " ;--system libvirt"
> >
> >   do_install_append() {
> >       sed -e "s:^#unix_sock_group =3D:unix_sock_group =3D:g" -i ${D}/et=
c/libvirt/libvirtd.conf
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

