Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7D952E00CE7; Thu, 26 Jul 2018 07:42:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.173 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
	[209.85.208.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AC64CE00CDD
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Jul 2018 07:42:23 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id j19-v6so1723639ljc.7
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Jul 2018 07:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1YMWqVVoSRku8lrIjkgTC/x3WpVB448B7KjFKakW1nw=;
	b=byEtIdo21wrTrSu/cBYGy0Db19hsYQ4PdCc4ZuAJfTf6rsNQe1Ax1CZh1oUX7fvpoc
	sMom6JR6hPzpbMZfpFlf/P/WImWYK89U7X+PWm7An7wShr1f0x2bw6Iltelncnf1MTgO
	ksxDAW50QSl/pHO6eOEeqb5MNCVqQsDVFmZ7momtVoMIVnOIZMkGTb4WMfI9L5Sp4jTK
	c71OvJvkUk/O+gqHTJQYEv300P2sCYlDK461IYB8av4qcgBKuz8ObWgNKy+RnIWHVBwW
	/ox7L/6ztOuWJlIQ/nTmUwWDQJV85I2QrSfrF62+vs/Gt+LI4280sO+KnGRe8O5JW1O+
	ILGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1YMWqVVoSRku8lrIjkgTC/x3WpVB448B7KjFKakW1nw=;
	b=Frg4CaFfoS/wHH4/6wkG86CIJGw4GAl9q5CNlyyy0He6UtckrAUn/ai11Y4n17YWop
	3QqMR+P9C+igyGNGg8j8q/SK91JEmNlyisY2BQOPefpG7WnK2Q7EILJUfZEXX8cEvvDx
	oiSndqkEQxNh5K9bcPOUuTOIvu5cBAk9P4XvfRAABZwXiaah1vogk/jYlxRlXqguaaTo
	iMlx3IN8I8LndWsr70GYMbIPrh0Y76KNGSJ2TYhkrMas10+R76rVpHV7VQJVsQHz+Ieh
	BCxLul+V2XrgvNU+RtPr47JgL1fVClj944tafgYj+9UPhP/yI+0pYOxEjbsvTo0/vkR1
	6Ocg==
X-Gm-Message-State: AOUpUlHYptVYGaU+TZC2sNJef6FIlCQTmh8M9HllXWOXnvVNHilC70LB
	jUTY0zcycp/oM++fXrcyY7hxHjgcY+eAyS80EUw=
X-Google-Smtp-Source: AAOMgpcc1b7ii83Eou16CELlxFypYbeN5+Ts7Pm5WOtT0RN4CzVafeBo9MsnON5SGhIYOyWU3Jyv9YrWQj08uARFdxw=
X-Received: by 2002:a2e:9c0f:: with SMTP id
	s15-v6mr2056699lji.97.1532616142676; 
	Thu, 26 Jul 2018 07:42:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Thu, 26 Jul 2018 07:42:22
	-0700 (PDT)
In-Reply-To: <20180724125001.5785-1-zhe.he@windriver.com>
References: <20180724125001.5785-1-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 26 Jul 2018 10:42:22 -0400
Message-ID: <CADkTA4P4Xg+jOBVQEYnpfuuCp++GS7=Vj6f=QQMXsPUOpJOE0g@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] libvirt: Remove unsupported configure options and fix warning
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
X-List-Received-Date: Thu, 26 Jul 2018 14:42:24 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Jul 24, 2018 at 8:50 AM, He Zhe <zhe.he@windriver.com> wrote:
> xen and xen-inotify have been removed from upstream. We change
> PACKAGECONFIG accordingly.
>
> pkg_postinst has been deprecated, use pkg_postinst_ontarget instead.
>
> WARNING: do_rootfs: Intentionally failing postinstall scriptlets of
> ['libvirt'] to defer them to first boot is deprecated. Please place
> them into pkg_postinst_ontarget_${PN} ().
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_4.3.0.bb | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_4.3.0.bb b/recipes-extended/libvirt/libvirt_4.3.0.bb
> index edd5261..e6dac5d 100644
> --- a/recipes-extended/libvirt/libvirt_4.3.0.bb
> +++ b/recipes-extended/libvirt/libvirt_4.3.0.bb
> @@ -175,7 +175,7 @@ PRIVATE_LIBS_${PN}-ptest = " \
>  PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 lxc test \
>                     remote macvtap libvirtd netcf udev python ebtables \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit libcap-ng', '', d)} \
> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'xen libxl xen-inotify', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'libxl', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'polkit', '', d)} \
>                    "
>
> @@ -183,10 +183,8 @@ PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 lxc test \
>  #
>  PACKAGECONFIG[qemu] = "--with-qemu,--without-qemu,qemu,"
>  PACKAGECONFIG[yajl] = "--with-yajl,--without-yajl,yajl,yajl"
> -PACKAGECONFIG[xen] = "--with-xen,--without-xen,xen,"
>  PACKAGECONFIG[xenapi] = "--with-xenapi,--without-xenapi,,"
>  PACKAGECONFIG[libxl] = "--with-libxl=${STAGING_DIR_TARGET}/lib,--without-libxl,libxl,"
> -PACKAGECONFIG[xen-inotify] = "--with-xen-inotify,--without-xen-inotify,xen,"
>  PACKAGECONFIG[uml] = "--with-uml, --without-uml,,"
>  PACKAGECONFIG[openvz] = "--with-openvz,--without-openvz,,"
>  PACKAGECONFIG[vmware] = "--with-vmware,--without-vmware,,"
> @@ -305,7 +303,7 @@ do_install_ptest() {
>         done
>  }
>
> -pkg_postinst_libvirt() {
> +pkg_postinst_ontarget_${PN}() {
>          if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
>                  /etc/init.d/populate-volatile.sh update
>          fi
> --
> 2.11.0
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

