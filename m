Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4D1EFE00C70; Tue,  3 Apr 2018 20:25:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.68 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A4A7DE00C6F
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Apr 2018 20:25:44 -0700 (PDT)
Received: by mail-lf0-f68.google.com with SMTP id u3-v6so23124769lff.5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Apr 2018 20:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZUvTMALENqlLfL6bDpOZocHc6MJAmKPrupNA86zio5g=;
	b=T6Qp16sDG0cIZUwEUf5eL8CGfDDCpSNRg/5ynNUKbhtEib/OeAx+2WcsFC15Ryl7li
	WweK13x8M2tvuq5hr8URrsPIlWIi1f9XTTuTNYAwlvupIDhEuV2da9cTeqKQGvTmgyMO
	nJZB0olOjRRdcXBgr3iZryfaY6UibFbSvOzQkqNxICLv6/eJCiSohmNOWjq9aiY+RyXc
	7E1tLM9Y4BKpHnrr2E+kYJzDuPlycrU1CC20PiLCwcxlaLBYUFdKZuZuuiB/zF/X51hA
	Hf1qcUtrwgMXUHx1j9QKHM3af+fA1L0JgYk1V+F/4ha8tW+Q2kJQ/yJdOBmdG66ChM2T
	kVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZUvTMALENqlLfL6bDpOZocHc6MJAmKPrupNA86zio5g=;
	b=ZnyqrjMRNJ80S/LfrgpVMczCXK6BkwIwbA8f+3ktFxC94EsxOFqAmKZyRrbHnyi/fi
	WBSVdhUC28Yfio5xJrR8G1ELfxPQdlYlY6z0t3sbrWlxEC2QcK51yjhqTLkybsvAd6Q+
	QprZA05IwpXHxMsry6FQkQ8MUmcF1V0NJbhxAYUY44JnPpKYpixFmiO3HvJn1vkmU83Z
	ySW0YE/XXqz+r6QHdSF01kHpc6SbfhgGbl4LnGdns9RleZFLTZUyAapeu/vxK+o0uHdp
	94usCy1T+tHywTsCT0dkepxEIHx5nJ/aHKGglQC7HoBC2LyJRE9cvqpO2xX3bSIS27ja
	sb+w==
X-Gm-Message-State: ALQs6tClubeLsB89KuIq5nm/AzUennKI04TgfgoVmoWQB3RgumqkfZl/
	wviq8t4Oi6T9wHkH868M/247wjJId65UC2wPTsU=
X-Google-Smtp-Source: AIpwx49UOnyQydKgELXyAlfHq7KWDhVkwnH/JTxmSfBgaYiwCiJYtazVJvdyJ4s/r7j7ufiuf0U7bS8GsqDXfxyeeaY=
X-Received: by 2002:a19:511d:: with SMTP id
	f29-v6mr9773009lfb.39.1522812343321; 
	Tue, 03 Apr 2018 20:25:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Tue, 3 Apr 2018 20:25:42 -0700 (PDT)
In-Reply-To: <1522402120-7482-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1522402120-7482-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Apr 2018 23:25:42 -0400
Message-ID: <CADkTA4NQqiTfc3Ux78Y2ttdMo131x+LBKSXXcM5KxdPaBTr2EQ@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] python-testtools: 2.2.0 -> 2.3.0
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
X-List-Received-Date: Wed, 04 Apr 2018 03:25:45 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Mar 30, 2018 at 5:28 AM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:
> Upgrade python-testtools from 2.2.0 to 2.3.0.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-testtools_2.2.0.bb => python-testtools_2.3.0.bb}   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-testtools_2.2.0.bb => python-testtools_2.3.0.bb} (76%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-testtools_2.2.0.bb b/meta-openstack/recipes-devtools/python/python-testtools_2.3.0.bb
> similarity index 76%
> rename from meta-openstack/recipes-devtools/python/python-testtools_2.2.0.bb
> rename to meta-openstack/recipes-devtools/python/python-testtools_2.3.0.bb
> index af93ea8..bbf1d01 100644
> --- a/meta-openstack/recipes-devtools/python/python-testtools_2.2.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-testtools_2.3.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c9d3e8ba7141c83bfef190e0b9379a"
>
> -SRC_URI[md5sum] = "adef817b07ba24fd6d807fd41a4f1ef4"
> -SRC_URI[sha256sum] = "80f606607a6e4ce4d0e24e5b786562aa42c581906f3c070607a4265f3da65810"
> +SRC_URI[md5sum] = "0f0feb915497816cb99e39437494217e"
> +SRC_URI[sha256sum] = "5827ec6cf8233e0f29f51025addd713ca010061204fdea77484a2934690a0559"
>
>  inherit setuptools pypi
>  DEPENDS += " \
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

