Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 417B8E00E55; Thu,  8 Mar 2018 13:20:40 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 97D15E00E27
	for <meta-virtualization@yoctoproject.org>;
	Thu,  8 Mar 2018 13:20:39 -0800 (PST)
Received: by mail-lf0-f68.google.com with SMTP id q69-v6so10337989lfi.10
	for <meta-virtualization@yoctoproject.org>;
	Thu, 08 Mar 2018 13:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OBKzYolWv1dhokttJRLoKTW4SXtMM54jR7f5fbbuYeg=;
	b=vT+L84d2YCqxryLceT6I+ENuq9mO0zUqEdI7XADJ3fWTQ7Uw2hJEYeDqC335z/+cJw
	0lL7KYjhTLE+fu0QDseTzR2aq0PLn+Z8lA8/+cFm3t7UDLWffwMiCFioAqm9I47NxWkF
	E378oDraSEF/VD88JTNHB4BF8m8ZfN3T9g6urVUgtPsWyBjRqt9hjELgXY1C1GujBMjy
	yr68Yb4EBIspW66T0tlO6Z+rNFYo3yfFSHfGlJQnVLQjJ41qflujlGhIH8nROPl1oyQ8
	MHnBHiftshNc/bIldmUKBJF4dpsJD96huloOGa5BoyfNRVIdAOlxwZ8ovrCibvlCsup0
	DL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OBKzYolWv1dhokttJRLoKTW4SXtMM54jR7f5fbbuYeg=;
	b=mfU1xbXiGnBUv/1hVhKEPdn11ulCdGtbwcqRTaNbKm+yw7hC8z6jur9B9xRaAPhwNJ
	Gb+dBhlrwssbKAnxIdqNWnzSYRreFzDbHLaPkZEtw/4krXmV9zRpQ3GH3yTTYRhBOfsI
	v6U4NpP527W0ymuf/pIjQK05sX8wW2GTeI3L4Y5yYEx2hwWN1xdJZkC+c8vnfrlPmK8w
	tiPLrayuLu5YN03aWmzd1ABQtm4Mx/csQpLnfbayPeqRGbSnlFmeshTxOxxvzNbVPxXi
	NPkB7Zvbg7dEo90Vul8QF0oWG3AOd80bDkxi74ut6P6vkKdhBeMI7tC1zcTH9WlHT7PM
	IY7g==
X-Gm-Message-State: AElRT7E/0JCOAuYEVom1R2Vu8EpFLHXbdwCxx8WV4lYzHaZjWh6jIuN2
	3ND6wS06oo9/kyP4D4YNveGQd7b0lOEGzV/XrUo=
X-Google-Smtp-Source: AG47ELvaSoWkg+taHFYh8vRKp+6S1S3qs6cJgDFU9vXRW264/9ms/bIpGOpBElH9+3HroRmWq4JQ2UTXut02AeIkai0=
X-Received: by 10.46.23.219 with SMTP id 88mr2864528ljx.49.1520544038449; Thu,
	08 Mar 2018 13:20:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Thu, 8 Mar 2018 13:20:37 -0800 (PST)
In-Reply-To: <20180307170243.8155-2-jkrishnanjanappa@mvista.com>
References: <20180307170243.8155-1-jkrishnanjanappa@mvista.com>
	<20180307170243.8155-2-jkrishnanjanappa@mvista.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 8 Mar 2018 16:20:37 -0500
Message-ID: <CADkTA4P1G=V9yt0moFP5MD_o_x5_OLda7TFArE=KyjpU=iz57w@mail.gmail.com>
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [master][rocko][PATCH 2/2] gunicorn: replace PN with BPN, to solve fetch failure while building for multilib
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
X-List-Received-Date: Thu, 08 Mar 2018 21:20:40 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Wed, Mar 7, 2018 at 12:02 PM, Jagadeesh Krishnanjanappa
<jkrishnanjanappa@mvista.com> wrote:
> The multilib gunicorn (for example lib32-gunicorn) fetch fails with
> below error:
> -- snip --
> --2018-03-07 16:52:09-- https://pypi.python.org/packages/source/g/gunicorn/lib32-gunicorn-19.1.1.tar.gz
> Resolving pypi.python.org... 151.101.0.223, 151.101.64.223, 151.101.128.223, ...
> Connecting to pypi.python.org|151.101.0.223|:443... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2018-03-07 16:52:09 ERROR 404: Not Found.
> -- snip --
>
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ---
>  recipes-devtools/python/gunicorn_19.1.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-devtools/python/gunicorn_19.1.1.bb b/recipes-devtools/python/gunicorn_19.1.1.bb
> index bbe03ea..5c8ea48 100644
> --- a/recipes-devtools/python/gunicorn_19.1.1.bb
> +++ b/recipes-devtools/python/gunicorn_19.1.1.bb
> @@ -8,7 +8,7 @@ DESCRIPTION = "\
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=19a2e253a273e390cd1b91d19b6ee236"
>
> -SRC_URI = "https://pypi.python.org/packages/source/g/gunicorn/${PN}-${PV}.tar.gz"
> +SRC_URI = "https://pypi.python.org/packages/source/g/gunicorn/${BPN}-${PV}.tar.gz"
>  SRC_URI[md5sum] = "eaa72bff5341c05169b76ce3dcbb8140"
>  SRC_URI[sha256sum] = "82715511fb6246fad4ba66d812eb93416ae8371b464fa88bf3867c9c177daa14"
>
> --
> 2.11.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

