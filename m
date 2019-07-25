Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 094B2E00D30; Thu, 25 Jul 2019 08:44:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.210.65 listed in list.dnswl.org]
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 06DE8E00BEB
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jul 2019 08:44:07 -0700 (PDT)
Received: by mail-ot1-f65.google.com with SMTP id d17so52156053oth.5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jul 2019 08:44:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
	:from:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=Jz+edTOjYz9VC2qx5HRF3mIfQWHkie4elghkeG8Jl84=;
	b=TnMm4ZgWfB5Wgdo9wc2q8skcborIr4BdpBbpFsQwDDkuLPMqKN54xRLWR4mg2vT7Ut
	5kw5Uj4x3iJr5mKV0mxQGFKQ6h8F8080lc2glXOri6usAs8t8RGDtGsxEvP+MW66fG2J
	dDXBt+NLg8vWroRkEuBfBziag5ErQy9e6OkTxvN5I9KKIKjHIV1OHUT9lcdKYjTwSkqr
	jkYncObkt3/jgXKBBA3QwQEyomZNGc4BW5KDbSaoRM5wEgoVsStxOR4V3ehRZniQpEu6
	2Wzt4rtFEhFcCFDmlCUY0t6piUj6WV+bkjWUBP3KQYtdz+6k4UDPEUx3J2hL8dHtZY1+
	0ATA==
X-Gm-Message-State: APjAAAXK1IDUpxcvUQUcv6O2xC0E6dIzpUnsKR6RcYK1ZZqdq8dRUlKR
	y7nIA/IzOPUAxw4/+cs0rh2ivHEKCsrsTTr/6RloBQ==
X-Google-Smtp-Source: APXvYqwHOIwTsbtlrES2RbTNPmudr9qD+cl/7cPaL31lkXMaVx4/7p3DYvqZYKId85DBH//vOIQdzZTetlpuuFzmdSg=
X-Received: by 2002:a9d:7559:: with SMTP id b25mr24115426otl.360.1564069447260;
	Thu, 25 Jul 2019 08:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <CADC8fwdtBNVwBe6Gh-MxttWzai2xBM-iN5k0+=oCLwJqGqkKMQ@mail.gmail.com>
	<CADkTA4PPYiswmTZgoxED+oCgLfQV4vKDoV6oJMBaokaRhogGBg@mail.gmail.com>
In-Reply-To: <CADkTA4PPYiswmTZgoxED+oCgLfQV4vKDoV6oJMBaokaRhogGBg@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Thu, 25 Jul 2019 11:43:56 -0400
Message-ID: <CAPuovELanDNQ54LsVD=CdEVqd_VRfMJ1SfhirqooR73KQuLKMg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: Docker: include docker images to the Yocto image
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Jul 2019 15:44:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I can say that we are thinking about this and I would like to see
something eventually. We are starting off with the easy workflow,
using muliticonfigs to build additional container images and then
including them in a rootfs. Docker only becomes aware of the
containers on first boot. As I said, we are starting with the easy
parts. This is what I have deemed the 'long lived container' workflow,
ie. treating a container almost like any application you would find in
a rootfs that starts at boot and shuts down gracefully on shutdown. I
am not even so concerned with having these containers upgradable,
though this could be done without any work.

Bruce, I agree with your assessments above and the technical
challenges. If we move forward with any of this I will be sure to keep
folks on this list posted. Similarly if anyone does work on this
please let me know.

Mark

On Thu, Jul 25, 2019 at 10:10 AM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> On Thu, Jul 25, 2019 at 3:50 AM =D0=92=D0=B0=D0=BB=D0=B5=D0=BD=D1=82=D0=
=B8=D0=BD <imort.kz@gmail.com> wrote:
> >
> > Hello everyone,
> >
> > I wonder if it's possible to pull some docker images from the repositor=
y in the end of the Yocto image build so they'll be available without the n=
eed to load them at the first boot?
> >
>
> I haven't heard of anyone doing this (and I know that it isn't
> something I'm doing, or have considered), but hopefully if someone is
> doing something like this, they can offer some advice.
>
> What I can say, is that with an approach like this I see a few issues
> off the top of my head. You'd either need a docker-native (not easy to
> do, I've tried) or one of the other container manipulation projects
> (check the layer index for skopeo, etc) (and you'd also need them in
> -native .. also very hard to do .. I've tried) to fetch/pull the
> container image and put it into a place for the build to pickup and
> get into the image. If you didn't have those -native tools, you'd have
> a binding to the host.
>
> And it gets worse, if you are building and booting for x86-64, you
> might get away with things. But as a general solution, you'd likely
> need to run docker in qemu-user or otherwise specify your target
> architecture to even get a container of the right arch.
>
> On the non-technical side, if you were commercially shipping an image
> assembled like this, you'd have licensing and other issues to deal
> with for the image you pulled from the container registry.
>
> I can say that many of us, are building containers and installing them
> into images so they'll be available on first boot and can simply be
> run. The image-oci class that is part of meta-virt takes care of
> taking an OE built image and putting it into OCI format so it can be
> directly executed by runc (I'd recommend runc versus docker if you
> just want to execute container images). Those OCI images are
> compatible with docker, so you also should be able to install them to
> an image and run them directly. I just haven't worked through the
> details of that myself.
>
> Other alternatives could be  if you manually pull the containers,
> export them and create a recipe/bbclass that takes the exported
> container image and installs them to the image. You'd have the same
> licensing issues that I mentioned above, but from the point of view
> getting them into the image, it is just like any of the other "binary
> installs" that some people have done over the years.
>
> Another option could be to have a local to the target docker registry
> running, and when you boot, you'd pull them from there and not have to
> go to the wider network. That gives you some interesting upgrade
> options, etc, but has some unfinished technical challenges (like
> running and populating the registry as part of the build).
>
> Cheers,
>
> Bruce
>
> > I'm ok both with `docker pull` or `docker load` options.
> >
> > Thank you
> >
> >
> > --
> > Best regards,
> > Valentin Kim
> >
> > Skype: imortkz
> > Mobile & WhatsApp: +7 777 314 82 19
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

