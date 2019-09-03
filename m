Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4E3B3E00D68; Tue,  3 Sep 2019 10:28:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.208.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 47E48E00BA1
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 10:28:26 -0700 (PDT)
Received: by mail-lj1-f194.google.com with SMTP id j16so10714313ljg.6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Sep 2019 10:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QdDaWerqVscwFeexXIxjuMRxnGclHuwzNO+Nfh4M04Q=;
	b=jigBaoGNZw+HO/A3y3wkewRVg/3kmJBQyCoUZ2bBwGfPrnhCs4sQbBXX8EVES9gl23
	uuQt6Vrdidl0+La+5HFLm+KDN3YU1aPjNnDXaX9ZBy3p3CQhKRprXcE4+y5jHpquyqwa
	HSTTS20D7LciARiM5xPt1Kdwjh/KCnsf+W5p2jJ+LpbAMFVmkKS578orkq2NG7g03RBS
	jfUPxwNO9nuCny+Zv13HlgxghXdVt7z+iaQBo87kMN4bAcS325bKN7l4MMhZ1WFoxx3p
	npGcQaYb8ocyriXTCtEYyrst1MWaDQZE6OyVaR10ku5xsAMZC4TtbNWaIbvZsMRFYia1
	hdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QdDaWerqVscwFeexXIxjuMRxnGclHuwzNO+Nfh4M04Q=;
	b=Rq6U+rUbVMnS3dNTMX2Zeiks7WoWUFzal+v7A+2Z/ANHTVRr62OCPEI6x7sFptajNT
	wF3SzqWYHQ06ZZZA8I4vv5dCC2lkdZdN8aK/rZgqsShxKQoM6o/asxfl8sQU0R5w/YBB
	tg47xNzhiFrJfMkHWuq6PU+vanTlLAriXcbzEU2n/Gk5NoWTCNmgmW87/PLzlJNH/zGW
	pfep/ArZhQDtICz7yJCqvbDf7HFolUO0/5fj+fIjBNn7jZnb+nMqt5Sg8XKx+UjHkNIV
	iTNLEFWBOnbdfOMz6yyyfWi6jnUvhFergnoBp2tQkenIyaNN+g0dMnJC0WBmlqxiVxZV
	6EIQ==
X-Gm-Message-State: APjAAAU2jsAg/Gve0i1hjYUmuKQj52KhSLhgCFYaKK3Rj9Y8obKhvLYn
	IlSY3y8EUsGU1cDszbjkDZ2n+wNTcVdi8WX8u60=
X-Google-Smtp-Source: APXvYqwKvLglQFqJLejimEx+2Hd7b7WQLEiq0QzerPdMNX+ykzUYJZd+OXSzufhy7G4h8FrMGM9Gkjl7e8hP8DEzIU4=
X-Received: by 2002:a2e:5dc3:: with SMTP id v64mr14265708lje.118.1567531705307;
	Tue, 03 Sep 2019 10:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190901203338.38768-1-stefan@agner.ch>
	<20190901203338.38768-6-stefan@agner.ch>
	<bfacfb8a-fba3-325c-4a20-3d918d40bfb8@windriver.com>
In-Reply-To: <bfacfb8a-fba3-325c-4a20-3d918d40bfb8@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Sep 2019 13:28:14 -0400
Message-ID: <CADkTA4PUOB3nP5oJiwxc5qAKUHboEUfiGX-Wuo0R+9k_Sjuuqg@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 5/6] cni: move cni tools to /usr/lib/cni
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
X-List-Received-Date: Tue, 03 Sep 2019 17:28:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 1, 2019 at 9:33 PM ChenQi <Qi.Chen@windriver.com> wrote:
>
> On 09/02/2019 04:33 AM, Stefan Agner wrote:
> > From: Stefan Agner <stefan.agner@toradex.com>
> >
> > Use a standard location to store the cni tools and plugins. This
> > is more in line how other distributions package cni.
>
> But from what I see, at least Fedora and Ubuntu are using /opt/cni/bin
> directory.
> Also, have you tested such change with simple k8s setup which makes use
> of these plugins? E.g. flannel?

Indeed. I haven't seen anything that looks like a standard location
for these. I'd be interested to hear how testing went.

Is this something that we can make configurable ? That would be my
preference, that way we can be sure to not break anyone's use case.

Bruce

>
> Best Regards,
> Chen Qi
>
> > Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> > ---
> >   recipes-containers/cri-o/files/crio.conf | 2 +-
> >   recipes-networking/cni/cni_git.bb        | 4 ++--
> >   2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/recipes-containers/cri-o/files/crio.conf b/recipes-containers/cri-o/files/crio.conf
> > index 51d7f40..dd22465 100644
> > --- a/recipes-containers/cri-o/files/crio.conf
> > +++ b/recipes-containers/cri-o/files/crio.conf
> > @@ -144,4 +144,4 @@ registries = [
> >   network_dir = "/etc/cni/net.d/"
> >
> >   # plugin_dir is is where CNI plugin binaries are stored.
> > -plugin_dir = "/opt/cni/bin/"
> > +plugin_dir = "/usr/lib/cni/"
> > diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
> > index 5348b95..86e5e0f 100644
> > --- a/recipes-networking/cni/cni_git.bb
> > +++ b/recipes-networking/cni/cni_git.bb
> > @@ -63,7 +63,7 @@ do_compile() {
> >   }
> >
> >   do_install() {
> > -    localbindir="/opt/cni/bin"
> > +    localbindir="${libdir}/cni/"
> >
> >       install -d ${D}${localbindir}
> >       install -d ${D}/${sysconfdir}/cni/net.d
> > @@ -72,7 +72,7 @@ do_install() {
> >       install -m 755 -D ${WORKDIR}/plugins/bin/* ${D}/${localbindir}
> >   }
> >
> > -FILES_${PN} += "/opt/cni/bin/*"
> > +FILES_${PN} += "${libdir}/cni/*"
> >
> >   INSANE_SKIP_${PN} += "ldflags already-stripped"
> >
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

