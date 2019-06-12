Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D9219E00D59; Wed, 12 Jun 2019 06:37:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.210.65 listed in list.dnswl.org]
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 05FF4E00D4A
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Jun 2019 06:37:40 -0700 (PDT)
Received: by mail-ot1-f65.google.com with SMTP id z23so15405343ote.13
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Jun 2019 06:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
	:from:date:message-id:subject:to:cc;
	bh=b8e4XnCchCCe9RcanjyWQGNF91sCrgJzTyszuhJStRM=;
	b=AtnzdnxhlbJ6tBEwKqJhB8iD1k2Dp/9ZD55b2CVLdqsbauOP6lt5HnzeitVOBEHxwB
	6S7aU7jwh6N8qNNWytEQf+OeXizdTuy79AQTdnLa6d6HSC6pvjVElDvCzy4SBwjT4U8U
	7gdPzRJmCRVmOPZDcFnoQhJBeYV277HPfd8O7sid4Ugf1P77vw2cbAwJc3EZjXROm04y
	wKyYBOb6dtngcZdxyeG+uFX8KIruSyAGzsxQCkjYmgDVIzXDY6KeEomF+tmrAIO4cYP1
	j9gOA+uKMtZdG4jNymA1SBzdv8uloriseJilE3r7UrnFuB2dJDzwbwRmPJNc7Xc+ba7Z
	IVOw==
X-Gm-Message-State: APjAAAXttaA5Uc65m6X4cmDX4ztb9EDU7CyEeY5TZfzHy1rmsyiDgBAk
	q57JohCPHts7nd4del3/P0uELzpMXbmmuR7KXu4=
X-Google-Smtp-Source: APXvYqyAtmXwJkO/H+dPqrzFLgayBcezo8UhYMhSj/Yfc29aq2qdCSvWSkyXBso/CERbda+sxNzBYpCNQpnKBiBv4xY=
X-Received: by 2002:a9d:7559:: with SMTP id b25mr6407015otl.360.1560346660187; 
	Wed, 12 Jun 2019 06:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190612013939.29655-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190612013939.29655-1-zangrc.fnst@cn.fujitsu.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Wed, 12 Jun 2019 09:37:28 -0400
Message-ID: <CAPuovE+_sM9sGXb=tFW2GX-0c1p+O3E_fPn3YGF1b_PAJCr_tg@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-httplib2: upgrade 0.12.3 -> 0.13.0
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
X-List-Received-Date: Wed, 12 Jun 2019 13:37:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 11, 2019 at 9:38 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> -Upgrade from python-httplib2_0.12.3.bb to python-httplib2_0.13.0.bb.
>
> -Add recipe python3-httplib2_0.13.0.bb.
>
> -License-Update: Update the information of package.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  ...lib2_0.12.3.bb => python-httplib2_0.13.0.bb} |  6 +++---
>  .../python/python3-httplib2_0.13.0.bb           | 17 +++++++++++++++++
>  2 files changed, 20 insertions(+), 3 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-httplib2_0.12.3.bb => python-httplib2_0.13.0.bb} (59%)
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-httplib2_0.13.0.bb
>

There is a lot of shared data between these two bb files. In meta-openembedded
and oe-core... they have established a standard way of supporting both
py2 and py3
versions of recipes by making use of an .inc file. Would it not makes sense to
follow the same convention here?

Mark


> diff --git a/meta-openstack/recipes-devtools/python/python-httplib2_0.12.3.bb b/meta-openstack/recipes-devtools/python/python-httplib2_0.13.0.bb
> similarity index 59%
> rename from meta-openstack/recipes-devtools/python/python-httplib2_0.12.3.bb
> rename to meta-openstack/recipes-devtools/python/python-httplib2_0.13.0.bb
> index a1a518f..1e73ca9 100644
> --- a/meta-openstack/recipes-devtools/python/python-httplib2_0.12.3.bb
> +++ b/meta-openstack/recipes-devtools/python/python-httplib2_0.13.0.bb
> @@ -2,10 +2,10 @@ DESCRIPTION = "A comprehensive HTTP client library"
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
>  inherit setuptools pypi
>
> diff --git a/meta-openstack/recipes-devtools/python/python3-httplib2_0.13.0.bb b/meta-openstack/recipes-devtools/python/python3-httplib2_0.13.0.bb
> new file mode 100644
> index 0000000..1a5ac79
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-httplib2_0.13.0.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "A comprehensive HTTP client library"
> +HOMEPAGE = "https://code.google.com/p/httplib2/"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=341f12f35eee133c8ce15c04a042fb72"
> +
> +SRC_URI[md5sum] = "c0c3b1c1a1c51fa40f46271d95f74fdc"
> +SRC_URI[sha256sum] = "d1146939d270f1f1eb8cbf8f5aa72ff37d897faccca448582bb1e180aeb4c6b2"
> +
> +inherit setuptools3 pypi
> +
> +do_install_append() {
> +       perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "top_level.txt"`
> +       for f in $perm_files; do
> +               chmod 644 "${f}"
> +       done
> +}
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

