Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EE51BE00DF8; Wed,  4 Sep 2019 05:36:03 -0700 (PDT)
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
	*      [209.85.128.67 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D51CCE00DE3
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Sep 2019 05:36:02 -0700 (PDT)
Received: by mail-wm1-f67.google.com with SMTP id p13so3546606wmh.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 04 Sep 2019 05:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=88fcjuRUDSGxUiGdJ9kptQOgIMS2FfQTsHoJ8ZjGUTs=;
	b=n9VTq0NvWiaZ7b5BtObKVVArOazugG+gMXZ/nPPqkpCJE7qr3zTIaqQt3m8HUvmZ78
	qdlfeILtCNUbi4aUHk93clux96lnnMPY4iAVlZ8uC1si8bTLHuT3zk/wWsptuVAbCu+Y
	zOUdAtl2gV+GZI57ACAHJwMhAFzPYnEuJwoeUnHpvc2wTp/akOHU9GP67tcywhZR8OkE
	91OCHeYWKkE1wFOtWqw3/NRjpomGHB30Ax0hUTm5nYsZ+7Ht/FYuOjT6heEoQqUIVR+C
	kuzxDr+cBpIts+owAP8qX+xcrLjxkSiQ71gsxgu99BCWVg3a29Ad8thUowZtKNFOEWvI
	FrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=88fcjuRUDSGxUiGdJ9kptQOgIMS2FfQTsHoJ8ZjGUTs=;
	b=lB5Q10mJFchnsLfHOtKLPCcJXKLDuyngSQXABnOQ7sfoAu3UvnU2O1JYipzAbI1OPS
	j8bAUjLXb91B5oH+fIGVrtAnuxXy8QJkr/8I6EWe/eWirJW3oVUqmuX0TuO8m4SW1ECy
	zgwHZHQB/FGZg14+1lRmSggdZzSv956bd3yy+KSJoKMCfMNsZHvHb/vTC8yNaeTO9N0L
	jCxBMzxNoYX9w2UosfATCqrswfw9YZC5yv7z1upiQuPCe5iWfO0Zw2u5Oeyh1DSpuAWF
	6H/fQG/PLcBsxMAlRMT3+H3eaVWlECTqd5r32Xm9km37pu9Zf9o/M8NmP+S0Rgnw9GV/
	VERQ==
X-Gm-Message-State: APjAAAVHsllj3IDBt6vaH2HCuj49xRnbYSHcm4hUGNla5w5iJ/hgPl+D
	oLJeSQIMTzAbhixLB2ucrT40cOd33mm7sXWxuuM=
X-Google-Smtp-Source: APXvYqw5vzTYEdh68D5hLgJlD8O4kTLnXFfVtg8vdkjs7aVvm08foWBm6E+V9GoBCK/CvnalJcjJU8jN7RQx/YsBu2M=
X-Received: by 2002:a1c:9a4a:: with SMTP id c71mr3929123wme.99.1567600561750; 
	Wed, 04 Sep 2019 05:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190901203338.38768-1-stefan@agner.ch>
	<CADkTA4P-KE9RaS02rqZP=fmvpNoxiZPPJZ1AdJr87yiWmsLCag@mail.gmail.com>
	<c84b6ed99deffe32a484fcfede7a3542@agner.ch>
In-Reply-To: <c84b6ed99deffe32a484fcfede7a3542@agner.ch>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 Sep 2019 08:35:50 -0400
Message-ID: <CADkTA4NFnvoJRUEdjOVZOBW81-aeMogu-H6GBrTsvT_i0sq0rw@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: meta-virtualization@yoctoproject.org,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH 0/6] podman: add initial recipe
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
X-List-Received-Date: Wed, 04 Sep 2019 12:36:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 4, 2019 at 2:44 AM Stefan Agner <stefan@agner.ch> wrote:
>
> On 2019-09-03 19:20, Bruce Ashfield wrote:
> > On Sun, Sep 1, 2019 at 4:34 PM Stefan Agner <stefan@agner.ch> wrote:
> >>
> >> From: Stefan Agner <stefan.agner@toradex.com>
> >>
> >> This adds Podman a daemonless container engine for developing,
> >> managing, and running OCI Containers on your Linux System.
> >> Containers can either be run as root or in rootless mode.
> >> Simply put: `alias docker=podman`.
> >>
> >
> > Also nice! This was also on my list, since I've been using runc/OCI
> > containers without any daemons for quite some time, and I thought this
> > would make a good addition to that support.
> >
> >> Currently a minimal set of features is supported. It requires
> >
> > Did you have a list of those features ? It might be a good idea to
> > document them in a  README, so we'll know when someone is asking for
> > something that isn't supported by design.
>
> The feature list actually grew to a bit more than minimal during
> development, so "minimal" is not quite accurate. But will be a bit more
> clear on what works in the next revision.

Even better!

Thanks for contributing the support.

Bruce

>
> --
> Stefan
>
> >
> > Bruce
> >
> >> meta-security since libseccomp seems to be mandatory.
> >>
> >> --
> >> Stefan
> >>
> >> Stefan Agner (6):
> >>   conmon: initial add
> >>   go-metalinter: add recipe for gometalinter
> >>   go-md2man: add md2man
> >>   skopeo: add skopeo
> >>   cni: move cni tools to /usr/lib/cni
> >>   podmon: add the Pod Manager tool
> >>
> >>  recipes-containers/conmon/conmon_2.0.0.bb     | 30 ++++++
> >>  ...ail-if-clean-is-called-without-a-bui.patch | 31 +++++++
> >>  recipes-containers/cri-o/files/crio.conf      |  2 +-
> >>  recipes-containers/podman/podman_git.bb       | 91 +++++++++++++++++++
> >>  recipes-containers/skopeo/skopeo_git.bb       | 73 +++++++++++++++
> >>  recipes-devtools/go/go-md2man_git.bb          | 20 ++++
> >>  recipes-devtools/go/go-metalinter_git.bb      | 24 +++++
> >>  recipes-networking/cni/cni_git.bb             |  4 +-
> >>  8 files changed, 272 insertions(+), 3 deletions(-)
> >>  create mode 100644 recipes-containers/conmon/conmon_2.0.0.bb
> >>  create mode 100644 recipes-containers/conmon/files/0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch
> >>  create mode 100644 recipes-containers/podman/podman_git.bb
> >>  create mode 100644 recipes-containers/skopeo/skopeo_git.bb
> >>  create mode 100644 recipes-devtools/go/go-md2man_git.bb
> >>  create mode 100644 recipes-devtools/go/go-metalinter_git.bb
> >>
> >> --
> >> 2.20.1
> >>
> >> --
> >> _______________________________________________
> >> meta-virtualization mailing list
> >> meta-virtualization@yoctoproject.org
> >> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

