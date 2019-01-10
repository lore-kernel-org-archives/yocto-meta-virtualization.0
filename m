Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6063FE00CB0; Thu, 10 Jan 2019 10:10:10 -0800 (PST)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.178 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
	[209.85.208.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9C2B4E00B77
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Jan 2019 10:10:09 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id q2-v6so10524985lji.10
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Jan 2019 10:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WBABXZbvVwyS11TNe+mDia3XKBj1Mi0egk1uvSUxsVw=;
	b=QP9U9s0lRLCuTCe+euQHyEr0tjl+ZiywfmJKqD83z9o/lAKkyjPoKqPMbG5yTdgVXv
	JUt2Mak+NU7neNqSN74narHGGQXu6Tee08p+FjPO5B7Xh2hPxsC3xWkW3bplweAhsuFQ
	ilJsFeDifd8/6md17nFSJSATA1AO2Emagq6wUV034qqmpsMHzWXgKbk0K5dnVoocG/PG
	AdCyelaxH7MH4RajTFgcmp4KUA3K+F4IUG51zP12LqtuAmywXxBipklmmg1VbF3DN9sK
	M2XX9IZVmHonMmNI0bEyZT6WgewKkJuQk4YLJtGpCYP1NXII7fEKFnxpBYcDns5KF5wa
	Zq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WBABXZbvVwyS11TNe+mDia3XKBj1Mi0egk1uvSUxsVw=;
	b=Ul8pkZPQep7fcdwgUBcwEfoM+05BMiMJ3jLEmgVeiDfCJ6Mm7X704K+uWfmJI5w0OL
	J5bbgecFPmwgsnFvrNf55RRgyb8P8gFKVk6rlMEaJxQNKojFvpsX9VurvK5zdOGQCmN3
	pXDpj/1a2chfC97LhObXsfIckdf+Ru3ne6HWUc9F+6M2+Q7uGhaZgKG3+4K0v2JuDA4V
	lkH0C2XckIs/Rb1KBwARSYZTStI3CJTdAf2UuToVxjT6pFn/iSvJAGP6W7A/41gVmvlc
	5OFG9Q4YjZlQpW8xdyaeERKC6erVcmpV5KlgSEGpwTvVmwembthzrPw9BnToXbqHgERg
	2VzA==
X-Gm-Message-State: AJcUukd+cUvjIavyjy3RiyqyKPtKyHvn/HeZf6UzYGUYbfLDPle018kj
	wHk52a5y0/5EC5JH6r3JPrOtRXLondlDMbd1LZSpPQ==
X-Google-Smtp-Source: ALg8bN6Xdn9NvKYDNyOaiY2powV+KbELqXClpueLxRrv42LLcfTptukyu+gS6/oWlcRmabD/jsioJFkmhe1HygKL0YE=
X-Received: by 2002:a2e:9c7:: with SMTP id
	190-v6mr5827833ljj.120.1547143808402; 
	Thu, 10 Jan 2019 10:10:08 -0800 (PST)
MIME-Version: 1.0
References: <1546550556-25294-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1546550556-25294-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 10 Jan 2019 13:09:56 -0500
Message-ID: <CADkTA4OTqf4n9G6H_qZOzbadLzjD1322wi7A908g=N_Fw_Q3Pw@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] lxc: uprev from 3.0.3 to 3.1.0
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
X-List-Received-Date: Thu, 10 Jan 2019 18:10:10 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Thu, Jan 3, 2019 at 4:23 PM Mark Asselstine
<mark.asselstine@windriver.com> wrote:
>
> Minor updates and fixes. Improved ptest results per below.
>
>     root@cube-essential:/usr/lib64/lxc/ptest# ./run-ptest
>     ### Starting LXC ptest ###
>     FAIL: lxc-test-api-reboot
>     SKIPPED: lxc-test-apparmor
>     PASS: lxc-test-attach
>     PASS: lxc-test-automount
>     PASS: lxc-test-autostart
>     PASS: lxc-test-basic
>     PASS: lxc-test-cgpath
>     PASS: lxc-test-cloneconfig
>     PASS: lxc-test-clonetest
>     PASS: lxc-test-concurrent
>     PASS: lxc-test-config-jump-table
>     PASS: lxc-test-console
>     PASS: lxc-test-console-log
>     PASS: lxc-test-containertests
>     PASS: lxc-test-createconfig
>     PASS: lxc-test-createtest
>     PASS: lxc-test-criu-check-feature
>     PASS: lxc-test-destroytest
>     PASS: lxc-test-device-add-remove
>     PASS: lxc-test-get_item
>     PASS: lxc-test-getkeys
>     PASS: lxc-test-list
>     PASS: lxc-test-locktests
>     PASS: lxc-test-lxcpath
>     PASS: lxc-test-may-control
>     PASS: lxc-test-mount-injection
>     PASS: lxc-test-no-new-privs
>     PASS: lxc-test-parse-config-file
>     PASS: lxc-test-raw-clone
>     PASS: lxc-test-reboot
>     PASS: lxc-test-rootfs
>     PASS: lxc-test-saveconfig
>     PASS: lxc-test-share-ns
>     PASS: lxc-test-shortlived
>     SKIPPED: lxc-test-shutdowntest
>     PASS: lxc-test-snapshot
>     PASS: lxc-test-startone
>     SKIPPED: lxc-test-state-server
>     PASS: lxc-test-utils
>
>     Results:
>         PASSED = 35
>         FAILED = 1
>         SKIPPED = 3
>         (for details check individual test log in ./logs directory)
>
>     ### LXC ptest complete ###
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-containers/lxc/{lxc_3.0.3.bb => lxc_3.1.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-containers/lxc/{lxc_3.0.3.bb => lxc_3.1.0.bb} (97%)
>
> diff --git a/recipes-containers/lxc/lxc_3.0.3.bb b/recipes-containers/lxc/lxc_3.1.0.bb
> similarity index 97%
> rename from recipes-containers/lxc/lxc_3.0.3.bb
> rename to recipes-containers/lxc/lxc_3.1.0.bb
> index f3924e4..9dba76b 100644
> --- a/recipes-containers/lxc/lxc_3.0.3.bb
> +++ b/recipes-containers/lxc/lxc_3.1.0.bb
> @@ -48,8 +48,8 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>         file://lxc-net \
>         "
>
> -SRC_URI[md5sum] = "0aa1a982f7dfa4c7b8ce87b7047b0b6e"
> -SRC_URI[sha256sum] = "620cb832cc02c63bf4d330657bf6176544e145da281ee384a34d689635a19841"
> +SRC_URI[md5sum] = "e83e302a801494276f3772e687a3b8b0"
> +SRC_URI[sha256sum] = "4d8772c25baeaea2c37a954902b88c05d1454c91c887cb6a0997258cfac3fdc5"
>
>  S = "${WORKDIR}/${BPN}-${PV}"
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
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

