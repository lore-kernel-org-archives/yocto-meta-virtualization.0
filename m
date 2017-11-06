Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E7DE3E00D20; Mon,  6 Nov 2017 12:18:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.193 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.193 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3FEC9E00BB7
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 Nov 2017 12:17:59 -0800 (PST)
Received: by mail-yw0-f193.google.com with SMTP id t71so8956303ywc.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 06 Nov 2017 12:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=XcNy8NJG9Vo89OB1+wvkvCZXg1ydFX8Dz86+dpLT5ok=;
	b=INSb/6nxHOu+LgJwaSdNYdHcw592VsuMf8fAbExOjfMYVKSZ3CkKeObqU3O/+XapMr
	CpAO85Ro09/PmikD02xlaeLONB9H+7gWwvw6ChcvNOw5LGPXbV2rsHSCJkVwTTCpI8Fu
	bvdC4I/EeaWt+k7psnGZzDklH2ZY8tr39kJpt7VhsOudw4AcInuIBPZyKJWmS83fiYwG
	2og66qVlJthAND2MLPKtwfsOkCLhbfINdiwfTYHvcu116UDaiql+bLbsbKSBD7bRoFAx
	VGGWm1Mw5ydnakko55wO11VvUsixAeOFgFhX9C0AVJLsVdPdrLRzqbG60eEcKTAyv+N5
	SJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to;
	bh=XcNy8NJG9Vo89OB1+wvkvCZXg1ydFX8Dz86+dpLT5ok=;
	b=SttZnOUj0KKpNZYwqxhydoz5qpfg98rLvaNHDnc8Tyh/4kJYSm3BjvSiDDutWxNAiN
	o2mQ6ghm5n8Aputu2cmlfEBMshO6ms8gGLaK6KuwuFHfXevnjhEjQ+CFYp8YjrBV2W1d
	Q0j9j0aFwRdPoC/o7ojOsCxh2qSoRR3SxrT9Ap045lfJMIhxdRYmdw++FIR+zsomSRfo
	NK8ZYD4WrS2FZtZRvePGzn2Csb0pJPWR/lhc6E2G6YDdoGmTjESN5DkBh/A2kHQDSumO
	oyc3Ttn3kUrNMDFRRCc8lvCvdSdl4jSlAj2O10Q7GCaVeZBpWkAZOhBcTWKc6r6NH1oH
	nRuw==
X-Gm-Message-State: AMCzsaWxFLsJSPbRD7Kp/KjCYuTIlphIR+9gqdAHnvcz9cIIKlEr1srs
	0GCZRd9ictcjp6NfWMq9zm581x2L4S2A+XuTYI5NLw==
X-Google-Smtp-Source: ABhQp+T62k8L2/EveZTnrI/EqlO1M8epzmDzJ29wcO2lQs/QAW9h4/653tuq+q8j0GFXNtlJuMXiYhAE4sti/b4Vc+k=
X-Received: by 10.129.40.14 with SMTP id o14mr10141737ywo.276.1509999479024;
	Mon, 06 Nov 2017 12:17:59 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.131.144 with HTTP; Mon, 6 Nov 2017 12:17:58 -0800 (PST)
In-Reply-To: <1509999339-3608-1-git-send-email-mark.asselstine@windriver.com>
References: <1509999339-3608-1-git-send-email-mark.asselstine@windriver.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 6 Nov 2017 15:17:58 -0500
X-Google-Sender-Auth: zsYWKP7-MCInwb2j2RcBZVtMQwA
Message-ID: <CAPuovEKQMg1h2w4OGCMeLXKafW9hwSMfwhjEbOA2CufJ2JmeiQ@mail.gmail.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, 
	Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: Re: [PATCH] python-webob: uprev to v1.7.3
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
X-List-Received-Date: Mon, 06 Nov 2017 20:18:01 -0000
Content-Type: text/plain; charset="UTF-8"

Sorry, will resend with -M. I should update the README with -M too as
this is cut and paste laziness.

Mark

On Mon, Nov 6, 2017 at 3:15 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> The only user in meta-virtualization is python-bugsnag and there is no
> version dependency. This new version is however required by the latest
> openstack. Switched to using the "common" pypi.bbclass while we are at
> it.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-devtools/python/python-webob_1.6.0.bb | 23 -----------------------
>  recipes-devtools/python/python-webob_1.7.3.bb | 18 ++++++++++++++++++
>  2 files changed, 18 insertions(+), 23 deletions(-)
>  delete mode 100644 recipes-devtools/python/python-webob_1.6.0.bb
>  create mode 100644 recipes-devtools/python/python-webob_1.7.3.bb
>
> diff --git a/recipes-devtools/python/python-webob_1.6.0.bb b/recipes-devtools/python/python-webob_1.6.0.bb
> deleted file mode 100644
> index 71c74ff..0000000
> --- a/recipes-devtools/python/python-webob_1.6.0.bb
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -DESCRIPTION = "WSGI request and response object"
> -HOMEPAGE = "http://webob.org/"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://docs/license.txt;md5=8ed3584bcc78c16da363747ccabc5af5"
> -
> -PR = "r0"
> -SRCNAME = "WebOb"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/W/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "089d7fc6745f175737800237c7287802"
> -SRC_URI[sha256sum] = "63d262d8f61b516321f786879c9277fa2209f7f57eb47b537eeecfea383d55b7"
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> -
> -RDEPENDS_${PN} += " \
> -       python-sphinx \
> -       python-nose \
> -       "
> -
> diff --git a/recipes-devtools/python/python-webob_1.7.3.bb b/recipes-devtools/python/python-webob_1.7.3.bb
> new file mode 100644
> index 0000000..a2448be
> --- /dev/null
> +++ b/recipes-devtools/python/python-webob_1.7.3.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "WSGI request and response object"
> +HOMEPAGE = "http://webob.org/"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://docs/license.txt;md5=8ed3584bcc78c16da363747ccabc5af5"
> +
> +PYPI_PACKAGE = "WebOb"
> +
> +SRC_URI[md5sum] = "350028baffc508e3d23c078118e35316"
> +SRC_URI[sha256sum] = "e65ca14b9f5ae5b031988ffc93f8b7f305ddfcf17a4c774ae0db47bcb3b87283"
> +
> +inherit setuptools pypi
> +
> +RDEPENDS_${PN} += " \
> +       python-sphinx \
> +       python-nose \
> +       "
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

