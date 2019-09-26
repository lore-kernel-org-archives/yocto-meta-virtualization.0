Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2595FE00D54; Thu, 26 Sep 2019 07:37:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000] *  0.0 FSL_HELO_FAKE FSL_HELO_FAKE
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.166.68 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E6E85E00C9B
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Sep 2019 07:37:15 -0700 (PDT)
Received: by mail-io1-f68.google.com with SMTP id q10so7219729iop.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Sep 2019 07:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=5MdCjA1Dmt4X79jDDKxKsxM/qnf/uhPQYT5uOtWYvm8=;
	b=RWjuF3pHxdZKL4PCkq8QsuFQ52G7rKti0RiCr/l0yVkM8jfJNoGhxNNVIV3npz7jOr
	1kniBIH1TkVXFUsk6d0fjTEMrSN9bujUMRI+KpIhDWyWMEFnnzTtYeKxLXWTryieRpW+
	LNu0IBFMYXw9y2HJ/qw1Dp98l0/PBi7ZHX7/9F9wD2uyt8OjNDoQ3rApw5ehjJJLYRzd
	J5PfUZ5oPMhcaI0ZSr0ndPZWxPrO2en7/OghOZu8pEWjP77MF3GTZrzsV44J9TSSocdX
	ZXptblVPALket1ACAqaco9dCUFmt12nkLLG1mhe/9A0QhNmqKLGnHd6fBP35l5z3+ZNP
	8/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=5MdCjA1Dmt4X79jDDKxKsxM/qnf/uhPQYT5uOtWYvm8=;
	b=Y9f0nbfBDZAcpK2AWxrBpOHHXfBFm7r7jRsZZySzHNbJXFERlD+DOVtJUTgXRy5F/l
	5wckrUBURIUNzShNNb8q42ETsVYzAyYbmxZ+82J79tPNRCT56UgPL+T5pis6ioMHMt0L
	52JKvyXhSJQ8IaiBN8Bky0ExyAmjnLEZVlFE0vaweHvB2WS7NIZ5c1VjiXdmUoKHq5vn
	V8o87/EpQZdi/jsKmmp9bCMSoUejQq4pfbqFjs35XbSWf5KQUyaLvE7UizBastheyIXu
	qadkWOW9AKKiTk4H6sG0nPQkW307sDZ3EuqiM7aYQeqU66AHcsSFIWzg/Mnmg5ZJEAd4
	J3gQ==
X-Gm-Message-State: APjAAAXhBrj6SswQcdBOe7P0UyrZCgiaabaqMHX7ZbBrPemaKH1+a5zu
	kRsQcZsPeBQjsAuhXj5X83qIWXVF7r4=
X-Google-Smtp-Source: APXvYqxv4AYPCwjXt1JZXE/remP4D4xloWIOEk3+6QpnjfEr58qgqrOd8WWkp5mzZuHgfAdAhy4V3Q==
X-Received: by 2002:a92:d110:: with SMTP id a16mr2584241ilb.97.1569508635328; 
	Thu, 26 Sep 2019 07:37:15 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95])
	by smtp.gmail.com with ESMTPSA id i24sm948752ioe.6.2019.09.26.07.37.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Sep 2019 07:37:14 -0700 (PDT)
Date: Thu, 26 Sep 2019 10:37:12 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20190926143711.GC9611@gmail.com>
References: <20190920071807.13139-1-stefan@agner.ch>
MIME-Version: 1.0
In-Reply-To: <20190920071807.13139-1-stefan@agner.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org,
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
X-List-Received-Date: Thu, 26 Sep 2019 14:37:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


In message: [meta-virtualization] [PATCH v2 0/7] podman: add initial recipe
on 20/09/2019 Stefan Agner wrote:

> From: Stefan Agner <stefan.agner@toradex.com>
> 
> This adds Podman a daemonless container engine for developing,
> managing, and running OCI Containers on your Linux System.
> Containers can either be run as root or in rootless mode.
> Simply put: `alias docker=podman`.
> 
> Currently the build tags systemd (if in DISTRO_FEATURES),
> seccomp, varlink and remoteclient are enabled which allows to
> run podman with overlayfs as root and vfs in rootless mode.
> The storage drivers btrfs and device-mapper have not been
> tested and are disabled at the moment.
> 
> --
> Stefan
> 
> Changes in v2:
> - Add slirp4netns recipe for rootless networking support
> - Fix podman recipe to build properly (set GOARCH properly)
> - Fix podman recipe commit message and comments
> - Add varlink and remoteclient to build tags
> - Move cni binaries to /usr/libexec/cni and create symlink for /opt/cni/bin


FYI: I have this queued and under test. I'll follow up to the
individual patches if i have questions or issues that I can't fix
myself.

Bruce

> 
> Stefan Agner (7):
>   conmon: initial add
>   go-metalinter: add recipe for gometalinter
>   go-md2man: add md2man
>   skopeo: add skopeo
>   cni: move cni tools to /usr/libexec/cni
>   slirp4netns: add slirp4netns user-mode networking
>   podman: add the Pod Manager tool
> 
>  recipes-containers/conmon/conmon_2.0.0.bb     | 30 ++++++
>  ...ail-if-clean-is-called-without-a-bui.patch | 31 +++++++
>  recipes-containers/cri-o/files/crio.conf      |  2 +-
>  recipes-containers/podman/podman_git.bb       | 93 +++++++++++++++++++
>  recipes-containers/skopeo/skopeo_git.bb       | 73 +++++++++++++++
>  recipes-devtools/go/go-md2man_git.bb          | 20 ++++
>  recipes-devtools/go/go-metalinter_git.bb      | 24 +++++
>  recipes-networking/cni/cni_git.bb             |  8 +-
>  .../slirp4netns/slirp4netns_0.4.1.bb          | 16 ++++
>  9 files changed, 294 insertions(+), 3 deletions(-)
>  create mode 100644 recipes-containers/conmon/conmon_2.0.0.bb
>  create mode 100644 recipes-containers/conmon/files/0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch
>  create mode 100644 recipes-containers/podman/podman_git.bb
>  create mode 100644 recipes-containers/skopeo/skopeo_git.bb
>  create mode 100644 recipes-devtools/go/go-md2man_git.bb
>  create mode 100644 recipes-devtools/go/go-metalinter_git.bb
>  create mode 100644 recipes-networking/slirp4netns/slirp4netns_0.4.1.bb
> 
> -- 
> 2.20.1
> 
> -- 
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

