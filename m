Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A3E02E00CAA; Thu, 25 Jul 2019 07:10:42 -0700 (PDT)
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
	*      [209.85.208.179 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
	[209.85.208.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0EFD7E003E1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jul 2019 07:10:40 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id v18so48112359ljh.6
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jul 2019 07:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=cCjDiMvU9xVabkknOr+LM7doRC0KBAKY4sPYTRbG/8U=;
	b=IZOeJ25vnocncJVKRePKLfNYmdPdr0Xg8ENmtH8YmkiFVaAges4J7sIlKUheudZHwu
	7Ej17/O3ruSTMAkHWXoFzy2TSgL1/Ak1MujSfu0ae5EtqJmkHGe6HBRfwqVB5sWT4RNU
	unDikzQ3erOdUzClzzhPJxnr1DDEVHBi6EFqIDZNZxOh7Eiv8N84VfdiAHqNVxjREQig
	UH0qeMy7fuf+5WHc+Ubo68LKMMNQftxlLHvZF7rnyF9YxiB0GVb02l9NDkpy7PfeXfdo
	TJiknbayCnP0yYZUYdFLvjAJ14nLO5ttzJTbP7FVQac3YVW3PjWq0zgEjXNyt02WtE9A
	teFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=cCjDiMvU9xVabkknOr+LM7doRC0KBAKY4sPYTRbG/8U=;
	b=ttO05QjrNUWGb2BD0PBjgelY1RexBPnCr6Auh59ajRcJBHQiQyW2bhQ3M4KYFMjNMm
	O6Iw/DzjlH3ityr8G1IDccQK0Xndh1gH5dJOiZTiospPWgNqDXSCyholKxjph7yrZZyn
	0oKLD7nsU6TctFzTGdwdg+wxdJesaTFuU242/FfxKG4ltsLYnQUd8Ckj0skBymJed7yx
	ZeuSnGCAWGcgs18Ix6bqlUm7T5KPRYHnC+HRxUjo7h50Hfc7mq6YmZAVOFW7NBUf76D+
	LPjY/M4/fAbe+0gglu0ENaKfouXgWvXp8/dDQIGR8CJDKegvLsXDnmX+G/NB5TwB04Km
	DE4A==
X-Gm-Message-State: APjAAAVf7tkWJZ+EpovazyDvLoBP+qJhNANLoNfL2UXbHrqdD04GXdT2
	Pt2BJiTTbaZ6FrEQPU+tDsnFpIwict/4fS6ZkJI=
X-Google-Smtp-Source: APXvYqw4Wzn/Os9qgUqsNNrzsho8kJEGhL9tlWVof2Wf1xJe0jQJbTLczobpC2f7AlyyKA+zZzEAWVaj7l5QDDYdfB4=
X-Received: by 2002:a2e:8449:: with SMTP id u9mr2704173ljh.104.1564063839769; 
	Thu, 25 Jul 2019 07:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <CADC8fwdtBNVwBe6Gh-MxttWzai2xBM-iN5k0+=oCLwJqGqkKMQ@mail.gmail.com>
In-Reply-To: <CADC8fwdtBNVwBe6Gh-MxttWzai2xBM-iN5k0+=oCLwJqGqkKMQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 25 Jul 2019 10:10:28 -0400
Message-ID: <CADkTA4PPYiswmTZgoxED+oCgLfQV4vKDoV6oJMBaokaRhogGBg@mail.gmail.com>
To: =?UTF-8?B?0JLQsNC70LXQvdGC0LjQvQ==?= <imort.kz@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: Docker: include docker images to the Yocto image
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
X-List-Received-Date: Thu, 25 Jul 2019 14:10:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2019 at 3:50 AM =D0=92=D0=B0=D0=BB=D0=B5=D0=BD=D1=82=D0=B8=
=D0=BD <imort.kz@gmail.com> wrote:
>
> Hello everyone,
>
> I wonder if it's possible to pull some docker images from the repository =
in the end of the Yocto image build so they'll be available without the nee=
d to load them at the first boot?
>

I haven't heard of anyone doing this (and I know that it isn't
something I'm doing, or have considered), but hopefully if someone is
doing something like this, they can offer some advice.

What I can say, is that with an approach like this I see a few issues
off the top of my head. You'd either need a docker-native (not easy to
do, I've tried) or one of the other container manipulation projects
(check the layer index for skopeo, etc) (and you'd also need them in
-native .. also very hard to do .. I've tried) to fetch/pull the
container image and put it into a place for the build to pickup and
get into the image. If you didn't have those -native tools, you'd have
a binding to the host.

And it gets worse, if you are building and booting for x86-64, you
might get away with things. But as a general solution, you'd likely
need to run docker in qemu-user or otherwise specify your target
architecture to even get a container of the right arch.

On the non-technical side, if you were commercially shipping an image
assembled like this, you'd have licensing and other issues to deal
with for the image you pulled from the container registry.

I can say that many of us, are building containers and installing them
into images so they'll be available on first boot and can simply be
run. The image-oci class that is part of meta-virt takes care of
taking an OE built image and putting it into OCI format so it can be
directly executed by runc (I'd recommend runc versus docker if you
just want to execute container images). Those OCI images are
compatible with docker, so you also should be able to install them to
an image and run them directly. I just haven't worked through the
details of that myself.

Other alternatives could be  if you manually pull the containers,
export them and create a recipe/bbclass that takes the exported
container image and installs them to the image. You'd have the same
licensing issues that I mentioned above, but from the point of view
getting them into the image, it is just like any of the other "binary
installs" that some people have done over the years.

Another option could be to have a local to the target docker registry
running, and when you boot, you'd pull them from there and not have to
go to the wider network. That gives you some interesting upgrade
options, etc, but has some unfinished technical challenges (like
running and populating the registry as part of the build).

Cheers,

Bruce

> I'm ok both with `docker pull` or `docker load` options.
>
> Thank you
>
>
> --
> Best regards,
> Valentin Kim
>
> Skype: imortkz
> Mobile & WhatsApp: +7 777 314 82 19
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

