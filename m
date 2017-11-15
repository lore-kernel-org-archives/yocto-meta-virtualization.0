Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 751E3E00D32; Wed, 15 Nov 2017 06:39:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A4079E00D28
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 06:39:19 -0800 (PST)
Received: by mail-yw0-f195.google.com with SMTP id a4so1523133ywh.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 06:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RlLDoN0OBArgV4pQv3MWYeyGxHvsxFe1mR2k6cHblmw=;
	b=aGOdq9eFXrSA5N7I4DQzfpQbAGc1wVWQdi7ilovGtWOWKdx7CXKUNazBN0wsbdHDbw
	MXZ8i4GSCda1w4FE0v3D5lTY2Qi2nVL+762Nj8HxeF+v4zpmTe0Cst8mPGEFkhct/OV7
	50AfOlRI/T47E4lpQRBR4dLlZ9GxsAq6X0UwoEGmsOzHshhx3MfEv/oCLZul32fVNiRK
	UFGozza3/C/gA2fG0uvafPrU6x/FnKdGtZ0tRYn8jXFMCAx+dqGLtWbDrwneT9IxL1LY
	RsGLjWJN90cfIfRTNx7em0sje0QOTM9Eo3MQyDNrYJo+I2kxizA/SZrN+VYqPT5bWsjy
	N2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=RlLDoN0OBArgV4pQv3MWYeyGxHvsxFe1mR2k6cHblmw=;
	b=CUAgPKky0V+fYGl0AY452JnK7haVuC9uAfnYthmmLGJn4cVtGwLa75uC0G4qIHKYh+
	1B4VFATqecEo+uPc/Qe2Rj7yGTCByTUlrpVTQJ1HmEoIBaHh80/KTA5xPKw+32E7x6mU
	4vw+ou+S6818x9O+2hbCN7wBO2ZQ1FrX6aZwQuWeewFofdUNaWf/s+JSRIwWeLEZhDFZ
	T4PIgEZMxuG47/EaCPfnYDNoqphuvlm/cJJgLJS4jdENj7bmQbT7TYKeQ2xCAQ/bs4EO
	5lzzs93jt5tQpOLz0ByIW1hMnyOnivrbBrxMYNTyNdXjwW31j3r8qO20yU+tKBWfit4E
	isDA==
X-Gm-Message-State: AJaThX6fwrjn0E6JxboArBzWrMInh0359+P3X7oz0ybnn6ueyC71TNd1
	IOCvOmayIX/sjcWAzl4eT3GDhb1r2Oa4q9x8z6U=
X-Google-Smtp-Source: AGs4zMZTiDRbGSdyF9ZGW7jpV1aEgbvy/CAlmz1ZzYKC7ayak52jcip5coCPuoaoz7CMU8UwsQu/nMTOCHh1bjTPu6g=
X-Received: by 10.13.196.196 with SMTP id g187mr10432051ywd.41.1510756758672; 
	Wed, 15 Nov 2017 06:39:18 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.131.144 with HTTP; Wed, 15 Nov 2017 06:39:18 -0800 (PST)
In-Reply-To: <1510762063-47522-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1510762063-47522-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Wed, 15 Nov 2017 09:39:18 -0500
X-Google-Sender-Auth: ocLTr84iaG06fVOqpaMtQDjlZx8
Message-ID: <CAPuovELn+gRzn3Eqsfr9WB3o_cDRO7VhDAbSPDJSMmSfW1=_kQ@mail.gmail.com>
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH]python-jsonschema: rename to 2.6.0
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
X-List-Received-Date: Wed, 15 Nov 2017 14:39:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 15, 2017 at 11:07 AM, zhengrq <zhengrq.fnst@cn.fujitsu.com> wrote:
> Rename python-jsonschema from 2.5.1 to 2.6.0 as it has been upgraded but not renamed.

There is a problem here but there is no version skew as far as I can tell.

From the Pypi site:
https://pypi.python.org/pypi/jsonschema/2.6.0

Scrolling down to the downloads we can click on the md5sum link for the tarball:
https://pypi.python.org/pypi?:action=show_md5&digest=50c6b69a373a8b55ff1e0ec6e78f13f4

So the md5sum for 2.6.0 == 50c6b69a373a8b55ff1e0ec6e78f13f4

The md5sum in the recipe is:
SRC_URI[md5sum] = "e491298485bdefeecb0f1ca3d65e5292"

So clearly not 2.6.0.

Back to Pypi but for version 2.5.1:
https://pypi.python.org/pypi/jsonschema/2.5.1

And again examine the md5sums for the downloads.
The md5sum for the zip file matches the md5sum in the recipe
e491298485bdefeecb0f1ca3d65e5292

So we can either change the md5 and sha256 to match the zip file or
set PYPI_PACKAGE_EXT to "zip".

What I am less clear about is how my testing of the this recipe's move
to use the pypi class would have missed this.

Either way, Bruce, don't merge this patch. I will send you an update.

Thanks Zheng for finding this.

MarkA

>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-jsonschema_2.5.1.bb => python-jsonschema_2.6.0.bb}     | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-jsonschema_2.5.1.bb => python-jsonschema_2.6.0.bb} (100%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb b/meta-openstack/recipes-devtools/python/python-jsonschema_2.6.0.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb
> rename to meta-openstack/recipes-devtools/python/python-jsonschema_2.6.0.bb
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

