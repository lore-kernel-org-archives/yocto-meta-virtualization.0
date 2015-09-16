Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 30B4CE00C35; Wed, 16 Sep 2015 13:11:09 -0700 (PDT)
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
	*      [209.85.160.172 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7A7B0E00BF9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Sep 2015 13:11:07 -0700 (PDT)
Received: by ykdt18 with SMTP id t18so210672850ykd.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Sep 2015 13:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TYHfO+cW/ZQmCQ8itgWMCi2cmj34mnJg1h3WxDyXuhE=;
	b=MTtTd6B8ZrEPaMq5RS42EhcBfaFUzKEDpcAjaOh6hbO9x3V+Oq0eF8RGh+OwBDsFSP
	JhWmXVaJTHnNo7ytBURd3ofA+jwBTJgq7gHGwHukZueBdxbNW/FEgYK0YOwGA7QbcAjB
	FpoD1JUpMH6aH94Ah0qlZ7exeRsrCl546mf25LytUybhWFnV8L24G2f8g5QnQ7t4kQMo
	TSDpx/HSb7yNOPU8WTkQOOa6j1E2QuUz7M5Moog0qx3yK42DiONek2A7XDjYPknWBnRl
	znuku+dgKb75YhutAdJK4QrN7k2NEWB26f26Mn7LZ7X4t5494YXQJbaZPCThgVKAZohi
	uSrg==
MIME-Version: 1.0
X-Received: by 10.13.245.135 with SMTP id e129mr28933096ywf.13.1442434267392; 
	Wed, 16 Sep 2015 13:11:07 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Wed, 16 Sep 2015 13:11:07 -0700 (PDT)
In-Reply-To: <1442420798-8646-1-git-send-email-mark.asselstine@windriver.com>
References: <1442420798-8646-1-git-send-email-mark.asselstine@windriver.com>
Date: Wed, 16 Sep 2015 16:11:07 -0400
Message-ID: <CADkTA4ON51RzeyYyxPCJ-E7-VxCFNjKL0qiRhtgPCYH2CiPKdw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/2] libvirt: upgrade 1.2.17 -> 1.2.19
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
X-List-Received-Date: Wed, 16 Sep 2015 20:11:09 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Wed, Sep 16, 2015 at 12:26 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> The release notes is http://libvirt.org/news.html
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>
> Roys' original patch with context fixed up to apply against the
> latest. (non-thunking).
>
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
> index 06cb51b..f433321 100644
> --- a/recipes-extended/libvirt/libvirt_1.2.17.bb
> +++ b/recipes-extended/libvirt/libvirt_1.2.19.bb
> @@ -35,8 +35,8 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
>             file://Revert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch \
>            "
>
> -SRC_URI[libvirt.md5sum] = "a1f49050223be3cbd7678c32b1ee2756"
> -SRC_URI[libvirt.sha256sum] = "e07eaf20b0590fae05ba3b53ad4dac3e5fbd771437563cc78b692f23ddd02fad"
> +SRC_URI[libvirt.md5sum] = "bc3ab1ba5b6fabd2e4516c70ddd4d97c"
> +SRC_URI[libvirt.sha256sum] = "282c141f03331d640020c15f81464b27400e0ee307ef4c5190393b021caedd6e"
>
>  inherit autotools gettext update-rc.d pkgconfig ptest systemd
>
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

