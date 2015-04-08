Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 48BFBE009A4; Wed,  8 Apr 2015 07:38:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.180 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B6AF9E008EC
	for <meta-virtualization@yoctoproject.org>;
	Wed,  8 Apr 2015 07:38:28 -0700 (PDT)
Received: by iedfl3 with SMTP id fl3so85281169ied.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 08 Apr 2015 07:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=IXp3CJO6Kgbjs7Iy2+7vogtSP+3vKpZLOUPG7mi75A8=;
	b=dXGuoMbBPAwDkFdEzT/zS5ZqXJUq+e60cUmyEXd4GfS3pAaV7U8+ix2kiucr+yjg1x
	ndF44IHNcB4NYWfyYw8/gi49KVhRZrv4GhLx/uGtvaJe31mVFmNg1aapy0imPhTXKy9+
	EeSsoIzdaPqZ/IPL9j1MuU5Zie8JmWUELaoduDb050nKlYetg2pJ0IRwCgBX2NUuuzJZ
	E/gEFBC2si0UYD7Xd9UUWlhyOJQCTQR4905T+PzEB8S6N6oS/IWZ1Qeex8GAhAqDq29Q
	LfGe5B0nF5tVq9PKGbLOD90mHGWmN8NtNz+FzBHnDIhEtWhLYrqF++L3cfU1xfPnySUG
	UhJw==
MIME-Version: 1.0
X-Received: by 10.107.3.17 with SMTP id 17mr37884522iod.60.1428503907832; Wed,
	08 Apr 2015 07:38:27 -0700 (PDT)
Received: by 10.107.158.20 with HTTP; Wed, 8 Apr 2015 07:38:27 -0700 (PDT)
In-Reply-To: <1428475772-8348-1-git-send-email-jackie.huang@windriver.com>
References: <1428475772-8348-1-git-send-email-jackie.huang@windriver.com>
Date: Wed, 8 Apr 2015 10:38:27 -0400
Message-ID: <CADkTA4P67r-qJsLhs4FSzMipvS+T4oJUZ=60=iBujk45qL7KBw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: jackie.huang@windriver.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Add missing dependencies for keystone, fixtures and testtools
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
X-List-Received-Date: Wed, 08 Apr 2015 14:38:31 -0000
Content-Type: text/plain; charset=UTF-8

Thanks Jackie.

I've applied all your changes.

Bruce

On Wed, Apr 8, 2015 at 2:49 AM,  <jackie.huang@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> These missing dependencies are found when running keystone tests:
>   File "/usr/lib/python2.7/site-packages/keystone/tests/unit/core.py", line 28, in <module>
>     import fixtures
> ImportError: No module named fixtures
>   File "/usr/lib/python2.7/site-packages/keystone/tests/unit/core.py", line 32, in <module>
>     import oslotest.base as oslotest
> ImportError: No module named oslotest.base
>   File "/usr/lib/python2.7/site-packages/fixtures/fixture.py", line 26, in <module>
>     from testtools.compat import (
> ImportError: No module named testtools.compat
>   File "/usr/lib/python2.7/site-packages/testtools/compat.py", line 31, in <module>
>     from extras import try_imports
> ImportError: No module named extras
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-openstack/recipes-devtools/python/python-fixtures_1.0.0.bb   | 2 ++
>  meta-openstack/recipes-devtools/python/python-keystone_git.bb     | 2 ++
>  meta-openstack/recipes-devtools/python/python-testtools_0.9.33.bb | 2 ++
>  3 files changed, 6 insertions(+)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-fixtures_1.0.0.bb b/meta-openstack/recipes-devtools/python/python-fixtures_1.0.0.bb
> index a3d6a34..fe1c8d1 100644
> --- a/meta-openstack/recipes-devtools/python/python-fixtures_1.0.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-fixtures_1.0.0.bb
> @@ -20,3 +20,5 @@ DISTUTILS_INSTALL_ARGS = "--root=${D} \
>      --prefix=${prefix} \
>      --install-lib=${PYTHON_SITEPACKAGES_DIR} \
>      --install-data=${datadir}"
> +
> +RDEPENDS_${PN} += "python-testtools"
> diff --git a/meta-openstack/recipes-devtools/python/python-keystone_git.bb b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
> index e5896df..1f012cc 100644
> --- a/meta-openstack/recipes-devtools/python/python-keystone_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
> @@ -284,6 +284,8 @@ RDEPENDS_${PN} += " \
>          python-pysaml2 \
>          python-oslo.utils \
>          python-oauthlib \
> +        python-fixtures \
> +        python-oslotest \
>          "
>
>  RDEPENDS_${SRCNAME}-tests += " bash"
> diff --git a/meta-openstack/recipes-devtools/python/python-testtools_0.9.33.bb b/meta-openstack/recipes-devtools/python/python-testtools_0.9.33.bb
> index 7e359b4..48663e9 100644
> --- a/meta-openstack/recipes-devtools/python/python-testtools_0.9.33.bb
> +++ b/meta-openstack/recipes-devtools/python/python-testtools_0.9.33.bb
> @@ -16,3 +16,5 @@ SRC_URI[sha256sum] = "5b62231fea71ccb2361d48286481b198ccb8768bf81f8aaec1c8d5fb98
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
>  inherit setuptools
> +
> +RDEPENDS_${PN} += "python-extras"
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

