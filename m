Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2BCFDE00D86; Mon, 17 Jun 2019 21:02:25 -0700 (PDT)
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
	*      [209.85.167.65 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 91F84E00D64
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jun 2019 21:02:24 -0700 (PDT)
Received: by mail-lf1-f65.google.com with SMTP id u10so8106905lfm.12
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jun 2019 21:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BeLtvQV7vQEe1mi3lTqY4xChjPccYLd3dqGdojARG5Q=;
	b=adC9Pubv7ezMlWY8CdqZLpYqhdUL2uTal9cTRstfvufv9BTH7la3AbNMeCV7g7AuqW
	WxcUnhGJXX1JjsiLbFOR7abdM8CplADfthrX7qpZK2x1XrYwltB52m+Xg0UFS86mpyUY
	HilrKLm66y69dhj/AsyCeP78P717WferMrrOZLAQ0M//xMfsYd/8XNGLP6PFwFauaOxN
	b0nv0zqyk8CeHikfP+w+m1Fc9MtfID25vSCvRsZ9gCHf1EtU91+2AY91YeSDmlssVCaF
	Uc9t4xUatunUCJjPv4lueAqc5cSbs7J07hEaaEKbjsaLbxKth/Y9xUJmI6xU94hymMJS
	/6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BeLtvQV7vQEe1mi3lTqY4xChjPccYLd3dqGdojARG5Q=;
	b=BX4oh1yk22RhLhEAk04kBTE6WoqME5G7//ZWr914+YQdS6agNj9i35TAp6qi2+yGpX
	Rf0E+mL7yiLFcab4CxJO4gCMy/MCk/1F4o9YQWaNvrbHv0CC73LdzZUTEYKaFqk6PuU1
	iXUdoB0T9EIdIBiygju/VAXaxwhsRDtBPlS6+iFOe5HnOWAyyh+Pldp/hEFE/aIMG63t
	jWgPXBC8VgMO4R21pM1FkWER0dwjw7fitNBkPuv1SWbIqQNWTKsMdsXRNDDtSpJ08O5V
	niESPJrOW/W9GOAgeHREdzX9K7uoWVU5YkNrT1hRz9Bq0y6T4ji30sKtDtrppAYk1qj4
	YLTw==
X-Gm-Message-State: APjAAAUH2nRuOJ6altFTOhNQdAoP4eexI7RrlmNii6BtVPRn7qHlBiXc
	fAIUpmQBrDtHMcD0bnxl24BSeOnm7SUAKGAd9ls=
X-Google-Smtp-Source: APXvYqyO606MD57NcQUxTCVLUoC55+aF6fBajdH+dvgMMSVmJvWS1rI8jgPa1//Bu5GD8/GzxlXq3t5FEPqauCJswSo=
X-Received: by 2002:ac2:5285:: with SMTP id q5mr56394004lfm.146.1560830543225; 
	Mon, 17 Jun 2019 21:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190613060524.13621-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190613060524.13621-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 18 Jun 2019 00:02:12 -0400
Message-ID: <CADkTA4NopHfAedOx5UKdzGksebTN2_VUoB0q5dHJg6Vy5sqB8Q@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH v2] python-httplib2: upgrade 0.12.3 -> 0.13.0
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
X-List-Received-Date: Tue, 18 Jun 2019 04:02:25 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, Jun 13, 2019 at 2:04 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> -Upgrade from python-httplib2_0.12.3.bb to python-httplib2_0.13.0.bb.
>
> -Add recipe python3-httplib2_0.13.0.bb.
>
> -License-Update: Update the information of package.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../{python-httplib2_0.12.3.bb => python-httplib2.inc}    | 8 ++++----
>  .../recipes-devtools/python/python-httplib2_0.13.0.bb     | 2 ++
>  .../recipes-devtools/python/python3-httplib2_0.13.0.bb    | 2 ++
>  3 files changed, 8 insertions(+), 4 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-httplib2_0.12.3.bb => python-httplib2.inc} (55%)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-httplib2_0.13.0.bb
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-httplib2_0.13.0.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-httplib2_0.12.3.bb b/meta-openstack/recipes-devtools/python/python-httplib2.inc
> similarity index 55%
> rename from meta-openstack/recipes-devtools/python/python-httplib2_0.12.3.bb
> rename to meta-openstack/recipes-devtools/python/python-httplib2.inc
> index a1a518f..95890cc 100644
> --- a/meta-openstack/recipes-devtools/python/python-httplib2_0.12.3.bb
> +++ b/meta-openstack/recipes-devtools/python/python-httplib2.inc
> @@ -2,12 +2,12 @@ DESCRIPTION = "A comprehensive HTTP client library"
>  HOMEPAGE = "https://code.google.com/p/httplib2/"
>  SECTION = "devel/python"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=ad87b270277b5f40e2a281d9f7dde584"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=341f12f35eee133c8ce15c04a042fb72"
>
> -SRC_URI[md5sum] = "f78ce222216865271f2672e6941174d5"
> -SRC_URI[sha256sum] = "a18121c7c72a56689efbf1aef990139ad940fee1e64c6f2458831736cd593600"
> +SRC_URI[md5sum] = "c0c3b1c1a1c51fa40f46271d95f74fdc"
> +SRC_URI[sha256sum] = "d1146939d270f1f1eb8cbf8f5aa72ff37d897faccca448582bb1e180aeb4c6b2"
>
> -inherit setuptools pypi
> +inherit pypi
>
>  do_install_append() {
>         perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "top_level.txt"`
> diff --git a/meta-openstack/recipes-devtools/python/python-httplib2_0.13.0.bb b/meta-openstack/recipes-devtools/python/python-httplib2_0.13.0.bb
> new file mode 100644
> index 0000000..8f98163
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-httplib2_0.13.0.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools
> +require python-httplib2.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-httplib2_0.13.0.bb b/meta-openstack/recipes-devtools/python/python3-httplib2_0.13.0.bb
> new file mode 100644
> index 0000000..03be0bd
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-httplib2_0.13.0.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-httplib2.inc
> --
> 2.20.1
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

