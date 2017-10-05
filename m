Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3E82EE00D87; Thu,  5 Oct 2017 12:56:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.220.194 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.194 listed in dnsbl.sorbs.net]
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0629EE00C9F
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Oct 2017 12:56:23 -0700 (PDT)
Received: by mail-qk0-f194.google.com with SMTP id b124so8053335qke.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Oct 2017 12:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bPF3bp0RKL0Z51habEStRATTo6F0D54po75kc8hkHKs=;
	b=OJGXvCbPyrcLcpq4ZMpWyB53z+6tSsEbQDWlItd7uGocF0oEETWCc08EJwQDp666qX
	QFfTB+aPZzCLa7QlzTLEMYoIzr3Sl1s9aweoxiUgmIKbSfa7e6k7y++p+cK0GdHLXO9K
	yOXRRjNI7MG1Rh4Bb8g8AizFsI6ax9Q4LoXxzq1TKFvRVUUomJ4w2+y/Lmm6VnMdgxZg
	i3BJw07Sz0iZfCzhiG5LjIdH+iw6IO2Yee/aTe5/+JJvXU8UCNtZenGbi/Ek+V+49WUd
	/ys8Dh2WApXKfU3l8Hxk5FHYCyXyCLjrdQSJ7Q4zbNdBT+T5i5bU0eIjrYxnj1Sk8fep
	YwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bPF3bp0RKL0Z51habEStRATTo6F0D54po75kc8hkHKs=;
	b=lH78jt5wRYMzXAMQPWP8p41iELR+trt8TiiIecKn8X406GPyRdAM/EkzwEuaQ5ESUB
	6ZMQlWJ185TlvNID/1pN+C5T+JYQ+lhl4OMWZrCs+AEGF0DwYfzz3tQGESxeCZrL/cIa
	EEAiA4lXdpNcE5U6rdCHKuP+zQprSRyVAqPaQsJ3H0+ANk1soDq26O2cX+4V32QMwFx5
	ZF6utRBUTagp3bUaEXNXMKWRlkvL6aZO3HBZazk4ElEO98xqFlaR7eJHyEolOnpAnuh1
	mKGVN/+e9SMb+Oxgu3GCc/dG3wZ0eUJYu5uQWba62IuHEIJs7IsSNZ4iFgIddMoL4QXJ
	8wAw==
X-Gm-Message-State: AMCzsaVEthzJMRXr7ysKCGk7RUE9QLOXQ5fnj9KOVXvmptrVkVg9flNJ
	8fWG3hItGyGV5h/tDfAQXCISGkj5BPyJtiL/OosHFA==
X-Google-Smtp-Source: AOwi7QB4EKEfVUk8eaEgm2EeE2EHL3woN36ZmilgICEMetGhBpQdmaKvrAx2MJHujQddQM1O7DWiWoe1D66VwmI5e6Q=
X-Received: by 10.233.235.149 with SMTP id b143mr19231477qkg.218.1507233383081;
	Thu, 05 Oct 2017 12:56:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.215.197 with HTTP; Thu, 5 Oct 2017 12:56:22 -0700 (PDT)
In-Reply-To: <1507210699-13911-1-git-send-email-pbarker@toganlabs.com>
References: <1507210699-13911-1-git-send-email-pbarker@toganlabs.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 5 Oct 2017 15:56:22 -0400
Message-ID: <CADkTA4NVusTwhUj4eqgKJ=_SzBwpe1OEYkkoYgNne4McAjPb6A@mail.gmail.com>
To: Paul Barker <pbarker@toganlabs.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/4] netns update and runc fixes
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
X-List-Received-Date: Thu, 05 Oct 2017 19:56:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 5, 2017 at 9:38 AM, Paul Barker <pbarker@toganlabs.com> wrote:
> * Update netns to the latest release.
>
> * Fix runc compilation problems when targeting qemux86-64. Both runc-docker and
>   runc-opencontainers have been build tested with these changes.
>
> * Drop an old patch which is no longer used.

tested and merged.

Thanks Paul!

Bruce

>
> Paul Barker (4):
>   netns: Update to v0.2.1
>   runc: Drop obsolete patch
>   runc: Use correct go cross-compiler
>   runc: Don't override GOARCH or GOROOT
>
>  .../0001-Use-correct-go-cross-compiler.patch       | 85 ++++++++++++++++++++++
>  recipes-containers/runc/runc-docker_git.bb         |  3 +
>  .../0001-Use-correct-go-cross-compiler.patch       | 85 ++++++++++++++++++++++
>  recipes-containers/runc/runc-opencontainers_git.bb |  5 +-
>  recipes-containers/runc/runc.inc                   |  3 -
>  .../0001-nsexec-fix-build-against-musl-libc.patch  | 48 ------------
>  recipes-networking/netns/netns_git.bb              |  9 ++-
>  7 files changed, 182 insertions(+), 56 deletions(-)
>  create mode 100644 recipes-containers/runc/runc-docker/0001-Use-correct-go-cross-compiler.patch
>  create mode 100644 recipes-containers/runc/runc-opencontainers/0001-Use-correct-go-cross-compiler.patch
>  delete mode 100644 recipes-containers/runc/runc/0001-nsexec-fix-build-against-musl-libc.patch
>
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

