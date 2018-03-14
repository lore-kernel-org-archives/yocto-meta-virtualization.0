Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8A6D7E01080; Wed, 14 Mar 2018 05:43:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.66 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9C9A9E00B66
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Mar 2018 05:43:39 -0700 (PDT)
Received: by mail-lf0-f66.google.com with SMTP id y2-v6so2444592lfc.5
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Mar 2018 05:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FGTlu7jsBYwDyvNGKxVAG+e7irwkA89ZENUKFFf5Dzs=;
	b=T7f6oSLMpUz5zohJFoT6B0RDPwFkS0ao0cy072S33ytn3cTDfi3n+zJ00PfexArGyu
	i2czyZVQtXN3su+Nwi8aENVnzdqcgvnQ6j/dMn3FayV/QSX72bW+kgO6sdvZkGV2V1Pk
	Q+itPh8E5xTTw5CdcZie6pBMtAeIqSPMI+KK6+KcI8UFS0cMW1hgYtpGKCh3ff9HxVF6
	3JESFXRVlE9n93LHQVlPd2Gm1+qBT5HR0r6toRZkSgki0uEsyzMInndorjylwX9MzftQ
	0RiczpcgdvDBOvfU3tQ5vVtKjOTQR94f9JLWOPyXs9F4dxg1oVWyRHwcZXRwNONONgBk
	hIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FGTlu7jsBYwDyvNGKxVAG+e7irwkA89ZENUKFFf5Dzs=;
	b=V+Aejt+MSj8lauy+0qM0GoxtXLWDPGon3mzjlWDptfnatilMwjotMMKyBvuFAJJG/x
	X1Btc3Cp2o6y7/P0WvwTsNZPfki1kpVb/4UXkcRhE+E8HM02C6PS93V9nFdWoJyt0tk+
	iIWt4upWoshfTg94QFolJbVVQeQbrE8UN3NJE9k1riUwg29kBrluPrKdnGzOSHoxsOam
	wgRFnboEdwWYf9ZExGEZI68s0dKuEftxFynTUMNcZkRdhn0IUnfvld3jyKPflt1oWAlM
	PBCw2yhCyN8HNDYKzTiJk6aF0w5aEbJwgXbFW3RLicu97aM1jGICgx36OP796oQqGaRZ
	gcnw==
X-Gm-Message-State: AElRT7Fd9BpMfMlUk9+5j6bvYQPOUcScjV71NEhUzle70/YDm2lYFnXk
	AIxaam3JFbDTw5kadL8Td8sA1BeC++Rw5EjY8NzbrA==
X-Google-Smtp-Source: AG47ELusRodZ9d+3TNbwFCbGuaIVU/lIDbnwMkdYCReIjJA3+b1sHt/xdk8QxxyZv1/M+9ZUndXFQ9tOiSBmNRLaJbg=
X-Received: by 2002:a19:97d0:: with SMTP id
	z199-v6mr3171872lfd.94.1521031418679; 
	Wed, 14 Mar 2018 05:43:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Wed, 14 Mar 2018 05:43:38 -0700 (PDT)
In-Reply-To: <1520846609-5799-1-git-send-email-ricardo@opensourcefoundries.com>
References: <1520846609-5799-1-git-send-email-ricardo@opensourcefoundries.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 14 Mar 2018 08:43:38 -0400
Message-ID: <CADkTA4O+Hi1EnO0DhgJTN39jw48L+i2ee=gdpyefNOq2AKsmRg@mail.gmail.com>
To: Ricardo Salveti <ricardo@opensourcefoundries.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python3-docker-compose: remove deprecated python3-enum from RDEPENDS
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
X-List-Received-Date: Wed, 14 Mar 2018 12:43:40 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Mon, Mar 12, 2018 at 5:23 AM, Ricardo Salveti
<ricardo@opensourcefoundries.com> wrote:
> The python3-enum package was removed and it is now part of core.
>
> Signed-off-by: Ricardo Salveti <ricardo@opensourcefoundries.com>
> ---
>  recipes-containers/docker-compose/python3-docker-compose_1.16.1.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/recipes-containers/docker-compose/python3-docker-compose_1.16.1.bb b/recipes-containers/docker-compose/python3-docker-compose_1.16.1.bb
> index 4e761d0..851c251 100644
> --- a/recipes-containers/docker-compose/python3-docker-compose_1.16.1.bb
> +++ b/recipes-containers/docker-compose/python3-docker-compose_1.16.1.bb
> @@ -19,7 +19,6 @@ RDEPENDS_${PN} = "\
>    ${PYTHON_PN}-docker-pycreds \
>    ${PYTHON_PN}-dockerpty \
>    ${PYTHON_PN}-docopt \
> -  ${PYTHON_PN}-enum \
>    ${PYTHON_PN}-idna \
>    ${PYTHON_PN}-jsonschema \
>    ${PYTHON_PN}-pyyaml \
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

