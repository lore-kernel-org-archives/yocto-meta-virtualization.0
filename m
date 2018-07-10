Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5D261E00FCC; Tue, 10 Jul 2018 06:48:53 -0700 (PDT)
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
	*      [209.85.215.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4DA9DE00720
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Jul 2018 06:48:52 -0700 (PDT)
Received: by mail-lf0-f67.google.com with SMTP id u202-v6so18354411lff.9
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Jul 2018 06:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PRQXw9NxYviRPryCvn6VHgUOPAnjZlPgzDHKqUfgumM=;
	b=uLD+SbHa6bU+DwJNiIHagO1dKh5kotS8HEkIKQysnRGc+dKf27YpT16cL2baJFGzZo
	fsUyQXs91pW33knO6oyd5Bg9Z22PFgSkfI5eG8n47qWQglLMYEWefKQ6tCnGYA0VQ9ur
	lvLF6BHLoMnv37cUcqdJXQJdoPFIde1VDoRWQaiUHdKnXylBRZxzI6NsICeOcWBoEVQx
	LBUJGT71xcR/P+grlDe1YZXcZMAE055mCQj/seEe2pozO1ieyaN9u3bhyGivqm97Twy9
	VU8IIwPQBiniTAHKcC56EfTwxWU5sa0u3fg2OGb8BsyWJzATFMDk+Mt9E4l75QQ1K8xm
	5spg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PRQXw9NxYviRPryCvn6VHgUOPAnjZlPgzDHKqUfgumM=;
	b=CV59mB7b8vdq9oNoTY67o+WaGDyhtjoSNUoYXVf0ldwmdfwi0keowzHg4Gcd5ZEZaS
	52FWNv0WheqviQhftWL70AFqVVB7+ISfirWinkiuEyVO61oorhNJmXfCsrr7FTBPdfxe
	+nyRvc63wdhrx5H1ChwikSfiUhmf8nuPwbadMakBvGJuh6jLMHTR5FkZptkOXbIqvsqx
	N/oxBcxIw3CI9r7vOSsE9HNOmWh18vjzM7VaLaQ4sEWeMfGjbRUDd+3VRx4orK67h9RU
	HqYoxWFsIAqaepYRmtlIYm1wIWqcmOlYKvZSfba+YV7MVLWbM4fTLMrMSwnwFFVL3UQt
	PlKA==
X-Gm-Message-State: APt69E2aNBjCm1aR0rrX4HbR3qIr5utTTpLJ68yDxLL+oTVrln5X+4sC
	2LyOqXRPmcsGlIh9KQx0HLvVtZpGTDKQr/N8PYU=
X-Google-Smtp-Source: AAOMgpeOa3iYWF6L7Jy64I+GmbKjtliuy+wbZkysCB/9v/GU1yNKLU+UkgZwG+h4Mw9oyYhfu0XuQgZkoChQl+AR03U=
X-Received: by 2002:a19:ca09:: with SMTP id
	a9-v6mr2904131lfg.142.1531230531144; 
	Tue, 10 Jul 2018 06:48:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Tue, 10 Jul 2018 06:48:50
	-0700 (PDT)
In-Reply-To: <20180706055418.6952-1-ueba.takuma@jp.fujitsu.com>
References: <20180706055418.6952-1-ueba.takuma@jp.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Jul 2018 09:48:50 -0400
Message-ID: <CADkTA4Oa6Q8jyP0qk22+4Ram325SV5PyqZsAPEyxUC1mzQua7w@mail.gmail.com>
To: Takuma Ueba <ueba.takuma@jp.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] fix license from Apache-2.0 to MIT
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
X-List-Received-Date: Tue, 10 Jul 2018 13:48:53 -0000
Content-Type: text/plain; charset="UTF-8"

I fixed up the shortlog a bit, and added a small long log.

this is now merged.

Bruce

On Fri, Jul 6, 2018 at 1:54 AM, Takuma Ueba <ueba.takuma@jp.fujitsu.com> wrote:
> Signed-off-by: Takuma Ueba <ueba.takuma@jp.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-wsme_0.9.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-wsme_0.9.2.bb b/meta-openstack/recipes-devtools/python/python-wsme_0.9.2.bb
> index 59e1ddb..15f46d4 100644
> --- a/meta-openstack/recipes-devtools/python/python-wsme_0.9.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-wsme_0.9.2.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "Simplify the writing of REST APIs, and extend them with additional protocols"
>  HOMEPAGE = "https://pypi.python.org/pypi/WSME/"
>  SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> +LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=5a9126e7f56a0cf3247050de7f10d0f4"
>
>  PYPI_PACKAGE = "WSME"
> --
> 2.17.1
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

