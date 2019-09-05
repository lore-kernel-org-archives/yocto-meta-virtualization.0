Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 55705E00E0D; Thu,  5 Sep 2019 07:09:43 -0700 (PDT)
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
	*      [209.85.167.68 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 49AD8E00E39
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Sep 2019 07:09:40 -0700 (PDT)
Received: by mail-lf1-f68.google.com with SMTP id d10so2182111lfi.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Sep 2019 07:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nA+tRjKIZi1sXGtn1F7rSbMawr37K1u/HYKiuR4fgCM=;
	b=Rs7WjDFj0vjRrLZ+KMhAaN3fGnu/2cxQWiID5Q+6zzceKckklHx+9O/FSrmoHJg1Zj
	8loLeebmJ6dhYz+D6650yqNTxQk1iCeK1KYsCN1MlCI2nqRCll5tfPvXhH1OBS10nCAS
	R/nSl9qnNHADheCIZj7LByKcnduJ9OKJBYY1cxggsElwr7sHo+aSP+rCopjewnpxQi3y
	iIGs84Ivhzab4lTPbG3NbUAVc95tCPZlbU7iTbt68QdGlfvPw+yZanp3YseagIKYmLst
	UpnOgOoXEAYsBpSM/fVSzXdr888l5Q+SSU+0c64x/yV8iaZZPGOLWOQ4F9L6WcRMYSRh
	20Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nA+tRjKIZi1sXGtn1F7rSbMawr37K1u/HYKiuR4fgCM=;
	b=h+GJBLCo3XE7V82LMJsqF4+VgwXOMyqQZNZ0cSSd3s/CRH9sLw/94oQw1HSeVK8wvL
	vzP/GyMBWN+5mZ41ntx/xCydFajDqsyZCrh4eleWl04nbSW1hktF6J3ALsaBwQi14yPD
	2MFLcOgMPPKJcK0fL2VDBsXwQbbAkW6OFDxtsV6yprexrHVqaHAZLe/5JBmKBgLijXiB
	PvGfByA1cWku3+Wd/5LTNh9nOo7s4bSxzZ2UrI7pQgI9K+YzaPmPXdg4YtZXaz7IjMSB
	bf3tSM8qnnUJ1yO5/H2OotJUcE52cj+HcqOFBIX69NUqxZEA2+wr0EPnnj4DW8T/T7KU
	YduA==
X-Gm-Message-State: APjAAAUUwqT9UoI97alZvu3olgDqybFBVQGXMuCwLRzSVKu5AoCZzMeO
	LdYYaQQu0EMORlNkE+iSeD1tGuT1FYIejukmykF7bUSl
X-Google-Smtp-Source: APXvYqznVqzFXf47sU35Jak1rf6WMokNa+m6ztAs286vZWFwN7owegfbOYnhGCw/1ApJrnp44we5J9IQKyay2YDlBVI=
X-Received: by 2002:a19:4347:: with SMTP id m7mr2460738lfj.146.1567692578839; 
	Thu, 05 Sep 2019 07:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190904030444.3848-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190904030444.3848-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 5 Sep 2019 10:09:27 -0400
Message-ID: <CADkTA4MshsoDkRQSWyB++mVeW2QmQzMuaHzwRovZ9Ga82Nn-Wg@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-warlock: Add python3 version
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
X-List-Received-Date: Thu, 05 Sep 2019 14:09:45 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Sep 3, 2019 at 11:05 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-warlock.inc          | 17 +++++++++++++++++
>  .../recipes-devtools/python/python-warlock_1.3.3.bb     | 16 ++--------------
>  .../recipes-devtools/python/python3-warlock_1.3.3.bb    |  3 +++
>  3 files changed, 22 insertions(+), 14 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-warlock.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-warlock_1.3.3.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-warlock.inc b/meta-openstack/recipes-devtools/python/python-warlock.inc
> new file mode 100644
> index 0000000..d8a16b1
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-warlock.inc
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "Build self-validating python objects using JSON schemas"
> +HOMEPAGE = "http://github.com/bcwaldon/warlock"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +
> +DEPENDS += "python-jsonschema python-jsonpatch"
> +
> +SRC_URI[md5sum] = "746aba989d97762948e5fca6601f283f"
> +SRC_URI[sha256sum] = "a093c4d04b42b7907f69086e476a766b7639dca50d95edc83aef6aeab9db2090"
> +
> +inherit pypi
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-jsonschema \
> +                   ${PYTHON_PN}-jsonpatch  \
> +                  "
> +
> diff --git a/meta-openstack/recipes-devtools/python/python-warlock_1.3.3.bb b/meta-openstack/recipes-devtools/python/python-warlock_1.3.3.bb
> index c2c694b..3358cec 100644
> --- a/meta-openstack/recipes-devtools/python/python-warlock_1.3.3.bb
> +++ b/meta-openstack/recipes-devtools/python/python-warlock_1.3.3.bb
> @@ -1,15 +1,3 @@
> -DESCRIPTION = "Build self-validating python objects using JSON schemas"
> -HOMEPAGE = "http://github.com/bcwaldon/warlock"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> -
> -DEPENDS += "python-jsonschema python-jsonpatch"
> -
> -SRC_URI[md5sum] = "746aba989d97762948e5fca6601f283f"
> -SRC_URI[sha256sum] = "a093c4d04b42b7907f69086e476a766b7639dca50d95edc83aef6aeab9db2090"
> -
> -inherit setuptools pypi
> -
> -RDEPENDS_${PN} += " python-jsonschema python-jsonpatch"
> +inherit setuptools
> +require python-warlock.inc
>
> diff --git a/meta-openstack/recipes-devtools/python/python3-warlock_1.3.3.bb b/meta-openstack/recipes-devtools/python/python3-warlock_1.3.3.bb
> new file mode 100644
> index 0000000..7f4d350
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-warlock_1.3.3.bb
> @@ -0,0 +1,3 @@
> +inherit setuptools3
> +require python-warlock.inc
> +
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
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

