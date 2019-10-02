Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D26F6E00D88; Wed,  2 Oct 2019 11:13:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000] *  1.8 FSL_HELO_FAKE FSL_HELO_FAKE
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.166.66 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 55679E00D16
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Oct 2019 11:13:06 -0700 (PDT)
Received: by mail-io1-f66.google.com with SMTP id c25so59056191iot.12
	for <meta-virtualization@yoctoproject.org>;
	Wed, 02 Oct 2019 11:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=rcugF84IE2PQRTnlfMrvh4J5GFtA3d/4kM+7+3LT+YE=;
	b=OPOXrZtxrWUZOtLgbUzGJxE7/NRE0v6EO8kOgbftTFFLmPsW6uwMF2fxt1WrUS12r0
	eb945P0a72fhI3KE5XlHon3q+mknPspoKaHnKLncj88hwgoTj7me9rQrjNf1RoDR0bAY
	ICzs55gYeaiv2lCYLU2PM3QM5+VQTKGnNTkRWVj1UAJmWe8sjTOrtqmbQu3T3yLuZhb7
	7d7XNxryOfx0oWEmvcR75SA0yUO1IXG1VkAU/woLWYxpISV6Y0PQWtEqhCt7rFkjolAw
	U/VIgbfq2449Ni06kWvFqdveLJ/oU6MrEDl9FqwB09Doq7HryDJ1Vu49DI/tA7l3hc1z
	qmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=rcugF84IE2PQRTnlfMrvh4J5GFtA3d/4kM+7+3LT+YE=;
	b=MfEsv0F1jaCm6E/B+U9urhrrFuRGLhFKeIWyAQzJ9dNDc+FJJlarDHQi7gsKuAJf5X
	JCBQGfCzf4ZGaTvRAUe3iKmM5OyLVeH4Ub74hxca7vFiVhRo/lGEHhNyLE5kjJWFj4L+
	8lk3OFyH+bcZO8Dfal5qQ1TVoMVXHLKHT341iQ5t4AHVtLGkJzTEJOhJKGfapJlEQRLS
	0Cn6VhXKLcJgUPJcG5KeMDlPF94N4eP6cWAQmdWRNafyXGMpx8+hz1wNrrsn6PTBDdNQ
	ekmIZGuqAGcWpPU+myiZP8W4hhGFV7ltwOm+StbnW4bwDFUf+jHCBeOqXI6WWwpAnMWv
	ZF6A==
X-Gm-Message-State: APjAAAU02NZbbA5ZBr1/ez9b9L3+z5pxyzZI4ffwUy+s3xbsS0scQaBo
	F9D/VK2xSSAnpAZD6ilxcv7+ox3SdNTGBw==
X-Google-Smtp-Source: APXvYqz/SfZ236jIv86JrcO5Bstb4Fg0wiUCvSpiFg9SzGnj+WRYmgoSRkN1ns7JLJ0u0Q0rqmelIg==
X-Received: by 2002:a6b:c903:: with SMTP id z3mr4629316iof.204.1570039985564; 
	Wed, 02 Oct 2019 11:13:05 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95])
	by smtp.gmail.com with ESMTPSA id o8sm108337ild.55.2019.10.02.11.13.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 02 Oct 2019 11:13:04 -0700 (PDT)
Date: Wed, 2 Oct 2019 14:13:02 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Message-ID: <20191002181259.GA54356@gmail.com>
References: <20190930154558.31698-1-mark.asselstine@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20190930154558.31698-1-mark.asselstine@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] libvirt: fixup multiple shlib providers
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
X-List-Received-Date: Wed, 02 Oct 2019 18:13:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] libvirt: fixup multiple shlib providers
on 30/09/2019 Mark Asselstine wrote:

> Build libvirt results in the follow warning:
> ERROR: libvirt-5.5.0-r0 do_package: libvirt-ptest: Multiple shlib providers for libvirt-admin.so.0: libvirt, libvirt-ptest
> (used by files: ./tmp/work/aarch64-overc-linux/libvirt/5.5.0-r0/packages-split/libvirt-ptest/usr/lib/libvirt/ptest/tools/virt-admin)
> ERROR: libvirt-5.5.0-r0 do_package: libvirt: Multiple shlib providers for libvirt-admin.so.0: libvirt, libvirt-ptest
> (used by files: ./tmp/work/aarch64-overc-linux/libvirt/5.5.0-r0/packages-split/libvirt/usr/bin/virt-admin)
> 
> This is caused by the introduction of a shlib provider check added to
> openembedded-core (commit 61c413690034 [package: Multiple
> shlib_providers for the same file should error]). You can see the
> issue and solution discussed more here
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=4628
> 
> Since the ptest version of the shared library will only be used by the
> ptest package so we can use PRIVATE_LIBS to have the shlib providers
> list.
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_5.5.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-extended/libvirt/libvirt_5.5.0.bb b/recipes-extended/libvirt/libvirt_5.5.0.bb
> index de936c4..53f4b3e 100644
> --- a/recipes-extended/libvirt/libvirt_5.5.0.bb
> +++ b/recipes-extended/libvirt/libvirt_5.5.0.bb
> @@ -357,6 +357,8 @@ EXTRA_OECONF += " \
>  
>  EXTRA_OEMAKE = "BUILD_DIR=${B} DEST_DIR=${D}${PTEST_PATH} PTEST_DIR=${PTEST_PATH} SYSTEMD_UNIT_DIR=${systemd_system_unitdir}"
>  
> +PRIVATE_LIBS_${PN}-ptest_append = "libvirt-admin.so.0"
> +
>  do_compile_ptest() {
>  	oe_runmake -C tests buildtest-TESTS
>  }
> -- 
> 2.21.0
> 
> -- 
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

