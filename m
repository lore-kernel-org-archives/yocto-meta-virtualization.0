Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A992BE00D67; Tue,  3 Sep 2019 10:21:09 -0700 (PDT)
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
	*      [209.85.208.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DD441E00890
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 10:21:08 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id y23so5760567lje.9
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Sep 2019 10:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qWGmJkE7dfiDS6eQT/3vkhFKpmG1B9InaZSKvWOcBxg=;
	b=nkD8lgTyzpTp6c6yUVqJgSDnCCF9b6kpXdyjzbOKEOUez9GDLbQynooqyD4MouUmdr
	6pUp7/CcbVkidOyW9Jm7ubYXB9arDqXF8kT8yan7IS4Fa1zMDko+vHdvioS6byK3FSsx
	DisvV89MXDDmUrmOTVjVPd3898BiGtpAK0Vcj1uJeVEWgjZwqQrVjYBifFR3HMwcfIS5
	q0PsmcEvEH0xaEVFSPkuxeENn/EkJJjMRMlSGUG7GVrD1ve6Wqx74kICV/QmpWlL0JVl
	fpvaxCBk6dkvBZask5a9wMNiaAbN3LulbivfLTURRy8ZYXO1xl8eoYfPw/p+7xBXf7Rn
	fy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qWGmJkE7dfiDS6eQT/3vkhFKpmG1B9InaZSKvWOcBxg=;
	b=qbWkA6gJBqWJmkMM0FfyaQd9vqynkT6SYu9MXSs0kAPASYAKIzaC26VtPNkDcmyu0J
	1hwIX58Htag1qAnVLyrPaPBw3opJXyjeaYeBlk/Ap3zRLWVBxm0/IDB/ufy6fxhuFv03
	oFvv8F/a8UEQXrbVWjyAL9LDuekxXsuiBE775o7rbxfXtQU2ZzM/TntKxyRo8o4PklZS
	N5CXWodoNwrMOLDRlyAqpKJl63tZJ6JMlPyhv7UFJU7336QnMDepYrLmFVuFM4EkYdYs
	IglWVDUS06ckr85JJKwQig1FHmyREYSBugNanKYfB7ktTB+TSSrRFKRClKMzwFl7/E9p
	XLMQ==
X-Gm-Message-State: APjAAAXuqyR1ZGmw44ipn6mvLULWqDLxe1nHSsLuS5bWJMCGScp4AfYg
	1Y+B67UGhPvqIDn742h9qc6xikfJkwf04eKVgXA=
X-Google-Smtp-Source: APXvYqxxA+XGvKAZJ8BtmuKKnk6R3SQm+llvoIUblc/+UnVcR8P9BR9WC3VgDCen2U9L1TFHn/qjfDE4lEq3YLPdcDQ=
X-Received: by 2002:a2e:5dc3:: with SMTP id v64mr14245263lje.118.1567531267678;
	Tue, 03 Sep 2019 10:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190901203338.38768-1-stefan@agner.ch>
In-Reply-To: <20190901203338.38768-1-stefan@agner.ch>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Sep 2019 13:20:56 -0400
Message-ID: <CADkTA4P-KE9RaS02rqZP=fmvpNoxiZPPJZ1AdJr87yiWmsLCag@mail.gmail.com>
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
X-List-Received-Date: Tue, 03 Sep 2019 17:21:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 1, 2019 at 4:34 PM Stefan Agner <stefan@agner.ch> wrote:
>
> From: Stefan Agner <stefan.agner@toradex.com>
>
> This adds Podman a daemonless container engine for developing,
> managing, and running OCI Containers on your Linux System.
> Containers can either be run as root or in rootless mode.
> Simply put: `alias docker=podman`.
>

Also nice! This was also on my list, since I've been using runc/OCI
containers without any daemons for quite some time, and I thought this
would make a good addition to that support.

> Currently a minimal set of features is supported. It requires

Did you have a list of those features ? It might be a good idea to
document them in a  README, so we'll know when someone is asking for
something that isn't supported by design.

Bruce

> meta-security since libseccomp seems to be mandatory.
>
> --
> Stefan
>
> Stefan Agner (6):
>   conmon: initial add
>   go-metalinter: add recipe for gometalinter
>   go-md2man: add md2man
>   skopeo: add skopeo
>   cni: move cni tools to /usr/lib/cni
>   podmon: add the Pod Manager tool
>
>  recipes-containers/conmon/conmon_2.0.0.bb     | 30 ++++++
>  ...ail-if-clean-is-called-without-a-bui.patch | 31 +++++++
>  recipes-containers/cri-o/files/crio.conf      |  2 +-
>  recipes-containers/podman/podman_git.bb       | 91 +++++++++++++++++++
>  recipes-containers/skopeo/skopeo_git.bb       | 73 +++++++++++++++
>  recipes-devtools/go/go-md2man_git.bb          | 20 ++++
>  recipes-devtools/go/go-metalinter_git.bb      | 24 +++++
>  recipes-networking/cni/cni_git.bb             |  4 +-
>  8 files changed, 272 insertions(+), 3 deletions(-)
>  create mode 100644 recipes-containers/conmon/conmon_2.0.0.bb
>  create mode 100644 recipes-containers/conmon/files/0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch
>  create mode 100644 recipes-containers/podman/podman_git.bb
>  create mode 100644 recipes-containers/skopeo/skopeo_git.bb
>  create mode 100644 recipes-devtools/go/go-md2man_git.bb
>  create mode 100644 recipes-devtools/go/go-metalinter_git.bb
>
> --
> 2.20.1
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

