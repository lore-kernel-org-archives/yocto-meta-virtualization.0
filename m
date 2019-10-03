Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 57552E00D8C; Thu,  3 Oct 2019 06:23:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9794CE00D51
	for <meta-virtualization@yoctoproject.org>;
	Thu,  3 Oct 2019 06:23:22 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id y23so2710435lje.9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 03 Oct 2019 06:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dGE+zrx/kBf3jlwG2d2y1w7Hh8pSnL7q+qryyBzZ85M=;
	b=WOfdXEnftPE5B/oApSWQSEjfK5O7oya3RwObfCsXor2RCZdZubjRCW5dUSQEPkHEqG
	2q1JDNdLH0d4F+v5on+5/RJGD5wtnxH82nE5P5D0P1yiTsS7B1Q4Ct48iU/A269Mydrs
	+u4bqcUvBLO7n3FSFw90wqLW/bOQHTZjBohlgrhaAAD7yvoa6Y7c073xR2xEtUxcH/ks
	1kP8hsXlEtLVfc0tNUqI0SC6pftFH++Wulg7HdNGtEHEyE2R75jown/+1bSakAhFNnym
	m/m7bDjAAbQlB+fJx31ejU528mkDSLbfEfyHToSSaMOEpjT+pYoLF7Nr7WYxor8fD6/E
	LnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dGE+zrx/kBf3jlwG2d2y1w7Hh8pSnL7q+qryyBzZ85M=;
	b=epyMlMyMnrQUW8aHdnos9juT2h6BM8ME/zTm1y9AzUoYTpYstW54zPw8ngWZvcggdz
	IvluFdKTAUZrjP9IEzQA1uHE4/VPzHFXKrafiXB2v2sO5SfIo7kn+ahqdWRyvkO4GZXp
	B177lGy81R1n6IzqfrjpBN4lCupMYEF2kU5DhMGPvv7uKaZ7T3E3SaA+3HhSNVff4PSo
	nKkgy2MJolvfBCNO+2yRjhdn3sPNif/zzVWVh6BqW+PR5964WTbtIn5w99/OCjzhILqp
	3JThjgxI+E1iELVg69DEgQSPdQWj1qY1dCTDrlxlJ2kmbE7nW/HPDY6HW4iNF07xZ6lt
	N8xA==
X-Gm-Message-State: APjAAAVzX38PB96bApjIjVO83WfA26SKbcUynBWDGd8XZeZYdAICZnJO
	mcsBVY2nuJBff6Sort5uLSus/0LxsEopQtSFxs8G1aop
X-Google-Smtp-Source: APXvYqzJ8c9oX9IO3JGYoOqvAu/35wRVNj4qLyNmCvUsYb0mVg++REZq3WSnDFAcwK24wuuq7t3gOG1UgM4xEWFDeAQ=
X-Received: by 2002:a05:651c:1ae:: with SMTP id
	c14mr6167253ljn.169.1570109001264; 
	Thu, 03 Oct 2019 06:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190920071807.13139-1-stefan@agner.ch>
	<20190926143711.GC9611@gmail.com>
In-Reply-To: <20190926143711.GC9611@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 3 Oct 2019 09:23:10 -0400
Message-ID: <CADkTA4N2vdQu5coA5y1goibwNSXHc78x-Lsmb3E04B8JFxb9LQ@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH v2 0/7] podman: add initial recipe
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
X-List-Received-Date: Thu, 03 Oct 2019 13:23:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 26, 2019 at 10:37 AM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
>
> In message: [meta-virtualization] [PATCH v2 0/7] podman: add initial recipe
> on 20/09/2019 Stefan Agner wrote:
>
> > From: Stefan Agner <stefan.agner@toradex.com>
> >
> > This adds Podman a daemonless container engine for developing,
> > managing, and running OCI Containers on your Linux System.
> > Containers can either be run as root or in rootless mode.
> > Simply put: `alias docker=podman`.
> >
> > Currently the build tags systemd (if in DISTRO_FEATURES),
> > seccomp, varlink and remoteclient are enabled which allows to
> > run podman with overlayfs as root and vfs in rootless mode.
> > The storage drivers btrfs and device-mapper have not been
> > tested and are disabled at the moment.
> >
> > --
> > Stefan
> >
> > Changes in v2:
> > - Add slirp4netns recipe for rootless networking support
> > - Fix podman recipe to build properly (set GOARCH properly)
> > - Fix podman recipe commit message and comments
> > - Add varlink and remoteclient to build tags
> > - Move cni binaries to /usr/libexec/cni and create symlink for /opt/cni/bin
>
>
> FYI: I have this queued and under test. I'll follow up to the
> individual patches if i have questions or issues that I can't fix
> myself.

I just pushed the queue this morning. I stacked some commits on top to
tweak things a bit, but otherwise, they are as sent in this series.

I wasn't able to fully test podman due to a CNI networking issue, so
if you have a podman setup or log, I wouldn't mind seeing it so I can
run some additional tests.

Bruce

>
> Bruce
>
> >
> > Stefan Agner (7):
> >   conmon: initial add
> >   go-metalinter: add recipe for gometalinter
> >   go-md2man: add md2man
> >   skopeo: add skopeo
> >   cni: move cni tools to /usr/libexec/cni
> >   slirp4netns: add slirp4netns user-mode networking
> >   podman: add the Pod Manager tool
> >
> >  recipes-containers/conmon/conmon_2.0.0.bb     | 30 ++++++
> >  ...ail-if-clean-is-called-without-a-bui.patch | 31 +++++++
> >  recipes-containers/cri-o/files/crio.conf      |  2 +-
> >  recipes-containers/podman/podman_git.bb       | 93 +++++++++++++++++++
> >  recipes-containers/skopeo/skopeo_git.bb       | 73 +++++++++++++++
> >  recipes-devtools/go/go-md2man_git.bb          | 20 ++++
> >  recipes-devtools/go/go-metalinter_git.bb      | 24 +++++
> >  recipes-networking/cni/cni_git.bb             |  8 +-
> >  .../slirp4netns/slirp4netns_0.4.1.bb          | 16 ++++
> >  9 files changed, 294 insertions(+), 3 deletions(-)
> >  create mode 100644 recipes-containers/conmon/conmon_2.0.0.bb
> >  create mode 100644 recipes-containers/conmon/files/0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch
> >  create mode 100644 recipes-containers/podman/podman_git.bb
> >  create mode 100644 recipes-containers/skopeo/skopeo_git.bb
> >  create mode 100644 recipes-devtools/go/go-md2man_git.bb
> >  create mode 100644 recipes-devtools/go/go-metalinter_git.bb
> >  create mode 100644 recipes-networking/slirp4netns/slirp4netns_0.4.1.bb
> >
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

