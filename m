Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 587BAE00D1E; Mon, 16 Oct 2017 08:55:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.193 listed in dnsbl.sorbs.net]
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6DEECE00D1B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Oct 2017 08:55:15 -0700 (PDT)
Received: by mail-qk0-f193.google.com with SMTP id k123so13414092qke.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Oct 2017 08:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oisc+1Gs/rBLjBqMBAfkUL70lY9v6vwF4saUyZ9inxQ=;
	b=o+4BXpBpgC/Frv6QsrLaH3o4NzOauZPlfceKVCBc+2LTkS12JAlAG6Ib9t1UnnvAxN
	ufk0yiCDzwUjKPWmLAexg3hcrzJtChOnoT9dMO7b0E0XdQURmRF3Jv+0kNkx4zMUMWpd
	fRhlx4o+06/TRRf/reZyTJ6SgFYfkyhTgg5zYUPNFJeBfVlON6kbUpXgalx3BszaRPUt
	tjWgGX9DjoR8dS2NKUmFBXuA5ohII8AxUXm9U3VbTcdzri3bb2HmQ0n+ptB3mPgGhFCg
	QHYE9cIQt4pUXJ5fb/EJTDyEa49KI9zD9/CYyalpKqjegYWAytrngu2k7ttSH88PQn+2
	gxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oisc+1Gs/rBLjBqMBAfkUL70lY9v6vwF4saUyZ9inxQ=;
	b=P16oCUaS1kHvN+0YcILEsCOW89B9iRVYgEJOK4AVXbEEYxwDEURffWOYzfpfRDvqMl
	UEpT5vX/S9t3SVCtc+0D4anpkO6viEN0ZeCm42vCCra47wcodKaiQ6u3kk5yIiDwelwM
	WxPpd8TyvJV4hO+OpJa9zfWS129cma5gpPAq+jZX4J0VVwSWSiaBCPSFdWZeMhKASl8W
	AAe6Go9DyB1E4unqHHNwbfjo8T1wf7sFZ9aPhrLuwCPq5pvqB++58nWKTzLChKu/Ouid
	2V/0xo2jyIgX8ldNCZZxau7S6pDlegta6VJXdiJvZAvHx7qxm5ZEZcHvqzhQA3xQi/Rm
	LTQw==
X-Gm-Message-State: AMCzsaUh+t4o6KpwmSVyWH2ZuoOrAQAiwAOLP1jC/kTxH1dwQqOX5crt
	t1f8PiqmWRLHyWs8BtZW8FRVaHXoU8hPRgN6p6I=
X-Google-Smtp-Source: ABhQp+QHkteTs1jf+sRppvErT29N9ANoTw3a5aKoUBSr96qlkFYOXHgP1F3kk7fslQQF8Ew2bUddQ05tU5tRyV5ip0Y=
X-Received: by 10.55.159.4 with SMTP id i4mr14359563qke.339.1508169314519;
	Mon, 16 Oct 2017 08:55:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.215.197 with HTTP; Mon, 16 Oct 2017 08:55:13 -0700 (PDT)
In-Reply-To: <1507922836-17295-1-git-send-email-pbarker@toganlabs.com>
References: <1507922836-17295-1-git-send-email-pbarker@toganlabs.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 16 Oct 2017 11:55:13 -0400
Message-ID: <CADkTA4NQd8UVa7RFGns0mr2ecAoWEWexec9KoYbQnsn8e+YE9Q@mail.gmail.com>
To: Paul Barker <pbarker@toganlabs.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/5] netns fix and runc recipe simplification
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
X-List-Received-Date: Mon, 16 Oct 2017 15:55:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 13, 2017 at 3:27 PM, Paul Barker <pbarker@toganlabs.com> wrote:
> Here's another round of changes. The first patch fixes netns cross-compilation.
> The rest replace "[PATCH 4/4] runc: Simplify recipes" from the previous series,
> splitting it into separate commits and dropping churn where it adds no value.
>
> I've left the merging of common metadata as the last patch incase that still
> isn't wanted.

This variant of the merged meta data is fine.

I've merged all 5 patches now.

Bruce

>
> Paul Barker (5):
>   netns: Use correct go cross-compiler
>   runc-opencontainers: Drop unnecessary do_compile_prepend
>   runc-docker: Drop unused EXTRA_FLAGS
>   runc: Drop inherit goarch
>   runc: Merge common metadata into inc file
>
>  recipes-containers/runc/runc-docker_git.bb         |  6 --
>  recipes-containers/runc/runc-opencontainers_git.bb | 11 ----
>  recipes-containers/runc/runc.inc                   |  6 +-
>  .../files/0001-Use-correct-go-cross-compiler.patch | 77 ++++++++++++++++++++++
>  recipes-networking/netns/netns_git.bb              |  4 +-
>  5 files changed, 84 insertions(+), 20 deletions(-)
>  create mode 100644 recipes-networking/netns/files/0001-Use-correct-go-cross-compiler.patch
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

