Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9065DE00D12; Fri,  8 Mar 2019 13:02:16 -0800 (PST)
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
	*      [209.85.208.179 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
	[209.85.208.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC209E00BE8
	for <meta-virtualization@yoctoproject.org>;
	Fri,  8 Mar 2019 13:02:15 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id z25so18576032ljk.8
	for <meta-virtualization@yoctoproject.org>;
	Fri, 08 Mar 2019 13:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iPGhWNKw1seoauQvxfoCrVmqNVEPgaQYp7MauuEKrPU=;
	b=D9i2zmJAO5iCC+KO36xmxAyw1m01OtQSPZ1zbNAslBJb3WxU77LKNId/a9oxzl/2nO
	Jo64KrnwDDaTKx6uLIiCxWLsO9ER37arovWo9r4PGPznaF1nuopqXdWDcN7ROkaRwp2Q
	iWxJOfANZUa7xFQnSNgChWgsWQUm67usrRGdHnbDAJNLmIjJELbmYgGVFaIEFNqiOTUp
	lkEJ8Lh2DLRMA3HxvndDdswbyH7RTtyVefA9lLCx+HxJ3O8pjnr4BOfh87yRPJs/7MTu
	RaG5xCOw/zctXqLrkyaSOxVVilFjXBQk98CVqUiIfFM7OebY+h0qQbGd4pwFNkfDsQGR
	eikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iPGhWNKw1seoauQvxfoCrVmqNVEPgaQYp7MauuEKrPU=;
	b=LQz8C2e/dlx7Iqjz5isfjbLb5EMyqrmyyGESWqkchiy8aEmWJq+syyZaCknOaWE4Sl
	pRvRb6GlQ6uqNQJaBFYvpXwZujhNEnyHH/2TU1yZhxAxXlsoRLvkLL1o9A0WsVLq+ZA4
	BlIkXpEHc5Z6BEIYB6vj0UGaQwWagqrtFxwvr3PbQxBD0G6gzlRFoIw8DG36DunmBVPy
	29ac+bbE7h4Mk8aB8N7tzGmoATWTc7yAoWhtYSi8sw5wuerpMUu+Knc8IwxYExz0nvYN
	ghDPpcMP4bo3/iFgs+c+Lz0hNblZQSjpxvxIobg7Gz8vwXqOIw0Z/Bd4+Br7wps7DGrY
	xqZg==
X-Gm-Message-State: APjAAAXpCGxu2ANeTb2zt6MIRaUIxKMi6s1RD1Xm+FfanepWzRBBpBW+
	oRE8Q6l7pL88j+20WGjUkRBN2zGD6pM1BqfvvuDOHNce
X-Google-Smtp-Source: APXvYqwtg6nmPrxgka3ci9fcOf7Ijn0oQhx39+PM0caUVVoiYzpbCyOV8bBUeapwHn93wxdy8JYqwZUYebyiIglZlm4=
X-Received: by 2002:a2e:408:: with SMTP id 8mr10178131lje.15.1552078934583;
	Fri, 08 Mar 2019 13:02:14 -0800 (PST)
MIME-Version: 1.0
References: <20190306001258.13911-1-dan.callaghan@opengear.com>
In-Reply-To: <20190306001258.13911-1-dan.callaghan@opengear.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 8 Mar 2019 16:02:03 -0500
Message-ID: <CADkTA4PKJdP8YMhUZtCztgQ_rMB5rNp-WFshr-xSvM9kcpW4mg@mail.gmail.com>
To: Dan Callaghan <dan.callaghan@opengear.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-docker: depend on python-misc for the ntpath module
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
X-List-Received-Date: Fri, 08 Mar 2019 21:02:16 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Wed, Mar 6, 2019 at 6:48 PM Dan Callaghan <dan.callaghan@opengear.com> wrote:
>
> Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
> ---
>  recipes-devtools/python/python-docker.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-devtools/python/python-docker.inc b/recipes-devtools/python/python-docker.inc
> index eec7cda..a0ba60b 100644
> --- a/recipes-devtools/python/python-docker.inc
> +++ b/recipes-devtools/python/python-docker.inc
> @@ -7,6 +7,7 @@ SRC_URI[md5sum] = "02491d168c048cdb99cc20d0b352ea0f"
>  SRC_URI[sha256sum] = "e9cc39e24905e67ba9e2df14c94488f5cf030fb72ae1c60de505ce5ea90503f7"
>
>  RDEPENDS_${PN} += " \
> +       ${PYTHON_PN}-misc \
>         ${PYTHON_PN}-six \
>         ${PYTHON_PN}-docker-pycreds \
>         ${PYTHON_PN}-requests \
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

