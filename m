Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 61358E00E0A; Fri, 30 Aug 2019 00:31:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [178.209.48.109 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
X-Greylist: delayed 522 seconds by postgrey-1.32 at yocto-www;
	Fri, 30 Aug 2019 00:31:50 PDT
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D83FFE00956
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Aug 2019 00:31:50 -0700 (PDT)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 18CF85C0137;
	Fri, 30 Aug 2019 09:23:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1567149786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=5gnWe7Lh1RMln8D3jFmuYMpwaRvj1xzG/6yvt6MVNz8=;
	b=FY3+F4gBQ+KBt/e8uIofZDRdT37YhvhSOfKlKNpi54BKESAYZRx62/6RabLmCicD/dwOFi
	WEiD2baKlK0AWFvlX2aD8920P85zg2KX3XzLkgYvjBJuyDzTTdW6ihAv75Wh5MEXWWwWNT
	+rnFJjkILHGivxzFaSYdorH+7qE9ekM=
MIME-Version: 1.0
Date: Fri, 30 Aug 2019 09:23:05 +0200
From: Stefan Agner <stefan@agner.ch>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
In-Reply-To: <CADkTA4PPYiswmTZgoxED+oCgLfQV4vKDoV6oJMBaokaRhogGBg@mail.gmail.com>
References: <CADC8fwdtBNVwBe6Gh-MxttWzai2xBM-iN5k0+=oCLwJqGqkKMQ@mail.gmail.com>
	<CADkTA4PPYiswmTZgoxED+oCgLfQV4vKDoV6oJMBaokaRhogGBg@mail.gmail.com>
Message-ID: <2352f8490768d61eefa287e00d15783c@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
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
X-List-Received-Date: Fri, 30 Aug 2019 07:31:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2019-07-25 16:10, Bruce Ashfield wrote:
> On Thu, Jul 25, 2019 at 3:50 AM Валентин <imort.kz@gmail.com> wrote:
>>
>> Hello everyone,
>>
>> I wonder if it's possible to pull some docker images from the repository in the end of the Yocto image build so they'll be available without the need to load them at the first boot?
>>
> 
> I haven't heard of anyone doing this (and I know that it isn't
> something I'm doing, or have considered), but hopefully if someone is
> doing something like this, they can offer some advice.

I know that balena is doing this in their docker-disk recipe:
https://github.com/balena-os/meta-balena/tree/master/meta-balena-common/recipes-containers/docker-disk

However, they do access the host Docker to make this happen, which seems
not particular nice.

It really seems to me that the Docker image storage is well guarded by
the Docker daemon, and it is not meant that somebody accesses the
storage directly (and as far as I am aware there are no tools to do
this).

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

Probably an easier version of this is to store the image using `docker
save`, put it somewhere into the image and have a one-time service which
does `docker load` and cleanup.


What I am currently looking into is using podman. It is designed as a
replacement, and the storage format is more open. skopeo can write
podman images directly, so then its only a matter of invoking skopeo
with the correct settings.


Best regards,
Stefan

> 
> Cheers,
> 
> Bruce
> 
>> I'm ok both with `docker pull` or `docker load` options.
>>
>> Thank you
>>
>>
>> --
>> Best regards,
>> Valentin Kim
>>
>> Skype: imortkz
>> Mobile & WhatsApp: +7 777 314 82 19
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
> 
> 
> 
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

