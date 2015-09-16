Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 84B57E00CFB; Wed, 16 Sep 2015 08:54:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.212.179 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4913AE00BDE
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Sep 2015 08:54:01 -0700 (PDT)
Received: by wicfx3 with SMTP id fx3so77050392wic.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Sep 2015 08:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=lpCLaY0bsGqljbTjIMWg2lUSD9S99Nh3JhevRDfLWtE=;
	b=GZfMixzErgx4iwrAGPHKOeq94ga8F+2DscmrTRbGn5xb05BQXh53dsDGwHgKen3fYf
	MUH/TrQn0zZnFTW9YtJKrWTks0DTBuSRLAW2nOkJpWz+sN0mUSjE05nsenueMxwDwYDD
	U9OQ17HJGOX4II6xquQ+mx2duHO8HCcqfjlP2ZD3JByqsA4c+kZTjVXyw9DGgi7Lt5wk
	WEkWi6QyB++2x0Nzj4xnc3NWoWBgxnG7N2tXisU0DzhT4f3Yc7RO+F1NblqBGd8vt8j+
	MWz9hJQpgX3XUa0qYtdodwFlas8wzL3ikipR+bfcbvQyYs6+3K+Lmx/bTCb041COtIbw
	DhmA==
MIME-Version: 1.0
X-Received: by 10.180.104.38 with SMTP id gb6mr19969476wib.86.1442418840651;
	Wed, 16 Sep 2015 08:54:00 -0700 (PDT)
Sender: asselsm@gmail.com
Received: by 10.194.201.163 with HTTP; Wed, 16 Sep 2015 08:54:00 -0700 (PDT)
In-Reply-To: <1442370368-30349-1-git-send-email-rongqing.li@windriver.com>
References: <1442370368-30349-1-git-send-email-rongqing.li@windriver.com>
Date: Wed, 16 Sep 2015 11:54:00 -0400
X-Google-Sender-Auth: 4nU1uDSn0c4kO73gHu6jJ1dF9aY
Message-ID: <CAPuovE+HfmdjdBYJKGVt8xMcS2NKjU5A1VTAY9HNDd3Btc10=A@mail.gmail.com>
From: "M. Asselstine" <asselsm@mcmaster.ca>
To: rongqing.li@windriver.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libvirt: upgrade 1.2.17 -> 1.2.19
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
X-List-Received-Date: Wed, 16 Sep 2015 15:54:03 -0000
Content-Type: text/plain; charset=UTF-8

This doesn't apply cleanly because your tree is not up to date.
Specifically you are missing commit
9f177c12d8361341853fe9c34f6c5b8df3cbcc1a [libvirt: enable systemd
support] and so the context in the
recipes-extended/libvirt/libvirt_1.2.17.bb part of the patch does not
match.

I have another libvirt change to send out so I will include an update
of your change along with it to allow this to merge cleanly.

On Tue, Sep 15, 2015 at 10:26 PM,  <rongqing.li@windriver.com> wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> The release notes is http://libvirt.org/news.html
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../{libvirt-1.2.17 => libvirt-1.2.19}/0001-to-fix-build-error.patch  | 0
>  recipes-extended/libvirt/libvirt-python.inc                           | 4 ++--
>  recipes-extended/libvirt/{libvirt_1.2.17.bb => libvirt_1.2.19.bb}     | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
>  rename recipes-extended/libvirt/{libvirt-1.2.17 => libvirt-1.2.19}/0001-to-fix-build-error.patch (100%)
>  rename recipes-extended/libvirt/{libvirt_1.2.17.bb => libvirt_1.2.19.bb} (98%)
>
> diff --git a/recipes-extended/libvirt/libvirt-1.2.17/0001-to-fix-build-error.patch b/recipes-extended/libvirt/libvirt-1.2.19/0001-to-fix-build-error.patch
> similarity index 100%
> rename from recipes-extended/libvirt/libvirt-1.2.17/0001-to-fix-build-error.patch
> rename to recipes-extended/libvirt/libvirt-1.2.19/0001-to-fix-build-error.patch
> diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
> index f42e491..015b4b6 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -18,8 +18,8 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
>  SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
>  SRC_URI += "file://libvirt_api_xml_path.patch;patchdir=../libvirt-python-${PV}"
>
> -SRC_URI[libvirt_python.md5sum] = "a695e323e33db562d86e947f7ac77f09"
> -SRC_URI[libvirt_python.sha256sum] = "f4d3db4012a800a2519e62bbef4ce14a37e030a20ab18f5b66759533a39b36ed"
> +SRC_URI[libvirt_python.md5sum] = "429e328028fc59b62404a4163004f2ae"
> +SRC_URI[libvirt_python.sha256sum] = "88ab63b0c53e435bd2c6e8551805fe273353708efd4dfab908257dc5f37bec49"
>
>  export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
>  export LIBVIRT_CFLAGS = "-I${S}/include"
> diff --git a/recipes-extended/libvirt/libvirt_1.2.17.bb b/recipes-extended/libvirt/libvirt_1.2.19.bb
> similarity index 98%
> rename from recipes-extended/libvirt/libvirt_1.2.17.bb
> rename to recipes-extended/libvirt/libvirt_1.2.19.bb
> index a945792..1d5e328 100644
> --- a/recipes-extended/libvirt/libvirt_1.2.17.bb
> +++ b/recipes-extended/libvirt/libvirt_1.2.19.bb
> @@ -34,8 +34,8 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
>             file://0001-to-fix-build-error.patch \
>            "
>
> -SRC_URI[libvirt.md5sum] = "a1f49050223be3cbd7678c32b1ee2756"
> -SRC_URI[libvirt.sha256sum] = "e07eaf20b0590fae05ba3b53ad4dac3e5fbd771437563cc78b692f23ddd02fad"
> +SRC_URI[libvirt.md5sum] = "bc3ab1ba5b6fabd2e4516c70ddd4d97c"
> +SRC_URI[libvirt.sha256sum] = "282c141f03331d640020c15f81464b27400e0ee307ef4c5190393b021caedd6e"
>
>  inherit autotools gettext update-rc.d pkgconfig ptest
>
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

