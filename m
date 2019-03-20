Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1E97CE00C1E; Wed, 20 Mar 2019 11:39:58 -0700 (PDT)
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
	*      [209.85.167.53 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
	[209.85.167.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 69052E00950
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Mar 2019 11:39:57 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id u21so2705668lfu.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Mar 2019 11:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hGprUdIKwzztbUj9vlBlAPC7vboefxfGdiTf4bM32lk=;
	b=mEDrRbvWrx8L3NzgEPFhEzuoxxRn/wdrGQT+U2w8jLv9IAIK6bE/FDTba1x3GV/wA6
	+7jWZb2RiJb9qp4IKHHRkGDrXqS9LcceVCDPr1Tvajno6NOILRLX3Id7l4Cz0Gi4mGjn
	1IWn2fnFf3lpm/sVrJGPwLm7dZh0XKezLMDD1/JuxM2a+LgNpMyBrz2LSyBtxjKtrxGH
	A/x2sx2vmKg0UGDwufR+d7SHXZ68PHxuwhJBl1z6BhQkEJUJJ3SmqJ3Zvpeqkf4eTYha
	NYHrbYUebAqCmZv8MV3q6l7qs+gsUhpIVdpFmfbxs6cgus/Fcjkvhtefhj/TXRN+f7XN
	nadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hGprUdIKwzztbUj9vlBlAPC7vboefxfGdiTf4bM32lk=;
	b=gzt824OVsSno+aBMGqHzv7VmDXZ2cYpx/zpS5kerjXzdngKLor7NEPE/885yFu/vE6
	ikNQX4vScvOdSyI03894IIXand8tPo37flaKzihLKeoTwr0Jx+gGxVZXrtH8Y9uKr1/z
	iuXRTJkQhIzspuXNGNE3WNI7ccoOlTUEsAq6jjAA8P7Z6s+zOAIGJ9ngMNgqGGy1Z2cx
	Tt83XxL579+M3c4E4eKhgNPWOVlU0ihPerjijLGf1uesh7jv2s741uMkLJ5MheU5iumZ
	fPCfGyK9EGVJ+Sh6UJ09txdZfQXGHpUsKa5sHfKPFGwEEMEroI4ajgkjmvB6wid+63AP
	h9tQ==
X-Gm-Message-State: APjAAAXbPlx/mX93l9OEj6+etGF3Y/vCd64A19PgKGC/kj1ot8mICbtb
	KHX2y37lR3mMCnT3qha980wnSbwjsHD6EX8KEkQ=
X-Google-Smtp-Source: APXvYqy2UYYagvB1yPufCOVSUmBEcxLkw5NKfGtdkjCc6niYngFaaagYRfaxguh/uvPbe0xlcwzAnka8f7FabggZEy8=
X-Received: by 2002:a19:968c:: with SMTP id
	y134mr10053462lfd.140.1553107196335; 
	Wed, 20 Mar 2019 11:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <1552874174-26647-1-git-send-email-dengke.du@windriver.com>
In-Reply-To: <1552874174-26647-1-git-send-email-dengke.du@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 20 Mar 2019 14:39:45 -0400
Message-ID: <CADkTA4M=phqoRjVikX-kRAm7E62=5dx_hTrfy=e74fjBSdcmiQ@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] libvirt: place the qemu configure option to PACKAGECONFIG
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
X-List-Received-Date: Wed, 20 Mar 2019 18:39:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 17, 2019 at 9:56 PM Dengke Du <dengke.du@windriver.com> wrote:
>
> If we build libvirt with mips64 arch will fail that was not compatible with,
> so place the qemu configure options to PACKAGECONFIG, let the PACKAGECONFIG
> control the build options.

It would have been worth mentioning that qemu is in the default
packageconfig, hence the build isn't changed for most architectures. I
added that to the config option and pushed the change.

Bruce

>
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_4.9.0.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_4.9.0.bb b/recipes-extended/libvirt/libvirt_4.9.0.bb
> index 17ac799..813d95e 100644
> --- a/recipes-extended/libvirt/libvirt_4.9.0.bb
> +++ b/recipes-extended/libvirt/libvirt_4.9.0.bb
> @@ -197,7 +197,7 @@ PACKAGECONFIG_remove_mipsarchn64 = "qemu"
>
>  # enable,disable,depends,rdepends
>  #
> -PACKAGECONFIG[qemu] = "--with-qemu,--without-qemu,qemu,"
> +PACKAGECONFIG[qemu] = "--with-qemu --with-qemu-user=qemu --with-qemu-group=qemu,--without-qemu,qemu,"
>  PACKAGECONFIG[yajl] = "--with-yajl,--without-yajl,yajl,yajl"
>  PACKAGECONFIG[xenapi] = "--with-xenapi,--without-xenapi,,"
>  PACKAGECONFIG[libxl] = "--with-libxl=${STAGING_DIR_TARGET}/lib,--without-libxl,xen,"
> @@ -315,8 +315,6 @@ do_install_append() {
>  EXTRA_OECONF += " \
>      --with-init-script=systemd \
>      --with-test-suite \
> -    --with-qemu-user=qemu \
> -    --with-qemu-group=qemu \
>      "
>
>  EXTRA_OEMAKE = "BUILD_DIR=${B} DEST_DIR=${D}${PTEST_PATH} PTEST_DIR=${PTEST_PATH} SYSTEMD_UNIT_DIR=${systemd_system_unitdir}"
> --
> 2.7.4
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

