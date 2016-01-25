Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 804A1E00BEA; Mon, 25 Jan 2016 14:31:04 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ig0-f194.google.com (mail-ig0-f194.google.com
	[209.85.213.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3E55FE00BE3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Jan 2016 14:31:00 -0800 (PST)
Received: by mail-ig0-f194.google.com with SMTP id o2so6050494iga.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Jan 2016 14:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ghXSKDXwiqPlhWbAqId4LkbVTdORlxctaduxTAtNCVM=;
	b=EKTI+5ZL62gXygFsTyuqEL1D3+BDOhzUFK6cpTNZvfqu0MYBRD+6w4gtUj8f+TJZZ9
	urlDJBhEQMBK8TFRwLDoL5O1g+jrJ+5OEM516I2xKcQDo3LiZgfN4ttUCQABcsncfKUf
	qh62D7FzyYElYDmbEk/0S9kJIDxOoecqKd6WHtc9q0ObLzt+tnNqpca8KjnUI+qXs79X
	cL/B40+f/F4cmd6TIwpM77W7/8hUBVFK6W0ei09zXfiByV4i7oqPFwBm038aT5nyIldy
	e4KUlY2RbetnY0dZf9e2tj+tZcokWEUat/qHn6IorVtgfCULp96pJsXibVRuPD5d6h6i
	P4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=ghXSKDXwiqPlhWbAqId4LkbVTdORlxctaduxTAtNCVM=;
	b=SslSNu8MS/JddoatcHxVM3hzeaWKqmno8Xq7wukWkf54R1A+9dCOGMQyHXPAyW4Fuh
	KOzIjmfG19dN+IonI4YzNlg+WKLokln9cCDssh0tcmxR2cD+AG98PV/EkH0oJHZ4XL/K
	xFYXO7SpGrbcnMDVbRyChyrE7RCx55uk6zyy1N94YCsUs7mxybtVF4wTFS9GajAOijHb
	UexhbQcS+KM4CQ3V3h/cTgOO3SIbkQ2IGlKaiAt+3JJKePU9guVQQyH2fs64Wt0XswYZ
	rg1RElhkMdX0qOj1jNMFVehzAYfNvbAdR63tgQroLya/3KLgQ2bz+cXG/qUzHLFvpWxx
	jPow==
X-Gm-Message-State: AG10YOSglu2nRyg7mIxKTQ8nbfgADHaIAZhqfnoiuxDvUNwuGvi/F55snaI8Y396IG7LA4hNeF5JZ2csxN7RAg==
MIME-Version: 1.0
X-Received: by 10.50.79.231 with SMTP id m7mr20083939igx.15.1453761059995;
	Mon, 25 Jan 2016 14:30:59 -0800 (PST)
Received: by 10.79.125.142 with HTTP; Mon, 25 Jan 2016 14:30:59 -0800 (PST)
In-Reply-To: <1453735752-966-4-git-send-email-cardoe@cardoe.com>
References: <1453735752-966-1-git-send-email-cardoe@cardoe.com>
	<1453735752-966-4-git-send-email-cardoe@cardoe.com>
Date: Mon, 25 Jan 2016 17:30:59 -0500
Message-ID: <CABZSBQffzfei93ETaF+HKErfvbfN9LNHP0iHDr9vae+zJuyqKw@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 4/5] xen: separate the extra steps into their own tasks
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
X-List-Received-Date: Mon, 25 Jan 2016 22:31:04 -0000
Content-Type: text/plain; charset=UTF-8

LGTM, it builds fine, but I'm no expect on addtask usage :)

On Mon, Jan 25, 2016 at 10:29 AM, Doug Goldstein <cardoe@cardoe.com> wrote:
> do_configure() was overloaded with a lot of behaviors that really were
> source code patching so instead make them as extra tasks that happen
> after do_patch() and before do_configure().
>
> Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
> ---
>  recipes-extended/xen/xen.inc      | 21 ++++++++++++++++++++-
>  recipes-extended/xen/xen_4.6.0.bb | 12 ------------
>  2 files changed, 20 insertions(+), 13 deletions(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 2df7525..3e029ee 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -729,7 +729,21 @@ python () {
>          d.setVar('XSM_ENABLED', '0')
>  }
>
> -do_configure() {
> +do_post_patch() {
> +    # fixup AS/CC/CCP/etc variable within StdGNU.mk
> +    for i in LD CC CPP CXX; do
> +        sed -i "s/^\($i\s\s*\).*=/\1?=/" ${S}/config/StdGNU.mk
> +    done
> +    # fixup environment passing in some makefiles
> +    sed -i 's#\(\w*\)=\(\$.\w*.\)#\1="\2"#' ${S}/tools/firmware/Makefile
> +
> +    # libsystemd-daemon -> libsystemd for newer systemd versions
> +    sed -i 's#libsystemd-daemon#libsystemd#' ${S}/tools/configure
> +}
> +
> +addtask post_patch after do_patch before do_configure
> +
> +do_stubs() {
>      # no stubs-32.h in our 64-bit sysroot - hack it into tools/include/gnu
>      if ! test -f ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-32.h ; then
>          if test -f ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-64.h ; then
> @@ -740,6 +754,11 @@ do_configure() {
>              echo \#define __stub___kernel_tanl >> ${S}/tools/include/gnu/stubs-32.h
>          fi
>      fi
> +}
> +
> +addtask stubs after do_patch before do_configure
> +
> +do_configure() {
>
>      #./configure --enable-xsmpolicy does not set XSM_ENABLE must be done manually
>      if [ "${XSM_ENABLED}" = "1" ]; then
> diff --git a/recipes-extended/xen/xen_4.6.0.bb b/recipes-extended/xen/xen_4.6.0.bb
> index 92975a0..95570a7 100644
> --- a/recipes-extended/xen/xen_4.6.0.bb
> +++ b/recipes-extended/xen/xen_4.6.0.bb
> @@ -27,18 +27,6 @@ EXTRA_OEMAKE += "SEABIOS_ROM=${STAGING_DIR_HOST}/usr/share/firmware/bios.bin"
>  EXTRA_OEMAKE += "ETHERBOOT_ROMS=${STAGING_DIR_HOST}/usr/share/firmware/rtl8139.rom"
>  #EXTRA_OEMAKE += "XENGFX_ROM=${STAGING_DIR_HOST}/usr/share/firmware/vgabios.bin"
>
> -do_configure_prepend() {
> -    # fixup AS/CC/CCP/etc variable within StdGNU.mk
> -    for i in LD CC CPP CXX; do
> -        sed -i "s/^\($i\s\s*\).*=/\1?=/" ${S}/config/StdGNU.mk
> -    done
> -    # fixup environment passing in some makefiles
> -    sed -i 's#\(\w*\)=\(\$.\w*.\)#\1="\2"#' ${S}/tools/firmware/Makefile
> -
> -    # libsystemd-daemon -> libsystemd for newer systemd versions
> -    sed -i 's#libsystemd-daemon#libsystemd#' ${S}/tools/configure
> -}
> -
>  do_install_append() {
>      # fixup default path to qemu-system-i386
>      sed -i 's#\(test -z "$QEMU_XEN" && QEMU_XEN=\).*$#\1"/usr/bin/qemu-system-i386"#' ${D}/etc/init.d/xencommons
> --
> 2.4.10
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

