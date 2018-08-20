Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0EB4FE00A86; Mon, 20 Aug 2018 08:36:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8AC23E003D7
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Aug 2018 08:36:30 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id u7-v6so11951722lji.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Aug 2018 08:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mJQLWR4GcOzOBQxAXa64vLqLkBw1KpU3+Zt/o1K3buQ=;
	b=kocqUd8tsfOWzCfT3TEpqZx+xlWhdBm6J/QsFCky9IqOosydPtbIGlMxvCiJiibOA7
	K2zWeY0hQyWyeHI/LaAjW7Jzt0xOhS7Mcd9TPbI73siMHd4UYJwUEILOWxg8/dTxuMzI
	s2S7lHP1YB/L0A//9jKWNwBpZLj1lNP2Z6WgwgXrUQtwktRSAAsmeASDoNYRibNaokRj
	Pm1gpGE+DmIxETalySHx81AimsWlHaFYG8o9eqXhIELfHOOFBuqKl7SzfeMbmzGQfjhg
	wTLUE4awrHgW1z+Jmiy+VBzlXiUsTiTtv0DQICvOtgbjJaHidZcMmuRcq7h6SUtX1t+1
	+ntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mJQLWR4GcOzOBQxAXa64vLqLkBw1KpU3+Zt/o1K3buQ=;
	b=rJczZZJrZMo1yyqb3nEI1giwcnkI+gqRMRnNdgOORaeNV+30CuLA5Y6QKkpVB6AvUD
	M/nnaHbHlt2VfmpcTAb2vsuKp4S3eGRAnYn2RqIfRFex5qF5CwzBGmwyRYMmf6n1171W
	jaSAbcH3yEyg057TxO/QUB5q/ptA3vhzvDgjo99MsKL00zf81AluBIBufWoBnDDJoATU
	ItbI3ftAOxibUgCyyC7hVM6KDub3fy3boKgEajL+UoJ5LiBzzlOPhnYK+WY0HewHs9nr
	QP0cdz1ftVRWL/A33gE2vvyEOqBQ5HkTeP7B+bKFZZuiLTaPfvAkR9VX3F0B0Q+pq8LC
	BRZQ==
X-Gm-Message-State: AOUpUlFjRoyQkJ/9tjqD7x67Uod4sr1Fv7WyHcni+Z8sAxL5QdFnzdKg
	W72SKll4ThSJ38BGIyDSQm8z/VB3zfrFbHd4LC0=
X-Google-Smtp-Source: AA+uWPzSXv4qPkGM2sitz09RzPoaG4UyQGfjvb55WhwQtfkoBBCGwJbPvPQsrNXz8rNSiGqjTKISLVQE/QzT/AHNuQo=
X-Received: by 2002:a2e:9854:: with SMTP id
	e20-v6mr30962374ljj.143.1534779389522; 
	Mon, 20 Aug 2018 08:36:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:8688:0:0:0:0:0 with HTTP; Mon, 20 Aug 2018 08:36:29
	-0700 (PDT)
In-Reply-To: <1534642635-18305-1-git-send-email-christopher.w.clark@gmail.com>
References: <1534642635-18305-1-git-send-email-christopher.w.clark@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 20 Aug 2018 11:36:29 -0400
Message-ID: <CADkTA4O7Mn6iy3soxM1mU6UD42AzkgMYtU4R6=tJDhiM0o+ZNw@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@yoctoproject.org, Doug Goldstein <cardoe@gentoo.org>
Subject: Re: [PATCH 0/3] Xen on ARM: fix 64-bit and add 32-bit
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
X-List-Received-Date: Mon, 20 Aug 2018 15:36:32 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Sat, Aug 18, 2018 at 9:37 PM, Christopher Clark
<christopher.w.clark@gmail.com> wrote:
> From: Christopher Clark <christopher.clark6@baesystems.com>
>
> This series fixes the Xen build for 64-bit ARM targets with gcc 8.2
> with a minor patch to correct static string lengths, already reviewed
> upstream:
> https://lists.xenproject.org/archives/html/xen-devel/2018-08/msg01367.html
>
> and introduces 32-bit ARM compatibility, verified by testing with a cubietruck.
> This currently requires another tiny patch to suppress a new (false positive)
> compiler warning.
>
> Christopher Clark (3):
>   xen: Fix build on arm64 w/ gcc 8.2
>   xen: fix truncation warning in tools build for ARM 32-bit
>   xen: enable 32-bit ARM builds
>
>  .../xen-4.11-arm-acpi-fix-string-lengths.patch     | 101 +++++++++++++++++++++
>  .../xen/files/xen-tools-xenpmd-snprintf.patch      |  78 ++++++++++++++++
>  recipes-extended/xen/xen.inc                       |   7 +-
>  recipes-extended/xen/xen_4.11.0.bb                 |   2 +
>  4 files changed, 187 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-extended/xen/files/xen-4.11-arm-acpi-fix-string-lengths.patch
>  create mode 100644 recipes-extended/xen/files/xen-tools-xenpmd-snprintf.patch
>
> --
> 2.7.4
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

