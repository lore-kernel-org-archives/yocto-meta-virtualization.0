Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9DD4DE00C89; Wed, 21 Nov 2018 06:10:01 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.66 listed in list.dnswl.org]
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 241C7E00A85
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Nov 2018 06:10:00 -0800 (PST)
Received: by mail-yw1-f66.google.com with SMTP id x2so2262719ywc.9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Nov 2018 06:10:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
	:from:date:message-id:subject:to:cc;
	bh=t7coavnq2RDXsvUX3m2dfU8wfxd7qQkbeoG8X1KP7tk=;
	b=KgfNxUfiYBukZWJuXsrXAw1fniX3E0ULOaC0HpAWjqKfATviVx2Yyso8Di9/C1frLI
	jQHOdXgRMowu27kXuZmoSzUf8PNbKtryVRB7DZmyL8YapLZ49UzRG5hBEryDUReYxPTm
	CE6s+qjMqOuP5p17cAUhIbq6/ICP4/HJRoB0sU4FKFnBscXwtzWG/45lK8HDGrbsUTb9
	DjJO6K37PNNhzwErikOxvojhvKkK+37O4no/Cn4ejjaZVgrodNY8TnmEpaMF2kYOjzMG
	eaBTHDHdYI0/50MLZrZ+j6Lex33FpC+YOJCf+8yvhhcg/OZyXSCqsAbXg803e8k8dBLe
	kOfQ==
X-Gm-Message-State: AGRZ1gIw3STGxdf/tGGxoTjOREgu/mpslm/sQLWDs9aCFI5LB4ruEFND
	h5MuImQy3e1f3VQiJy63ottfEdzLyMGQSJ5BzZFcvbQ2
X-Google-Smtp-Source: AJdET5cLhlI0XxLfDdp1LKSwDxpGjMRQbjKS7cd+JTZzP0+/dviRVntPXKYv1yiKRplSuZh5l8lqLQBUJhwtIQAfWdc=
X-Received: by 2002:a81:ae19:: with SMTP id m25mr6678611ywh.342.1542809400123; 
	Wed, 21 Nov 2018 06:10:00 -0800 (PST)
MIME-Version: 1.0
References: <1542804913-7458-1-git-send-email-dbensoussan@synapticon.com>
In-Reply-To: <1542804913-7458-1-git-send-email-dbensoussan@synapticon.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Wed, 21 Nov 2018 09:09:47 -0500
Message-ID: <CAPuovEJuxLyVGPTeDDgTDYzJ-0Hevawv_v=Co2XFYTpm-_VATg@mail.gmail.com>
To: minipada@gmail.com
Cc: dbensoussan@synapticon.com, meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/2] python-docker: Add recipe for python2
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Nov 2018 14:10:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 21, 2018 at 7:55 AM David Bensoussan <minipada@gmail.com> wrote:
>
> This has been copied from the python3 recipe

This should be done by putting the common code into a .inc file and
then having py2 and py3 specific recipes. Look at
python-websocket-client in meta-virtualization or any of the tens of
examples in meta-openembedded/meta-python. This saves duplicate code
and allows any issues to generally only be fixed in one spot and
avoiding cases where general changes are accidentally only merged to
either the py2 version or py3 version and not the other.

Thanks,
Mark


> ---
>  recipes-devtools/python/python-docker_2.5.1.bb | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 recipes-devtools/python/python-docker_2.5.1.bb
>
> diff --git a/recipes-devtools/python/python-docker_2.5.1.bb b/recipes-devtools/python/python-docker_2.5.1.bb
> new file mode 100644
> index 0000000..c0f3c89
> --- /dev/null
> +++ b/recipes-devtools/python/python-docker_2.5.1.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "A Python library for the Docker Engine API."
> +HOMEPAGE = "https://github.com/docker/docker-py"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=34f3846f940453127309b920eeb89660"
> +
> +inherit pypi setuptools
> +
> +SRC_URI[md5sum] = "7d917152976df075e6e90ee853df641f"
> +SRC_URI[sha256sum] = "b876e6909d8d2360e0540364c3a952a62847137f4674f2439320ede16d6db880"
> +
> +DEPENDS += "${PYTHON_PN}-pip-native"
> +
> +RDEPENDS_${PN} += " \
> +       python-backports-ssl \
> +       python-docker-pycreds \
> +       python-requests \
> +       python-websocket-client \
> +"
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

