Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B1841E00E1E; Thu,  5 Sep 2019 07:10:30 -0700 (PDT)
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
	*      [209.85.208.172 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
	[209.85.208.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C48CDE00E0D
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Sep 2019 07:10:28 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id t14so2658964lji.4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Sep 2019 07:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KPf62jfFQWZzjLfNXCQCIKb+4d0h7FmuAYP5bdcnNfU=;
	b=sCFvoacfkpGXn7NZMrUDDwlPigdFZ8z8pbHZgQ9aQlkBSEDKkyEI5kTVmH51sThifo
	JT1ViAMN9jJ72GkHGB65i0zf1q/9n4ekhznYnXMhxcUr52hn+e/q1bpOdTMLAXggbaNF
	agn1K4nWe93pIJTcE2vLdWike//NRDxdsZ/LIf78MAzgLLlSENxHu+JH/9mnwOBkbnTX
	dVljY2I/I5O5K07hmtVkfXK6+I/E92Ukb2glEKjBrNCygBuWlvT+MW6omAsh7ahBcbZC
	cKqN5LPRn50WC69pLdvtHfAWPlR9Ga1CQPjF7AdoZJIANzwbZNuKK2A7j5V3hviBry/b
	BD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KPf62jfFQWZzjLfNXCQCIKb+4d0h7FmuAYP5bdcnNfU=;
	b=hIhgoJo6FkQjnUrPkbZAaoOnDYadGcqFQK9gPJ/XCNRxncP8bfMeWmFd3GSmoglfy0
	8MZk4RRKIuWYHHkB5+6ZYwnHbI5xUw6EqwMuEXM1dsWiAWU5xSq0lgiRPR0uXfSdFP17
	4lNcIEDsLegrjPq76pInuwapau/r5mBlIk6JUqtDDmZ67VPwJR/qGNIEFbK9jWQpDtPv
	5/K9Uh6MjhBsEnlshurTT1pq44+SGww6fAQy3/GQgBYHYGbjAre/j+mf6MdvQ0jjLO0v
	WXKiB/JrtbiBol6qXuYxVJQrmWTYpdM1SO0pyBWK0v5JsfXs+g5XkEF6VmAYVhOQLWrF
	Oq4Q==
X-Gm-Message-State: APjAAAWHhH+eOCDWDnlh4AAzvJEPq7CfUikm3RzSpUkK77cZJbYQieke
	IG8aDgICxGtbzjb9wNNsmYof4PDPAACy6hfUDyjUtxaU
X-Google-Smtp-Source: APXvYqxCEUlRBX9Jyar26q3PgdE9PYNTJFrizkn9SH7zaXgiQl94T7IDabaj6rayjJkdDtFMYs15jt5OGzIaLnQ9pkg=
X-Received: by 2002:a2e:83d6:: with SMTP id s22mr2258685ljh.104.1567692627574; 
	Thu, 05 Sep 2019 07:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190905034746.40089-1-yuanc.fnst@cn.fujitsu.com>
In-Reply-To: <20190905034746.40089-1-yuanc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 5 Sep 2019 10:10:16 -0400
Message-ID: <CADkTA4Mszj5BUL=DtTyPhwg1M9zQKVZ2VCZofJ+A=b=wAoFp7w@mail.gmail.com>
To: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-pastedeploy: upgrade 1.5.2 -> 2.0.1
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
X-List-Received-Date: Thu, 05 Sep 2019 14:10:31 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Wed, Sep 4, 2019 at 11:48 PM Yuan Chao <yuanc.fnst@cn.fujitsu.com> wrote:
>
> License File docs/license.txt lost, use PKG-INFO instead.
>
> Add dependency on python-pytest-runner-native.
>
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-pastedeploy_1.5.2.bb           | 14 --------------
>  .../python/python-pastedeploy_2.0.1.bb           | 16 ++++++++++++++++
>  2 files changed, 16 insertions(+), 14 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-pastedeploy_1.5.2.bb
>  create mode 100644 meta-openstack/recipes-devtools/python/python-pastedeploy_2.0.1.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-pastedeploy_1.5.2.bb b/meta-openstack/recipes-devtools/python/python-pastedeploy_1.5.2.bb
> deleted file mode 100644
> index c908ccd..0000000
> --- a/meta-openstack/recipes-devtools/python/python-pastedeploy_1.5.2.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -DESCRIPTION = "Load, configure, and compose WSGI applications and servers"
> -HOMEPAGE = "http://pythonpaste.org/deploy/"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://docs/license.txt;md5=1798f29d55080c60365e6283cb49779c"
> -
> -PYPI_PACKAGE = "PasteDeploy"
> -
> -SRC_URI[md5sum] = "352b7205c78c8de4987578d19431af3b"
> -SRC_URI[sha256sum] = "d5858f89a255e6294e63ed46b73613c56e3b9a2d82a42f1df4d06c8421a9e3cb"
> -
> -inherit setuptools pypi
> -
> -RDEPENDS_${PN} += "python-paste"
> diff --git a/meta-openstack/recipes-devtools/python/python-pastedeploy_2.0.1.bb b/meta-openstack/recipes-devtools/python/python-pastedeploy_2.0.1.bb
> new file mode 100644
> index 0000000..65668fa
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-pastedeploy_2.0.1.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION = "Load, configure, and compose WSGI applications and servers"
> +HOMEPAGE = "http://pythonpaste.org/deploy/"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=d6c3089319205d7e6129f0213b7e949f"
> +
> +PYPI_PACKAGE = "PasteDeploy"
> +
> +SRC_URI[md5sum] = "6193afccc0982abedb9b7711d0d6adb0"
> +SRC_URI[sha256sum] = "d423fb9d51fdcf853aa4ff43ac7ec469b643ea19590f67488122d6d0d772350a"
> +
> +inherit setuptools pypi
> +
> +DEPENDS += "python-pytest-runner-native"
> +
> +RDEPENDS_${PN} += "python-paste"
> --
> 2.17.1
>
>
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

