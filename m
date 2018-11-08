Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 584CEE00BBF; Thu,  8 Nov 2018 11:55:08 -0800 (PST)
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
	*      [209.85.208.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 05235E00720
	for <meta-virtualization@yoctoproject.org>;
	Thu,  8 Nov 2018 11:55:04 -0800 (PST)
Received: by mail-lj1-f196.google.com with SMTP id t22-v6so19114184lji.7
	for <meta-virtualization@yoctoproject.org>;
	Thu, 08 Nov 2018 11:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7HJbefzoRUe/pPNvmQptT3yjdFYOzFw3hsbDjqOww5Y=;
	b=Cpzs0bgeurZDIwOU6saQ9owzbZuaqhHIODQxftC74Ld44uz15nVLNlzdvQSP6X1Ckl
	ISIFRXcwTKUptzyuYICFmN7DvyTou9wtv6k9hGiW0VPkVH3cOGzgYWBZ7OK5AZN6Q9eX
	H0Jl6KCUXWKqqCb++/I4jTZpzG01DYXk6aWs5uQwqEtRTT7yNOFrla1Jkm83EhpZk7zB
	IdyOCmjuiLHQy6aHWYxeyLAHuwl6UNPTyIJnPhyU0XseOlUoDkFWTbB8piALCpj1BzKd
	i9KuTaAPNgS5a/cy6V5ZFq/wdk2jWIIrfTzG+rFtHjkqRrab2NwWkjl7w0Uca5WzjWub
	Q1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7HJbefzoRUe/pPNvmQptT3yjdFYOzFw3hsbDjqOww5Y=;
	b=TD/VtPKHukznfG0wDmwdWk0zgbD0OipzJSyoiOJym2+IMNO5AqW3p+4/1v8YOjuDTm
	ZYIjSIE516pjUBV3XSS/sq6EBDinMDGr+arqUj5fxcoifEHoYNZP82epkQXWMWDbdeIR
	o4TUO6vyah8F3c7ZPE3YFrW6Nif58iROI6ixpxbPltnK+KDSltXrBCcbeJuR92c7uqj2
	1L1qDJ5I4nkn9QTOVq5YhDlYXIT6T8Dr0rNz/bioPy4u4Ye7f61x4qFAltU6H9kuaedG
	PtzhtPNCSJXsybUfLq8H3K4642BT4XF07ieIPWPhXScW4IFGDBjIDcCiGI+gvgk08JZI
	Kjlw==
X-Gm-Message-State: AGRZ1gL/3Vdx8tlsx/eYFl0v4UqCRWu6bE9HPErwf5CHzAHhqXQAjTgj
	8AFh9nfWD/qpcBmXbdvCmKyeKgEzJ/FTt4vfI7L99mao
X-Google-Smtp-Source: AJdET5cCVmIu+ajZ+esmBZXCO8RW0irJfYgsZ78QDSpIiqL6oNJ7m+1yUG3jINNZCWam8NV83L5yNjSwM2M5kmfm2dU=
X-Received: by 2002:a2e:8596:: with SMTP id
	b22-v6mr3695648lji.122.1541706903794; 
	Thu, 08 Nov 2018 11:55:03 -0800 (PST)
MIME-Version: 1.0
References: <20181106215821.8970-1-jpuhlman@mvista.com>
In-Reply-To: <20181106215821.8970-1-jpuhlman@mvista.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 8 Nov 2018 14:54:52 -0500
Message-ID: <CADkTA4O+ZLtPaHZP62dkH935-t_La_TmU+aMpY1O=q4es1S6xw@mail.gmail.com>
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH] postgresql: Fix issue where init script is not found.
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
X-List-Received-Date: Thu, 08 Nov 2018 19:55:08 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks Jeremy,

merged.

Bruce
On Tue, Nov 6, 2018 at 4:58 PM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>
> layers/meta-cloud-services/meta-openstack/recipes-dbs/postgresql/defaultpkgname/
>
> Something changed with the evaluation of :=, such that PN evaluates to defaultpkgname, thus
> the initscript is not found. Just set it to the correct name.
>
> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> ---
>  meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc b/meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc
> index 5bf25e1..b6a9c3c 100644
> --- a/meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc
> +++ b/meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc
> @@ -1,4 +1,4 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +FILESEXTRAPATHS_prepend := "${THISDIR}/postgresql:"
>
>  SRC_URI += " \
>      file://postgresql-init \
> --
> 2.19.1
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

